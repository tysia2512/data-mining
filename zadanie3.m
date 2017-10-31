d = 100
N = 5
x = rand(d, 1)
y = rand(d, 1)
w = rand(d, 1)

l = length(x)
wavg = w_avg(x, w)
e = e_dist(x, y)
ddot = dot(x, y)

N = 100
X = rand(d, N)
mat_len(X)
mat_avg(X, w)
mat_edist(X, y)
mat_dot(X, y)

N = 1000
X = rand(d, N)
mat_len(X)
mat_avg(X, w)
mat_edist(X, y)
mat_dot(X, y)

function md = mat_dot(X, y)
     md = arrayfun(@(i) dot(X(:, i), y), 1:size(X, 2))
end
function med = mat_edist(X, y)
    med = arrayfun(@(i) e_dist(X(:, i), y), 1:size(X, 2))
end
function mwa = mat_avg(X, w)
    ml = arrayfun(@(i) w_avg(X(:, i), w), 1:size(X, 2))
end
function ml = mat_len(X)
    ml = length(X)
end

function d = dot(x, y)
    d = sum(arrayfun(@(i) x(i) * y(i), 1:size(x)))
end
function ed = e_dist(x, y)
    ed = sqrt(sum(arrayfun(@(i) (x(i) - y(i))^2, 1:size(x))))
end
function a = w_avg(x, w)
    a = sum(arrayfun(@(i) x(i) * w(i), 1:size(x))) / sum(w)
end
function l = length(x)
    xsq = arrayfun(@(x) x*x, x)
    l = sqrt(sum(xsq))
end