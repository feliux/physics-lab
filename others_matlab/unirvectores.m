function z=unirvectores(v,w)
%Dados dos vectores calcula la uni�n de ambos.
%Ejemplo: v=[1 2 -4 1 0] w=[2 2 0 9]
%Dar�a como resultado z=[1 2 -4 0 9]
z=[v w];       %Unimos ambos vectores.
n=length(z);
i=1;
for i=1:n-1       %FOR para identificar las repeticiones.
    for j=i+1:n
        if z(i)==z(j)
            z(j)=nan;  %Cambiamos el valor del n�mero repetido a NaN.
        end
    end
end
i=1;
while i<=n        %Bucle para eliminar dichas repeticiones.
    if isnan(z(i))
        z(i)=[];  %Al dar un valor vac�o a z(i), se acorta length(z).
        i=i-1;    %Por eso hay que hacer i=i-1 (para no adelantar el contador).
    end
    n=length(z);  %length(z) var�a, por lo que lo volvemos a calcular.
    i=i+1;        %Adelantamos contador bucle normal.
end