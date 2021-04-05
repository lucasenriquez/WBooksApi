class OpenLibraryService
  def execute(bibkeys)
    s = "https://openlibrary.org/api/books?bibkeys=#{bibkeys}&format=json&jscmd=data"
    r = HTTParty.get(s)
    [r.code, r.parsed_response]
  end
end
