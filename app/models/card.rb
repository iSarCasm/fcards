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
#  priority     :integer          default(0)
#  archived     :boolean          default(FALSE)
#

class Card < ApplicationRecord
  belongs_to :deck, inverse_of: :cards

  scope :active, -> { where archived: false }
  scope :archived, -> { where archived: true }

  def update_wrong
    update(priority: priority / 2)
  end

  def update_right
    update(priority: priority + 1)
    CardAnswer.create(card: self)
  end
end
