function [MFCCVector,nameSounds] = train(  )
% Train the features from the path

path='/usr/local/MATLAB/R2014a/bin/Manoj Word Rec/Data/';
d=dir(path);
isub = [d(:).isdir];
nameSounds = {d(isub).name}';
nameSounds(ismember(nameSounds,{'.','..'})) = [];
for i=1:length(nameSounds)    
	myFolder = strjoin(strcat(path,nameSounds(i,1)));
	filePattern = fullfile(myFolder, '*.wav');
	myFiles = dir(filePattern);    
	for k = 1:length(myFiles)
		baseFileName = myFiles(k).name;
  		fullFileName = fullfile(myFolder, baseFileName);
        [s, fs] = wavread(fullFileName);    
        v{k} = mfcc(s, fs);
  		fprintf(1, 'Now reading %s\n', fullFileName);   
    end
    MFCCVector{i}=v;
    clearvars v;
end
nameSounds=nameSounds';
end

