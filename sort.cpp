#include<iostream>
#include<algorithm>
using namespace std;
int n,m;
bool cmp(int x,int y)
{
    int xodd=abs(x%2),yodd=abs(y%2);
    if(x%m!=y%m) return x%m<y%m;
    else if(x)
}