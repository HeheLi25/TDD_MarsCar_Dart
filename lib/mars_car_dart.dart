import 'Model.dart';
import 'dart:math';

class MarsCar {
  Position position;
  Direction direction;
  AreaMap map;

  void initCar(Map<String, dynamic> data) {
    position = Position(data['x'], data['y']);
    direction = data['direction'];
    map = AreaMap(data['map']['x'], data['map']['y']);
  }

  Map<String, dynamic> handleCommands(List<Command> commands) {
    commands.forEach((command) {
      switch (command.type) {
        case CommandType.init:
          initCar(command.data);
          break;
        case CommandType.forward:
          forward();
          break;
        case CommandType.backward:
          backward();
          break;
        case CommandType.turnLeft:
          turnLeft();
          break;
        case CommandType.turnRight:
          turnRight();
          break;
      }
    });
    return {'x': position.x, 'y': position.y, 'direction': direction};
  }

  void forward() {
    switch (direction) {
      case Direction.EAST:
        position.x = min(position.x + 1, map.x);
        break;
      case Direction.WEST:
        position.x = max(position.x - 1, 0);
        break;
      case Direction.NORTH:
        position.y = min(position.y + 1, map.y);
        break;
      case Direction.SOUTH:
        position.y = max(position.y - 1, 0);
        break;
    }
  }

  void backward() {
    switch (direction) {
      case Direction.EAST:
        position.x = max(position.x - 1, 0);
        break;
      case Direction.WEST:
        position.x = min(position.x + 1, map.x);
        break;
      case Direction.NORTH:
        position.y = max(position.y - 1, 0);
        break;
      case Direction.SOUTH:
        position.y = min(position.y + 1, map.y);
        break;
    }
  }

  void turnLeft() {
    switch (direction) {
      case Direction.EAST:
        direction = Direction.NORTH;
        break;
      case Direction.WEST:
        direction = Direction.SOUTH;
        break;
      case Direction.NORTH:
        direction = Direction.WEST;
        break;
      case Direction.SOUTH:
        direction = Direction.EAST;
        break;
    }
  }

  void turnRight() {
    switch (direction) {
      case Direction.EAST:
        direction = Direction.SOUTH;
        break;
      case Direction.WEST:
        direction = Direction.NORTH;
        break;
      case Direction.NORTH:
        direction = Direction.EAST;
        break;
      case Direction.SOUTH:
        direction = Direction.WEST;
        break;
    }
  }
}
