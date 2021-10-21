#!/bin/sh

echo "Applying battery settings to CPU..."

sudo -i

cpufreqctl-charles min 25
cpufreqctl-charles max 75
cpufreqctl-charles turbo 0