function [A,P]=AlgoFloyd(L)
    //La matrice P appellée la matrice des prédécesseurs, est telle que le terme Pij représente le numéro du sommet prédécesseur immédit de j sur le plus court chemin i et j
    [n,m]=size(L);
    if n~=m then
        error("la matrice des coûts d''est pas carrée")
    end
    A=L;
    for i=1:n
        P(i,:)=i*ones(1,n);
    end
    for k=1:n
        for i=1:n
            for j=1:n
                if A(i,k)+A(k,j) < A(i,j) then
                    A(i,j)=A(i,k)+A(k,j);
                    P(i,j)=P(k,j);
                end 
            end
        end
    end
endfunction
C=[0 15 %inf %inf 4; %inf 0 %inf %inf %inf; %inf 3 0 2 %inf; 10 3 %inf 0 %inf; %inf %inf 7 5 0]
[A,P]=AlgoFloyd(C)

function[y]=CheminFloyd(A,P,dep,arv)
    if A(dep,arv)==%inf then
        printf("Il n''existe pas de chemin entre les sommets dep=%det  et arv=%d\n",dep,arv)
    else
        j=arv;
        chemin=[j];
        while j~=dep
            j=P(dep,j);
            chemin=[j, chemin];
        end
        printf("Le plus court chemin entre les sommets dep=%det et arv=%d\n",dep,arv)
        disp(chemin)
    end
    y=chemin;
endfunction
[y]=CheminFloyd(A,P,4,5)
