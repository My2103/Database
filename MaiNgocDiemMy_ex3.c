//
//  main.c
//  MaiNgocDiemMy_ex3
//
//  Created by Mai Ngoc Diem My on 07/09/2023.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    int n, a, b, c, reverse;

    printf("Input your number here :");
    scanf("%d", &n);
    
    a = n/100;
    b = n/10%10;
    c = n%10;
    
    reverse = c*100 + b*10 + a;
    
    printf("The reverse number : %d\n", reverse);
    return 0;
}
