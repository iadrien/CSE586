function [restoredimage,Energy,itr] = rof(I_noise,stepsize,max_itr,tolerence)

%% initial set up for gradient descent 
% initialize duals
n=length(I_noise);
w1=zeros(n);
w2=zeros(n);
             
% compute the x and y gradient
scaledimage=0.04*I_noise;
gradientx = [scaledimage(:,2:n)-scaledimage(:,1:n-1), zeros(n,1)];
gradienty = [scaledimage(2:n,:)-scaledimage(1:n-1,:); zeros(1,n)];

% computer the euler lagrange component
div=([w1(:,1),w1(:,2:n)-w1(:,1:n-1)] + [w2(1,:);w2(2:n,:)-w2(1:n-1,:)]); 

% Energy updates
Energy(1)=0.5*sum(sum((div-scaledimage).^2));

restoredimage=I_noise - (1/0.04)*div;

% compute divergence of the gradient
divergencex = [restoredimage(:,2:n)-restoredimage(:,1:n-1), zeros(n,1)];
divergencey = [restoredimage(2:n,:)-restoredimage(1:n-1,:); zeros(1,n)];

gu_norm = sqrt(divergencex.^2+divergencey.^2);
currenttolerence(1)= sum(sum(gu_norm + divergencex.*w1 + divergencey.*w2));   

%% gradient descent
for itr=1:max_itr
  % compute the gradient with fourier transform
  dFourierx = [div(:,1:n-1)-div(:,2:n), zeros(n,1)] + gradientx;
  dFouriery = [div(1:n-1,:)-div(2:n,:); zeros(1,n)] + gradienty;  

  % moving alone the direction of gradient
  w1 = w1 - stepsize * dFourierx;
  w2 = w2 - stepsize * dFouriery;
  wnorm= max(1, sqrt(w1.^2+w2.^2));
  w1 = w1./wnorm;
  w2 = w2./wnorm;
  
  % update the Energy array  
  div=([w1(:,1),w1(:,2:n)-w1(:,1:n-1)] + [w2(1,:);w2(2:n,:)-w2(1:n-1,:)]); 
  Energy_new=0.5*sum(sum((div-scaledimage).^2));
  Energy(itr+1)=Energy_new;
  %Compute the primal u and the duality gap
  restoredimage=I_noise - (1/0.04)*div;   
  divergencex = [restoredimage(:,2:n)-restoredimage(:,1:n-1), zeros(n,1)];
  divergencey = [restoredimage(2:n,:)-restoredimage(1:n-1,:);zeros(1,n)];
  gu_norm = sqrt(divergencex.^2+divergencey.^2);
  currenttolerence(itr+1)= sum(sum(gu_norm + divergencex.*w1 + divergencey.*w2));    

  % test for convergence:  
  DualVal=0.5*0.04*sum(sum(I_noise.^2))-Energy_new/0.04; 
  currenttolerence(itr+1) = currenttolerence(itr+1)/(abs(DualVal+currenttolerence(itr+1))+abs(DualVal));
 
  if (currenttolerence(itr+1) < tolerence )
    break
  end
  
end    
