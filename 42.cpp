#include<iostream>
#include<string>
#include<algorithm>
#include<stdio.h>
#include<limits.h>
#include<string.h>
#include<stdlib.h>
using namespace std;
class asc{
   public:
    int ascii;
    int num;
};
int main(){
    
    bool st=false;
    char s[9999];
    while(cin.getline(s,9999))
    {
    	if(st)
    	{
    	cout<<endl;
    	}
        asc a[129];
        for(int i=0;i<129;i++)
        {
            a[i].num=0;
        }
        for(int i=0;i<strlen(s);i++)
        {
            a[s[i]].ascii=s[i];
            a[s[i]].num++;
        }
        
        for(int i = 129-1; i > 0; i--)
        {
            for(int j = 0; j <= i-1; j++)
            {
                if( a[j].num > a[j+1].num)
                {
                    asc tmp = a [j];
                    a[j] = a[j+1];
                    a[j+1] = tmp;
                }
                if( a[j].num == a[j+1].num)
                {
                    if(a[j].ascii < a[j+1].ascii)
                    {
                        asc tmp = a [j];
                        a[j] = a[j+1];
                        a[j+1] = tmp;
                    }
                    
                }
            }
        }
        for(int i = 129-1; i > 0; i--)
        {
            for(int j = 0; j <= i-1; j++)
            {
                
                if( a[j].num == a[j+1].num)
                {
                    if(a[j].ascii < a[j+1].ascii)
                    {
                        asc tmp = a [j];
                        a[j] = a[j+1];
                        a[j+1] = tmp;
                    }
                    
                }
            }
        }
        for(int i=0;i<129;i++)
        {
        	
            if(a[i].num!=0)
            {
                cout<<a[i].ascii<<" "<<a[i].num<<endl;
            }
        }
       
	st=true;

    }
}