class UserTest < ApplicationRecord
  belongs_to :user
  belongs_to :test

  # def self.ransackable_attributes(auth_object = nil)
  #   ["status", "id"]
  # end
end
