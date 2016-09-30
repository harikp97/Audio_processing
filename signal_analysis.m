% In this file the audio used is the voice signal, please correct the file path to get output.
% The filter defined is h2, for analysing h1, please change the filter definition
% For obtaining the output after signal is passed through filter twice, replace y2 with y.
% If filter is changed please swap the order of plotting of input and output to avoid masking.


Fs = 44100;                        %Sampling Frequency
x = audioread('C:\Users\Harikrishnan\Documents\MATLAB\Voice\voice.wav');  %input signal
h = [-1 -1 -1 2 1 1 1]/2;            %Impulse response

y = convolution(x,h);             %Finding output using convolution, convolution function has been defined in a separate matlab file
y2 = convolution(y,h);            %Finding output after filtering twice          
l1 = length(x);                   %length of signal
n_x = 2^nextpow2(l1);             %converting length of signal to the next highest power of 2
X = fft(x,n_x);                   %fourier transform
X = X(1:n_x/2);                   %removing half of the signal
mag_X = abs(X) ; 

l2 = length(y);                   %length of signal
n_y = 2^nextpow2(l2);             %converting length of signal to the next highest power of 2
Y = fft(y,n_y);                   %fourier transform
Y = Y(1:n_y/2);                   %removing half of the signal
mag_Y = abs(Y) ; 


figure(1);
plot((Fs*(0:(n_y/2)-1))/n_y,mag_Y,'color','g');   %plot the output Signal in Frequency Domain
hold on
plot(Fs*(0:((n_x/2)-1))/n_x,mag_X,'color','b');   %plot the input Signal in Frequency Domain


xlabel('Frequency(in Hz)')                        %Add x label
ylabel('Power')                                   %Add y label
title('Original and Output Signals in Frequency Domain(Music Signal)')     %Add Title
legend('Output Signal','Original Signal')
out = y;                           

figure(2);
plot((1:length(out))/44100,out,'color','r')         %Plot Output Signal in Time Domain
hold on
plot((1:length(x))/44100,x,'color','b')  %Plot Input Signal in Time Domain

      
xlabel('Time(in sec)')                              %Add X label
ylabel('Amplitude')                                 %Add Y label
title('Original and Output Signal in Time Domain(Music Signal)')                %Add Title
legend('Output Signal','Original Signal')           %Add Legend
