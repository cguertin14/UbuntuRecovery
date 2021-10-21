#!/bin/sh

echo "Applying plugged-in settings to CPU..."

sudo -i

cpufreqctl-charles min 35
cpufreqctl-charles max 100
cpufreqctl-charles turbo 1