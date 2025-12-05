#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
  FILE *file_ptr = fopen(argv[1], "r");

  if (file_ptr == NULL) {
    fprintf(stderr, "Can't open input file\n");

    return 1;
  }

  int sum = 0;
  char bank[1000];

  while (fgets(bank, sizeof(bank), file_ptr)) {
    char *ptr = bank;
    int max_l = -1;
    int idx_l = 0;
    int max_r = -1;

    while (*(ptr + 1) != '\0' && *(ptr + 1) != '\n') {
      int n = *ptr - '0';

      if (n > max_l) {
        max_l = n;
        idx_l = ptr - bank;
      }
      ptr++;
    }

    ptr = bank;

    while (*ptr != '\0' && *ptr != '\n') {
      int n = *ptr - '0';

      if (n > max_r && idx_l < (ptr - bank)) {
        max_r = n;
      }

      ptr++;
    }

    sum += (max_l * 10) + max_r;
  }

  printf("SOLUTION: %d\n", sum);

  return 0;
}
