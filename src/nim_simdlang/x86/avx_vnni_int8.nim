import sse
import sse2
import avx
import avx2
import avx512f

## [Macro Original]
## #define _AVXVNNIINT8INTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_AVXVNNIINT8__

# --- VNNI (Byte-level Dot Product with Various Signing) ---

# operating : multiply signed 8-bit integers from a with signed 8-bit integers from b, add to signed 32-bit integers in w
# lane unit : (s8 * s8) + i32 / total : 128-bit (4 lanes of 32-bit results)
func mm_dpbssd_epi32*(w: M128i, a: M128i, b: M128i): M128i {.importc: "_mm_dpbssd_epi32".}

# operating : multiply signed 8-bit (a) with signed 8-bit (b), add to w with signed saturation
# lane unit : (s8 * s8) + i32 (saturated) / total : 128-bit
func mm_dpbssds_epi32*(w: M128i, a: M128i, b: M128i): M128i {.importc: "_mm_dpbssds_epi32".}

# operating : multiply signed 8-bit integers from a with unsigned 8-bit integers from b, add to signed 32-bit integers in w
# lane unit : (s8 * u8) + i32 / total : 128-bit (4 lanes)
func mm_dpbsud_epi32*(w: M128i, a: M128i, b: M128i): M128i {.importc: "_mm_dpbsud_epi32".}

# operating : multiply signed 8-bit (a) with unsigned 8-bit (b), add to w with signed saturation
# lane unit : (s8 * u8) + i32 (saturated) / total : 128-bit
func mm_dpbsuds_epi32*(w: M128i, a: M128i, b: M128i): M128i {.importc: "_mm_dpbsuds_epi32".}

# operating : multiply unsigned 8-bit integers from a with unsigned 8-bit integers from b, add to signed 32-bit integers in w
# lane unit : (u8 * u8) + i32 / total : 128-bit (4 lanes)
func mm_dpbuud_epi32*(w: M128i, a: M128i, b: M128i): M128i {.importc: "_mm_dpbuud_epi32".}

# operating : multiply unsigned 8-bit (a) with unsigned 8-bit (b), add to w with signed saturation
# lane unit : (u8 * u8) + i32 (saturated) / total : 128-bit
func mm_dpbuuds_epi32*(w: M128i, a: M128i, b: M128i): M128i {.importc: "_mm_dpbuuds_epi32".}

# operating : multiply signed 8-bit integers from a with signed 8-bit integers from b, add to signed 32-bit integers in w
# lane unit : (s8 * s8) + i32 / total : 256-bit (8 lanes of 32-bit results)
func mm256_dpbssd_epi32*(w: M256i, a: M256i, b: M256i): M256i {.importc: "_mm256_dpbssd_epi32".}

# operating : multiply signed 8-bit (a) with signed 8-bit (b), add to w with signed saturation
# lane unit : (s8 * s8) + i32 (saturated) / total : 256-bit
func mm256_dpbssds_epi32*(w: M256i, a: M256i, b: M256i): M256i {.importc: "_mm256_dpbssds_epi32".}

# operating : multiply signed 8-bit integers from a with unsigned 8-bit integers from b, add to signed 32-bit integers in w
# lane unit : (s8 * u8) + i32 / total : 256-bit (8 lanes)
func mm256_dpbsud_epi32*(w: M256i, a: M256i, b: M256i): M256i {.importc: "_mm256_dpbsud_epi32".}

# operating : multiply signed 8-bit (a) with unsigned 8-bit (b), add to w with signed saturation
# lane unit : (s8 * u8) + i32 (saturated) / total : 256-bit
func mm256_dpbsuds_epi32*(w: M256i, a: M256i, b: M256i): M256i {.importc: "_mm256_dpbsuds_epi32".}

# operating : multiply unsigned 8-bit integers from a with unsigned 8-bit integers from b, add to signed 32-bit integers in w
# lane unit : (u8 * u8) + i32 / total : 256-bit (8 lanes)
func mm256_dpbuud_epi32*(w: M256i, a: M256i, b: M256i): M256i {.importc: "_mm256_dpbuud_epi32".}

# operating : multiply unsigned 8-bit (a) with unsigned 8-bit (b), add to w with signed saturation
# lane unit : (u8 * u8) + i32 (saturated) / total : 256-bit
func mm256_dpbuuds_epi32*(w: M256i, a: M256i, b: M256i): M256i {.importc: "_mm256_dpbuuds_epi32".}