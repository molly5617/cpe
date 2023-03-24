#include<stdio.h>
#include<math.h>
#include<stdlib.h>
int main(){
    int k;
    scanf("%d",&k);
    while (k--)
    {
        int a;
        double b;
        int c;
        scanf("%d%lf%d",&a,&b,&c);
        if(b<0.000001)
        {
            printf("0.0000\n");
        }
        else
        {
            double d=pow(1-b,c-1)*b/(1-pow(1-b,a));
            printf("%.4lf\n",d);
        }
        /* code */
    }
    
}