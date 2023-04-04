class User < ApplicationRecord
    has_many :members, class_name: "User", foreign_key: "leader_id"
    belongs_to :leader, class_name: "User", optional: true
end
