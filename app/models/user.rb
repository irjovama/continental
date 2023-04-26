class User < ApplicationRecord
    has_many :members, class_name: "User", foreign_key: "leader_id"
    belongs_to :leader, class_name: "User", optional: true

    has_many :user_tests, dependent: :destroy
    has_many :tests, through: :user_tests

    has_many :user_question, dependent: :destroy
    has_many :answers, through: :user_question

    validates :email, uniqueness: true
    validates :name, :middlename, :lastname, presence: true

    # validate :user_exist
    def self.ransackable_attributes(auth_object = nil)
        ["id", "name", "middlename", "lastname", "email"]
    end

    private 

    def user_exist
        errors.add(:leader_id, "Couldn't find Leader with id") unless User.exists?(id: leader_id) || leader_id.nil?
    end
end


