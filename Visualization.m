figure
for i =1:8
subplot(4,2,i)
periodogram(Cs(:,i));figure(gcf);
xlabel('')
ylabel('')
title('')
xlabel(' Frequency  (kHz)')
ylabel('Magnitude(dB)')
title('Power Spectrum of Bearing Problems')
grid on;
hold on
end

figure
for i =1:8
subplot(4,2,i)
periodogram(Cb(:,i));figure(gcf);
xlabel('')
ylabel('')
title('')
xlabel(' Frequency  (kHz)')
ylabel('Magnitude(dB)')
title('Power Spectrum of Bearing Problems')
grid on;
hold on
end
figure
for i =1:8
subplot(4,2,i)
periodogram(Cm(:,i));figure(gcf);
xlabel('')
ylabel('')
title('')
xlabel(' Frequency  (kHz)')
ylabel('Magnitude(dB)')
title('Power Spectrum of Misalignment')
grid on;
hold on
end
figure
for i =1:8
subplot(4,2,i)
periodogram(Cwp(:,i));figure(gcf);
% xlabel('')
% ylabel('')
% title('')
xlabel(' Frequency  (kHz)')
ylabel('Magnitude(dB)')
title('Power Spectrum of Natural Signal')
grid on;
hold on
end