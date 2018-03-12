class RepeatSession::Base
  attr_reader :wrong_answers, :correct_answers, :all_answers, :deck_id
  
  def initialize(deck: nil, data_hash: nil)
    if data_hash
      init_from_hash(data_hash)
    else
      @wrong_answers = []
      @correct_answers = []
      @deck_id = deck.id
      @all_answers = deck.cards.count
    end
  end

  def random_card
    raise 'Not Implemented'
  end

  def already_answered_correctly?(card)
    correct_answers.include? card.id
  end

  def add_correct_answer(card)
    @correct_answers << card.id unless correct_answers.include? card.id
    @wrong_answers.delete(card.id) if @wrong_answers.include? card.id
  end

  def add_wrong_answer(card)
    @wrong_answers << card.id unless wrong_answers.include? card.id
  end

  def deck
    Deck.find(deck_id)
  end

  def init_from_hash(data_hash)
    @deck_id = data_hash['deck_id']
    @all_answers = data_hash['all_answers']
    @wrong_answers = data_hash['wrong_answers'] || []
    @correct_answers = data_hash['correct_answers'] || []
  end

  def to_h
    { 
      'wrong_answers' => wrong_answers,
      'correct_answers' => correct_answers,
      'deck_id' => deck_id,
      'all_answers' => all_answers,
      'type' => self.class.to_s.split('::').last.downcase
    }
  end

  protected

  def card_pool
    if correct_answers.empty?
      deck.cards
    else
      deck.cards.where.not(id: correct_answers)
    end
  end
end