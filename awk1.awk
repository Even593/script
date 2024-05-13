BEGIN{sum=0; sum_x_sqr=0; min=99}
$0 ~ /^$/{next}
{
    sum += $1
    sum_x_sqr += $1*$1
    ++n
    if($1>max) max=$1
    if($1<min) min=$1
}
END{
    if(n!=0)
    {
        mean = sum / n
        SD = sqrt(sum_x_sqr/n - mean*mean)
        print "mean = ", mean  "SD =", SD, "max =", max, "min =", min
    }
    else
    {
        print "No data"
    }
}