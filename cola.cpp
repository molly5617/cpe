#include<iostream>
using namespace std;
int main(){
    int drink=0;
    int bottle=0;
    int a;
    while(cin>>a){
    
    drink=a;
    bottle=a;
    while(bottle>=2)
    {
        if(bottle==2)
        {
            bottle++;
            drink+=1;
            bottle=1;

        }
        else
        {
            drink+=bottle/3;
            bottle=bottle/3+(bottle%3);
        }
        
    }
    cout<<drink<<endl;
    }

}