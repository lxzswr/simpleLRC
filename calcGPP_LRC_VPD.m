function yhat = calcGPP_LRC_VPD(params,x)
%         Input:    - PPFD, vpd (x)
%                   - parameter (alpha)
%                   - parameter (beta)
%         Output:   modeled GPP
%         Features: Returns array of GPP based on the hyperbolic model in the 
%                   form: Y = (ax+b)/(bx+c)
%         Ref:      Lasslop et al. 2010 eq. 2
%      
% x(:,1) is PPFD, x(:,2) is VPD, x(:,3) is Tair, x(:,4) is betaR

alpha=params(1); beta0=params(2); k=params(3);
vpd0=10; %hpa

vpd_tmp=x(:,2); 

beta=beta0*ones(length(vpd_tmp),1);
beta(vpd_tmp >= vpd0) = beta0*exp(-1*k*(vpd_tmp(vpd_tmp >= vpd0)-vpd0));

yhat=(alpha*beta.*x(:,1)./(alpha*x(:,1)+beta));
