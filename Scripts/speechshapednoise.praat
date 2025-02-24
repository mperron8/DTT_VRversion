# This Praat script takes the average LTAS of a set of audio files
# and filters a segment of white noise according to this average LTAS. 
#
## This script is a MODIFIED version of: 
# 2009 Theo Veenker, Lisette van Delft, Hugo Quen�
# 
# See Quen� & Van Delft (2010). Speech Commun, 52, 911-918. 
# doi:10.1016/j.specom.2010.03.005

form speech shaped noise duration
 comment enter duration in seconds
   real duration 10
   natural samplerate 44100
endform

pause select all the sound(s) used to make long-term average spectrum

Concatenate
int = Get intensity (dB)
    To Ltas... 100

# Create some white noise and convert to a spectrum
Create Sound from formula... noise Mono 0 'duration' samplerate  randomGauss(0,0.1)
To Spectrum... no
select Sound noise
Remove

# Apply LTAS envelope to white noise spectrum and convert back to sound
select Spectrum noise
Formula... self * 10 ^ (Ltas_chain(x)/20)
To Sound
Scale intensity... 'int'
Rename... speech_shaped_noise

# Cleanup
select Ltas chain
plus Spectrum noise
plus Sound chain
Remove