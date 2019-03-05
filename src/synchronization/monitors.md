# synchronization

In general there are two types of thread synchronization:  

* mutual exclusion: only allow a single thread to access a bit of memory / code at once
    * lock / mutex
    * more generally can allow multiple read access
* ordering constraints: enforce before-after relationships
    * wake up a thread when another is finished in the critical section
    * allows a pool of threads to wait on a certain condition

## monitors

Monitors enforce a critical section of code in a .  The lock ensures mutual
exclusion while the condition variable is used to prevent busy waiting for 
the mutual exclusion.

## references

* https://pages.mtu.edu/~shene/NSF-3/e-Book/MONITOR/monitor-types.html
