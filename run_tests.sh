#!/bin/bash
set -x
mkdir -p $HOME/bin
curl -fsSL https://testspace-client.s3.amazonaws.com/testspace-linux-dev.tgz | tar -zxvf- -C $HOME/bin

printenv
testspace config url https://b679ddfa81614745bd810eb3d8dbdd637e05b71e:@samples.testspace.com/
bundle exec rubocop --format emacs --out tmp/rubocop.txt || true
bundle exec brakeman -o tmp/brakeman.json
bundle exec brakeman_translate_checkstyle_format translate --file="tmp/brakeman.json" > tmp/brakeman_checkstyle.xml
bundle exec scss-lint --no-color --format=Stats --format=Default --out=tmp/scss-lint.txt  app/assets/stylesheets/ || true
bundle exec rake minitest test
CI_REPORTS=$PWD/test/reports testspace @.testspace.txt