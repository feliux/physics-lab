function corazonpolares
%
%Dibuja un coraz�n en coordenadas polares.
%f=(sin(theta).*sqrt(cos(theta))./sin(theta)+7/5)-2.*sin(theta)+2
%
t = 0:.01:2*pi;  %t==theta.
f = ( sin(t) .* sqrt(abs(cos(t))) ) ./ (sin(t) + 7/5) - 2 .* sin(t) + 2; %Ecuaci�n.
polar(t,f) %Help polar para m�s info.
set(findobj('Type','line'),'Color',[.50 .0 .0],'Linewidth', 2);