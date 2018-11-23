function fuct {
        if [ $1 -eq 1 ]
        then
                echo 1
        else
                local temp=$(( $1 - 1 ))
                local result=$(fuct $temp)
                echo $(( $result * $1 ))
        fi
}

