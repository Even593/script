
BEGIN {
    line_count = 0
    sum = 0
}

{
    if ($1 ~ /^-?[0-9]+(\.[0-9]+)?$/) {  # check input is valid
        #abs_v = ($1 < 0) ? -$1 : $1
        line_count++
        sum += $1
    }
}

END {
    if (line_count > 0) {
        average = sum / line_count
        print FILENAME, average 
    } else {
        print "invalid file"
    }
}
