class RepeatSession::Random < RepeatSession::Base
  def random_card
    card_pool.to_a.shuffle.first
  end
end