import sse
import sse2
import avx
import avx2

## [Macro Original]
## #define _SHAINTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_SHA__

func mm_sha1msg1_epu32*(a: M128i, b: M128i): M128i {.importc: "_mm_sha1msg1_epu32".}

func mm_sha1msg2_epu32*(a: M128i, b: M128i): M128i {.importc: "_mm_sha1msg2_epu32".}

func mm_sha1nexte_epu32*(a: M128i, b: M128i): M128i {.importc: "_mm_sha1nexte_epu32".}

func mm_sha1rnds4_epu32*(a: M128i, b: M128i, i: int32): M128i {.importc: "_mm_sha1rnds4_epu32".}

## [Macro Original]
## #define _mm_sha1rnds4_epu32(A, B, I)				    \
## ((__m128i) __builtin_ia32_sha1rnds4 ((__v4si)(__m128i)(A),	    \
## (__v4si)(__m128i)(B), (int)(I)))

func mm_sha256msg1_epu32*(a: M128i, b: M128i): M128i {.importc: "_mm_sha256msg1_epu32".}

func mm_sha256msg2_epu32*(a: M128i, b: M128i): M128i {.importc: "_mm_sha256msg2_epu32".}

func mm_sha256rnds2_epu32*(a: M128i, b: M128i, c: M128i): M128i {.importc: "_mm_sha256rnds2_epu32".}