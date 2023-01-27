#include<stdio.h>
#include<stdlib.h>
int a[1000000];
int derivative(int x,int max){
    long long sum=0,exp=1;
    int i;
    for(i=max-1;i>=0;i--){
        sum+=a[i]*exp*(max-i);
        exp*=max;

    }
    return sum;
}

int main(){
    int x,n;
    while(scanf("%d",&x)!=EOF)
    {
        for(n=0;;n++){
            scanf("%d",&a[n]);
            if(getchar()=='\n'){
                break;
            }        
            }
    printf("%d\n",derivative(x,n));
    }
    return 0;
}