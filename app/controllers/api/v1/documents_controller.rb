class Api::V1::DocumentsController < Api::V1::AuthController
  before_action :set_client

  def index
    @documents = @client.documents
    # render jbuilder
  end

  def assign_url
    document = @client.documents.find(params[:id])
    url = document.get_presigned_url
    render json: { url: url }, status: 200
  end

  def create
    document = params['document']
    @document = @client.documents.new(name: document.original_filename, extension: document.content_type)
    if @document.save
      # TODO: add company and company id in fron of url
      url = "/clients/#{@client.id}/documents/#{@document.name}"
      @document.update(url: url)
      if @document.upload(document, url)
        # render jbuilder
      else
        @document.destroy
        render json: { error: 'Document failed to upload' }, status: 422
      end
    else
      render json: { error: 'Document not saved' }, status: 422
    end
  end
  
  def destroy
    docs_to_delete = params[:documents].pluck(:id)
    @documents = @client.documents.where('documents.id IN (?)', @client.documents.pluck(:id) & docs_to_delete )
    doc_ids = @documents.pluck(:id)
    if @documents.destroy_all
      render json: { documents: doc_ids }
    else
      render json: { error: 'error' }, status: 422
    end
  end
  
  private
  
  def set_client
    @client = current_user.company.clients.find(params[:client_id])
  end

  def document_params
    params.require(:document).permit(:name, :extension, :url, :client_id, :task_id).permit!(:documents)
  end
  
end