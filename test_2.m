
M = [17    24     1     8    15;23     5     7    14    16;4     6    13    20    22;10    12    19    21     3;11    18    25     2     9;99 89 79 98 97];
display(M);
%display(min(B));
%display(max(B));

%T = (min(B)+max(B))/2;
%display(T);
p =1;
for i = 1:5                  
    for j = 1:6    
        if(i<4)
            Omega(p,:) = sub2ind(size(M), j, i);
            p = p+1; 
        end;
        if(i>=4)
            if(j < 4)
                Omega(p,:) = sub2ind(size(M), j, i);
                p = p+1; 
            end;
        end;
          
    end;
end;

display(Omega);
%}


