class RepeatSession::Orderly < RepeatSession::Base
  def random_card
    card_pool.order(id: :asc).first
  end
end