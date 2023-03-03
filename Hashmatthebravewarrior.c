#include<stdio.h>
#include <stdlib.h>
int main(){
    long long int a,b;
    while(scanf("%lld %lld",&a,&b)!=EOF)
    {
    	long long int sum=abs(a-b);
        printf("%lld\n",sum);
    }
    return 0;
}