
class Scrapper


#scrape web page
#class constant based on Tech Radar
TECH_RDR_URL = "https://www.techradar.com/news/new-games-2020-ps4-ps5-xbox-pc"
  def self.scrape_tech_rdr
    html = open("https://www.techradar.com/news/new-games-2020-ps4-ps5-xbox-pc")
    # need to open URL
    doc = Nokogiri::HTML(html)
    # use nokogiri (Verify install with irb) to parse our url
    doc.css("#article-body").css('ul li').each do |game|
      #title = game.css("a").text
      #UL .count gave me 8 subsections which is how the months were seperated on page 
      title = game.text.split("-")[0]
      #used negative one to seperate the "OUT NOW" from the rest of the data will display on more details list
      status = game.text.split("-")[-1]
      url = game.css("a").attr('href')


      VideoGame.new(title, status, url)
      #ITERATE over each element pulling title & release date (sort by Month)
      #create new game object with title & date
    end
  end


end
