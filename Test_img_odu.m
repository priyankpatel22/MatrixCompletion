randn('state',2009);
rand('state',2009);

%%
M3 = imread('ODU3','bmp');
M = double(M3(:,:,2));

figure; plot(svd(M))
[n1,n2] = size(M);
r = 10;

df = r*(n1+n2-r);
oversampling = 5;
m = round(min(5*df,round(.99*n1*n2))/2);
p  = m/(n1*n2);

Omega = randsample(n1*n2,m);
data = M(Omega);

[x, y] = ind2sub([n1,n2], Omega);
Y = ones(n1,n2)*200;
for i = 1:m
	  Y(x(i),y(i)) = M(x(i),y(i));
end
rank(Y)
%% Set parameters and solve
tau =100*sqrt(n1*n2)  %increase tau to increase accuracy; decrease it for speed
% delta = 1.2/p   % delta < 2 is a safe choice, but the algorithm may be slower than necessary
							     delta = 1;
maxiter = 1000;
tol = 1e-4;

% Approximate minimum nuclear norm solution by SVT algorithm
fprintf('\nSolving by SVT...\n');
tic
[U,S,V,numiter] = SVT2([n1 n2],Omega,data,tau,delta,maxiter,tol);
toc

%%
X = U*S*V';
% Show results                                                                                                                                                                    
fprintf('The recovered rank is %d\n',rank(X) );                                                                                                                                   
fprintf('The relative error on Omega is: %d\n', norm(data-X(Omega))/norm(data))                                                                                                   
fprintf('The relative recovery error is: %d\n', norm(M-X,'fro')/norm(M,'fro'))                                                                                                    
fprintf('The relative recovery in the spectral norm is: %d\n', norm(M-X)/norm(M))                                                                                                 
                                                                                                                                                                                  
figure; imshow(uint8(Y))                                                                                                                                                          
figure; imshow(uint8(M))                                                                                                                                                          
figure; imshow(uint8(X))
