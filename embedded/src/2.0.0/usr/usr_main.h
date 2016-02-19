#ifndef _USR_MAIN_H_
#define _USR_MAIN_H_


#include "../os/suzuha_os.h"

#include "sensors.h"
#include "test.h"


#define THREAD_STACK_SIZE	128

thread_stack_t main_thread_stack[THREAD_STACK_SIZE];


void main_thread();

#endif
