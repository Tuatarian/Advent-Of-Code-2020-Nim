import strutils, macros

# --------------------------------------- #
#                 SETUP                   #
# --------------------------------------- #

var inps : seq[seq[char]]
for line in "inp.txt".lines:
    var lineseq : seq[char]
    for c in line:
        lineseq.add c
    inps.add lineseq


# --------------------------------------- #
#                PART ONE                 #
# --------------------------------------- #

func pOne(grid : seq[seq[char]]) : int =
    let y = grid.len
    let x = grid[0].len
    for i in 0..<y:
        if grid[i][(3 * i) mod x] == '#':
            result += 1

echo pOne inps        


# --------------------------------------- #
#                PART TWO                 #
# --------------------------------------- #

func pTwo(grid : seq[seq[char]]) : int =
    let y = grid.len
    let x = grid[0].len
    var res : array[5, int]
    for i in 0..<y:
        if grid[i][(3 * i) mod x] == '#':
             res[0] += 1
    for i in 0..<y:
        if grid[i][(i) mod x] == '#':
            res[1] += 1
    for i in 0..<y:
        if grid[i][(5 * i) mod x] == '#':
            res[2] += 1
    for i in 0..<y:
        if grid[i][(7 * i) mod x] == '#':
            res[3] += 1
    for i in 0..(y div 2):
        if grid[i * 2][(i) mod x] == '#':
            res[4] += 1
    result = 1
    for i in res:
        result *= i
    

echo pTwo inps