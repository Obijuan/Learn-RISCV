// rx0711.c ====================  
#include <stdio.h>
int a = 5;
void f(int *x)
{
   *x = *x + 1;
}
int main()
{
   f(&a);
   printf("%d\n", a);
   return 0;
}