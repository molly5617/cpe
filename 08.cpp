#include<iostream>
#include<cctype>
using namespace std;
int main(){
    int len=0;
    int count[256]={0};
    char c;
    while ((cin>>c))
    {
        len++;
        count[toupper(c)]++;
    }
    while(--len){
         for(int i='A';i<='Z';i++)
    {
        if(count[i]==len)
        {
            cout<<i<<" "<<count[i]<<endl;
        }
    }

    }
   
}