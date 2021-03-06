function y = GaussFunc(x, mu, sigma)

%GaussFunc computes a one-dimensional Gaussian 

%GaussFunc(x, mu, sigma) returns the value at x of a normalized Gaussian centered on mu with std deviation sigma

y = 1/(sqrt(2 * pi) * sigma)  * exp(-(x-mu)^2/(2*sigma^2));
