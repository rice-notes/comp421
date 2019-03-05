# Review

We've discussed high level synchronization through monitors and slightly 
lower level synchronization with the use of semaphores.  Now we'll take one
step deeper and talk about the design requirements of any abstract thread
synchronization.

1. Mutual Exclusion
    * must ensure that only a single process is in the critical section (CS)
    * more generally, could provide read / write access
2. Decision Framework
3. Fairness
    * if a thread wants to enter the critical section (and begun entry section) it must eventually be able to 
    * must not be possible for another process to enter / leave CS *before* this process infinitely often.

## One Shared Variable Attempt

Let's consider a simple problem where we have two process accessing a single
shared variable.  Consider this **faulty** example to manage concurrent access:

```c

static int var;
static int flag = 0; // can enter critical CS

while (!flag)
    ;

flag = 1;
// CS
flag = 0;
```

!!! warning
    This doesn't work because both process $P_0$ and $P_1$ could exit the busy
    wait and then both set the `flag`; they would enter the CS together.

Let's try again, but give each process an integer identity, and give the
flag to the process whose `id == flag`.

```c
static int var;
static int flag = 0; // process 0 owns the flag
int pid; // assume this is set to i in process i

while (flag != pid)
    ;

// CS
flag = 1 - pid; // 1 = 1 - 0, 0 = 1 - 1
```

!!! warning
    This does protect the critical section for each process, but doesn't 
    address our 3rd design requirement above.  Perhaps $P_0$ doesn't 
    spend much time in the CS, but $P_1$ needs to access it often.  There's
    no way for $P_1$ to *signal* to $P_0$ that it would like it to release the
    flag.  This signaling is required because with only a single variable 
    one process **always** has the lock / access to CS.  

    Note that the above example is quite limited, but you can imagine an
    "enter" and "exit" process.

## Two Shared Variable Attempt

OK, so we're pretty sure that we can't do this with 

## Peterson's Algorithm
