This script is designed to perform arithmetic calculations based on the provided numbers and operator. It allows you to perform basic arithmetic operations such as addition, subtraction, multiplication, and division, as well as advanced functions like exponentiation, logarithms, and more. Simply provide the numbers and operator as parameters to get the desired result. This script provides flexibility and ease of use for performing various arithmetic operations in PowerShell.

Synopsis:

This script performs an arithmetic calculation.

Description:

The script takes two numbers as input and performs a basic arithmetic operation (addition, subtraction, multiplication, division, and other advanced functions) based on the provided operator.

Parameters:

Number1: The first number for the arithmetic operation.
Number2: The second number for the arithmetic operation.
Operator: The operator to be used for the arithmetic operation (valid values: "+", "-", "*", "/", "%", "^", "log", "log10", "ln", "base").
Examples:

PS C:\> Calculate-Numbers -Number1 5 -Number2 3 -Operator '+'

This example calculates the sum of 5 and 3, resulting in 8.
PS Calculate-Numbers 5 2 ^

This example calculates the power of 5^2, resulting in 25.
Inputs:

None. You must provide the Number1, Number2, and Operator parameters.

Outputs:

The result of the arithmetic operation.
