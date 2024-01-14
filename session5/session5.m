%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%  MATLAB Brush Up Course: Session 5  %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%   by JOAN MARGALEF   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% PRACTICAL EXERCISE: Replicating a Paper
% "Caught in a Trap: Simulating the Economic Consequences of Internal Armed
% Conflict" 

% The session includes the modelling and simulation of a Markov Process 
% which contains different states of peace and war. We will simualate the
% evolution of GDP in a MonteCarlo fashion to estimate the distribution of 
% the effects of Conflict on GDP per capita.




                        %% 0. STRATEGY %%

% Previously, I have estimated several coefficients that work as
% inputs of this code:

% 1. Transition Probs
%      STATE 1 = PERMANENT PEACE (Absorbing State)
%      STATE 2 = WAR
%      STATE j= j-2 YEARS PEACE AFTER CONFLICT (UNSTABLE PEACE)

% 2. Estimated coefficients from regressing GDP Growth and Life Expectancy 
%    on a dummy representing each STATE

% Note that regressions were performed using dummies, so the effect of
% each STATE is measured relative to the control one (S1=PERMANENT PEACE). 
%
% Therefore,we have to define the evolution of the variables in 
% PERMANENT PEACE (as benchmark), and add the STATE-contingent change 
% using the estimated coefficients.


%% 1. Preparing Matrices 

clc; clear        
TM = load('TM_7AS7.csv');
GVec = load('GVec_7AS7.csv');
        

% 1 - Make Stable Peace Abosrbing

% 2 - Given transition is 2 ways: war or +1 year of peace. 
% We need just one the probability of war. Create a Vector
% called TR War with this probabilities. 

% 3 - Place ABS PEACE probability and growth at the end of each vector

% 4 - What is the probability that a country that starts in CONFLICT
% will reach STABLE PEACE without falling back to CONFLICT? 





% SOLUTION

TM(1,1)=1;
TM(1,2)=0;

TRwar=TM(:,2); %This gives the Pr(STATE 2 = WAR |STATE)

TRwar(10)=TRwar(1); 
TRwar=TRwar(2:10); 

GVec(10,:)=GVec(1,:); 
GVec=GVec(2:10,:);


prob=1-TRwar(1)
for i=2:9

prob=prob * (1-TRwar(i));

end

prob

%% 2. Simulation


% 1- Given what we know, simulate GDP of a country that starts in war.
%    Take GDP0=100, and sumlate the markov process for 30 years

% 2 - Plot evolution of GDP


% 3 - Do the same for 1000 countries






% Solution

% 1 Country

T=30;

%Create a matrix of unifrom draws for each (n,t) to do STATE transitions.
RAND=rand(1,T);

%Create matrix to store STATES
svec=zeros(1,T);
svec(1,1)=1; %Initial STATE is WAR

%Create matrix to store the values for each country at each time
GDPvec=zeros(1,T);
GDPvec(1,1)=100;  %Initial stock of GDP is 100



GDP=100;
s=1;
for t=2:T
%First updates variables, and then see what will happen next period

GDP=GDP*(1+ normrnd(GVec(s,1),GVec(s,2))); 


 if s==9  %if reach STATE 9=PERMANENT PEACE, don't update (ABSORBING)
    
 else
        if RAND(1,t)<=TRwar(s)   %Next STATE is WAR
           s=1;
           
        else     %Next STATE is one more year of UNSTABLE PEACE
           s=s+1;            
           
        end 
 end


 
%Store values    
svec(1,t)=s;  

GDPvec(1,t)=GDP;


end

        
figure
plot(GDPvec);
title('Simulated GDP Evolution Over 30 Years'); % Adding a title
xlabel('Year'); % Label for the x-axis
ylabel('GDP'); % Label for the y-axis
 


% 1000 Countries
                    
N=100000;
T=30;   

%Create a matrix of unifrom draws for each (n,t) to do STATE transitions.
RAND=rand(N,T);

%Create matrix to store STATES
svec=zeros(N,T);
svec(:,1)=1; %Initial STATE is WAR

%Create matrix to store the values for each country at each time
GDPvec=zeros(N,T);
GDPvec(:,1)=100;  %Initial stock of GDP is 100




for n=1:N
    %Initial values for each country (path)
    s=1;

    GDP=100;
    
    
   for t=2:T
       %First updates variables, and then see what will happen next period

       %To account for the volatility of the estimated coefficients 
       % we draw growth from a Normal(estimed_coeff, SE(estimed_coeff))

       GDP=GDP*(1 + normrnd(GVec(s,1),GVec(s,2))); 

     
         if s==7+2  %if STATE 9=PERMANENT PEACE, don't update (ABSORBING)
            
         else
                if RAND(n,t)<=TRwar(s)   %Next STATE is WAR
                   s=1;
                   
                else     %Next STATE is one more year of UNSTABLE PEACE
                   s=s+1;            
                   
                end 
         end

      
         
     %Store values    
     svec(n,t)=s;  

     GDPvec(n,t)=GDP;
     
      
   end
end
        



%See all paths
figure
 for n=1:N
 plot(GDPvec(n,:));
 hold on;
 end 
title('Simulated GDP Evolution Over 30 Years'); % Adding a title
xlabel('Year'); % Label for the x-axis
ylabel('GDP'); % Label for the y-axis

%% 3. Analysis

% 1 - Calculate the ratio of countries that recover

% 2 - Calculate the mean, Q75, Q90 of GDP at every period

% 3 - Express them in terms of LOSS (100 - GDP)

% 4 - Plot the evolution of this statistics




recovered = sum(GDPvec(:,T)>100);
r_recovered=recovered/N


% For every period, calculate: the Average and (2.5, 97.5) Quantiles

GDPav=zeros(1,T);
GDPq25=zeros(1,T);
GDPq10=zeros(1,T);

    for t=1:T
    
    GDPt=GDPvec(:,t);
    
    GDPav(1,t)=mean(GDPt);
    GDPq25(1,t)=quantile(GDPt,0.25);
    GDPq10(1,t)=quantile(GDPt,0.10);
    
    end


    %Express with LOSS
    LOSSav=100 - GDPav;
    LOSSq75=100 - GDPq25;
    LOSSq90=100 - GDPq10;

    %Plot
    t=[0:T-1]; %Vector of periods
    figure
    plot(t, LOSSav,'k','LineWidth',1)
    hold on
    plot(t, LOSSq75)
    hold on
    plot(t, LOSSq90)
    ylabel('Real GDPpc LOSS (%)','FontWeight','bold')
    xlabel('Year','FontWeight','bold')
    legend('Average',  'Q75', 'Q90','Location','northwest')
    title('Evolution of GDP LOSS')

    
   