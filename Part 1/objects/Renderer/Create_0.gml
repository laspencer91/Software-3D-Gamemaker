/// @description Initialize

rotAngle = 0; // Just used to rotate the cube

zFarthest = 1000;		// How far camera should see
zNearest  = 0.1;		// The nearest to the camera that should be rendered

aspectRatio		= window_get_height() / window_get_width();
fieldOfView		= 90;
fovRadianScalar = 1 / dtan(fieldOfView / 2);			// Note: ("dtan" takes degrees where as just "tan" takes radians)
zNormalized		= zFarthest / (zFarthest - zNearest);	// Video for explanation

#region Specify the points for a box
	point1 = Vector3(0, 0, 0);
	point2 = Vector3(0, 1, 0);
	point3 = Vector3(1, 1, 0);
	point4 = Vector3(1, 0, 0);

	point5 = Vector3(0, 0, 1);
	point6 = Vector3(0, 1, 1);
	point7 = Vector3(1, 1, 1);
	point8 = Vector3(1, 0, 1);
#endregion

#region Build Triangles From Points

	// NOTE: Here we are storing a structure with 3 values in each of the values of the vector3
	// Looks like this, notice that Each Value in this Vector3 is actually another Vector3..
	// tri[0] = [ [X, Y, Z], [X, Y, Z], [X, Y, Z] ]
	
	// Front Face (Build triangles using a clockwise direction)
	tri[0] = Vector3(point1, point2, point3);
	tri[1] = Vector3(point1, point3, point4);

	// Right Face
	tri[2] = Vector3(point4, point3, point7);
	tri[3] = Vector3(point4, point7, point8);

	// Back Face
	tri[4] = Vector3(point8, point7, point6);
	tri[5] = Vector3(point8, point6, point5);

	// Left Face
	tri[6] = Vector3(point5, point6, point2);
	tri[7] = Vector3(point5, point2, point1);

	// Bottom Face
	tri[8] = Vector3(point1, point5, point8);
	tri[9] = Vector3(point1, point8, point4);

	// Top Face
	tri[10] = Vector3(point2, point6, point7);
	tri[11] = Vector3(point2, point7, point3);

#endregion

// Will hold projected data
projectedTri[11, 2] = 0;

#region Matrix Definitions
// Matrix multiplication is very fast for a computer, and by using
// these types of structures it is very fast to apply 3d translations and
// rotations on Vectors. They are difficult to understand at first but very
// important for 3D graphics!

// Projection matrix
projMatrix = Matrix(4);
projMatrix[0, 0] = aspectRatio * fovRadianScalar;
projMatrix[1, 1] = fovRadianScalar;
projMatrix[2, 2] = zFarthest / (zFarthest - zNearest);
projMatrix[3, 2] = (-zFarthest * zNearest) / (zFarthest - zNearest);
projMatrix[2, 3] = 1;
projMatrix[3, 3] = 0;

// NOTE::
//		These matrices need to be recalculated to be useful. Using an angle inside of the trig functions
//      See the step event to see how they are built!

// X Rotation Matrix (Google it!)
matRotX = Matrix(4);

// Z Rotation Matrix (Google it!)
matRotZ = Matrix(4);

#endregion