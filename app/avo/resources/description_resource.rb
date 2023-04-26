class DescriptionResource < Avo::BaseResource
  self.title = :title
  self.includes = []
  self.search_query = -> do
    scope.ransack(id_eq: params[:q], title_cont: params[:q], body_cont: params[:q], m: "or").result(distinct: false)
  end

  field :id, as: :id
  # Fields generated from the model
  field :result_id, as: :number
  field :title, as: :text
  field :body, as: :textarea
  field :result, as: :belongs_to
  # add fields here
end
