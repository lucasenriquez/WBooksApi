class OpenLibraryService
  def execute(bibkeys)
    s = "#{Rails.application.secrets.api + bibkeys}&format=json&jscmd=data"
    r = HTTParty.get(s)
    [r.code, r.parsed_response]
  end
end
