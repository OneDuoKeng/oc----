#include "stdio.h"

int main(){

    __block int a = 11;
    void(^block)(void) = ^{
        a++;
        printf("LG_Cooci - %d",a);
    };
    
    // block();
    return 0;
}
