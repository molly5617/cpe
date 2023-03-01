#include<iostream>
#include<string>
using namespace std;
int main(){
    int n;
    while(cin>>n)
    {
        if(n==0)
        break;
        string ans="";int num=0;
        while(n!=0)
        {
            ans+=n%2;
            if(n%2==1)
            {
                num++;
            }
            n=n/2;
        }
        cout<<"The parity of ";
        for(int i=ans.size()-1;i>=0;i--)
        {
            cout<<ans[i];
        }
        cout<<" is "<<num<<" (mod 2)."<<endl;
    }
}