/*#####################################################
#  Baby's first Windows 64bit WDM driver.
#  As basic as it gets.
#  For testing you _might_ want to disable driver signing
#  enforcement in Windows ;)
#####################################################*/

// Declare target architecture: AMD64
#define _AMD64_
// Add some usefull tools for driver development
#include <wdm.h>

// This routine is called first, so let's initialize our driver:
NTSTATUS
  DriverEntry(
    void* DriverObject,      // pointer to a DRIVER_OJECT struct
    void* RegistryPath       // pointer to a counted ucode string
  )
  {
    // Just print a debug message:
    DbgPrint("We just got loaded. Yeah!");
    // Since we don't really do anything, let's assume nothing went wrong:
    return STATUS_SUCCESS;
  }