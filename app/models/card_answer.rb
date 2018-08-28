# == Schema Information
#
# Table name: card_answers
#
#  id         :integer          not null, primary key
#  card_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CardAnswer < ApplicationRecord
  belongs_to :card
end
