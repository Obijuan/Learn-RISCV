// rx0718.c ====================
#include <stdio.h>
int x = 2; 
void f(int *p) 
{
   x = x + 5;
   *p = *p + 10;
   printf("%d %d\n", x, *p);
}
int main()
{
   static int x = 3;
   f(&x);
   printf("%d\n", x);
   return 0;
}
