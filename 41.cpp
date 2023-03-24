#include<iostream>
#include<stdlib.h>
#include<stdio.h>
using namespace std;
#define MAX_SIZE 1000000
int x[MAX_SIZE];
int comp(const void *a,const void *b)
{
    return (*(int *)a)-(*(int *)b);
}
void find_mid(int *x,int n)
{
    int min,max,nx,np,i;
    qsort(x,n,sizeof(int),comp);
    if(n%2==1)
    {
        min=x[n/2];
        for(nx=0,i=0;i<n;i++)
        {
            if(x[i]==min)nx++;
        }
        np=1;
    }
    else{
        min=x[n/2-1];
        max=x[n/2];
        for(nx=0,i=0;i<n;i++)
        {
            if(min<=x[i]&&x[i]<=max)nx++;
        }
        np=max-min+1;
    }
    cout<<min<<" "<<nx<<" "<<np<<endl;
}
int main(){
    int n,i;
    while(cin>>n)
    {
        for(i=0;i<n;i++)
        {
            cin>>x[i];
        }
        find_mid(x,n);
    }
}