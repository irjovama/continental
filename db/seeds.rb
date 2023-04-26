index = 0

boss = User.create(name: "Boss", email: "boss@email.com", middlename: "Bossier", lastname: "James")
member = User.create(name: "Member 1", leader: boss, email: "univcotincodeable@gmail.com", middlename: "Employee", lastname: "James")
member2 = User.create(name: "Member 2", leader: boss, email: "member2@gmail.com", middlename: "Employee", lastname: "James")
test1 = Test.create(title: "Medición de liderazgo", description: "test_description")
index = 0
qlist = []
#crear una categoria
parent_category = Category.create(name: "Entrega Resultados", weight: 1)
pp parent_category
#crear sub categoria
sub_category = Category.create(name: "Liderar a Otros - Ejecuta con Efectividad", parent: parent_category, weight: 1 )
pp sub_category
qlist << 
    {
        lo: "Nos da tareas especificas sin conectarnos como equipo",
        up: "Se enfoca en asegurar que todos entendemos el objetivo y nos organiza para todos contribuir y lograrlo.",
        mi: "Nos conecta a nivel medio",
        ti: "Mi lider para conseguir los resultados esperados",
        ty: 0,
        ca: sub_category.id,
    }
qlist << 
    {
        lo: "dandome confianza indicandome que debo hacer y para cuando tiene que estar listo.",
        up: "reconociendo mis fortalezas, asegurando que entiendo el objetivo y como impacto en un logro mayor",
        mi: "en un nivel intermedio",
        ti: "Mi lider asigna tareas",
        ty: 0,
        ca: sub_category.id,
    }
qlist << 
    {
        lo: "Tengo claro que hacer pero no reconozco mi impacto en el trabajo de mis demás compañeros",
        up: "Estan muy claras y todos en el equipo sabemos qué hace cada uno y como nos complementamos",
        mi: "en un nivel intermedio",
        ti: "La organizaciòn de las funciones y responsabilidades del equipo",
        ty: 0,
        ca: sub_category.id,
    }
qlist << 
    {
        lo: "Invertimos todos los recursos disponibles o excedemos lo previsto con tal de lograr el objetivo",
        up: "Asegura la inversiòn adecuada cuidando los presupuestos y maximizandolos",
        mi: "en un nivel intermedio",
        ti: "Cuando se trata de gestionar los recursos que tenemos disponibles",
        ty: 0,
        ca: sub_category.id,
    }
#crear sub categoria
sub_category = Category.create(name: "Liderar a Otros - Conecta los logros con el propósito", parent: parent_category, weight: 1 )
pp sub_category
qlist << 
    {
        lo: "No lo tiene presente en el dìa a dìa ",
        up: "Vive el proposito en cada cosa que hacemos",
        mi: "en un nivel intermedio",
        ti: "Cuando se trata del proposito de la organizaciòn mi lider",
        ty: 0,
        ca: sub_category.id,
    }
qlist <<
    {
        lo: "No necesariamente lo conecta con como lograr lo que nos planteamos nos acerca a cumplir nuestro proposito.",
        up: "Comparte con el equipo como el logro del proyecto o el nuevo desafio nos acerca a vivir nuestro proposito",
        mi: "en un nivel intermedio",
        ti: "Cuando iniciamos un proyecto o asumimos nuevos desafios mi lider ",
        ty: 0,
        ca: sub_category.id,
    }
qlist <<
    {
        lo: "No lo tengo claro",
        up: "Lo tengo claro, Mi lider nos lo comenta siempre y nos impulsa por màs",
        mi: "en un nivel intermedio",
        ti: "Mis funciones conectan con el propòsito de la organizaciòn ",
        ty: 0,
        ca: sub_category.id,
    }
qlist <<
    {
        lo: "No lo tengo claro",
        up: "Lo vivimos en el dìa a dìa",
        mi: "en un nivel intermedio",
        ti: "Conozco el proposito organizacional y lo vivimos en el dìa gracias a la gestiòn de mi lider",
        ty: 0,
        ca: sub_category.id,
    }


#crear sub categoria
sub_category = Category.create(name: "Lider Organizacional - Ejecuta con Efectividad", parent: parent_category, weight: 1 )
pp sub_category
qlist << 
    {
        lo: "Nos indica qué debemos hacer y para cuando debe estar listo",
        up: "Nos involucra en la forma de conseguir resultados, escucha nuestras propuestas, nos compromete y motiva",
        mi: "en un nivel intermedio",
        ti: "Cuando iniciamos un proyecto mi lider ",
        ty: 0,
        ca: sub_category.id,
    }
qlist << 
    {
        lo: "mi lider tiende a conocer que me motiva",
        up: "Mi lider sabe como motivarnos al equipo y a mi y maximizar nuestro  potencial",
        mi: "en un nivel intermedio",
        ti: "Cuando hablamos de motivaciòn",
        ty: 0,
        ca: sub_category.id,
    }
qlist << 
    {
        lo: "Mi lider tiende a frustrarse ",
        up: "Impulsa el trabajo colaborativo y encuentra caminos para accionar",
        mi: "en un nivel intermedio",
        ti: "Cuando los proyectos o iniciativas no avanzan al ritmo que esperamos",
        ty: 0,
        ca: sub_category.id,
    }
qlist << 
    {
        lo: "Invertimos todos los recursos disponibles y no prevee la organizaciòn del tiempo del equipo",
        up: "Organiza los presupuestos, el tiempo y dedicaciòn de los equipos asegurandoel mejor manejo",
        mi: "en un nivel intermedio",
        ti: "La visiòn de mi lider sobre el uso de recursos (tiempo y presupuesto)",
        ty: 0,
        ca: sub_category.id,
    }


#crear sub categoria
sub_category = Category.create(name: "Lider Organizacional - Conecta los logros con el propòsito", parent: parent_category, weight: 1 )
pp sub_category
qlist << 
    {
        lo: "No es muy clara. ",
        up: "Es muy genuina y esta presente en sus interacciones",
        mi: "en un nivel intermedio",
        ti: "La conexiòn de mi lider con el proposito",
        ty: 0,
        ca: sub_category.id,
    }
qlist << 
    {
        lo: "Nos indica la tarea a realizar y los tiempo para cumplirlos",
        up: "Nos comparte la visiòn del proyecto, nos indica nuestra responsabilidad y como nos acerca a seguir viviendo nuestro proposito",
        mi: "en un nivel intermedio",
        ti: "Cuando mi lider propone nuevos proyectos",
        ty: 0,
        ca: sub_category.id,
    }
qlist << 
    {
        lo: "De lo que realiza nuestra àrea y esperan de nosotros en el corto plazo",
        up: "De la organizaciòn y nuestra àrea , conecta nuestra responsabilidad y lo que se espera de nosotros en el corto y largo plazo",
        mi: "en un nivel intermedio",
        ti: "Mi lider nos brinda claridad",
        ty: 0,
        ca: sub_category.id,
    }
qlist << 
    {
        lo: "Asegurar que el equipo sepa lo que tiene que hacer",
        up: "Asegurar que el equipo sepa lo que tiene que hacer e influencia en las otras àreas; no solo alinea al equipo directo sino a todos los equipos involucrados.",
        mi: "en un nivel intermedio",
        ti: "El alineamiento para mi lider es",
        ty: 0,
        ca: sub_category.id,
    }
















qlist.each do |q| 
    index = index.next
    pp index
    option = Option.create(
        upper_option: q[:up], 
        lower_option: q[:lo],
        middle_option: q[:mi])
    pp option
    q1 = Question.create(
                    title: q[:ti], 
                    category_id: q[:ca], 
                    test: test1, 
                    weight: 1, 
                    option: option, 
                    question_type: q[:ty], 
                    index: index
        )
    pp q1
end


































UserTest.create(
    user_id: 1,
    test_id: 1,
    evaluated_id: 1,
    status: 0,
    token:  SecureRandom.hex(16)
)
UserTest.create(
    user_id: 2,
    test_id: 1,
    evaluated_id: 1,
    status: 0,
    token:  SecureRandom.hex(16)
)
UserTest.create(
    user_id: 3,
    test_id: 1,
    evaluated_id: 1,
    status: 0,
    token:  SecureRandom.hex(16)
)

pp "terminado"

# sub_category2 = Category.create(name: "Ejecuta con efectividad", parent: parent_category, weight: 0.4 )
# sub_category3 = Category.create(name: "Cumple con responsabilidad", parent: parent_category, weight: 0.2 )

# q2 = Question.create(title: "pregunta 2"+ question_details, category: sub_category, test: test1, weight: 1, option: option, question_type: 0, index: 2)
# q3 = Question.create(title: "pregunta 3"+ question_details, category: sub_category2, test: test1, weight: 1, option: option2, question_type: 0, index: 3)
# q4 = Question.create(title: "pregunta 1"+ question_details, category: sub_category2, test: test2, weight: 1, question_type: 1, index: 1)

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
# sub2_description1 = Description.create(result: sub2_result, title: "sub2 result 0 to 50", body: "the body")
# sub2_description2 = Description.create(result: sub2_result2, title: "sub2 result 51 to 100", body: "the body")



# parent_category = Category.create(name: "Crea Vinculos genuinos", weight: 1)
# sub_category = Category.create(name: "crea seguridad psicologica", parent: parent_category, weight: 0.5 )
# sub_category2 = Category.create(name: "Desarrolla confianza", parent: parent_category, weight: 1 )
# option = Option.create(upper_option: "Muy ansioso", lower_option: "En paz conmigo mismo")
# option2 = Option.create(upper_option: "Responsable", lower_option: "Cero sentido de la responsabilidad")
# q1 = Question.create(title: "pregunta 1"+ question_details, category: sub_category, test: test1, weight: 1, option: option, question_type: 0, index: 4 )
# q2 = Question.create(title: "pregunta 2"+ question_details, category: sub_category, test: test1, weight: 1, question_type: 1, index: 5)
# q3 = Question.create(title: "pregunta 3"+ question_details, category: sub_category2, test: test1, weight: 1, question_type: 1, index: 6)

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
# sub2_description1 = Description.create(result: sub2_result, title: "sub2 result 0 to 50", body: "the body")
# sub2_description2 = Description.create(result: sub2_result2, title: "sub2 result 51 to 100", body: "the body")
# require 'securerandom'


# UserTest.create(
#     user_id: 1,
#     test_id: 1,
#     evaluated_id: 1,
#     status: 0,
#     token:  SecureRandom.hex(16)
# )

# # questions = boss.user_tests.first.test.questions

# # questions.each do |q|
# #     UserQuestion.create(user: member, question: q, evaluation: rand(10))
# # end

# #asignar encuesta
# #esto sería en el endpoint 

# UserTest.create(
#     user_id: 2,
#     test_id: 1,
#     evaluated_id: 1,
#     status: 1,
#     token:  SecureRandom.hex(16)
# )

# # questions = member.user_tests.first.test.questions

# # questions.each do |q|
# #     q.question_type == "points" ? question = UserQuestion.create(user: member, question: q, evaluation: rand(10)) :
# #     question = UserQuestion.create(user: member, question: q, evaluation: answer_text)
# # end


# #asignar encuesta
# #esto sería en el endpoint 

# UserTest.create(
#     user_id: 3,
#     test_id: 1,
#     evaluated_id: 1,
#     status: 1,
#     token:  SecureRandom.hex(16)
# )

# # questions = member2.user_tests.first.test.questions

# # questions.each do |q|
# #     UserQuestion.create(user: member2, question: q, evaluation: rand(10))
# # end


