class RepeatSession::Orderly < RepeatSession::Base
  def next_card
    card_pool.order(id: :asc).first
  end
end