/// @desc Multiply a Vector3 (double values) with a Matrix
/// @param Vector Vector
/// @param Matrix Matrix

#macro X 0
#macro Y 1
#macro Z 2

var vec = argument0;
var mat = argument1;

var result = Vector3(0, 0, 0);

result[X] = vec[X] * mat[0, 0] + vec[Y] * mat[1, 0] + vec[Z] * mat[2, 0] + mat[3, 0];
result[Y] = vec[X] * mat[0, 1] + vec[Y] * mat[1, 1] + vec[Z] * mat[2, 1] + mat[3, 1];
result[Z] = vec[X] * mat[0, 2] + vec[Y] * mat[1, 2] + vec[Z] * mat[2, 2] + mat[3, 2];

var w = vec[X] * mat[0, 3] + vec[Y] * mat[1, 3] + vec[Z] * mat[2, 3] + mat[3, 3];

if (w != 0)
{
	result[X] /= w;
	result[Y] /= w;
	result[Z] /= w;
}

return result;