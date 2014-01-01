maze
====

Find the shortest path through a maze

Uses the A* algorithm to determine the shortest path.
The A* algorithm was a good approach because it allows the program to explore all movement options, while giving the moves with highest value more priority.
This way, we know that the first move we find that gets us to the destination is the shortest path to the destination.


The most important parts to make this algorithm work are:
+ The Manhattan value of each move. Manhattan values are calculated by adding the total number of steps to reach a ceratin space and a estimate distance to the end.
The estimate distance assumes there are no walls, so it is just the direct number of spaces to the end position from the current position.
+ Ignoring the previous position. For determining the next set of possible moves, ignoring the previous position greatly reduces the amount of retreading.


###Optimizations
+ Add a position/value blacklist to avoid circular paths in the mix.
