#include<iostream>
using namespace std;
int main(){
    int n;
    cin>>n;
    while(n--)
    {
        int m;
        int b1=0;
        int b2=0;
        cin>>m;
        int z=m;
        while(m!=0)
        {
            b1+=m%2;
            m=m/2;
        }
        cout<<b1<<" ";
        while(z!=0)
        {
            int temp=z%10;
            while(temp!=0)
            {
                b2+=temp%2;
                temp/=2;
            }
            z/=10;
        }
        cout<<b2<<endl;
    }
}