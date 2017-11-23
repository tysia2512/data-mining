from itertools import *
from timeit import timeit
from profilehooks import timecall
import numpy as np


@timecall
def load_data(path):
    with open(path) as file:
        print('Reading data...')
        return [list(map(int, line.split())) for line in file.readlines()]

@timecall
def most_common(data, n):
    flat = list(chain.from_iterable(data))
    print(sorted(np.bincount(flat))[-20:])
    return np.argpartition(np.bincount(flat), -n)[-n:]

@timecall 
def bought_with(data, common, mapping, n):
    res = np.zeros((n, n), dtype=np.int32)
    common = set(common)
    
    for line in data:
        vec = np.zeros(n)
        present = []
        for x in line:
            if x in common:
                vec[mapping[x]] = 1
                present.append(mapping[x])

        for x in present:
            res[x] += vec

    return res 

data = load_data('data/kosarak.dat')

n = 1000
common = most_common(data, n)
mapping = dict({x : i for (i, x) in enumerate(common)})
bought = bought_with(data, common, mapping, n)
print(bought)