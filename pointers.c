#include <stdio.h>

int main(void) {

  int a=10, b=15;
  int *p, *q;

  p = &a;
  q = &b;
  printf("The value of a is: %d\n", a);
  printf("The value of p is: %d\n", p);
  printf("Dereferenced p : %d\n", *p);
  printf("The Value of b is: %d\n", b);
  printf("The value of q is: %d\n", q);
  printf("Dereferenced q : %d\n", *q);
  getchar();

  return 0;
}
