#!/usr/bin/env bash

# Clear dist dir first
directory="dist"
filename="*"
echo "Clearing dist..."
if find "$directory" -name "$filename" -type f; then
    cd dist
    rm -r *
    cd ..
fi

python3 -m build

library_name="akr_extensions_sdk"
if pip show "$library_name" &> /dev/null; then
    echo "Uninstalling..."
    pip uninstall "$library_name" <<< "y"
fi

whl_filename="*.whl"
if find "$directory" -name "$whl_filename"; then
    echo "Installing..."
    cd dist
    pip install *.whl

    cd ..
else
    echo "No *.whl file found"
fi

# Test if app runs well
cd test
python3 main.py
echo "Everything looks good"
cd ..

# uninstall the extension
pip uninstall "$library_name" <<< "y"
echo "Uninstalled $library_name"