class ResultResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :category_id, as: :number
  field :min_range, as: :number
  field :max_range, as: :number
  field :category, as: :belongs_to
  field :descriptions, as: :has_many
  # add fields here
end
