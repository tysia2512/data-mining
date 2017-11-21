sudoku = zeros(9, 9)
sudoku(1,:)=randperm(9,9)
for r = 2:9
    for c = 1:9
        ri = int32(r) - 1
        ci = int32(c) - 1
        sq_r = idivide(mod(ri, 9), 3) * 3 + 1
        sq_c = idivide(mod(ci, 9), 3) * 3 + 1
        poss = ones(1, 9)
        % compute in 3x3 square
        for sqr = 0:2
            for sqc = 0:2
                if sudoku(sq_r + sqr, sq_c + sqc) > 0
                    poss(sudoku(sq_r + sqr, sq_c + sqc)) = 0
                end
            end
        end
        
        for rr = 1:r
            if sudoku(rr, c) > 0
                poss(sudoku(rr, c)) = 0
            end
        end
        
        for cc = 1:c
            if sudoku(r, cc) > 0
                poss(sudoku(r, cc)) = 0
            end
        end
        possible = find(poss)
        size(possible)
        sudoku(r, c) = possible(randi(size(possible)))
    end
end
sudoku