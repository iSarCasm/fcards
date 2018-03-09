module CardsHelper
  def correct_answers_count
    session[:repeat_session]['correct_answers'].size
  end

  def wrong_answers_count
    session[:repeat_session]['wrong_answers'].size
  end

  def all_cards_count
    session[:repeat_session]['all_answers']
  end
end