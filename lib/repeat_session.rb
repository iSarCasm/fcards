module RepeatSession
  def self.from(data_hash: nil)
    case data_hash['type']
    when 'distributed'  then RepeatSession::Distributed.new(data_hash: data_hash)
    when 'orderly'      then RepeatSession::Orderly.new(data_hash: data_hash)
    when 'random'       then RepeatSession::Random.new(data_hash: data_hash)
    end
  end

  def self.create(type, params)
    case type
    when 'distributed'  then RepeatSession::Distributed.new(params)
    when 'orderly'      then RepeatSession::Orderly.new(params)
    when 'random'       then RepeatSession::Random.new(params)
    end
  end
end