class RepeatSession::Distributed < RepeatSession::Base
  def random_card
    card_pool.order(priority: :asc).first
  end
end