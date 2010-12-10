# Include hook code here
require File.expand_path(File.dirname(__FILE__) + "/../lib/tumbleweed")
require File.expand_path(File.dirname(__FILE__) + "/../app/helpers/tumbleweed_helper")
ActionController::Base.helper(TumbleweedHelper)