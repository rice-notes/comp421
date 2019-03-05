# Memory Management

Consider the following example program:

```c
int a = 2;
int b;

int main(int argc, char **argv) {
    int c = 5;
    int d;
}
```

The created binary would have the following structure:  

* `text`: contains the text of the program
* `data`: contains global variable's whose values are known at compile time
    * contains the variable `a`
* `bss`: contains global variables whose values are undefined (technically zeros)
    * contains the variable `b` (value is technically 0)
* `stack`: contains local variables
    * contains `c` and `d`

!!! note
    Variables whose values are not initialized are defined in **bss** because
    it doesn't make sense to:  

    * initialize all that data in the compiled binary
    * read that in from the compiled binary when you can just return at runtime

## Paging

So far we've assumed that memory is available on a infinitely long contiguous
linear address space.  Of course, this isn't true in reality, so we need to
design schemes to manage this.  

Pages are an abstraction that allow us to split up contiguous logical addresses
into multiple areas of physical addresses

* each process / collection of threads has its own address space
* each address space has its own page table mapping


## Virtual Addressing

* 
