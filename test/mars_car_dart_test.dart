import 'package:mars_car_dart/Model.dart';
import 'package:mars_car_dart/mars_car_dart.dart';
import 'package:test/test.dart';

const data = {
  'x': 50,
  'y': 50,
  'direction': Direction.NORTH,
  'map': {'x': 100, 'y': 100},
};
void main() {
  var car = MarsCar();
  test('init MarsCar', () {
    car.initCar(data);
    expect(car.position.x, 50);
    expect(car.position.y, 50);
    expect(car.direction, Direction.NORTH);
    expect(car.map.x, 100);
    expect(car.map.y, 100);
  });

  test('go forward', () {
    car.initCar(data);
    car.forward();
    expect(car.position.x, 50);
    expect(car.position.y, 51);
    expect(car.direction, Direction.NORTH);
  });

  test('go backward', () {
    car.initCar(data);
    car.backward();
    expect(car.position.x, 50);
    expect(car.position.y, 49);
    expect(car.direction, Direction.NORTH);
  });

  test('turn left', () {
    car.initCar(data);
    car.turnLeft();
    expect(car.direction, Direction.WEST);
    car.turnLeft();
    expect(car.direction, Direction.SOUTH);
    car.turnLeft();
    expect(car.direction, Direction.EAST);
    car.turnLeft();
    expect(car.direction, Direction.NORTH);
  });

  test('turn right', () {
    car.initCar(data);
    car.turnRight();
    expect(car.direction, Direction.EAST);
    car.turnRight();
    expect(car.direction, Direction.SOUTH);
    car.turnRight();
    expect(car.direction, Direction.WEST);
    car.turnRight();
    expect(car.direction, Direction.NORTH);
  });

  test('boundary value while car move', () {
    car.initCar(data);
    car.position.y = 100;
    car.forward();
    expect(car.position.y, 100);
    expect(car.direction, Direction.NORTH);
    car.direction = Direction.SOUTH;
    car.backward();
    expect(car.position.y, 100);
    expect(car.direction, Direction.SOUTH);
  });

  test('send commands and send back data', () {
    final commands = [
      Command(CommandType.init, data: data),
      Command(CommandType.forward),
      Command(CommandType.forward),
      Command(CommandType.backward),
      Command(CommandType.forward),
      Command(CommandType.forward),
      Command(CommandType.turnLeft),
      Command(CommandType.forward),
      Command(CommandType.turnLeft),
      Command(CommandType.turnRight),
    ];
    final result = car.handleCommands(commands);
    expect(car.position.x, 49);
    expect(car.position.y, 53);
    expect(car.direction, Direction.WEST);
    expect(result['x'], 49);
    expect(result['y'], 53);
    expect(result['direction'], Direction.WEST);
  });
}
