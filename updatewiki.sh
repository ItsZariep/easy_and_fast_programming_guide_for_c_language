#!/bin/bash

input_directory="./main"
output_file="wikilist.html"

generate_list() {
    local current_directory="$1"
    local current_output_file="$2"

    echo "<ul>" >> "$current_output_file"

    for item in "$current_directory"/*; do
        if [ -d "$item" ]; then
            item_name=$(basename "$item")
            # Asegúrate de que los enlaces apunten correctamente al archivo index.html dentro del directorio
            echo "<li><a target=\"_top\" href=\"${current_directory/main/$input_directory}/$item_name/index.html\">$item_name</a>" >> "$current_output_file"
            generate_list "$item" "$current_output_file"
            echo "</li>" >> "$current_output_file"
        fi
    done

    echo "</ul>" >> "$current_output_file"
}

# Inicializa el archivo de salida
echo "" > "$output_file"
echo "<html>
<head>
    <link rel='stylesheet' type='text/css' href='css.css'>
</head>
<body>
<h1>Wiki List</h1>
<ul>" > "$output_file"

# Genera la lista
generate_list "$input_directory" "$output_file"

# Cierra el HTML
echo "</ul>
</body>
</html>" >> "$output_file"
