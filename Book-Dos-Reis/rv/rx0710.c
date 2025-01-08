// rx0710.c ====================   
#include <stdio.h>
void g(int v1, int v2, int v3, int v4, int v5, int v6, int v7, int v8,
       int v9, int v10)
{
   printf("%d\n", v1+v2+v3+v4+v5+v6+v7+v8+v9+v10);   
}
void f(void)
{
   g(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
   printf("down\n");
}
int main()
{
   printf("hello\n");
   f();
   printf("goodbye\n");
   return 0;
}
