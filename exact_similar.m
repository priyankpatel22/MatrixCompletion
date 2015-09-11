
N = trgtmatrix;

%checking over all similarity between three columns

%display(M);
%display(N);
p_316 = 1;
q = 1;

for i = 1:12689
    if(B(i,316) == N(i,316) && B(i,317) == N(i,317) && B(i,318) == N(i,318))
        m(q,:) = i;
        q = q+1;
        p_316 = p_316 + 1;
    end;
end;

display(p_316);
%display(m);

