#include<iostream>
using namespace std;
int main(){
    int a,b,c;
    while(cin>>a>>b)
    {
        cout<<a<<" "<<b<<" ";
        if(a>b)
        {
            int temp=a;
            a=b;
            b=temp;
        }
        int len=0;int max=0;
        for(int i=a;i<=b;i++)
        {
        	len=0;
            int now=i;
            while(now!=1)
            {
                len++;
                if(now%2!=0)
                {
                    now=3*now+1;
                }
                else
                {
                    now=now/2;
                }
            }
            if(len>max)
            {
                max=len;
               
                
            }
        }
        cout<<max+1<<endl;
    }
}