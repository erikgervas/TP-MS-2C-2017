function graficarAproximacionCuadratica(a, b, c, X, decimales)

    for i=1:length(X(1,:)) 
        hold on; 
        plot (X(1,i),X(2,i),'*','MarkerEdgeColor','r','LineWidth',1); 
    end 

    %Extremos a considerar para el gr�fico
    
    e1=min(X(1,:))-10;
    e2=max(X(1,:))+10;
    e3=min(X(2,:))-10;
    e4=max(X(2,:))+10;

    %Grafico de la par�bola obtenida
    
    fplot(@(x) a*x.^2 + b*x + c,'k')
    xlim([e1 e2]);
    ylim([e3 e4]);
    
    title(mostrarFuncion(a, b, c, decimales), 'interpreter', 'latex');
    
    xlabel(mostrarError(a, b, c, X, decimales), 'interpreter', 'latex');
    
end

function [funcion] = mostrarFuncion(a, b, c, decimales) 

    funcion = ['Polinomio aproximante: $' OptimizarParaLabel(a,decimales) 'x^{2} + ' OptimizarParaLabel(b,decimales) 'x + ' OptimizarParaLabel(c,decimales) '$'];

end

function [error] = mostrarError(a, b, c, X, decimales)

    error = ['Error: ' OptimizarParaLabel(calcularErrorCuadratico([a, b, c], X),decimales)];

end