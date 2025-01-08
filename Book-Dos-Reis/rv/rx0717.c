// rx0717.c ====================
#include <stdio.h>
int a = 7;
int f(int *x, int y)
{
   int sum;
   printf("%d\n", *x);
   sum = *x + y;
   return sum;
}
int main()
{
   int ans;
   ans = f(&a, 11);
   printf("ans = %d\n", ans);
   return 0;
}
