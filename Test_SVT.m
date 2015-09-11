clear all
clc
%% Setup a matrix
randn('state',2009);
rand('state',2009);

%ODU_image_mat = imread('ODU3','bmp');
%M = double(ODU_image_mat(:,:,2));

%image_mat = imread('.\2.1.05.tiff');
%image_mat_BW = double(image_mat(:,:,1));
M = dlmread('input_matrix2.dat');

fprintf('Matrix created..');
%M = M_float;
[n1,n2] = size(M);

p = 1;
tic
for i = 1:320                  
    for j = 1:48520    
        if(i<316)
            Omega(p,:) = sub2ind(size(M), j, i);
            p = p+1; 
        end;
        if(i>=316)
            if(j < 35832)
                Omega(p,:) = sub2ind(size(M), j, i);
                p = p+1;
            end;
        end;
          
    end;
end;
toc
%display(m);
%display(size(m));
%Omega(Omega==0)=[];

fprintf('Got Omega..');

data = M(Omega);
%disp(size(data));
% add in noise, if desired

sigma = 0;

tau = 10*sqrt(n1*n2); 
delta = 1;

maxiter = 1800; 
tol = 1e-7;

fprintf('\nSolving by SVT...\n');
tic
[U,S,V,numiter] = SVT([n1 n2],Omega,data,tau,delta,maxiter,tol);
toc
    
X = U*S*V';
dlmwrite('X2_10_1800_7_small.dat',X,'delimiter','\t');
    
% Show results
fprintf('The recovered rank is %d\n',length(diag(S)) );
fprintf('The relative error on Omega is: %d\n', norm(data-X(Omega))/norm(data))
fprintf('The relative recovery error is: %d\n', norm(M-X,'fro')/norm(M,'fro'))
fprintf('The relative recovery in the spectral norm is: %d\n', norm(M-X)/norm(M))
%}    

T = dlmread('trgt_matrix.dat');

p = 1;
q = 1;
for i = 1:20                  
    for j = 1:320    
        if(j>=316)
                k(p,:) = X(i, j);
				l(q,:) = T(i, j);
                p = p+1;
				q = q+1;
        end;
           
    end;
end;
fprintf('Output vectors created..');

plot(l,'r');
hold on;
plot(k,'b');
hold off;
ylim([-2 2]);
saveas(gcf,'file_10_1800_7_small.png');
fprintf('tau = %d, itr = %d, tol = %d', tau,maxiter,tol);

p = 1;
q = 1;
for i = 1:100                  
    for j = 1:320    
        if(j>=316 && i>80)
                k(p,:) = X(i, j);
				l(q,:) = T(i, j);
                p = p+1;
				q = q+1;
        end;
           
    end;
end;
fprintf('Output vectors created..');

plot(l,'r');
hold on;
plot(k,'b');
hold off;
ylim([-2 2]);
saveas(gcf,'file_10_1800_7_small.png');
fprintf('tau = %d, itr = %d, tol = %d', tau,maxiter,tol);
