# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
boss = User.create(name: "Boss")
member = User.create(name: "Member", leader: boss)
test = Test.create(title: "Encuesta de lideres")
parent_category = Category.create(name: "Categoria padre")
sub_category = Category.create(name: "Sub categoria 1", parent: parent_category )
sub_category2 = Category.create(name: "Sub categoria 2", parent: parent_category )
q1 = Question.create(title: "pregunta 1", category: sub_category, test: test)
q2 = Question.create(title: "pregunta 2", category: sub_category, test: test)
q3 = Question.create(title: "pregunta 3", category: sub_category2, test: test)


parent_result = Result.create(category: parent_category, min_range: 0, max_range: 50)
parent_result2 = Result.create(category: parent_category, min_range: 51, max_range: 100)
description1 = Description.create(result: parent_result, title: "parent result 0 to 50", body: "the body")
description2 = Description.create(result: parent_result2, title: "parent result 51 to 100", body: "the body")

sub1_result = Result.create(category: sub_category, min_range: 0, max_range: 50)
sub1_result2 = Result.create(category: sub_category, min_range: 51, max_range: 100)
sub1_description1 = Description.create(result: sub1_result, title: "sub1 result 0 to 50", body: "the body")
sub1_description2 = Description.create(result: sub1_result2, title: "sub1 result 51 to 100", body: "the body")


sub2_result = Result.create(category: sub_category2, min_range: 0, max_range: 50)
sub2_result2 = Result.create(category: sub_category2, min_range: 51, max_range: 100)
sub2_description1 = Description.create(result: sub2_result, title: "sub1 result 0 to 50", body: "the body")
sub2_description2 = Description.create(result: sub2_result2, title: "sub1 result 51 to 100", body: "the body")


#asignar encuesta
member.tests << test

questions = member.tests.first.questions

questions.each do |q|
    UserQuestion.create(user: member, question: q, evaluation: rand(10))
end