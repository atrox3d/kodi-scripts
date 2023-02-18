#!/bin/bash

HERE="$(dirname ${BASH_SOURCE[0]})"
echo "$HERE"


"$HERE"/executemethod.sh VideoLibrary.Clean

echo -e "\nsleep 5\n";sleep 5

"$HERE"/executemethod.sh VideoLibrary.Scan

echo
echo
read -p "Press any key to continue . . ."

