/// @description Render
draw_set_color(c_white);

for (var _i = 0; _i < 12; _i++)
{
	dTri_1 = projectedTri[_i, 0];
	dTri_2 = projectedTri[_i, 1];
	dTri_3 = projectedTri[_i, 2];

	dTri_1[X] += 1; dTri_1[Y] += 1;
	dTri_2[X] += 1; dTri_2[Y] += 1;
	dTri_3[X] += 1; dTri_3[Y] += 1;

	dTri_1[X] *= 0.5 * window_get_width();
	dTri_2[X] *= 0.5 * window_get_width();
	dTri_3[X] *= 0.5 * window_get_width();
	
	dTri_1[Y] *= 0.5 * window_get_height();
	dTri_2[Y] *= 0.5 * window_get_height();
	dTri_3[Y] *= 0.5 * window_get_height();

	draw_triangle(dTri_1[X] , dTri_1[Y] , 
			 	  dTri_2[X] , dTri_2[Y] ,
				  dTri_3[X] , dTri_3[Y] , true);
}