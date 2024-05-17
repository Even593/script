
BEGIN {
    max_abs_value = 0
    max_abs_line = 0
    info = ""
}

{
    # 检查第一列是否为数字，包括负数
    if ($1 ~ /^-?[0-9]+(\.[0-9]+)?$/) {
        abs_value = ($1 < 0) ? -$1 : $1  # 将第一列转换为绝对值
        if (abs_value > max_abs_value) {
            max_abs_value = abs_value
            max_abs_line = NR  # 记录当前行号
        }
    }
}

END {
    if (max_abs_value > 0) {
        if (max_abs_line == 1) {
            info = "GDP"
        } else if (max_abs_line == 2) {
            info = "Pop"
        } else if (max_abs_line == 3) {
            info = "Homi"
        } else {
            info = "Life"
        }

        print "绝对值最大的数: " info, max_abs_value
    } else {
        print "文件为空或没有有效的数字"
    }
}
