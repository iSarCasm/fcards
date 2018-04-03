class RepeatSession::Random < RepeatSession::Base
  def next_card
    card_pool.to_a.shuffle.first
  end
end