#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {

  FILE *file_ptr = fopen(argv[1], "r");

  if (file_ptr == NULL) {
    fprintf(stderr, "Can't open input file\n");

    return 1;
  }

  char direction;
  int n_ticks;
  int position = 50;
  int password = 0;

  while (fscanf(file_ptr, "%c%d\n", &direction, &n_ticks) == 2) {
    printf("%c %d\n", direction, n_ticks);

    if (direction == 'L') {
      position -= n_ticks;
    }

    if (direction == 'R') {
      position += n_ticks;
    }

    if (position % 100 == 0) password++;
  }

  printf("SOLUTION: %d", password);

  return 0;
}
