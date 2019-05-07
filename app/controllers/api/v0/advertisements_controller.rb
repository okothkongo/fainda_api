# frozen_string_literal: true

class Api::V0::AdvertisementsController < ApplicationController
  def create
    @advertisement = Advertisement.create!(advertisement_params)
    json_response(@advertisement, :created)
  end

  private

  def advertisement_params
    params.permit(:user_id, :location, :category, :advert_type, :model, :price)
  end
end
