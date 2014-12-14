#include "HsFFI.h"
#include "SDL.h"
#include <time.h>

#define SCREEN_WIDTH 320
#define SCREEN_HEIGHT 400

extern void haskell_main(void);
extern void __stginit_Main (void);

int main(int argc, char *argv[])
{
  hs_init(&argc, &argv);
  hs_add_root(__stginit_Main);
  haskell_main();
  hs_exit();
  return 0;
}