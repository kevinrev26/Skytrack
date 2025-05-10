#!/usr/bin/env bash

# Start the emulator in the background. 
echo "Starting android emulator"
$HOME/Android/Sdk/emulator/emulator -avd Pixel_3a_API_35_extension_level_13_x86_64 >& /dev/null &

# Wait for the emulator to start
#Wait to start
$HOME/Android/Sdk/platform-tools/adb wait-for-device shell 'while [[ -z $(getprop sys.boot_completed) ]]; do sleep 1; done;'

# Build the game.
#bob --archive --platform=armv7-android build bundle --variant debug --bundle-format apk

# Uninstall the previous installation of the game.
$HOME/Android/Sdk/platform-tools/adb uninstall com.roquestudios.skytrack >& /dev/null

# Install the game in the emulator.
$HOME/Android/Sdk/platform-tools/adb install "bin/universal-android/Skytrack/Skytrack.apk"

# Run the game.
adb shell am start -a android.intent.action.MAIN -n com.roquestudios.skytrack/com.dynamo.android.DefoldActivity

# Get the PID of the app
while true
do
    APP_PID=`adb shell ps | grep com.roquestudios.skytrack | tr -s [:space:] ' ' | cut -d' ' -f2`
    if [ -z $APP_PID ]
    then
        sleep 0.5
    else
        break
    fi
done

# Tail the logs of the app.
adb logcat --pid $APP_PID