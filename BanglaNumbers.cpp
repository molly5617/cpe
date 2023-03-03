#include<iostream>
#include<cstdio>
using namespace std;
void kuti(int data ,int start){
    char *s[]={" lakh"," hajar"," shata",""};
    int base[]={100000,1000,100,1};
    int mod[]={100,100,10,100};
    for(int k=0;k<4;k++){
        int v=data/base[k]%mod[k];
        if(v==0 && start==false)continue;
        start=true;
        if(v) cout<<" "<<v<<""<<s[k];
    }
}
int main(){
    long long n,num=0;
    while(cin>>n){
        printf("%4d",++num);cout<<".";
        long long base=10000000;
        long long a=n/base/base%base;
        long long b=n/base%base;
        long long c=n/1%base;
        kuti(a,0);if(a)cout<<" kuti";
        kuti(b,a);if(b)cout<<" kuti";
        kuti(c,a|b);
        if(n==0)cout<<" 0";
        cout<<endl;


    }
    return 0;
}