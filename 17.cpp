#include<iostream>
using namespace std;
int main(){
    
    long long int a,b;
    long long int area;
    while(cin>>a>>b)
    {
        for(int i=0;;i++)
        {
            area=(a+(a+i))*(i+1)/2;
            if(area>=b)
            {
                cout<<a+i<<endl;
                break;
            }
        }
        

    }

}