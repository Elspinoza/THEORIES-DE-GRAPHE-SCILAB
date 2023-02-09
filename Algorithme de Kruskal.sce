function [selected_edges, cost] = kruskal(adj_matrix, edges)
    // Initialisation de la liste des arêtes triées et de l'ensemble des sous-ensembles
    edges = sort(edges, "cmpweight")
    subsets = [1:size(adj_matrix,1)]
    selected_edges = []
    cost = 0
    for i = 1:size(edges,1) do
        // Trouver les sous-ensembles des deux sommets de l'arête
        subset1 = find(subsets, edges(i,1))
        subset2 = find(subsets, edges(i,2))
        // Si les deux sous-ensembles ne sont pas égaux, ajouter l'arête à la liste sélectionnée
        // et fusionner les deux sous-ensembles
        if (subset1 != subset2) then
            selected_edges = [selected_edges; edges(i,:)]
            subsets = union(subsets, subset1, subset2)
            cost = cost + adj_matrix(edges(i,1),edges(i,2))
        end
    end
endfunction

// Fonction pour trouver l'indice du sous-ensemble d'un sommet
function ind = find(subsets, vertex)
    ind = find(subsets == vertex)
endfunction

// Fonction pour fusionner deux sous-ensembles
function subsets = union(subsets, subset1, subset2)
    subsets(subsets == subset1) = subset2
endfunction

// Fonction de comparaison de poids d'arêtes
function cmp = cmpweight(edge1, edge2)
    cmp = edge1(3) < edge2(3)
endfunction


adj_matrix = [0, 3, 2, 4, INF;
              3, 0, INF, INF, 5;
              2, INF, 0, INF, 1;
              4, INF, INF, 0, 6;
              INF, 5, 1, 6, 0]

// Création de la liste des arêtes
edges = []
for i = 1:size(adj_matrix,1) do
    for j = i+1:size(adj_matrix,2) do
        if (adj_matrix(i,j) != INF) then
            edges = [edges; i j adj_matrix(i,j)]
        end
    end
end

// Exécution de l'algorithme de Kruskal
[selected_edges, cost] = kruskal(adj_matrix, edges)

// Affichage des résultats
disp("Arêtes sélectionnées :")
disp(selected_edges)
disp("Coût total :")
disp(cost)
