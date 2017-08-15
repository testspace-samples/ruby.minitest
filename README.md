[![Testspace](https://www.testspace.com/img/Testspace.png)](https://www.testspace.com)

***

## Ruby/Minitest sample for demonstrating Testspace

This is the sample application for the [*Ruby on Rails Tutorial: Learn Web Development with Rails*](http://www.railstutorial.org/) by [Michael Hartl](http://www.michaelhartl.com/). It is being used to demonstrate publishing test content to Testspace.
We have made a few minor modifications to original project for publishing.

  * Using a Testspace Project that is `connected` with this GitHub Repo
  * Using 3 Online CI services for demonstration purposes only
  * Can review the Results at [testspace-samples:ruby.minitest](https://samples.testspace.com/projects/testspace-samples:ruby.minitest)  
  * Refer to our [Getting Started](https://help.testspace.com/getting-started) help articles for more information

***
Using Multiple Online CI Services:

[![Build Status](https://travis-ci.org/testspace-samples/ruby.minitest.svg?branch=master)](https://travis-ci.org/testspace-samples/ruby.minitest)
[![CircleCI](https://circleci.com/gh/testspace-samples/ruby.minitest/tree/master.svg?style=svg)](https://circleci.com/gh/testspace-samples/ruby.minitest/tree/master)
[![Run Status](https://api.shippable.com/projects/5703dabb2a8192902e1b99ce/badge?branch=master)](https://app.shippable.com/projects/5703dabb2a8192902e1b99ce)


***
**Test Content** published to www.testspace.com.

[![Space Health](https://samples.testspace.com/spaces/676/badge?token=684631c7573f9c1b24ae5b5b3ff3279ffb5130e6)](https://samples.testspace.com/spaces/676 "Test Cases")
[![Space Metric](https://samples.testspace.com/spaces/676/metrics/604/badge?token=747a8f49a00ccb7f52774fefe880135fad079fd3)](https://samples.testspace.com/spaces/676/schema/Code%20Coverage "Code Coverage (lines)")
[![Space Metric](https://samples.testspace.com/spaces/676/metrics/605/badge?token=df4662fc7ddf431c04dc95a79716fae91346d3dc)](https://samples.testspace.com/spaces/676/schema/Static%20Analysis "Static Analysis (issues)")

***

Download and configure the Testspace client 

<pre>
mkdir -p $HOME/bin
curl -s https://testspace-client.s3.amazonaws.com/testspace-linux.tgz | tar -zxvf- -C $HOME/bin
testspace config url samples.testspace.com
</pre>


Running Static Analysis:

<pre>
bundle install
bundle exec rubocop --format emacs --out tmp/rubocop.txt || true
bundle exec brakeman -o tmp/brakeman.json
bundle exec brakeman_translate_checkstyle_format translate --file="tmp/brakeman.json" > tmp/brakeman_checkstyle.xml
bundle exec scss-lint --no-color --format=Stats --format=Default --out=tmp/scss-lint.txt  app/assets/stylesheets/ || true
</pre>

Running Tests with Code Coverage:

<pre>
bundle exec rake minitest test
</pre>

Push Content using Testspace client. Note that ".testspace.txt" contains list of items to push.

<pre>
testspace @.testspace.txt
</pre>
