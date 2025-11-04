@echo off
REM ====================================================
REM  Quarto Website Auto Deploy Script for Windows
REM  Project: DIY Fieldwork
REM  Author: hydro-unibern
REM ====================================================

echo.
echo === DIY Fieldwork: Quarto Auto Deploy ===
echo.

REM --- Navigate to project folder ---
cd /d E:\TeachingUniBern\Github\DIY-fieldwork

REM --- Check Quarto installation ---
echo Checking Quarto installation...
quarto --version || (
    echo ERROR: Quarto not found in PATH.
    echo Please install Quarto from https://quarto.org/docs/get-started/
    pause
    exit /b
)
echo Quarto OK.
echo.

REM --- Stage all files for Git ---
echo Staging changes...
git add -A

REM --- Commit changes ---
echo Committing changes...
git commit -m "Auto-deploy update" || echo No changes to commit.

REM --- Ensure we're on main branch ---
git branch -M main

REM --- Push source files to GitHub ---
echo Pushing to main branch...
git push -u origin main

REM --- Render Quarto site ---
echo Rendering site with Quarto...
quarto render

REM --- Publish to GitHub Pages ---
echo Publishing to gh-pages...
quarto publish gh-pages --no-browser

echo.
echo ✅ Deployment complete!
echo Your site should be live at:
echo https://hydro-unibern.github.io/DIY-fieldwork
echo.
pause
