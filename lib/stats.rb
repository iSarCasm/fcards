class Stats
  StatsDay = Struct.new(:date, :cards) do
    def day
      date.to_s(:rfc822)
    end
  end
  
  attr_reader :days
  
  def self.per_day
    days = Card.group('cast(created_at as date)').order('cast_created_at_as_date DESC').count
    stats = days.map { |date, count| StatsDay.new(date, count) }
  end
end