#include<iostream>
#include<iomanip>
using namespace std;
int main(){
    double x[4],y[4],xa,ya;
    while(cin>>x[0]>>y[0]>>x[1]>>y[1]>>x[2]>>y[2]>>x[3]>>y[3])
    {
        if(x[0]==x[2]&&y[0]==y[2])
        {
            xa=x[3]+x[1]-x[2];
            ya=y[3]+y[1]-y[2];
        }
        else if(x[1]==x[2]&&y[1]==y[2])
        {
            xa=x[3]+x[0]-x[2];
            ya=y[3]+y[0]-y[2];
        }
        else if (x[0]==x[3]&&y[0]==y[3])
        {
            xa=x[2]+x[1]-x[3];
            ya=y[2]+y[1]-y[3];
        }
        else{
            xa=x[2]+x[0]-x[3];
            ya=y[2]+y[0]-y[3];
        }
        printf("%.3f %.3f\n",xa,ya);
    }
}