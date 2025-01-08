// rx0716.c ====================
#include <stdio.h>
void f()
{
   static int x = 3;
   printf("%d\n", x);
   x = x + 1;
}
void g()
{
   static int x = 5;
   printf("%d\n", x);
   x = x+ 1;
}
int main()
{
   f();
   f();
   g();
   g();
   return 0;
}
