# Gpis

The gem is not intended as a full library, just sharing my experience with the community..
If you need scraping more app details, please feel free to fork and use this piece of code as a template.


## Installation

Add this line to your application's Gemfile:

    gem 'gpis'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gpis

## Usage


    begin
        app_info = GpisScraper.scrape_info("com.rovio.angrybirds", ['en', 'fr', 'de'])
    rescue GpisError => e
        puts "Gpis Tester : An Error Occured :  \n #{e.to_s}"
    end

    puts "Info:  #{app_info}" unless app_info.nil?

###returns
    {Gpis App Info: name = '{"en"=>"Angry Birds", "fr"=>"Angry Birds", "de"=>"Angry Birds"}', category='{"en"=>"Arcade &amp; Action", "fr"=>"Jeux d'arcade et d'action", "de"=>"Arcade &amp; Action"}', icon_url='https://lh3.ggpht.com/pq8OCpcD1AP5QhN7kZT_5zeTTmGCdG9zFDXVXPuybVDsbhhaq7uxbTDZduSMxqusn14=w124', permissions = '{"en"=>{"Your location"=>{:name=>"Your location", :permissions=>[{:name=>"approximate location (network-based)", :description=>"Allows the app to get your approximate location. This location is derived by location services using network location sources such as cell towers and Wi-Fi. These location services must be turned on and available to your device for the app to use them. Apps may use this to determine approximately where you are.", :dangerous=>true}]}, "Network communication"=>{:name=>"Network communication", :permissions=>[{:name=>"full network access", :description=>"Allows the app to create network sockets and use custom network protocols. The browser and other applications provide means to send data to the internet, so this permission is not required to send data to the internet.", :dangerous=>true}, {:name=>"view Wi-Fi connections", :description=>"Allows the app to view information about Wi-Fi networking, such as whether Wi-Fi is enabled and name of connected Wi-Fi devices.", :dangerous=>false}, {:name=>"view network connections", :description=>"Allows the app to view information about network connections such as which networks exist and are connected.", :dangerous=>false}]}, "Phone calls"=>{:name=>"Phone calls", :permissions=>[{:name=>"read phone status and identity", :description=>"Allows the app to access the phone features of the device. This permission allows the app to determine the phone number and device IDs, whether a call is active, and the remote number connected by a call.", :dangerous=>true}]}, "Storage"=>{:name=>"Storage", :permissions=>[{:name=>"modify or delete the contents of your USB storage modify or delete the contents of your SD card", :description=>"Allows the app to write to the USB storage. Allows the app to write to the SD card.", :dangerous=>true}]}, "Default"=>{:name=>"Default", :permissions=>[{:name=>"test access to protected storage test access to protected storage", :description=>"Allows the app to test a permission for USB storage that will be available on future devices. Allows the app to test a permission for the SD card that will be available on future devices.", :dangerous=>false}]}}, "fr"=>{"Votre position"=>{:name=>"Votre position", :permissions=>[{:name=>"position approximative (réseau)", :description=>"Permet à l'application d'obtenir votre position approximative. Celle-ci est fournie par des services de localisation sur la base des sources de localisation de réseau tels que les points d'accès Wi-Fi et les antennes-relais. Ces services de localisation doivent être activés et disponibles sur votre appareil pour que l'application puisse déterminer où vous vous trouvez de façon approximative, le cas échéant.", :dangerous=>true}]}, "Communications réseau"=>{:name=>"Communications réseau", :permissions=>[{:name=>"bénéficier d'un accès complet au réseau", :description=>"Permet à l'application de créer des sockets réseau et d'utiliser des protocoles réseau personnalisés. Le navigateur et d'autres applications permettent d'envoyer des données sur Internet. Cette autorisation n'est donc pas nécessaire pour envoyer des données sur Internet.", :dangerous=>true}, {:name=>"afficher les connexions Wi-Fi", :description=>"Permet à l'application d'accéder à des informations sur les réseaux Wi-Fi afin de savoir si une connexion Wi-Fi est activée et pour connaître le nom des appareils connectés au Wi-Fi, par exemple.", :dangerous=>false}, {:name=>"afficher les connexions réseau", :description=>"Permet à l'application d'accéder à des informations sur les connexions réseau, comme les réseaux existants et connectés.", :dangerous=>false}]}, "Appels téléphoniques"=>{:name=>"Appels téléphoniques", :permissions=>[{:name=>"voir l'état et l'identité du téléphone", :description=>"Permet à l'application d'accéder aux fonctionnalités téléphoniques de l'appareil. Cette autorisation permet à l'application de déterminer le numéro de téléphone et les identifiants de l'appareil, si un appel est actif et le numéro distant connecté par un appel.", :dangerous=>true}]}, "Stockage"=>{:name=>"Stockage", :permissions=>[{:name=>"modifier ou supprimer le contenu de la mémoire de stockage USB modifier ou supprimer le contenu de la carte SD", :description=>"Permet à l'application de modifier le contenu de la mémoire de stockage USB. Permet à l'application de modifier le contenu de la carte SD.", :dangerous=>true}]}, "Par défaut"=>{:name=>"Par défaut", :permissions=>[{:name=>"tester l'accès au stockage protégé tester l'accès au stockage protégé", :description=>"Permet à l'application de tester une autorisation relative à la mémoire de stockage USB qui sera disponible sur les futurs appareils. Permet à l'application de tester une autorisation relative à la carte SD qui sera disponible sur les futurs appareils.", :dangerous=>false}]}}, "de"=>{"Standort"=>{:name=>"Standort", :permissions=>[{:name=>"Ungefährer Standort (netzwerkbasiert)", :description=>"Ermöglicht der App, Ihren ungefähren Standort zu ermitteln. Diese Standortangabe stammt von Standortdiensten, die Netzwerkstandortquellen wie etwa Sendemasten oder WLAN verwenden. Diese Standortdienste müssen auf Ihrem Gerät verfügbar und aktiviert sein, damit die App sie verwenden kann. Apps können Ihren ungefähren Standort anhand dieser Daten ermitteln.", :dangerous=>true}]}, "Netzkommunikation"=>{:name=>"Netzkommunikation", :permissions=>[{:name=>"Voller Netzwerkzugriff", :description=>"Ermöglicht der App die Erstellung von Netzwerk-Sockets und die Verwendung benutzerdefinierter Netzwerkprotokolle. Der Browser und andere Apps bieten die Möglichkeit, Daten über das Internet zu versenden. Daher ist diese Berechtigung nicht erforderlich, um Daten über das Internet versenden zu können.", :dangerous=>true}, {:name=>"WLAN-Verbindungen anzeigen", :description=>"Ermöglicht der App, Informationen zu WLANs abzurufen, etwa ob ein WLAN aktiviert ist, und den Namen verbundener WLAN-Geräte", :dangerous=>false}, {:name=>"Netzwerkverbindungen anzeigen", :description=>"Ermöglicht der App, Informationen zu Netzwerkverbindungen abzurufen, etwa welche Netzwerke existieren und verbunden sind", :dangerous=>false}]}, "Telefonanrufe"=>{:name=>"Telefonanrufe", :permissions=>[{:name=>"Telefonstatus und Identität abrufen", :description=>"Ermöglicht der App, auf die Telefonfunktionen des Geräts zuzugreifen. Die Berechtigung erlaubt der App, die Telefonnummer und Geräte-IDs zu erfassen, festzustellen, ob gerade ein Gespräch geführt wird, und die Rufnummer verbundener Anrufer zu lesen.", :dangerous=>true}]}, "Speicher"=>{:name=>"Speicher", :permissions=>[{:name=>"Inhalt Ihres USB Speichers ändern oder löschen Inhalt Ihrer SD-Karte ändern oder löschen", :description=>"Ermöglicht der App das Schreiben in den USB-Speicher und auf die SD-Karte", :dangerous=>true}]}, "Standard"=>{:name=>"Standard", :permissions=>[{:name=>"Zugriff auf geschützten Speicher testen", :description=>"Ermöglicht der App das Testen einer Berechtigung für USB-Speicher, der auf zukünftigen Geräten vorhanden sein wird. Ermöglicht der App das Testen einer Berechtigung für die SD-Karte, die auf zukünftigen Geräten vorhanden sein wird", :dangerous=>false}]}}}'}


Petr Smejkal


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
