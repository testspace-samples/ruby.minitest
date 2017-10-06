#!/bin/bash
set -x

printenv

bundle exec rubocop --format emacs --out tmp/rubocop.txt || true
bundle exec brakeman -o tmp/brakeman.json
bundle exec brakeman_translate_checkstyle_format translate --file="tmp/brakeman.json" > tmp/brakeman_checkstyle.xml
bundle exec scss-lint --no-color --format=Stats --format=Default --out=tmp/scss-lint.txt  app/assets/stylesheets/ || true
bundle exec rake minitest test
CI_REPORTS=$PWD/test/reports testspace @.testspace.txt