#include<iostream>
#include<cstdio>
using namespace std;

int main(){
  int T;
  int now_day, now_month, now_year;
  int birth_day, birth_month, birth_year;
  while( scanf( "%d", &T ) != EOF ){
    for( int i = 1 ; i <= T ; i++ ){
      scanf( "%d/%d/%d", &now_day, &now_month, &now_year );
      scanf( "%d/%d/%d", &birth_day, &birth_month, &birth_year );
      printf( "Case #%d: ", i );
      if( birth_year > now_year ) printf( "Invalid birth date\n" );
      else if( birth_year == now_year ){
        if( birth_month > now_month ) printf( "Invalid birth date\n" );
        else if( birth_month == now_month ){
          if( birth_day > now_day ) printf( "Invalid birth date\n" );
          else printf( "0\n" );
        }
        else printf( "0\n" );
      }
      else{
        if( birth_month > now_month )
          if( now_year-birth_year-1 > 130 ) printf( "Check birth date\n" );
          else printf( "%d\n", now_year-birth_year-1 );
        else if( birth_month == now_month ){
          if( birth_day > now_day )
            if( now_year-birth_year-1 > 130 ) printf( "Check birth date\n" );
            else printf( "%d\n", now_year-birth_year-1 );
          else 
            if( now_year-birth_year > 130 ) printf( "Check birth date\n" );
            else printf( "%d\n", now_year-birth_year );
        }
        else 
          if( now_year-birth_year > 130 ) printf( "Check birth date\n" );
          else printf( "%d\n", now_year-birth_year );
      }
    }
  }
  return 0;
}