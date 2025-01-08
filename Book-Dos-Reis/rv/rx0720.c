// rx0720.c ====================
#include <stdio.h>
int f(int a, int b)
{
   if (b == 0)
      return 0;
   return f(a, b-1) + a;
}
int main()
{
   printf("%d\n", f(2, 3));
   return 0;
}
