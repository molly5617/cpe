#include<iostream>
using namespace std;
int main(){
    int cases,n;
    char tmp[100];
    long long m[100][100];
    int i,j,f,c=1;
    cin>>cases;
    while(c<=cases){
        cin>>tmp>>tmp>>n;
        f=1;
        for(i=0;i<n;i++)
        {
            for(j=0;j<n;j++)
            {
                cin>>m[i][j];
                if(m[i][j]<0)
                {
                    f=0;
                }
            }
        }
        if(f==1){
            for(i=0;i<n;i++)
            {
                for(j=0;j<n;j++)
                {
                    if(m[i][j]!=m[n-1-i][n-1-j])
                    {
                        f=0;
                        break;
                    }
                }
            }
        }
        if(f==0)
        {
            cout<<"Test #"<<c<<": "<<"Non-symmetric."<<endl;
        }
        else
        cout<<"Test #"<<c<<": "<<"Symmetric."<<endl;
        c++;
    }
}