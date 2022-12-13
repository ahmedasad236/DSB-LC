clear all;
close all;

%%%%%%%%%%% Reading the audio signal %%%%%%%%%%%%%%%%%%%%%%%
filename='audio.wav';
[mt, Fs] = audioread(filename); % mt is the message, Fs is the sample frequency   
signal_info = audioinfo(filename);
signal_length = length(mt);
t = linspace(0, signal_length/Fs, signal_length); % time
f = -Fs/2:(Fs/signal_length):(Fs/2)-(Fs/signal_length); % frequency
mt_1d = mt(:, 1); % one dimension of the message 
%%%%%%%%%%% Plotting the message in time domain %%%%%%%
figure
plot(t, mt)
xlabel("t")
ylabel("m(t)")
title("Time Domain")

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Signal in frequency Domain %%%%%%%%%%%%%%%%%
% Firstly, apply fourier transform using fft(mt) function
% Then, apply fftshift() function to make the fourier transform appear in +Ve and -Ve
% abs for extracting real parts
mf = abs(fftshift(fft(mt)));
figure
plot(f, mf)
xlabel("f")
ylabel("mf")
title("Signal Spectrum")

%%%%% Signla Amplitude in Frequency Domain %%%%%%%%%%%%%%%%%
m_amplitude = abs(fft(mt));
figure
plot(f, m_amplitude)
title('Signal Amplitude')

%%%%%%%%%%%%% Signal Phase in frequency Domain %%%%%%%%%%%%%%%%%%
m_phase = unwrap(angle(fft(mt)));
figure
plot(f, m_phase)
title('Signal Phase')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Carrier Modulation %%%%%%%%%%%%%%%%%%%
fc = Fs / 4;
ct = cos(2*pi*fc*t);
cf = abs(fftshift(fft(ct)))/Fs;

% Modulation index u = Mp / Ac -----> Ac = (Mp / u)
u = 0.5;
Ac = abs(min(mt)) / u; 
st = (Ac + mt)' .* ct; % Modulated Signal

%%%%%% Modulated Signal in Time Domain %%%%%%%%%%%
figure
plot(t, st)
xlabel("t")
ylabel("s(t)")
title("Modulated signal in Time Domain")
%%%%%% Modulated Signal in Frequency Domain %%%%%%%%%%%
sf = abs(fftshift(fft(ct)))/Fs;
figure
plot(f, sf)
xlabel("f")
ylabel("s(f)")
title("Modulated Spectrum in Frequency Domain")

%%%%% Modulated Signla Amplitude in Frequency Domain %%%%%%%%%%%%%%%%%
s_amplitude = abs(fft(st));
figure
plot(f, s_amplitude)
title('Modulated Signal Amplitude')

%%%%%%%%%%%%% Modulated Signal Phase in frequency Domain %%%%%%%%%%%%%%%%%%
s_phase = unwrap(angle(fft(st)));
figure
plot(f, s_phase)
title('Modulated Signal Phase')

%%%%%%%%%%%%%%%% Demodulation in time domain %%%%%%%%%%%%%%%%%%%%%%%%
xt = 2 * lowpass((st .* ct), fc, Fs,'Steepness', 0.95) - Ac;
figure
plot(t, xt)
xlabel("t")
ylabel("x(t)")
title("Demodulated signal in Time Domain")
%%%%%%%%%%%%%%%% Demodulation in Frequency domain %%%%%%%%%%%%%%%%%%%%%%%%
xf = abs(fftshift(fft(xt)))/Fs;
figure
plot(f, xf)
xlabel("f")
ylabel("x(f)")
title("Demodulated Spectrum in Frequency Domain")
%%%%% Demodulated Signla Amplitude in Frequency Domain %%%%%%%%%%%%%%%%%
x_amplitude = abs(fft(xt));
figure
plot(f, x_amplitude)
title('Demodulated Signal Amplitude')

%%%%%%%%%%%%% Demodulated Signal Phase in frequency Domain %%%%%%%%%%%%%%%%%%
x_phase = unwrap(angle(fft(xt)));
figure
plot(f, x_phase)
title('Demodulated Signal Phase')
%%%%%%%%%%%%%%%%%%%%% Save the output in a file %%%%%%%%%%%%%%%%%%%%%%%
audiowrite('output.wav', xt, Fs);