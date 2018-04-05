#!/bin/bash
echo "ssl scanner"
echo "version 1.0.0"
echo "written by: Patrick Johns"
for IP in $(cat test_targets.txt); do
ping -c1 127.0.0.1
done
