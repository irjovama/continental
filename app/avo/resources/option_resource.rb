class OptionResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :upper_option, as: :text
  field :lower_option, as: :text
  field :middle_option, as: :text
  field :questions, as: :has_many
  # add fields here
end
