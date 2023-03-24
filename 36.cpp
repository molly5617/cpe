#include<iostream>
using namespace std;
int main(){
    int n;
    cin>>n;
    int m,n,q;
    while(n--)
    {
        cin>>m>>n>>q;
        cout<<m<<" "<<n<<" "<<q<<endl;
        char map[101][101];
        for(int i=0;i<m;i++)
        {
            cin>>map[i];            
        }
        while(q--)
        {
            int r,c;
            cin>>r>>c;
            int ans=1;
            int a,b;
            for(int i=1;i<=m||i<=n;i++)
            {
                int flag=0;
                for( a=r-i;a<=r+i;a++)
                {
                    for( b=c-i;b<=c+i;b++)
                    {
                        if(a<0||b<0||a>=m||b>=n)
                        {
                            flag=1;
                            break;
                        }
                        if(map[a][b]!=map[r][c])
                        {
                            flag=1;
                            break;
                        }
                    }
                }
                if(!flag)
                {
                    ans+=2;
                }
                else 
                {
                    break;
                }
            }
            cout<<ans<<endl;
            

        }

    }
}