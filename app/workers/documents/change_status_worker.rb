class Documents::ChangeStatusWorker 
  include Sidekiq::Worker
  sidekiq_options queue: 'documents'

  def perform(id, status)
    @document = Document.find(id)
    @document.update(status: status)
  end
end