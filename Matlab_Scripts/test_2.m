clear all
close all
clc

M = [17    24     1     8    15;23     5     7    14    16;4     6    13    20    22;10    12    19    21     3;11    18    25     2     9];
display(M);
B = M;
A = M(:,4);
%display(min(A));
%display(max(A));
T = (min(A)+max(A))/2;
display(T);
for i = 1:5
    if(M(i,4) >= T)
        B(i,4) = 1;
    end;
    if(M(i,4) < T)
        B(i,4) = 0;
    end;
end;
display(A);
display(B);


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