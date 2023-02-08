#include<iostream>
#include<set>
using namespace std;
int main(){
    
    int n;
    while(cin>>n){
        set<int> ans;
        int a;cin>>a;
        for(int i=1;i<n;i++)
        {
            int b;
            cin>>b;
            int d=abs(a-b);
            if(d&&d<n)
            {
                ans.insert(d);
            }
            a=b;
        }
        if(ans.size()==n-1)
        {
            cout<<"Jolly"<<endl;
        }
        else
            cout<<"Not jolly"<<endl;
    }

}