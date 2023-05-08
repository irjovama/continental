class Leadership < ApplicationRecord
  belongs_to :employee, :class_name => 'User'
  belongs_to :leader, :class_name => 'User'

  validates :employee_id, :leader_id, :leadership_type, presence: true
  enum leadership_type: [ :direct_leader, :organizational_leader ]

end
