
#!/bin/bash
for entry in $(find * -type d); do
        echo Changing entry: $entry
        chmod 755 $entry
done



