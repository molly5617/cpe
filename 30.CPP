#include<iostream>
using namespace std;
int h[100];
int main(){
    int t,d,p;
    cin>>t;
    while(t--){
        cin>>d>>p;
        int day[3651];
        for(int i=0;i<3651;i++)
        {
            day[i]=0;
        }
        for(int i=0;i<p;i++)
        {
            cin>>h[i];
            for(int j=h[i];j<=d;j+=h[i]) 
            {
                day[j]=1;
            }
        }
        int count=0;
        for(int j=1;j<=d;j++)
        {
            if(j%7==6||j%7==0)continue;
            if(day[j]==1)count++;
        }
        cout<<count <<endl;
        
    }
}