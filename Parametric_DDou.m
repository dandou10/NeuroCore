close all; clear all; clc;

%Exercise1_1: Plot X(wing) vs Y(tail)

Wing_length = [10.4 10.8 11.1 10.2 10.3 10.2 10.7 10.5 10.8 11.2 10.6 11.4];
Tail_length = [7.4 7.6 7.9 7.2 7.4 7.1 7.4 7.2 7.8 7.7 7.8 8.3];

figure
scatter(Wing_length, Tail_length);
xlabel('Wing length (cm)');
ylabel('Tail length (cm)');

%Exercise1_2: calculate r using equations

n = length(Wing_length);
samplemeanX = sum(Wing_length)./n;
samplemeanY = sum(Tail_length)./n;
Pearson_numerator = sum((Wing_length - samplemeanX).*(Tail_length - samplemeanY));
Pearson_denominator_X=sum((Wing_length - samplemeanX) .^2);
Pearson_denom_Xsqrt = sqrt(Pearson_denominator_X);
Pearson_denominator_Y=sum((Tail_length - samplemeanY) .^2);
Pearson_denom_Ysqrt = sqrt(Pearson_denominator_Y);
Pearson_denominator = (Pearson_denom_Xsqrt * Pearson_denom_Ysqrt);
Pearson = Pearson_numerator / Pearson_denominator;

%Calculate r using corrcoef;

Pearson2 = corrcoef(Wing_length, Tail_length); %Pearson and Pearson2 are the same value

%Exercise1_3: calculate standard error

sr = sqrt((1-(Pearson).^2)/(n-2));

%confidence interval

z = 0.5 .* log((1+Pearson)/(1-Pearson));
sz = sqrt(1/(n-3));
z_space = z+[1 -1] .*norminv(0.025).*sz;
confidence_interval = (exp(2.*z_space)-1)./(exp(2.*z_space)+1); %95 percent CI is between 0.59 and 0.96

%Exercise1_4

t = Pearson/sr;
p = 1-tcdf(t,(n-2));%p<0.05

%Exercise1_5

z_Yale = 0.5*log((1.75/0.25));
big_Z =(z - z_Yale)/sqrt(1/(n-3));
new_p = 1-tcdf(big_Z/2,inf); %p>0.05

%Exercise1_6
t_needed = tinv(1-0.05/2,n-2);
r_needed = sqrt(t_needed^2/(t_needed^2 + (n-2)));
z_needed = 0.5*log((1+r_needed)/(1-r_needed));

new_big_Z=(z-z_needed)*sqrt(n-3);
power=normcdf(new_big_Z); %power is 0.97904

