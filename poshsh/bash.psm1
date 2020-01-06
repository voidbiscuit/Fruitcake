function windows_to_linux_dir($dir) {
    return python -c "
import sys
file_dir = sys.argv[1]
replacements = [
    ['\\', '/'],
    [' ', '\\ '],
    [':', '']
]
for _ in replacements:
    file_dir = file_dir.replace(_[0], _[1])
file_dir = file_dir[0].lower() + file_dir[1:]
print(file_dir)
    " $dir;
}

function bash(){
    $dir = $(Get-Location).Path;
    $dir = windows_to_linux_dir($dir);
    $linux_args = [string]$args -join" ";
    "cd /mnt/$dir; $linux_args "|ubuntu;
}