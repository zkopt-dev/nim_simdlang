import avx512f

## [Macro Original]
## #define _AVX512VP2INTERSECTVLINTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_AVX512VP2INTERSECTVL__

func mm_2intersect_epi32*(a: M128i, b: M128i, u: ptr MMask8, m: ptr MMask8): void {.importc: "_mm_2intersect_epi32".}

func mm256_2intersect_epi32*(a: M256i, b: M256i, u: ptr MMask8, m: ptr MMask8): void {.importc: "_mm256_2intersect_epi32".}

func mm_2intersect_epi64*(a: M128i, b: M128i, u: ptr MMask8, m: ptr MMask8): void {.importc: "_mm_2intersect_epi64".}

func mm256_2intersect_epi64*(a: M256i, b: M256i, u: ptr MMask8, m: ptr MMask8): void {.importc: "_mm256_2intersect_epi64".}