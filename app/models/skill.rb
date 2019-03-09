class Skill < ApplicationRecord
  belongs_to :category

  has_many :skillsets, dependent: :nullify
  has_many :profiles, through: :skillsets

  accepts_nested_attributes_for :skillsets

  validates :name, presence: true

  def proficiency(profile)
    Skillset.where(skill_id: id, profile_id: profile.id)[0].proficiency
  end
end
