#!/bin/bash

required_commands=("pandoc" "sed" "weasyprint" "tail")

for cmd in "${required_commands[@]}"; do
	if ! command -v "$cmd" &>/dev/null; then
		echo "Error: Required command '$cmd' is not installed or not in PATH."
		exit 1
	fi
done

DOCS_DIR="_chapters"
TMP_HTML="combined.html"
CSS_FILE="bookstyle.css"
OUTPUT_FILE="output.pdf"

> "$TMP_HTML"

# HTML header
echo "<!DOCTYPE html>
<html>
<head>
	<meta charset=\"UTF-8\">
	<title>Document</title>
	<link rel=\"stylesheet\" href=\"$CSS_FILE\">
</head>
<body>" >> "$TMP_HTML"


# Loop over sorted Markdown files
for file in $(ls "$DOCS_DIR"/*.md | sort); do

	# Extract front matter fields
	title=$(grep '^title:' "$file" | sed 's/title:[ ]*//')
	section=$(grep '^section:' "$file" | sed 's/section:[ ]*//')
	order=$(grep '^order:' "$file" | sed 's/order:[ ]*//')
	# Write metadata as HTML
	echo "<h1>$title</h1>" >> "$TMP_HTML"
	#echo "<div class=\"meta\">Section: $section | Order: $order</div>" >> "$TMP_HTML"

	# Extract body content (skip front matter)
	start_line=$(awk '/^---/ {count++} count==2 {print NR + 1; exit}' "$file")
	tail -n +"$start_line" "$file" > /tmp/body.md

	# Convert Markdown body to HTML and append
	pandoc --verbose /tmp/body.md -f markdown -t html >> "$TMP_HTML"

	# Page break between chapters
	echo '<div class="page-break"></div>' >> "$TMP_HTML"
done

# Close HTML
echo "</body></html>" >> "$TMP_HTML"

### Format fixes:
echo "Applying format fixes: Liquid hrefs..."
sed -Ezi 's/\[([^]]+)\]\(\{\{[^}]+\}\}\)/\1/g' "$TMP_HTML"

weasyprint --verbose  "$TMP_HTML" "$OUTPUT_FILE"

echo "PDF created: $OUTPUT_FILE"
