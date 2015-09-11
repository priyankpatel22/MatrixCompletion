clear all
close all
clc
M = dlmread('input_matrix2.dat');
p = 1;
tic
for i = 1:320                  
    for j = 1:48520    
        if(i<316)
            m(p,:) = sub2ind(size(M), j, i);
            p = p+1;
        end;
        if(i>=316)
            if(j < 35832)
                m(p,:) = sub2ind(size(M), j, i);
                p = p+1;
            end;
        end;
           
    end;
    display(i);
end;
toc
display(m);
display(size(m));