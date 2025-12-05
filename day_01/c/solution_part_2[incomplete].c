#include <math.h>
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
    if (direction == 'L') {
      if (position - n_ticks < 0) {
        if (position != 0) password += abs(n_ticks / 100) + 1;
        position = 100 + ((position - n_ticks) % 100);
      } else {
        position -= n_ticks;
        password += position == 0;
      }
    }

    if (direction == 'R') {
      if (position + n_ticks > 99) {
        if (position != 99) password += abs(n_ticks / 100) + 1;
        position = (position + n_ticks) % 100;
      } else {
        position += n_ticks;
        password += position == 0;
      }
    }

    printf("password: %d | position: %d (after %c%d)\n", password, position,
           direction, n_ticks);
  }

  printf("SOLUTION: %d", password);

  return 0;
}
