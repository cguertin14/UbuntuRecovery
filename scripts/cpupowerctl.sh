#!/bin/bash

BATTERY_STATUS=$(acpi -a | awk '{ print  $3 }')
BATTERY_PROFILE="battery"

# Battery settings
MIN_CPU_FREQ=25
MAX_CPU_FREQ=75
TURBO_CPU=0

# Beginning message.
echo "Detecting your battery status..."

# Change to plugged-in settings
# if laptop is plugged in.
if [[ $BATTERY_STATUS == "on-line" ]]; then
	BATTERY_PROFILE="plugged-in"
	MIN_CPU_FREQ=35
	MAX_CPU_FREQ=100
	TURBO_CPU=1
fi

# Set CPU settings here
sudo cpufreqctl min $MIN_CPU_FREQ
sudo cpufreqctl max $MAX_CPU_FREQ
sudo cpufreqctl turbo $TURBO_CPU

# Ending message.
printf "CPU Frequency settings for the %s profile successfully applied.\n" $BATTERY_PROFILE