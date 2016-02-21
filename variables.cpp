#include <iostream>
#include <string.h>

using namespace std;

int main () {

  int numberCats = 5;
  int numberDogs = 7.01;
  int numberAnimals = numberCats + numberDogs;
  int i,j;

  string text1 = "This is a ";
  string text2 = "joined String";
  string text3 = "";

  j = 14 - numberAnimals;
  i = 0;
  text3 = text1 + text2;

  cout << "Number of cats: " << numberCats << endl;
  cout << "Number of dogs: " << numberDogs << endl;
  cout << "I have " << numberAnimals << " animals in my place." << endl;
  cout << "The value of j and i is: " << j << " # " << i << endl;

  cout << text1 << text2 << endl;
  cout << text3 << endl;


  return 0;
}
