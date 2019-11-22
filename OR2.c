#include <stdio.h>
#include <math.h>

#define MAX(x, y) ((x) > (y) ? (x) : (y))
#define ABS(x) ((x) < 0.0 ? -(x) : (x))


int main();
double nableLagrangian_x(double x, double lambda, double a, double b, double c);
double nableLagrangian_lambda(double x, double lambda, double a, double b, double c);
double func(double x, double a, double b, double c);

int main()
{
    int k, maxlop, id, prmod;
    double dx, dlambda, x, lambda, alpha, eps, a, b, c;
    FILE *fpw;
    
    fpw = fopen("OR.txt", "w");
    
    maxlop = 1000;    
    alpha = 0.1;

    eps = 1.0e-3;
   // maxid = 99;
    prmod = 50;
    
    id = 90;
    
    fprintf(stdout, "______ id= %d______\n", id);
    a = (double)21;
    b = (double)2;
    c = (double)2;
    
    x = 0.0;
    lambda = 1.0;

    for (k = 0; k < maxlop; k++)
    {
        dx = -nableLagrangian_x(x, lambda, a, b, c);
        dlambda = -nableLagrangian_lambda(x, lambda, a, b, c);

        x = x + alpha * dx;

        lambda = MAX(lambda - alpha * dlambda, 0.0);

        if (k % prmod == 0)
        {
            fprintf(stdout, "k=%d, dx_k%9.2le,", k, dx);
            fprintf(stdout, "dlambda_k k=%f, dx_k%9.2le, lambda_{k+1}=%9.2le,", dlambda, lambda);
            fprintf(stdout, "x_{k+1}=%9.2le, func(x_{k+1}=%9.2le\n)", x, func(x, a, b, c));
        }
        if ((ABS(dx) < eps) && (ABS(dlambda) < eps))
            break;
    }
    fprintf(stdout, "k=%d,dx_k=%9.2le,dlambda_k=%9.2le,lambda_{k+1}=%9.2le,", k, dx, dlambda, lambda);
    fprintf(stdout, "x_{k+1}=%9.2le, func(x_{k+1}=%9.2le\n)", x, func(x, a, b, c));
    fprintf(fpw, "id=%d,x=%9.3le,F(x)=%9.3le,k=%d\n", id, x, func(x, a, b, c), k);
    fclose(fpw);
}

double nableLagrangian_x(double x, double lambda, double a, double b, double c)
{
    return (2.0 * (x - a) + 3 * x * x * b + lambda * x);
}

double nableLagrangian_lambda(double x, double lambda, double a, double b, double c)
{
    return ((x - c));
}

double func(double x, double a, double b, double c)
{
    return ((x - a) * (x - a) + b * pow(x, 3));
}
