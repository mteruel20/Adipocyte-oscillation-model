%% Modeling ODEs with noise
% Added to GitHub on 2017-06-08

tspan = [0:300]; % time is in hours
x0 = [0.1 0.1 0.1]; % initial values
R =.57; % 
stimend = 48;
c = 3;
mu=0;
sigma=0.3;

numsamples = 1;
lastvalue = zeros(numsamples,3);
figure, hold on
diff=0;
for ind = 1:numsamples
   % noise = lognrnd(mu,sigma);
    noise=1;
    [t,x] = ode45(@(t,x) model4(t,x,R,noise,stimend,c), tspan,x0);
    lastvalue(ind,1) = x(end,1);
    lastvalue(ind,2) = x(end,2);
    lastvalue(ind,3) = x(end,3);
    if lastvalue(ind,1) > 2
        diff=diff+1
    end
    figure(gcf)
    plot(t,x(:,1),'r') % plot PPARG(t)
   %plot(t,x(:,2),'b')
    plot(t,x(:,3),'b')
    legend({'PPARG','FABP4'})
%     axis([0 240 0 2.5])
end
percentdiff=diff/numsamples
