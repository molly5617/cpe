#include<iostream>
#include<string>
#include<algorithm>
using namespace std;
int main(){
   string num;
   string b="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
   while(cin>>num)
   {
        for(int i=0;i<num.size();i++)
        {
            num[i]=b.find(num[i]);
            num[i]=max(0,(int)num[i]);
        }
        int n=*max_element(num.begin(),num.end())+1;
        n=max(2,n);
        for(;n<=62;n++)
        {
            int rsd=0;
            for(int k=0;k<num.size();k++)
            {
                rsd+=rsd*n+num[k];
                rsd%=(n-1);
            }
            if(rsd==0)break;
        }
        if(n<=62)cout<<n;
        else cout<<"Such number is impossible!";
        cout<<endl;

   }
   return 0;
    
}