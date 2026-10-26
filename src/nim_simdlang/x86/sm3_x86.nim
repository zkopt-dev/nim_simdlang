import sse
import sse2
import avx
import avx2

## [Macro Original]
## #define _SM3INTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_SM3__

func mm_sm3msg1_epi32*(a: M128i, b: M128i, c: M128i): M128i {.importc: "_mm_sm3msg1_epi32".}

func mm_sm3msg2_epi32*(a: M128i, b: M128i, c: M128i): M128i {.importc: "_mm_sm3msg2_epi32".}

func mm_sm3rnds2_epi32*(a: M128i, b: M128i, c: M128i, d: int32): M128i {.importc: "_mm_sm3rnds2_epi32".}

## [Macro Original]
## #define _mm_sm3rnds2_epi32(A, B, C, D)					\
## ((__m128i) __builtin_ia32_vsm3rnds2 ((__v4si) (A), (__v4si) (B),	\
## (__v4si) (C), (int) (D)))