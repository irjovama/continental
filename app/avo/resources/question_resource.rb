class QuestionResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :test_id, as: :number
  field :title, as: :text
  field :category_id, as: :number
  field :index, as: :number
  field :weight, as: :number
  field :option_id, as: :number
  field :question_type, as: :select, enum: ::Question.question_types
  field :option, as: :belongs_to
  field :test, as: :belongs_to
  field :category, as: :belongs_to
  field :user_question, as: :has_many
  field :users, as: :has_many, through: :user_question
  # add fields here
end
