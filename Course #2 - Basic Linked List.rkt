#lang dssl2
# List is ll {head: link}
defstruct ll(head)

# Link is one of:
# - node { data: Number, next: link}
# - nil()
defstruct node(data, next)
defstruct nil()

ll(node(3,node(4,nil())))

# new_list: -> list
def new_list():
    ll {head: nil()}
    
# insert_front: Number List ->
def insert_front(n, lst):
    lst.head = node {data: n, next: lst.head}
    
# get_front: List -> Number
def get_front(lst):
    if node?(lst.head): lst.head.data
    else: error('get_front: got empty list')

# Method1: get_nth    
# get_nth: List Natural -> Number
def get_nth(lst, n0):
    def loop(link,n):
        if nil?(link): error('get_nth: list too short')
        elif n == 0: return link.data
        else: return loop(link.next, n-1)  # use 'return' here or not is optional
    loop(lst.head, n0)

# Method2: get_nth
# find_nth_node: Link Natural -> Link
def find_nth_node(link,n):
    if nil?(link): error('find_nth_node: too short')
    elif n == 0: link
    else: find_nth_node(link.next, n-1)

# get_nth_2: Link Natural -> Number
def get_nth_2(lst,i):
    find_nth_node(lst.head, i).data
    
# Method3: get_nth
#def get_nth_3(lst: ll?, n: num?):
def get_nth_3(lst: ll?, n: nat?) -> num? : # contract system
    let link = lst.head
    for i in n:
        if nil?(link): error('Too short!')
        link = link.next
    link.data

test 'get_nth_3':
    let lst = ll(node(2,node(3,node(4,nil()))))
    assert_eq get_nth_3(lst,1),3    

test 'get_nth_3_twice':
    let lst1 = ll(node(2,node('hi',node(4,nil()))))
    assert_eq get_nth_3(lst1,1), 'hi'    
    
# How can we make sure the len field is always right?
# 1: modify the len everytime we insert/delete/remove...
# 2: do not modify the list in other ways