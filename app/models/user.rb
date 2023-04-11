class User < ApplicationRecord
    has_many :members, class_name: "User", foreign_key: "leader_id"
    belongs_to :leader, class_name: "User", optional: true

    has_many :user_tests
    has_many :tests, through: :user_tests

    has_many :user_question
    has_many :answers, through: :user_question

    validates :email, uniqueness: true
    validates :name, presence: true
end
