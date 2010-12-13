# Tumbleweed
require 'singleton'

module Tumbleweed
  class Tumbleweed
    include Singleton
    Crumb = Struct.new :name, :text, :url, :object, :parent, :parent_object
    attr_accessor :crumbs
    
    def initialize
      @crumbs = {}
      @delimiter = '&gt;'
      @show_root = true
      @link_last = false
    end
    
    def self.configure(&block)
      instance.instance_eval &block
    end
    
    def crumb(name, &block)
      @crumbs[name.to_sym] = block
    end
    
    def get_crumb(name, object=nil)
      @text = nil
      @url  = nil
      @parent = nil
      @parent_object = nil
      
      @crumbs[name].call(object)
      Crumb.new name, @text, @url, object, @parent, @parent_object
    end
    
    def link text, url
      @text = text
      @url  = url
    end
    
    def parent name, object=nil
      @parent = name
      @parent_object = object
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
end
