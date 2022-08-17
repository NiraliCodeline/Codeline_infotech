void main() {
  chooseGender(Gender.female);
}

enum Gender { male, female }

void chooseGender(Gender gender) {
  if (gender == Gender.male) {
    var m = Male();
    m.male();
  } else {
    var f = Female();
    f.female();
  }
}

class Male {
  void male() {
    print('Male');
  }
}

class Female {
  void female() {
    print('Female');
  }
}
