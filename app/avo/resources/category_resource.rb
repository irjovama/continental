class CategoryResource < Avo::BaseResource
  self.title = :name
  self.includes = []
  self.search_query = -> do
    scope.ransack(id_eq: params[:q], name_cont: params[:q], m: "or").result(distinct: false)
  end

  field :id, as: :id
  # Fields generated from the model
  field :name, as: :text
  field :parent_id, as: :number
  field :weight, as: :number
  field :description, as: :text
  field :sub_categories, as: :has_many
  field :parent, as: :belongs_to
  field :results, as: :has_many
  field :questions, as: :has_many
  # add fields here
end
