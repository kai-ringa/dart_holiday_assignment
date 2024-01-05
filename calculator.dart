import "dart:io";

double numInput() {
  print("Enter the number for operation: ");
  double myNumber = double.parse(stdin.readLineSync()!);
  return myNumber;
}

String operandChoice() {
  print("Enter the operand e.g '+', '-', '/', '*'");
  String operandInput = stdin.readLineSync()!;
  return operandInput;
}

void main() {
  double num1 = numInput();
  double num2 = numInput();
  String choice = operandChoice();
  double answer = 0.0;

  switch (choice) {
    case '+':
      answer = num1 + num2;
      print("${num1} ${choice} ${num2} = ${answer}");
      break;
    case '-':
      answer = num1 - num2;
      print("${num1} ${choice} ${num2} = ${answer}");
      break;
    case '*':
      answer = num1 * num2;
      print("${num1} ${choice} ${num2} = ${answer}");
      break;
    case '/':
      if (num2 == 0) {
        print("Error: Division by zero is not allowed.");
      } else {
        answer = num1 / num2;
        print("${num1} ${choice} ${num2} = ${answer}");
      }
      break;
    default:
      print('Invalid input. Please review.');
  }
}
