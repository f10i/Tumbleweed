include ActionController::UrlWriter

module Tumbleweed
  module TumbleweedHelper
    def trail(trail, object=nil)
      @trail  = trail
      @object = object
    end
    
    def crumb_trail
      crumb = Tumbleweed.instance.get_crumb(@trail, @object)
      trail = [Tumbleweed.instance.link_last? ? crumb_link(crumb) : crumb_text(crumb)]
      
      while parent = crumb.parent
        crumb = Tumbleweed.instance.get_crumb(crumb.parent, crumb.parent_object)
        break if crumb.name == :root
        trail << crumb_link(crumb)
      end
      
      trail << crumb_link(Tumbleweed.instance.get_crumb(:root)) if Tumbleweed.instance.show_root?
      
      "<div class=\"breadcrumb_trail\">" + trail.reverse.join(crumb_delimiter) + "</div>"
    end
    
    private
    
    def crumb_link(crumb)
      link_to crumb_text(crumb), crumb_url(crumb), :class => 'breadcrumb'
    end
    
    def crumb_text(crumb)
      crumb.text.is_a?(Proc) ? crumb.text.call(crumb.object) : crumb.text
    end
    
    def crumb_url(crumb)
      if crumb.url.is_a?(Proc)
        default_url_options[:host] = request.host_with_port
        crumb.url.call(crumb.object)
      elsif crumb.url.is_a?(Symbol)
        send(crumb.url)
      else
        crumb.url
      end
    end
    
    def crumb_delimiter
      " <span class=\"breadcrumb_delimiter\">#{Tumbleweed.instance.delimiter}</span> "
    end
    
  end
end
