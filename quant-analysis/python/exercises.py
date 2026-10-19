# factorial calculator

def factorial(n):
    total = n
    for i in range(n-1, 0, -1):
        total *= i
    print(total)

factorial(3)

# vowel counter

def count_vowels():
    total = 0
    my_string = input('Enter string here: ')
    for i in range(0, len(my_string), 1):
        letter = my_string[i]
        if letter == 'a' or letter == 'e' or letter == 'i' or letter == 'o' or letter == 'u':
            total += 1
        else:
            total += 0
    print(total)
count_vowels()