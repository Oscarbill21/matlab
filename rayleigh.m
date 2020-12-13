%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Date          :  2012
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Script for computing the BER for BPSK modulation in a
% Rayleigh fading channel

clear
clc
N = 10^6;
% number of bits or symbols

% Transmitter
ip = rand(1,N)>0.5; % generating 0,1 with equal probability
s = 2*ip-1; % BPSK modulation 0 -> -1; 1 -> 0

 
Eb_N0_dB = [-3:35]; % multiple Eb/N0 values

for ii = 1:length(Eb_N0_dB)
   
   n = 1/sqrt(2)*[randn(1,N) + j*randn(1,N)]; % white gaussian noise, 0dB variance
   h = 1/sqrt(2)*[randn(1,N) + j*randn(1,N)]; % Rayleigh channel
   
   
%                     y = sqrt(rho)*h*x + n
%                     y = h*x + 1/sqrt(rho)*n
%                     y = h*x + sigma*n
   % Channel and noise Noise addition
   y = h.*s + 10^(-Eb_N0_dB(ii)/20)*n;

   % equalization
   % yHat=(hs+n)/h=s+(n/h);
   yHat = y./h;

   % receiver - hard decision decoding
   ipHat = real(yHat)>0;

   % counting the errors
   nErr(ii) = size(find([ip- ipHat]),2);

end

simBer = nErr/N;                                   % simulated ber
theoryBerAWGN = 0.5*erfc(sqrt(10.^(Eb_N0_dB/10))); % theoretical ber
EbN0Lin = 10.^(Eb_N0_dB/10);
theoryBer = 0.5.*(1-sqrt(EbN0Lin./(EbN0Lin+1)));

% plot
close all
figure
semilogy(Eb_N0_dB,theoryBerAWGN,'b+-','LineWidth',1.2);
hold on
semilogy(Eb_N0_dB,theoryBer,'r-','LineWidth',1);
semilogy(Eb_N0_dB,simBer,'k->','LineWidth',1);
axis([-3 35 10^-5 0.5])
grid on
legend('AWGN-Theory','Rayleigh-Theory', 'Rayleigh-Simulation');
xlabel('Eb/No, dB');
ylabel('Bit Error Rate');
title('UoN Light Option 2020 Class: BPSK under Rayleigh channels');
