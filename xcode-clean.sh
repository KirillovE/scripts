#! /bin/bash

# Kill Xcode, clean derived data and relaunch the package resulution process

# Kill Xcode process
echo "Killing Xcode process..."
pkill Xcode

# Define paths
DERIVED_DATA_PATH=~/Library/Developer/Xcode/DerivedData

# Clean derived data
echo "Cleaning derived data..."
rm -rf $DERIVED_DATA_PATH

# Relaunch package resolution process
echo "Relaunching package resolution process..."
xcodebuild -resolvePackageDependencies >/dev/null

echo "Done."
