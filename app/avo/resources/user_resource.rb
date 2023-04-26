class UserResource < Avo::BaseResource
  self.title = :full_name
  self.includes = []
  self.search_query = -> do
    scope.ransack(id_eq: params[:q], name_cont: params[:q] , middlename_cont: params[:q] , lastname_cont: params[:q] , email_eq: params[:q] , m: "or").result(distinct: false)
  end

  field :id, as: :id
  # Fields generated from the model
  field :name, as: :text
  field :middlename, as: :text
  field :lastname, as: :text
  field :email, as: :text
  field :leader_id, as: :number
  field :members, as: :has_many
  field :leader, as: :belongs_to
  field :user_tests, as: :has_many
  field :tests, as: :has_many, through: :user_tests
  field :user_question, as: :has_many
  field :answers, as: :has_many, through: :user_question
  # add fields here
end
