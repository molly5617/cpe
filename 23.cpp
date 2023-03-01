#include<iostream>
using namespace std;
int main(){
    int b[1005],n,i,num=0,j;
    bool b2=true;
    while(cin>>n)
    {
          bool b2=true;
        for(i=0;i<n;i++)
        {
            cin>>b[i];
            if(i!=0)
            {
                if(b[i]-b[i-1]<0)
                {
                    b2=false;
                }
            }
        }
        int note[20005]={0};
        for(i=0;i<n;i++)
        {
            for(j=0;j<n;j++)
            {
                if(note[b[i]+b[j]]!=0)
                {
                    b2=false;
                }
                note[b[i]+b[j]]=1;
            }
        }
        if(b2)
        {
            cout<<"Case #"<<++num<<": It is a B2-Sequence."<<endl<<endl;
        }
        else
        cout<<"Case #"<<++num<<": It is not a B2-Sequence."<<endl<<endl;
    }
   
    
}