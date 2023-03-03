#include<iostream>
using namespace std;
int main(){
    long long int a,b;
    while(cin>>a>>b){
        int ans=0,carry;
        if(a==b&&a==0)
        {
            break;
        }
        while(a!=0&&b!=0)
        {
            carry=(a%10+b%10)/10;
            if(carry>0)ans+=1;
            a=a/10+carry;
            b=b/10;
        }
        if(ans==0)
        {
        	cout<<"No carry operation."<<endl;
        }
        else if(ans==1)
        {
            cout<<ans<<" carry operation."<<endl;
        }
        else
        cout<<ans<<" carry operations."<<endl;
    }
}