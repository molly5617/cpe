#include<iostream>
#include<string>
#include<math.h>
using namespace std;
int main(){
    string a,b;
    while(cin>>a)
    {
        b="";
        for(int i=a.length()-1;i>=0;i--)
        {
            b=b+a[i];
        }
       
        int c=0,d=0;
        for(int i=a.length()-1,k=1;i>=0;i--,k=k*10)
        {
            c+=(int)(a[i]-'0')*k;
            d+=(int(b[i])-'0')*k;
        }
        bool prime=true;
        bool emirp=true;
        if(c==d)
        {
            emirp=false;
        }
        for(int i=sqrt(c);i>1;i--)
        {
            if(c%i==0)
            {
                prime=false;
                
                break;
            }
        }
        if(prime)
        {
             for(int i=sqrt(d);i>1;i--)
                {
                    if(d%i==0)
                    {
                        emirp=false;
                        break;
                    }
                }
        }
        if(prime && emirp)
        {
            cout<<a<<" is emirp.";
        }
        else if(prime)
        {
            cout<<a<<" is prime.";
        }
        else
        cout<<a<<" is not prime.";

        cout<<endl;
        

        
    }
}