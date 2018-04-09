class RepeatSession::Distributed < RepeatSession::Base
  def init_card_pool
    @current_card_pool = deck.cards.order(priority: :asc).limit(all_answers).map(&:id)
  end

  def next_card
    Card.find(current_card_pool.first) if current_card_pool.first
  end
end