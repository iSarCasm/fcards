class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def card_path(card)
    deck_card_path(card.deck, card)
  end
end
