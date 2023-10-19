#include<iostream>
using namespace std;
#include<stack>
int main(){
    char c;
    stack<char>s;
    while(cin>>c&&c!='@')
    {
        if(c=='(')
        {
            s.push(c);
        }
        if(c==')')
        {

            if(s.empty())
            {
                cout<<"NO"<<endl;
                return 0;
            }
            else
            s.pop();

        }
        
        
        
    }
    if(s.empty())
    {
        cout<<"YES"<<endl;
    }
    else
    cout<<"NO"<<endl;
    return 0;
}