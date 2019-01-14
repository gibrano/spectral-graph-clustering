options("scipen"=999)

library(igraph)

gl = graph_from_literal(a-k:c:e, k-c,d-e:f:h,f-h,e-c)
plot(gl)

A = as.matrix(as_adjacency_matrix(gl))

L = as.matrix(laplacian_matrix(gl,normalized = TRUE))

spec = eigen(L,symmetric = T)

spec$vectors[,2]



##############################################################

gl = graph_from_literal(a-b:c:e, b-c,d-g:e:f:h,f-h,e-c, f-g:j, j-i,i-l,l-j, a-z)
plot(gl)

L = as.matrix(laplacian_matrix(gl,normalized = TRUE))

spec = eigen(L,symmetric = T)

U = spec$vectors[,10:12]

km = kmeans(U,3)

data.frame(nodes=V(gl)$name,cluster=km$cluster)

