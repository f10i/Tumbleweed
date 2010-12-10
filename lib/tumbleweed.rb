# Gretel
require 'singleton'

class Tumbleweed
  include Singleton
  attr_accessor :crumbs
  Crumb = Struct.new(:name, :text, :url, :parent)
  
  def initialize
    @crumbs = {}
    @delimiter = '&gt;'
    @show_root = true
    @link_last = false
  end
  
  def self.configure(&block)
    instance.instance_eval &block
  end
  
  def crumb(name, text, url, parent=nil)
    name = name.to_sym
    text = text
    url  = url
    parent = @crumbs[parent.to_sym] unless parent.nil? or name == :root
    
    @crumbs[name.to_sym] = Crumb.new name, text, url, parent
  end
  
  def show_root?
    @show_root
  end
  
  def show_root
    @show_root = true
  end
  
  def dont_show_root
    @show_root = false
  end
  
  def delimiter(delimiter=nil)
    @delimiter = delimiter.nil? ? @delimiter : delimiter
  end
  
  def link_last?
    @link_last
  end
  
  def link_last
    @link_last = true
  end
  
  def dont_link_last
    @link_last = false
  end
  
end
