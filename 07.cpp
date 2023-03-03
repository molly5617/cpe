#include<iostream>
#include<map>
using namespace std;
int main(){
    map<string,int>count;
    map<string,int>::iterator iter;
    string s;
    char d[76]={0};
    int n;
    cin>>n;
    cin.ignore();
    while(n--){
        cin>>s;
        count[s]++;
        cin.getline(d,76);
    }
    for(iter=count.begin(); iter!=count.end();iter++)
    {
        cout<<iter->first<<" "<<iter->second<<endl;
    }
    return 0;

}