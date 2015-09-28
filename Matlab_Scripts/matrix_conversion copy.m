
%matrix conversion-- taking threshold value different for each column
M = X2_parsed_300_1800_4_1_new;
B = M;
V = M(1:12689,316);
W = M(1:12689,317);
X = M(1:12689,318);
%display (V);


for i = 1:12689
    B(i,316) = M(i,316)-min(V)/max(V)-min(V);
    B(i,317) = M(i,317)-min(W)/max(W)-min(W);
    B(i,318) = M(i,318)-min(X)/max(X)-min(X);
end;
%T = (min(V)+max(V))/2;



%{
M = X2_parsed_300_1800_4_1_new;
%display(M);
B = M;
%V = M(1:12689,316);
%display(min(A));
%display(max(A));
%T = (min(V)+max(V))/2;
%display(T);
T = 0.15;
for i = 1:12689
    if(M(i,316) >= T)
        B(i,316) = 1;
    end;
    if(M(i,316) < T)
        B(i,316) = 0;
    end;
    
    if(M(i,317) >= T)
        B(i,317) = 1;
    end;
    if(M(i,317) < T)
        B(i,317) = 0;
    end;
    
    if(M(i,318) >= T)
        B(i,318) = 1;
    end;
    if(M(i,318) < T)
        B(i,318) = 0;
    end;
    
    if(M(i,319) >= T)
        B(i,319) = 1;
    end;
    if(M(i,319) < T)
        B(i,319) = 0;
    end;
    
    if(M(i,320) >= T)
        B(i,320) = 1;
    end;
    if(M(i,320) < T)
        B(i,320) = 0;
    end;
end;
%display(A);
%display(B);
%}