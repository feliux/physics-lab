function guardasecuencia
%Script que dado un n�mero 'n' crea una secuencia tal que 1,fact(2),...,fact(n)
%Adem�s guarda en un fichero secuencia.txt el vector formado.
%Invocaci�n: guardasecuencia
n=input('Inserte n�mero: ');
secuencia(1)=1;
for i=2:n
    secuencia(i)=i.*secuencia(i-1);  %Factorial de 'n'.
end
disp('La secuencia es: ')
disp(secuencia)
save secuencia.txt -ascii  %Guarda la secuencia en archivo secuencia.txt