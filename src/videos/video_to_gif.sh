#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Usage: $0 <input_video> <output_gif>"
    exit 1
fi

ffmpeg -i $1 \
    -vf "fps=10,scale=800:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
    -loop 0 $2
