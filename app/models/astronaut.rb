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

  scope :mens, -> { where(gender:  'Men' ) }
  scope :womens, -> { where(gender:  'Women' ) }
  scope :age_under_40, -> { where('age <= 40') }
  scope :age_over_40, -> { where('age >= 40') }

  def full_name
    "#{name} #{surname}"
  end

  def class_for_search
    if gender == "Women"
      "womens"
    else
      "mens"
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