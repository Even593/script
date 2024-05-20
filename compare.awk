
BEGIN {
    #FS = "\t"
    max_abs_value = 0
    max_abs_line = 0
    info = ""
}

{
    # check input number if its valid 
    if ($2 ~ /^-?[0-9]+(\.[0-9]+)?$/) {
        abs_value = ($2 < 0) ? -$2 : $2  # absolute value
        if (abs_value > max_abs_value) {
            max_abs_value = abs_value
            max_abs_line = NR  # store the row number
            origin_value = $2
        }
    }
}

END {
    if (max_abs_value > 0) {
        if (max_abs_line == 1) {
            info = "GDP"
        } else if (max_abs_line == 2) {
            info = "Population"
        } else if (max_abs_line == 3) {
            info = "Homicide Rate"
        } else {
            info = "Life Expectancy"
        }

        print "Most predictive mean correlation with the Cantril ladder is " info, "(r = " origin_value ")"
    } else {
        print "The input file is invalid"
    }
}
