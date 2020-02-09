-- factorial
function factorial(n)
    if (n == 0) then
        return 1
    else
        return n * factorialExternal(n - 1)
    end
end
