#!/bin/bash

# Use this script to generate resources files for application
# Swiftgen is installed via CocoaPods. You should not install it manually.

PODS_ROOT=Pods
INPUT_DIR="ArchitectureTest"/Resources
OUTPUT_DIR="ArchitectureTest"/Resources/SwiftGen

${PODS_ROOT}/SwiftGen/bin/swiftgen xcassets -t swift4 --output "${OUTPUT_DIR}"/ImagesGen.swift  "${INPUT_DIR}"/*.xcassets
${PODS_ROOT}/SwiftGen/bin/swiftgen strings -t flat-swift4 --output "${OUTPUT_DIR}"/StringsGen.swift  "${INPUT_DIR}"/en.lproj/Localizable.strings
