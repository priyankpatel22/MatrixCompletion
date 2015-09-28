M = B;
N = trgtmatrix;

%checking over all similarity between three columns

%display(M);
%display(N);
p_316 = 1;
q = 1;

for i = 1:12689
    if(M(i,316) == N(i,316) && M(i,317) == N(i,317) && M(i,318) == N(i,318))
        m(q,:) = i;
        q = q+1;
        p_316 = p_316 + 1;
    end;
end;

display(p_316);
%display(m);

