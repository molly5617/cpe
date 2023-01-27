#include<stdio.h>
int main(){
    int a,b;
    while(scanf("%d %d",&a,&b) != EOF){

        if((a == 0) && (b == 0)){
            break;
        }
        else{
            int temp=floor(sqrt(b));
            int temp2=ceil(sqrt(a));
            
            int c=temp;
            int d=temp2;

            int ans=c-d+1;
            printf("%d\n",ans);
            
        }
    }
}
