%Importing data file, extracting features, data reduction and creating training dataset

source_dir = 'D:\Thesis\Machine learning data base\Mis alignment\MISALIGNMENT'
dtm=[];
source_files = dir(fullfile(source_dir, '*.xlsx'));
%Importing all xlxs file from a folder containing the vibration signals
for i = 1:length(source_files)
  data = readtable(fullfile(source_dir, source_files(i).name));
  dm = [table2array(data)]; 
  f = dm(:,1);
  dm=dm(:,2:4);
%Taking derivatives of signals w.r.t the frequency 
  gdm=gradient(mean(dm,2),f);
  dtm = [dtm;gdm];
end
%Interpolating to fill the missing values
dtm=fillmissing(dtm,'linear');
%Reshaping the stored signal arrays
Cm = reshape(dtm,1600,i);

source_dir = 'D:\Thesis\Machine learning data base\STRUCTURE LOOSENESS\STRUCTURAL LOOSENESS\'
dts=[];
source_files = dir(fullfile(source_dir, '*.xlsx'));
for i = 1:length(source_files)
  data = readtable(fullfile(source_dir, source_files(i).name));
  ds = [table2array(data)]; 
  f = ds(:,1);
  ds=ds(:,2:4);
  gds=gradient(mean(ds,2),f);
  dts = [dts;gds];
end

dts=fillmissing(dts,'linear');
Cs = reshape(dts,1600,i);


source_dir = 'D:\Thesis\Machine learning data base\Bearing problem\NDE bearing problem\Formatted data\BEARING PROBLEM\'
dtb=[];
source_files = dir(fullfile(source_dir, '*.xlsx'));
for i = 1:length(source_files)
  data = readtable(fullfile(source_dir, source_files(i).name));
  db = [table2array(data)]; 
  f = db(:,1);
  db=db(:,2:4);
  gdb=gradient(mean(db,2),f);
  dtb = [dtb;gdb];
  
end 
dtb=fillmissing(dtb,'linear');
Cb = reshape(dtb,1600,[]);

source_dir = 'D:\Thesis\Machine learning data base\natural data'
dtwp=[];
source_files = dir(fullfile(source_dir, '*.xlsx'));
for i = 1:length(source_files)
  data = readtable(fullfile(source_dir, source_files(i).name));
  dwp = [table2array(data)]; 
  f = dwp(:,1);
  dwp=dwp(:,2:4);
  gdwp=gradient(mean(dwp,2),f);
  dtwp = [dtwp;gdwp];
  
end 
dtn=fillmissing(dtwp,'linear');
Cwp = reshape(dtwp,1600,[]);

%Merging all the inputs in an array
in=[transpose(Cs);transpose(Cm);transpose(Cb);transpose(Cwp)];
% Converting into table variable for convenience
  data=array2table(in);
  
%   Constructing output vector
    for j=1:42

        data.target{j} = 'structural looseness';
    end
    for j=43:160

        data.target{j} = 'mis alignment';
    end
   for j=161:240

        data.target{j} = 'bearing problem';
   end

   for j=241:254

        data.target{j} = 'natural data';
    end
out=data.target;
%Training with SVM Classifiaar
[trainedClassifier6, validationAccuracy] = trainClassifier6(data);
% %Making Predictions
yfit = trainedModelpcann.predictFcn(inputs1) 
