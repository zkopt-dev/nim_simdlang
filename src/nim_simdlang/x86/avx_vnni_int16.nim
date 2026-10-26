import sse
import sse2
import avx
import avx2
import avx512f

## [Macro Original]
## #define _AVXVNNIINT16INTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_AVXVNNIINT16__

# --- VNNI (Word-level Dot Product with Various Signing) ---

# operating : multiply signed 16-bit integers from a with unsigned 16-bit integers from b, add to signed 32-bit integers in w
# lane unit : (s16 * u16) + i32 / total : 128-bit (4 lanes)
func mm_dpwsud_avx_epi32*(w: M128i, a: M128i, b: M128i): M128i {.importc: "_mm_dpwsud_avx_epi32".}

# operating : multiply signed 16-bit (a) with unsigned 16-bit (b), add to w with signed saturation
# lane unit : (s16 * u16) + i32 (saturated) / total : 128-bit
func mm_dpwsuds_avx_epi32*(w: M128i, a: M128i, b: M128i): M128i {.importc: "_mm_dpwsuds_avx_epi32".}

# operating : multiply unsigned 16-bit integers from a with signed 16-bit integers from b, add to signed 32-bit integers in w
# lane unit : (u16 * s16) + i32 / total : 128-bit (4 lanes)
func mm_dpwusd_avx_epi32*(w: M128i, a: M128i, b: M128i): M128i {.importc: "_mm_dpwusd_avx_epi32".}

# operating : multiply unsigned 16-bit (a) with signed 16-bit (b), add to w with signed saturation
# lane unit : (u16 * s16) + i32 (saturated) / total : 128-bit
func mm_dpwusds_avx_epi32*(w: M128i, a: M128i, b: M128i): M128i {.importc: "_mm_dpwusds_avx_epi32".}

# operating : multiply unsigned 16-bit integers from a with unsigned 16-bit integers from b, add to signed 32-bit integers in w
# lane unit : (u16 * u16) + i32 / total : 128-bit (4 lanes)
func mm_dpwuud_avx_epi32*(w: M128i, a: M128i, b: M128i): M128i {.importc: "_mm_dpwuud_avx_epi32".}

# operating : multiply unsigned 16-bit (a) with unsigned 16-bit (b), add to w with signed saturation
# lane unit : (u16 * u16) + i32 (saturated) / total : 128-bit
func mm_dpwuuds_avx_epi32*(w: M128i, a: M128i, b: M128i): M128i {.importc: "_mm_dpwuuds_avx_epi32".}

# operating : multiply signed 16-bit integers from a with unsigned 16-bit integers from b, add to signed 32-bit integers in w
# lane unit : (s16 * u16) + i32 / total : 256-bit (8 lanes)
func mm256_dpwsud_avx_epi32*(w: M256i, a: M256i, b: M256i): M256i {.importc: "_mm256_dpwsud_avx_epi32".}

# operating : multiply signed 16-bit (a) with unsigned 16-bit (b), add to w with signed saturation
# lane unit : (s16 * u16) + i32 (saturated) / total : 256-bit
func mm256_dpwsuds_avx_epi32*(w: M256i, a: M256i, b: M256i): M256i {.importc: "_mm256_dpwsuds_avx_epi32".}

# operating : multiply unsigned 16-bit integers from a with signed 16-bit integers from b, add to signed 32-bit integers in w
# lane unit : (u16 * s16) + i32 / total : 256-bit (8 lanes)
func mm256_dpwusd_avx_epi32*(w: M256i, a: M256i, b: M256i): M256i {.importc: "_mm256_dpwusd_avx_epi32".}

# operating : multiply unsigned 16-bit (a) with signed 16-bit (b), add to w with signed saturation
# lane unit : (u16 * s16) + i32 (saturated) / total : 256-bit
func mm256_dpwusds_avx_epi32*(w: M256i, a: M256i, b: M256i): M256i {.importc: "_mm256_dpwusds_avx_epi32".}

# operating : multiply unsigned 16-bit integers from a with unsigned 16-bit integers from b, add to signed 32-bit integers in w
# lane unit : (u16 * u16) + i32 / total : 256-bit (8 lanes)
func mm256_dpwuud_avx_epi32*(w: M256i, a: M256i, b: M256i): M256i {.importc: "_mm256_dpwuud_avx_epi32".}

# operating : multiply unsigned 16-bit (a) with unsigned 16-bit (b), add to w with signed saturation
# lane unit : (u16 * u16) + i32 (saturated) / total : 256-bit
func mm256_dpwuuds_avx_epi32*(w: M256i, a: M256i, b: M256i): M256i {.importc: "_mm256_dpwuuds_avx_epi32".}