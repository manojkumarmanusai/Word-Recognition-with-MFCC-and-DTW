Steps to follow:

1.train.m and locate line 4, update the variable path corressponding to file path in the system where The files required for the training resides. 

The folder "Data" shows the sample of the training data folder which contains subfolders corresponding to the voice. Each subfolders in Data folder contains the audio files (.wav format) of the sound which indicated by subfolder name.

2.Run train.m
[MFCCVector,nameSounds] = train()

3.Run test.m
[class,distmin] = test(MFCCVector,nameSounds)
If you have any queries feel free to drop a mail to manusai.manoj@gmail.com 
