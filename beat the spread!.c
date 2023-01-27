#include<stdio.h>
int main(){
    int n;
    scanf("%d",&n);
    while(n--){
        int s,d;
        scanf("%d",&s);
        scanf("%d",&d);
        int a,b;
        a=(s+d)/2;
        b=s-a;
        if((a<0)||(b<0)||(s+d)%2!=0){
            printf("impossible\n");
        }
        else{
            printf("%d %d\n",a,b);
        }

    }
}