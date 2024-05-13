BEGIN {
    FS = OFS = "\t";  # 设置输入和输出的字段分隔符为制表符
    if (column == "") {
        column = 1;  # 默认输出第五列，如果没有指定
    }
}

# 处理第一个文件
FNR == NR {
    # 将第一和第二列作为键存储
    keys[$1,$2,$3] = 1;
    next;
}

# 处理第二个文件
{
    if ( ($1,$2,$3) in keys) {
        # 如果第二个文件的前两列在第一个文件中找到匹配，则输出第二个文件的第五列
        print $1, $2, $3, $col;
    }
}