class RepeatSession
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
    if correct_answers.empty?
      deck.cards.to_a.shuffle.first
    else
      deck.cards.where.not(id: correct_answers).to_a.shuffle.first
    end
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
      'all_answers' => all_answers
    }
  end
end