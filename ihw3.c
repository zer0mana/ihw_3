#include <stdio.h>
#include <math.h>

double solve(double x) {
    double a = 0;
    double b;
    double iter = 0.00005;
    double n = 1;
    do {
        b = a;
        a = a + pow(-1, n + 1) * pow(-x, n) / n;
        n++;
    } while (fabs(a - b) > iter);
    return a;
}

int main() {
    double x;
    scanf("%lf", &x);
    printf("%lf", solve(x));
    return 0;
}
