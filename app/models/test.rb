class Test < ApplicationRecord
    has_many :user_tests, dependent: :destroy
    has_many :users, through: :user_tests
    has_many :questions

    validates :title, presence: :true
    validates :description, presence: :true
    
    has_many :questions, dependent: :destroy
end
