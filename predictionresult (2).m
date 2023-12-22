
%from Here erlerier Prediction%
%%source_dir = 'D:\Thesis\prediction\p4\'
%dtb=[];
%source_files = dir(fullfile(source_dir, '*.xlsx'));
%for i = 1:length(source_files)
  %data1 = readtable(fullfile(source_dir, source_files(i).name));
  %dm = [table2array(data1)]; 
  %f = dm(:,1);
 % dm=dm(:,2:4);
 % gdm=gradient(mean(dm,2),f);
 % dtb = [dtb;gdb];
%end 
%dtm=fillmissing(dtb,'linear');
%Cm = reshape(dtb,1600,i);

%Merging all the inputs in an array
%in=[transpose(Cm)];
 %Converting into table variable for convenience
 % data=array2table(in);
   %yfit = trainClassifier6.predictFcn(data1) 
 %yfit = trainedMode6.predictFcn(data)
% y= trainedModel6.predictFcn(data)
% Till this earlier Prediction %

source_dir = 'D:\Thesis\prediction\p4'
dtm=[];
source_files = dir(fullfile(source_dir, '*.xlsx'));
for i = 1:length(source_files)
  data1 = readtable(fullfile(source_dir, source_files(i).name));
  dm = [table2array(data1)]; 
  f = dm(:,1);
  dm=dm(:,2:4);
  gdm=gradient(mean(dm,2),f);
  dtm = [dtm;gdm];
end

dtm=fillmissing(dtm,'linear');
Cm = reshape(dtm,1600,i);

source_dir = 'D:\Thesis\prediction\structural loosenes'
dts=[];
source_files = dir(fullfile(source_dir, '*.xlsx'));
for i = 1:length(source_files)
  data1 = readtable(fullfile(source_dir, source_files(i).name));
  ds = [table2array(data1)]; 
  f = ds(:,1);
  ds=ds(:,2:4);
  gds=gradient(mean(ds,2),f);
  dts = [dts;gds];
end

dts=fillmissing(dts,'linear');
Cs = reshape(dts,1600,i);


source_dir = 'D:\Thesis\prediction\BEARING PROBLEM'
dtb=[];
source_files = dir(fullfile(source_dir, '*.xlsx'));
for i = 1:length(source_files)
  data1 = readtable(fullfile(source_dir, source_files(i).name));
  db = [table2array(data1)]; 
  f = db(:,1);
  db=db(:,2:4);
  gdb=gradient(mean(db,2),f);
  dtb = [dtb;gdb];
  
end 
dtb=fillmissing(dtb,'linear');
Cb = reshape(dtb,1600,[]);

source_dir = 'D:\Thesis\prediction\Natural data'
dtwp=[];
source_files = dir(fullfile(source_dir, '*.xlsx'));
for i = 1:length(source_files)
  data1 = readtable(fullfile(source_dir, source_files(i).name));
  dwp = [table2array(data1)]; 
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
    for j=1:4

        data.target{j} = 'structural looseness';
    end
    for j=5:93

        data.target{j} = 'mis alignment';
    end
   for j=94:104

        data.target{j} = 'bearing problem';
   end

   for j=105:113

        data.target{j} = 'natural data';
    end
out=data.target;

% yfit = trainClassifier6.predictFcn(data) 
 %yfit = trainedMode6.predictFcn(data)
 y= trainedModel6.predictFcn(data)
