N = 4
M = 7
d = 9
X = rand(d, N)
Y = rand(d, M)
tic
closest(X, Y, 1)
toc
closest(X, Y, 2)
function h = closest(X, Y, k)
    n = size(X, 2)
    d = dsts(X, Y)
    [v h] = sort(d, 2)
    h = transpose(h(:, 1:k))
end
function d = dsts(X, Y)
    n = size(X, 2)
    m = size(Y, 2)
    d = zeros(n, m)
    for i=1:m
        d(:, i) = dsts1(X, Y(:, i))
    end   
end
function med = dsts1(X, y)
    med = arrayfun(@(i) dst(X(:, i), y), 1:size(X, 2))
end
function ed = dst(x, y)
    ed = sqrt(sum(arrayfun(@(i) (x(i) - y(i))^2, 1:size(x))))
end