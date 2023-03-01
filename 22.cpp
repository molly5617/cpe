#include<iostream>
using namespace std;
int main(){
    int a,b;
    int s[100001]={};
    for(int i=1;i*i<100001;i++)
        {
            s[i*i]=1;
        }
    for(int i=1;i<100001;i++)
    {
        s[i]+=s[i-1];
    }
    while(cin>>a>>b){
       
        if(a==0&&b==0)
        {
            break;
        }
        cout<<s[b]-s[a-1]<<endl;
        

    }
    return 0;
}
