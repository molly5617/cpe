#include<iostream>
#include <cstring>

using namespace std;
class charater
{
    public:
        int num=0;
        char c;
};
int main(){
    int n;
    cin>>n;
    int sum=0;
    char ans[1000];
    while(n--){
        string s;
        cin>>s;
        int length=s.length();
        charater cha[2002];
        int difference=0;
        cha[0].num++;
        cha[0].c=s[0];
        sum=0;
        
        for(int i=1;i<length;i++)
        {
            int prime=0;
            if(s[i]!=cha[difference].c)
            {
                if(cha[difference].num>=2)
                {
                    for(int z=cha[difference].num/2;z>1;z--)
                    {
                        if(cha[difference].num%z==0)
                        prime=1;

                    }
                    if(prime==0)
                    {
                        sum++;
                        ans[sum]=cha[difference].c;

                        
                    }                    
                }
                difference++;
                cha[difference].num=1;
                cha[difference].c=s[i];
            }
            else
            {
                cha[difference].num++;
            }
        }

    }
    for(int k=1;k<=sum;k++)
    {
        cout<<ans[k];
    }

}