import strutils

# --------------------------------------- #
#                 SETUP                   #
# --------------------------------------- #

type
    pwdver = object
        pwd : string
        ranges : (int, int, string)


var pwdvers : seq[pwdver]
for line in "inp.txt".lines:
    let sep = @[line.split(":")[1][1..^1], line.split(":")[0].split("-")[0], line.split(":")[0].split("-")[1].split(" ")[0], line.split(":")[0].split("-")[1].split(" ")[1]]
    pwdvers.add(pwdver(pwd : sep[0], ranges : (parseInt sep[1], parseInt sep[2], sep[3])))

echo pwdvers[0].pwd

# --------------------------------------- #
#                PART ONE                 #
# --------------------------------------- #

func countApperances(s, c : string) : int =
    var i = 0
    while true:
        i = s.find(c, i)
        if i < 0:
            break
        i += 1
        inc result

proc pOne(pwdvers : seq[pwdver]) : int =
    for pwdver in pwdvers:
        if pwdver.pwd.countApperances(pwdver.ranges[2]) > pwdver.ranges[1] or pwdver.pwd.countApperances(pwdver.ranges[2]) < pwdver.ranges[0]:
            continue
        inc result

echo pOne(pwdvers) 

# --------------------------------------- #
#                PART TWO                 #
# --------------------------------------- #

proc pTwo(pwdvers : seq[pwdver]) : int =
    for pwdv in pwdvers:
        var seen = false
        if $pwdv.pwd[pwdv.ranges[0] - 1] == pwdv.ranges[2]:
            seen = true
        if $pwdv.pwd[pwdv.ranges[1] - 1] == pwdv.ranges[2]:
            if seen:
                continue
            else:
                seen = true
        if seen:
            inc result

echo pwdvers.pTwo