import sse
import sse2
import avx
import avx2
import avx512f

## [Macro Original]
## #define _AVXVNNIINTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_AVXVNNIVL__

# --- VNNI (Vector Neural Network Instructions) ---

# operating : multiply unsigned 8-bit integers from a with signed 8-bit integers from b, add intermediate results to signed 32-bit integers in c
# lane unit : (u8 * s8) + i32 / total : 256-bit (8 lanes of 32-bit results)
func mm256_dpbusd_avx_epi32*(a: M256i, b: M256i, c: M256i): M256i {.importc: "_mm256_dpbusd_avx_epi32".}

# operating : multiply unsigned 8-bit integers from a with signed 8-bit integers from b, add intermediate results to signed 32-bit integers in c
# lane unit : (u8 * s8) + i32 / total : 128-bit (4 lanes of 32-bit results)
func mm_dpbusd_avx_epi32*(a: M128i, b: M128i, c: M128i): M128i {.importc: "_mm_dpbusd_avx_epi32".}

# operating : multiply unsigned 8-bit integers (a) with signed 8-bit (b), add to c with signed saturation
# lane unit : (u8 * s8) + i32 (saturated) / total : 256-bit
func mm256_dpbusds_avx_epi32*(a: M256i, b: M256i, c: M256i): M256i {.importc: "_mm256_dpbusds_avx_epi32".}

# operating : multiply unsigned 8-bit integers (a) with signed 8-bit (b), add to c with signed saturation
# lane unit : (u8 * s8) + i32 (saturated) / total : 128-bit
func mm_dpbusds_avx_epi32*(a: M128i, b: M128i, c: M128i): M128i {.importc: "_mm_dpbusds_avx_epi32".}

# operating : multiply signed 16-bit integers from a with signed 16-bit integers from b, add intermediate results to signed 32-bit integers in c
# lane unit : (s16 * s16) + i32 / total : 256-bit (8 lanes of 32-bit results)
func mm256_dpwssd_avx_epi32*(a: M256i, b: M256i, c: M256i): M256i {.importc: "_mm256_dpwssd_avx_epi32".}

# operating : multiply signed 16-bit integers from a with signed 16-bit integers from b, add intermediate results to signed 32-bit integers in c
# lane unit : (s16 * s16) + i32 / total : 128-bit (4 lanes of 32-bit results)
func mm_dpwssd_avx_epi32*(a: M128i, b: M128i, c: M128i): M128i {.importc: "_mm_dpwssd_avx_epi32".}

# operating : multiply signed 16-bit integers (a) with signed 16-bit (b), add to c with signed saturation
# lane unit : (s16 * s16) + i32 (saturated) / total : 256-bit
func mm256_dpwssds_avx_epi32*(a: M256i, b: M256i, c: M256i): M256i {.importc: "_mm256_dpwssds_avx_epi32".}

# operating : multiply signed 16-bit integers (a) with signed 16-bit (b), add to c with signed saturation
# lane unit : (s16 * s16) + i32 (saturated) / total : 128-bit
func mm_dpwssds_avx_epi32*(a: M128i, b: M128i, c: M128i): M128i {.importc: "_mm_dpwssds_avx_epi32".}
