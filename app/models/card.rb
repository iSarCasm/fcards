# == Schema Information
#
# Table name: cards
#
#  id           :integer          not null, primary key
#  deck_id      :integer
#  order_number :integer
#  question     :text
#  answer       :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Card < ApplicationRecord
  belongs_to :deck, inverse_of: :cards
end
