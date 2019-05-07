# frozen_string_literal: true

class Api::V0::AdvertisementsController < ApplicationController
  before_action :set_advertisement, only: [:show]
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

  private

  def advertisement_params
    params.permit(:user_id, :location, :category, :advert_type, :model, :price)
  end

  def set_advertisement
    @advertisement = Advertisement.find(params[:id])
  end
end
