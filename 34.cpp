#include<iostream>
#include<string>
using namespace std;
int main(){
    string a;
    while(cin>>a)
    {
        if(a=="0")
        {
            break;
        }
        int degree=1;
        int v=0;
        for(int i=0;i<a.length();i++)
        {
            v+=(int)(a[i]-'0');

        }
        
        while(v%9==0 && v!=9)
        {
            int sum=0;
            for(;v;v/=10)
            {
                sum+=v%10;
            }
            v=sum;degree++;

        }
        if(v%9)cout<<a<<" is not a multiple of 9."<<endl;
        else cout<<a<<" is a multiple of 9 and has 9-degree "<<degree<<"."<<endl;
    }
}