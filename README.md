# Realtime EEG Processing and Display

Real-time EEG signal processing and display in MATLAB

This project was developed within the scope of the [IASB] curricular unit of the 1st Year/2nd Semester of the [Master in Biomedical Engineering] at [Instituto Superior Técnico, Universidade de Lisboa].

Data coming from the sensor is sampled into digital codes by the XIAO’s 10-bit ADC and broadcasted to the computer’s Bluetooth Communication Port at 250 Hz.
We developed a MATLAB script (_Main.m_) that detects every time a new value is printed onto a user-specified communication port and runs a specific function. We created a function for this purpose (_callbackserial.m_) that stores the last printed value and, from time to time, processes a window of the EEG signal and displays various features. The length of the window and the frequency of the processing and display can all be specified by the user in the _Main.m_ script.
The processing done during our acquisitions was twofold, providing both time and frequency information. Regarding the time information, we low pass filter at 30 Hz and plot the most recent 5 second window of our signal every 4 seconds, providing a continuous tracking of the evolution of our waveform. When it comes to the frequency information, we computed the Power Density Spectrum (PDS) of the last 5 second window also at the same rate. Adding to that, the relative band powers are also computed and displayed alongside with the PDS plot. Our processing steps are summarised in Figure 1.

 <a href="url"><img src=./images/realtimeprocessing_rose.png align="left" height="300" width="600"></a>

**Figure 1** - Pipeline.



[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen.)

   [Diogo Antunes]: <https://github.com/>
   [Pedro Osório]: <https://github.com/pedr0sorio>
   [IASB]: <https://fenix.tecnico.ulisboa.pt/cursos/mebiom/disciplina-curricular/1529008374839>
   [Master in Biomedical Engineering]: <https://fenix.tecnico.ulisboa.pt/cursos/mebiom>
   [Instituto Superior Técnico, Universidade de Lisboa]: <https://tecnico.ulisboa.pt/en/)>
