function producmatriz(A,B)
%Realiza la multiplicaci�n de matrices mediante bucles.
%Donde A(nxm) y B=(mxp) -> (n,m)x(m,p)=(n,p)
sA=size(A);  %Tama�o de A
sB=size(B);  %Tama�o de B
if sA(1,2)~=sB(1,1)  
    disp('Imposible hacer la multiplicaci�n matricial')
else
    C=[];  %Formamos matriz C.
    for i=1:sA(1,1)  %N�mero de filas.
        for j=1:sB(1,2)  %N�mero de columnas.
            for r=1:sA(1,2)  %Variable.
                c(1,r)=A(i,r).*B(r,j);  %Vector que almacena los productos.
            end
            C(i,j)=sum(c);  %Sumamos los valores de 'c' y los colocamos en (i,j).
        end
    end
end
C  %Mostramos el resultado.
