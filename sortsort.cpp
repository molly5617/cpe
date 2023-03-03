#include<iostream>
#include<algorithm>
using namespace std;
int n,m;
bool cmp(int a,int b)
{
    if(a%m!=b%m) return a%m<b%m;
    else if(a%m==b%m&&(a%2!=b%2))
    {
        a%2>b%2;
    }
    else if(a%m==b%m&&(a%2)==1)
    {
        return a>b;
    }
    else if(a%2==0) return a<b;

}
int main(){
    
    int a[10001];
    while(cin>>n>>m)
    {
    	
        if(n==0&&m==0)
        {
            cout<<"0 0"<<endl;
            break;
        }
        
        else
        {
            for(int i=0;i<n;i++)
            {
                cin>>a[i];
            }
        }
        sort(a,a+n,cmp);
        cout<<n<<" "<<m<<endl;
        for(int i=0;i<n;i++)
            {
                cout<<a[i]<<endl;
            }


    }
    

}
