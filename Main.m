%% Real Time EEG signal Processing and Display
clear all; close all; clc;
%% Inputs
global signal fs X Y Geeg plot_time 

plot_time = [];
signal = [];

% Defining the COM
% *Depends on the computer, check device manager*
serial_port = 'COM10';

% Must match the frequency at which the samples are appearing in the serial
% port
sp = 4;
%
fs = 1/(sp*10^-3); %Hz

% Sensor Data for ADC code to uV 
Geeg = 41782;
% Number of samples in between new plots
X = 1000;
%
Xs = (X * sp) * 10^-3;
% Number of samples in each plot
Y = 1250;
%
Ys = (Y * sp) * 10^-3;
%
disp(['Plotting the last ' num2str(Ys) ' seconds every ' num2str(Xs) ' seconds'])
%% Setting Up the serial data retreival

if ~isempty(instrfind)
    fclose(instrfind);
    delete(instrfind);
end

s = serial(serial_port);

% Definição da função que é chamada sempre que u novo valor aperece na COM
s.BytesAvailableFcn = {@callbackserial};

% Depois de correr esta secção corres fopen(s) para abrir a serial com pelo
% matlab e começar a ir buscar os dados em real time.
% fclose(s) para fechar
%
% Não dá para ter a COM do arduino aberta, senão o matlab não lhe consegue
% aceder.
disp('done')
%% Open
fopen(s)
disp('open')
%% Close
fclose(s)
disp('closed')
%% Clean
signal = [];
disp('cleared')
%% Save
saved_signal_eC = signal;

