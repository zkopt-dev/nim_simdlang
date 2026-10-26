import sse
import sse2
import avx
import avx2
import avx512f

## [Macro Original]
## #define _SM4INTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_SM4__

func mm_sm4key4_epi32*(a: M128i, b: M128i): M128i {.importc: "_mm_sm4key4_epi32".}

func mm256_sm4key4_epi32*(a: M256i, b: M256i): M256i {.importc: "_mm256_sm4key4_epi32".}

func mm_sm4rnds4_epi32*(a: M128i, b: M128i): M128i {.importc: "_mm_sm4rnds4_epi32".}

func mm256_sm4rnds4_epi32*(a: M256i, b: M256i): M256i {.importc: "_mm256_sm4rnds4_epi32".}

## [Macro Original]
## #define __DISABLE_SM4_512__

func mm512_sm4key4_epi32*(a: M512i, b: M512i): M512i {.importc: "_mm512_sm4key4_epi32".}

func mm512_sm4rnds4_epi32*(a: M512i, b: M512i): M512i {.importc: "_mm512_sm4rnds4_epi32".}