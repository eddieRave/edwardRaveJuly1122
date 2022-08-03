## GCD

### DispatchQueue.main
- UI only
- serial Queue, FIFO
- only 1 main queue exists
    
### DispatchQueue.global()
- qos
- concurrent queue, enqueued tasks can finished in any order
- creating custom queues

### Sync vs Async
- sync waits for the current execution until the sync code returns
- async code returns immediately after it enqueues the code to be executed, the code will be executed later

### Dispatch Groups
- coordinating multiple async calls

