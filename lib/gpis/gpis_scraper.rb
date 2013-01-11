class GpisScraper


  GOOGLE_PLAY_URL = "https://play.google.com/store/apps/details"

  def self.scrape_info(package_name, languages)
    documents = Hash.new
    languages.each do |language|
      initial_url         = "#{GOOGLE_PLAY_URL}?id=#{package_name}&hl=#{language}"
      stream              = get_data_and_follow_redirections(initial_url)
      documents[language] = Nokogiri::HTML(stream)
    end
    GpisAppInfo.new(package_name, documents)
  end

  def self.get_data_and_follow_redirections(initial_url)
    url = initial_url
    begin
      stream = open(url, 'User-Agent' => 'ruby', :redirect => false)
    rescue OpenURI::HTTPRedirect
      url = $!.uri
      retry
    rescue OpenURI::HTTPError => e
      status_code = e.io.status[0] rescue 404
      if status_code == 503
        raise GpisServiceNotAvailable.new("Gpis: Service Not Available : #{e.message} :#{e.backtrace.join("\n")}")
      else
        raise GpisPageNotFoundError.new("Gpis: Page Not Found Error : #{e.message} :#{e.backtrace.join("\n")}")
      end
    end
    # ensure encoding
    Iconv.conv('UTF-8', stream.charset, stream.read)
  end
end
