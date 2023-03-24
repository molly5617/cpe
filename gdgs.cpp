#include <iostream>
#include <map>
using namespace std;
int a[55][55];
int dx[] = {0, 1, 0, -1}; //N, E, S, W
int dy[] = {1, 0, -1, 0};
 
int main() {
    int row, col, R, C, D, nR, nC;
    char d;
    bool lost = false;
    string s;
    map <char, int> mp1;
    map <int, char> mp2;
    mp1['N'] = 0; mp2[0] = 'N';
    mp1['E'] = 1; mp2[1] = 'E';
    mp1['S'] = 2; mp2[2] = 'S';
    mp1['W'] = 3; mp2[3] = 'W';
    cin >> row >> col;
    while (cin >> R >> C >> d >> s){
        D = mp1[d];
        lost = false;
        for (int i = 0; i < s.size(); i++){
            if (s[i] == 'F'){
                nR = R + dx[D];
                nC = C + dy[D];
                if (nR >= 0 && nR <= row && nC >= 0 && nC <= col){
                    R = nR;
                    C = nC;
                } else {
                    if (a[R][C] == 1){
                        //這個機器人正位在有標記的地方, 會忽略會讓他掉下去的指令。
                        continue;
                    } else {
                        cout << R << " " << C << " " << mp2[D] << " LOST\n";
                        lost = true;
                        a[R][C] = 1;
                        break;
                    }
                }
            } else if (s[i] == 'R'){
                D = (D + 1) % 4;
            } else {
                D = (D - 1 + 4) % 4;
            }
        }
        if (!lost) cout << R << " " << C << " " << mp2[D] << "\n";
    }
    return 0;
}