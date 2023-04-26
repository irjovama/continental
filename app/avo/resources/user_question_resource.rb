class UserQuestionResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :user_id, as: :number
  field :question_id, as: :number
  field :evaluation, as: :textarea
  field :user, as: :belongs_to
  field :question, as: :belongs_to
  # add fields here
end
