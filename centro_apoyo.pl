% Base de conocimiento del Centro de Apoyo Academico
% Cada hecho representa a un estudiante: estudiante(Nombre, Curso, Nota)
% La nota va en escala de 1.0 a 7.0

estudiante(ana, paradigmas, 5.5).
estudiante(luis, calculo, 3.2).
estudiante(maria, algoritmos, 6.0).
estudiante(pedro, fisica, 4.0).
estudiante(sofia, paradigmas, 2.8).
estudiante(diego, bases_datos, 5.8).
estudiante(valentina, redes, 4.5).
estudiante(javier, calculo, 3.9).
estudiante(camila, algoritmos, 6.5).
estudiante(matias, fisica, 3.5).
estudiante(fernanda, paradigmas, 4.2).
estudiante(benjamin, bases_datos, 5.0).
estudiante(catalina, redes, 2.5).
estudiante(nicolas, calculo, 4.8).
estudiante(isidora, algoritmos, 3.0).
estudiante(vicente, fisica, 5.3).
estudiante(antonia, paradigmas, 6.8).
estudiante(martin, bases_datos, 3.7).
estudiante(florencia, redes, 4.9).
estudiante(tomas, calculo, 5.6).
estudiante(josefa, algoritmos, 4.1).
estudiante(cristobal, fisica, 2.9).
estudiante(constanza, paradigmas, 5.1).
estudiante(felipe, bases_datos, 6.2).
estudiante(trinidad, redes, 3.4).
estudiante(agustin, calculo, 4.7).
estudiante(emilia, algoritmos, 5.9).
estudiante(ignacio, fisica, 3.8).
estudiante(amanda, paradigmas, 4.4).
estudiante(gabriel, bases_datos, 5.4).
% --- Reglas ---

% pertenece(Nombre, Curso): es verdadero si el estudiante esta inscrito en ese curso
pertenece(Nombre, Curso) :- estudiante(Nombre, Curso, _).

% aprobado(Nombre): es verdadero si la nota del estudiante es mayor o igual a 4.0
aprobado(Nombre) :- estudiante(Nombre, _, Nota), Nota >= 4.0.

% reprobado(Nombre): es verdadero si la nota del estudiante es menor a 4.0
reprobado(Nombre) :- estudiante(Nombre, _, Nota), Nota < 4.0.
% --- Consulta interactiva ---

% mostrar_estado_estudiante: pide un nombre por consola, busca al estudiante
% y muestra su nota junto con su estado (aprobado o reprobado)
mostrar_estado_estudiante :-
    write('Ingrese el nombre del estudiante (en minuscula y con punto al final): '),
    read(Nombre),
    (   estudiante(Nombre, _, Nota)
    ->  write('El estudiante '), write(Nombre),
        write(' tiene nota '), write(Nota), nl,
        (   Nota >= 4.0
        ->  write('Estado: aprobado'), nl
        ;   write('Estado: reprobado'), nl
        )
    ;   write('El estudiante no existe en la base de datos.'), nl
    ).



% --- Calculadora ---

% calculadora: pide dos numeros y una operacion y muestra el resultado
% La operacion se ingresa como palabra: suma, resta, multiplicacion o division
calculadora :-
    write('Ingrese el primer numero (con punto al final): '),
    read(Num1),
    write('Ingrese el segundo numero (con punto al final): '),
    read(Num2),
    write('Ingrese la operacion (suma, resta, multiplicacion, division): '),
    read(Operacion),
    (   Operacion == suma
    ->  Resultado is Num1 + Num2
    ;   Operacion == resta
    ->  Resultado is Num1 - Num2
    ;   Operacion == multiplicacion
    ->  Resultado is Num1 * Num2
    ;   Operacion == division
    ->  Resultado is Num1 / Num2
    ;   Resultado = error
    ),
    write('Resultado: '), write(Resultado), nl.
% --- Menu principal ---

% menu: muestra las opciones disponibles y se repite hasta que el usuario elige salir
menu :-
    repeat,
    nl,
    write('===== CENTRO DE APOYO ACADEMICO ====='), nl,
    write('1. Consultar estado de un estudiante'), nl,
    write('2. Usar la calculadora'), nl,
    write('3. Salir'), nl,
    write('Ingrese una opcion (con punto al final): '),
    read(Opcion),
    (   Opcion == 1
    ->  mostrar_estado_estudiante, fail
    ;   Opcion == 2
    ->  calculadora, fail
    ;   Opcion == 3
    ->  write('Saliendo del programa. Hasta luego!'), nl, true
    ;   write('Opcion no valida, intente nuevamente.'), nl, fail
    ).
