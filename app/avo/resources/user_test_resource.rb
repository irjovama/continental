class UserTestResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :user_id, as: :number
  field :test_id, as: :number
  field :evaluated_id, as: :number
  field :status, as: :number
  field :token, as: :text
  field :user, as: :belongs_to
  field :test, as: :belongs_to
  # add fields here
end
