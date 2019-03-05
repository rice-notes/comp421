# Semaphores

Semaphores are a way of controlling concurrency and synchronization in a
multi-threaded system.  They are objects with integer values with which we can
interact via two routines:  

* [`sem_wait()`](http://man7.org/linux/man-pages/man3/sem_wait.3.html)
* [`sem_post()`](http://man7.org/linux/man-pages/man3/sem_post.3.html)

Semaphores were introduced by Djikstra; `sem_wait(S)` was called $P(S)$ and
`sem_post(S)` was called $V(S)$.

!!! note "Djikstra's Names"
    $P()$ comes from a contraction of *probeer* (Dutch for try) and *verlaag*
    (Dutch for decrease).  
    $V()$ comes from *verhoog* (Dutch for increase).

## `sem_wait(sem_t *s)`

The following block of code describes the behavior of the routine, but not
necessarily the implementation.

```c
int sem_wait(sem_t *s) {
    // decrement the value of semaphore s by one
    // wait if value of semaphore s is negative
}
```

or

```c
int sem_wait(sem_t *s) {
    // wait if value of semaphore s is non-positive
    // decrement the value of semaphore s by one
}
```


## `sem_post(sem_t *s)`

```c
int sem_post(sem_t *s) {
    // increment the value of semaphore s by one
    // if there are one or more threads waiting, wake one
}
```

## dining philosophers

Djikstra introduces and solved an interesting 

## references

* https://pages.cs.wisc.edu/~remzi/OSTEP/threads-sema.pdf
* https://docs.oracle.com/javase/8/docs/api/java/util/concurrent/Semaphore.html
* https://en.wikipedia.org/wiki/Semaphore_(programming)
