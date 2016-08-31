% THIS PROGRAM DOES THREE THINGS:
% 1. IT ACCOMPLISHES PART OF THE DERIVATION OF THE EQUALIZER
% COEFFICIENTS EQUATIONS
% 2. IT ENHANCES THE LOW FREQUENCIES IN A SIGNAL BY USING THE EQUALIZER
% 3. IT ENHANCES THE HIGHER FREQUENCIES IN A SIGNAL BY USING THE EQUALIZER

clear all
close all

% THIS IS PART OF THE DERIVATION
% F IS THE FILTER IN THE FREQUENCY DOMAIN
syms F A K a b z
A=(z^-2+b*(1+a)*z^-1+a)/(1+b*(1+a)*z^-1+a*z^-2)
F=1/2*(1+A)+1/2*K*(1-A)
collect(F)

clear all

% LOAD AND PLOT ORIGINAL SIGNAL
filepath='C:\Users\jafergas\Desktop\Project3\Presentation Songs\road.wav';%road
[x, Fs, nbitsOrig] = wavread(filepath);
x=x(:,1);
X=fft(x);
figure(1)
plot(10*log10(abs(X).^2))
drawnow;

% LOWER FREQUENCY ENHANCEMENT
Y1=eqFunction(X,10,.01,-.9999);
Y1=eqFunction(Y1,.01,.8,.9999);
% HIGHER FREQUENCY ENHANCEMENT
Y2=eqFunction(X,.01,.01,-.9999);
Y2=eqFunction(Y2,.10,.8,.9999);

% PLOT SIGNALS IN THE FREQUENCY DOMAIN IN DECIBELS
figure(4);
plot(10*log10(abs(Y1).^2))
ylabel('10log_{10}(Y1)');
drawnow
figure(5);
plot(10*log10(abs(Y2).^2))
ylabel('10log_{10}(Y2)');
drawnow

% GET THE TWO SIGNALS IN THE TIME DOMAIN
y1=real(ifft(Y1));
y2=real(ifft(Y2));

% PLAY THE SIGNALS
wavplay(y1,Fs);
wavplay(y2,Fs);
% SAVE RESULTS
savepath='C:\Users\jafergas\Desktop\Project3\Presentation Songs\lowEnhanced.wav';
wavwrite(y1,Fs,16,savepath);
savepath='C:\Users\jafergas\Desktop\Project3\Presentation Songs\highEnhanced.wav';
wavwrite(y2,Fs,16,savepath);