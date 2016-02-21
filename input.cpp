#include <iostream>
#include <string.h>

using namespace std;

int main () {

  string userInput = "";

  cout << "Please enter your name: " << flush;
  cin >> userInput;

  cout << endl;
  cout << "Your name is: " << userInput << endl;

  return 0;
}
