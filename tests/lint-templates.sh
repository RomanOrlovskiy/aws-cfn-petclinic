#!/bin/bash
ERROR_COUNT=0;

echo "Linting the templates..."

for TEMPLATE in $(find . -name '*.yaml'); do

    ERRORS=$(cfn-lint $TEMPLATE);
    if [ "$?" -gt "0" ]; then
        ((ERROR_COUNT++));
        echo "[fail] $TEMPLATE: $ERRORS";
    else
        echo "[pass] $TEMPLATE";
    fi;

done;

echo "$ERROR_COUNT template linting error(s)";
if [ "$ERROR_COUNT" -gt 0 ];
    then exit 1;
fi
