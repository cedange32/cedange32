require 'open-uri'
require 'nokogiri'

require_relative "recipe"

class Scraper
  def parse(ingredient)
    base_url = 'http://www.epicurious.com'
    url = "#{base_url}/tools/searchresults?search=#{ingredient}"

    doc = Nokogiri::HTML(open(url), nil, 'utf-8')

    results = []

    doc.css('.sr_rows').each do |element|
      name = element.css('.recipeLnk').inner_text

      show_url = base_url + element.css('.recipeLnk').attribute('href')

      doc2 = Nokogiri::HTML(open(show_url), nil, 'utf-8')

      description = doc2.css('.dek > p').inner_text
      # active_time = doc2.css('dd.active-time').inner_text
      # total_time = doc2.css('dd.total-time').inner_text

      recipe = Recipe.new({
        name: name,
        description: description,
        difficulty: 1
      })
      results << recipe
    end

    return results
  end
end
