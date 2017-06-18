function [S, f] = Freqs(sig, Fs)

S = 20*log(abs(fft(sig))/sqrt(length(sig)));
S = S(1:floor(length(S)/2));
f = linspace(0,Fs/2, length(S));
