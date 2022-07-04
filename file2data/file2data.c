#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <sys/stat.h>

int main (int argc, char**argv)
{
  unsigned char ch;
  unsigned int start, i, lines;
  FILE *fd;
  struct stat st;

  fputs("File2data v1.0 - Convert a binary file to CBM BASIC DATA statements\n", stderr);
  fputs("(C)2022 Luigi Di Fraia\n", stderr);

  if (argc != 3 || sscanf (argv[1], "%u", &start) != 1 || start > 65535) {
    fprintf(stderr, "Usage error - %s <start line no> <filename>\n", argv[0]);
    exit(EXIT_FAILURE);
  }

  fd = fopen(argv[2], "rb");
  if (fd == NULL) {
    fprintf(stderr, "Could not open %s\n", argv[2]);
    exit(EXIT_FAILURE);
  }

  // Calculate the amount of lines worth of data
  fstat(fileno(fd), &st);
  lines = ceil(st.st_size / 8.0);

  if (lines == 0) {
    fputs("No data to write\n", stderr);
    exit(EXIT_FAILURE);
  }

  // Check if the last line number (including the subroutine) fits in a 16-bit value
  if ((lines / 8 + 1) * 10 > 65535) {
    fputs("Too much data to write\n", stderr);
    exit(EXIT_FAILURE);
  }

  // Tiny subroutine to track the amount of lines of data
  fprintf(stdout, "%5d lines=%u:return\n", start, lines);

  i = 0;

  // Write out the data instructions
  while (1) {
    if (!fread(&ch, sizeof(char), 1, fd)) {
      // Pad the last line if required
      if (i % 8)
        ch = 0;
      else
        break;
    }

    if (!(i % 8))
      fprintf(stdout, "%5u data ", start + (i / 8 + 1) * 10);

    fprintf(stdout, "%3u", ch);

    if (!((i + 1) % 8))
      fputs("\n", stdout);
    else
      fputs(",", stdout);

    i++;
  }

  fclose(fd);

  fputs("Completed\n\n", stderr);

  return 0;
}
