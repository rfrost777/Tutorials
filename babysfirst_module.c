/*###########################################################
#   Baby's first dynamic loadable kernel module!
#   Usage: (sudo) insmod ./babysfirst_module.ko
###########################################################*/
#include <linux/init.h>
#include <linux/module.h>

// This kernel macro is needed somehow? I should check!
MODULE_LICENSE("Dual BSD/GPL");

// Init function (called by insmod)
static int baby_init(void)
{
    // We are no longer in user space, so no glibc for us. Print message to syslog:
    printk(KERN_ALERT "My first module just got loaded into kernel space. Yay!\n");
    // Signal that we are correctly initialized:
    return 0;
}

// Exit function (called by rmmod)
static void baby_exit(void)
{
    // Again, all we do is print a syslog message.
    printk(KERN_ALERT "My first module got unloaded. Doh!\n");
}

// Use kernel macros to declare init and exit functions:
module_init(baby_init);
module_exit(baby_exit);