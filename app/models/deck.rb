# == Schema Information
#
# Table name: decks
#
#  id         :integer          not null, primary key
#  deck_title :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deck_id    :integer
#

class Deck < ApplicationRecord
  belongs_to :deck, optional: true
  has_many :cards, inverse_of: :deck

  scope :high_order, -> { where(deck: nil) }

  def title
    deck ? "#{deck.title} - #{deck_title}" : deck_title
  end
end
