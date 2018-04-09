class RepeatSession::Base
  attr_reader :wrong_answers, :correct_answers, :all_answers, :deck_id, :current_card_pool
  
  def initialize(deck: nil, questions: 20, data_hash: nil)
    if data_hash
      init_from_hash(data_hash)
    else
      @wrong_answers = []
      @correct_answers = []
      @deck_id = deck.id
      @all_answers = questions
      init_card_pool
    end
  end

  def next_card
    raise 'Not Implemented'
  end

  def already_answered_correctly?(card)
    correct_answers.include? card.id
  end

  def already_answered_wrongly?(card)
    wrong_answers.include? card.id
  end

  def add_correct_answer(card)
    @correct_answers << card.id unless correct_answers.include? card.id
    @wrong_answers.delete(card.id) if already_answered_correctly?(card)
    @current_card_pool.delete card.id
  end

  def add_wrong_answer(card)
    @wrong_answers << card.id unless already_answered_wrongly?(card)
    @current_card_pool.delete card.id
    @current_card_pool << card.id # move to back
  end

  def deck
    Deck.find(deck_id)
  end

  def init_from_hash(data_hash)
    @deck_id = data_hash['deck_id']
    @all_answers = data_hash['all_answers']
    @wrong_answers = data_hash['wrong_answers'] || []
    @correct_answers = data_hash['correct_answers'] || []
    @current_card_pool = data_hash['current_card_pool'] || []
  end

  def to_h
    { 
      'wrong_answers' => wrong_answers,
      'correct_answers' => correct_answers,
      'deck_id' => deck_id,
      'all_answers' => all_answers,
      'type' => self.class.to_s.split('::').last.downcase,
      'current_card_pool' => current_card_pool
    }
  end

  protected

  def init_card_pool
    @current_card_pool = deck.cards.limit(all_answers).map(&:id)
  end

  def card_pool
    Card.where(id: current_card_pool)
  end
end