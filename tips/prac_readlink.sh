#!/bin/bash
echo $0
readlink -f $0
dirname `readlink -f $0`