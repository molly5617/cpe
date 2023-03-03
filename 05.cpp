#include<iostream>
using namespace std;
int main()
{
    string a;
    while(cin>>a)
    {
        int c[2]={0};
    
    if(a=="0")
    {
        break;
    }
    int len=a.length();
    cout<<a;
    for(int i=0; i<len; i++)
    {
        c[i%2]+=a[i]-'0';
    }
    int k=abs(c[0]-c[1]);
    if(k%11==0)
    {
        cout<<" is a multiple of 11.";
    }
    else
    cout<<"is not a multiple of 11.";

    cout<<endl;
    }
    
    

    
}