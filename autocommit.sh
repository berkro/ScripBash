#!/bin/bash

COM="$1"

git add .
git commit -m "$COM"
git push
