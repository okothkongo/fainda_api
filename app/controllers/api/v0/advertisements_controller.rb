# frozen_string_literal: true

class Api::V0::AdvertisementsController < ApplicationController
  before_action :set_advertisement, only: %i[show update destroy]
  def index
    @advertisements = Advertisement.all
    json_response(@advertisements)
  end

  def create
    @advertisement = Advertisement.create!(advertisement_params)
    json_response(@advertisement, :created)
  end

  def show
    json_response(@advertisement)
  end

  def update
    @advertisement.update(advertisement_params)
    head :no_content
  end

  def destroy
    @advertisement.destroy
    head :no_content
  end

  private

  def advertisement_params
    params.permit(:user_id, :location, :category, :advert_type, :model, :price, :picture)
  end

  def set_advertisement
    @advertisement = Advertisement.find(params[:id])
  end
end
