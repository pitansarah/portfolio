# Description: A factorial calculator, created to solve a Grok-generated problem.

# Problem: Complete the function factorial. It takes a non-negative integer n and returns n! (the product of all integers from 1 to n). By definition, 0! = 1.

def factorial(n):
    if n <= 0 or type(n) != int:
        print('Enter positive integer.')
    else:
        total = 0
        minusByThis = 0
        loopsDone = 0
        loopsMax = 1000
        m = 1
        while n - minusByThis == n:
            start = 1
            break
        while n - minusByThis == n:
            stop = n + 1
            break
        for i in range(start, stop, 1):
            if loopsDone > loopsMax:
                print('Infinite loop detected. Now ending program.')
                break
            total = (n*(n-(m+i))) # FIXME: This line doesn't accurately compute factorial. Check math.
            print(total)
                
factorial(5)