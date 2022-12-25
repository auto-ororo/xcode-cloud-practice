#!/bin/sh

echo $DEV_SECRETS > ../XcodeCloudPracticeDev/XcodeCloudPracticeDev/Secrets.swift
echo $DEV_GOOGLE_SERVICE_INFO_PLIST | base64 --decode > ../XcodeCloudPracticeDev/GoogleService-Info.plist
