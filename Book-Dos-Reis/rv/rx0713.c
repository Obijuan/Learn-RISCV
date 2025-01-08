// rx0713.c ====================  
#include <stdio.h>
void g(int x, int y)
{
   printf("%d %d\n", x, y);
}
void f(int x, int y)
{
   g(y, x);
}
int main()
{
   f(3, 4);
   return 0;
}
