#!/bin/bash

cd $GITHUB_ACTION_PATH

composer install

export PATH=$PATH:$GITHUB_ACTION_PATH/vendor/bin

if [ ! -z "$REPORT_TYPE" -a  "$REPORT_TYPE"!=" " ]; then
./vendor/bin/phpcs -v $PATHS --standard=PHPCompatibility --runtime-set testVersion $TEST_VERSIONS --report=$REPORT_TYPE
else
./vendor/bin/phpcs -v $PATHS --standard=PHPCompatibility --runtime-set testVersion $TEST_VERSIONS
fi

