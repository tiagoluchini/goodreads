module Goodreads

  # Represents a Book on goodreads.com
  class Book
    attr_accessor :isbn, :url, :query_url

    # Initialize a new Goodreads book object with its ISBN (as a String)
    #
    #   movie = Imdb::Movie.new("0095016")
    #
    # Imdb::Movie objects are lazy loading, meaning that no HTTP request
    # will be performed when a new object is created. Only when you use an
    # accessor that needs the remote data, a HTTP request is made (once).
    #
    def initialize(isbn)
      @isbn = isbn
      @query_url = Goodreads::Book.make_query_url(isbn)
    end

    def goodreads_id
      @url.match(/\/(\d+)\./)[1] rescue nil
    end
    
    # Returns a string containing the title
    def title
      document.search(".bookTitle").innerHTML.strip rescue nil
    end
    
    def cover
      document.at("img[@id='coverImage']")['src'] rescue nil
    end
    
    def authors
      document.search("[@id='bookAuthors']/[@itemprop='author']/a/span").map { |elem| elem.innerHTML.strip } rescue []
    end
    
    def rating
      document.at("[@id='bookMeta']/*/[@itemprop='ratingValue']").innerHTML.strip rescue nil
    end
    
    def description
      document.at("[@id='description']/span[1]").innerHTML.goodreads_strip_tags.goodreads_strip_bad_description_content rescue nil
    end

    def characters
      document.search("[@id='bookDataBox']/*/[@class='infoBoxRowItem']/a").select {|elem| elem['href'] =~ /character/}.map {|elem| elem.innerHTML.strip} rescue []
    end
    
    def number_of_pages
      document.at("[@itemprop='numberOfPages']").innerHTML.scan(/\d+/).first.to_i rescue nil
    end
    
    def genres
      document.search("[@class='actionLinkLite']").select { |elem| elem['href'] =~ /genres/ }.map { |elem| elem.innerHTML.strip } rescue []
    end


    private

    # Returns a new Hpricot document for parsing.
    def document
      @document ||= Hpricot(open_goodreads)
    end
    
    def open_goodreads
      f = open(@query_url)
      @url = f.base_uri.to_s
      f.read
    end

    def self.make_query_url(isbn)
      "http://www.goodreads.com/search?utf8=%E2%9C%93&query=#{isbn}"
    end

  end # Book

end # Goodreads
