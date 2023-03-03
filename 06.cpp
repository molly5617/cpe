#include<iostream>
#include<cstdio>
using namespace std;
void kuti(int data)
{
    char *s[]={" lakh"," hajar"," shata",""};   
    int base[]={100000,1000,100,1};
    int mod[]={100,100,10,100};
    for(int i=0;i<4;i++)
    {
        long long v=data/base[i]%mod[i];
        if(v){
            cout<<" "<<v<<""<<s[i];
        }
    }
}
int main(){
    long long n;
    int num=0;
    while(cin>>n){
        printf("%4d.",++num);
        long long base=10000000;
        long long a=n/base/base%base;
        long long b=n/base%base;
        long long c=n%base;
        kuti(a);if(a)cout<<" kuti";
        kuti(b);if(a|b)cout<<" kuti";
        kuti(c);
        if(n==0)
        {
            cout<<" 0";

        }
        cout<<endl;

    }
    return 0;
}