T=40;
f=1/T;
w=2*pi*f;
t= 0:0.002:21;
N=50;

C=zeros(1,2*N+1);    % initializare vector de coeficienti cu valori nule
x=square(w*t,50)     % semnal simetric monoredresat de perioada principala T si durata D
for n = -N:N
    C(n+N+1) = 1/T*integral(@(t)(square(w*t,50)).*exp(-1j*n*w*t),0,T);  %calculul propriu-zis al coeficientilor cu formula analitica
    re = real(C(n+N+1));
    im = imag(C(n+N+1));
end

C(n+N+1) = re+1j*im  
xr = 0;
for n = -N:N
    xr = xr+C(n+N+1)*exp(1j*n*w*t);
end                   % reconstruirea semnalului initial cu 50 de componente

figure(1);

hold on
plot(t,xr);           % reprezentarea semnalului reconstruit
plot(t,x);            % reprezentarea semnalului initial
xlabel('Timpul[s]');
title('Suprapunerea semnalelor x(t) si xr(t)')
hold off

figure(2)

hold on
stem((-N:N)*w,2*abs(C));
plot((-N:N)*w,2*abs(C),'-go');
xlabel('K');
ylabel('Amplitudinile');
title('Spectrul de amplitudini');

hold off
