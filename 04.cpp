#include<iostream>
using namespace std;
int main(){
    int a,b;

    while(cin>>a>>b)
    {
        int max=0;
        cout<<a<<" "<<b;
        if(a>b)
        {
        int temp=a;
        a=b;
        b=temp;
        }
        for(int i=a;i<=b;i++)
        {
            int now=i;
            int len=0;
            while(now!=1)
            {
                len++;
                if(now%2==1)
                {
                    now=now*3+1;
                }
                else 
                    now=now/2;
            }
            if(max<len)
            {
                max=len;
            }
        }
        cout<<" "<<max+1<<endl;
    }
}