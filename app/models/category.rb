class Category < ApplicationRecord
    has_many :skills, dependent: :nullify
    
    validates :name, presence: true, uniqueness: true
end
