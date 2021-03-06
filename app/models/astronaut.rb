# == Schema Information
#
# Table name: astronauts
#
#  id                             :bigint(8)        not null, primary key
#  name                           :string
#  surname                        :string
#  gender                         :string
#  age                            :integer
#  number_of_space_visits         :integer
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#

class Astronaut < ActiveRecord::Base
  has_rich_text :description

  validates_presence_of :name, :surname, :gender

  default_scope { order(created_at: :desc) }
  scope :men, -> { where(gender:  'Men' ) }
  scope :women, -> { where(gender:  'Women' ) }
  scope :age_under_40, -> { where('age <= 40') }
  scope :age_over_40, -> { where('age >= 40') }

  def full_name
    "#{name} #{surname}"
  end

  def class_for_search
    if gender == "Women"
      "women"
    else
      "men"
    end
  end

  def avatar_url
    if gender == "Women"
      "women.png"
    else
      "men.png"
    end
  end
end