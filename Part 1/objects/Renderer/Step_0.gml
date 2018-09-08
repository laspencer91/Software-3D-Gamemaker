/// @description Update Projection

rotAngle += 1;

for (var i = 0; i < array_length_1d(tri); i++)
{
	var _triangle = tri[i];
	
	// Remember.. 3 Points make up a triangle. And 1 Point is a Vector3 (Array of 3 values x, y, z)
	// We are pulling out the Vector3's from the triangle arrays here.
	var v1 = _triangle[0];	// This contains 3 values.. This is a single Point with (x, y, z)
	var v2 = _triangle[1];  // This contains 3 values.. This is a single Point with (x, y, z)
	var v3 = _triangle[2];  // This contains 3 values.. This is a single Point with (x, y, z)
	
	#region Build Rotation Matrices
		matRotZ[0, 0] =  dcos(rotAngle / 2);
		matRotZ[0, 1] =  dsin(rotAngle / 2);
		matRotZ[1, 0] =  -dsin(rotAngle / 2);
		matRotZ[1, 1] =  dcos(rotAngle / 2);
		matRotZ[2, 2] = 1;
		matRotZ[3, 3] = 1;
		
		matRotX[0, 0] = 1;
		matRotX[1, 1] =  dcos(rotAngle);
		matRotX[1, 2] =  dsin(rotAngle);
		matRotX[2, 1] = -dsin(rotAngle);
		matRotX[2, 2] =  dcos(rotAngle);
		matRotX[3, 3] = 1;	
	#endregion
	
	#region Apply Rotation Matrices to the Vector3's
		v1 = VectorMatrixMultiply(v1, matRotZ);
		v2 = VectorMatrixMultiply(v2, matRotZ);
		v3 = VectorMatrixMultiply(v3, matRotZ);
	
		v1 = VectorMatrixMultiply(v1, matRotX);
		v2 = VectorMatrixMultiply(v2, matRotX);
		v3 = VectorMatrixMultiply(v3, matRotX);
	#endregion
	
	v1[Z] += 3;	// This is the translated point. Translated by 3 in the Z axis to push the box away from the cam
	v2[Z] += 3; // This is the translated point. Translated by 3 in the Z axis to push the box away from the cam
	v3[Z] += 3; // This is the translated point. Translated by 3 in the Z axis to push the box away from the cam

	// These are the final values that will be drawn
	projectedTri[i, 0] = VectorMatrixMultiply(v1, projMatrix);	
	projectedTri[i, 1] = VectorMatrixMultiply(v2, projMatrix); 
	projectedTri[i, 2] = VectorMatrixMultiply(v3, projMatrix);
}