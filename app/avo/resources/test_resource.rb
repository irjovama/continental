class TestResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :title, as: :text
  field :description, as: :textarea
  field :asignation_counter, as: :number
  field :finish_counter, as: :number
  field :user_tests, as: :has_many
  field :users, as: :has_many, through: :user_tests
  field :questions, as: :has_many
  # add fields here
end
