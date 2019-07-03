function yhat = calcGPP_LRC_basic(params,x)
%         Input:    - PPFD (x)
%                   - parameter (alpha)
%                   - parameter (beta)
%         Output:   modeled GPP
%         Features: Returns array of GPP based on the hyperbolic model in the 
%                   form: Y = (ax+b)/(bx+c)
%         Ref:      Lasslop et al. 2010 eq. 2
%      
% x(:,1) is PPFD, x(:,2) is Tair, x(:,3) is betaR

alpha=params(1); beta=params(2); 

yhat=(alpha*beta*x(:,1)./(alpha*x(:,1)+beta));
