class CardsController < ApplicationController
  def show
    @card = find_card
  end

  def answer
    @card = find_card
  end

  def right
    @card = find_card
    render 'cards/responded', locals: { card: @card }
  end

  def wrong
    @card = find_card
    render 'cards/responded', locals: { card: @card }
  end

  def next
    random_card_id = 1 + rand(find_card.deck.cards.count)
    random_card = find_card.deck.cards.find(random_card_id)
    redirect_to deck_card_url(random_card.deck, random_card)
  end

  private

  def find_card
    Card.find(params[:id])
  end
end
