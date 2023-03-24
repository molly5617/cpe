#include<iostream>
using namespace std;
int main(){
    int n;
    cin>>n;
    while(n--)
    {
        int a[100];
        int k;
        cin>>k;
        int i,j;
        for(i=0;i<k;i++)
        {
            cin>>a[i];
        }
        int times=0;
        for(i=0;i<k-1;i++)
        {
            for(j=0;j<k-i-1;j++)
            {
                int temp;
                if(a[j]>a[j+1])
                {
                    temp=a[j];
                    a[j]=a[j+1];
                    a[j+1]=temp;
                    times++;
                }
            }
        }
        cout<<"Optimal train swapping takes "<<times<<" "<<"swaps."<<endl;
    }
}