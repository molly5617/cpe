#include<iostream>
using namespace std;
int main(){
    long long int n;
    cin>>n;
    for(int i=1;i<=n;i++)
    {
        long long int x1,y1,x2,y2;
        cin>>x1>>y1>>x2>>y2;
        long long int pos1,pos2;
        pos1=(x1+y1+1)*(x1+y1)/2+x1;
        pos2=(x2+y2+1)*(x2+y2)/2+x2;
        cout<<"Case "<<i<<": "<<pos2-pos1<<endl;
    }
    return 0;
}