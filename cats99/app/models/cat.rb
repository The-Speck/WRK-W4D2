require 'date'
require 'action_view'
require 'action_view/helpers'

# == Schema Information
#
# Table name: cats
#
#  id          :bigint(8)        not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper
  COLORS = %w(Blue Green Red Yellow Pink Purple Orange Black Gray White Brown)

  def self.colors
    COLORS
  end

  validates :color, inclusion: { in: Cat.colors,
    message: "%{value} is not a valid color"}

  validates :sex, inclusion: { in: %w(M F),
    message: "%{value} is not a valid sex"}

  validates :name, uniqueness: true

  def age
    time_ago_in_words(birth_date) + " old"
  end
end
