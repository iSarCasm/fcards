class Stats
  StatsDay = Struct.new(:date, :new_cards, :new_answers) do
    def day
      date.to_s(:rfc822)
    end
  end

  attr_reader :days

  def self.per_day
    days_new_cards = Card.group('cast(created_at as date)').order('cast_created_at_as_date DESC').count
    days_new_answers = CardAnswer.group('cast(created_at as date)').order('cast_created_at_as_date DESC').count

    days = {}
    days_new_cards.each do |k, v|
      days[k] = [v, nil]
    end
    days_new_answers.each do |k, v|
      days[k] = [days[k]&.first, v]
    end
    stats = days.map { |date, counts| StatsDay.new(date, counts.first, counts.second) }.sort_by { |x| x.date }.reverse
  end
end