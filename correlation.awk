BEGIN {
    FS = "\t"  # 设置输入字段分隔符为制表符
    sum_x = 0
    sum_y = 0
    sum_xy = 0
    sum_x2 = 0
    sum_y2 = 0
    n = 0
}
NR>1{
    x = $COL1  # 假设X在第一列
    y = $COL2  # 假设Y在第二列
    if (x == "" || y == "") {next}
    sum_x += x
    sum_y += y
    sum_xy += x * y
    sum_x2 += x * x
    sum_y2 += y * y
    n++
}

END {
    # 计算分母的部分
    denominator = sqrt((n * sum_x2 - sum_x * sum_x) * (n * sum_y2 - sum_y * sum_y))
    
    # 如果分母为零，则不能计算相关系数
    if (denominator == 0) {
        print "Error: Denominator is zero, correlation cannot be computed."
    } else {
        # 计算相关系数
        correlation = (n * sum_xy - sum_x * sum_y) / denominator
        print "Correlation coefficient (r):", correlation
    }
}
