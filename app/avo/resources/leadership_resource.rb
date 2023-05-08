class LeadershipResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :employee_id, as: :number
  field :leader_id, as: :number
  field :leadership_type, as: :select, enum: ::Leadership.leadership_types
  field :employee, as: :belongs_to
  field :leader, as: :belongs_to
  # add fields here
end
