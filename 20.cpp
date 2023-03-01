#include<iostream>
using namespace std;
int main(){
    int n;
    cin>>n;
    while(n--)
    {
        int a,b;
        cin>>a>>b;
        if((a+b)%2!=0)
        {
            cout<<"impossible"<<endl;
        }
        else
        {
            if( (a-b)<0 )
            {
                cout<<"impossible"<<endl;
            }
            else
            {
                cout<<(a+b)/2<<" "<<(a-b)/2<<endl;
            }
        }
    }
}