#include<iostream>
#include<math.h>
#include<string>
#include <stdio.h>
using namespace std;
#define PI 2*acos(0.0)
int main(){
    double s,a;
    char unit[4];
    double arc,chord;
    while(cin>>s>>a>>unit)
    {
        if(strcmp(unit,"min")==0)
        {
            a=a/60;
        }
        if(a>180)a=360-a;
        arc=2*PI*(s+6440)*a/360.0;
        chord=(s+6440)*sin(a*PI/2/180)*2;
        cout<<arc<<" "<<chord<<endl;
    }
}