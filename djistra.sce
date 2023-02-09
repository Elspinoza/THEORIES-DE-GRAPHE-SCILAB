function[s,val]=djikstra(dep,arv,C)
    //C = matrice du coup
    //dep = depart
    //arv = arrivé
    
    [n,m]=size(C);
    
    ///Initialisation
    
    S=1:n;
    S(dep)=[];
    val = C(dep,:);//donne l'element de la ligne de la matrice (Ex ; dep=2 affiche la ligne 2)
    
    ///Iteration
    
    while 1
        [v,indj]=min(val(S));
        j=S(indj);
        S(indj)=[];
        
        if isempty(S) then
            break
        end
        
        succ=find(C(j,:)~=%inf & C(j,:)~=0);
        A=intersect(succ,S);
        
        if ~isempty(A) then
            val(A)=min(val(A),val(j)+C(j,A));
        end
        
    end
    
    s=val(arv);
    
endfunction
//Matrice des couts
C=[0 15 %inf %inf 4; %inf 0 %inf %inf %inf; %inf 3 0 2 %inf; 10 3 %inf 0 %inf; %inf %inf 7 5 0]
[s,val]=djikstra(1,4,C)
