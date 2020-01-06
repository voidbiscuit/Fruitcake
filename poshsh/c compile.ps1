
# Write C File

'
#include <stdio.h>
int main(int args, char** argv)
{
    printf("%s", "Hello from C\n");
}
' > hello_from.c;

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

function c_compile($file_name) {
    $file = Get-ChildItem $file_name;
    $file_name = Get-ChildItem $file -Name
    $working_directory = $($file | Get-Location).Path;
    $working_directory = windows_to_linux_dir($working_directory);
    $output_file = $file.Name.Replace(".", "_");
    "
cd /mnt/$working_directory;
dos2unix $file_name;
gcc $file_name -o $output_file;
    " -replace '\r', '' | ubuntu;
}

c_compile ".\hello_from.c";