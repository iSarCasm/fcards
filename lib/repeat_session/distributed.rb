class RepeatSession::Distributed < RepeatSession::Base
  def init_card_pool
    @current_card_pool = Card.where(deck_id: deck_ids).order(priority: :asc).limit(all_answers).pluck(:id)
  end

  def next_card
    Card.find(current_card_pool.first) if current_card_pool.first
  end
end