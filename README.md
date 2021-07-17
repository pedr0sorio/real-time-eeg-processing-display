# Realtime EEG Processing and Display

Real-time EEG signal processing and display in MATLAB.

This project was developed within the scope of the [IASB] curricular unit of the 1st Year/2nd Semester of the [Master in Biomedical Engineering] at [Instituto Superior Técnico, Universidade de Lisboa]. The full report can also be consulted (**recommended**).

##### This project was developed by: 
 - **[Diogo Antunes]**
 - **[Pedro Osório]**

The project can be divided into two parts:
- The acquistion device (hardware).
- The processing and display software.

The repository includes all the files (ArduinoIDE code and MATLAB code) used to perform the signal's acquisition, realtime processing and display.

A few guidelines and explanations will also be given with regards to the hardware used. For larger detail consult the report which is also within this directory.

### Requirements
- Any kind of arduino (e.g. Seeeduino XIAO).
- Bluetooth module for wireless information transfer (serial cable communication can also be used, however with larger suscetability to noise)
- MATLAB
- ArduinoIDE
- EEG sensor and elctrodes
- Power Supply

## Project Overview
### Montage
A set of electrodes are used to collect signal from specific locations of the subject’s scalp. The various electrodes are connected to an EEG sensor, which outputs a single channel raw EEG signal through the analog pin Vout. This output pin is connected to an analog pin of the Seeeduino XIAO, which enables us to sample the the analog signal into digital codes (10-bit ADC) and redirect them to a Bluetooth module via the XIAO’s TX pin. When a computer is paired with this module, the data reaching the latter is broadcasted to the respective PC Bluetooth Communication Port. At this point, we can use a MATLAB script to access the PC’s Communication Port and store the samples of the EEG signal being printed onto it by the module. The sampling rate is defined in the Arduino code (_ArduinoCode_ directory) executed by the XIAO and in this case was specified to 250 Hz, which is well above twice the highest relevant EEG frequency. The Arduino code and the MATLAB files were all delivered alongside this report.
Once the data is being received by the computer, we can process a user-specified window of the signal, extract its features, and plot it at a user-specified frequency.
Finally, a LiPo 3.7V rechargeable battery is used to power the XIAO via the 5V pin, which, in turn, will power both the sensor and the Bluetooth module via the 3.3V pin.

 <a href="url"><img src=./images/pipeline_with_intrr.jpg align="center"></a>
 
**Figure 1** - Montage schematic.

### Processing and Display
Data coming from the sensor is sampled into digital codes by the XIAO’s 10-bit ADC and broadcasted to the computer’s Bluetooth Communication Port at 250 Hz.
We developed a MATLAB script (_Main.m_) that detects every time a new value is printed onto a user-specified communication port and runs a specific function. We created a function for this purpose (_callbackserial.m_) that stores the last printed value and, from time to time, processes a window of the EEG signal and displays various features. The length of the window and the frequency of the processing and display can all be specified by the user in the _Main.m_ script.
The processing done during our acquisitions was twofold, providing both time and frequency information. Regarding the time information, we low pass filter at 30 Hz (_EEG_PreProcessing.m_) and plot the most recent 5 second window of our signal every 4 seconds, providing a continuous tracking of the evolution of our waveform. When it comes to the frequency information, we computed the Power Density Spectrum (PDS) of the last 5 second window also at the same rate (_pds_plot_realtime.m_). Adding to that, the relative band powers are also computed and displayed alongside with the PDS plot. Our processing steps are summarised in Figure 2.

 <a href="url"><img src=./images/realtimeprocessing_rose.png align="center"></a>

**Figure 2** - Processing and display pipeline.

It was also within the scope of this project to use our acquistion, processing and display solution to test the output signals from various types of EEG electrodes. We tested several types of electrodes and, inclusively, created our own electrodes which were 3D printed with a conductive polymer. See designs in repository [3d-printed-eeg-electrodes].

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen.)

   [Diogo Antunes]: <https://github.com/>
   [Pedro Osório]: <https://github.com/pedr0sorio>
   [IASB]: <https://fenix.tecnico.ulisboa.pt/cursos/mebiom/disciplina-curricular/1529008374839>
   [Master in Biomedical Engineering]: <https://fenix.tecnico.ulisboa.pt/cursos/mebiom>
   [Instituto Superior Técnico, Universidade de Lisboa]: <https://tecnico.ulisboa.pt/en/)>
   [3d-printed-eeg-electrodes]: <https://github.com/pedr0sorio/3d-printed-eeg-electrodes>
