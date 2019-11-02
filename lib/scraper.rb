require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    index_url = "https://learn-co-curriculum.github.io/student-scraper-test-page/index.html"
    doc = Nokogiri::HTML(open(index_url))
    name = doc.css("h4.student-name").text
    location = doc.css("p.student-location").text
    
    profile_url = doc.css(".view-profile-div")
    student_hash = {
      :name => name,
      :location => location,
      :profile_url => profile_url
    }
    Student.new(student_hash)
  end

  def self.scrape_profile_page(profile_url)
    profile_url = "https://learn-co-curriculum.github.io/student-scraper-test-page/students/"
    doc = Nokogiri::HTML(open(profile_url))
    
    twitter = doc.css("https://twitter.com")
    linkedin = doc.css("")
    github = doc.css("")
    blog = doc.css("")
    profile_quote = doc.css("")
    bio = doc.css("")
    profile_hash = {
      :twitter => twitter,
      :linkedin => linkedin,
      :github => github,
      :blog => blog,
      :profile_quote => profile_quote,
      :bio => bio
    }
    Social.new(profile_hash)
    binding.pry
  end

end

