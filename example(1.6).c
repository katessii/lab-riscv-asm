#include <stdio.h>

#define N 6
#define M 6

int process(int n, int m, int matrix[M][N])
{
    int sum = 0;
    for (int i = 0; i < m; ++i) {
        for (int j = 0; j < n; ++j) {
            if (i == j || i + j == 5)
                sum = sum + 0;
            else
                sum = sum + matrix[i][j];
        }
    }
    return sum;
}

int main()
{
    int matrix[M][N] = { 
    {1, 0, 0, 0, 0, 1}, 
    {0, 1, 0, 0, 1, 0},
    {0, 0, 1, 1, 0, 0},
    {0, 0, 1, 1, 0, 0},
    {0, 1, 0, 0, 1, 0},
    {1, 0, 0, 0, 0, 1} 
    };
   


   int res = process(N, M, matrix);
   printf("%d", res);
   return 0;
}
