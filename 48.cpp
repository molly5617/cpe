#include<iostream>
#include<map>
using namespace std;
int a[55][55];
int dx[]={0,1,0,-1};//N,E,S,W
int dy[]={1,0,-1,0};
int main(){
    int row,col,r,c,D,nr,nc;
    char d;
    bool lost=false;
    string s;
    map<char,int>mp1;
    map<int ,char>mp2;
    mp1['N'] = 0; mp2[0] = 'N';
    mp1['E'] = 1; mp2[1] = 'E';
    mp1['S'] = 2; mp2[2] = 'S';
    mp1['W'] = 3; mp2[3] = 'W';
    cin>>row>>col;
    while(cin>>r>>c>>d>>s){
        D=mp1[d];
        lost=false;
        for(int i=0;i<s.size();i++)
        {
            if(s[i]=='F')
            {
                nr=r+dx[D];
                nc=c+dy[D];
                if(nr>=0&&nr<=row&&nc>=0&&nc<=col)
                {
                    r=nr;
                    c=nc;
                }
                else 
                {
                    if(a[r][c]==1){
                        continue;
                    }
                    else
                    {
                        cout<<r<<" "<<c<<" "<<mp2[D]<<" LOST\n";
                        lost=true;
                        a[r][c]=1;
                        break;
                    }
                }
            }
            else if(s[i]=='R')
            {
                D=(D+1)%4;
            }
            else{
                D=(D-1+4)%4;
            }
        }
        if(!lost)cout<<r<<" "<<c<<" "<<mp2[D]<<endl;

    }
    return 0;

}