import "dart:io";

bool winner = false;
bool isPlayerXTurn = true;
int moveCount = 0;

// Game board representations
List<String> values = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];

// Winning combinations
List<String> combinations = [
  '012',
  '048',
  '036',
  '147',
  '246',
  '345',
  '678',
  '258'
];

// Check combination
bool checkCombination(String combination, String checkFor) {
  List<int> numbers = combination.split('').map((item) {
    return int.parse(item);
  }).toList();
  bool match = false;
  for (final item in numbers) {
    if (values[item] == checkFor) {
      match = true;
    } else {
      match = false;
      break;
    }
  }
  return match;
}

// check winner
void checkWinner(player) {
  for (final item in combinations) {
    bool combinationValidity = checkCombination(item, player);
    if (combinationValidity == true) {
      print('$player WON!!');
      winner = true;
      break;
    }
  }
}

void clearScreen() {
  print('\x1B[2J\x1B[0;0H');
}

void generateBoard() {
  print('    |    |   ');
  print(' ${values[0]}  | ${values[1]}  | ${values[2]}');
  print('    |    |   ');
  print(' ${values[3]}  | ${values[4]}  | ${values[5]}');
  print('    |    |   ');
  print(' ${values[6]}  | ${values[7]}  | ${values[8]}');
  print('    |    |   ');
}

void getNextCharacter() {
  print('Choose a number for ${isPlayerXTurn ? "X" : "O"}');
  try {
    int number = int.parse(stdin.readLineSync()!);
    if (number < 1 ||
        number > 9 ||
        values[number - 1] == 'X' ||
        values[number - 1] == 'O') {
      print('Invalid move. Try again.');
    } else {
      values[number - 1] = isPlayerXTurn ? 'X' : 'O';
      isPlayerXTurn = !isPlayerXTurn;
      moveCount++;
      clearScreen();
      generateBoard();
      checkWinner('X');
      checkWinner('O');
      if (moveCount == 9 && !winner) {
        print('DRAW!');
        winner = true;
      }
      if (!winner) {
        getNextCharacter();
      }
    }
  } catch (e) {
    print('Invalid input. Enter a number.');
    getNextCharacter();
  }
}

void main() {
  generateBoard();
  getNextCharacter();
}
