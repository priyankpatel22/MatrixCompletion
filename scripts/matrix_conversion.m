clear all
close all
clc
%matrix conversion-- taking threshold value different for each column

M = B;
%display(M);
B = M;
V = M(1:12689,320);
%display(min(A));
%display(max(A));
T = (min(V)+max(V))/2;
display(T);

for i = 1:12689
    if(M(i,320) >= T)
        B(i,320) = 1;
    end;
    if(M(i,320) < T)
        B(i,320) = 0;
    end;
end;
%display(A);
%display(B);
