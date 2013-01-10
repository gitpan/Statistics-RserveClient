use Statistics::RserveClient::Connection;

use Test::More tests => 12;

my $cnx = new_ok( 'Statistics::RserveClient::Connection' => ['localhost'] );

@expected_true_scalar = (1);
@true_scalar          = $cnx->evalString('TRUE');
is( @true_scalar, @expected_true_scalar, 'scalar TRUE value' )
    or diag explain @true_scalar;

@expected_false_scalar = (0);
@false_scalar          = $cnx->evalString('FALSE');
is( @false_scalar, @expected_false_scalar, 'scalar FALSE value' )
    or diag explain @false_scalar;

@expected_bool_vector = ( 1, 0 );
@bool_vector = $cnx->evalString('c(TRUE, FALSE)');
is( @bool_vector, @expected_bool_vector, 'boolean array' )
    or diag explain @bool_vector;

@expected_char_scalar = 'z';
@char_scalar          = $cnx->evalString('letters[26]');
is( $char_scalar, $expected_char_scalar, 'single-char string scalar' )
    or diag explain $char_scalar;

@expected_char_vector = ( 'a', 'b', 'c', 'd' );
@char_vector = $cnx->evalString('letters[1:4]');
is( @char_vector, @expected_char_vector, 'vector of single-char strings' )
    or diag explain @char_vector;

@expected_string_scalar = 'Dec';
@string_scalar          = $cnx->evalString('month.abb[12]');
is( $string_scalar, $expected_string_scalar, 'string scalar' )
    or diag explain $string_scalar;

@expected_string_vector = ( 'Jan', 'Feb', 'Mar' );
@string_vector = $cnx->evalString('month.abb[1:3]');
is( @string_vector, @expected_string_vector, 'vector of strings' )
    or diag explain @string_vector;

@expected_int_scalar = 123;
@int_scalar          = $cnx->evalString('123L');
is( @int_scalar, @expected_int_scalar, 'single-int scalar' )
    or diag explain $int_scalar;

@expected_int_vector = ( 101 .. 110 );
@int_vector          = $cnx->evalString('101:110');
is( @int_vector, @expected_int_vector, 'vector of ints' )
    or diag explain @int_vector;

@expected_double_scalar = 1.5;
@double_scalar          = $cnx->evalString('1.5');
is( @double_scalar, @expected_double_scalar, 'double scalar' )
    or diag explain $double_scalar;

@expected_double_vector = ( 0.5, 1, 1.5, 2 );
@double_vector = $cnx->evalString('(1:4)/2');
is( @double_vector, @expected_double_vector, 'vector of doubles' )
    or diag explain @double_vector;

done_testing($number_of_tests);
