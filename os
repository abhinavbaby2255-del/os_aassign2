#include <stdio.h>

int main() {
    int n, i, time = 0, completed = 0, highest, index;
    char pid[20][10];
    int at[20], bt[20], pr[20];
    int rt[20], ct[20], wt[20], tat[20];
    float avgwt = 0, avgtat = 0;

    scanf("%d", &n);

    for (i = 0; i < n; i++) {
        scanf("%s %d %d %d", pid[i], &at[i], &bt[i], &pr[i]);
        rt[i] = bt[i];
    }

    while (completed < n) {
        highest = -1;
        index = -1;

        
        for (i = 0; i < n; i++) {
            if (at[i] <= time && rt[i] > 0) {
                if (pr[i] > highest) {
                    highest = pr[i];
                    index = i;
                }
            }
        }

        if (index != -1) {
            rt[index]--;
            time++;

            if (rt[index] == 0) {
                completed++;
                ct[index]  = time;
                tat[index] = ct[index] - at[index];
                wt[index]  = tat[index] - bt[index];
                avgwt  += wt[index];
                avgtat += tat[index];
            }
        } else {
            int next = -1;
            for (i = 0; i < n; i++) {
                if (rt[i] > 0 && at[i] > time) {
                    if (next == -1 || at[i] < next)
                        next = at[i];
                }
            }
            if (next != -1)
                time = next;
            else
                time++;
        }
    }

    printf("Waiting Time:\n");
    for (i = 0; i < n; i++)
        printf("%s %d\n", pid[i], wt[i]);

    printf("Turnaround Time:\n");
    for (i = 0; i < n; i++)
        printf("%s %d\n", pid[i], tat[i]);

    printf("Average Waiting Time: %.2f\n",     avgwt  / n);
    printf("Average Turnaround Time: %.2f\n",  avgtat / n);

    return 0;
}
