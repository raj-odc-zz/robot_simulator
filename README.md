## Robot Simulator
A simulator for a toy robot placed on a table, commands are taken as input from STDIN. Typing 'exit' quits the simulator.
## Rules
A toy robot is free to move on a table of 5 x 5.
There are no obstructions on the table surface.
Any command that would cause the robot to move off the table should be ignored.
Any command before a valid PLACE command should be ignored.

## Commands
```PLACE X,Y,F```
Places the robot on the table, must accept valid placement (X,Y) and a facing direction (F).

```MOVE```
Moves the robot forward one space at a time.

```LEFT```
Rotates the robot left.

```RIGHT```
Rotates the robot right.

```REPORT```
Displays the current placement and direction the robot is facing.

## Installation
```
git clone git@github.com:raj-odc/robot_simulator.git
cd robot_simulator
gem install bundler
bundle install
```
## Simulator
The simulator can be run with:

```ruby main.rb```

## Tests
Tests can be run with the:

```rspec```

Example Input and Output:

```
# Example a
PLACE 0,0,NORTH
MOVE
REPORT
# Output: 0,1,NORTH
```


```
# Example b
PLACE 0,0,NORTH
LEFT
REPORT
# Output: 0,0,WEST
```


```
# Example c
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
# Output: 3,3,NORTH
```
