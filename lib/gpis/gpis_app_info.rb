class GpisAppInfo

  #single value
  attr_accessor :icon_url

  #hashes by language
  attr_accessor :name
  attr_accessor :documents
  attr_accessor :category
  attr_accessor :permissions


  def initialize(package_name, docs_by_lang_hash)
    @package_name  = package_name
    @documents     = docs_by_lang_hash
    @name          = Hash.new
    @category      = Hash.new
    @permissions   = Hash.new

    # language independent values
    first_document = @documents[@documents.keys.first]
    fill_icon_url(first_document)

    # language specific values
    @documents.each do |language, document|
      fill_name_for_lang(language, document)
      fill_category_for_lang(language, document)
      fill_permissions_for_lang(language, document)
    end
  end

  def fill_icon_url(document)
    begin
      @icon_url = document.at_css("div.doc-banner-icon > img")['src']
    rescue Exception => e
      raise GpisParseError.new("Gpis: Parsing Error : #{e.message} :#{e.backtrace.join("\n")}")
    end
    raise GpisParseError.new("Gpis: Parsing Error : icon not found") if @icon_url.nil?
  end

  def fill_name_for_lang(language, document)
    begin
      @name[language] = document.at_css("dl.doc-metadata-list span[itemprop=name]")['content']
    rescue Exception => e
      raise GpisParseError.new("Gpis: Parsing Error : #{e.message} :#{e.backtrace.join("\n")}")
    end

    raise GpisParseError.new("Gpis: Parsing Error : name not found for language '#{language}'") if @name[language].nil?
  end

  def fill_category_for_lang(language, document)
    begin
      @category[language] = document.css(".doc-metadata a[href^='/store/apps/category/']").inner_html
    rescue Exception => e
      raise GpisParseError.new("Gpis: Parsing Error : #{e.message} :#{e.backtrace.join("\n")}")
    end
    raise GpisParseError.new("Gpis: Parsing Error : category not found for language '#{language}'") if @category[language].nil?
  end


  def fill_permissions_for_lang_based_on_danger_and_section_id(document, language, section_id, is_dangerous)
    begin
      language_hash     = @permissions[language] = Hash.new
      full_css_selector = "##{section_id} li.doc-permission-group"
      document.css(full_css_selector).each do |group_element| # cycle through permission groups
        group_name    = group_element.css(".doc-permission-group-title").inner_html
        current_group = language_hash[group_name]
        #if the current_group hash hasn't yet been created, create it. All the other permissions for this group will then only be added to it, but the first one has to create it
        if current_group.nil?
          current_group               = Hash.new
          current_group[:name]        = group_name
          current_group[:permissions] = Array.new
          language_hash[group_name]   = current_group
        end

        permission_name         = group_element.css(".doc-permission-description").collect { |el| el.inner_html }
        permission_descriptions = group_element.css(".doc-permission-description-full").collect { |el| el.inner_html }
        permission_name.each_index do |i|
          permission               = Hash.new
          permission[:name]        = permission_name[i]
          permission[:description] = permission_descriptions[i]
          permission[:dangerous]   = is_dangerous
          current_group[:permissions].push(permission)
        end
      end
    rescue Exception => e
      raise GpisParseError.new("Gpis: Parsing Error : #{e.message} :#{e.backtrace.join("\n")}")
    end

  end


  def fill_permissions_for_lang(language, document)
    #permissions are divided into two sections: dangerous and safe. They are stored in two different divs.
    css_selector_for_dangerous = "doc-permissions-dangerous"
    css_selector_for_safe      = "doc-permissions-safe"
    fill_permissions_for_lang_based_on_danger_and_section_id(document, language, css_selector_for_dangerous, true)
    fill_permissions_for_lang_based_on_danger_and_section_id(document, language, css_selector_for_safe, false)
  end

  def to_s
    "{Gpis App Info: name = '#{self.name}', category='#{self.category}', icon_url='#{self.icon_url}', permissions = '#{self.permissions}'}"
  end

end