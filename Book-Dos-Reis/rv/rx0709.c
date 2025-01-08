// rx0709.c ==================== 
#include <stdio.h>
void g()
{
   printf("in g\n");
}
void f(void)
{
   g();
}
int main()
{
   f();
   return 0;
}
