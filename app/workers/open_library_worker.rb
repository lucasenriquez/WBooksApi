class OpenLibraryWorker
  include Sidekiq::Worker

  def perform(bibkeys)
    OpenLibraryService.call(bibkeys)
  end
end
