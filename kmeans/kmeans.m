% Original Andrew Ng - Stanford.edu
%
% INPUT:   
%   - As input, this function takes the m � n data matrix X 
%   - and the number of clusters k.
%
% PERFORM: 
%   - The function initialize k centroids randomly 
%   - Then repeatedly perform the following steps 
%      - (1) Assignming each training example x(i) to the closest cluster
%      - (2) Moving each cluster centroid to the mean of the points assigned to it 
% 
% OUTPUT: 
%   - an m-element vector, clusters, indicating which cluster each 
%        data point belongs to, 
%   - and a k*n matrix, centers, which contain the centroids of each cluster


function [clusters, centroids] = kmeans(X, k)

m = size(X,1);
n = size(X,2);
oldcentroids = zeros(k,n);
centroids = X(ceil(rand(k,1)*m),:);

while (norm(oldcentroids - centroids) > 1e-15)
  oldcentroids = centroids;
  % compute cluster assignments
  for i=1:m,
    dists = sum((repmat(X(i,:), k, 1) - centroids).^2, 2);
    [min_dist, clusters(i,1)] = min(dists);
  end
  
  draw_clusters(X, clusters, centroids);
  pause(0.1);
  
  % compute cluster centroids
  for i=1:k,
    centroids(i,:) = mean(X(clusters == i, :));
  end
end