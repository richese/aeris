/*special library for multiple mag3110 placed on i2c switch device*/

#ifndef _MAG3110_H_
#define _MAG3110_H_

#include "../device/device.h"
#include "mag.h"

#define MAG3110_BOT_COUNT (2)

#define	MAG3110_ADDR	(0x0E<<1) 	/*device address*/

/*register name				address		default value*/
#define MAG3110_DR_STATUS	0x00		/*0x00*/
#define MAG3110_X_MSB		0x01		/*data*/
#define MAG3110_X_LSB		0x02		/*data*/
#define MAG3110_Y_MSB		0x03		/*data*/
#define MAG3110_Y_LSB		0x04		/*data*/
#define MAG3110_Z_MSB		0x05		/*data*/
#define MAG3110_Z_LSB		0x06		/*data*/
#define MAG3110_WHO_AM_I	0x07		/*0xC4*/
#define MAG3110_SYSMOD		0x08		/*data*/

#define MAG3110_OFF_X_MSB	0x09		/*0x00*/
#define MAG3110_OFF_X_LSB	0x0A		/*0x00*/
#define MAG3110_OFF_Y_MSB	0x0B		/*0x00*/
#define MAG3110_OFF_Y_LSB	0x0C		/*0x00*/
#define MAG3110_OFF_Z_MSB	0x0D		/*0x00*/
#define MAG3110_OFF_Z_LSB	0x0E		/*0x00*/

#define MAG3110_DIE_TEMP	0x0F		/*data*/
#define MAG3110_CTRL_REG1	0x10		/*0x00*/
#define MAG3110_CTRL_REG2	0x11		/*0x00*/

void mag3110_init(struct sMag *sensor_struct);
void mag3110_read(struct sMag *sensor_struct);

struct sMag g_mag_3110_bot[MAG3110_BOT_COUNT];

#endif