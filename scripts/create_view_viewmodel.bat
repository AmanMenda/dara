@echo off

setlocal enabledelayedexpansion

set "required_folders=.\lib\views\templates .\lib\views .\lib\viewmodels"
set "required_files=.\lib\views\templates\template_view.dart .\lib\views\templates\template_viewmodel.dart"

if "%~1"=="" (
  echo Error: Please provide the view name as an argument.
  exit /b 1
)

for %%F in (%required_folders%) do (
  if not exist "%%F" (
    echo Error: '%%F' not found. Make sure you run the script at the root of the project.
  )
)

for %%F in (%required_files%) do (
  if not exist "%%F" (
    echo Error: File '%%F' not found. Needed for the view generation.
  )
)

set "targetFolder=%~1"
set "viewFile=%~1_view.dart"
set "viewModelFile=%~1_viewmodel.dart"

mkdir ".\lib\views\%targetFolder%"
copy ".\lib\views\templates\template_view.dart" ".\lib\views\%targetFolder%\%viewFile%"
copy ".\lib\views\templates\template_viewmodel.dart" ".\lib\viewmodels\%viewModelFile%"

endlocal