#include <stdio.h>         // stdio.h has prototype for printf
void f(int z);             // function prototype
int x = 1;            		     // global variable
int main()                 // int is the return type
{
   f(x);                   // pass f the value of x
   f(x+10);                // pass f the value of x+10
   return 0;               // return 0 to the operating system
}
void f(int z)              			// z is the parameter
{
   int a = 2;		              // dynamic local variable
   static int b = 3;       // static local variable
   printf("%d\n", z);      // display z
   printf("%d\n", a);      // display a
   printf("%d\n", b);      // display b
   printf("%d\n", x);      // display x
   a++;                    // increment a
   b++;                    // increment b
   x++;                    // increment x
}
