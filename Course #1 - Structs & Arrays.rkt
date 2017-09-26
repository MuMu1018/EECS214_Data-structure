#lang dssl2

3 + 5

6 * (3 + 5)

1 + strlen('hello')

let x = 50

8 * x

# if condition:
#     do_some_stuff()
# else:
#     do_some_stuff(x,y,z)

# hypotenuse: Number Number -> Number
# Finds the length of the hypotenuse.
def hypotenuse(a,b):
    sqrt(a * a + b * b)

# fact: Natural -> Natural
# Computes the factorial of 'n'.
def fact(n):
    if n == 0: 1
    else: n * fact(n - 1)

assert_eq fact(5),120

let v = [0,1,1,2,4,7,13,24,44,82]

test 'vector basics':
    assert_eq v[3], 2
    assert_eq v[6], 13
    pass

test 'vector set':
    v[6] = 23
    assert_eq v[6], 23
    
for i in 3:
    print("~a  ",i)

# average: Vector<Number> -> Number
# Averages the elements of a non-empty vector.
def average(vec):
    sum(vec)/len(vec)

# sumL Vector<Number> -> Number
# Sums the elements of a non-empty vector.
def sum(vec):
    let result = 0
    for v in vec:
        result = result + v
    return result

# define struct
defstruct posn(x,y)

let p = posn(3,4)
assert posn?(p)

println("the position is (~a,~a)",p.x,p.y)

# struct + array
defstruct employee(id, name, position)

let employees = [
    employee( 928, "Alice", 4),
    employee(1089, "Bob", 6),
    employee( 14, "Carol", 6),
    employee( 546, "Dave", 6),
]
# find out Carol's position
print("Carol's position is: ~a \n", employees[2].position)
# how can we give her a promotion? (from 6 to 5)
def promote_employee(employees, index):
    let employee = employees[index]
    employee.position = employee.position - 1
    
promote_employee(employees,2)

print("Carol's position is: ~a \n", employees[2].position)