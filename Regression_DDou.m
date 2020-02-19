close all; clear all; clc; clf;

%Exercise1-1

Age = [3 4 5 6 8 9 10 11 12 14 15 16 17]; 
Wing_length = [1.4 1.5 2.2 2.4 3.1 3.2 3.2 3.9 4.1 4.7 4.5 5.2 5];

hold on;
scatter(Age,Wing_length);
xlabel('Age');
ylabel('Wing length');

%Exercise1-2


n = length(Age); 
SumX = sum(Age); 
MeanX = mean(Age); 
SumXsq = sum(Age.^2);  
Sumx2 = SumXsq - SumX^2/n; 

SumY = sum(Wing_length); 
MeanY = mean(Wing_length); 
SumXY = sum(Age.*Wing_length);
Sumxy = SumXY - SumX*SumY/n;
SumYsq = sum(Wing_length.^2);


b = Sumxy/Sumx2;

a=MeanY - b*MeanX;

X = [3 17];
WingLengthPred = a + b*X;
plot(X,WingLengthPred);

%Exercise1-3

df = n-2;
totalsumsquare = SumYsq - SumY^2/n;
regressionsumsquare = Sumxy^2/Sumx2;
residualsumsquare=totalsumsquare-regressionsumsquare;
syx=sqrt((residualsumsquare/df));
sb=sqrt(syx^2/Sumx2);
t=(b-0)/sb;
p = 1-tcdf(t,n-2); %p < 0.05

%Exercise1-4

t2=-1*tinv(.05/2,n-2);
lower_CI=b-t2*sb; 
higher_CI=b+t2*sb;

lower_CI_intercept=MeanY-lower_CI*MeanX; %intercept for lower CI
higher_CI_intercept=MeanY-higher_CI*MeanX; %intercept for upper CI
plot(X,lower_CI*X+lower_CI_intercept);
plot(X,higher_CI*X+higher_CI_intercept);

%Exercise1-5

r=regressionsumsquare/totalsumsquare;



