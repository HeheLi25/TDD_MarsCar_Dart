enum CommandType {
  init,
  forward,
  backward,
  turnLeft,
  turnRight,
}

class Command {
  final CommandType type;
  final Map<String, dynamic> data;
  Command(this.type, {this.data});
}

enum Direction {
  EAST,
  SOUTH,
  WEST,
  NORTH,
}

class AreaMap {
  final int x;
  final int y;
  AreaMap(this.x, this.y);
}

class Position {
  int x;
  int y;

  Position(this.x, this.y);
}
