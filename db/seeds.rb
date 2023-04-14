question_details = " ¿Volutpat consequat bibendum nisl dictum quisque. Vel habitant dictum nibh scelerisque leo sed in ut ac?"
boss = User.create(name: "Boss", email: "boss@email.com")
member = User.create(name: "Member 1", leader: boss, email: "univcotincodeable@gmail.com")
member2 = User.create(name: "Member 2", leader: boss, email: "member2@gmail.com")
test1 = Test.create(title: "Encuesta de lideres", description: "descripcion")
test2 = Test.create(title: "Encuesta de subordinados", description: "descripcion")
option = Option.create(upper_option: "Fuertemente de acuerdo", lower_option: "Fuertemente en desacuerdo")
option2 = Option.create(upper_option: "Siento feliz conmigo mismo", lower_option: "Siento triste conmigo mismo")
parent_category = Category.create(name: "Entrega de resultados", weight: 1)
sub_category = Category.create(name: "Conecta los logros con el equipo", parent: parent_category, weight: 0.4 )
sub_category2 = Category.create(name: "Ejecuta con efectividad", parent: parent_category, weight: 0.4 )
sub_category3 = Category.create(name: "Cumple con responsabilidad", parent: parent_category, weight: 0.2 )
q1 = Question.create(title: "pregunta 1" + question_details, category: sub_category, test: test1, weight: 1, option: option, question_type: 0, index: 1)
pp q1.errors.full_messages
q2 = Question.create(title: "pregunta 2"+ question_details, category: sub_category, test: test1, weight: 1, option: option, question_type: 0, index: 2)
q3 = Question.create(title: "pregunta 3"+ question_details, category: sub_category2, test: test1, weight: 1, option: option2, question_type: 0, index: 3)
q4 = Question.create(title: "pregunta 1"+ question_details, category: sub_category2, test: test2, weight: 1, option: option2, question_type: 0, index: 1)

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
sub2_description1 = Description.create(result: sub2_result, title: "sub2 result 0 to 50", body: "the body")
sub2_description2 = Description.create(result: sub2_result2, title: "sub2 result 51 to 100", body: "the body")



parent_category = Category.create(name: "Crea Vinculos genuinos", weight: 1)
sub_category = Category.create(name: "crea seguridad psicologica", parent: parent_category, weight: 0.5 )
sub_category2 = Category.create(name: "Desarrolla confianza", parent: parent_category, weight: 1 )
option = Option.create(upper_option: "Muy ansioso", lower_option: "En paz conmigo mismo")
option2 = Option.create(upper_option: "Responsable", lower_option: "Cero sentido de la responsabilidad")
q1 = Question.create(title: "pregunta 1"+ question_details, category: sub_category, test: test1, weight: 1, option: option, question_type: 0, index: 4 )
q2 = Question.create(title: "pregunta 2"+ question_details, category: sub_category, test: test1, weight: 1, option: option, question_type: 1, index: 5)
q3 = Question.create(title: "pregunta 3"+ question_details, category: sub_category2, test: test1, weight: 1, option: option2, question_type: 1, index: 6)

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
sub2_description1 = Description.create(result: sub2_result, title: "sub2 result 0 to 50", body: "the body")
sub2_description2 = Description.create(result: sub2_result2, title: "sub2 result 51 to 100", body: "the body")
require 'securerandom'


UserTest.create(
    user_id: 1,
    test_id: 1,
    evaluated_id: 1,
    status: 0,
    token:  SecureRandom.hex(16)
)

questions = boss.user_tests.first.test.questions

questions.each do |q|
    UserQuestion.create(user: member, question: q, evaluation: rand(10))
end

#asignar encuesta
#esto sería en el endpoint 

UserTest.create(
    user_id: 2,
    test_id: 1,
    evaluated_id: 1,
    status: 1,
    token:  SecureRandom.hex(16)
)

questions = member.user_tests.first.test.questions

questions.each do |q|
    UserQuestion.create(user: member, question: q, evaluation: rand(10))
end


#asignar encuesta
#esto sería en el endpoint 

UserTest.create(
    user_id: 3,
    test_id: 1,
    evaluated_id: 1,
    status: 1,
    token:  SecureRandom.hex(16)
)

questions = member2.user_tests.first.test.questions

questions.each do |q|
    UserQuestion.create(user: member2, question: q, evaluation: rand(10))
end



####seedddd completo 

# test_id = 1 #param
# boss_id = User.find(1).id #param

# puts "###################"
# puts "ejemplo de endpoint"
# puts "localhost/reports/leaders/#{boss_id}/tests/#{test_id}"
# puts "###################"


# def obj_response(boss_id)
#     {
#         test: {
#             id: nil,
#             title: nil,
#             users_total: User.find(boss_id).members.size,
#             members_evaluation: 0,
#             count_evaluations: 0,
#             average: 0,
#         },
#         category: {
#             id: nil,
#             name: nil,
#             members_evaluation: 0,
#             count_evaluations: 0,
#             average: 0,
#         },
#         sub_categories: [
    
#         ], 
#     }
# end

# def obj_sub_categories(question, responses)
#     if responses[:sub_categories].size.positive?
#         if responses[:sub_categories].find { |r| r[:id] == question.category_id }
#             return responses[:sub_categories]
#         end
#     end
#     responses[:sub_categories] << {
#         id: question.category_id, 
#         name: question.category.name, 
#         members_evaluation: 0,
#         count_evaluations: 0,
#         average: 0,
#     }
#     responses[:sub_categories]
# end


# def get_responses(boss_id, test_id)
#     finish = 1
#     responses = obj_response(boss_id)
#     begin
#         questions = UserTest.find_by(evaluated_id: boss_id, status: finish, test_id: test_id).test.questions
#         questions.each do |question|
#             responses[:test][:id] = question.test.id;
#             responses[:test][:title] = question.test.title;
#             responses[:test][:count_evaluations] = question.user_question.size
#             responses[:category][:id] = question.category.parent_id;
#             responses[:category][:name] = question.category.parent.name;
#             responses[:sub_categories] = obj_sub_categories(question, responses)
#             question.user_question.each do |q|
#                 value = q.evaluation * question.weight
#                 responses[:test][:count_evaluations] += 1
#                 responses[:test][:members_evaluation] += value
#                 responses[:test][:average] = responses[:category][:members_evaluation] / responses[:category][:count_evaluations]

#                 responses[:category][:count_evaluations] += 1
#                 responses[:category][:members_evaluation] += value
#                 responses[:category][:average] = responses[:category][:members_evaluation] / responses[:category][:count_evaluations]
#                 index = responses[:sub_categories].find_index{ |r| r[:id] == question.category_id} 
#                 responses[:sub_categories][index][:count_evaluations] += 1
#                 responses[:sub_categories][index][:members_evaluation] += value
#                 responses[:sub_categories][index][:average] = responses[:sub_categories][index][:members_evaluation] / responses[:sub_categories][index][:count_evaluations]
#             end
#         end
#     rescue NoMethodError
#     end
#     responses
# end
# #ya tenemos un arreglo llamado responses con las evaluaciones, categorias y subcategorias
# responses = get_responses(boss_id, test_id)
# pp responses

