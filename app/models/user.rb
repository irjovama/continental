class User < ApplicationRecord
    has_many :members, class_name: "User", foreign_key: "leader_id"
    belongs_to :leader, class_name: "User", optional: true

    has_many :user_tests, dependent: :destroy
    has_many :tests, through: :user_tests

    has_many :user_question, dependent: :destroy
    has_many :answers, through: :user_question

    validates :email, uniqueness: true
    validates :name, presence: true

    # validate :user_exist

    private 

    #Asks for validations even for the Leader who doesn't have a leader_id
    # def user_exist
    #     errors.add(:leader_id, "Couldn't find Leader with id") unless User.exists?(id: leader_id)
    # end
end


