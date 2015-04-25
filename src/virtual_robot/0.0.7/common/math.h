#ifndef _MATH__H_
#define _MATH__H_

#include "int_def.h"
#include <math.h>

#define PI 3.141592654

struct sVect3D
{
	float x, y, z;
}; 

struct sPoint3D 
{
	float x, y, z;
	float r, g, b;
};

struct sVector
{
    float *points;
    u32 size;
};

float saturate(float value, float min, float max);


void vect_init(struct sVector *vector, u32 size);
void vect_uninit(struct sVector *vector);
float vect_size(struct sVector *vector);
void vect_add(struct sVector *vector_res, struct sVector *vector_a, struct sVector *vector_b);
void vect_copy(struct sVector *vector_dest, struct sVector *vector_src);

float vect_size_2d(float a, float b);

float rand_();
float rnd_();

float tan_(float x, float y);
float atan_(float x, float y);

float min(float a, float b);
float max(float a, float b);

float min_array(float *values, u32 size);
float max_array(float *values, u32 size);
float abs_(float a);
float sgn(float a);

float angle_modulo(float angle);
void rotate_point(float *x_res, float *y_res, float x, float y, float angle);

float point_from_line_distance(float px, float py, float x0, float y0, float x1, float y1);
void line_intersection(	float *xr, float *yr,
						float x1, float y1, float x2, float y2,
						float x3, float y3, float x4, float y4 ); 

u32 ray_in_sphere(float xd, float x0, float yd, float y0, float xc, float yc, float r);

float fast_tanh(float x);

float line_circle_intersection(float x1, float y1, float x2, float y2, float xc, float yc, float r);
#endif