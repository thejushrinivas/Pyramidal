clear all;
clc;
% Load the data 

L='D:\Tej\Training.csv';
load(L);
L1='D:\Tej\Testing.csv';
load(L1);

for i = 1:88
i1=1;
for j = 1:19000
Diff(j,i) = (Training(i1,i) - Training (i1+1,i));
i1= i1+2;
end
end

for i = 1:88
i1=1;
for j = 1:9500
DiffDiff(j,i) = (Diff(i1,i) - Diff(i1+1,i));
i1= i1+2;
end
end

for i = 1:88
i1=1;
for j = 1:4750
DiffDiffDiff(j,i) = (DiffDiff(i1,i) - DiffDiff(i1+1,i));
i1= i1+2;
end
end

for i = 1:24
i1=1;
for j = 1:19000
Diff1(j,i) = (Testing(i1,i) - Testing (i1+1,i));
i1= i1+2;
end
end

for i = 1:24
i1=1;
for j = 1:9500
Diff1Diff1(j,i) = (Diff1(i1,i) - Diff1 (i1+1,i));
i1= i1+2;
end
end

for i = 1:24
i1=1;
for j = 1:4750
Diff1Diff1Diff1(j,i) = (Diff1Diff1(i1,i) - Diff1Diff1(i1+1,i));
i1= i1+2;
end
end

Instance =4% Number of Characters N_of_C
T1=zeros(1,Instance);
count=1;
for i=1:Instance,
  for j=1:22,    % declare the no of views that gone to be trained
    T1(1,count)=i;
    count=count+1;
    j=j+1;
    end
end


X = DiffDiffDiff(:,1:13);
X(:,14:26) = DiffDiffDiff(:,14:26);


%Acutal Code of GRNN and PNN
F_M1 = DiffDiffDiff  ; %(final/100);
F21= Diff1Diff1Diff1 ; %(finaltest/100);

net = newgrnn(F_M1,T1);
y2 = sim(net,F21);

correct_char=length(find(y2==2))




