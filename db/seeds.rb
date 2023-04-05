# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# boss = User.create(name: "Boss")
# member = User.create(name: "Member", leader: boss)
# test = Test.create(title: "Encuesta de lideres")
# parent_category = Category.create(name: "Categoria padre")
# sub_category = Category.create(name: "Sub categoria 1", parent: parent_category )
# sub_category2 = Category.create(name: "Sub categoria 2", parent: parent_category )
# q1 = Question.create(title: "pregunta 1", category: sub_category, test: test, weight: 1)
# q2 = Question.create(title: "pregunta 2", category: sub_category, test: test, weight: 1)
# q3 = Question.create(title: "pregunta 3", category: sub_category2, test: test, weight: 1)


# parent_result = Result.create(category: parent_category, min_range: 0, max_range: 50)
# parent_result2 = Result.create(category: parent_category, min_range: 51, max_range: 100)
# description1 = Description.create(result: parent_result, title: "parent result 0 to 50", body: "the body")
# description2 = Description.create(result: parent_result2, title: "parent result 51 to 100", body: "the body")

# sub1_result = Result.create(category: sub_category, min_range: 0, max_range: 50)
# sub1_result2 = Result.create(category: sub_category, min_range: 51, max_range: 100)
# sub1_description1 = Description.create(result: sub1_result, title: "sub1 result 0 to 50", body: "the body")
# sub1_description2 = Description.create(result: sub1_result2, title: "sub1 result 51 to 100", body: "the body")


# sub2_result = Result.create(category: sub_category2, min_range: 0, max_range: 50)
# sub2_result2 = Result.create(category: sub_category2, min_range: 51, max_range: 100)
# sub2_description1 = Description.create(result: sub2_result, title: "sub1 result 0 to 50", body: "the body")
# sub2_description2 = Description.create(result: sub2_result2, title: "sub1 result 51 to 100", body: "the body")


# #asignar encuesta
# #esto sería en el endpoint 

# UserTest.create(
#     user: member,
#     test: test,
#     evaluated_id: boss.id,
#     status: 1,
#     token: "abc"
# )

# questions = member.tests.first.questions

# questions.each do |q|
#     UserQuestion.create(user: member, question: q, evaluation: rand(10))
# end

#####seedddd completo 

test_id = 1 #param
boss_id = User.find(1).id #param

puts "###################"
puts "ejemplo de endpoint"
puts "localhost/reports/leaders/#{boss_id}/tests/#{test_id}"
puts "###################"


def obj_response(boss_id)
    {
        test: {
            id: nil,
            title: nil,
            users_answers: 0,
            users_total: User.find(boss_id).members.size,
        },
        category: {
            id: nil,
            name: nil,
            evaluations: [],
            
        },
        sub_categories: [
    
        ], 
    }
end

def obj_sub_categories(question, responses)
    if responses[:sub_categories].size.positive?
        if responses[:sub_categories].find { |r| r[:id] == question.category_id }
            return responses[:sub_categories]
        end
    end
    responses[:sub_categories] << {
        id: question.category_id, 
        name: question.category.name, 
        evaluations: []
    }
    responses[:sub_categories]
end


def get_responses(boss_id, test_id)
    finish = 1
    responses = obj_response(boss_id)
    begin
        questions = UserTest.find_by(evaluated_id: boss_id, status: finish, test_id: test_id).test.questions
        questions.each do |question|
            responses[:test][:id] = question.test.id;
            responses[:test][:title] = question.test.title;
            responses[:test][:users_answers] = question.user_question.size
            responses[:category][:id] = question.category.parent_id;
            responses[:category][:name] = question.category.parent.name;
            responses[:sub_categories] = obj_sub_categories(question, responses)
            question.user_question.each do |q|
                value = q.evaluation * question.weight
                responses[:category][:evaluations] << value
                index = responses[:sub_categories].find_index{ |r| r[:id] == question.category_id} 
                responses[:sub_categories][index][:evaluations] << value
            end
        end
    rescue NoMethodError
    end
    responses
end
#ya tenemos un arreglo llamado responses con las evaluaciones, categorias y subcategorias
responses = get_responses(boss_id, test_id)
pp responses