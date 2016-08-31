% THIS FUNCTION TAKES THE FFT OF A SIGNAL AND PASSES IT
% THROUGH AN EQUALIZER FILTER
function Y=eqFunction(X,K,a,b)

% CALCULATE FILTER COEFFICIENTS (Z DOMAIN)
B=[K+a-K*a+1 2*b+2*a*b a-K+a*K+1]
A=[2 2*b+2*a*b 2*a]

[H,w]=freqz(B,A,length(X));
Y=X.*H;

figure(10);
plot(10*log10(abs(H).^2))
drawnow;

