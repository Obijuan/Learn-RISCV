#include <stdio.h>
int z = 13;
void add1(int *p, int a)
{
   *p = *p + 1;   // increments value in x
   a = a + 1;     // increments parameter a, no effect on y
   z = z + 1;     //  increments global variable z
}
//=========================================================
int main()
{
   int x = 7, y = 11;
   printf("%d %d %d\n", x, y, z);  // displays 7 11 13
   add1(&x, y);
   printf("%d %d %d\n", x, y, z);  // displays 8 11 14
   return 0;
}
