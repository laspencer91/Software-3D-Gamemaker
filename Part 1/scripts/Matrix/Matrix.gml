/// @desc Build a matrix of any even size X and Y
/// @param MatrixSize The size of the matrix to build

var _matrixSize = argument0;
var new2d;

for (var _x = 0; _x < _matrixSize; _x++)
{
	for (var _y = 0; _y < _matrixSize; _y++)
	{
		new2d[_x, _y] = 0;	
	}
}

return new2d;