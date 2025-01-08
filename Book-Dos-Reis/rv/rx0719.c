// rx0719.c ====================
#include <stdio.h>
struct X
{
   int m, n;
};
int x, y, z = 6;
void f(int *a, int b, int c, struct X *p)
{
   static int h, i, j;
   b = c = h = i = ++j;
   printf("%d %d\n", *a, b);
   (*p).m = b;
   (*p).n = c;
}
int main()
{
   struct X s;
   x = 1;
   y = 2;
   f(&x, y, z, &s);
   printf("%d %d\n", s.m, s.n);
   f(&z, y, z, &s);
   printf("%d %d\n", s.m, s.n);
   return 0;
}  

