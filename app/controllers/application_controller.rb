class ApplicationController < ActionController::API
  include ErrorSerializer
  before_action :ensure_json_request

  def ensure_json_request 
    unless request.headers["Accept"] =~ /vnd\.api\+json/
      render json: ErrorSerializer.message_error("Ocorreu um erro"), :status => 406
    else
      unless request.get?
        return if request.headers["Content-Type"] =~ /vnd\.api\+json/
        render :nothing => true, :status => 415
      end
    end
  end
end
