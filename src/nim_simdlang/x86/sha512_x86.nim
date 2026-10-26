import sse
import sse2
import avx
import avx2

## [Macro Original]
## #define _SHA512INTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_SHA512__

func mm256_sha512msg1_epi64*(a: M256i, b: M128i): M256i {.importc: "_mm256_sha512msg1_epi64".}

func mm256_sha512msg2_epi64*(a: M256i, b: M256i): M256i {.importc: "_mm256_sha512msg2_epi64".}

func mm256_sha512rnds2_epi64*(a: M256i, b: M256i, c: M128i): M256i {.importc: "_mm256_sha512rnds2_epi64".}