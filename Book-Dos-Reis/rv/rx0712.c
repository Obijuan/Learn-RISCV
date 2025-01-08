// rx0712.c ====================
#include <stdio.h>
void f(int x)
{
   if (x > 0)
   {
      printf("%d\n", x);
      f(x-1);
      printf("%d\n", x);
   }
}
int main()
{
   f(3);
   return 0;
}
