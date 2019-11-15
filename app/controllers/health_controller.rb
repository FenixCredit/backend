class HealthController < ApplicationController
  skip_before_action :authenticate_user, only: [:health]
  
  def health
    render json: {api: 'OK'}, status: :ok
  end
end
