#lang dssl2

# Quick access to the tail

defstruct ll(head, tail, len: aat?)
defstruct node(data: num?, next: Link)
defstruct nil()

def new_list() -> ll?:
    let my_nil = nil()
    
# double-linked
    
    
#  Circular, doubly-linked with sentinel
defstruct dll(sentinel, len)
defstruct dllnode(data, next, prev)

def new_dll():
    let sentinel = dllnode(False, False, False)
    sentinel.next = sentinel
    sentinel.prev = sentinel
    dll(sentinel, 0)
    
def get_first(lst):
    let sentinel = lst.sentinel
    if sentinel.next === sentinel: error('no first')
    sentinel.next.data