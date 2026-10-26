## SSE3 intrinsics
import sse
import sse2


{.push header: "pmmintrin.h".}

# operating : alternatively subtract and add packed double-precision floats (a0-b0, a1+b1)
# lane unit : float64 / lane numbers : 2
func mm_addsub_pd*(a, b: M128d): M128d {.importc: "_mm_addsub_pd".}

# operating : alternatively subtract and add packed single-precision floats (a0-b0, a1+b1, a2-b2, a3+b3)
# lane unit : float32 / lane numbers : 4
func mm_addsub_ps*(a, b: M128): M128 {.importc: "_mm_addsub_ps".}

# operating : horizontally add adjacent pairs of double-precision floats from 'a' and 'b' (a0+a1, b0+b1)
# lane unit : float64 / lane numbers : 2
func mm_hadd_pd*(a, b: M128d): M128d {.importc: "_mm_hadd_pd".}

# operating : horizontally add adjacent pairs of single-precision floats from 'a' and 'b'
# lane unit : float32 / lane numbers : 4
func mm_hadd_ps *(a, b: M128): M128 {.importc: "_mm_hadd_ps".}

# operating : horizontally subtract adjacent pairs of double-precision floats from 'a' and 'b' (a0-a1, b0-b1)
# lane unit : float64 / lane numbers : 2
func mm_hsub_pd*(a, b: M128d): M128d {.importc: "_mm_hsub_pd".}

# operating : horizontally subtract adjacent pairs of single-precision floats from 'a' and 'b'
# lane unit : float32 / lane numbers : 4
func mm_hsub_ps*(a, b: M128): M128 {.importc: "_mm_hsub_ps".}

# operating : load 128-bits of integer data from unaligned memory (optimized for cross-cache-line loads)
# lane unit : N/A / lane numbers : N/A
func mm_lddqu_si128*(p: pointer): M128i {.importc: "_mm_lddqu_si128".}

# operating : load a double-precision float and duplicate it into both lanes
# lane unit : float64 / lane numbers : 2
func mm_loaddup_pd*(p: pointer): M128d {.importc: "_mm_loaddup_pd".}

# operating : duplicate the lower double-precision float of 'a' into both lanes
# lane unit : float64 / lane numbers : 2
func mm_movedup_pd*(a: M128d): M128d {.importc: "_mm_movedup_pd".}

# operating : duplicate odd-indexed single-precision floats (a1, a1, a3, a3)
# lane unit : float32 / lane numbers : 4
func mm_movehdup_ps*(a: M128): M128 {.importc: "_mm_movehdup_ps".}

# operating : duplicate even-indexed single-precision floats (a0, a0, a2, a2)
# lane unit : float32 / lane numbers : 4
func mm_moveldup_ps*(a: M128): M128 {.importc: "_mm_moveldup_ps".}

{.pop.}
