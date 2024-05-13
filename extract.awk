# extract_data.awk
BEGIN { FS = "\t" }

{
    if (NR > 1) {
        key = $1 FS $2
        GDP[key] = $4
        Pop[key] = $5
        Hom[key] = $6
        Lif[key] = $7
        Can[key] = $8
    }
}

END {
    for (country in data) {
        printf "%s", country
        for (year in data[country]) {
            printf "\t%s\t%s\t%s", year, data[country][year]["x"], data[country][year]["y"]
        }
        printf "\n"
    }
}
