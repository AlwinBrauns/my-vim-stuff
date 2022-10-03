#!/bin/bash

if [ -z "$(ps -e | grep brave)" ]; then
	printf "false" 
else
	printf "true" 
fi
