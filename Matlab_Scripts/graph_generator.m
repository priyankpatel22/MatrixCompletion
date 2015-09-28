clear all
close all
clc
M = dlmread('trgt_matrix.dat');
p = 1;
tic
for i = 1:12689                  
    for j = 1:320    
        if(j>=316)
                m(p,:) = M(i, j);
                p = p+1;
        end;
           
    end;
    display(i);
end;
toc

display(m);
display(size(m));

stairs(m,'r','Marker','.','MarkerFaceColor','r');
ylim([-5 5]);
saveas(gcf,'file.png');


%{
% Show results                                                                                                                                                                    
rankX = rank(X);                                                                                                                                                                  
errorX = norm(data-X(Omega))/norm(data);                                                                                                                                          
fprintf('The recovered rank is %d\n',rankX );                                                                                                                                     
fprintf('The relative error on Omega is: %d\n', errorX);                                                                                                                          
                                                                                                                                                                                  
                                                                                                                                                                                                                                                                                                                                               
x = reshape(X,1,n1*n2);                                                                                                                                                           
h1 = figure;                                                                                                                                                                      
plot(1:n1*n2,x);                                                                                                                                                                  
grid minor                                                                                                                                                                        
hold on;                                                                                                                                                                          
plot(Omega,data,'ro')                                                                                                                                                             
title([filename,'\_line'])                                                                                                                                                        
print(h1,'-dpdf',['./',filename,'_tau(',num2str(tau),')_line_numiter(',num2str(numiter),')_rank(',num2str(rankX),')_error(',num2str(errorX),').pdf']);        
                                                                                                                                                                                  
h2 = figure; imagesc(X); title([filename,'\_predict']); colorbar;                                                                                                                 
print(h2,'-dpdf',['./',filename,'_tau(',num2str(s_tau),')_predict_numiter(',num2str(numiter),')_rank(',num2str(rankX),')_error(',num2str(errorX),').pdf']);     
h3 = figure; imagesc(Y); title([filename,'\_original']) ; colorbar;                                                                                                               
print(h3,'-dpdf',['./',filename,'_tau(',num2str(s_tau),')_original_numiter(',num2str(numiter),')_rank(',num2str(rankX),')_error(',num2str(errorX),').pdf']);    
                                                                                                                                                                              
