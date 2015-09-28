%M = B;
%N = trgtmatrix;

%checking similarity between columns seperatly
B = trgtmatrix;
%display(M);
%display(N);
p = 0;
p_316 = 0;
p_317 = 0;
p_318 = 0;

for i = 1:12689
    if(B(i,316) == N(i,1) && B(i,317) == N(i,2) && B(i,318) == N(i,3))
        p = p + 1;
    end;
    if(B(i,316) == N(i,1))
        p_316 = p_316 + 1;
    end;
    if(B(i,317) == N(i,2))
        p_317 = p_317 + 1;
    end;
    if(B(i,318) == N(i,3))
        p_318 = p_318 + 1;
    end;
end;

display(p);
display(p_316);
display(p_317);
display(p_318);
