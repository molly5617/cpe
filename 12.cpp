#include<iostream>
#include<cstring>
using namespace std;
int main(){
    char str[100][101];
    int len[100];int n=0;int max=0;
    int i,j;
    for(i=0;i<100;i++)
    {
        for(j=0;j<101;j++)
        str[i][j]=0;

        len[i]=0;
    }
    while(cin.getline(str[n],101))
    {
        len[n]=strlen(str[n]);
        if(len[n]>max)
        {
            max=len[n];
        }
        for(i=len[n];i<max;i++)
        {
            str[n][i]=' ';
            len[n]++;
        }
        n++;
    }
    for(i=0;i<max;i++)
    {
        for(j=n-1;j>=0;j--)
        {
            if(len[j]>i)
            {
                cout<<str[j][i];
            }
        }
        cout<<endl;
    }
    return 0;
}