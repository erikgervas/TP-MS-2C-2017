function [a,b,c] = aproximacionCuadratica(X)
%X es la matriz que representa la tabla de valores

n=length(X(1,:));
A=0;%Es la sumatoria de Xi 
B=0;%Es la sumatoria de Yi
C=0;%Es la sumatoria de Xi al cuadrado
D=0;%Es la sumatoria de Xi al cubo
E=0;%Es la sumatoria de Xi a la cuarta
F=0;%Es la sumatoria de Yi*Xi
G=0;%Es la sumatoria de Yi*(Xi al cuadrado)

%Se obtiene la tabla 
for i=1:n; 
    A=A+X(1,i); 
    B=B+X(2,i); 
    C=C+(X(1,i))^2; 
    D=D+(X(1,i))^3;
    E=E+(X(1,i))^4;
    F=F+X(1,i)*X(2,i);
    G=G+X(1,i)^2*X(2,i); 
end


%Aplico regla de Cramer
m =[E D C;D C A;C A n];
mx =[G D C;F C A;B A n];
my =[E G C;D F A;C B n];
mz =[E D G;D C F;C A B];
md=det(m);

a=det(mx)/md;
b=det(my)/md;
c=det(mz)/md;


%Se ubican los puntos
for i=1:n; 
    hold on; 
    plot (X(1,i),X(2,i),'*','MarkerEdgeColor','r','LineWidth',1); 
end 
 
%Extremos a considerar para el gr�fico
e1 =-X(1,1);
e2=X(1,n);

%Grafico de la par�bola obtenida
fplot(@(x) a*x.^2 + b*x + c,[e1 e2],'b')
title('Aproximaci�n cuadr�tica por m�nimos cuadrados');

end
