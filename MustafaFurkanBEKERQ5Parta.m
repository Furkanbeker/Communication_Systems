Fs = 96000; 
recObj = audiorecorder(Fs, 16, 1);  
disp('Speak for 5 seconds...');
recordblocking(recObj, 5);  
x = getaudiodata(recObj);  
x = x / max(abs(x));  
sound(x, Fs);  
