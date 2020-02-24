#include <fenv.h>
#include <xmmintrin.h>
#include <stdio.h>

#ifdef _WIN32
#define __mxcsr _Fe_ctl
#endif
int main() {
  fenv_t f;
  fegetenv(&f);
  unsigned int orig_mxcsr = _mm_getcsr();
  printf("original value from _mm_getcsr %x\n", orig_mxcsr);
  printf("original value from fgetenv %lx\n", f.__mxcsr);
  //f.__mxcsr |= 0x8040;
  _mm_setcsr(orig_mxcsr | 0x8040);
  //_controlfp(_DN_FLUSH, _MCW_DN);
  //int ret = fesetenv(&f);
  unsigned int new_mxcsr = _mm_getcsr();
  printf("new value from _mm_getcsr %x\n", new_mxcsr);
  fegetenv(&f);
  printf("new value from fgetnev %x\n", f.__mxcsr);
}
