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
%M_float = floor(imresize(matrix_M,[48520,320]));

fprintf('Matrix created..');
%M = M_float;
figure; plot(svd(M))
[n1,n2] = size(M);

r = 10;
df = r*(n1+n2-r);

%fprintf('%d = df\n', df);

oversampling = 5; 
%m = min(5*df,round(.99*n1*n2)); 
%fprintf('%d = m\n', m);

%p  = m/(n1*n2);
%fprintf('%d = p\n', p);
%display(m);
%Omega = randsample(n1*n2,m);  % this requires the stats toolbox
% a workaround, if you don't have the stats toolbox, is this:
%   Omega = randperm(n1*n2); Omega = Omega(1:m);
%display(Omega);
%disp(size(Omega));

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
Omega(Omega==0)=[];

fprintf('Got Omega..');

data = M(Omega);
%disp(size(data));
% add in noise, if desired

sigma = 0;
% sigma = .05*std(data);
%data = data + sigma*randn(size(data));

%fprintf('Matrix completion: %d x %d matrix, rank %d, %.1f%% observations\n',...
%    n1,n2,r,100*p);
%fprintf('\toversampling degrees of freedom by %.1f; noise std is %.1e\n',...
%    m/df, sigma );
%if ~isreal(M), disp('Matrix is complex'); end


tau = 100*sqrt(n1*n2); 
delta = 1.2;

maxiter = 600; 
tol = 1e-4;

fprintf('\nSolving by SVT...\n');
tic
[U,S,V,numiter] = SVT([n1 n2],Omega,data,tau,delta,maxiter,tol);
toc
    
X = U*S*V';
dlmwrite('X2_100_600_4_1_new_12.dat',X,'delimiter','\t');
    
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
saveas(gcf,'file_100_600_4_1_new_12.png');
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
saveas(gcf,'file_100_600_4_new_14png');
fprintf('tau = %d, itr = %d, tol = %d', tau,maxiter,tol);
