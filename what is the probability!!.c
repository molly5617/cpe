#include<stdio.h>
#include<stdlib.h>
#include<math.h>
int main(){
    int sets,num,n,i;
    double p,pi;
    scanf("%d",&sets);
    for(num=0;num<sets;num++){
        scanf("%d%lf%d",&n,&p,&i);
        if(p<0.00001)
        {
            printf("0.0000\n");
        }
        else{
            pi=pow(1-p,i-1)*p/(1-pow(1-p,n));
            printf("%.4lf\n",pi);
        }
    }
}