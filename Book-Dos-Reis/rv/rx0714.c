// rx0714.c ====================  
#include <stdio.h>
void f(int x, int a[])
{	    
   printf("%d\n", a[x]);
}
int main()
{
   int a[10];
   f(6, a);
   f(1, a);
   return 0;
}
