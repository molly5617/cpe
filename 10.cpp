#include<iostream>
#include<string>
using namespace std;
int main()
{
    string s;
    while ((cin>>s))
    {
        if(s=="0")
        break;
        
        while(s.length()>=2)
        {
            int temp=0;
            for(int i=0;i<s.length();i++)
            {
                temp+=s[i]-'0';
            }
            
            s=to_string(temp);
        }
        cout<<s<<endl;
        
    }
    return 0;
    
}