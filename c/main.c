#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main(int argc, char *argv[])
{
   if(argc==1){
	printf("NO PASASTE ARGUMENTOS");	
   }
   else{
	int cuenta= atoi(argv[1]);
		for(int i=0; i<=cuenta; i++){
		printf("%d \n", i);
   		}
   }
   return 0;
}
