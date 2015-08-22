#ifndef _PCA9548A_H_
#define _PCA9548A_H_

#include "../device/device.h"

#define I2C_SWITCH_ADR			(0xE0)

#define I2C_RESET_PIN			(0x01)

u32 i2c_switch_set(u8 i2c_switch_adr,
				   u8 sensor_adress_on_switch);
void i2c_switch_reset();
u8 i2c_switch_read_status();
void i2c_switch_init();

#endif