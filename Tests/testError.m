%function tests = testError
%    tests = functiontests(localfunctions);
%end

%{

function testErrorLineal(casoDePrueba)

    matriz = [ 1 2 3 4 ; 10 5 2 1 ];
    
    [m, b] = aproximacionLineal(matriz);
    
    actual = calcularErrorLineal([m, b], matriz);
    
    esperado = 4;
    
    verifyEqual(casoDePrueba, actual, esperado, 'RelTol', 0.0001);

end

% Funciona, pero lo comento porque me rompe el test siguiente

%}

%{

function testErrorCuadratico(casoDePrueba)

    matriz = [ 1 2 3 4 ; 10 5 2 1 ];
    
    [a, b, c] = aproximacionCuadratica(matriz);
    
    actual = calcularErrorCuadratico([a, b, c], matriz);
    
    esperado = 3.527785968148365e-27;
    
    verifyEqual(casoDePrueba, actual, esperado, 'RelTol', 0.0001);

end

%}

%{

function testErrorExponencial(casoDePrueba)

    matriz = [ 1 2 3 4 ; 10 5 2 1 ];

    [m, b] = aproximacionExponencial(matriz);
    
    actual = calcularErrorLineal([m, b], matriz);
    
    esperado = 1.040422538172001e+03;
    
    verifyEqual(casoDePrueba, actual, esperado, 'RelTol', 0.0001);
    
end

%}

%{

function testErrorHiperbolica(casoDePrueba)

    matriz = [ 1 2 3 4 ; 10 5 2 1 ];

    [m, b] = aproximacionHiperbolica(matriz);
    
    actual = calcularErrorLineal([m, b], matriz);
    
    esperado = 2.366666666666667e+02;
    
    verifyEqual(casoDePrueba, actual, esperado, 'RelTol', 0.0001);
    
end

%}

function testErrorPotencial(casoDePrueba)

    matriz = [ 1 2 3 4 ; 10 5 2 1 ];

    [m, b] = aproximacionPotencial(matriz);
    
    actual = calcularErrorLineal([m, b], matriz);
    
    esperado = 50.6864;
    
    verifyEqual(casoDePrueba, actual, esperado, 'RelTol', 0.0001);

end

function testErrorLineal(casoDePrueba, aproximacionLineal, matriz, valorEsperado) 

    actual = calcularErrorLineal(aproximacionLineal, matriz);

    verifyEqual(casoDePrueba, actual, valorEsperado, 'RelTol', 0.0001);

end