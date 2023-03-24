#include<stdio.h>
#include<stdlib.h>
#include<string.h>
int main(){
     char a[1001],b[1001];
     int count_a[123],count_b[123];
     while(gets(a))
     {
        memset(count_a,0,sizeof(a));
        memset(count_b,0,sizeof(b));
        for(int i=0;i<strlen(a);i++)
        {
            count_a[a[i]]++;
        }
        gets(b);
        for(int i=0;i<strlen(b);i++)
        {
            count_b[b[i]]++;
        }
        for(int i=97;i<123;i++)
        {
            int j=0;
            while(j<count_a[i]&&j<count_b[i])
            {
                printf("%c",i);
                j++;
            }
        }
        printf("\n");
     }
}