#!/usr/bin/env bash

NAME=$1
NAME_DASHED=$(echo $1 | sed y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/ | sed "y/ /-/")
DATE=$(date "+%Y-%m-%d")
DATE_TIME=$(date "+%Y-%m-%d %H:%M:%S %z")


cat > _posts/$DATE-$NAME_DASHED.markdown <<-EOF
---
layout: post
title: "$NAME"
date: $DATE_TIME
categories: generic
use_math: true
---
Time complexity

- Best: \$O(n)\$
- Average: \$O(n^2)\$
- Worst: \$O(n^2)\$

Space complexity: \$O(1)\$

{% highlight python %}
def bubble_sort(arr):
    n = len(arr)

    for i in range(n-1):
        for j in range(n-i-1):
            if arr[j] > arr[j+1]:
                arr[j], arr[j+1] = arr[j+1], arr[j]

    return arr
{% endhighlight %}
EOF
