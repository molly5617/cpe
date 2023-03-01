#include<iostream>
using namespace std;
int main(){
    int n;int num=0;
    cin>>n;
    while(n--)
    {
        int ans=0;
        num++;
        int a,b;
        cin>>a>>b;
        if(a>b)
        {
            int temp=a;
            a=b;
            b=temp;
        }
        for(int i=a;i<=b;i++)
        {
            if(i%2==1)
            {
                ans+=i;
            }
        }





        cout<<"Case "<<num<<": "<<ans<<endl;
    }
    return 0;
}