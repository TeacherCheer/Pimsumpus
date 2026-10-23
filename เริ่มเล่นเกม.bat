@echo off
chcp 65001 >nul
title SpellType Survivor Launcher

echo ========================================================
echo   🧙‍♂️ กำลังเปิดเกม SpellType Survivor (จอมเวทแป้นพิมพ์)...
echo ========================================================

cd /d "%~dp0"

:: ตรวจสอบว่าเซิร์ฟเวอร์เปิดอยู่แล้วหรือไม่
netstat -ano | findstr :5173 >nul
if %errorlevel% neq 0 (
    echo กำลังเริ่มรันเซิร์ฟเวอร์เกม...
    start /min "SpellType Server" cmd /c "npm.cmd run dev -- --host 0.0.0.0 --port 5173"
    timeout /t 2 /nobreak >nul
)

echo กำลังเปิดเบราว์เซอร์เข้าสู่เกม...
start http://localhost:5173/

exit
