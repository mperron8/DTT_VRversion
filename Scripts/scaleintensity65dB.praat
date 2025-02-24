#########################################################################################################
#
# Normalisation de l'Intensité
#
# © Mélanie Thibeault, Modifié par Pascale Tremblay, juin 2017
#                                                               
#########################################################################################################

form Emplacement des wav?
   word directory /Users/mperron/Desktop/DDT/Stimuli/Female
endform

clearinfo

# liste
Create Strings as file list... list 'directory$'/*.wav

# boucle principale
numberOfFiles = Get number of strings
for ifile to numberOfFiles
   select Strings list
   fileName$ = Get string... ifile
   file$ = fileName$ - ".wav"
   Read from file... 'directory$'/'file$'.wav
  Scale intensity... 65

   Save as WAV file... 'directory$'/'file$'_65dB.wav
    Remove
endfor

select Strings list
Remove