index = 0

boss = User.create(name: "Boss", email: "boss@email.com", middlename: "Bossier", lastname: "James")
member = User.create(name: "Member 1", leader: boss, email: "univcotincodeable@gmail.com", middlename: "Employee", lastname: "James")
member2 = User.create(name: "Member 2", leader: member, email: "member2@gmail.com", middlename: "Employee", lastname: "James")
test1 = Test.create(title: "Medición de liderazgo", description: "test_description")
index = 0
qlist = []
#crear una categoria
parent_category = Category.create(name: "Entrega Resultados", weight: 1)
pp parent_category
result = Result.create( category_id: sub_category.id, min_range: 1, max_range: 50)
description = Description.create(result_id: result.id,title: "1", body: "Presenta oportunidades en la dimensión de Entrega resultados. Esto quiere decir que existen oportunidades en 1 o en los 2 subdimensiones.")
result = Result.create( category_id: sub_category.id, min_range: 51, max_range: 65)
description = Description.create(result_id: result.id,title: "1", body: "Vienes desarrollando compartimientos que te acercan a tener como fortaleza esta dimensión. Enfócate en la constancia y consistencia en tu forma de gestionar al equipo.")
result = Result.create( category_id: sub_category.id, min_range: 66, max_range: 100)
description = Description.create(result_id: result.id,title: "1", body: "Hoy el equipo reconoce en tu forma de gestionar una fortaleza en esta dimensión. Asegura de mantener esos comportamientos y sigue retándote.")


#crear sub categoria
sub_category = Category.create(name: "Liderar a Otros - Ejecuta con Efectividad", parent_id: parent_category.id, weight: 1 )
pp sub_category

result = Result.create( category_id: sub_category.id, min_range: 1, max_range: 50)
description = Description.create(result_id: result.id,title: "1", body: "Organiza el trabajo y planifica las responsabilidades de todos los miembros del equipo.")
description = Description.create(result_id: result.id,title: "2", body: "Conecta las funciones de todos los miembros del equipo y reflexiona con ellos sobre el impacto del área.")
description = Description.create(result_id: result.id,title: "3", body: "Reflexiona sobre el uso de los recursos disponibles y propone la mejor forma de gestionarlo.")

result = Result.create( category_id: sub_category.id, min_range: 51, max_range: 65)
description = Description.create(result_id: result.id,title: "1", body: "Analiza si hay diferencias en tu forma de gestionar bajo presión o en momentos donde hay buenos resultados.")
description = Description.create(result_id: result.id,title: "2", body: "Revisa con tu equipo como ellos perciben tu planificación en momentos de estrés o presión.")
description = Description.create(result_id: result.id,title: "3", body: "Reflexiona como es tu gestión de los recursos disponibles.")

result = Result.create( category_id: sub_category.id, min_range: 66, max_range: 100)
description = Description.create(result_id: result.id,title: "1", body: "Pide feedback a tus reportes y clientes sobre las formas y tiempos en las entregas de los proyectos o información e identifica caminos que puedan ser mejores.")
description = Description.create(result_id: result.id,title: "2", body: "Analiza con tu equipo si las responsabilidades son entregadas en forma y si se reconoce el impacto de la función individual y el impacto del equipo en las demás áreas y organización.")
description = Description.create(result_id: result.id,title: "3", body: "Reflexiona sobre la gestión de recursos y si podemos generar eficiencias en las formas..")

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
sub_category = Category.create(name: "Liderar a Otros - Conecta los logros con el propósito", parent_id: parent_category.id, weight: 1 )
pp sub_category


result = Result.create( category_id: sub_category.id, min_range: 1, max_range: 50)
description = Description.create(result_id: result.id,title: "1", body: "Acércate al propósito organizacional y esfuérzate en entenderlo.")
description = Description.create(result_id: result.id,title: "2", body: "Analiza cómo impactas desde tu gestión con el propósito organizacional.")
description = Description.create(result_id: result.id,title: "3", body: "Invierte tiempo en conversar con tu equipo sobre el propósito organizacional y las responsabilidades del área")
description = Description.create(result_id: result.id,title: "4", body: "Asegúrate que los miembros de tu equipo conozcan bien el propósito y la conexión con su función.")

result = Result.create( category_id: sub_category.id, min_range: 51, max_range: 65)
description = Description.create(result_id: result.id,title: "1", body: "Reflexiona sobre tu conocimiento y entendimiento del propósito organizacional, analiza que significa lo que queremos conseguir como organización.")
description = Description.create(result_id: result.id,title: "2", body: "Genera espacios con tu equipo para hablar del propósito y como desde el área contribuyen")

result = Result.create( category_id: sub_category.id, min_range: 66, max_range: 100)
description = Description.create(result_id: result.id,title: "1", body: "Invita al equipo a reflexionar sobre el impacto del área en el logro del propósito organizacional.")
description = Description.create(result_id: result.id,title: "2", body: "Compromete al equipo a lograr y dar visibilidad del impacto y genera un plan de trabajo e invita a otras áreas hacer lo mismo.")
description = Description.create(result_id: result.id,title: "3", body: "Se un agente de cambio participa y se vocal con el propósito organizacional en tus interacciones con otras áreas.")

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
sub_category = Category.create(name: "Lider Organizacional - Ejecuta con Efectividad", parent_id: parent_category.id, weight: 1 )
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
sub_category = Category.create(name: "Lider Organizacional - Conecta los logros con el propòsito", parent_id: parent_category.id, weight: 1 )
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





#crear una categoria
###############################################################################################################
###############################################################################################################
###############################################################################################################
###############################################################################################################
parent_category = Category.create(name: "Genera vinculos genuinos", weight: 1)



#crear sub categoria
sub_category = Category.create(name: "Liderar a otros - seguridad Psicológica y bienestar", parent_id: parent_category.id, weight: 1 )
pp sub_category
qlist <<{
            lo: "Mi lìder propone buenas alternativas y caminos de acción",
            up: "Siento que podemos aportar ideas para definir posturas y  un marco de acción",
            mi: "en un nivel intermedio",
            ti: "Cuando tenemos que abordar problemas o nuevas situaciones",
            ty: 0,
            ca: sub_category.id,
        }
qlist <<{
            lo: "Siempre prevalecen las de mi lider",
            up: "Siento que mis ideas y opiniones son valoradas por mi lider",
            mi: "en un nivel intermedio",
            ti: "Cuando tenemos diversas ideas en el equipo",
            ty: 0,
            ca: sub_category.id,
        }
qlist <<{
            lo: "Se desarrollan en base a la necesidad ",
            up: "son genuinas, basadas en el respeto y trascienden la función",
            mi: "en un nivel intermedio",
            ti: "La interacciòn de mi lider con otras áreas",
            ty: 0,
            ca: sub_category.id,
        }
qlist <<{
            lo: "prefiere un perfil de escucha y canalizar nuestras opiniones en el foro",
            up: "Me impulsa a dar mi punto de vista, manifestar si estoy de acuerdo o en desacuerdo con lo planteado.",
            mi: "en un nivel intermedio",
            ti: "en reuniones con otras áreas mi lider",
            ty: 0,
            ca: sub_category.id,
        }
#crear sub categoria
sub_category = Category.create(name: "Liderar a otros - Desarrollo de talento", parent_id: parent_category.id, weight: 1 )
pp sub_category
qlist <<{
            lo: "solo cuando los procesos lo demandan",
            up: "De forma constante y oportuna.",
            mi: "en un nivel intermedio",
            ti: "Recibo feedback de mi lider",
            ty: 0,
            ca: sub_category.id,
        }
qlist <<{
            lo: "Es orientado a la tarea y qué cosas debo hacer diferente",
            up: "Esta relacionado a como seguir desarrollandome, enfocado en competencias",
            mi: "en un nivel intermedio",
            ti: "El feedback de que recibo de mi lider",
            ty: 0,
            ca: sub_category.id,
        }
qlist <<{
            lo: "Mi lider me dice que debo mejorar ",
            up: "Mi lider me acompaña y me ayuda a construir un plan de desarrollo ",
            mi: "en un nivel intermedio",
            ti: "Cuando tengo  una brecha en mi desempeño",
            ty: 0,
            ca: sub_category.id,
        }
qlist <<{
            lo: "Mi lider a veces me reconoce el buen trabajo",
            up: "Mi lider reconoce el trabajo y nos impulsa a más",
            mi: "en un nivel intermedio",
            ti: "Cuando estoy haciendo las cosas bien",
            ty: 0,
            ca: sub_category.id,
        }



#crear sub categoria
sub_category = Category.create(name: "Lider organizacional - seguridad Psicológica y bienestar", parent_id: parent_category.id, weight: 1 )
pp sub_category
qlist <<{
            lo: "Mi lìder nos transmite su visiòn y hay poca flexibilidad para ver otras posibilidades. ",
            up: "Nos invita a pensar fuera de la caja, escucha nuestras ideas y las reta",
            mi: "en un nivel intermedio",
            ti: "Cuando tenemos oportunidades de crear cosas nuevas",
            ty: 0,
            ca: sub_category.id,
        }
qlist <<{
            lo: "Mi lìder siempre termina teniendo la razòn",
            up: "Mi lider construye sobre las ideas del equipo, logrando encontrar alternativas muy potentes",
            mi: "en un nivel intermedio",
            ti: "Cuando tenemos diversas ideas en el equipo",
            ty: 0,
            ca: sub_category.id,
        }
qlist <<{
            lo: "Se desarrollan en base a la necesidad ",
            up: "son genuinas, basadas en el respeto ",
            mi: "en un nivel intermedio",
            ti: "La relaciòn de mi lider con otras àreas de la organizaciòn ",
            ty: 0,
            ca: sub_category.id,
        }
qlist <<{
            lo: "Mi lider busca identificar las causas",
            up: "Generamos aprendizajes, reconoce que pudo hacer diferente y nos da feedback",
            mi: "en un nivel intermedio",
            ti: "Cuando cometemos un error",
            ty: 0,
            ca: sub_category.id,
        }


#crear sub categoria
sub_category = Category.create(name: "Lider organizacional - desarrollo de talento", parent_id: parent_category.id, weight: 1 )
pp sub_category
qlist <<{
            lo: "Hacer mejor mi trabajo",
            up: "Evolucionar como profesional y persona. Identifico mis oportunidades pero tambien soy conciente de mis fortalezas. ",
            mi: "en un nivel intermedio",
            ti: "El feedback que me da mi lider me permite",
            ty: 0,
            ca: sub_category.id,
        }
qlist <<{
            lo: "En algunas oportunidades",
            up: "Siempre esta dispuesto a retarme y darme desafios que me ayuden a crecer",
            mi: "en un nivel intermedio",
            ti: "Mi lider orienta mi desarrollo profesional",
            ty: 0,
            ca: sub_category.id,
        }
qlist <<{
            lo: "No tengo tanta claridad, mi lider me da feedback sobre las funciones que realizo y como hacerlas mejor. ",
            up: "Si, mi lider me acompaña en mi desarrollo ",
            mi: "en un nivel intermedio",
            ti: "Tengo claro que debo desarrollar para seguir creciendo en la organizaciòn",
            ty: 0,
            ca: sub_category.id,
        }
qlist <<{
            lo: "Mi lider a veces me reconoce el buen trabajo",
            up: "Mi lider reconoce el trabajo y nos impulsa a màs ",
            mi: "en un nivel intermedio",
            ti: "Cuando estoy haciendo las cosas bien",
            ty: 0,
            ca: sub_category.id,
        }





#crear una categoria
###############################################################################################################
###############################################################################################################
###############################################################################################################
###############################################################################################################
parent_category = Category.create(name: "Construye y cuestiona el futuro", weight: 1)
#crear sub categoria
sub_category = Category.create(name: "Liderar a otros - reta el status quo", parent_id: parent_category.id, weight: 1 )
pp sub_category
qlist <<{
            lo: "Busca los caminos conocidos",
            up: "Nos impulsa a probar caminos nuevos",
            mi: "en un nivel intermedio",
            ti: "Cuando mi lider cuando debe resolver un problema",
            ty: 0,
            ca: sub_category.id,
        }
qlist <<{
            lo: "Pocas veces",
            up: "Analiza el contexto, y toma riesgos calculados. ",
            mi: "en un nivel intermedio",
            ti: "Mi lider toma riesgos",
            ty: 0,
            ca: sub_category.id,
        }
qlist <<{
            lo: "Mi lider analiza las variables y toma decisiones basado en experiencias pasadas",
            up: "Mi lider nos involucra, plantea el desafio y exploramos aspectos conocidos y nos invita a ir màs alla descubriendo nuevas alternativas",
            mi: "en un nivel intermedio",
            ti: "Cuando se trata de tomar una decisiòn",
            ty: 0,
            ca: sub_category.id,
        }
qlist <<{
            lo: "Mi lider pone en evidencia que error cometimos y asegura que no lo volvamos a cometer",
            up: "Mi lider reconoce el esfuerzo, busca generar aprendizajes y nos compromete a seguir exigiendonos. ",
            mi: "en un nivel intermedio",
            ti: "Cuando las cosas no salen bien",
            ty: 0,
            ca: sub_category.id,
        }

#crear sub categoria
sub_category = Category.create(name: "Liderar a otros - Actitud emprendedora", parent_id: parent_category.id, weight: 1 )
pp sub_category
qlist <<{
            lo: "Mi lider nos dice que debemos hacer",
            up: "Mi lider fomenta que traigamos ideas diferentes y nos ayuda a llevarlas a cabo",
            mi: "en un nivel intermedio",
            ti: "Cuando queremos probar hacer las cosas diferente",
            ty: 0,
            ca: sub_category.id,
        }
qlist <<{
            lo: "Es muy enfocado a la tarea",
            up: "Es cercano, asegura que sepamos què hacer, como hacerlo y como nos estamos sintiendo",
            mi: "en un nivel intermedio",
            ti: "El acompañamiento de mi lider en los proyectos",
            ty: 0,
            ca: sub_category.id,
        }
qlist <<{
            lo: "Mi lider se pone a la defensiva y pone excusas ",
            up: "Es muy abierto a las sugerencias y escucha las opiniones de los demàs ",
            mi: "en un nivel intermedio",
            ti: "Cuando las àreas nos piden que hagamos las cosas diferentes",
            ty: 0,
            ca: sub_category.id,
        }
qlist <<{
            lo: "Probamos la soluciòn directo con el usario",
            up: "Mi lider asegura que probemos en pequeño, iteremos antes de lanzar la soluciòn",
            mi: "en un nivel intermedio",
            ti: "Cuando lanzamos nuevas soluciones",
            ty: 0,
            ca: sub_category.id,
        }
#crear sub categoria
sub_category = Category.create(name: "Lider organizacional - Reta el status quo", parent_id: parent_category.id, weight: 1 )
pp sub_category
qlist <<{
            lo: "Busca los caminos conocidos",
            up: "Nos impulsa a probar caminos nuevos y nos acompaña ",
            mi: "en un nivel intermedio",
            ti: "Mi lider cuando debe resolver un problema",
            ty: 0,
            ca: sub_category.id,
        }
qlist <<{
            lo: "Aseguremos que se mantenga asi. ",
            up: "Siempre puede ser mejor",
            mi: "en un nivel intermedio",
            ti: "Según mi lider cuando algo esta bien",
            ty: 0,
            ca: sub_category.id,
        }
qlist <<{
            lo: "Tiene un rol pasivo, no se involucra a menos que su funciòn este inmersa",
            up: "Participa reconociendo las cosas que debemos mejorar, en que somos buenos y se pone al servicio",
            mi: "en un nivel intermedio",
            ti: "Cuando debemos generar aprendizajes como organizaciòn",
            ty: 0,
            ca: sub_category.id,
        }
qlist <<{
            lo: "A mi lider le cuesta ver caminos distintos a los usuales",
            up: "Mi lider se compromete con analizar y proponer soluciones diferentes, nos impulsa a cuestionar y pensar màs allà",
            mi: "en un nivel intermedio",
            ti: "Cuando debemos generar transformaciones a los procesos que gestionamos",
            ty: 0,
            ca: sub_category.id,
        }


#crear sub categoria
sub_category = Category.create(name: "Lider organizacional - Actitud emprendedora", parent_id: parent_category.id, weight: 1 )
pp sub_category
qlist <<{
            lo: "Mi lìder se estresa y se centra en los errores",
            up: "Mi lider nos invita a la reflexiòn, aprender y nos acompaña en el manejo de las emociones",
            mi: "en un nivel intermedio",
            ti: "Cuando las cosas no salen como esperamos",
            ty: 0,
            ca: sub_category.id,
        }
qlist <<{
            lo: "En algunas ocasiones",
            up: "Siempre ",
            mi: "en un nivel intermedio",
            ti: "Me siento respaldado por mi lider",
            ty: 0,
            ca: sub_category.id,
        }
qlist <<{
            lo: "Mi lider se centra en evitar que volvamos  a cometer los errores, nos encamina a mejorar en la funciòn",
            up: "Nos invita a reflexionar y navegar nuestras emociones y desarrollar perseverancia ",
            mi: "en un nivel intermedio",
            ti: "Cuando las cosas no salen bien",
            ty: 0,
            ca: sub_category.id,
        }
qlist <<{
            lo: "Probamos la soluciòn directo con el usuario",
            up: "Mi lider asegura que probemos en pequeño, iteremos antes de lanzar la soluciòn",
            mi: "en un nivel intermedio",
            ti: "Cuando lanzamos nuevas soluciones",
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
    user_id: 2,
    test_id: 1,
    evaluated_id: 2,
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


