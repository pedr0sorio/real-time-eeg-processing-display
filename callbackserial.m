function callbackserial(s,~)
global signal fs X Y Geeg plot_time

% Scanning value in the serial port
val = fscanf(s);
% Converting to double
eeg = str2double(val);
% Storing Signal
signal = [ signal, eeg ];

N = length(signal);

if (mod(N,X) == 0 && Y < N)
    tic
    % Plotting last Y samples of the signal every X samples
    eeg_window = signal(1,(N-Y:N));
    eeg_window_unfilt = eeg_window;
    %     tic
    %     eeg_window = signal;
    % Converting values to volts
    eeg_window = ( ( (eeg_window/(2^10)) - 0.5 ) * 3.3 ) * (10^6) / Geeg;   % uV
    
    % PreProcess window of eeg signal
    eeg_window = EEG_PreProcessing(eeg_window,fs);
    
    % Plotting the signal in time and in freq domain
    figure(1);
    title('EEG Signal')
    ylabel('uV')
    plot(eeg_window)
    ylim([-40 40])
    
    % Plotting the signal in frequency domain
    % fft_plot(eeg_window,fs,2)
    window = 1;
    fmax = 30;
%     pds_plot_realtime(eeg_window,fs,2,window,fmax)
    pds_plot_realtime(eeg_window_unfilt,fs,2,window,fmax)
    plot_time = [plot_time, toc];
    
end
end