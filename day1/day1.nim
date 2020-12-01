import strutils

# --------------------------------------- #
#                 SETUP                   #
# --------------------------------------- #

var inps : seq[int]
for line in "inp.txt".lines:
    inps.add parseInt line



# --------------------------------------- #
#                PART ONE                 #
# --------------------------------------- #


for i in 0..<inps.len:
    for j in i..<inps.len:
        if inps[i] + inps[j] == 2020:
            echo inps[i] * inps[j]; break


# --------------------------------------- #
#                PART TWO                 #
# --------------------------------------- #


for i in 0..<inps.len:
    for j in i..<inps.len:
        for k in j..<inps.len:
            if inps[i] + inps[j] + inps[k] == 2020:
                echo inps[i] * inps[j] * inps[k]; break