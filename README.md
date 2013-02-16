goodreads
=========

home :: http://github.com/tiagoluchini/goodreads
bugs :: http://github.com/tiagoluchini/goodreads/issues

## Description

This gem allows you to easily access publicly available data from Goodreads.

## Features

`goodreads` currently features the following:

* Querying details of a specified book

## In a nutshell

    require 'goodreads'
    b = Goodreads::Book.new('9780375403170')
    
    b.title
    #=> "Les Misérables"
    
    b.characters
    #=> ["Jean Valjean", "Javert", "Cosette", "Fantine", "Bishop Myriel"]
    
    b.cover
    #=> "http://d.gr-assets.com/books/1320406739l/24284.jpg" 

## Installation

Via Rubygems, simply:

    $ gem install goodreads-wrapper

Or on your `Gemfile`:

    gem 'goodreads-wrapper', :require => 'goodreads'


## Future features

The following features are considered next steps:

* Search by title or author
* Expose more details about genres, characters, authors
* Expose editions
* Expose 'similar items'

## License

(The MIT License)

Copyright (c) 2013 Tiago Luchini

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
