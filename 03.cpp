#include<iostream>
using namespace std;
int main(){
    int a,b;
    while(cin>>a>>b)
    {
        int carry=0;
        int ans=0;
        if(a==0)
        break;

        if(b>a)
        {
            int temp=a;
            a=b;
            b=a;
        }

        while(a!=0)
        {
            int first=a%10;
            int second=b%10;
            carry=(first+second+carry)/10;
            if(carry)
            {
                ans++;
            }
            a=a/10;
            b=b/10;

        }
        if(ans==0)
        {
            cout<<"No carry operation."<<endl;
        }
        else if(ans==1)
        {
            cout<<ans<<" carry operations."<<endl;

        }
        else
            cout<<ans<<" carry operation."<<endl;

    }
}   
