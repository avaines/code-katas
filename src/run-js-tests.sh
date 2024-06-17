#!/bin/bash
set -euo pipefail

run_test_and_update() {
  test_file="${1}"
  filename=$(echo "${test_file}" | cut -d "/" -f 2 )
  result=$(npx jest "${test_file}" --silent --json | jq '.success')

  # Determine if the test passed or failed
  if [[ "${result}" == "true" ]]; then
    status=":heavy_check_mark:"
  else
    status=":x:"
  fi

  # Update or insert the test result in the markdown file
  p_number=$(echo "${filename}"| cut -d "-" -f 1)
  p_name=$(echo "${filename}"| cut -d "-" -f 2)

  if grep -q "| ${p_number} |" "${MARKDOWN_FILE}"; then
    sed -i '' "/| ${p_number} |/d" "${MARKDOWN_FILE}"
  fi

  echo "| ${p_number} | ${p_name} | ${status} |" >> "${MARKDOWN_FILE}"
}

###

cd JavaScript

MARKDOWN_FILE="REPORT.md"

if [ ! -f "${MARKDOWN_FILE}" ]; then
  echo "| Number | Problem | Result |" > "${MARKDOWN_FILE}"
  echo "| -------| --------|--------|" >> "${MARKDOWN_FILE}"
fi

# Run the all the tests
npm run test

# Iterate over all test files in the directory for generating the report
for test_file in ./*.test.js; do
  run_test_and_update "${test_file}" > /dev/null 2>&1
done
