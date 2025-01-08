// rx0619.c Run with args "first second third"
#include <stdio.h>
int main(int argc, char *argv[])
{
   printf("%s\n", argv[argc - 1]);
   printf("%s\n", argv[0]);
   printf("%d\n", argc);
   return 0;
}
