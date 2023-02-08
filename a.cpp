#include<iostream>
#include<string>
#include<string.h>
using namespace std;
int main(){
    string s;
    while(cin>>s){
    if(s[0]==48)
    {
    	break;
    }
    
    int temp=20000000;
    while(temp>=10)
    {
        temp=0;
        for(int i=0;i<s.length();i++)
        {
            temp+=s[i]-48;
        }
        s=to_string(temp);
        
    }
    
    
    cout<<s<<endl;}
}