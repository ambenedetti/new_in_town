class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true, uniqueness: true
  has_many :tips
  has_many :questions
  has_many :reports
  has_many :votes
  has_many :cities, class_name: 'UserCity'
  has_many :ignored_questions

  def city_names
    cities.pluck(:city)
  end

  def questions_to_answer
    ignored = ignored_questions.pluck(:id)
    Question.where(city: city_names).where.not(user: self).where.not(id: ignored)
  end
end
