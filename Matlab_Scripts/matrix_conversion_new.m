
%M = X2_parsed_300_1800_4_1_new;
B = check2;
A1 = 0;
A2 = 0;
A3 = 0;
%display(M);
for i = 1:12689
    E = B(i,1);
    F = B(i,2);
    G = B(i,3);
    
    if(E>F && E>G)
        A1 = 1;
        A2 = 0;
        A3 = 0;
    end;
    if(F>E && F>G)
        A1 = 0;
        A2 = 1;
        A3 = 0;
    end;
    if(G>E && G>F)
        A1 = 0;
        A2 = 0;
        A3 = 1;
    end;
    N(i,1) = A1;
    N(i,2) = A2;
    N(i,3) = A3;
    display(i);
end;