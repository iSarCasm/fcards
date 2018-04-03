class RepeatSession::Distributed < RepeatSession::Base
  def next_card
    card_pool.order(priority: :asc).first
  end
end