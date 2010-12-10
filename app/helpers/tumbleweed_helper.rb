include ActionController::UrlWriter

module TumbleweedHelper
  def trail(trail, object=nil)
    @trail  = trail
    @object = object
  end
  
  def crumb_trail
    crumb = Tumbleweed.instance.crumbs[@trail || :root]
    trail = [Tumbleweed.instance.link_last? ? crumb_link(crumb) : crumb_text(crumb)]
    
    while parent = crumb.parent
      crumb = crumb.parent
      break if crumb.name == :root
      trail << crumb_link(crumb)
    end
    
    trail << crumb_link(Tumbleweed.instance.crumbs[:root]) if Tumbleweed.instance.show_root?
    
    "<div class=\"breadcrumb_trail\">" + trail.reverse.join(crumb_delimiter) + "</div>"
  end
  
  private
  
  def crumb_link(crumb)
    link_to crumb_text(crumb), crumb_url(crumb), :class => 'breadcrumb'
  end
  
  def crumb_text(crumb)
    crumb.text.is_a?(Proc) ? crumb.text.call(@object) : crumb.text
  end
  
  def crumb_url(crumb)
    if crumb.url.is_a?(Proc)
      default_url_options[:host] = request.host_with_port
      crumb.url.call(@object)
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
