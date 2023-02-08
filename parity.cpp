#include<iostream>
using namespace std;
int main(){
    int n;
    while(cin>>n){
        int num[30]={};
        int i=0;
        int sum=0;
        if(n==0)
        {
            break;
        }
        
        else{
            while(n!=0)
            {
                num[i]=n%2;
                if(n%2==1)
                sum++;
                n=n/2;
                i++;
            }
            cout<<"The parity of ";
        for(int j=i-1;j>=0;j--)
        cout<<num[j];
        cout<<" is "<<sum<<" (mod 2).";
        }
        
        

    }
}