/**
 *
 * @filename Ctest.c
 * @date mer. 30 déc. 2020 12:43:23 CET
 * @author quatadah
 * @brief ...
 *
 */
#include <stdlib.h>
#include <stdio.h
#define _NB_MIN_PARAMS_ 
void print_usage( char *argv[] ) {
	fprintf( stderr, "Usage: %s ....\n", argv[0] );
	return;

int main( int argc, char *argv[] )
{
	if ( argc < _NB_MIN_PARAMS_ ) {
		print_usage( argv );
		return EXIT_FAILURE;
	
	return EXIT_SUCCESS;
}
