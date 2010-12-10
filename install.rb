# Install hook code here
require 'fileutils'

FileUtils.cp File.join(File.dirname(__FILE__), "initializers", "tumbleweed.rb"), File.join(Rails.root, "config", "initializers")
