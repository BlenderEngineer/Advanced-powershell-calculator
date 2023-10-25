function ConvertTo-NumericBase {
    param (
        [Parameter(Position = 0, Mandatory = $true)]
        [int]$Number,

        [Parameter(Position = 1, Mandatory = $true)]
        [int]$Base
    )

    if ($Base -le 1) {
        throw "Invalid base. Base must be greater than 1."
    }

    $digits = [char[]]'0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    $result = ''

    if ($Number -eq 0) {
        return '0'
    }

    while ($Number -gt 0) {
        $remainder = $Number % $Base
        $result = $digits[$remainder] + $result
        $Number = [System.Math]::Floor($Number / $Base)
    }

    return $result
}

<#
.SYNOPSIS
    This script performs an arithmetic calculation.
 
.DESCRIPTION
    The script takes two numbers as input and performs a basic arithmetic operation (addition, subtraction, multiplication, division and other advanced functions) based on the provided operator.
 
.PARAMETER Number1
    The first number for the arithmetic operation.
 
.PARAMETER Number2
    The second number for the arithmetic operation.
 
.PARAMETER Operator
    The operator to be used for the arithmetic operation (valid values: "+", "-", "*", "/", "%", "^", "log", "log10", "ln", "base").
 
.EXAMPLE
    PS C:\> Calculate-Numbers -Number1 5 -Number2 3 -Operator '+'
    This example calculates the sum of 5 and 3, resulting in 8.
.EXAMPLE
    PS Calculate-Numbers 5 2 ^
    This example calculates power of 5^2, resulting in 25.
 
.INPUTS
    None. You must provide the Number1, Number2, and Operator parameters.
 
.OUTPUTS
    The result of the arithmetic operation.
 
#>
 
function Calculate-Numbers {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [double]$Number1,
 
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [double]$Number2,
 
        [Parameter(Mandatory = $true)]
        [ValidateSet("+", "-", "*", "/", "%", "^", "log", "log10", "ln", "base")]
        [string]$Operator,
        
        [Parameter(Mandatory = $false)]
        [ValidateNotNullOrEmpty()]
        [switch]$ColorAnswer
    )
 
    # Perform the operation
    switch ($Operator) {
        '+'       { $result = $Number1 + $Number2 }
        '-'       { $result = $Number1 - $Number2 }
        '*'       { $result = $Number1 * $Number2 }
        '/'       { $result = $Number1 / $Number2 }
        '^'       { $result = [Math]::Pow($Number1, $Number2) }
        '%'       { $result = $Number1 % $Number2 }
        'log'     { $result = [Math]::Log($Number1, $Number2) }
        'log10'   { $result = [Math]::Log10($Number1) }
        'ln'      { $result = [Math]::Log($Number1) }
        'base' { $result = ConvertTo-NumericBase -Number $Number1 -Base $Number2 }

    }
 
    # Output
    if ($ColorAnswer){
        Write-Host $result -ForegroundColor Green
    }
    else
    {
        $result
    }
}
