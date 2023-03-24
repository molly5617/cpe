#include<stdio.h>
#include<stdlib.h>
#include<math.h>
int main(){
    int x,n;
    int a[100000];
    int b[100000];
    while(scanf("%d",&x)!=EOF)
    {
        for(n=0;;n++)
        {
            scanf("%d",&a[n]);

            if(getchar()=='\n')
            {
                break;
            }
        }
        for(int i=0;i<=n;i++)
        {
            b[n-i]=a[i];
           
        }
        int sum=0;
        for(int i=1;i<=n;i++)
        {
        
        	
            sum+=b[i]*(i)*pow(x,i-1);
        }
        printf("%d\n",sum);
        
    }
}