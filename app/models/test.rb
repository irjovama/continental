class Test < ApplicationRecord
    has_many :user_tests
    has_many :users, through: :user_tests
    has_many :questions

    validates :title, uniqueness: true
    validates :description, presence: true
    
end
