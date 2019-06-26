#!/bin/bash
read -p "Input website: " website
echo "Searching..."
sleep 1
curl $website