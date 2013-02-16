require 'cgi'
 
module Goodreads #:nordoc:
  module StringExtensions
  
    # Unescape HTML
    def goodreads_unescape_html
      if String.method_defined?(:encode)
        CGI::unescapeHTML(self.encode("UTF-8", 'ISO-8859-1'))
      else
        require 'iconv'
        Iconv.conv("UTF-8", 'ISO-8859-1', CGI::unescapeHTML(self)) 
      end
    end
  
    # Strip tags
    def goodreads_strip_tags
      gsub(/<\/?[^>]*>/, "")
    end
    
    def goodreads_strip_bad_description_content
      gsub(/^\([^\)]+\)/, '').gsub(/more$/, '')
    end
    
    # Strips out whitespace then tests if the string is empty.
    def blank?
      strip.empty?
    end unless method_defined?(:blank?)
  end
end

String.send :include, Goodreads::StringExtensions
