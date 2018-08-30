class CardsArchiveController < ApplicationController
  def create
    card.update archived: true
    redirect_back(fallback_location: root_path)
  end

  def destroy
    card.update archived: false
    redirect_back(fallback_location: root_path)
  end

  private

  def card
    Card.find params[:id]
  end
end