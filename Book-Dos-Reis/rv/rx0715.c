// rx0715.c ====================
#include <stdio.h>
void f()
{
   static int x = 3;
   printf("%d\n", x);
   x = x + 1;
}
int main()
{
   f();
   f();
   return 0;
}
