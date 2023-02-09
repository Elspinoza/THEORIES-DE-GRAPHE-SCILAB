//Définition de la fonction
function [MST] = Prim(adj_matrix)
    // Initialisation
    n = size(adj_matrix, 1)
    MST = []
    visited = ones(n, 1)
    visited(1) = 0
    weight = inf(1, n)
    parent = ones(1, n)
    weight(1) = 0

    // Boucle principale
    for i = 1 to n-1
        min_dist = inf
        u = 0

        // Trouver le sommet non visité le plus proche
        for j = 1 to n
            if visited(j) == 0
                continue
            end
            for k = 1 to n
                if visited(k) == 1 && adj_matrix(j, k) < min_dist
                    min_dist = adj_matrix(j, k)
                    u = k
                    parent(u) = j
                end
            end
        end

        // Ajouter u à l'arbre couvrant minimum
        MST = [MST; [parent(u), u, min_dist]]
        visited(u) = 0
    end
    return MST
endfunction

//Définition de la matrice d'adjacence
adj_matrix = [0, 4, 0, 0, 0, 0, 0, 8, 0;              4, 0, 8, 0, 0, 0, 0, 11, 0;              0, 8, 0, 7, 0, 4, 0, 0, 2;              0, 0, 7, 0, 9, 14, 0, 0, 0;              0, 0, 0, 9, 0, 10, 0, 0, 0;              0, 0, 4, 14, 10, 0, 2, 0, 0;              0, 0, 0, 0, 0, 2, 0, 1, 6;              8, 11, 0, 0, 0, 0, 1, 0, 7;              0, 0, 2, 0, 0, 0, 6, 7, 0]
              
//Appel de la fonction
MST = Prim(adj_matrix)

// Affichage des résultats
disp("Arêtes de l'arbre couvrant minimum :")
disp(MST)
