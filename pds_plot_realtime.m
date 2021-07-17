function pds_plot_realtime(x,fs,i,window,fmax)

figure(i)
nfft =  2^15;
[psdx,freq]  = pwelch(x,window*fs,[],nfft,fs);

% Computing EMF interference level - Power at 50 Hz before Filtering
flim = 50;
fstep = freq(2);
fsample_50 = ceil(flim/fstep);

Power_at_50_Hz = 10 * log10(psdx(fsample_50));

flim = fmax;
fstep = freq(2);
smax = ceil(flim/fstep);

plot(freq(1:smax),10*log10(psdx(1:smax)))
% ylim([-10 35])
grid on
xlabel('Frequency (Hz)')
ylabel('Power/Frequency (dB/Hz)')

p_delta = bandpower(psdx,freq,[1 3],'psd');
p_teta = bandpower(psdx,freq,[3.5 7.5],'psd');
p_alpha = bandpower(psdx,freq,[7.5 13],'psd');
p_beta = bandpower(psdx,freq,[14 29],'psd');

p_delta_rel = round(100 * p_delta/(p_delta+p_teta+p_alpha+p_beta));
p_teta_rel = round(100 * p_teta/(p_delta+p_teta+p_alpha+p_beta));
p_alpha_rel = round(100 * p_alpha/(p_delta+p_teta+p_alpha+p_beta));
p_beta_rel = round(100 * p_beta/(p_delta+p_teta+p_alpha+p_beta));

% text(15,25,['Relative Band Powers:' newline  'Delta - ' num2str(p_delta_rel) '%' newline 'Teta - ' num2str(p_teta_rel) ...
%             '%' newline 'Alpha - ' num2str(p_alpha_rel) '%' newline 'Beta - '  num2str(p_beta_rel) '%' ...
%             newline newline 'Power at 50Hz: '  num2str(Power_at_50_Hz) ' dB'])

text_box = ['Relative Band Powers:' newline  'Delta - ' num2str(p_delta_rel) '%' newline 'Teta -  ' num2str(p_teta_rel) ...
            '%' newline 'Alpha - ' num2str(p_alpha_rel) '%' newline 'Beta -  '  num2str(p_beta_rel) '%' ...
            newline newline 'Power at 50Hz: ' newline  num2str(Power_at_50_Hz) ' dB'];

delete(findall(gcf,'type','annotation'))
annotation('textbox', [0.6, 0.55, 0.3, 0.35], 'String', text_box)


end