#include "HsFFI.h"
#include "SDL.h"
#include <time.h>

extern void haskell_main(void);
extern void __stginit_IOSMain (void);

int main(int argc, char *argv[])
{
  hs_init(&argc, &argv);
  hs_add_root(__stginit_IOSMain);
  haskell_main();
  hs_exit();
  return 0;
}