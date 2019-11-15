#!/bin/bash

echo "Enter the Hexa number of your choice"
read Hex

echo -n "The decimal value of the $Hex is: "
echo "obase=10; ibase=16; $Hex" | bc
