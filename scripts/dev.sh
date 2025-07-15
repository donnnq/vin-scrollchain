#!/bin/bash
echo "🌀 Watching scrolls for changes..."
watchexec --shell=none -e sol -w contracts -w test -- bash -c 'forge build && forge test'
