class Spurgeon

  def initialize( type )
    @type = type
  end

  def fetch( type = nil )
    type ||= @type
    case type
      when :morning
        morning
      when :evening
        evening
      when :checkbook
        checkbook
      else
        :morning
    end
  end

  def morning
    url = 'http://www.spurgeon.org/morn_eve/this_morning.cgi'
    response = RestClient.get url
    html = response.to_str

    html.gsub!( /\<HEAD\>(.+?)\<p\>/mi, '' )
    html.gsub!( /\<a(.+?)\<\/HTML\>/mi, '' )
    html.strip!
  end

  def evening
    url = 'http://www.spurgeon.org/morn_eve/this_evening.cgi'
    response = RestClient.get url
    html = response.to_str

    html.gsub!( /\<HEAD\>(.+?)\<p\>/mi, '' )
    html.gsub!( /\<a(.+?)\<\/HTML\>/mi, '' )
    html.strip!
  end

  def checkbook
    url = 'http://www.spurgeon.org/fcb/fcb.cgi'
    response = RestClient.get url
    html = response.to_str

    html.gsub!( /\<HEAD\>(.+?)\<\/A\>/mi, '' )
    html.gsub!( /\<A(.+?)\<\/HTML\>/mi, '' )
    html.strip!
  end

end
