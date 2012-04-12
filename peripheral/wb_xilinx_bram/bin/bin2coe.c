#include <stdio.h>

void write_coe_header(FILE *coe)
{
	fprintf(coe, "memory_initialization_radix = 16;\n");
	fprintf(coe, "memory_initialization_vector =\n");
}

void write_coe_footer(FILE *coe)
{
	fprintf(coe, "DEAD;\n");
}

void bin2coe(char *bin_filename, char *coe_filename)
{
	FILE *bin;
	FILE *coe;
	unsigned char buffer[2];
	int res;

	bin = fopen(bin_filename, "rb");
	coe = fopen(coe_filename, "w");
	
	write_coe_header(coe);		
	
	while(1) {
		res = fread(&buffer, 1, 2, bin);
		if(res == 2)
			fprintf(coe, "%02x%02x,\n", buffer[0], buffer[1]);
		else
			break;
	}
	
	write_coe_footer(coe);	

	fclose(bin);
	fclose(coe);
}

int main(int argc, char **argv)
{
	if(argc != 3) {
		printf("usage\n");
		printf("%s binary coe\n" argv[0]);
	}

	bin2coe(argv[1], argv[2]);
	return 0;
}
