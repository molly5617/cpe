#include<iostream>
#include<algorithm>
using namespace std;
int main(){
    int n;
    cin >> n;
    while(n--)
    {
        int r;
        cin>>r;
        int a[501];
        for(int i=0;i<r;i++)
        {
            cin>>a[i];
        }
        sort(a,a+r);
        int mid=a[r/2];int ans=0;
        for(int i=0;i<r;i++)
        {
            ans+=abs(a[i]-mid);
        }
        cout<<ans<<endl;    
    }
}