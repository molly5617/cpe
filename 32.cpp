#include<iostream>
using namespace std;
int main(){
    int a,b;
    while(cin>>a>>b)
    {
        int temp=a;
        while(temp>b &&b!=1 &&b!=0)
        {
            if(temp%b!=0)
            {
                break;
            }
            temp/=b;
        }
        if(b==0 ||b==1)
        {
            cout<<"Boring!";
        }
        
       
        else if(temp%b==0)
        {
            while(a!=1)
            {
                cout<<a<<" ";
                a/=b;
            }
            cout<<"1";
            
        }
        else
        {
            cout<<"Boring!";
        }
        cout<<endl;
    }
}