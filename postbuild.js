import fs from 'fs';
import path from 'path';

const distPath = path.resolve('./dist/index.html');
if (fs.existsSync(distPath)) {
  let content = fs.readFileSync(distPath, 'utf-8');
  // Strip module type so it runs under file:// and in non-module environments without CORS
  content = content.replace('<script type="module" crossorigin>', '<script>');
  fs.writeFileSync(distPath, content, 'utf-8');

  // Copy to Desktop as index.html
  try {
    const desktopPath = 'C:\\Users\\cheer\\Desktop\\index.html';
    fs.writeFileSync(desktopPath, content, 'utf-8');
    console.log('Copied standalone game to Desktop/index.html');
  } catch (err) {
    console.error('Desktop copy failed:', err);
  }
}
