require 'simplecov'
SimpleCov.start

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "prawndown"
require "minitest/autorun"
require 'pdf/inspector'
