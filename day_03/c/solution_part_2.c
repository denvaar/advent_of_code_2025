#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
  FILE *file_ptr = fopen(argv[1], "r");

  int target_digit_count = 12;

  if (file_ptr == NULL) {
    fprintf(stderr, "Can't open input file\n");
    return 1;
  }

  char bank[1000];

  unsigned long long sum = 0;

  while (fgets(bank, sizeof(bank), file_ptr)) {
    int digit_count = strlen(bank) - 1;
    char *ptr = bank;

    int digits_idx = 0;

    char digits[1000];

    int result_digits_remaining = target_digit_count;

    while (*ptr != '\0' && *ptr != '\n' && digits_idx < target_digit_count) {
      int target_digits_remaining = digit_count + (bank - ptr);

      int max_digit = *ptr - '0';
      int jump_offset = 0;

      for (int i = 0; i <= target_digits_remaining - result_digits_remaining;
           i++) {
        int digit = *(ptr + i) - '0';

        if (digit > max_digit) {
          max_digit = digit;
          jump_offset = i;
        }
      }

      digits[digits_idx++] = max_digit + '0';
      ptr += jump_offset + 1;
      result_digits_remaining--;
    }

    digits[digits_idx] = '\0';

    unsigned long long result;
    sscanf(digits, "%llu", &result);
    sum += result;
  }

  printf("%llu\n", sum);

  fclose(file_ptr);

  return 0;
}
