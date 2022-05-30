import 'dart:core';

String calculatorAlgo(String input) {
  String operator = operatorFormat(input);

  String inputChanged = '';
  if (input.contains(' ')) {
    inputChanged = input.split(' ').join();
  } else {
    inputChanged = input;
  }
  List<String> list = inputChanged.split(operator).toList();

  List<String> list1 = list[0].split('');
  List<String> list2 = list[1].split('');

  List<String> listOne = listFormatted(list1);
  int sumOne = sum(listOne);

  print(listOne);
  List<String> listTwo = listFormatted(list2);
  print(listTwo);

  int sumTwo = sum(listTwo);

  return result(
    operator,
    sumOne,
    sumTwo,
  ).toString();
}

int sum(List list) {
  int sumNum = 0;
  for (int i = 0; i <= list.length - 1; i++) {
    if (list[i] == 'I') {
      sumNum += 1;
    } else if (list[i] == 'V') {
      sumNum += 5;
    } else if (list[i] == 'X') {
      sumNum += 10;
    } else if (list[i] == 'L') {
      sumNum += 50;
    } else if (list[i] == 'C') {
      sumNum += 100;
    } else if (list[i] == 'D') {
      sumNum += 500;
    } else if (list[i] == 'M') {
      sumNum += 1000;
    } else if (list[i] == 'IV') {
      sumNum += 4;
    } else if (list[i] == 'IX') {
      sumNum += 9;
    } else if (list[i] == 'LM') {
      sumNum += 950;
    } else if (list[i] == 'XC') {
      sumNum += 90;
    } else if (list[i] == 'XL') {
      sumNum += 40;
    } else if (list[i] == 'XD') {
      sumNum += 490;
    } else if (list[i] == 'LD') {
      sumNum += 450;
    } else if (list[i] == 'CD') {
      sumNum += 400;
    } else if (list[i] == 'CM') {
      sumNum += 900;
    }
  }
  return sumNum;
}

List<String> listFormatted(List<String> list) {
  List<String> listTwo = [];
  if (list.length > 1) {
    for (int i = 0; i <= list.length - 2; i++) {
      if (list[i] + list[i + 1] == 'IV') {
        listTwo.add('IV');
        i++;
      } else if (list[i] + list[i + 1] == 'IX') {
        listTwo.add('IX');
        i++;
      } else if (list[i] + list[i + 1] == 'CM') {
        listTwo.add('CM');
        i++;
      } else if (list[i] + list[i + 1] == 'XC') {
        listTwo.add('XC');
        i++;
      } else if (list[i] + list[i + 1] == 'XL') {
        listTwo.add('XL');
        i++;
      } else if (list[i] + list[i + 1] == 'LM') {
        listTwo.add('LM');
        i++;
      } else if (list[i] + list[i + 1] == 'XD') {
        listTwo.add('XD');
        i++;
      } else if (list[i] + list[i + 1] == 'LD') {
        listTwo.add('LD');
        i++;
      } else if (list[i] + list[i + 1] == 'CD') {
        listTwo.add('CD');
        i++;
      } else {
        listTwo.add(list[i]);
      }
    }
    if (list.last == 'I') {
      listTwo.add('I');
    }else if (list.last == 'V') {
      listTwo.add('V');
    }else if (list.last == 'X') {
      listTwo.add('X');
    }else if (list.last == 'C') {
      listTwo.add('C');
    }else if (list.last == 'D') {
      listTwo.add('D');
    }else if (list.last == 'M') {
      listTwo.add('M');
    }else if (list.last == 'L') {
      listTwo.add('L');
    }
  } else {
    listTwo.add(list[0]);
  }
  return listTwo;
}

String operatorFormat(String text) {
  String operator = '';
  if (text.contains('+')) {
    operator = '+';
  } else if (text.contains('-')) {
    operator = '-';
  } else if (text.contains('*')) {
    operator = '*';
  } else if (text.contains('/')) {
    operator = '/';
  }
  return operator;
}

int result(String operator, int numOne, int numTwo) {
  int number = 0;
  if (operator == '+') {
    number = numOne + numTwo;
  } else if (operator == '-') {
    number = numOne - numTwo;
  } else if (operator == '*') {
    number = numOne * numTwo;
  } else if (operator == '/') {
    number = numOne ~/ numTwo;
  }
  return number;
}
