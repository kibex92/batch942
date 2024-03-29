class Doctor < ActiveRecord::Base
  has_many :interns
  has_many :appointments
  has_many :patients, through: :appointments

  validates :last_name, presence: true, uniqueness: true, length: { minimum: 2}
end