#include <iostream>
#include <iomanip>

using namespace std;

int main() {

  cout << "1. Add a new record." << endl;
  cout << "2. Delete record." << endl;
  cout << "3. View record." << endl;
  cout << "4. Search record." << endl;
  cout << "5. Quit" << endl;

  cout << " Enter your selection: " << flush;

  int value;
  cin >> value;

  if (value <  3) {
    cout << "Insufficient privileges to use these menu option." << endl;
  }
  else {
    cout << "Privilege level sufficient." << endl;
  }


  return 0;
}
