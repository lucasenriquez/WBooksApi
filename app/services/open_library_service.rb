class OpenLibraryService
  def call
    return 'You need to specify the bibkeys' if @bibkeys.nil?

    s = "https://openlibrary.org/api/books?bibkeys=#{@bibkeys}&format=json&jscmd=data"
    r = HTTParty.get(s)
    [r.code, r.body]
  end
end
