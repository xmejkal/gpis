# Gpis

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'gpis'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gpis

## Usage

begin
  appInfo = GpisScraper.scrape_info("com.alensw.PicFolder", ['en', 'fr', 'de'])
rescue GpisError => e
  puts "Gpis Tester : An Error Occured :  \n #{e.to_s}"
end
  puts "Info:  #{appInfo}" unless appInfo.nil?


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
