class ApplicationController < ActionController::Base
  rescue_from Apilayer::Error, with: :api_layer_error

  def api_layer_error(exception)
    flash[:alert] = "Conversion API:: #{exception.message}"
    redirect_to conversions_path
  end
end
