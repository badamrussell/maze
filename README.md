maze
====

Find the shortest path through a maze

This code uses the A* algorithm to determine the shortest path.
The A* algorithm was a good approach because it allows the program to explore all movement options, while giving the more promising moves more priority.
Also, doing it this way, the first path that is found will be one of the shortest paths, so the search can immediately end.


The most important parts to make this algorithm work are:
+ The Manhattan value of each move. Manhattan values are calculated by adding the total number of steps to reach a ceratin space and a estimate distance to the end.
The estimated distance assumes there are no walls, so it is just the direct number of spaces to the end position from the current position.
+ Ignoring the previous position. For determining the next set of possible moves, ignoring the previous position greatly reduces the amount of retreading.


###Optimizations
+ Add a position/value blacklist to avoid circular paths in the mix.
