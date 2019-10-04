class PayloadsController < ApplicationController
  def index
    render json: Payload.distinct
  end

  # GET /payloads/{UUID}
  def show
    render json: payload
  end

  # POST /payloads
  def create
    @payload = Payload.new(payload_params)

    if @payload.save
      render json: @payload, status: :created, location: @payload
    else
      render json: @payload.errors, status: :unprocessable_entity
    end
  end

  private

  def payload
    @payload ||= Payload.find_by!(uuid: params[:uuid])
  rescue ActiveRecord::RecordNotFound
    nil
  end

  def payload_params
    params.require(:payload).permit(:label, :description)
  end
end
