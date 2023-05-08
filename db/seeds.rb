
@test1 = Test.create(title: "Medición de liderazgo", description: "test_description")
@index = 1;


users = [
    {name: "Boss", email: "irjovama@gmail.com", middlename: "Bossier", lastname: "James"},
    {name: "Member 1", email: "univcotincodeable@gmail.com", middlename: "Employee", lastname: "James"},
    {name: "Member 2", email: "member2@gmail.com", middlename: "Employee", lastname: "James"}
]

#Need to change seed file for fitting with new ERD
#Leader_id column doesn't longer exist in User table. Now it exists in the leadership column
leader = nil
users.each do |u|
    u[:leader_id] = leader;
    user = User.create(u)
    if user
        p "user created #{user}"
        unless leader.nil?
            ut = UserTest.create(
                user: user,
                test: @test1,
                evaluated_id: leader,
                status: 0,
                token: SecureRandom.hex(16)
            )
            p "Test invitation created #{ut}" unless ut.errors.nil?
            p ut.errors if ut.errors.nil?
        end
        leader = user.id
    else
        p leader.errors
    end
end
ut = UserTest.create(
    user_id: 1,
    test_id: 1,
    evaluated_id: 1,
    status: 0,
    token: SecureRandom.hex(16)
)
categories = [
    {
        name: "General", 
        weight: 1, 
        results: [
            {
                min_range: 1,
                max_range: 50,
                descriptions: [
                    {
                        title: "body",
                        body: "Aún tienes oportunidades para seguir fortaleciendo mindsets y comportamientos de liderazgo. El modelo de liderazgo de la organización nos invita a reconocer que debemos trabajar desde 3 dimensiones: entrega resultados, genera vínculos genuinos y cuestiona y construye el futuro",
                    },
                    {
                        title: "1",
                        body: " Impulsa un trabajo colaborativo que conecte responsabilidades en el equipo y se reconozca el resultado global.",
                    },
                    {
                        title: "2",
                        body: "Genera espacios con tu equipo para tener conversaciones de valor, no solo enfocadas en el corto plazo y tareas a cumplir sino a conectar.",
                    },
                    {
                        title: "3",
                        body: "Cuestiona, enfócate en imaginar y diseñar caminos no conocidos que nos lleven a seguir aprendiendo y generar resultados.",
                    }
                ]
            },
            {
                min_range: 51,
                max_range: 65,
                descriptions: [
                    {
                        title: "body",
                        body: "Sigue en el camino de evolución de tu liderazgo, enfócate en la constancia de aquellos comportamientos que te posicionan como un líder que entrega resultados, genera vínculos genuinos y construye el futuro.",
                    },
                    {
                        title: "1",
                        body: "Asegura la constancia en trabajar de forma colaborativa con tu equipo y otras áreas de la organización.",
                    },
                    {
                        title: "2",
                        body: "Recuerda que el feedback no solo se debe entregar cuando los procesos nos llevan a ello. El feedback debe ser claro y oportuno. Genera conversaciones de valor de forma constante.",
                    },
                    {
                        title: "3",
                        body: "Sigue retando a tu equipo en hacer las cosas diferente, enfócate no solo en hacer sino en generar reflexión y aprendizajes de lo bueno y no tan bueno.",
                    }
                ]
            },
            {
                min_range: 66,
                max_range: 100,
                descriptions: [
                    {
                        title: "body",
                        body: "Recuerda que el liderazgo es una competencia que nunca dejamos de aprender. Hoy se reconoce en tu repertorio de comportamientos conductas que te posicionan como un líder que entrega resultados, genera vínculos genuinos y cuestiona y construye el futuro.",
                    },
                    {
                        title: "1",
                        body: "Sigue enfocándote en la forma y el fondo de los resultados que entregas. Recuerda seguir conectando a tu equipo y otras áreas. Siempre con el objetivo mayor que trasciende a la función.",
                    },
                    {
                        title: "2",
                        body: "Continúa empujando conversaciones y momentos individuales con tu equipo, involúcrate en su desarrollo. Enfócate en lo bueno y las oportunidades.",
                    },
                    {
                        title: "3",
                        body: "Pon en practica los aprendizajes sobre cuando las cosas no salen bien. Sigue posicionando el poder tomar riesgos, aprender y generar resultados.",
                    }
                ]
            },
        ],
        sub_categories: [
            {
                name: "Entrega de resultados",
                weight: 1,
                description: "Esta dimensión de liderazgo está enfocada en asegurar la forma y el camino que transita un líder para conseguir las metas trazadas como organización. Tiene dos sub dimensiones",
                results: [],
                sub_categories: [
                    {
                        name: "Liderar a otros",
                        weight: 1,
                        results: [
                            {
                                min_range: 1,
                                max_range: 50,
                                descriptions: [
                                    {
                                        title: "body",
                                        body: "Presenta oportunidades en la dimensión de Entrega resultados. Esto quiere decir que existen oportunidades en 1 o en los 2 subdimensiones",
                                    }
                                ]
                            },
                            {
                                min_range: 51,
                                max_range: 65,
                                descriptions: [
                                    {
                                        title: "body",
                                        body: "Vienes desarrollando compartimientos que te acercan a tener como fortaleza esta dimensión. Enfócate en la constancia y consistencia en tu forma de gestionar al equipo",
                                    }
                                ]
                            },
                            {
                                min_range: 66,
                                max_range: 100,
                                descriptions: [
                                    {
                                        title: "body",
                                        body: "Hoy el equipo reconoce en tu forma de gestionar una fortaleza en esta dimensión. Asegura de mantener esos comportamientos y sigue retándote",
                                    }
                                ]
                            },
                        ],
                        sub_categories: [
                            {
                                name: "Ejecuta con efectividad",
                                weight: 1,
                                description: "hace referencia al cómo dirijo a mi equipo y cómo hago un buen uso de los recursos que tenemos a disposición",
                                questions: [
                                    {title: 'Para conseguir los resultados deseados mi lìder', lower: 'Da tareas especificas sin asegurar alineamiento y conexiòn como equipo', mid: 'comportamiento intermedio', upper: 'Se enfoca en asegurar que todos entendemos el objetivo y nos organiza para todos contribuir y lograrlo.'},
                                    {title: 'Al asignarme tareas mi lider ', lower: 'Mi líder me da confianza, me indica qué debo hacer y para cuándo debe estar listo', mid: 'comportamiento intermedio', upper: 'Mi lider reconoce mis fortalezas, asegurando que entiendo el objetivo y como impacto en un logro mayor'},
                                    {title: 'En relaciòn a la organizaciòn de las funciones y responsabilidades del equipo', lower: 'Tengo claro que hacer pero no reconozco mi impacto en el trabajo de los demàs miembros del equipo', mid: 'comportamiento intermedio', upper: 'Estan muy claras y todos en el equipo sabemos què hace cada uno y como nos complementamos'},
                                    {title: 'Cuando se trata de gestionar los recursos que tenemos disponibles ', lower: 'El lider invertierte todos los recursos disponibles o excede lo previsto con tal de lograr el objetivo trazado ', mid: 'comportamiento intermedio', upper: 'El lìder asegura la inversiòn adecuada cuidando los presupuestos y maximizandolos. '},
                                ],
                                results: [
                                    {
                                        min_range: 0,
                                        max_range: 50,
                                        descriptions: [
                                            {title: "1", body: "Organiza el trabajo y planifica las responsabilidades de todos los miembros del equipo"},
                                            {title: "2", body: "Conecta las funciones de todos los miembros del equipo y reflexiona con ellos sobre el impacto del área"},
                                            {title: "3", body: "Reflexiona sobre el uso de los recursos disponibles y propone la mejor forma de gestionarlo"},
                                        ]
                                    },
                                    {
                                        min_range: 51,
                                        max_range: 65,
                                        descriptions: [
                                            {title: "1", body: "Analiza si hay diferencias en tu forma de gestionar bajo presión o en momentos donde hay buenos resultados"},
                                            {title: "2", body: "Revisa con tu equipo como ellos perciben tu planificación en momentos de estrés o presión"},
                                            {title: "3", body: "Reflexiona como es tu gestión de los recursos disponibles"},
                                        ]
                                    },
                                    {
                                        min_range: 66,
                                        max_range: 100,
                                        descriptions: [
                                            {title: "1", body: "Pide feedback a tus reportes y clientes sobre las formas y tiempos en las entregas de los proyectos o información e identifica caminos que puedan ser mejores"},
                                            {title: "2", body: "Analiza con tu equipo si las responsabilidades son entregadas en forma y si se reconoce el impacto de la función individual y el impacto del equipo en las demás áreas y organización"},
                                            {title: "3", body: "Reflexiona sobre la gestión de recursos y si podemos generar eficiencias en las formas"},
                                        ]
                                    }
                                ]
                            },
                            {
                                name: "Conecta los logros con el propósito",
                                weight: 1,
                                description: "hace referencia a que tan internalizado tenemos el propósito organizacional y cómo lo conectamos con la función que lideramos",
                                questions: [
                                    {title: 'Cuando se trata del proposito de la organizaciòn mi lider', lower: 'No lo tiene presente.', mid: 'comportamiento intermedio', upper: 'Vive el proposito en cada cosa que hacemos '},
                                    {title: 'Cuando iniciamos un proyecto o asumimos nuevos desafios mi lider ', lower: 'No necesariamente lo conecta con como lograr lo que nos planteamos nos acerca a cumplir nuestro proposito.', mid: 'comportamiento intermedio', upper: 'Comparte con el equipo como el logro del proyecto o el nuevo desafio nos acerca a vivir nuestro proposito.'},
                                    {title: 'Mis funciones conectan con el propòsito de la organizaciòn ', lower: 'No lo tengo claro', mid: 'comportamiento intermedio', upper: 'Lo tengo claro, Mi lider nos lo comenta siempre y nos impulsa por màs '},
                                    {title: 'La gestiòn de mi lider ha sido clave para incorporar el propòsito organizacional a nuestras funciones', lower: 'No tengo visibilidad que la gestiòn de mi lìder incorpore el pròposito organizacional', mid: 'comportamiento intermedio', upper: 'Lo vivimos en el dìa a dìa'},
                                ],
                                results: [
                                    {
                                        min_range: 0,
                                        max_range: 50,
                                        descriptions: [
                                            {title: '1', body: '· Acércate al propósito organizacional y esfuérzate en entenderlo.'},
                                            {title: '2', body: '· Analiza cómo impactas desde tu gestión con el propósito organizacional.'},
                                            {title: '3', body: '· Invierte tiempo en conversar con tu equipo sobre el propósito organizacional y las responsabilidades del área'},
                                            {title: '4', body: '· Asegúrate que los miembros de tu equipo conozcan bien el propósito y la conexión con su función.'},

                                        ]
                                    },
                                    {
                                        min_range: 51,
                                        max_range: 65,
                                        descriptions: [
                                            {title: '1', body: '· Reflexiona sobre tu conocimiento y entendimiento del propósito organizacional, analiza que significa lo que queremos conseguir como organización.'},
                                            {title: '2', body: '· Genera espacios con tu equipo para hablar del propósito y como desde el área contribuyen.'},                                            
                                        ]
                                    },
                                    {
                                        min_range: 66,
                                        max_range: 100,
                                        descriptions: [
                                            {title: '1', body: '· Invita al equipo a reflexionar sobre el impacto del área en el logro del propósito organizacional.'},
                                            {title: '2', body: '· Compromete al equipo a lograr y dar visibilidad del impacto y genera un plan de trabajo e invita a otras áreas hacer lo mismo.'},
                                            {title: '3', body: '· Se un agente de cambio participa y se vocal con el propósito organizacional en tus interacciones con otras áreas.'},
                                        ]
                                    }
                                ]
                            }
                        ]
                    },
                    {
                        name: "Lider Organizacional",
                        weight: 1,
                        results: [
                            {
                                min_range: 1,
                                max_range: 50,
                                descriptions: [
                                    {title: 'body', body: 'Presenta oportunidades la dimensión de Entrega resultados. Esto quiere decir que existen oportunidades en 1 o en los 2 subdimensiones.'},
                                ]
                            },
                            {
                                min_range: 51,
                                max_range: 65,
                                descriptions: [
                                    {title: 'body', body: 'Vienes desarrollando compartimientos que te acercan a tener como fortaleza esta dimensión. Enfócate en la constancia y consistencia en tu forma de gestionar al equipo.'},
                                ]
                            },
                            {
                                min_range: 66,
                                max_range: 100,
                                descriptions: [
                                    {title: 'body', body: 'Hoy el equipo reconoce en tu forma de gestionar una fortaleza en esta dimensión. Asegura de mantener esos comportamientos y sigue retándote.'},
                                ]
                            },
                        ],
                        sub_categories: [
                            {
                                name: "Ejecuta con efectividad",
                                weight: 1,
                                description: "hace referencia al cómo dirijo a mi equipo y cómo hago un buen uso de los recursos que tenemos a disposición",
                                questions: [
                                    {title: 'Cuando iniciamos un proyecto mi lider ', lower: 'Nos indica qué debemos hacer y para cuando debe estar listo', mid: 'comportamiento intermedio', upper: 'Nos involucra en la forma de conseguir resultados, escucha nuestras propuestas, nos compromete y motiva '},
                                    {title: 'Cuando hablamos de motivaciòn', lower: 'mi lider por momentos reconoce que me motiva', mid: 'comportamiento intermedio', upper: 'Mi lider sabe como motivarnos (al equipo y a mi) y maximizar nuestro  potencial'},
                                    {title: 'Cuando los proyectos o iniciativas no avanzan al ritmo que esperamos', lower: 'Mi lider tiende a frustrarse ', mid: 'comportamiento intermedio', upper: 'Impulsa el trabajo colaborativo y encuentra caminos para accionar '},
                                    {title: 'Respecto a la visiòn de mi lider sobre el uso de recursos (tiempo y presupuesto)', lower: 'Invertimos todos los recursos disponibles y no prevee la organizaciòn del tiempo del equipo', mid: 'comportamiento intermedio', upper: 'Organiza los presupuestos, el tiempo y dedicaciòn de los equipos asegurandoel mejor manejo'},

                                ],
                                results: [
                                    {
                                        min_range: 0,
                                        max_range: 50,
                                        descriptions: [
                                            {title: '1', body: '· Reflexiona sobre el decante de las responsabilidades de tu equipo. Asegura que siempre conozcan el impacto más allá de su función.'},
                                            {title: '2', body: '· Analiza si conoces qué motiva a tu equipo y si lo estas haciendo bien. La motivación es una pieza clave para movilizar y lograr resultados.'},
                                            {title: '3', body: '· Reflexiona sobre tu manejo de la frustración cuando las cosas no van como esperamos. Analiza como reaccionas en esas situaciones y plantea formas distintas de gestionar dichos momentos.'},
                                            {title: '4', body: '· Revisa como ha sido la gestión de recursos últimamente, plantea un plan para ser más eficientes y diséñalo con tu equipo.'},
                                        ]
                                    },
                                    {
                                        min_range: 51,
                                        max_range: 65,
                                        descriptions: [
                                            {title: '1', body: '· Asegura que todos los miembros del equipo conocen su función, impacto y resultados esperados. Analiza si las formas de comunicación son claras para todos.'},
                                            {title: '2', body: '· Reflexiona con tu equipo sobre el impacto del área en los proyectos que se encuentran trabajando y analiza con ellos la importancia del rol que cumplen.'},
                                            {title: '3', body: '· Analiza si la presión por resultados o cumplimiento afecta tu gestión'},
                                            {title: '4', body: '· Plantea caminos y analiza escenarios para como poder ser mas eficiente con el uso de recursos.'},
                                        ]
                                    },
                                    {
                                        min_range: 66,
                                        max_range: 100,
                                        descriptions: [
                                            {title: '1', body: '· Sigue impulsando la planificación del equipo en responsabilidades. Asegura mantener un balance de vida adecuado del equipo.'},
                                            {title: '2', body: '· Sigue reforzando una mirada de eficiencia en el uso de recursos disponibles.'},
                                            {title: '3', body: '· Impulsa conversaciones con tu equipo y otras áreas sobre la importancia del impacto de la función y como la interdependencia de áreas impulsa una mejor gestión.'},
                                        ]
                                    }
                                ]
                            },
                            {
                                name: "Conecta los logros con el propósito",
                                weight: 1,
                                description: "hace referencia a que tan internalizado tenemos el propósito organizacional y cómo lo conectamos con la función que lideramos",
                                questions: [
                                    {title: 'La conexiòn de mi lider con el proposito', lower: 'No es muy clara. ', mid: 'comportamiento intermedio', upper: 'Es muy genuina y esta presente en sus interacciones'},
                                    {title: 'Cuando mi lider propone nuevos proyectos', lower: 'Nos indica la tarea a realizar y los tiempo para cumplirlos', mid: 'comportamiento intermedio', upper: 'Nos comparte la visiòn del proyecto, nos indica nuestra responsabilidad y como nos acerca a seguir viviendo nuestro proposito'},
                                    {title: 'Mi lider nos brinda claridad ', lower: 'De lo que realiza nuestra àrea y esperan de nosotros en el corto plazo', mid: 'comportamiento intermedio', upper: 'De la organizaciòn y nuestra àrea , conecta nuestra responsabilidad y lo que se espera de nosotros en el corto y largo plazo'},
                                    {title: 'El alineamiento para mi lider es', lower: 'Asegurar que el equipo sepa lo que tiene que hacer', mid: 'comportamiento intermedio', upper: 'Asegurar que el equipo sepa lo que tiene que hacer e influencia en las otras àreas; no solo alinea al equipo directo sino a todos los equipos involucrados. '},
                                ],
                                results: [
                                    {
                                        min_range: 0,
                                        max_range: 50,
                                        descriptions: [
                                            {title: '1', body: '· Acércate al propósito organizacional y enfuérzate en entenderlo.'},
                                            {title: '2', body: '· Analiza como impactas desde tu gestión con el propósito organizacional.'},
                                            {title: '3', body: '· Invierte tiempo en conversar con tu equipo sobre el propósito organizacional y las responsabilidades del área'},
                                            {title: '4', body: '· Asegúrate que los miembros de tu equipo conozcan bien el propósito y la conexión con su función.'},                                            
                                        ]
                                    },
                                    {
                                        min_range: 51,
                                        max_range: 65,
                                        descriptions: [
                                            {title: '1', body: '· Reflexiona sobre tu conocimiento y entendimiento del propósito organizacional, analiza que significa lo que queremos conseguir como organización.'},
                                            {title: '2', body: '· Genera espacios con tu equipo para hablar del propósito y como desde el área contribuyen.'},                                        
                                        ]
                                    },
                                    {
                                        min_range: 66,
                                        max_range: 100,
                                        descriptions: [
                                            {title: '1', body: '· Invita al equipo a reflexionar sobre el impacto del área en el logro del propósito organizacional.'},
                                            {title: '2', body: '· Compromete al equipo a lograr y dar visibilidad del impacto y genera un plan de trabajo e invita a otras áreas hacer lo mismo.'},
                                            {title: '3', body: '· Se un agente de cambio participa y se vocal con el propósito organizacional en tus interacciones con otras áreas.'},
                                        ]
                                    }
                                ]
                            }
                        ]
                    }
                ]
            },
            {
                name: "Genera vinculos genuinos",
                weight: 1,
                results: [],
                description: "Esta dimensión de liderazgo se enfoca en las relaciones que formamos al interno de la organización, no solo con el equipo directo, sino también con el resto de áreas. Además, construye sobre cómo esas relaciones, cuando se basan en la confianza y transparencia permiten sentirnos cómodos y seguros. Tiene dos subdimensiones",
                sub_categories: [
                    {
                        name: "Liderar a otros",
                        weight: 1,
                        results: [
                            {
                                min_range: 1,
                                max_range: 50,
                                descriptions: [
                                    {title: 'body', body: 'Presenta oportunidades la dimensión de Crea vínculos genuninos. Esto quiere decir que existen oportunidades en 1 o en los 2 subdimensiones.'},
                                ]
                            },
                            {
                                min_range: 51,
                                max_range: 65,
                                descriptions: [
                                    {title: 'body', body: 'Vienes desarrollando compartimientos que te acercan a tener como fortaleza esta dimensión. Enfócate en la constancia y consistencia en tu forma de gestionar al equipo.'},
                                ]
                            },
                            {
                                min_range: 66,
                                max_range: 100,
                                descriptions: [
                                    {title: 'body', body: 'Hoy el equipo reconoce en tu forma de gestionar una fortaleza en esta dimensión. Asegura de mantener esos comportamientos y sigue retándote.'},
                                ]
                            },
                        ],
                        sub_categories: [
                            {
                                name: "Seguridad psicológica y bienestar",
                                weight: 1,
                                description: "hace referencia al entorno y ambiente que genero para que las personas puedan expresar sus ideas, desafiar las ideas de otros y sentirse incluidos de manera general en las dinámicas del equipo.",
                                questions: [
                                    {title: 'Cuando tenemos que abordar problemas o nuevas situaciones', lower: 'Mi lìder propone buenas alternativas y caminos de acciòn ', mid: 'comportamiento intermedio', upper: 'Siento que podemos aportar ideas para definir posturas y  un marco de acciòn'},
                                    {title: 'Cuando tenemos diversas ideas en el equipo', lower: 'Siempre prevalecen las de mi lider ', mid: 'comportamiento intermedio', upper: 'Siento que mis ideas y opiniones son valoradas por mi lider'},
                                    {title: 'La interacciòn de mi lider con otras àreas', lower: 'Se desarrollan en base a la necesidad ', mid: 'comportamiento intermedio', upper: 'son genuinas, basadas en el respeto y trascienden la funciòn'},
                                    {title: 'en reuniones con otras àreas mi lider', lower: 'prefiere un perfil de escucha y canalizar nuestras opiniones en el foro', mid: 'comportamiento intermedio', upper: 'Me impulsa a dar mi punto de vista, manifestar si estoy de acuerdo o en desacuerdo con lo planteado. '},
                                ],
                                results: [
                                    {
                                        min_range: 0,
                                        max_range: 50,
                                        descriptions: [
                                            {title: '1', body: '· Analiza el ambiente laboral que generas. Analiza si estas permitiendo expresar a la gente sus opiniones e ideas.'},
                                            {title: '2', body: '· Reflexiona sobre tu forma de reaccionar ante los desacuerdos o ideas contrarias a las propias. Recuerda que debemos fomentar entornos donde los colaboradores puedan opinar sin sentirse cuestionados por pensar diferente.'},
                                            {title: '3', body: '· Reflexiona sobre tu apertura a tomar caminos diferentes.'},
                                            {title: '4', body: '· Analiza tu forma de actuar con otras áreas y la apertura que tienes al feedback y a tomar recomendaciones.'},
                                        ]
                                    },
                                    {
                                        min_range: 51,
                                        max_range: 65,
                                        descriptions: [
                                            {title: '1', body: '· Analiza como el ambiente laboral que generas puede cambiar en base a la presión por conseguir resultados. Recuerda que siempre debemos generar espacios donde el colaborador pueda dar su opinión.'},
                                            {title: '2', body: '· Pide feedback a tu equipo sobre tu apertura a nuevas ideas y arma un plan de trabajo.'},
                                            {title: '3', body: '· Pide feedback a otras áreas sobre que podrían hacer distinto como equipo, háblalo con tu equipo y armen juntos un plan. Recuerda generar relaciones con otras áreas y lideres en base al respeto y no necesidad.'},
                                        ]
                                    },
                                    {
                                        min_range: 66,
                                        max_range: 100,
                                        descriptions: [
                                            {title: '1', body: '· Sigue propiciando espacios que permitan expresarse, dar ideas distintas. Analiza cuales son tus comportamientos que permiten ese ambiente y tenlos muy presente en tu gestión.'},
                                            {title: '2', body: '· Las relaciones con otras áreas se basan en la confianza y respeto, se ejemplo para tu equipo.'},
                                            {title: '3', body: '· Pide feedback y ponlo en práctica.'},
                                        ]
                                    }
                                ]
                            },
                            {
                                name: "Desarrollo de talento",
                                weight: 1,
                                description: "hace referencia al espacio que dedico a desarrollar a mis equipos, no solo desde el conocimiento funcional sino desde el desarrollo de sus competencias y el acompañamiento que le brindo",
                                questions: [
                                    {title: 'Recibo feedback de mi lider', lower: 'solo cuando los procesos lo demandan', mid: 'comportamiento intermedio', upper: 'De forma constante y oportuna. '},
                                    {title: 'El feedback de que recibo de mi lider', lower: 'Es orientado a la tarea y qué cosas debo hacer diferente', mid: 'comportamiento intermedio', upper: 'Esta relacionado a como seguir desarrollandome, enfocado en competencias'},
                                    {title: 'Cuando tengo  una brecha en mi desempeño', lower: 'Mi lider me dice que debo mejorar ', mid: 'comportamiento intermedio', upper: 'Mi lider me acompaña y me ayuda a construir un plan de desarrollo '},
                                    {title: 'Cuando estoy haciendo las cosas bien', lower: 'Mi lider a veces me reconoce el buen trabajo', mid: 'comportamiento intermedio', upper: 'Mi lider reconoce el trabajo y nos impulsa a màs '},
                                ],
                                results: [
                                    {
                                        min_range: 0,
                                        max_range: 50,
                                        descriptions: [
                                            {title: '1', body: '· El feedback debe ser oportuno por ende no esperes momentos formales para compartir con tu equipo las cosas que pueden mejorarse.'},
                                            {title: '2', body: '· El feedback debe ser claro, por ello debes prepararte para tu sesión teniendo claro el comportamiento que debe ser trabajado.'},
                                            {title: '3', body: '· Recuerda que el feedback no solo es sobre lo que se debe mejorar, también sirve para reconocer los esfuerzos. El feedback puede ser individual o grupal.'},
                                        ]
                                    },
                                    {
                                        min_range: 51,
                                        max_range: 65,
                                        descriptions: [
                                            {title: '1', body: '· Practica tener conversaciones de feedback con tus equipos 1 vez al mes, prepárate para dar cosas que están haciendo bien.'},
                                            {title: '2', body: '· No te centres solo en la función. Ten conversaciones relacionadas a competencias y expectativas de crecimiento de tus equipos.'},
                                            {title: '3', body: '· Se objetivo con el desempeño del equipo, mantén estándares claros para todos, brinda feedback colectivo cuando pienses que las cosas pueden ser mejores.'},                                        
                                        ]
                                    },
                                    {
                                        min_range: 66,
                                        max_range: 100,
                                        descriptions: [
                                            {title: '1', body: '· Sigue impulsando conversaciones de valor con tu equipo, recuerda prepararte para las sesiones de feedback. Recuerda que la retroalimentación debe ser oportuna y clara.'},
                                            {title: '2', body: '· Arma un plan de desarrollo con tu equipo, acompaña y haz seguimiento.'},
                                            {title: '3', body: '· Asegúrate que estas trasladando el conocimiento a tu equipo. Plantea sesiones para asegurar que todo el equipo esta aprendiendo de su función.'},
                                        ]
                                    }
                                ]
                            }
                        ]
                    },
                    {
                        name: "Lider Organizacional",
                        weight: 1,
                        results: [
                            {
                                min_range: 1,
                                max_range: 50,
                                descriptions: [
                                    {title: 'body', body: 'Presenta oportunidades la dimensión de Entrega resultados. Esto quiere decir que existen oportunidades en 1 o en los 2 subdimensiones.'},
                                ]
                            },
                            {
                                min_range: 51,
                                max_range: 65,
                                descriptions: [
                                    {title: 'body', body: 'Vienes desarrollando compartimientos que te acercan a tener como fortaleza esta dimensión. Enfócate en la constancia y consistencia en tu forma de gestionar al equipo.'},
                                ]
                            },
                            {
                                min_range: 66,
                                max_range: 100,
                                descriptions: [
                                    {title: 'body', body: 'Hoy el equipo reconoce en tu forma de gestionar una fortaleza en esta dimensión. Asegura de mantener esos comportamientos y sigue retándote.'},
                                ]
                            },
                        ],
                        sub_categories: [
                            {
                                name: "Seguridad psicológica y bienestar",
                                weight: 1,
                                description: "hace referencia al entorno y ambiente que genero para que las personas puedan expresar sus ideas, desafiar las ideas de otros y sentirse incluidos de manera general en las dinámicas del equipo.",
                                questions: [
                                    {title: 'Cuando tenemos oportunidades de crear cosas nuevas', lower: 'Mi lìder nos transmite su visiòn y hay poca flexibilidad para ver otras posibilidades. ', mid: 'comportamiento intermedio', upper: 'Nos invita a pensar fuera de la caja, escucha nuestras ideas y las reta'},
                                    {title: 'Cuando tenemos diversas ideas en el equipo', lower: 'Mi lìder siempre termina teniendo la razòn', mid: 'comportamiento intermedio', upper: 'Mi lider construye sobre las ideas del equipo, logrando encontrar alternativas muy potentes'},
                                    {title: 'La relaciòn de mi lider con otras àreas de la organizaciòn ', lower: 'Se desarrollan en base a la necesidad ', mid: 'comportamiento intermedio', upper: 'son genuinas, basadas en el respeto '},
                                    {title: 'Cuando cometemos un error', lower: 'Mi lider busca identificar las causas', mid: 'comportamiento intermedio', upper: 'Generamos aprendizajes, reconoce que pudo hacer diferente y nos da feedback'},
                                ],
                                results: [
                                    {
                                        min_range: 0,
                                        max_range: 50,
                                        descriptions: [
                                            {title: '1', body: '· Analiza el ambiente laboral que generas. Analiza si estas permitiendo expresar a la gente sus opiniones e ideas.'},
                                            {title: '2', body: '· Reflexiona sobre tu forma de reaccionar ante los desacuerdos o ideas contrarias a las propias. Recuerda que debemos fomentar entornos donde los colaboradores puedan opinar sin sentirse cuestionados por pensar diferente.'},
                                            {title: '3', body: '· Reflexiona sobre tu apertura a tomar caminos diferentes.'},
                                            {title: '4', body: '· Analiza tu forma de actuar con otras áreas y la apertura que tienes al feedback y a tomar recomendaciones.'},
                                        ]
                                    },
                                    {
                                        min_range: 51,
                                        max_range: 65,
                                        descriptions: [
                                            {title: '1', body: '· Analiza como el ambiente laboral que generas puede cambiar en base a la presión por conseguir resultados. Recuerda que siempre debemos generar espacios donde el colaborador pueda dar su opinión.'},
                                            {title: '2', body: '· Pide feedback a tu equipo sobre tu apertura a nuevas ideas y arma un plan de trabajo.'},
                                            {title: '3', body: '· Pide feedback a otras áreas sobre que podrían hacer distinto como equipo, háblalo con tu equipo y armen juntos un plan. Recuerda generar relaciones con otras áreas y lideres en base al respeto y no necesidad.'},

                                        ]
                                    },
                                    {
                                        min_range: 66,
                                        max_range: 100,
                                        descriptions: [
                                            {title: '1', body: '· Sigue propiciando espacios que permitan expresarse, dar ideas distintas. Analiza cuáles son tus comportamientos que permiten ese ambiente y tenlos muy presente en tu gestión.'},
                                            {title: '2', body: '· Se ejemplo para tu equipo. Las relaciones con otras áreas se basan en la confianza y respeto.'},
                                            {title: '3', body: '· Pide feedback y ponlo en práctica.'},
                                        ]
                                    }
                                ]
                            },
                            {
                                name: "Desarrollo de talento",
                                weight: 1,
                                description: "hace referencia al espacio que dedico a desarrollar a mis equipos, no solo desde el conocimiento funcional sino desde el desarrollo de sus competencias y el acompañamiento que le brindo",
                                questions: [
                                    {title: 'El feedback que me da mi lider me permite', lower: 'Hacer mejor mi trabajo', mid: 'comportamiento intermedio', upper: 'Evolucionar como profesional y persona. Identifico mis oportunidades pero tambien soy conciente de mis fortalezas. '},
                                    {title: 'Mi lider orienta mi desarrollo profesional', lower: 'En algunas oportunidades', mid: 'comportamiento intermedio', upper: 'Siempre esta dispuesto a retarme y darme desafios que me ayuden a crecer'},
                                    {title: 'Tengo claro que debo desarrollar para seguir creciendo en la organizaciòn', lower: 'No tengo tanta claridad, mi lider me da feedback sobre las funciones que realizo y como hacerlas mejor. ', mid: 'comportamiento intermedio', upper: 'Si, mi lider me acompaña en mi desarrollo '},
                                    {title: 'Cuando estoy haciendo las cosas bien', lower: 'Mi lider a veces me reconoce el buen trabajo', mid: 'comportamiento intermedio', upper: 'Mi lider reconoce el trabajo y nos impulsa a màs '},
                                ],
                                results: [
                                    {
                                        min_range: 0,
                                        max_range: 50,
                                        descriptions: [
                                            {title: '1', body: '· Organiza sesiones individuales de feedback con tu equipo.'},
                                            {title: '2', body: '· Prepárate para las sesiones, organiza y ten claridad de la información. Que comportamientos deben evolucionar y reconoce aquellos que son fortaleza.'},
                                            {title: '3', body: '· Plantea conversaciones enfocadas al futuro. Que quieren desarrollar o aprender tus reportes.'},
                                            {title: '4', body: '· Prepara una sesión de reconocimiento, es importante asegurar que los equipos saben que están haciendo las cosas bien.'},                                        
                                        ]
                                    },
                                    {
                                        min_range: 51,
                                        max_range: 65,
                                        descriptions: [
                                            {title: '1', body: '· Los espacios de feedback no deben ser una vez al año. O cuando los procesos lo determinan. Plantea sesiones mensuales en donde conversen sobre competencias y conocimientos funcionales que le permitirán seguir creciendo.'},
                                            {title: '2', body: '· Enfócate en trabajar una competencia con cada miembro de tu equipo, acompáñalos en el proceso y ponte a su servicio.'},
                                            {title: '3', body: '· Asegura de trasmitir reconocimiento. Plantea sesiones mensuales de reconocimiento grupal. Celebra los esfuerzos y las cosas que se hacen bien.'},
                                    
                                        ]
                                    },
                                    {
                                        min_range: 66,
                                        max_range: 100,
                                        descriptions: [
                                            {title: '1', body: '· Continúa siendo constante con brindar el feedback de oportuna y clara. Asegura que durante las sesiones se revisen las cosas que se están haciendo bien y las cosas que deben mejorar.'},
                                            {title: '2', body: '· Ponte la meta de conocer cuales son los intereses y aspiraciones de tu equipo. Con ello plantea un plan de desarrollo trabajando una competencia. Haz el seguimiento y acompaña en el desarrollo del plan.'},
                                            {title: '3', body: '· Reconoce al equipo por las cosas que están haciendo bien y el esfuerzo invertido.'},
                                            {title: '4', body: '· Invita al equipo a que se den feedback entre ellos, mientras más integral sea la visión que tenemos de uno mismo es mejor.'},
                                        ]
                                    }
                                ]
                            }
                        ]
                    }
                ]
            },
            {
                name: "Construye y cuestiona el futuro",
                weight: 1,
                description: "Esta dimensión se enfoca en que los lìderes deben poder soñar y hacer realidad los nuevos caminos que necesitamos como organización. Cómo manejo ese proceso y qué aprendizajes genero. Tiene dos subdimensiones. ",
                results: [],
                sub_categories: [
                    {
                        name: "Liderar a otros",
                        weight: 1,
                        results: [
                            {
                                min_range: 1,
                                max_range: 50,
                                descriptions: [
                                    {
                                        title: "body",
                                        body: "Presenta oportunidades la dimensión de Cuestiona y construye el futuro. Esto quiere decir que existen oportunidades en 1 o en los 2 subdimensiones.",
                                    }
                                ]
                            },
                            {
                                min_range: 51,
                                max_range: 65,
                                descriptions: [
                                    {
                                        title: "body",
                                        body: "Presenta oportunidades la dimensión de Cuestiona y construye el futuro. Esto quiere decir que existen oportunidades en 1 o en los 2 subdimensiones.",
                                    }
                                ]
                            },
                            {
                                min_range: 66,
                                max_range: 100,
                                descriptions: [
                                    {
                                        title: "body",
                                        body: "Hoy el equipo reconoce en tu forma de gestionar una fortaleza en esta dimensión. Asegura de mantener esos comportamientos y sigue retándote.",
                                    }
                                ]
                            },
                        ],
                        sub_categories: [
                            {
                                name: "Reta el status quo",
                                weight: 1,
                                description: "hace referencia a la capacidad de poner en perspectiva la forma como hacemos las cosas, inclusive las cosas que hoy generan valor.",
                                questions: [
                                    {title: 'Cuando mi lider cuando debe resolver un problema', lower: 'Busca los caminos conocidos', mid: 'comportamiento intermedio', upper: 'Nos impulsa a probar caminos nuevos'},
                                    {title: 'Mi lider toma riesgos', lower: 'Pocas veces', mid: 'comportamiento intermedio', upper: 'Analiza el contexto, y toma riesgos calculados. '},
                                    {title: 'Cuando se trata de tomar una decisiòn', lower: 'Mi lider analiza las variables y toma decisiones basado en experiencias pasadas', mid: 'comportamiento intermedio', upper: 'Mi lider nos involucra, plantea el desafio y exploramos aspectos conocidos y nos invita a ir màs alla descubriendo nuevas alternativas'},
                                    {title: 'Cuando las cosas no salen bien', lower: 'Mi lider pone en evidencia que error cometimos y asegura que no lo volvamos a cometer', mid: 'comportamiento intermedio', upper: 'Mi lider reconoce el esfuerzo, busca generar aprendizajes y nos compromete a seguir exigiendonos. '},
                                ],
                                results: [
                                    {
                                        min_range: 0,
                                        max_range: 50,
                                        descriptions: [
                                            {title: '1', body: '· Analiza tu forma de resolver problemas, y revisa si estas proponiendo nuevos caminos, o te enfocas en replicar aquellos que funcionaron en el pasado.'},
                                            {title: '2', body: '· Revisa si tu proceso para tomar decisiones incorpora variables más allá de la experiencia pasada. Reconoce tu intuición, ideas del equipo y caminos no explorados como parte de posibles soluciones.'},
                                            {title: '3', body: '· Capitaliza el error. Cuando las cosas no salen bien busca generar aprendizajes sobre lo ocurrido, habla del tema con el equipo y genera compromiso desde ahí.'},
                                        ]
                                    },
                                    {
                                        min_range: 51,
                                        max_range: 65,
                                        descriptions: [
                                            {title: '1', body: '· Revisa con tu equipo la forma como abordan los problemas y desafíos. Analiza que tan disruptivos están siendo y plantea caminos.'},
                                            {title: '2', body: '· Analiza si los proyectos que tienen vigentes los estas gestionando de formas distintas o replicando patrones. Rétate a pensar diferente.'},
                                            {title: '3', body: '· Recuerda que las cosas que hoy están funcionando pueden siempre ser mejores. Cuestiónalas y propón un plan de trabajo.'},
                                        ]
                                    },
                                    {
                                        min_range: 66,
                                        max_range: 100,
                                        descriptions: [
                                            {title: '1', body: '· Sigue impulsando la generación de nuevas ideas y caminos para resolver los desafíos del equipo. Recuerda acompañar al equipo en la ejecución y despliegue.'},
                                            {title: '2', body: '· Sigue tomando riesgos usando la data, el pasado, tendencias e intuición. Toma las cosas buenas y no tan buenas y genera aprendizajes con el equipo.'},
                                            {title: '3', body: '· Sigue siendo un líder que escucha al equipo y considera distintas variables, vuelve con tu equipo del porqué de la decisión y que elementos consideraste.'},
                                        ]
                                    }
                                ]
                            },
                            {
                                name: "Actitud emprendedora",
                                weight: 1,
                                description: "hace referencia a la mentalidad de probar, iterar y generar aprendizajes; de acompañar al equipo en la toma de decisiones",
                                questions: [
                                    {title: 'Cuando queremos probar hacer las cosas diferente', lower: 'Mi lider nos dice que debemos hacer', mid: 'comportamiento intermedio', upper: 'Mi lider fomenta que traigamos ideas diferentes y nos ayuda a llevarlas a cabo'},
                                    {title: 'El acompañamiento de mi lider en los proyectos', lower: 'Es muy enfocado a la tarea', mid: 'comportamiento intermedio', upper: 'Es cercano, asegura que sepamos què hacer, como hacerlo y como nos estamos sintiendo'},
                                    {title: 'Cuando las àreas nos piden que hagamos las cosas diferentes', lower: 'Mi lider se pone a la defensiva y pone excusas ', mid: 'comportamiento intermedio', upper: 'Es muy abierto a las sugerencias y escucha las opiniones de los demàs '},
                                    {title: 'Cuando lanzamos nuevas soluciones', lower: 'Probamos la soluciòn directo con el usario', mid: 'comportamiento intermedio', upper: 'Mi lider asegura que probemos en pequeño, iteremos antes de lanzar la soluciòn'},
                                ],
                                results: [
                                    {
                                        min_range: 0,
                                        max_range: 50,
                                        descriptions: [
                                            {title: '1', body: '· Analiza tu actitud frente al feedback y cambio. Recuerda la importancia de la apertura a ver las cosas con diversos prismas en búsqueda de la mejora continua'},
                                            {title: '2', body: '· Encuentra comodidad en probar soluciones en pequeño. Toma riesgos calculados y disfruta el proceso de testear tus soluciones antes de lanzarlas a toda la organización o estudiantes.'},
                                            {title: '3', body: '· Reflexiona sobre tu rol en los proyectos, que tan presente estas en la gestiòn o acompañamiento de tu equipo.'},
                                        ]
                                    },
                                    {
                                        min_range: 51,
                                        max_range: 65,
                                        descriptions: [
                                            {title: '1', body: '· Recuerda que debes poner en práctica las ideas del equipo y las propias. Analiza el contexto y asegura de llevarlas a cabo.'},
                                            {title: '2', body: '· Pide feedback de tu equipo para analizar que tan abierto a nuevas formas de hacer las cosas eres. Escucha atentamente a tu equipo y define un plan.'},
                                            {title: '3', body: '· Analiza tu acompañamiento y forma de trabajar los proyectos con tu equipo y otras área, recuerda la importancia de tener una postura abierta y receptiva.'},                                       
                                        ]
                                    },
                                    {
                                        min_range: 66,
                                        max_range: 100,
                                        descriptions: [
                                            {title: '1', body: '· Sigue impulsando acciones que permitan al equipo diseñar nuevas soluciones y explorar nuevos caminos.'},
                                            {title: '2', body: '· Se cercano, acompaña a tu equipo en los proyectos que participan y guíalos.'},
                                            {title: '3', body: '· Sigue siendo ejemplo de probar en pequeño y se consistente.'},
                                        ]
                                    }
                                ]
                            }
                        ]
                    },
                    {
                        name: "Lider Organizacional",
                        weight: 1,
                        results: [
                            {
                                min_range: 1,
                                max_range: 50,
                                descriptions: [
                                    {title: 'body', body: 'Presenta oportunidades la dimensión de Entrega resultados. Esto quiere decir que existen oportunidades en 1 o en los 2 subdimensiones.'},
                                ]
                            },
                            {
                                min_range: 51,
                                max_range: 65,
                                descriptions: [
                                    {title: 'body', body: 'Presenta oportunidades la dimensión de Entrega resultados. Esto quiere decir que existen oportunidades en 1 o en los 2 subdimensiones.'},
                                ]
                            },
                            {
                                min_range: 66,
                                max_range: 100,
                                descriptions: [
                                    {title: 'body', body: 'Presenta oportunidades la dimensión de Entrega resultados. Esto quiere decir que existen oportunidades en 1 o en los 2 subdimensiones.'},
                                ]
                            },
                        ],
                        sub_categories: [
                            {
                                name: "Reta el status quo",
                                weight: 1,
                                description: "hace referencia a la capacidad de poner en perspectiva la forma como hacemos las cosas, inclusive las cosas que hoy generan valor.",
                                questions: [
                                    {title: 'Mi lider cuando debe resolver un problema', lower: 'Busca los caminos conocidos', mid: 'comportamiento intermedio', upper: 'Nos impulsa a probar caminos nuevos y nos acompaña '},
                                    {title: 'Según mi lider cuando algo esta bien', lower: 'Aseguremos que se mantenga asi. ', mid: 'comportamiento intermedio', upper: 'Siempre puede ser mejor'},
                                    {title: 'Cuando debemos generar aprendizajes como organizaciòn', lower: 'Tiene un rol pasivo, no se involucra a menos que su funciòn este inmersa', mid: 'comportamiento intermedio', upper: 'Participa reconociendo las cosas que debemos mejorar, en que somos buenos y se pone al servicio'},
                                    {title: 'Cuando debemos generar transformaciones a los procesos que gestionamos', lower: 'A mi lider le cuesta ver caminos distintos a los usuales', mid: 'comportamiento intermedio', upper: 'Mi lider se compromete con analizar y proponer soluciones diferentes, nos impulsa a cuestionar y pensar màs allà'},
                                ],
                                results: [
                                    {
                                        min_range: 0,
                                        max_range: 50,
                                        descriptions: [
                                            {title: '1', body: '· Reflexiona sobre como abordas la solución de problemas y que tan abierto eres a recorrer nuevos caminos y no enfocarte en caminos comprobados.'},
                                            {title: '2', body: '· Involúcrate en el desarrollo de aprendizajes para la organización. Cuando las cosas no funcionan como esperamos son una fuente muy importante de conocimiento que debemos capitalizar.'},
                                            {title: '3', body: '· Reta las cosas que hoy funcionan bien, no porque estén bien no quiere decir que puedan estar mejor.'},
                                        ]
                                    },
                                    {
                                        min_range: 51,
                                        max_range: 65,
                                        descriptions: [
                                            {title: '1', body: '· Sigue cuestionando los procesos vigentes, y busca evolucionarlas poniendo en prácticas las alternativas relevadas.'},
                                            {title: '2', body: '· Impulsa a tu equipo a seguir generando nuevas ideas y caminos no recorridos para solucionar problemas.'},
                                            {title: '3', body: '· Sigue generando aprendizajes de los procesos que gestionas, lo que hicimos bien o no tan bien son fuente de conocimiento muy relevante para la organización.'},                                            
                                        ]
                                    },
                                    {
                                        min_range: 66,
                                        max_range: 100,
                                        descriptions: [
                                            {title: '1', body: '· Sigue cuestionando las formas establecidas de hacer las cosas. No olvides la asertividad y la influencia para lograr cambios.'},
                                            {title: '2', body: '· Incentiva a tu equipo y otras áreas a probar caminos no conocidos. Acompaña y sigue brindando la confianza que el equipo necesita.'},                                            
                                        ]
                                    }
                                ]
                            },
                            {
                                name: "Actitud emprendedora",
                                weight: 1,
                                description: "hace referencia a la mentalidad de probar, iterar y generar aprendizajes; de acompañar al equipo en la toma de decisiones.",
                                questions: [
                                    {title: 'Cuando las cosas no salen como esperamos', lower: 'Mi lìder se estresa y se centra en los errores', mid: 'comportamiento intermedio', upper: 'Mi lider nos invita a la reflexiòn, aprender y nos acompaña en el manejo de las emociones'},
                                    {title: 'Me siento respaldado por mi lider', lower: 'En algunas ocasiones', mid: 'comportamiento intermedio', upper: 'Siempre '},
                                    {title: 'Cuando las cosas no salen bien', lower: 'Mi lider se centra en evitar que volvamos  a cometer los errores, nos encamina a mejorar en la funciòn', mid: 'comportamiento intermedio', upper: 'Nos invita a reflexionar y navegar nuestras emociones y desarrollar perseverancia'},
                                    {title: 'Cuando lanzamos nuevas soluciones', lower: 'Probamos la soluciòn directo con el usuario', mid: 'comportamiento intermedio', upper: 'Mi lider asegura que probemos en pequeño, iteremos antes de lanzar la soluciòn'},
                                ],
                                results: [
                                    {
                                        min_range: 0,
                                        max_range: 50,
                                        descriptions: [
                                            {title: '1', body: '· Cuando las cosas no salen bien, evita centrarte en el error. Enfoca tus esfuerzos para generar aprendizajes.'},
                                            {title: '2', body: '· Recuerda la importancia de acompañar a tu equipo en los desafíos, reúnete con ellos y definan las rutas más adecuadas para estar presente.'},
                                            {title: '3', body: '· Identifica que proyectos que te permitan iterar y probar posibles soluciones en pequeño. Encuentra comodidad en testear, aprender y evolucionar antes de salir a la organización.'},                                            
                                        ]
                                    },
                                    {
                                        min_range: 51,
                                        max_range: 65,
                                        descriptions: [
                                            {title: '1', body: '· Asume la responsabilidad y sé vulnerable cuando las cosas no han salido bien. Impulsa la reflexión para generar aprendizajes.'},
                                            {title: '2', body: '· Se constante en el acompañamiento al equipo, esfuérzate por dar el espacio a tus equipos sin que se sientan solos.'},
                                            {title: '3', body: '· Reflexiona sobre tu forma de gestionar y manejar proyectos. Es importante identificar aprendizajes, luego hazlo con el equipo.'},                                       
                                        ]
                                    },
                                    {
                                        min_range: 66,
                                        max_range: 100,
                                        descriptions: [
                                            {title: '1', body: '· Sigue dando el ejemplo, reflexiona sobre las cosas que se pueden hacer diferente. Asume el manejo de las emociones que se generan.'},
                                            {title: '2', body: '· Asegura seguir acompañando a tus equipos y que sientan tu presencial y rol en los proyectos que tienen bajo su responsabilidad'},
                                            {title: '3', body: '· Sigue impulsando el probar en pequeño, iterar y testar soluciones antes de lanzarlas a toda la organización.'},
                                        ]
                                    }
                                ]
                            }
                        ]
                    }
                ]
            },
        ]
    }
]

def create(category, parent = nil)
    ca = Category.create(
                            name: category[:name], 
                            weight: category[:weight], 
                            parent: parent,
                            description: category[:description]
                        )
    p "new Category #{category[:name]} created #{ca}" unless ca.nil?
    unless category[:questions].nil?
        category[:questions].each do |q|
            op = Option.create(
                                lower_option: q[:lower],
                                middle_option: q[:mid], 
                                upper_option: q[:upper]
                            )
            qu = Question.create(
                                    title: q[:title],
                                    test: @test1,
                                    category: ca, 
                                    index: @index,
                                    weight: 1,
                                    option: op,
                                    question_type: 0
                                )
            p "new Question for #{category[:name]} created #{qu}" unless qu.nil?
            @index = @index.next
        end
    end
    unless category[:results].nil?
        category[:results].each do |r| 
            re = Result.create(
                                category: ca, 
                                min_range: r[:min_range], 
                                max_range: r[:max_range]
                            )
            p "new Result to #{category[:name]} created #{re}" unless re.nil?
            r[:descriptions].each do |d| 
                de = Description.create( 
                                            result: re, 
                                            title: d[:title], 
                                            body: d[:body]
                                        )
                p "new Description to #{category[:name]} created #{de}" unless de.nil?
            end
        end
    end
    ca
end

categories.each do |general|
    #general
    parent1 = create(general, nil)
    general[:sub_categories].each do |sub1|
        # pp sub1
        parent2 = create(sub1, parent1)
        sub1[:sub_categories].each do |sub2|
            # pp sub1
            parent3 = create(sub2, parent2)
            sub2[:sub_categories].each do |sub3|
                parent4 = create(sub3, parent3)
            end
        end
    end

end 


























































































# #crear una categoria
# parent_category = Category.create(name: "Entrega Resultados", weight: 1)
# pp parent_category
# result = Result.create( category_id: sub_category.id, min_range: 1, max_range: 50)
# description = Description.create(result_id: result.id,title: "1", body: "Presenta oportunidades en la dimensión de Entrega resultados. Esto quiere decir que existen oportunidades en 1 o en los 2 subdimensiones.")
# result = Result.create( category_id: sub_category.id, min_range: 51, max_range: 65)
# description = Description.create(result_id: result.id,title: "1", body: "Vienes desarrollando compartimientos que te acercan a tener como fortaleza esta dimensión. Enfócate en la constancia y consistencia en tu forma de gestionar al equipo.")
# result = Result.create( category_id: sub_category.id, min_range: 66, max_range: 100)
# description = Description.create(result_id: result.id,title: "1", body: "Hoy el equipo reconoce en tu forma de gestionar una fortaleza en esta dimensión. Asegura de mantener esos comportamientos y sigue retándote.")


# #crear sub categoria
# sub_category = Category.create(name: "Liderar a Otros - Ejecuta con Efectividad", parent_id: parent_category.id, weight: 1 )
# pp sub_category

# result = Result.create( category_id: sub_category.id, min_range: 1, max_range: 50)
# description = Description.create(result_id: result.id,title: "1", body: "Organiza el trabajo y planifica las responsabilidades de todos los miembros del equipo.")
# description = Description.create(result_id: result.id,title: "2", body: "Conecta las funciones de todos los miembros del equipo y reflexiona con ellos sobre el impacto del área.")
# description = Description.create(result_id: result.id,title: "3", body: "Reflexiona sobre el uso de los recursos disponibles y propone la mejor forma de gestionarlo.")

# result = Result.create( category_id: sub_category.id, min_range: 51, max_range: 65)
# description = Description.create(result_id: result.id,title: "1", body: "Analiza si hay diferencias en tu forma de gestionar bajo presión o en momentos donde hay buenos resultados.")
# description = Description.create(result_id: result.id,title: "2", body: "Revisa con tu equipo como ellos perciben tu planificación en momentos de estrés o presión.")
# description = Description.create(result_id: result.id,title: "3", body: "Reflexiona como es tu gestión de los recursos disponibles.")

# result = Result.create( category_id: sub_category.id, min_range: 66, max_range: 100)
# description = Description.create(result_id: result.id,title: "1", body: "Pide feedback a tus reportes y clientes sobre las formas y tiempos en las entregas de los proyectos o información e identifica caminos que puedan ser mejores.")
# description = Description.create(result_id: result.id,title: "2", body: "Analiza con tu equipo si las responsabilidades son entregadas en forma y si se reconoce el impacto de la función individual y el impacto del equipo en las demás áreas y organización.")
# description = Description.create(result_id: result.id,title: "3", body: "Reflexiona sobre la gestión de recursos y si podemos generar eficiencias en las formas..")

# qlist << 
#     {
#         lo: "Nos da tareas especificas sin conectarnos como equipo",
#         up: "Se enfoca en asegurar que todos entendemos el objetivo y nos organiza para todos contribuir y lograrlo.",
#         mi: "Nos conecta a nivel medio",
#         ti: "Mi lider para conseguir los resultados esperados",
#         ty: 0,
#         ca: sub_category.id,
#     }
# qlist << 
#     {
#         lo: "dandome confianza indicandome que debo hacer y para cuando tiene que estar listo.",
#         up: "reconociendo mis fortalezas, asegurando que entiendo el objetivo y como impacto en un logro mayor",
#         mi: "en un nivel intermedio",
#         ti: "Mi lider asigna tareas",
#         ty: 0,
#         ca: sub_category.id,
#     }
# qlist << 
#     {
#         lo: "Tengo claro que hacer pero no reconozco mi impacto en el trabajo de mis demás compañeros",
#         up: "Estan muy claras y todos en el equipo sabemos qué hace cada uno y como nos complementamos",
#         mi: "en un nivel intermedio",
#         ti: "La organizaciòn de las funciones y responsabilidades del equipo",
#         ty: 0,
#         ca: sub_category.id,
#     }
# qlist << 
#     {
#         lo: "Invertimos todos los recursos disponibles o excedemos lo previsto con tal de lograr el objetivo",
#         up: "Asegura la inversiòn adecuada cuidando los presupuestos y maximizandolos",
#         mi: "en un nivel intermedio",
#         ti: "Cuando se trata de gestionar los recursos que tenemos disponibles",
#         ty: 0,
#         ca: sub_category.id,
#     }
# #crear sub categoria
# sub_category = Category.create(name: "Liderar a Otros - Conecta los logros con el propósito", parent_id: parent_category.id, weight: 1 )
# pp sub_category


# result = Result.create( category_id: sub_category.id, min_range: 1, max_range: 50)
# description = Description.create(result_id: result.id,title: "1", body: "Acércate al propósito organizacional y esfuérzate en entenderlo.")
# description = Description.create(result_id: result.id,title: "2", body: "Analiza cómo impactas desde tu gestión con el propósito organizacional.")
# description = Description.create(result_id: result.id,title: "3", body: "Invierte tiempo en conversar con tu equipo sobre el propósito organizacional y las responsabilidades del área")
# description = Description.create(result_id: result.id,title: "4", body: "Asegúrate que los miembros de tu equipo conozcan bien el propósito y la conexión con su función.")

# result = Result.create( category_id: sub_category.id, min_range: 51, max_range: 65)
# description = Description.create(result_id: result.id,title: "1", body: "Reflexiona sobre tu conocimiento y entendimiento del propósito organizacional, analiza que significa lo que queremos conseguir como organización.")
# description = Description.create(result_id: result.id,title: "2", body: "Genera espacios con tu equipo para hablar del propósito y como desde el área contribuyen")

# result = Result.create( category_id: sub_category.id, min_range: 66, max_range: 100)
# description = Description.create(result_id: result.id,title: "1", body: "Invita al equipo a reflexionar sobre el impacto del área en el logro del propósito organizacional.")
# description = Description.create(result_id: result.id,title: "2", body: "Compromete al equipo a lograr y dar visibilidad del impacto y genera un plan de trabajo e invita a otras áreas hacer lo mismo.")
# description = Description.create(result_id: result.id,title: "3", body: "Se un agente de cambio participa y se vocal con el propósito organizacional en tus interacciones con otras áreas.")

# qlist << 
#     {
#         lo: "No lo tiene presente en el dìa a dìa ",
#         up: "Vive el proposito en cada cosa que hacemos",
#         mi: "en un nivel intermedio",
#         ti: "Cuando se trata del proposito de la organizaciòn mi lider",
#         ty: 0,
#         ca: sub_category.id,
#     }
# qlist <<
#     {
#         lo: "No necesariamente lo conecta con como lograr lo que nos planteamos nos acerca a cumplir nuestro proposito.",
#         up: "Comparte con el equipo como el logro del proyecto o el nuevo desafio nos acerca a vivir nuestro proposito",
#         mi: "en un nivel intermedio",
#         ti: "Cuando iniciamos un proyecto o asumimos nuevos desafios mi lider ",
#         ty: 0,
#         ca: sub_category.id,
#     }
# qlist <<
#     {
#         lo: "No lo tengo claro",
#         up: "Lo tengo claro, Mi lider nos lo comenta siempre y nos impulsa por màs",
#         mi: "en un nivel intermedio",
#         ti: "Mis funciones conectan con el propòsito de la organizaciòn ",
#         ty: 0,
#         ca: sub_category.id,
#     }
# qlist <<
#     {
#         lo: "No lo tengo claro",
#         up: "Lo vivimos en el dìa a dìa",
#         mi: "en un nivel intermedio",
#         ti: "Conozco el proposito organizacional y lo vivimos en el dìa gracias a la gestiòn de mi lider",
#         ty: 0,
#         ca: sub_category.id,
#     }


# #crear sub categoria
# sub_category = Category.create(name: "Lider Organizacional - Ejecuta con Efectividad", parent_id: parent_category.id, weight: 1 )
# pp sub_category
# qlist << 
#     {
#         lo: "Nos indica qué debemos hacer y para cuando debe estar listo",
#         up: "Nos involucra en la forma de conseguir resultados, escucha nuestras propuestas, nos compromete y motiva",
#         mi: "en un nivel intermedio",
#         ti: "Cuando iniciamos un proyecto mi lider ",
#         ty: 0,
#         ca: sub_category.id,
#     }
# qlist << 
#     {
#         lo: "mi lider tiende a conocer que me motiva",
#         up: "Mi lider sabe como motivarnos al equipo y a mi y maximizar nuestro  potencial",
#         mi: "en un nivel intermedio",
#         ti: "Cuando hablamos de motivaciòn",
#         ty: 0,
#         ca: sub_category.id,
#     }
# qlist << 
#     {
#         lo: "Mi lider tiende a frustrarse ",
#         up: "Impulsa el trabajo colaborativo y encuentra caminos para accionar",
#         mi: "en un nivel intermedio",
#         ti: "Cuando los proyectos o iniciativas no avanzan al ritmo que esperamos",
#         ty: 0,
#         ca: sub_category.id,
#     }
# qlist << 
#     {
#         lo: "Invertimos todos los recursos disponibles y no prevee la organizaciòn del tiempo del equipo",
#         up: "Organiza los presupuestos, el tiempo y dedicaciòn de los equipos asegurandoel mejor manejo",
#         mi: "en un nivel intermedio",
#         ti: "La visiòn de mi lider sobre el uso de recursos (tiempo y presupuesto)",
#         ty: 0,
#         ca: sub_category.id,
#     }


# #crear sub categoria
# sub_category = Category.create(name: "Lider Organizacional - Conecta los logros con el propòsito", parent_id: parent_category.id, weight: 1 )
# pp sub_category
# qlist << 
#     {
#         lo: "No es muy clara. ",
#         up: "Es muy genuina y esta presente en sus interacciones",
#         mi: "en un nivel intermedio",
#         ti: "La conexiòn de mi lider con el proposito",
#         ty: 0,
#         ca: sub_category.id,
#     }
# qlist << 
#     {
#         lo: "Nos indica la tarea a realizar y los tiempo para cumplirlos",
#         up: "Nos comparte la visiòn del proyecto, nos indica nuestra responsabilidad y como nos acerca a seguir viviendo nuestro proposito",
#         mi: "en un nivel intermedio",
#         ti: "Cuando mi lider propone nuevos proyectos",
#         ty: 0,
#         ca: sub_category.id,
#     }
# qlist << 
#     {
#         lo: "De lo que realiza nuestra àrea y esperan de nosotros en el corto plazo",
#         up: "De la organizaciòn y nuestra àrea , conecta nuestra responsabilidad y lo que se espera de nosotros en el corto y largo plazo",
#         mi: "en un nivel intermedio",
#         ti: "Mi lider nos brinda claridad",
#         ty: 0,
#         ca: sub_category.id,
#     }
# qlist << 
#     {
#         lo: "Asegurar que el equipo sepa lo que tiene que hacer",
#         up: "Asegurar que el equipo sepa lo que tiene que hacer e influencia en las otras àreas; no solo alinea al equipo directo sino a todos los equipos involucrados.",
#         mi: "en un nivel intermedio",
#         ti: "El alineamiento para mi lider es",
#         ty: 0,
#         ca: sub_category.id,
#     }





# #crear una categoria
# ###############################################################################################################
# ###############################################################################################################
# ###############################################################################################################
# ###############################################################################################################
# parent_category = Category.create(name: "Genera vinculos genuinos", weight: 1)



# #crear sub categoria
# sub_category = Category.create(name: "Liderar a otros - seguridad Psicológica y bienestar", parent_id: parent_category.id, weight: 1 )
# pp sub_category
# qlist <<{
#             lo: "Mi lìder propone buenas alternativas y caminos de acción",
#             up: "Siento que podemos aportar ideas para definir posturas y  un marco de acción",
#             mi: "en un nivel intermedio",
#             ti: "Cuando tenemos que abordar problemas o nuevas situaciones",
#             ty: 0,
#             ca: sub_category.id,
#         }
# qlist <<{
#             lo: "Siempre prevalecen las de mi lider",
#             up: "Siento que mis ideas y opiniones son valoradas por mi lider",
#             mi: "en un nivel intermedio",
#             ti: "Cuando tenemos diversas ideas en el equipo",
#             ty: 0,
#             ca: sub_category.id,
#         }
# qlist <<{
#             lo: "Se desarrollan en base a la necesidad ",
#             up: "son genuinas, basadas en el respeto y trascienden la función",
#             mi: "en un nivel intermedio",
#             ti: "La interacciòn de mi lider con otras áreas",
#             ty: 0,
#             ca: sub_category.id,
#         }
# qlist <<{
#             lo: "prefiere un perfil de escucha y canalizar nuestras opiniones en el foro",
#             up: "Me impulsa a dar mi punto de vista, manifestar si estoy de acuerdo o en desacuerdo con lo planteado.",
#             mi: "en un nivel intermedio",
#             ti: "en reuniones con otras áreas mi lider",
#             ty: 0,
#             ca: sub_category.id,
#         }
# #crear sub categoria
# sub_category = Category.create(name: "Liderar a otros - Desarrollo de talento", parent_id: parent_category.id, weight: 1 )
# pp sub_category
# qlist <<{
#             lo: "solo cuando los procesos lo demandan",
#             up: "De forma constante y oportuna.",
#             mi: "en un nivel intermedio",
#             ti: "Recibo feedback de mi lider",
#             ty: 0,
#             ca: sub_category.id,
#         }
# qlist <<{
#             lo: "Es orientado a la tarea y qué cosas debo hacer diferente",
#             up: "Esta relacionado a como seguir desarrollandome, enfocado en competencias",
#             mi: "en un nivel intermedio",
#             ti: "El feedback de que recibo de mi lider",
#             ty: 0,
#             ca: sub_category.id,
#         }
# qlist <<{
#             lo: "Mi lider me dice que debo mejorar ",
#             up: "Mi lider me acompaña y me ayuda a construir un plan de desarrollo ",
#             mi: "en un nivel intermedio",
#             ti: "Cuando tengo  una brecha en mi desempeño",
#             ty: 0,
#             ca: sub_category.id,
#         }
# qlist <<{
#             lo: "Mi lider a veces me reconoce el buen trabajo",
#             up: "Mi lider reconoce el trabajo y nos impulsa a más",
#             mi: "en un nivel intermedio",
#             ti: "Cuando estoy haciendo las cosas bien",
#             ty: 0,
#             ca: sub_category.id,
#         }



# #crear sub categoria
# sub_category = Category.create(name: "Lider organizacional - seguridad Psicológica y bienestar", parent_id: parent_category.id, weight: 1 )
# pp sub_category
# qlist <<{
#             lo: "Mi lìder nos transmite su visiòn y hay poca flexibilidad para ver otras posibilidades. ",
#             up: "Nos invita a pensar fuera de la caja, escucha nuestras ideas y las reta",
#             mi: "en un nivel intermedio",
#             ti: "Cuando tenemos oportunidades de crear cosas nuevas",
#             ty: 0,
#             ca: sub_category.id,
#         }
# qlist <<{
#             lo: "Mi lìder siempre termina teniendo la razòn",
#             up: "Mi lider construye sobre las ideas del equipo, logrando encontrar alternativas muy potentes",
#             mi: "en un nivel intermedio",
#             ti: "Cuando tenemos diversas ideas en el equipo",
#             ty: 0,
#             ca: sub_category.id,
#         }
# qlist <<{
#             lo: "Se desarrollan en base a la necesidad ",
#             up: "son genuinas, basadas en el respeto ",
#             mi: "en un nivel intermedio",
#             ti: "La relaciòn de mi lider con otras àreas de la organizaciòn ",
#             ty: 0,
#             ca: sub_category.id,
#         }
# qlist <<{
#             lo: "Mi lider busca identificar las causas",
#             up: "Generamos aprendizajes, reconoce que pudo hacer diferente y nos da feedback",
#             mi: "en un nivel intermedio",
#             ti: "Cuando cometemos un error",
#             ty: 0,
#             ca: sub_category.id,
#         }


# #crear sub categoria
# sub_category = Category.create(name: "Lider organizacional - desarrollo de talento", parent_id: parent_category.id, weight: 1 )
# pp sub_category
# qlist <<{
#             lo: "Hacer mejor mi trabajo",
#             up: "Evolucionar como profesional y persona. Identifico mis oportunidades pero tambien soy conciente de mis fortalezas. ",
#             mi: "en un nivel intermedio",
#             ti: "El feedback que me da mi lider me permite",
#             ty: 0,
#             ca: sub_category.id,
#         }
# qlist <<{
#             lo: "En algunas oportunidades",
#             up: "Siempre esta dispuesto a retarme y darme desafios que me ayuden a crecer",
#             mi: "en un nivel intermedio",
#             ti: "Mi lider orienta mi desarrollo profesional",
#             ty: 0,
#             ca: sub_category.id,
#         }
# qlist <<{
#             lo: "No tengo tanta claridad, mi lider me da feedback sobre las funciones que realizo y como hacerlas mejor. ",
#             up: "Si, mi lider me acompaña en mi desarrollo ",
#             mi: "en un nivel intermedio",
#             ti: "Tengo claro que debo desarrollar para seguir creciendo en la organizaciòn",
#             ty: 0,
#             ca: sub_category.id,
#         }
# qlist <<{
#             lo: "Mi lider a veces me reconoce el buen trabajo",
#             up: "Mi lider reconoce el trabajo y nos impulsa a màs ",
#             mi: "en un nivel intermedio",
#             ti: "Cuando estoy haciendo las cosas bien",
#             ty: 0,
#             ca: sub_category.id,
#         }





# #crear una categoria
# ###############################################################################################################
# ###############################################################################################################
# ###############################################################################################################
# ###############################################################################################################
# parent_category = Category.create(name: "Construye y cuestiona el futuro", weight: 1)
# #crear sub categoria
# sub_category = Category.create(name: "Liderar a otros - reta el status quo", parent_id: parent_category.id, weight: 1 )
# pp sub_category
# qlist <<{
#             lo: "Busca los caminos conocidos",
#             up: "Nos impulsa a probar caminos nuevos",
#             mi: "en un nivel intermedio",
#             ti: "Cuando mi lider cuando debe resolver un problema",
#             ty: 0,
#             ca: sub_category.id,
#         }
# qlist <<{
#             lo: "Pocas veces",
#             up: "Analiza el contexto, y toma riesgos calculados. ",
#             mi: "en un nivel intermedio",
#             ti: "Mi lider toma riesgos",
#             ty: 0,
#             ca: sub_category.id,
#         }
# qlist <<{
#             lo: "Mi lider analiza las variables y toma decisiones basado en experiencias pasadas",
#             up: "Mi lider nos involucra, plantea el desafio y exploramos aspectos conocidos y nos invita a ir màs alla descubriendo nuevas alternativas",
#             mi: "en un nivel intermedio",
#             ti: "Cuando se trata de tomar una decisiòn",
#             ty: 0,
#             ca: sub_category.id,
#         }
# qlist <<{
#             lo: "Mi lider pone en evidencia que error cometimos y asegura que no lo volvamos a cometer",
#             up: "Mi lider reconoce el esfuerzo, busca generar aprendizajes y nos compromete a seguir exigiendonos. ",
#             mi: "en un nivel intermedio",
#             ti: "Cuando las cosas no salen bien",
#             ty: 0,
#             ca: sub_category.id,
#         }

# #crear sub categoria
# sub_category = Category.create(name: "Liderar a otros - Actitud emprendedora", parent_id: parent_category.id, weight: 1 )
# pp sub_category
# qlist <<{
#             lo: "Mi lider nos dice que debemos hacer",
#             up: "Mi lider fomenta que traigamos ideas diferentes y nos ayuda a llevarlas a cabo",
#             mi: "en un nivel intermedio",
#             ti: "Cuando queremos probar hacer las cosas diferente",
#             ty: 0,
#             ca: sub_category.id,
#         }
# qlist <<{
#             lo: "Es muy enfocado a la tarea",
#             up: "Es cercano, asegura que sepamos què hacer, como hacerlo y como nos estamos sintiendo",
#             mi: "en un nivel intermedio",
#             ti: "El acompañamiento de mi lider en los proyectos",
#             ty: 0,
#             ca: sub_category.id,
#         }
# qlist <<{
#             lo: "Mi lider se pone a la defensiva y pone excusas ",
#             up: "Es muy abierto a las sugerencias y escucha las opiniones de los demàs ",
#             mi: "en un nivel intermedio",
#             ti: "Cuando las àreas nos piden que hagamos las cosas diferentes",
#             ty: 0,
#             ca: sub_category.id,
#         }
# qlist <<{
#             lo: "Probamos la soluciòn directo con el usario",
#             up: "Mi lider asegura que probemos en pequeño, iteremos antes de lanzar la soluciòn",
#             mi: "en un nivel intermedio",
#             ti: "Cuando lanzamos nuevas soluciones",
#             ty: 0,
#             ca: sub_category.id,
#         }
# #crear sub categoria
# sub_category = Category.create(name: "Lider organizacional - Reta el status quo", parent_id: parent_category.id, weight: 1 )
# pp sub_category
# qlist <<{
#             lo: "Busca los caminos conocidos",
#             up: "Nos impulsa a probar caminos nuevos y nos acompaña ",
#             mi: "en un nivel intermedio",
#             ti: "Mi lider cuando debe resolver un problema",
#             ty: 0,
#             ca: sub_category.id,
#         }
# qlist <<{
#             lo: "Aseguremos que se mantenga asi. ",
#             up: "Siempre puede ser mejor",
#             mi: "en un nivel intermedio",
#             ti: "Según mi lider cuando algo esta bien",
#             ty: 0,
#             ca: sub_category.id,
#         }
# qlist <<{
#             lo: "Tiene un rol pasivo, no se involucra a menos que su funciòn este inmersa",
#             up: "Participa reconociendo las cosas que debemos mejorar, en que somos buenos y se pone al servicio",
#             mi: "en un nivel intermedio",
#             ti: "Cuando debemos generar aprendizajes como organizaciòn",
#             ty: 0,
#             ca: sub_category.id,
#         }
# qlist <<{
#             lo: "A mi lider le cuesta ver caminos distintos a los usuales",
#             up: "Mi lider se compromete con analizar y proponer soluciones diferentes, nos impulsa a cuestionar y pensar màs allà",
#             mi: "en un nivel intermedio",
#             ti: "Cuando debemos generar transformaciones a los procesos que gestionamos",
#             ty: 0,
#             ca: sub_category.id,
#         }l intermedio",
#             ti: "Cuando las cosas no salen bien",
#             ty: 0,
#             ca: sub_category.id,
#         }
# qlist <<{
#             lo: "Probamos la soluciòn directo con el usuario",
#             up: "Mi lider asegura que probemos en pequeño, iteremos antes de lanzar la soluciòn",
#             mi: "en un nivel intermedio",
#             ti: "Cuando lanzamos nuevas soluciones",
#             ty: 0,
#             ca: sub_category.id,
#         }

# qlist.each do |q| 
#     index = index.next
#     pp index
#     option = Option.create(
#         upper_option: q[:up


# #crear sub categoria
# sub_category = Category.create(name: "Lider organizacional - Actitud emprendedora", parent_id: parent_category.id, weight: 1 )
# pp sub_category
# qlist <<{
#             lo: "Mi lìder se estresa y se centra en los errores",
#             up: "Mi lider nos invita a la reflexiòn, aprender y nos acompaña en el manejo de las emociones",
#             mi: "en un nivel intermedio",
#             ti: "Cuando las cosas no salen como esperamos",
#             ty: 0,
#             ca: sub_category.id,
#         }
# qlist <<{
#             lo: "En algunas ocasiones",
#             up: "Siempre ",
#             mi: "en un nivel intermedio",
#             ti: "Me siento respaldado por mi lider",
#             ty: 0,
#             ca: sub_category.id,
#         }
# qlist <<{
#             lo: "Mi lider se centra en evitar que volvamos  a cometer los errores, nos encamina a mejorar en la funciòn",
#             up: "Nos invita a reflexionar y navegar nuestras emociones y desarrollar perseverancia ",
#             mi: "en un nive], 
#         lower_option: q[:lo],
#         middle_option: q[:mi])
#     pp option
#     q1 = Question.create(
#                     title: q[:ti], 
#                     category_id: q[:ca], 
#                     test: test1, 
#                     weight: 1, 
#                     option: option, 
#                     question_type: q[:ty], 
#                     index: index
#         )
#     pp q1
# end


































# UserTest.create(
#     user_id: 1,
#     test_id: 1,
#     evaluated_id: 1,
#     status: 0,
#     token:  SecureRandom.hex(16)
# )
# UserTest.create(
#     user_id: 2,
#     test_id: 1,
#     evaluated_id: 1,
#     status: 0,
#     token:  SecureRandom.hex(16)
# )
# UserTest.create(
#     user_id: 2,
#     test_id: 1,
#     evaluated_id: 2,
#     status: 0,
#     token:  SecureRandom.hex(16)
# )
# UserTest.create(
#     user_id: 3,
#     test_id: 1,
#     evaluated_id: 1,
#     status: 0,
#     token:  SecureRandom.hex(16)
# )

# pp "terminado"

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


