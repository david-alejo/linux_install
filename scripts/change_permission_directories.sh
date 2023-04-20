
#!/bin/bash
for entry in $(find * -type d); do
        echo Changing entry: $entry
        chmod 755 $entry
done
for entry in $(find * -type f); do
    echo Changing file entry: $entry
    chmod 644 $entry
done


