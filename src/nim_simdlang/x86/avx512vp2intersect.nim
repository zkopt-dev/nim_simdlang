import avx512f

## [Macro Original]
## #define _AVX512VP2INTERSECTINTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_AVX512VP2INTERSECT__

func mm512_2intersect_epi32*(a: M512i, b: M512i, u: ptr MMask16, m: ptr MMask16): void {.importc: "_mm512_2intersect_epi32".}

func mm512_2intersect_epi64*(a: M512i, b: M512i, u: ptr MMask8, m: ptr MMask8): void {.importc: "_mm512_2intersect_epi64".}