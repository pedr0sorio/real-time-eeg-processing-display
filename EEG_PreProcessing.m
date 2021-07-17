function [eeg] = EEG_PreProcessing(eeg, fs)

%N = length(eeg);
%% Removing the offset
%eeg = eeg - mean(eeg);
%% Removing the EMF noise (50Hz and 100Hz notch filter)
% for k = 1:2
%     wo = 50*k/(fs/2);
%     bw = wo/20;
%     [b,a] = iirnotch(wo,bw);
%     %
%     %fvtool(b,a)
%     %
%     eeg = filtfilt(b,a,eeg);  
% end

%% LP filter Matlab - lowpass()
% fpass = 30;
% eeg = lowpass(eeg,fpass,fs,'ImpulseResponse','iir','Steepness',0.75);

%% LP filter Matlab - designfilt()

% eeg = filter(lpFilt,eeg);

%% LP filt Butter

n = 6;
fc = 30;
Wn = fc/(fs/2);
[b,a] = butter(n,Wn);
eeg = filtfilt(b,a,eeg);

end