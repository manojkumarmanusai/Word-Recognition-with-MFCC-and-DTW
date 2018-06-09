function [class,distmin] = test(MFCCVector,nameSounds)
Fs=8000;
fprintf(1, 'Immediately utter a word after pressing enter \n');
pause();
myRecObj = audiorecorder();
record(myRecObj);
pause(2);
stop(myRecObj);
y=getaudiodata(myRecObj);
ipv=mfcc(y,Fs);
distmin=inf;
for i=1:length(nameSounds) 
    v_class=MFCCVector{1,i};
    for k=1:length(v_class) 
        melv=v_class{1,k};
        dist=dtw(ipv,melv);
         if dist < distmin
            distmin = dist;
            class = nameSounds(1,i);
        end 
    end
end 
msg = sprintf('Recognized Word %s', strjoin(class));
disp(msg);
end

