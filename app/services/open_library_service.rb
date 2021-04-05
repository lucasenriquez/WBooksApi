class OpenLibraryService
  def self.call(*args, &block)
    new(*args, &block).execute
  end

  def initialize(bibkeys)
    @bibkeys = bibkeys
  end

  def execute
    return 'You need to specify the bibkeys' if @bibkeys.nil?

    s = "https://openlibrary.org/api/books?bibkeys=#{@bibkeys}&format=json&jscmd=data"
    r = HTTParty.get(s)
    [r.code, r.body]
  end
end
