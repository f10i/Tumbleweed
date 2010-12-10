# Uninstall hook code here
require 'fileutils'

FileUtils.rm File.join(Rails.root, "config", "initializers", "tumbleweed.rb")
