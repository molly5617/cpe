#include<iostream>
using namespace std;
char s1[31],s2[31];
int stringtoint(char s[31])
{
    int ans=0;
    for(int i=0;i<30;i++)
    {
        if(s[i]=='\0')break;
        ans*=2;
        if(s[i]=='1')ans+=1;
    }
    return ans;
}
int gcd(int p,int q)
{
    if(p<q)return gcd(q,p);
    if(q==0)return p;
    return gcd(q,p%q);
}
int main(){
    int n,p;
    cin>>n;
    for(int p=1;p<=n;p++)
    {
        cin>>s1>>s2;
        int n1=stringtoint(s1);
        int n2=stringtoint(s2);
        if (gcd(n1,n2)>1){
            cout<<"Pair #"<<p<<": All you need is love!"<<endl;

        }
        else{
            cout<<"Pair #"<<p<<": Love is not all you need!"<<endl;
        }
    }

}