# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

Random partitioning evenly distributes data across the three boats, balancing the workload and preventing any single machine from becoming a performance bottleneck (i.e., a hotspot). However, because data is assigned randomly with no predictable location, retrieving specific records requires querying all machines, which increases latency and resource usage. This tradeoff makes random partitioning ideal for workloads focused on uniform data processing but less suited for workloads requiring frequent targeted lookups.

## Partitioning by Hour

Partitioning by hour makes data retrieval more efficient, as the time bounds of each record are known, allowing queries to target specific boats directly. However, this approach can create a hotspot, since AquaByte collects most of its data in the early morning and evening—leading to two boats handling most of the workload while the other remains mostly idle. Partitioning by hour could be more effective if time ranges were adjusted to distribute the workload more evenly across the three boats.

## Partitioning by Hash Value

Partitioning by hash value evenly distributes data across the three boats, balancing the workload and preventing any single machine from becoming a performance bottleneck (i.e., a hotspot). It also allows efficient retrieval of records tied to a specific timestamp, since the hash directs the query to a single boat. However, this method is less effective for time-range queries, which require scanning all boats to gather the relevant data.
