#!/bin/bash
# This script will merge a language specific test report into the README in the root dir
# ./compile-readme.sh GROUP LANGUAGE
#

# Check if the correct number of arguments are passed
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <GROUP> <LANGUAGE>"
    exit 1
fi

ROOT_README_PATH="README.md"
TARGET_GROUP=${1}
TARGET_LANGUAGE=${2}
TARGET_README_PATH="${TARGET_GROUP}/${TARGET_LANGUAGE}/REPORT.md"

start_tag="<!--- START ${TARGET_GROUP} ${TARGET_LANGUAGE} BLOCK --->"
end_tag="<!--- END ${TARGET_GROUP} ${TARGET_LANGUAGE} BLOCK --->"

# Escape special characters in the start and end tags for use in sed
start_tag_escaped=$(echo "${start_tag}" | sed 's/[\&/]/\\&/g')
end_tag_escaped=$(echo "${end_tag}" | sed 's/[\&/]/\\&/g')


# Check if the files exists
if [ ! -f "${ROOT_README_PATH}" ]; then
    echo "Source file '${ROOT_README_PATH}' does not exist."
    exit 1
fi

if [ ! -f "${TARGET_README_PATH}" ]; then
    echo "Target file '${TARGET_README_PATH}' does not exist."
    exit 1
fi


# Read the contents of the target report
target_report_content=$(<"${TARGET_README_PATH}")

temp_file=$(mktemp)

# Inject source content into the target file between the specified tags
sed "/$start_tag_escaped/,/$end_tag_escaped/{
    /$start_tag_escaped/{p; r /dev/stdin
    };
    /$end_tag_escaped/p; d
}" "$ROOT_README_PATH" < <(echo "$target_report_content") > "$temp_file"

mv "${temp_file}" "${ROOT_README_PATH}"

echo "Content from '${TARGET_README_PATH}' has been injected into '${ROOT_README_PATH}' between tags '${start_tag}' and '${end_tag}'."
