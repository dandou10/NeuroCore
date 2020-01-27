close all; clear all; clc;

%%Exercise_1
quanta=10;%quanta available
release_prob=0.2;%prob of each release event
released=0:10; %range of quanta that can be released
pdf=binopdf(released,quanta,release_prob)

%%Exercise_2
quanta=14;%quanta available
reported_prob=0.1;
released=8;%quanta that were released
prob_1=binopdf(released,quanta,0.1)%1.5959e-05
prob_2=binopdf(released,quanta,0.2)%0.002
prob_3=binopdf(released,quanta,0.3)%0.0232
prob_4=binopdf(released,quanta,0.4)%0.0918
prob_5=binopdf(released,quanta,0.5)%0.1833
prob_6=binopdf(released,quanta,0.6)%0.2066
prob_7=binopdf(released,quanta,0.7)%0.12
prob_8=binopdf(released,quanta,0.8)
prob_9=binopdf(released,quanta,0.9)
prob_10=binopdf(released,quanta,1.0)%release prob of 0.6 was the most probable

%%Exercise_3
released1=8;%quanta from exp 1
released2=5;%quanta from exp 2
quanta=14;%available quanta from both exps
true_release_prob=0.1;
likelihood1=binopdf(released1,quanta,0.1) 
likelihood2=binopdf(released2,quanta,0.1)
total_likelihood=likelihood1*likelihood2
log_likelihood=log(likelihood1)+log(likelihood2)

range=transpose(0:0.1:1.0); %possible release probabilities
range_length=length(range);


    a=repmat([released1 released2], range_length, 1);
    b=repmat([quanta quanta], range_length, 1);
    c=repmat(range, 1, 2);
    
probs=binopdf(a,b,c);

figure(1)
total_likelihood_array=prod(probs,2);
dan1=plot(range,total_likelihood_array);
ylabel('Likelihood');
xlabel('Release Probability');
max=max(total_likelihood_array);%%the max value is 0.0224 at release prob 0.5

figure(2)
log_likelihood_array=sum(log(probs),2);
dan2=plot(range,log_likelihood_array);
ylabel('Log Likelihood');
xlabel('Release Probability');
log_likelihood_array(1,1)=0; %Matlab would not give max value because of Inf value. Replacing inf values with 0 such that Matlab will return the reasonable maximum.
log_likelihood_array(11,1)=0;
maxlog=max(log_likelihood_array);%From the curve, the maximum value is at release prob 0.5 (log likelihood ~-4)

%to increase resolution:
range2=(0:0.01:1.0);
dan3=plot(range2,total_likelihood_array);
ylabel('Likelihood');
xlabel('Release Probability');


%%Exercise_4
count=[0 0 3 10 19 26 16 16 5 5 0 0 0 0 0];
quanta4=length(counts)-1;
released=0:14;
range_exercise4=(0:0.01:1.0);
range_length=length(range_exercise4);

a=repmat(released, range_length, 1);
    b=quanta4;
    c=repmat(range_exercise4, 1, 14);
probs_ex4=binopdf(a,b,c);
    
count_mat=repmat(count,range_length,1);

total_likelihood4=prod(probs_ex4.^count_mat,2);
calculate_p=range_exercise4(total_likelihood4==max(total_likelihood4));

log_likelihood4=sum(log(probs).*count_mat,2);
calculate_p_log=range_exercise4(log_likelihood4==max(log_likelihood4));

%%Exercise_5

quanta5=14;
released5=7;
calculate_p5=binofit(released5,quanta5)
null_hypothesis=0.3;
calculate_new_p=binopdf(released5,quanta5,null_hypothesis); %p=0.5 which is >0.05, so we cannot reject the null hypothesis

