% THIS PROGRAM ALLOWS YOU TO LOOK AT DIFFERENT VERSIONS OF THE EQUALIZER
% BY VARYING THE INPUT PARAMETERS K,a, and b
clear all
close all

K=[2 2 2 2] %ADJUSTS BAND PASS GAIN
a=[.3 .4 .5 .6]%ADJUSTS WIDTH 
b=[.5 .5 .5 .5]%ADJUSTS LOCATION OF BANDPASS CENTER

% CALCULATE FILTER COEFFICIENTS (IN Z DOMAIN)
for n=1:4
    B(n,:)=[K(n)+a(n)-K(n)*a(n)+1 2*b(n)+2*a(n)*b(n) a(n)-K(n)+a(n)*K(n)+1]
    A(n,:)=[2 2*b(n)+2*a(n)*b(n) 2*a(n)]
end

% OBTAIN FILTER RESPONSE IN FREQUENCY DOMAIN
[H1,w]=freqz(B(1,:),A(1,:),1000);
[H2,w]=freqz(B(2,:),A(2,:),1000);
[H3,w]=freqz(B(3,:),A(3,:),1000);
[H4,w]=freqz(B(4,:),A(4,:),1000);

% PLOT GAIN IN FREQUENCY DOMAIN (NORMALIZED FREQUENCY)
c1=10*log10(abs(H1).^2);
c2=10*log10(abs(H2).^2);
c3=10*log10(abs(H3).^2);
c4=10*log10(abs(H4).^2);
figure(10);
a=0:1/1000:(1-1/1000);
plot(a,c1,a,c2,a,c3,a,c4)
legend('a=.3','.4','.5','.6');
title('Equalizer  with a=.5,k=2');
xlabel('normalized frequency');
ylabel('db');
drawnow;