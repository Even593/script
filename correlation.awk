BEGIN {
    FS = "\t" 
    sum_x = 0
    sum_y = 0
    sum_xy = 0
    sum_x2 = 0
    sum_y2 = 0
    n = 0
}
NR>1{
    x = $COL1  # 
    y = $COL2  # set default value
    if (x == "" || y == "") {next}
    sum_x += x
    sum_y += y
    sum_xy += x * y
    sum_x2 += x * x
    sum_y2 += y * y
    n++
}

END {
    
    # calculate denominator
    denominator = sqrt((n * sum_x2 - sum_x * sum_x) * (n * sum_y2 - sum_y * sum_y))
    
    # if error 
    if (denominator == 0) {
        print "null"
    } else {
        # calculate correlation
        correlation = (n * sum_xy - sum_x * sum_y) / denominator
        print correlation
    }
}
