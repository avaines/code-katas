#!/bin/bash
# This script will merge a language specific test report into the README in the root dir
# ./compile-readme.sh README.md JavaScript/REPORT.md
#
# TODO: Add more language support, the tags should be variables to support this. Currently ive only done the exercises in JS

# Check if the correct number of arguments are passed
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_file> <target_file>"
    exit 1
fi

source_file=${1}
target_file=${2}

start_tag="<!--- START JAVASCRIPT BLOCK --->"
end_tag="<!--- END JAVASCRIPT BLOCK --->"

# Escape special characters in the start and end tags for use in sed
start_tag_escaped=$(echo "${start_tag}" | sed 's/[\&/]/\\&/g')
end_tag_escaped=$(echo "${end_tag}" | sed 's/[\&/]/\\&/g')


# Check if the files exists
if [ ! -f "$source_file" ]; then
    echo "Source file '$source_file' does not exist."
    exit 1
fi

if [ ! -f "$target_file" ]; then
    echo "Target file '$target_file' does not exist."
    exit 1
fi


# Read the contents of the source file
source_content=$(<"${source_file}")

temp_file=$(mktemp)

# Inject source content into the target file between the specified tags
sed "/$start_tag_escaped/,/$end_tag_escaped/{
    /$start_tag_escaped/{p; r /dev/stdin
    };
    /$end_tag_escaped/p; d
}" "$target_file" < <(echo "$source_content") > "$temp_file"

mv "${temp_file}" "${target_file}"

echo "Content from '${source_file}' has been injected into '${target_file}' between tags '${start_tag}' and '${end_tag}'."
