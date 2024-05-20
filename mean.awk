
BEGIN {
    line_count = 0
    sum = 0
}

{
    if ($1 ~ /^-?[0-9]+(\.[0-9]+)?$/) {  # 检查第一列是否为数字，包括负数
        #abs_v = ($1 < 0) ? -$1 : $1
        line_count++
        sum += $1
    }
}

END {
    if (line_count > 0) {
        average = sum / line_count
        #print "行数: " line_count
        print average 
    } else {
        print null
    }
}
