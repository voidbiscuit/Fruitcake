
function poshpy($file = $null) {
    # If there is no file, show usage
    if ($null -eq $file) {
        "Please supply filename as an argument.";
    }
    # If there is a file
    else {
        # Get function name
        $function_name = (Get-ChildItem $file).BaseName;
        # Create function
        "Creating Function [$function_name]";
        Invoke-Expression "New-Module -ScriptBlock { function $function_name(`$arguments) { python $file `$arguments; } }";
    }
}

poshpy $args;