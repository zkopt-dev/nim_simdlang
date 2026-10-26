import avx512f
import sse2
import sse
import avx

## [Macro Original]
## #define _AVX10_2BF16INTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_AVX10_2__

func mm512_add_pbh*(a: M512bh, b: M512bh): M512bh {.importc: "_mm512_add_pbh".}

func mm512_mask_add_pbh*(w: M512bh, u: MMask32, a: M512bh, b: M512bh): M512bh {.importc: "_mm512_mask_add_pbh".}

func mm512_maskz_add_pbh*(u: MMask32, a: M512bh, b: M512bh): M512bh {.importc: "_mm512_maskz_add_pbh".}

func mm256_add_pbh*(a: M256bh, b: M256bh): M256bh {.importc: "_mm256_add_pbh".}

func mm256_mask_add_pbh*(w: M256bh, u: MMask16, a: M256bh, b: M256bh): M256bh {.importc: "_mm256_mask_add_pbh".}

func mm256_maskz_add_pbh*(u: MMask16, a: M256bh, b: M256bh): M256bh {.importc: "_mm256_maskz_add_pbh".}

func mm_add_pbh*(a: M128bh, b: M128bh): M128bh {.importc: "_mm_add_pbh".}

func mm_mask_add_pbh*(w: M128bh, u: MMask8, a: M128bh, b: M128bh): M128bh {.importc: "_mm_mask_add_pbh".}

func mm_maskz_add_pbh*(u: MMask8, a: M128bh, b: M128bh): M128bh {.importc: "_mm_maskz_add_pbh".}

func mm512_sub_pbh*(a: M512bh, b: M512bh): M512bh {.importc: "_mm512_sub_pbh".}

func mm512_mask_sub_pbh*(w: M512bh, u: MMask32, a: M512bh, b: M512bh): M512bh {.importc: "_mm512_mask_sub_pbh".}

func mm512_maskz_sub_pbh*(u: MMask32, a: M512bh, b: M512bh): M512bh {.importc: "_mm512_maskz_sub_pbh".}

func mm256_sub_pbh*(a: M256bh, b: M256bh): M256bh {.importc: "_mm256_sub_pbh".}

func mm256_mask_sub_pbh*(w: M256bh, u: MMask16, a: M256bh, b: M256bh): M256bh {.importc: "_mm256_mask_sub_pbh".}

func mm256_maskz_sub_pbh*(u: MMask16, a: M256bh, b: M256bh): M256bh {.importc: "_mm256_maskz_sub_pbh".}

func mm_sub_pbh*(a: M128bh, b: M128bh): M128bh {.importc: "_mm_sub_pbh".}

func mm_mask_sub_pbh*(w: M128bh, u: MMask8, a: M128bh, b: M128bh): M128bh {.importc: "_mm_mask_sub_pbh".}

func mm_maskz_sub_pbh*(u: MMask8, a: M128bh, b: M128bh): M128bh {.importc: "_mm_maskz_sub_pbh".}

func mm512_mul_pbh*(a: M512bh, b: M512bh): M512bh {.importc: "_mm512_mul_pbh".}

func mm512_mask_mul_pbh*(w: M512bh, u: MMask32, a: M512bh, b: M512bh): M512bh {.importc: "_mm512_mask_mul_pbh".}

func mm512_maskz_mul_pbh*(u: MMask32, a: M512bh, b: M512bh): M512bh {.importc: "_mm512_maskz_mul_pbh".}

func mm256_mul_pbh*(a: M256bh, b: M256bh): M256bh {.importc: "_mm256_mul_pbh".}

func mm256_mask_mul_pbh*(w: M256bh, u: MMask16, a: M256bh, b: M256bh): M256bh {.importc: "_mm256_mask_mul_pbh".}

func mm256_maskz_mul_pbh*(u: MMask16, a: M256bh, b: M256bh): M256bh {.importc: "_mm256_maskz_mul_pbh".}

func mm_mul_pbh*(a: M128bh, b: M128bh): M128bh {.importc: "_mm_mul_pbh".}

func mm_mask_mul_pbh*(w: M128bh, u: MMask8, a: M128bh, b: M128bh): M128bh {.importc: "_mm_mask_mul_pbh".}

func mm_maskz_mul_pbh*(u: MMask8, a: M128bh, b: M128bh): M128bh {.importc: "_mm_maskz_mul_pbh".}

func mm512_div_pbh*(a: M512bh, b: M512bh): M512bh {.importc: "_mm512_div_pbh".}

func mm512_mask_div_pbh*(w: M512bh, u: MMask32, a: M512bh, b: M512bh): M512bh {.importc: "_mm512_mask_div_pbh".}

func mm512_maskz_div_pbh*(u: MMask32, a: M512bh, b: M512bh): M512bh {.importc: "_mm512_maskz_div_pbh".}

func mm256_div_pbh*(a: M256bh, b: M256bh): M256bh {.importc: "_mm256_div_pbh".}

func mm256_mask_div_pbh*(w: M256bh, u: MMask16, a: M256bh, b: M256bh): M256bh {.importc: "_mm256_mask_div_pbh".}

func mm256_maskz_div_pbh*(u: MMask16, a: M256bh, b: M256bh): M256bh {.importc: "_mm256_maskz_div_pbh".}

func mm_div_pbh*(a: M128bh, b: M128bh): M128bh {.importc: "_mm_div_pbh".}

func mm_mask_div_pbh*(w: M128bh, u: MMask8, a: M128bh, b: M128bh): M128bh {.importc: "_mm_mask_div_pbh".}

func mm_maskz_div_pbh*(u: MMask8, a: M128bh, b: M128bh): M128bh {.importc: "_mm_maskz_div_pbh".}

func mm512_max_pbh*(a: M512bh, b: M512bh): M512bh {.importc: "_mm512_max_pbh".}

func mm512_mask_max_pbh*(w: M512bh, u: MMask32, a: M512bh, b: M512bh): M512bh {.importc: "_mm512_mask_max_pbh".}

func mm512_maskz_max_pbh*(u: MMask32, a: M512bh, b: M512bh): M512bh {.importc: "_mm512_maskz_max_pbh".}

func mm256_max_pbh*(a: M256bh, b: M256bh): M256bh {.importc: "_mm256_max_pbh".}

func mm256_mask_max_pbh*(w: M256bh, u: MMask16, a: M256bh, b: M256bh): M256bh {.importc: "_mm256_mask_max_pbh".}

func mm256_maskz_max_pbh*(u: MMask16, a: M256bh, b: M256bh): M256bh {.importc: "_mm256_maskz_max_pbh".}

func mm_max_pbh*(a: M128bh, b: M128bh): M128bh {.importc: "_mm_max_pbh".}

func mm_mask_max_pbh*(w: M128bh, u: MMask8, a: M128bh, b: M128bh): M128bh {.importc: "_mm_mask_max_pbh".}

func mm_maskz_max_pbh*(u: MMask8, a: M128bh, b: M128bh): M128bh {.importc: "_mm_maskz_max_pbh".}

func mm512_min_pbh*(a: M512bh, b: M512bh): M512bh {.importc: "_mm512_min_pbh".}

func mm512_mask_min_pbh*(w: M512bh, u: MMask32, a: M512bh, b: M512bh): M512bh {.importc: "_mm512_mask_min_pbh".}

func mm512_maskz_min_pbh*(u: MMask32, a: M512bh, b: M512bh): M512bh {.importc: "_mm512_maskz_min_pbh".}

func mm256_min_pbh*(a: M256bh, b: M256bh): M256bh {.importc: "_mm256_min_pbh".}

func mm256_mask_min_pbh*(w: M256bh, u: MMask16, a: M256bh, b: M256bh): M256bh {.importc: "_mm256_mask_min_pbh".}

func mm256_maskz_min_pbh*(u: MMask16, a: M256bh, b: M256bh): M256bh {.importc: "_mm256_maskz_min_pbh".}

func mm_min_pbh*(a: M128bh, b: M128bh): M128bh {.importc: "_mm_min_pbh".}

func mm_mask_min_pbh*(w: M128bh, u: MMask8, a: M128bh, b: M128bh): M128bh {.importc: "_mm_mask_min_pbh".}

func mm_maskz_min_pbh*(u: MMask8, a: M128bh, b: M128bh): M128bh {.importc: "_mm_maskz_min_pbh".}

func mm512_scalef_pbh*(a: M512bh, b: M512bh): M512bh {.importc: "_mm512_scalef_pbh".}

func mm512_mask_scalef_pbh*(w: M512bh, u: MMask32, a: M512bh, b: M512bh): M512bh {.importc: "_mm512_mask_scalef_pbh".}

func mm512_maskz_scalef_pbh*(u: MMask32, a: M512bh, b: M512bh): M512bh {.importc: "_mm512_maskz_scalef_pbh".}

func mm256_scalef_pbh*(a: M256bh, b: M256bh): M256bh {.importc: "_mm256_scalef_pbh".}

func mm256_mask_scalef_pbh*(w: M256bh, u: MMask16, a: M256bh, b: M256bh): M256bh {.importc: "_mm256_mask_scalef_pbh".}

func mm256_maskz_scalef_pbh*(u: MMask16, a: M256bh, b: M256bh): M256bh {.importc: "_mm256_maskz_scalef_pbh".}

func mm_scalef_pbh*(a: M128bh, b: M128bh): M128bh {.importc: "_mm_scalef_pbh".}

func mm_mask_scalef_pbh*(w: M128bh, u: MMask8, a: M128bh, b: M128bh): M128bh {.importc: "_mm_mask_scalef_pbh".}

func mm_maskz_scalef_pbh*(u: MMask8, a: M128bh, b: M128bh): M128bh {.importc: "_mm_maskz_scalef_pbh".}

func mm512_fmadd_pbh*(a: M512bh, b: M512bh, c: M512bh): M512bh {.importc: "_mm512_fmadd_pbh".}

func mm512_mask_fmadd_pbh*(a: M512bh, u: MMask32, b: M512bh, c: M512bh): M512bh {.importc: "_mm512_mask_fmadd_pbh".}

func mm512_mask3_fmadd_pbh*(a: M512bh, b: M512bh, c: M512bh, u: MMask32): M512bh {.importc: "_mm512_mask3_fmadd_pbh".}

func mm512_maskz_fmadd_pbh*(u: MMask32, a: M512bh, b: M512bh, c: M512bh): M512bh {.importc: "_mm512_maskz_fmadd_pbh".}

func mm256_fmadd_pbh*(a: M256bh, b: M256bh, c: M256bh): M256bh {.importc: "_mm256_fmadd_pbh".}

func mm256_mask_fmadd_pbh*(a: M256bh, u: MMask16, b: M256bh, c: M256bh): M256bh {.importc: "_mm256_mask_fmadd_pbh".}

func mm256_mask3_fmadd_pbh*(a: M256bh, b: M256bh, c: M256bh, u: MMask16): M256bh {.importc: "_mm256_mask3_fmadd_pbh".}

func mm256_maskz_fmadd_pbh*(u: MMask16, a: M256bh, b: M256bh, c: M256bh): M256bh {.importc: "_mm256_maskz_fmadd_pbh".}

func mm_fmadd_pbh*(a: M128bh, b: M128bh, c: M128bh): M128bh {.importc: "_mm_fmadd_pbh".}

func mm_mask_fmadd_pbh*(a: M128bh, u: MMask8, b: M128bh, c: M128bh): M128bh {.importc: "_mm_mask_fmadd_pbh".}

func mm_mask3_fmadd_pbh*(a: M128bh, b: M128bh, c: M128bh, u: MMask8): M128bh {.importc: "_mm_mask3_fmadd_pbh".}

func mm_maskz_fmadd_pbh*(u: MMask8, a: M128bh, b: M128bh, c: M128bh): M128bh {.importc: "_mm_maskz_fmadd_pbh".}

func mm512_fmsub_pbh*(a: M512bh, b: M512bh, c: M512bh): M512bh {.importc: "_mm512_fmsub_pbh".}

func mm512_mask_fmsub_pbh*(a: M512bh, u: MMask32, b: M512bh, c: M512bh): M512bh {.importc: "_mm512_mask_fmsub_pbh".}

func mm512_mask3_fmsub_pbh*(a: M512bh, b: M512bh, c: M512bh, u: MMask32): M512bh {.importc: "_mm512_mask3_fmsub_pbh".}

func mm512_maskz_fmsub_pbh*(u: MMask32, a: M512bh, b: M512bh, c: M512bh): M512bh {.importc: "_mm512_maskz_fmsub_pbh".}

func mm256_fmsub_pbh*(a: M256bh, b: M256bh, c: M256bh): M256bh {.importc: "_mm256_fmsub_pbh".}

func mm256_mask_fmsub_pbh*(a: M256bh, u: MMask16, b: M256bh, c: M256bh): M256bh {.importc: "_mm256_mask_fmsub_pbh".}

func mm256_mask3_fmsub_pbh*(a: M256bh, b: M256bh, c: M256bh, u: MMask16): M256bh {.importc: "_mm256_mask3_fmsub_pbh".}

func mm256_maskz_fmsub_pbh*(u: MMask16, a: M256bh, b: M256bh, c: M256bh): M256bh {.importc: "_mm256_maskz_fmsub_pbh".}

func mm_fmsub_pbh*(a: M128bh, b: M128bh, c: M128bh): M128bh {.importc: "_mm_fmsub_pbh".}

func mm_mask_fmsub_pbh*(a: M128bh, u: MMask8, b: M128bh, c: M128bh): M128bh {.importc: "_mm_mask_fmsub_pbh".}

func mm_mask3_fmsub_pbh*(a: M128bh, b: M128bh, c: M128bh, u: MMask8): M128bh {.importc: "_mm_mask3_fmsub_pbh".}

func mm_maskz_fmsub_pbh*(u: MMask8, a: M128bh, b: M128bh, c: M128bh): M128bh {.importc: "_mm_maskz_fmsub_pbh".}

func mm512_fnmadd_pbh*(a: M512bh, b: M512bh, c: M512bh): M512bh {.importc: "_mm512_fnmadd_pbh".}

func mm512_mask_fnmadd_pbh*(a: M512bh, u: MMask32, b: M512bh, c: M512bh): M512bh {.importc: "_mm512_mask_fnmadd_pbh".}

func mm512_mask3_fnmadd_pbh*(a: M512bh, b: M512bh, c: M512bh, u: MMask32): M512bh {.importc: "_mm512_mask3_fnmadd_pbh".}

func mm512_maskz_fnmadd_pbh*(u: MMask32, a: M512bh, b: M512bh, c: M512bh): M512bh {.importc: "_mm512_maskz_fnmadd_pbh".}

func mm256_fnmadd_pbh*(a: M256bh, b: M256bh, c: M256bh): M256bh {.importc: "_mm256_fnmadd_pbh".}

func mm256_mask_fnmadd_pbh*(a: M256bh, u: MMask16, b: M256bh, c: M256bh): M256bh {.importc: "_mm256_mask_fnmadd_pbh".}

func mm256_mask3_fnmadd_pbh*(a: M256bh, b: M256bh, c: M256bh, u: MMask16): M256bh {.importc: "_mm256_mask3_fnmadd_pbh".}

func mm256_maskz_fnmadd_pbh*(u: MMask16, a: M256bh, b: M256bh, c: M256bh): M256bh {.importc: "_mm256_maskz_fnmadd_pbh".}

func mm_fnmadd_pbh*(a: M128bh, b: M128bh, c: M128bh): M128bh {.importc: "_mm_fnmadd_pbh".}

func mm_mask_fnmadd_pbh*(a: M128bh, u: MMask8, b: M128bh, c: M128bh): M128bh {.importc: "_mm_mask_fnmadd_pbh".}

func mm_mask3_fnmadd_pbh*(a: M128bh, b: M128bh, c: M128bh, u: MMask8): M128bh {.importc: "_mm_mask3_fnmadd_pbh".}

func mm_maskz_fnmadd_pbh*(u: MMask8, a: M128bh, b: M128bh, c: M128bh): M128bh {.importc: "_mm_maskz_fnmadd_pbh".}

func mm512_fnmsub_pbh*(a: M512bh, b: M512bh, c: M512bh): M512bh {.importc: "_mm512_fnmsub_pbh".}

func mm512_mask_fnmsub_pbh*(a: M512bh, u: MMask32, b: M512bh, c: M512bh): M512bh {.importc: "_mm512_mask_fnmsub_pbh".}

func mm512_mask3_fnmsub_pbh*(a: M512bh, b: M512bh, c: M512bh, u: MMask32): M512bh {.importc: "_mm512_mask3_fnmsub_pbh".}

func mm512_maskz_fnmsub_pbh*(u: MMask32, a: M512bh, b: M512bh, c: M512bh): M512bh {.importc: "_mm512_maskz_fnmsub_pbh".}

func mm256_fnmsub_pbh*(a: M256bh, b: M256bh, c: M256bh): M256bh {.importc: "_mm256_fnmsub_pbh".}

func mm256_mask_fnmsub_pbh*(a: M256bh, u: MMask16, b: M256bh, c: M256bh): M256bh {.importc: "_mm256_mask_fnmsub_pbh".}

func mm256_mask3_fnmsub_pbh*(a: M256bh, b: M256bh, c: M256bh, u: MMask16): M256bh {.importc: "_mm256_mask3_fnmsub_pbh".}

func mm256_maskz_fnmsub_pbh*(u: MMask16, a: M256bh, b: M256bh, c: M256bh): M256bh {.importc: "_mm256_maskz_fnmsub_pbh".}

func mm_fnmsub_pbh*(a: M128bh, b: M128bh, c: M128bh): M128bh {.importc: "_mm_fnmsub_pbh".}

func mm_mask_fnmsub_pbh*(a: M128bh, u: MMask8, b: M128bh, c: M128bh): M128bh {.importc: "_mm_mask_fnmsub_pbh".}

func mm_mask3_fnmsub_pbh*(a: M128bh, b: M128bh, c: M128bh, u: MMask8): M128bh {.importc: "_mm_mask3_fnmsub_pbh".}

func mm_maskz_fnmsub_pbh*(u: MMask8, a: M128bh, b: M128bh, c: M128bh): M128bh {.importc: "_mm_maskz_fnmsub_pbh".}

func mm512_rsqrt_pbh*(a: M512bh): M512bh {.importc: "_mm512_rsqrt_pbh".}

func mm512_mask_rsqrt_pbh*(w: M512bh, u: MMask32, a: M512bh): M512bh {.importc: "_mm512_mask_rsqrt_pbh".}

func mm512_maskz_rsqrt_pbh*(u: MMask32, a: M512bh): M512bh {.importc: "_mm512_maskz_rsqrt_pbh".}

func mm256_rsqrt_pbh*(a: M256bh): M256bh {.importc: "_mm256_rsqrt_pbh".}

func mm256_mask_rsqrt_pbh*(w: M256bh, u: MMask16, a: M256bh): M256bh {.importc: "_mm256_mask_rsqrt_pbh".}

func mm256_maskz_rsqrt_pbh*(u: MMask16, a: M256bh): M256bh {.importc: "_mm256_maskz_rsqrt_pbh".}

func mm_rsqrt_pbh*(a: M128bh): M128bh {.importc: "_mm_rsqrt_pbh".}

func mm_mask_rsqrt_pbh*(w: M128bh, u: MMask8, a: M128bh): M128bh {.importc: "_mm_mask_rsqrt_pbh".}

func mm_maskz_rsqrt_pbh*(u: MMask8, a: M128bh): M128bh {.importc: "_mm_maskz_rsqrt_pbh".}

func mm512_sqrt_pbh*(a: M512bh): M512bh {.importc: "_mm512_sqrt_pbh".}

func mm512_mask_sqrt_pbh*(w: M512bh, u: MMask32, a: M512bh): M512bh {.importc: "_mm512_mask_sqrt_pbh".}

func mm512_maskz_sqrt_pbh*(u: MMask32, a: M512bh): M512bh {.importc: "_mm512_maskz_sqrt_pbh".}

func mm256_sqrt_pbh*(a: M256bh): M256bh {.importc: "_mm256_sqrt_pbh".}

func mm256_mask_sqrt_pbh*(w: M256bh, u: MMask16, a: M256bh): M256bh {.importc: "_mm256_mask_sqrt_pbh".}

func mm256_maskz_sqrt_pbh*(u: MMask16, a: M256bh): M256bh {.importc: "_mm256_maskz_sqrt_pbh".}

func mm_sqrt_pbh*(a: M128bh): M128bh {.importc: "_mm_sqrt_pbh".}

func mm_mask_sqrt_pbh*(w: M128bh, u: MMask8, a: M128bh): M128bh {.importc: "_mm_mask_sqrt_pbh".}

func mm_maskz_sqrt_pbh*(u: MMask8, a: M128bh): M128bh {.importc: "_mm_maskz_sqrt_pbh".}

func mm512_rcp_pbh*(a: M512bh): M512bh {.importc: "_mm512_rcp_pbh".}

func mm512_mask_rcp_pbh*(w: M512bh, u: MMask32, a: M512bh): M512bh {.importc: "_mm512_mask_rcp_pbh".}

func mm512_maskz_rcp_pbh*(u: MMask32, a: M512bh): M512bh {.importc: "_mm512_maskz_rcp_pbh".}

func mm256_rcp_pbh*(a: M256bh): M256bh {.importc: "_mm256_rcp_pbh".}

func mm256_mask_rcp_pbh*(w: M256bh, u: MMask16, a: M256bh): M256bh {.importc: "_mm256_mask_rcp_pbh".}

func mm256_maskz_rcp_pbh*(u: MMask16, a: M256bh): M256bh {.importc: "_mm256_maskz_rcp_pbh".}

func mm_rcp_pbh*(a: M128bh): M128bh {.importc: "_mm_rcp_pbh".}

func mm_mask_rcp_pbh*(w: M128bh, u: MMask8, a: M128bh): M128bh {.importc: "_mm_mask_rcp_pbh".}

func mm_maskz_rcp_pbh*(u: MMask8, a: M128bh): M128bh {.importc: "_mm_maskz_rcp_pbh".}

func mm512_getexp_pbh*(a: M512bh): M512bh {.importc: "_mm512_getexp_pbh".}

func mm512_mask_getexp_pbh*(w: M512bh, u: MMask32, a: M512bh): M512bh {.importc: "_mm512_mask_getexp_pbh".}

func mm512_maskz_getexp_pbh*(u: MMask32, a: M512bh): M512bh {.importc: "_mm512_maskz_getexp_pbh".}

func mm256_getexp_pbh*(a: M256bh): M256bh {.importc: "_mm256_getexp_pbh".}

func mm256_mask_getexp_pbh*(w: M256bh, u: MMask16, a: M256bh): M256bh {.importc: "_mm256_mask_getexp_pbh".}

func mm256_maskz_getexp_pbh*(u: MMask16, a: M256bh): M256bh {.importc: "_mm256_maskz_getexp_pbh".}

func mm_getexp_pbh*(a: M128bh): M128bh {.importc: "_mm_getexp_pbh".}

func mm_mask_getexp_pbh*(w: M128bh, u: MMask8, a: M128bh): M128bh {.importc: "_mm_mask_getexp_pbh".}

func mm_maskz_getexp_pbh*(u: MMask8, a: M128bh): M128bh {.importc: "_mm_maskz_getexp_pbh".}

func mm512_roundscale_pbh*(a: M512bh, b: int32): M512bh {.importc: "_mm512_roundscale_pbh".}

func mm512_mask_roundscale_pbh*(w: M512bh, u: MMask32, a: M512bh, b: int32): M512bh {.importc: "_mm512_mask_roundscale_pbh".}

func mm512_maskz_roundscale_pbh*(u: MMask32, a: M512bh, b: int32): M512bh {.importc: "_mm512_maskz_roundscale_pbh".}

func mm256_roundscale_pbh*(a: M256bh, b: int32): M256bh {.importc: "_mm256_roundscale_pbh".}

func mm256_mask_roundscale_pbh*(w: M256bh, u: MMask16, a: M256bh, b: int32): M256bh {.importc: "_mm256_mask_roundscale_pbh".}

func mm256_maskz_roundscale_pbh*(u: MMask16, a: M256bh, b: int32): M256bh {.importc: "_mm256_maskz_roundscale_pbh".}

func mm_roundscale_pbh*(a: M128bh, b: int32): M128bh {.importc: "_mm_roundscale_pbh".}

func mm_mask_roundscale_pbh*(w: M128bh, u: MMask8, a: M128bh, b: int32): M128bh {.importc: "_mm_mask_roundscale_pbh".}

func mm_maskz_roundscale_pbh*(u: MMask8, a: M128bh, b: int32): M128bh {.importc: "_mm_maskz_roundscale_pbh".}

## [Macro Original]
## #define _mm512_roundscale_pbh(A, B)					      \
## (__builtin_ia32_rndscalebf16512_mask ((A), (B),			      \
## (__v32bf) _mm512_setzero_si512 (),    \
## (__mmask32) -1))

## [Macro Original]
## #define _mm512_mask_roundscale_pbh(A, B, C, D)	    		      \
## (__builtin_ia32_rndscalebf16512_mask ((C), (D), (A), (B)))

## [Macro Original]
## #define _mm512_maskz_roundscale_pbh(A, B, C)				      \
## (__builtin_ia32_rndscalebf16512_mask ((B), (C),			      \
## (__v32bf) _mm512_setzero_si512 (),    \
## (A)))

## [Macro Original]
## #define _mm256_roundscale_pbh(A, B)					      \
## (__builtin_ia32_rndscalebf16256_mask ((A), (B),			      \
## (__v16bf) _mm256_setzero_si256 (),    \
## (__mmask16) -1))

## [Macro Original]
## #define _mm256_mask_roundscale_pbh(A, B, C, D)	    		      \
## (__builtin_ia32_rndscalebf16256_mask ((C), (D), (A), (B)))

## [Macro Original]
## #define _mm256_maskz_roundscale_pbh(A, B, C)				      \
## (__builtin_ia32_rndscalebf16256_mask ((B), (C),			      \
## (__v16bf) _mm256_setzero_si256 (),    \
## (A)))

## [Macro Original]
## #define _mm_roundscale_pbh(A, B)					      \
## (__builtin_ia32_rndscalebf16128_mask ((A), (B),			      \
## (__v8bf) _mm_setzero_si128 (),	      \
## (__mmask8) -1))

## [Macro Original]
## #define _mm_mask_roundscale_pbh(A, B, C, D)				      \
## (__builtin_ia32_rndscalebf16128_mask ((C), (D), (A), (B)))

## [Macro Original]
## #define _mm_maskz_roundscale_pbh(A, B, C)				      \
## (__builtin_ia32_rndscalebf16128_mask ((B), (C),			      \
## (__v8bf) _mm_setzero_si128 (),	      \
## (A)))

func mm512_reduce_pbh*(a: M512bh, b: int32): M512bh {.importc: "_mm512_reduce_pbh".}

func mm512_mask_reduce_pbh*(w: M512bh, u: MMask32, a: M512bh, b: int32): M512bh {.importc: "_mm512_mask_reduce_pbh".}

func mm512_maskz_reduce_pbh*(u: MMask32, a: M512bh, b: int32): M512bh {.importc: "_mm512_maskz_reduce_pbh".}

func mm256_reduce_pbh*(a: M256bh, b: int32): M256bh {.importc: "_mm256_reduce_pbh".}

func mm256_mask_reduce_pbh*(w: M256bh, u: MMask16, a: M256bh, b: int32): M256bh {.importc: "_mm256_mask_reduce_pbh".}

func mm256_maskz_reduce_pbh*(u: MMask16, a: M256bh, b: int32): M256bh {.importc: "_mm256_maskz_reduce_pbh".}

func mm_reduce_pbh*(a: M128bh, b: int32): M128bh {.importc: "_mm_reduce_pbh".}

func mm_mask_reduce_pbh*(w: M128bh, u: MMask8, a: M128bh, b: int32): M128bh {.importc: "_mm_mask_reduce_pbh".}

func mm_maskz_reduce_pbh*(u: MMask8, a: M128bh, b: int32): M128bh {.importc: "_mm_maskz_reduce_pbh".}

## [Macro Original]
## #define _mm512_reduce_pbh(A, B)					      \
## (__builtin_ia32_reducebf16512_mask ((A), (B),			      \
## (__v32bf) _mm512_setzero_si512 (),   \
## (__mmask32) -1))

## [Macro Original]
## #define _mm512_mask_reduce_pbh(A, B, C, D)				      \
## (__builtin_ia32_reducebf16512_mask ((C), (D), (A), (B)))

## [Macro Original]
## #define _mm512_maskz_reduce_pbh(A, B, C)				      \
## (__builtin_ia32_reducebf16512_mask ((B), (C),			      \
## (__v32bf) _mm512_setzero_si512 (),      \
## (A)))

## [Macro Original]
## #define _mm256_reduce_pbh(A, B)					      \
## (__builtin_ia32_reducebf16256_mask ((A), (B),			      \
## (__v16bf) _mm256_setzero_si256 (),      \
## (__mmask16) -1))

## [Macro Original]
## #define _mm256_mask_reduce_pbh(A, B, C, D)				      \
## (__builtin_ia32_reducebf16256_mask ((C), (D), (A), (B)))

## [Macro Original]
## #define _mm256_maskz_reduce_pbh(A, B, C)				      \
## (__builtin_ia32_reducebf16256_mask ((B), (C),			      \
## (__v16bf) _mm256_setzero_si256 (),      \
## (A)))

## [Macro Original]
## #define _mm_reduce_pbh(A, B)						      \
## (__builtin_ia32_reducebf16128_mask ((A), (B),			      \
## (__v8bf) _mm_setzero_si128 (),	      \
## (__mmask8) -1))

## [Macro Original]
## #define _mm_mask_reduce_pbh(A, B, C, D)				      \
## (__builtin_ia32_reducebf16128_mask ((C), (D), (A), (B)))

## [Macro Original]
## #define _mm_maskz_reduce_pbh(A, B, C)					      \
## (__builtin_ia32_reducebf16128_mask ((B), (C),			      \
## (__v8bf) _mm_setzero_si128 (),	      \
## (A)))
#[
func mm512_getmant_pbh*(a: M512bh, b: _MM_MANTISSA_NORM_ENUM, c: _MM_MANTISSA_SIGN_ENUM): M512bh {.importc: "_mm512_getmant_pbh".}

func mm512_mask_getmant_pbh*(w: M512bh, u: MMask32, a: M512bh, b: _MM_MANTISSA_NORM_ENUM, c: _MM_MANTISSA_SIGN_ENUM): M512bh {.importc: "_mm512_mask_getmant_pbh".}

func mm512_maskz_getmant_pbh*(u: MMask32, a: M512bh, b: _MM_MANTISSA_NORM_ENUM, c: _MM_MANTISSA_SIGN_ENUM): M512bh {.importc: "_mm512_maskz_getmant_pbh".}

func mm256_getmant_pbh*(a: M256bh, b: _MM_MANTISSA_NORM_ENUM, c: _MM_MANTISSA_SIGN_ENUM): M256bh {.importc: "_mm256_getmant_pbh".}

func mm256_mask_getmant_pbh*(w: M256bh, u: MMask16, a: M256bh, b: _MM_MANTISSA_NORM_ENUM, c: _MM_MANTISSA_SIGN_ENUM): M256bh {.importc: "_mm256_mask_getmant_pbh".}

func mm256_maskz_getmant_pbh*(u: MMask16, a: M256bh, b: _MM_MANTISSA_NORM_ENUM, c: _MM_MANTISSA_SIGN_ENUM): M256bh {.importc: "_mm256_maskz_getmant_pbh".}

func mm_getmant_pbh*(a: M128bh, b: _MM_MANTISSA_NORM_ENUM, c: _MM_MANTISSA_SIGN_ENUM): M128bh {.importc: "_mm_getmant_pbh".}

func mm_mask_getmant_pbh*(w: M128bh, u: MMask8, a: M128bh, b: _MM_MANTISSA_NORM_ENUM, c: _MM_MANTISSA_SIGN_ENUM): M128bh {.importc: "_mm_mask_getmant_pbh".}

func mm_maskz_getmant_pbh*(u: MMask8, a: M128bh, b: _MM_MANTISSA_NORM_ENUM, c: _MM_MANTISSA_SIGN_ENUM): M128bh {.importc: "_mm_maskz_getmant_pbh".}
]#
## [Macro Original]
## #define _mm512_getmant_pbh(A, B, C)					      \
## (__builtin_ia32_getmantbf16512_mask ((A), (int)(((C)<<2) | (B)),	      \
## (__v32bf) _mm512_setzero_si512 (),     \
## (__mmask32) -1))

## [Macro Original]
## #define _mm512_mask_getmant_pbh(A, B, C, D, E)				      \
## (__builtin_ia32_getmantbf16512_mask ((C), (int)(((D)<<2) | (E)), (A), (B)))

## [Macro Original]
## #define _mm512_maskz_getmant_pbh(A, B, C, D)				      \
## (__builtin_ia32_getmantbf16512_mask ((B), (int)(((C)<<2) | (D)),	      \
## (__v32bf) _mm512_setzero_si512 (),     \
## (A)))

## [Macro Original]
## #define _mm256_getmant_pbh(A, B, C)					      \
## (__builtin_ia32_getmantbf16256_mask ((A), (int)(((C)<<2) | (B)),	      \
## (__v16bf) _mm256_setzero_si256 (),     \
## (__mmask16) (-1)))

## [Macro Original]
## #define _mm256_mask_getmant_pbh(A, B, C, D, E)				      \
## (__builtin_ia32_getmantbf16256_mask ((C), (int)(((D)<<2) | (E)), (A), (B)))

## [Macro Original]
## #define _mm256_maskz_getmant_pbh(A, B, C, D)				      \
## (__builtin_ia32_getmantbf16256_mask ((B), (int)(((C)<<2) | (D)),	      \
## (__v16bf) _mm256_setzero_si256 (),     \
## (A)))

## [Macro Original]
## #define _mm_getmant_pbh(A, B, C)					      \
## (__builtin_ia32_getmantbf16128_mask ((A), (int)(((C)<<2) | (B)),	      \
## (__v8bf) _mm_setzero_si128 (),	      \
## (__mmask8) (-1)))

## [Macro Original]
## #define _mm_mask_getmant_pbh(A, B, C, D, E)				      \
## (__builtin_ia32_getmantbf16128_mask ((C), (int)(((D)<<2) | (E)), (A), (B)))

## [Macro Original]
## #define _mm_maskz_getmant_pbh(A, B, C, D)				      \
## (__builtin_ia32_getmantbf16128_mask ((B), (int)(((C)<<2) | (D)),	      \
## (__v8bf) _mm_setzero_si128 (), (A)))

func mm512_mask_fpclass_pbh_mask*(u: MMask32, a: M512bh, imm: int32): MMask32 {.importc: "_mm512_mask_fpclass_pbh_mask".}

func mm512_fpclass_pbh_mask*(a: M512bh, imm: int32): MMask32 {.importc: "_mm512_fpclass_pbh_mask".}

func mm256_mask_fpclass_pbh_mask*(u: MMask16, a: M256bh, imm: int32): MMask16 {.importc: "_mm256_mask_fpclass_pbh_mask".}

func mm256_fpclass_pbh_mask*(a: M256bh, imm: int32): MMask16 {.importc: "_mm256_fpclass_pbh_mask".}

func mm_mask_fpclass_pbh_mask*(u: MMask8, a: M128bh, imm: int32): MMask8 {.importc: "_mm_mask_fpclass_pbh_mask".}

func mm_fpclass_pbh_mask*(a: M128bh, imm: int32): MMask8 {.importc: "_mm_fpclass_pbh_mask".}

## [Macro Original]
## #define _mm512_mask_fpclass_pbh_mask(U, X, C)				   \
## ((__mmask32) __builtin_ia32_fpclassbf16512_mask (			   \
## (__v32bf) (__m512bh) (X), (int) (C), (__mmask32) (U)))

## [Macro Original]
## #define _mm512_fpclass_pbh_mask(X, C)					   \
## ((__mmask32) __builtin_ia32_fpclassbf16512_mask (			   \
## (__v32bf) (__m512bh) (X), (int) (C), (__mmask32) (-1)))

## [Macro Original]
## #define _mm256_mask_fpclass_pbh_mask(U, A, B)			      \
## ((__mmask16) __builtin_ia32_fpclassbf16256_mask ((A), (B), (U)))

## [Macro Original]
## #define _mm256_fpclass_pbh_mask(A, B)				      \
## ((__mmask16) __builtin_ia32_fpclassbf16256_mask ((A), (B),	      \
## (__mmask16) (-1)))

## [Macro Original]
## #define _mm_mask_fpclass_pbh_mask(U, A, B)			      \
## ((__mmask8) __builtin_ia32_fpclassbf16128_mask ((A), (B), (U)))

## [Macro Original]
## #define _mm_fpclass_pbh_mask(A, B)				      \
## ((__mmask8) __builtin_ia32_fpclassbf16128_mask ((A), (B),	      \
## (__mmask8) (-1)))

func mm512_mask_cmp_pbh_mask*(u: MMask32, a: M512bh, b: M512bh, imm: int32): MMask32 {.importc: "_mm512_mask_cmp_pbh_mask".}

func mm512_cmp_pbh_mask*(a: M512bh, b: M512bh, imm: int32): MMask32 {.importc: "_mm512_cmp_pbh_mask".}

func mm256_mask_cmp_pbh_mask*(u: MMask16, a: M256bh, b: M256bh, imm: int32): MMask16 {.importc: "_mm256_mask_cmp_pbh_mask".}

func mm256_cmp_pbh_mask*(a: M256bh, b: M256bh, imm: int32): MMask16 {.importc: "_mm256_cmp_pbh_mask".}

func mm_mask_cmp_pbh_mask*(u: MMask8, a: M128bh, b: M128bh, imm: int32): MMask8 {.importc: "_mm_mask_cmp_pbh_mask".}

func mm_cmp_pbh_mask*(a: M128bh, b: M128bh, imm: int32): MMask8 {.importc: "_mm_cmp_pbh_mask".}

## [Macro Original]
## #define _mm512_mask_cmp_pbh_mask(A, B, C, D)				\
## ((__mmask32) __builtin_ia32_cmpbf16512_mask ((B), (C), (D), (A)))

## [Macro Original]
## #define _mm512_cmp_pbh_mask(A, B, C)					\
## ((__mmask32) __builtin_ia32_cmpbf16512_mask ((A), (B), (C), (-1)))

## [Macro Original]
## #define _mm256_mask_cmp_pbh_mask(A, B, C, D)			      \
## ((__mmask16) __builtin_ia32_cmpbf16256_mask ((B), (C), (D), (A)))

## [Macro Original]
## #define _mm256_cmp_pbh_mask(A, B, C)				      \
## ((__mmask16) __builtin_ia32_cmpbf16256_mask ((A), (B), (C),	      \
## (__mmask16) (-1)))

## [Macro Original]
## #define _mm_mask_cmp_pbh_mask(A, B, C, D)			      \
## ((__mmask8) __builtin_ia32_cmpbf16128_mask ((B), (C), (D), (A)))

## [Macro Original]
## #define _mm_cmp_pbh_mask(A, B, C)				      \
## ((__mmask8) __builtin_ia32_cmpbf16128_mask ((A), (B), (C),	      \
## (__mmask8) (-1)))

func mm_comieq_sbh*(a: M128bh, b: M128bh): int32 {.importc: "_mm_comieq_sbh".}

func mm_comilt_sbh*(a: M128bh, b: M128bh): int32 {.importc: "_mm_comilt_sbh".}

func mm_comile_sbh*(a: M128bh, b: M128bh): int32 {.importc: "_mm_comile_sbh".}

func mm_comigt_sbh*(a: M128bh, b: M128bh): int32 {.importc: "_mm_comigt_sbh".}

func mm_comige_sbh*(a: M128bh, b: M128bh): int32 {.importc: "_mm_comige_sbh".}

func mm_comineq_sbh*(a: M128bh, b: M128bh): int32 {.importc: "_mm_comineq_sbh".}

## [Macro Original]
## #define _AVX10_2CONVERTINTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_AVX10_2__

func mm_cvtx2ps_ph*(a: M128, b: M128): M128h {.importc: "_mm_cvtx2ps_ph".}

func mm_mask_cvtx2ps_ph*(w: M128h, u: MMask8, a: M128, b: M128): M128h {.importc: "_mm_mask_cvtx2ps_ph".}

func mm_maskz_cvtx2ps_ph*(u: MMask8, a: M128, b: M128): M128h {.importc: "_mm_maskz_cvtx2ps_ph".}

func mm256_cvtx2ps_ph*(a: M256, b: M256): M256h {.importc: "_mm256_cvtx2ps_ph".}

func mm256_mask_cvtx2ps_ph*(w: M256h, u: MMask16, a: M256, b: M256): M256h {.importc: "_mm256_mask_cvtx2ps_ph".}

func mm256_maskz_cvtx2ps_ph*(u: MMask16, a: M256, b: M256): M256h {.importc: "_mm256_maskz_cvtx2ps_ph".}

func mm512_cvtx2ps_ph*(a: M512, b: M512): M512h {.importc: "_mm512_cvtx2ps_ph".}

func mm512_mask_cvtx2ps_ph*(w: M512h, u: MMask32, a: M512, b: M512): M512h {.importc: "_mm512_mask_cvtx2ps_ph".}

func mm512_maskz_cvtx2ps_ph*(u: MMask32, a: M512, b: M512): M512h {.importc: "_mm512_maskz_cvtx2ps_ph".}

func mm512_cvtx_round2ps_ph*(a: M512, b: M512, r: int32): M512h {.importc: "_mm512_cvtx_round2ps_ph".}

func mm512_mask_cvtx_round2ps_ph*(w: M512h, u: MMask32, a: M512, b: M512, r: int32): M512h {.importc: "_mm512_mask_cvtx_round2ps_ph".}

func mm512_maskz_cvtx_round2ps_ph*(u: MMask32, a: M512, b: M512, r: int32): M512h {.importc: "_mm512_maskz_cvtx_round2ps_ph".}

## [Macro Original]
## #define _mm512_cvtx_round2ps_ph(A, B, R) \
## ((__m512h) __builtin_ia32_vcvt2ps2phx512_mask_round ((__v16sf) (A), \
## (__v16sf) (B), \
## (__v32hf) \
## (_mm512_setzero_ph ()), \
## (__mmask32) (-1), \
## (R)))

## [Macro Original]
## #define _mm512_mask_cvtx_round2ps_ph(W, U, A, B, R) \
## ((__m512h) __builtin_ia32_vcvt2ps2phx512_mask_round ((__v16sf) (A), \
## (__v16sf) (B), \
## (__v32hf) (W), \
## (__mmask32) (U), \
## (R)))

## [Macro Original]
## #define _mm512_maskz_cvtx_round2ps_ph(U, A, B, R) \
## ((__m512h) __builtin_ia32_vcvt2ps2phx512_mask_round ((__v16sf) (A), \
## (__v16sf) (B), \
## (__v32hf) \
## (_mm512_setzero_ph ()), \
## (__mmask32) (U), \
## (R)))

func mm_cvtbiasph_bf8*(a: M128i, b: M128h): M128i {.importc: "_mm_cvtbiasph_bf8".}

func mm_mask_cvtbiasph_bf8*(w: M128i, u: MMask8, a: M128i, b: M128h): M128i {.importc: "_mm_mask_cvtbiasph_bf8".}

func mm_maskz_cvtbiasph_bf8*(u: MMask8, a: M128i, b: M128h): M128i {.importc: "_mm_maskz_cvtbiasph_bf8".}

func mm256_cvtbiasph_bf8*(a: M256i, b: M256h): M128i {.importc: "_mm256_cvtbiasph_bf8".}

func mm256_mask_cvtbiasph_bf8*(w: M128i, u: MMask16, a: M256i, b: M256h): M128i {.importc: "_mm256_mask_cvtbiasph_bf8".}

func mm256_maskz_cvtbiasph_bf8*(u: MMask16, a: M256i, b: M256h): M128i {.importc: "_mm256_maskz_cvtbiasph_bf8".}

func mm512_cvtbiasph_bf8*(a: M512i, b: M512h): M256i {.importc: "_mm512_cvtbiasph_bf8".}

func mm512_mask_cvtbiasph_bf8*(w: M256i, u: MMask32, a: M512i, b: M512h): M256i {.importc: "_mm512_mask_cvtbiasph_bf8".}

func mm512_maskz_cvtbiasph_bf8*(u: MMask32, a: M512i, b: M512h): M256i {.importc: "_mm512_maskz_cvtbiasph_bf8".}

func mm_cvts_biasph_bf8*(a: M128i, b: M128h): M128i {.importc: "_mm_cvts_biasph_bf8".}

func mm_mask_cvts_biasph_bf8*(w: M128i, u: MMask8, a: M128i, b: M128h): M128i {.importc: "_mm_mask_cvts_biasph_bf8".}

func mm_maskz_cvts_biasph_bf8*(u: MMask8, a: M128i, b: M128h): M128i {.importc: "_mm_maskz_cvts_biasph_bf8".}

func mm256_cvts_biasph_bf8*(a: M256i, b: M256h): M128i {.importc: "_mm256_cvts_biasph_bf8".}

func mm256_mask_cvts_biasph_bf8*(w: M128i, u: MMask16, a: M256i, b: M256h): M128i {.importc: "_mm256_mask_cvts_biasph_bf8".}

func mm256_maskz_cvts_biasph_bf8*(u: MMask16, a: M256i, b: M256h): M128i {.importc: "_mm256_maskz_cvts_biasph_bf8".}

func mm512_cvts_biasph_bf8*(a: M512i, b: M512h): M256i {.importc: "_mm512_cvts_biasph_bf8".}

func mm512_mask_cvts_biasph_bf8*(w: M256i, u: MMask32, a: M512i, b: M512h): M256i {.importc: "_mm512_mask_cvts_biasph_bf8".}

func mm512_maskz_cvts_biasph_bf8*(u: MMask32, a: M512i, b: M512h): M256i {.importc: "_mm512_maskz_cvts_biasph_bf8".}

func mm_cvtbiasph_hf8*(a: M128i, b: M128h): M128i {.importc: "_mm_cvtbiasph_hf8".}

func mm_mask_cvtbiasph_hf8*(w: M128i, u: MMask8, a: M128i, b: M128h): M128i {.importc: "_mm_mask_cvtbiasph_hf8".}

func mm_maskz_cvtbiasph_hf8*(u: MMask8, a: M128i, b: M128h): M128i {.importc: "_mm_maskz_cvtbiasph_hf8".}

func mm256_cvtbiasph_hf8*(a: M256i, b: M256h): M128i {.importc: "_mm256_cvtbiasph_hf8".}

func mm256_mask_cvtbiasph_hf8*(w: M128i, u: MMask16, a: M256i, b: M256h): M128i {.importc: "_mm256_mask_cvtbiasph_hf8".}

func mm256_maskz_cvtbiasph_hf8*(u: MMask16, a: M256i, b: M256h): M128i {.importc: "_mm256_maskz_cvtbiasph_hf8".}

func mm512_cvtbiasph_hf8*(a: M512i, b: M512h): M256i {.importc: "_mm512_cvtbiasph_hf8".}

func mm512_mask_cvtbiasph_hf8*(w: M256i, u: MMask32, a: M512i, b: M512h): M256i {.importc: "_mm512_mask_cvtbiasph_hf8".}

func mm512_maskz_cvtbiasph_hf8*(u: MMask32, a: M512i, b: M512h): M256i {.importc: "_mm512_maskz_cvtbiasph_hf8".}

func mm_cvts_biasph_hf8*(a: M128i, b: M128h): M128i {.importc: "_mm_cvts_biasph_hf8".}

func mm_mask_cvts_biasph_hf8*(w: M128i, u: MMask8, a: M128i, b: M128h): M128i {.importc: "_mm_mask_cvts_biasph_hf8".}

func mm_maskz_cvts_biasph_hf8*(u: MMask8, a: M128i, b: M128h): M128i {.importc: "_mm_maskz_cvts_biasph_hf8".}

func mm256_cvts_biasph_hf8*(a: M256i, b: M256h): M128i {.importc: "_mm256_cvts_biasph_hf8".}

func mm256_mask_cvts_biasph_hf8*(w: M128i, u: MMask16, a: M256i, b: M256h): M128i {.importc: "_mm256_mask_cvts_biasph_hf8".}

func mm256_maskz_cvts_biasph_hf8*(u: MMask16, a: M256i, b: M256h): M128i {.importc: "_mm256_maskz_cvts_biasph_hf8".}

func mm512_cvts_biasph_hf8*(a: M512i, b: M512h): M256i {.importc: "_mm512_cvts_biasph_hf8".}

func mm512_mask_cvts_biasph_hf8*(w: M256i, u: MMask32, a: M512i, b: M512h): M256i {.importc: "_mm512_mask_cvts_biasph_hf8".}

func mm512_maskz_cvts_biasph_hf8*(u: MMask32, a: M512i, b: M512h): M256i {.importc: "_mm512_maskz_cvts_biasph_hf8".}

func mm_cvt2ph_bf8*(a: M128h, b: M128h): M128i {.importc: "_mm_cvt2ph_bf8".}

func mm_mask_cvt2ph_bf8*(w: M128i, u: MMask16, a: M128h, b: M128h): M128i {.importc: "_mm_mask_cvt2ph_bf8".}

func mm_maskz_cvt2ph_bf8*(u: MMask16, a: M128h, b: M128h): M128i {.importc: "_mm_maskz_cvt2ph_bf8".}

func mm256_cvt2ph_bf8*(a: M256h, b: M256h): M256i {.importc: "_mm256_cvt2ph_bf8".}

func mm256_mask_cvt2ph_bf8*(w: M256i, u: MMask32, a: M256h, b: M256h): M256i {.importc: "_mm256_mask_cvt2ph_bf8".}

func mm256_maskz_cvt2ph_bf8*(u: MMask32, a: M256h, b: M256h): M256i {.importc: "_mm256_maskz_cvt2ph_bf8".}

func mm512_cvt2ph_bf8*(a: M512h, b: M512h): M512i {.importc: "_mm512_cvt2ph_bf8".}

func mm512_mask_cvt2ph_bf8*(w: M512i, u: MMask64, a: M512h, b: M512h): M512i {.importc: "_mm512_mask_cvt2ph_bf8".}

func mm512_maskz_cvt2ph_bf8*(u: MMask64, a: M512h, b: M512h): M512i {.importc: "_mm512_maskz_cvt2ph_bf8".}

func mm_cvts_2ph_bf8*(a: M128h, b: M128h): M128i {.importc: "_mm_cvts_2ph_bf8".}

func mm_mask_cvts_2ph_bf8*(w: M128i, u: MMask16, a: M128h, b: M128h): M128i {.importc: "_mm_mask_cvts_2ph_bf8".}

func mm_maskz_cvts_2ph_bf8*(u: MMask16, a: M128h, b: M128h): M128i {.importc: "_mm_maskz_cvts_2ph_bf8".}

func mm256_cvts_2ph_bf8*(a: M256h, b: M256h): M256i {.importc: "_mm256_cvts_2ph_bf8".}

func mm256_mask_cvts_2ph_bf8*(w: M256i, u: MMask32, a: M256h, b: M256h): M256i {.importc: "_mm256_mask_cvts_2ph_bf8".}

func mm256_maskz_cvts_2ph_bf8*(u: MMask32, a: M256h, b: M256h): M256i {.importc: "_mm256_maskz_cvts_2ph_bf8".}

func mm512_cvts_2ph_bf8*(a: M512h, b: M512h): M512i {.importc: "_mm512_cvts_2ph_bf8".}

func mm512_mask_cvts_2ph_bf8*(w: M512i, u: MMask64, a: M512h, b: M512h): M512i {.importc: "_mm512_mask_cvts_2ph_bf8".}

func mm512_maskz_cvts_2ph_bf8*(u: MMask64, a: M512h, b: M512h): M512i {.importc: "_mm512_maskz_cvts_2ph_bf8".}

func mm_cvt2ph_hf8*(a: M128h, b: M128h): M128i {.importc: "_mm_cvt2ph_hf8".}

func mm_mask_cvt2ph_hf8*(w: M128i, u: MMask16, a: M128h, b: M128h): M128i {.importc: "_mm_mask_cvt2ph_hf8".}

func mm_maskz_cvt2ph_hf8*(u: MMask16, a: M128h, b: M128h): M128i {.importc: "_mm_maskz_cvt2ph_hf8".}

func mm256_cvt2ph_hf8*(a: M256h, b: M256h): M256i {.importc: "_mm256_cvt2ph_hf8".}

func mm256_mask_cvt2ph_hf8*(w: M256i, u: MMask32, a: M256h, b: M256h): M256i {.importc: "_mm256_mask_cvt2ph_hf8".}

func mm256_maskz_cvt2ph_hf8*(u: MMask32, a: M256h, b: M256h): M256i {.importc: "_mm256_maskz_cvt2ph_hf8".}

func mm512_cvt2ph_hf8*(a: M512h, b: M512h): M512i {.importc: "_mm512_cvt2ph_hf8".}

func mm512_mask_cvt2ph_hf8*(w: M512i, u: MMask64, a: M512h, b: M512h): M512i {.importc: "_mm512_mask_cvt2ph_hf8".}

func mm512_maskz_cvt2ph_hf8*(u: MMask64, a: M512h, b: M512h): M512i {.importc: "_mm512_maskz_cvt2ph_hf8".}

func mm_cvts_2ph_hf8*(a: M128h, b: M128h): M128i {.importc: "_mm_cvts_2ph_hf8".}

func mm_mask_cvts_2ph_hf8*(w: M128i, u: MMask16, a: M128h, b: M128h): M128i {.importc: "_mm_mask_cvts_2ph_hf8".}

func mm_maskz_cvts_2ph_hf8*(u: MMask16, a: M128h, b: M128h): M128i {.importc: "_mm_maskz_cvts_2ph_hf8".}

func mm256_cvts_2ph_hf8*(a: M256h, b: M256h): M256i {.importc: "_mm256_cvts_2ph_hf8".}

func mm256_mask_cvts_2ph_hf8*(w: M256i, u: MMask32, a: M256h, b: M256h): M256i {.importc: "_mm256_mask_cvts_2ph_hf8".}

func mm256_maskz_cvts_2ph_hf8*(u: MMask32, a: M256h, b: M256h): M256i {.importc: "_mm256_maskz_cvts_2ph_hf8".}

func mm512_cvts_2ph_hf8*(a: M512h, b: M512h): M512i {.importc: "_mm512_cvts_2ph_hf8".}

func mm512_mask_cvts_2ph_hf8*(w: M512i, u: MMask64, a: M512h, b: M512h): M512i {.importc: "_mm512_mask_cvts_2ph_hf8".}

func mm512_maskz_cvts_2ph_hf8*(u: MMask64, a: M512h, b: M512h): M512i {.importc: "_mm512_maskz_cvts_2ph_hf8".}

func mm_cvthf8_ph*(a: M128i): M128h {.importc: "_mm_cvthf8_ph".}

func mm_mask_cvthf8_ph*(w: M128h, u: MMask8, a: M128i): M128h {.importc: "_mm_mask_cvthf8_ph".}

func mm_maskz_cvthf8_ph*(u: MMask8, a: M128i): M128h {.importc: "_mm_maskz_cvthf8_ph".}

func mm256_cvthf8_ph*(a: M128i): M256h {.importc: "_mm256_cvthf8_ph".}

func mm256_mask_cvthf8_ph*(w: M256h, u: MMask16, a: M128i): M256h {.importc: "_mm256_mask_cvthf8_ph".}

func mm256_maskz_cvthf8_ph*(u: MMask16, a: M128i): M256h {.importc: "_mm256_maskz_cvthf8_ph".}

func mm512_cvthf8_ph*(a: M256i): M512h {.importc: "_mm512_cvthf8_ph".}

func mm512_mask_cvthf8_ph*(w: M512h, u: MMask32, a: M256i): M512h {.importc: "_mm512_mask_cvthf8_ph".}

func mm512_maskz_cvthf8_ph*(u: MMask32, a: M256i): M512h {.importc: "_mm512_maskz_cvthf8_ph".}

func mm_cvtph_bf8*(a: M128h): M128i {.importc: "_mm_cvtph_bf8".}

func mm_mask_cvtph_bf8*(w: M128i, u: MMask8, a: M128h): M128i {.importc: "_mm_mask_cvtph_bf8".}

func mm_maskz_cvtph_bf8*(u: MMask8, a: M128h): M128i {.importc: "_mm_maskz_cvtph_bf8".}

func mm256_cvtph_bf8*(a: M256h): M128i {.importc: "_mm256_cvtph_bf8".}

func mm256_mask_cvtph_bf8*(w: M128i, u: MMask16, a: M256h): M128i {.importc: "_mm256_mask_cvtph_bf8".}

func mm256_maskz_cvtph_bf8*(u: MMask16, a: M256h): M128i {.importc: "_mm256_maskz_cvtph_bf8".}

func mm512_cvtph_bf8*(a: M512h): M256i {.importc: "_mm512_cvtph_bf8".}

func mm512_mask_cvtph_bf8*(w: M256i, u: MMask32, a: M512h): M256i {.importc: "_mm512_mask_cvtph_bf8".}

func mm512_maskz_cvtph_bf8*(u: MMask32, a: M512h): M256i {.importc: "_mm512_maskz_cvtph_bf8".}

func mm_cvts_ph_bf8*(a: M128h): M128i {.importc: "_mm_cvts_ph_bf8".}

func mm_mask_cvts_ph_bf8*(w: M128i, u: MMask8, a: M128h): M128i {.importc: "_mm_mask_cvts_ph_bf8".}

func mm_maskz_cvts_ph_bf8*(u: MMask8, a: M128h): M128i {.importc: "_mm_maskz_cvts_ph_bf8".}

func mm256_cvts_ph_bf8*(a: M256h): M128i {.importc: "_mm256_cvts_ph_bf8".}

func mm256_mask_cvts_ph_bf8*(w: M128i, u: MMask16, a: M256h): M128i {.importc: "_mm256_mask_cvts_ph_bf8".}

func mm256_maskz_cvts_ph_bf8*(u: MMask16, a: M256h): M128i {.importc: "_mm256_maskz_cvts_ph_bf8".}

func mm512_cvts_ph_bf8*(a: M512h): M256i {.importc: "_mm512_cvts_ph_bf8".}

func mm512_mask_cvts_ph_bf8*(w: M256i, u: MMask32, a: M512h): M256i {.importc: "_mm512_mask_cvts_ph_bf8".}

func mm512_maskz_cvts_ph_bf8*(u: MMask32, a: M512h): M256i {.importc: "_mm512_maskz_cvts_ph_bf8".}

func mm_cvtph_hf8*(a: M128h): M128i {.importc: "_mm_cvtph_hf8".}

func mm_mask_cvtph_hf8*(w: M128i, u: MMask8, a: M128h): M128i {.importc: "_mm_mask_cvtph_hf8".}

func mm_maskz_cvtph_hf8*(u: MMask8, a: M128h): M128i {.importc: "_mm_maskz_cvtph_hf8".}

func mm256_cvtph_hf8*(a: M256h): M128i {.importc: "_mm256_cvtph_hf8".}

func mm256_mask_cvtph_hf8*(w: M128i, u: MMask16, a: M256h): M128i {.importc: "_mm256_mask_cvtph_hf8".}

func mm256_maskz_cvtph_hf8*(u: MMask16, a: M256h): M128i {.importc: "_mm256_maskz_cvtph_hf8".}

func mm512_cvtph_hf8*(a: M512h): M256i {.importc: "_mm512_cvtph_hf8".}

func mm512_mask_cvtph_hf8*(w: M256i, u: MMask32, a: M512h): M256i {.importc: "_mm512_mask_cvtph_hf8".}

func mm512_maskz_cvtph_hf8*(u: MMask32, a: M512h): M256i {.importc: "_mm512_maskz_cvtph_hf8".}

func mm_cvts_ph_hf8*(a: M128h): M128i {.importc: "_mm_cvts_ph_hf8".}

func mm_mask_cvts_ph_hf8*(w: M128i, u: MMask8, a: M128h): M128i {.importc: "_mm_mask_cvts_ph_hf8".}

func mm_maskz_cvts_ph_hf8*(u: MMask8, a: M128h): M128i {.importc: "_mm_maskz_cvts_ph_hf8".}

func mm256_cvts_ph_hf8*(a: M256h): M128i {.importc: "_mm256_cvts_ph_hf8".}

func mm256_mask_cvts_ph_hf8*(w: M128i, u: MMask16, a: M256h): M128i {.importc: "_mm256_mask_cvts_ph_hf8".}

func mm256_maskz_cvts_ph_hf8*(u: MMask16, a: M256h): M128i {.importc: "_mm256_maskz_cvts_ph_hf8".}

func mm512_cvts_ph_hf8*(a: M512h): M256i {.importc: "_mm512_cvts_ph_hf8".}

func mm512_mask_cvts_ph_hf8*(w: M256i, u: MMask32, a: M512h): M256i {.importc: "_mm512_mask_cvts_ph_hf8".}

func mm512_maskz_cvts_ph_hf8*(u: MMask32, a: M512h): M256i {.importc: "_mm512_maskz_cvts_ph_hf8".}

func mm_cvtbf8_ph*(a: M128i): M128h {.importc: "_mm_cvtbf8_ph".}

func mm_mask_cvtbf8_ph*(s: M128h, u: MMask8, a: M128i): M128h {.importc: "_mm_mask_cvtbf8_ph".}

func mm_maskz_cvtbf8_ph*(u: MMask8, a: M128i): M128h {.importc: "_mm_maskz_cvtbf8_ph".}

func mm256_cvtbf8_ph*(a: M128i): M256h {.importc: "_mm256_cvtbf8_ph".}

func mm256_mask_cvtbf8_ph*(s: M256h, u: MMask16, a: M128i): M256h {.importc: "_mm256_mask_cvtbf8_ph".}

func mm256_maskz_cvtbf8_ph*(u: MMask16, a: M128i): M256h {.importc: "_mm256_maskz_cvtbf8_ph".}

func mm512_cvtbf8_ph*(a: M256i): M512h {.importc: "_mm512_cvtbf8_ph".}

func mm512_mask_cvtbf8_ph*(s: M512h, u: MMask32, a: M256i): M512h {.importc: "_mm512_mask_cvtbf8_ph".}

func mm512_maskz_cvtbf8_ph*(u: MMask32, a: M256i): M512h {.importc: "_mm512_maskz_cvtbf8_ph".}

## [Macro Original]
## #define _AVX10_2COPYINTRIN_H_INCLUDED

func mm_move_epi32*(a: M128i): M128i {.importc: "_mm_move_epi32".}

func mm_move_epi16*(a: M128i): M128i {.importc: "_mm_move_epi16".}

## [Macro Original]
## #define _AVX10_2MEDIAINTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_AVX10_2__

## [Macro Original]
## #define _mm_dpbssd_epi32(W, A, B) \
## (__m128i) __builtin_ia32_vpdpbssd128 ((__v4si) (W), (__v4si) (A), (__v4si) (B))

## [Macro Original]
## #define _mm_dpbssds_epi32(W, A, B) \
## (__m128i) __builtin_ia32_vpdpbssds128 ((__v4si) (W), (__v4si) (A), (__v4si) (B))

## [Macro Original]
## #define _mm_dpbsud_epi32(W, A, B) \
## (__m128i) __builtin_ia32_vpdpbsud128 ((__v4si) (W), (__v4si) (A), (__v4si) (B))

## [Macro Original]
## #define _mm_dpbsuds_epi32(W, A, B) \
## (__m128i) __builtin_ia32_vpdpbsuds128 ((__v4si) (W), (__v4si) (A), (__v4si) (B))

## [Macro Original]
## #define _mm_dpbuud_epi32(W, A, B) \
## (__m128i) __builtin_ia32_vpdpbuud128 ((__v4si) (W), (__v4si) (A), (__v4si) (B))

## [Macro Original]
## #define _mm_dpbuuds_epi32(W, A, B) \
## (__m128i) __builtin_ia32_vpdpbuuds128 ((__v4si) (W), (__v4si) (A), (__v4si) (B))

## [Macro Original]
## #define _mm256_dpbssd_epi32(W, A, B) \
## (__m256i) __builtin_ia32_vpdpbssd256 ((__v8si) (W), (__v8si) (A), (__v8si) (B))

## [Macro Original]
## #define _mm256_dpbssds_epi32(W, A, B) \
## (__m256i) __builtin_ia32_vpdpbssds256 ((__v8si) (W), (__v8si) (A), (__v8si) (B))

## [Macro Original]
## #define _mm256_dpbsud_epi32(W, A, B) \
## (__m256i) __builtin_ia32_vpdpbsud256 ((__v8si) (W), (__v8si) (A), (__v8si) (B))

## [Macro Original]
## #define _mm256_dpbsuds_epi32(W, A, B) \
## (__m256i) __builtin_ia32_vpdpbsuds256 ((__v8si) (W), (__v8si) (A), (__v8si) (B))

## [Macro Original]
## #define _mm256_dpbuud_epi32(W, A, B) \
## (__m256i) __builtin_ia32_vpdpbuud256 ((__v8si) (W), (__v8si) (A), (__v8si) (B))

## [Macro Original]
## #define _mm256_dpbuuds_epi32(W, A, B) \
## (__m256i) __builtin_ia32_vpdpbuuds256 ((__v8si) (W), (__v8si) (A), (__v8si) (B))

## [Macro Original]
## #define _mm_dpwsud_epi32(W, A, B) \
## (__m128i) __builtin_ia32_vpdpwsud128 ((__v4si) (W), (__v4si) (A), (__v4si) (B))

## [Macro Original]
## #define _mm_dpwsuds_epi32(W, A, B) \
## (__m128i) __builtin_ia32_vpdpwsuds128 ((__v4si) (W), (__v4si) (A), (__v4si) (B))

## [Macro Original]
## #define _mm_dpwusd_epi32(W, A, B) \
## (__m128i) __builtin_ia32_vpdpwusd128 ((__v4si) (W), (__v4si) (A), (__v4si) (B))

## [Macro Original]
## #define _mm_dpwusds_epi32(W, A, B) \
## (__m128i) __builtin_ia32_vpdpwusds128 ((__v4si) (W), (__v4si) (A), (__v4si) (B))

## [Macro Original]
## #define _mm_dpwuud_epi32(W, A, B) \
## (__m128i) __builtin_ia32_vpdpwuud128 ((__v4si) (W), (__v4si) (A), (__v4si) (B))

## [Macro Original]
## #define _mm_dpwuuds_epi32(W, A, B) \
## (__m128i) __builtin_ia32_vpdpwuuds128 ((__v4si) (W), (__v4si) (A), (__v4si) (B))

## [Macro Original]
## #define _mm256_dpwsud_epi32(W, A, B) \
## (__m256i) __builtin_ia32_vpdpwsud256 ((__v8si) (W), (__v8si) (A), (__v8si) (B))

## [Macro Original]
## #define _mm256_dpwsuds_epi32(W, A, B) \
## (__m256i) __builtin_ia32_vpdpwsuds256 ((__v8si) (W), (__v8si) (A), (__v8si) (B))

## [Macro Original]
## #define _mm256_dpwusd_epi32(W, A, B) \
## (__m256i) __builtin_ia32_vpdpwusd256 ((__v8si) (W), (__v8si) (A), (__v8si) (B))

## [Macro Original]
## #define _mm256_dpwusds_epi32(W, A, B) \
## (__m256i) __builtin_ia32_vpdpwusds256 ((__v8si) (W), (__v8si) (A), (__v8si) (B))

## [Macro Original]
## #define _mm256_dpwuud_epi32(W, A, B) \
## (__m256i) __builtin_ia32_vpdpwuud256 ((__v8si) (W), (__v8si) (A), (__v8si) (B))

## [Macro Original]
## #define _mm256_dpwuuds_epi32(W, A, B) \
## (__m256i) __builtin_ia32_vpdpwuuds256 ((__v8si) (W), (__v8si) (A), (__v8si) (B))

func mm_mask_dpbssd_epi32*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_dpbssd_epi32".}

func mm_maskz_dpbssd_epi32*(u: MMask8, w: M128i, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_dpbssd_epi32".}

func mm_mask_dpbssds_epi32*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_dpbssds_epi32".}

func mm_maskz_dpbssds_epi32*(u: MMask8, w: M128i, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_dpbssds_epi32".}

func mm_mask_dpbsud_epi32*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_dpbsud_epi32".}

func mm_maskz_dpbsud_epi32*(u: MMask8, w: M128i, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_dpbsud_epi32".}

func mm_mask_dpbsuds_epi32*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_dpbsuds_epi32".}

func mm_maskz_dpbsuds_epi32*(u: MMask8, w: M128i, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_dpbsuds_epi32".}

func mm_mask_dpbuud_epi32*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_dpbuud_epi32".}

func mm_maskz_dpbuud_epi32*(u: MMask8, w: M128i, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_dpbuud_epi32".}

func mm_mask_dpbuuds_epi32*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_dpbuuds_epi32".}

func mm_maskz_dpbuuds_epi32*(u: MMask8, w: M128i, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_dpbuuds_epi32".}

func mm256_mask_dpbssd_epi32*(w: M256i, u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_dpbssd_epi32".}

func mm256_maskz_dpbssd_epi32*(u: MMask8, w: M256i, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_dpbssd_epi32".}

func mm256_mask_dpbssds_epi32*(w: M256i, u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_dpbssds_epi32".}

func mm256_maskz_dpbssds_epi32*(u: MMask8, w: M256i, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_dpbssds_epi32".}

func mm256_mask_dpbsud_epi32*(w: M256i, u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_dpbsud_epi32".}

func mm256_maskz_dpbsud_epi32*(u: MMask8, w: M256i, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_dpbsud_epi32".}

func mm256_mask_dpbsuds_epi32*(w: M256i, u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_dpbsuds_epi32".}

func mm256_maskz_dpbsuds_epi32*(u: MMask8, w: M256i, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_dpbsuds_epi32".}

func mm256_mask_dpbuud_epi32*(w: M256i, u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_dpbuud_epi32".}

func mm256_maskz_dpbuud_epi32*(u: MMask8, w: M256i, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_dpbuud_epi32".}

func mm256_mask_dpbuuds_epi32*(w: M256i, u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_dpbuuds_epi32".}

func mm256_maskz_dpbuuds_epi32*(u: MMask8, w: M256i, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_dpbuuds_epi32".}

func mm512_dpbssd_epi32*(w: M512i, a: M512i, b: M512i): M512i {.importc: "_mm512_dpbssd_epi32".}

func mm512_mask_dpbssd_epi32*(w: M512i, u: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_dpbssd_epi32".}

func mm512_maskz_dpbssd_epi32*(u: MMask16, w: M512i, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_dpbssd_epi32".}

func mm512_dpbssds_epi32*(w: M512i, a: M512i, b: M512i): M512i {.importc: "_mm512_dpbssds_epi32".}

func mm512_mask_dpbssds_epi32*(w: M512i, u: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_dpbssds_epi32".}

func mm512_maskz_dpbssds_epi32*(u: MMask16, w: M512i, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_dpbssds_epi32".}

func mm512_dpbsud_epi32*(w: M512i, a: M512i, b: M512i): M512i {.importc: "_mm512_dpbsud_epi32".}

func mm512_mask_dpbsud_epi32*(w: M512i, u: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_dpbsud_epi32".}

func mm512_maskz_dpbsud_epi32*(u: MMask16, w: M512i, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_dpbsud_epi32".}

func mm512_dpbsuds_epi32*(w: M512i, a: M512i, b: M512i): M512i {.importc: "_mm512_dpbsuds_epi32".}

func mm512_mask_dpbsuds_epi32*(w: M512i, u: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_dpbsuds_epi32".}

func mm512_maskz_dpbsuds_epi32*(u: MMask16, w: M512i, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_dpbsuds_epi32".}

func mm512_dpbuud_epi32*(w: M512i, a: M512i, b: M512i): M512i {.importc: "_mm512_dpbuud_epi32".}

func mm512_mask_dpbuud_epi32*(w: M512i, u: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_dpbuud_epi32".}

func mm512_maskz_dpbuud_epi32*(u: MMask16, w: M512i, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_dpbuud_epi32".}

func mm512_dpbuuds_epi32*(w: M512i, a: M512i, b: M512i): M512i {.importc: "_mm512_dpbuuds_epi32".}

func mm512_mask_dpbuuds_epi32*(w: M512i, u: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_dpbuuds_epi32".}

func mm512_maskz_dpbuuds_epi32*(u: MMask16, w: M512i, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_dpbuuds_epi32".}

func mm_mask_dpwsud_epi32*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_dpwsud_epi32".}

func mm_maskz_dpwsud_epi32*(u: MMask8, w: M128i, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_dpwsud_epi32".}

func mm_mask_dpwsuds_epi32*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_dpwsuds_epi32".}

func mm_maskz_dpwsuds_epi32*(u: MMask8, w: M128i, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_dpwsuds_epi32".}

func mm_mask_dpwusd_epi32*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_dpwusd_epi32".}

func mm_maskz_dpwusd_epi32*(u: MMask8, w: M128i, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_dpwusd_epi32".}

func mm_mask_dpwusds_epi32*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_dpwusds_epi32".}

func mm_maskz_dpwusds_epi32*(u: MMask8, w: M128i, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_dpwusds_epi32".}

func mm_mask_dpwuud_epi32*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_dpwuud_epi32".}

func mm_maskz_dpwuud_epi32*(u: MMask8, w: M128i, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_dpwuud_epi32".}

func mm_mask_dpwuuds_epi32*(w: M128i, u: MMask8, a: M128i, b: M128i): M128i {.importc: "_mm_mask_dpwuuds_epi32".}

func mm_maskz_dpwuuds_epi32*(u: MMask8, w: M128i, a: M128i, b: M128i): M128i {.importc: "_mm_maskz_dpwuuds_epi32".}

func mm256_mask_dpwsud_epi32*(w: M256i, u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_dpwsud_epi32".}

func mm256_maskz_dpwsud_epi32*(u: MMask8, w: M256i, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_dpwsud_epi32".}

func mm256_mask_dpwsuds_epi32*(w: M256i, u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_dpwsuds_epi32".}

func mm256_maskz_dpwsuds_epi32*(u: MMask8, w: M256i, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_dpwsuds_epi32".}

func mm256_mask_dpwusd_epi32*(w: M256i, u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_dpwusd_epi32".}

func mm256_maskz_dpwusd_epi32*(u: MMask8, w: M256i, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_dpwusd_epi32".}

func mm256_mask_dpwusds_epi32*(w: M256i, u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_dpwusds_epi32".}

func mm256_maskz_dpwusds_epi32*(u: MMask8, w: M256i, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_dpwusds_epi32".}

func mm256_mask_dpwuud_epi32*(w: M256i, u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_dpwuud_epi32".}

func mm256_maskz_dpwuud_epi32*(u: MMask8, w: M256i, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_dpwuud_epi32".}

func mm256_mask_dpwuuds_epi32*(w: M256i, u: MMask8, a: M256i, b: M256i): M256i {.importc: "_mm256_mask_dpwuuds_epi32".}

func mm256_maskz_dpwuuds_epi32*(u: MMask8, w: M256i, a: M256i, b: M256i): M256i {.importc: "_mm256_maskz_dpwuuds_epi32".}

func mm512_dpwsud_epi32*(w: M512i, a: M512i, b: M512i): M512i {.importc: "_mm512_dpwsud_epi32".}

func mm512_mask_dpwsud_epi32*(w: M512i, u: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_dpwsud_epi32".}

func mm512_maskz_dpwsud_epi32*(u: MMask16, w: M512i, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_dpwsud_epi32".}

func mm512_dpwsuds_epi32*(w: M512i, a: M512i, b: M512i): M512i {.importc: "_mm512_dpwsuds_epi32".}

func mm512_mask_dpwsuds_epi32*(w: M512i, u: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_dpwsuds_epi32".}

func mm512_maskz_dpwsuds_epi32*(u: MMask16, w: M512i, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_dpwsuds_epi32".}

func mm512_dpwusd_epi32*(w: M512i, a: M512i, b: M512i): M512i {.importc: "_mm512_dpwusd_epi32".}

func mm512_mask_dpwusd_epi32*(w: M512i, u: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_dpwusd_epi32".}

func mm512_maskz_dpwusd_epi32*(u: MMask16, w: M512i, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_dpwusd_epi32".}

func mm512_dpwusds_epi32*(w: M512i, a: M512i, b: M512i): M512i {.importc: "_mm512_dpwusds_epi32".}

func mm512_mask_dpwusds_epi32*(w: M512i, u: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_dpwusds_epi32".}

func mm512_maskz_dpwusds_epi32*(u: MMask16, w: M512i, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_dpwusds_epi32".}

func mm512_dpwuud_epi32*(w: M512i, a: M512i, b: M512i): M512i {.importc: "_mm512_dpwuud_epi32".}

func mm512_mask_dpwuud_epi32*(w: M512i, u: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_dpwuud_epi32".}

func mm512_maskz_dpwuud_epi32*(u: MMask16, w: M512i, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_dpwuud_epi32".}

func mm512_dpwuuds_epi32*(w: M512i, a: M512i, b: M512i): M512i {.importc: "_mm512_dpwuuds_epi32".}

func mm512_mask_dpwuuds_epi32*(w: M512i, u: MMask16, a: M512i, b: M512i): M512i {.importc: "_mm512_mask_dpwuuds_epi32".}

func mm512_maskz_dpwuuds_epi32*(u: MMask16, w: M512i, a: M512i, b: M512i): M512i {.importc: "_mm512_maskz_dpwuuds_epi32".}

func mm512_dpph_ps*(w: M512, a: M512h, b: M512h): M512 {.importc: "_mm512_dpph_ps".}

func mm512_mask_dpph_ps*(w: M512, u: MMask16, a: M512h, b: M512h): M512 {.importc: "_mm512_mask_dpph_ps".}

func mm512_maskz_dpph_ps*(u: MMask16, w: M512, a: M512h, b: M512h): M512 {.importc: "_mm512_maskz_dpph_ps".}

func mm256_dpph_ps*(w: M256, a: M256h, b: M256h): M256 {.importc: "_mm256_dpph_ps".}

func mm256_mask_dpph_ps*(w: M256, u: MMask8, a: M256h, b: M256h): M256 {.importc: "_mm256_mask_dpph_ps".}

func mm256_maskz_dpph_ps*(u: MMask8, w: M256, a: M256h, b: M256h): M256 {.importc: "_mm256_maskz_dpph_ps".}

func mm_dpph_ps*(w: M128, a: M128h, b: M128h): M128 {.importc: "_mm_dpph_ps".}

func mm_mask_dpph_ps*(w: M128, u: MMask8, a: M128h, b: M128h): M128 {.importc: "_mm_mask_dpph_ps".}

func mm_maskz_dpph_ps*(u: MMask8, w: M128, a: M128h, b: M128h): M128 {.importc: "_mm_maskz_dpph_ps".}

func mm_mask_mpsadbw_epu8*(w: M128i, u: MMask8, x: M128i, y: M128i, m: int32): M128i {.importc: "_mm_mask_mpsadbw_epu8".}

func mm_maskz_mpsadbw_epu8*(u: MMask8, x: M128i, y: M128i, m: int32): M128i {.importc: "_mm_maskz_mpsadbw_epu8".}

func mm256_mask_mpsadbw_epu8*(w: M256i, u: MMask16, x: M256i, y: M256i, m: int32): M256i {.importc: "_mm256_mask_mpsadbw_epu8".}

func mm256_maskz_mpsadbw_epu8*(u: MMask16, x: M256i, y: M256i, m: int32): M256i {.importc: "_mm256_maskz_mpsadbw_epu8".}

func mm512_mpsadbw_epu8*(x: M512i, y: M512i, m: int32): M512i {.importc: "_mm512_mpsadbw_epu8".}

func mm512_mask_mpsadbw_epu8*(w: M512i, u: MMask32, x: M512i, y: M512i, m: int32): M512i {.importc: "_mm512_mask_mpsadbw_epu8".}

func mm512_maskz_mpsadbw_epu8*(u: MMask32, x: M512i, y: M512i, m: int32): M512i {.importc: "_mm512_maskz_mpsadbw_epu8".}

## [Macro Original]
## #define _mm_mask_mpsadbw_epu8(W, U, X, Y, M)				\
## (__m128i) __builtin_ia32_mpsadbw128_mask ((__v16qi)(__m128i)(X),	\
## (__v16qi)(__m128i)(Y),	\
## (int)(M),			\
## (__v8hi)(__m128i)(W),	\
## (__mmask8)(U))

## [Macro Original]
## #define _mm_maskz_mpsadbw_epu8(U, X, Y, M)				\
## (__m128i) __builtin_ia32_mpsadbw128_mask ((__v16qi)(__m128i)(X),	\
## (__v16qi)(__m128i)(Y),	\
## (int)(M),			\
## (__v8hi) _mm_setzero_si128 (),  \
## (__mmask8)(U))

## [Macro Original]
## #define _mm256_mask_mpsadbw_epu8(W, U, X, Y, M)				\
## (__m256i) __builtin_ia32_mpsadbw256_mask ((__v32qi)(__m256i)(X),	\
## (__v32qi)(__m256i)(Y),	\
## (int)(M),			\
## (__v16hi)(__m256i)(W),	\
## (__mmask16)(U))

## [Macro Original]
## #define _mm256_maskz_mpsadbw_epu8(U, X, Y, M)				\
## (__m256i) __builtin_ia32_mpsadbw256_mask ((__v32qi)(__m256i)(X),	\
## (__v32qi)(__m256i)(Y),	\
## (int)(M),			\
## (__v16hi) _mm256_setzero_si256 (),	\
## (__mmask16)(U))

## [Macro Original]
## #define _mm512_mpsadbw_epu8(X, Y, M)					\
## (__m512i) __builtin_ia32_mpsadbw512 ((__v64qi)(__m512i)(X),		\
## (__v64qi)(__m512i)(Y), (int)(M))

## [Macro Original]
## #define _mm512_mask_mpsadbw_epu8(W, U, X, Y, M)				\
## (__m512i) __builtin_ia32_mpsadbw512_mask ((__v64qi)(__m512i)(X),	\
## (__v64qi)(__m512i)(Y),	\
## (int)(M),			\
## (__v32hi)(__m512i)(W),	\
## (__mmask32)(U))

## [Macro Original]
## #define _mm512_maskz_mpsadbw_epu8(U, X, Y, M)				\
## (__m512i) __builtin_ia32_mpsadbw512_mask ((__v64qi)(__m512i)(X),	\
## (__v64qi)(__m512i)(Y),	\
## (int)(M),			\
## (__v32hi) _mm512_setzero_epi32 (),	\
## (__mmask32)(U))
## 
## ## [Macro Original]
## #define _AVX10_2MINMAXINTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_AVX10_2__

func mm_minmax_pbh*(a: M128bh, b: M128bh, c: int32): M128bh {.importc: "_mm_minmax_pbh".}

func mm_mask_minmax_pbh*(w: M128bh, u: MMask8, a: M128bh, b: M128bh, c: int32): M128bh {.importc: "_mm_mask_minmax_pbh".}

func mm_maskz_minmax_pbh*(u: MMask8, a: M128bh, b: M128bh, c: int32): M128bh {.importc: "_mm_maskz_minmax_pbh".}

func mm256_minmax_pbh*(a: M256bh, b: M256bh, c: int32): M256bh {.importc: "_mm256_minmax_pbh".}

func mm256_mask_minmax_pbh*(w: M256bh, u: MMask16, a: M256bh, b: M256bh, c: int32): M256bh {.importc: "_mm256_mask_minmax_pbh".}

func mm256_maskz_minmax_pbh*(u: MMask16, a: M256bh, b: M256bh, c: int32): M256bh {.importc: "_mm256_maskz_minmax_pbh".}

func mm512_minmax_pbh*(a: M512bh, b: M512bh, c: int32): M512bh {.importc: "_mm512_minmax_pbh".}

func mm512_mask_minmax_pbh*(w: M512bh, u: MMask32, a: M512bh, b: M512bh, c: int32): M512bh {.importc: "_mm512_mask_minmax_pbh".}

func mm512_maskz_minmax_pbh*(u: MMask32, a: M512bh, b: M512bh, c: int32): M512bh {.importc: "_mm512_maskz_minmax_pbh".}

func mm_minmax_pd*(a: M128d, b: M128d, c: int32): M128d {.importc: "_mm_minmax_pd".}

func mm_mask_minmax_pd*(w: M128d, u: MMask8, a: M128d, b: M128d, c: int32): M128d {.importc: "_mm_mask_minmax_pd".}

func mm_maskz_minmax_pd*(u: MMask8, a: M128d, b: M128d, c: int32): M128d {.importc: "_mm_maskz_minmax_pd".}

func mm256_minmax_pd*(a: M256d, b: M256d, c: int32): M256d {.importc: "_mm256_minmax_pd".}

func mm256_mask_minmax_pd*(w: M256d, u: MMask8, a: M256d, b: M256d, c: int32): M256d {.importc: "_mm256_mask_minmax_pd".}

func mm256_maskz_minmax_pd*(u: MMask8, a: M256d, b: M256d, c: int32): M256d {.importc: "_mm256_maskz_minmax_pd".}

func mm512_minmax_pd*(a: M512d, b: M512d, c: int32): M512d {.importc: "_mm512_minmax_pd".}

func mm512_mask_minmax_pd*(w: M512d, u: MMask8, a: M512d, b: M512d, c: int32): M512d {.importc: "_mm512_mask_minmax_pd".}

func mm512_maskz_minmax_pd*(u: MMask8, a: M512d, b: M512d, c: int32): M512d {.importc: "_mm512_maskz_minmax_pd".}

func mm512_minmax_round_pd*(a: M512d, b: M512d, c: int32, r: int32): M512d {.importc: "_mm512_minmax_round_pd".}

func mm512_mask_minmax_round_pd*(w: M512d, u: MMask8, a: M512d, b: M512d, c: int32, r: int32): M512d {.importc: "_mm512_mask_minmax_round_pd".}

func mm512_maskz_minmax_round_pd*(u: MMask8, a: M512d, b: M512d, c: int32, r: int32): M512d {.importc: "_mm512_maskz_minmax_round_pd".}

func mm_minmax_ph*(a: M128h, b: M128h, c: int32): M128h {.importc: "_mm_minmax_ph".}

func mm_mask_minmax_ph*(w: M128h, u: MMask8, a: M128h, b: M128h, c: int32): M128h {.importc: "_mm_mask_minmax_ph".}

func mm_maskz_minmax_ph*(u: MMask8, a: M128h, b: M128h, c: int32): M128h {.importc: "_mm_maskz_minmax_ph".}

func mm256_minmax_ph*(a: M256h, b: M256h, c: int32): M256h {.importc: "_mm256_minmax_ph".}

func mm256_mask_minmax_ph*(w: M256h, u: MMask16, a: M256h, b: M256h, c: int32): M256h {.importc: "_mm256_mask_minmax_ph".}

func mm256_maskz_minmax_ph*(u: MMask16, a: M256h, b: M256h, c: int32): M256h {.importc: "_mm256_maskz_minmax_ph".}

func mm512_minmax_ph*(a: M512h, b: M512h, c: int32): M512h {.importc: "_mm512_minmax_ph".}

func mm512_mask_minmax_ph*(w: M512h, u: MMask32, a: M512h, b: M512h, c: int32): M512h {.importc: "_mm512_mask_minmax_ph".}

func mm512_maskz_minmax_ph*(u: MMask32, a: M512h, b: M512h, c: int32): M512h {.importc: "_mm512_maskz_minmax_ph".}

func mm512_minmax_round_ph*(a: M512h, b: M512h, c: int32, r: int32): M512h {.importc: "_mm512_minmax_round_ph".}

func mm512_mask_minmax_round_ph*(w: M512h, u: MMask32, a: M512h, b: M512h, c: int32, r: int32): M512h {.importc: "_mm512_mask_minmax_round_ph".}

func mm512_maskz_minmax_round_ph*(u: MMask32, a: M512h, b: M512h, c: int32, r: int32): M512h {.importc: "_mm512_maskz_minmax_round_ph".}

func mm_minmax_ps*(a: M128, b: M128, c: int32): M128 {.importc: "_mm_minmax_ps".}

func mm_mask_minmax_ps*(w: M128, u: MMask8, a: M128, b: M128, c: int32): M128 {.importc: "_mm_mask_minmax_ps".}

func mm_maskz_minmax_ps*(u: MMask8, a: M128, b: M128, c: int32): M128 {.importc: "_mm_maskz_minmax_ps".}

func mm256_minmax_ps*(a: M256, b: M256, c: int32): M256 {.importc: "_mm256_minmax_ps".}

func mm256_mask_minmax_ps*(w: M256, u: MMask8, a: M256, b: M256, c: int32): M256 {.importc: "_mm256_mask_minmax_ps".}

func mm256_maskz_minmax_ps*(u: MMask8, a: M256, b: M256, c: int32): M256 {.importc: "_mm256_maskz_minmax_ps".}

func mm512_minmax_ps*(a: M512, b: M512, c: int32): M512 {.importc: "_mm512_minmax_ps".}

func mm512_mask_minmax_ps*(w: M512, u: MMask16, a: M512, b: M512, c: int32): M512 {.importc: "_mm512_mask_minmax_ps".}

func mm512_maskz_minmax_ps*(u: MMask16, a: M512, b: M512, c: int32): M512 {.importc: "_mm512_maskz_minmax_ps".}

func mm512_minmax_round_ps*(a: M512, b: M512, c: int32, r: int32): M512 {.importc: "_mm512_minmax_round_ps".}

func mm512_mask_minmax_round_ps*(w: M512, u: MMask16, a: M512, b: M512, c: int32, r: int32): M512 {.importc: "_mm512_mask_minmax_round_ps".}

func mm512_maskz_minmax_round_ps*(u: MMask16, a: M512, b: M512, c: int32, r: int32): M512 {.importc: "_mm512_maskz_minmax_round_ps".}

func mm_minmax_sd*(a: M128d, b: M128d, c: int32): M128d {.importc: "_mm_minmax_sd".}

func mm_mask_minmax_sd*(w: M128d, u: MMask8, a: M128d, b: M128d, c: int32): M128d {.importc: "_mm_mask_minmax_sd".}

func mm_maskz_minmax_sd*(u: MMask8, a: M128d, b: M128d, c: int32): M128d {.importc: "_mm_maskz_minmax_sd".}

func mm_minmax_round_sd*(a: M128d, b: M128d, c: int32, r: int32): M128d {.importc: "_mm_minmax_round_sd".}

func mm_mask_minmax_round_sd*(w: M128d, u: MMask8, a: M128d, b: M128d, c: int32, r: int32): M128d {.importc: "_mm_mask_minmax_round_sd".}

func mm_maskz_minmax_round_sd*(u: MMask8, a: M128d, b: M128d, c: int32, r: int32): M128d {.importc: "_mm_maskz_minmax_round_sd".}

func mm_minmax_sh*(a: M128h, b: M128h, c: int32): M128h {.importc: "_mm_minmax_sh".}

func mm_mask_minmax_sh*(w: M128h, u: MMask8, a: M128h, b: M128h, c: int32): M128h {.importc: "_mm_mask_minmax_sh".}

func mm_maskz_minmax_sh*(u: MMask8, a: M128h, b: M128h, c: int32): M128h {.importc: "_mm_maskz_minmax_sh".}

func mm_minmax_round_sh*(a: M128h, b: M128h, c: int32, r: int32): M128h {.importc: "_mm_minmax_round_sh".}

func mm_mask_minmax_round_sh*(w: M128h, u: MMask8, a: M128h, b: M128h, c: int32, r: int32): M128h {.importc: "_mm_mask_minmax_round_sh".}

func mm_maskz_minmax_round_sh*(u: MMask8, a: M128h, b: M128h, c: int32, r: int32): M128h {.importc: "_mm_maskz_minmax_round_sh".}

func mm_minmax_ss*(a: M128, b: M128, c: int32): M128 {.importc: "_mm_minmax_ss".}

func mm_mask_minmax_ss*(w: M128, u: MMask8, a: M128, b: M128, c: int32): M128 {.importc: "_mm_mask_minmax_ss".}

func mm_maskz_minmax_ss*(u: MMask8, a: M128, b: M128, c: int32): M128 {.importc: "_mm_maskz_minmax_ss".}

func mm_minmax_round_ss*(a: M128, b: M128, c: int32, r: int32): M128 {.importc: "_mm_minmax_round_ss".}

func mm_mask_minmax_round_ss*(w: M128, u: MMask8, a: M128, b: M128, c: int32, r: int32): M128 {.importc: "_mm_mask_minmax_round_ss".}

func mm_maskz_minmax_round_ss*(u: MMask8, a: M128, b: M128, c: int32, r: int32): M128 {.importc: "_mm_maskz_minmax_round_ss".}

## [Macro Original]
## #define _mm_minmax_pbh(A, B, C)						      \
## ((__m128bh) __builtin_ia32_minmaxbf16128_mask ((__v8bf) (A),		      \
## (__v8bf) (B),		      \
## (int) (C),		      \
## (__v8bf) (__m128bh)	      \
## _mm_setzero_si128 (),	      \
## (__mmask8) (-1)))

## [Macro Original]
## #define _mm_mask_minmax_pbh(W, U, A, B, C)				      \
## ((__m128bh) __builtin_ia32_minmaxbf16128_mask ((__v8bf) (A),		      \
## (__v8bf) (B),		      \
## (int) (C),		      \
## (__v8bf) (__m128bh) (W),     \
## (__mmask8) (U)))

## [Macro Original]
## #define _mm_maskz_minmax_pbh(U, A, B, C)				      \
## ((__m128bh) __builtin_ia32_minmaxbf16128_mask ((__v8bf) (A),		      \
## (__v8bf) (B),		      \
## (int) (C),		      \
## (__v8bf) (__m128bh)	      \
## _mm_setzero_si128 (),	      \
## (__mmask8) (U)))

## [Macro Original]
## #define _mm256_minmax_pbh(A, B, C)					      \
## ((__m256bh) __builtin_ia32_minmaxbf16256_mask ((__v16bf) (A),		      \
## (__v16bf) (B),		      \
## (int) (C),		      \
## (__v16bf) (__m256bh)	      \
## _mm256_setzero_si256 (),     \
## (__mmask16) (-1)))

## [Macro Original]
## #define _mm256_mask_minmax_pbh(W, U, A, B, C)				      \
## ((__m256bh) __builtin_ia32_minmaxbf16256_mask ((__v16bf) (A),		      \
## (__v16bf) (B),		      \
## (int) (C),		      \
## (__v16bf) (__m256bh) (W),    \
## (__mmask16) (U)))

## [Macro Original]
## #define _mm256_maskz_minmax_pbh(U, A, B, C)				      \
## ((__m256bh) __builtin_ia32_minmaxbf16256_mask ((__v16bf) (A),		      \
## (__v16bf) (B),		      \
## (int) (C),		      \
## (__v16bf) (__m256bh)	      \
## _mm256_setzero_si256 (),     \
## (__mmask16) (U)))

## [Macro Original]
## #define _mm512_minmax_pbh(A, B, C)					      \
## ((__m512bh) __builtin_ia32_minmaxbf16512_mask ((__v32bf) (A),		      \
## (__v32bf) (B),		      \
## (int) (C),		      \
## (__v32bf) (__m512bh)	      \
## _mm512_setzero_si512 (),     \
## (__mmask32) (-1)))

## [Macro Original]
## #define _mm512_mask_minmax_pbh(W, U, A, B, C)				      \
## ((__m512bh) __builtin_ia32_minmaxbf16512_mask ((__v32bf) (A),		      \
## (__v32bf) (B), 	      \
## (int) (C),		      \
## (__v32bf) (__m512bh) (W),    \
## (__mmask32) (U)))

## [Macro Original]
## #define _mm512_maskz_minmax_pbh(U, A, B, C)				      \
## ((__m512bh) __builtin_ia32_minmaxbf16512_mask ((__v32bf) (A),		      \
## (__v32bf) (B),		      \
## (int) (C),		      \
## (__v32bf) (__m512bh)	      \
## _mm512_setzero_si512 (),     \
## (__mmask32) (U)))

## [Macro Original]
## #define _mm_minmax_pd(A, B, C)						      \
## ((__m128d) __builtin_ia32_minmaxpd128_mask ((__v2df) (A),		      \
## (__v2df) (B),		      \
## (int) (C),		      \
## (__v2df) (__m128d)	      \
## _mm_undefined_pd (),	      \
## (__mmask8) (-1)))

## [Macro Original]
## #define _mm_mask_minmax_pd(W, U, A, B, C)				      \
## ((__m128d) __builtin_ia32_minmaxpd128_mask ((__v2df) (A),		      \
## (__v2df) (B),		      \
## (int) (C),		      \
## (__v2df) (__m128d) (W),	      \
## (__mmask8) (U)))

## [Macro Original]
## #define _mm_maskz_minmax_pd(U, A, B, C)					      \
## ((__m128d) __builtin_ia32_minmaxpd128_mask ((__v2df) (A),		      \
## (__v2df) (B),		      \
## (int) (C),		      \
## (__v2df) (__m128d)	      \
## _mm_setzero_pd (),	      \
## (__mmask8) (U)))

## [Macro Original]
## #define _mm256_minmax_pd(A, B, C)					      \
## ((__m256d) __builtin_ia32_minmaxpd256_mask ((__v4df) (A),		      \
## (__v4df) (B),		      \
## (int) (C),		      \
## (__v4df) (__m256d)	      \
## _mm256_undefined_pd (),	      \
## (__mmask8) (-1)))

## [Macro Original]
## #define _mm256_mask_minmax_pd(W, U, A, B, C)				      \
## ((__m256d) __builtin_ia32_minmaxpd256_mask ((__v4df) (A),		      \
## (__v4df) (B),		      \
## (int) (C),		      \
## (__v4df) (__m256d) (W),	      \
## (__mmask8) (U)))

## [Macro Original]
## #define _mm256_maskz_minmax_pd(U, A, B, C)				      \
## ((__m256d) __builtin_ia32_minmaxpd256_mask ((__v4df) (A),		      \
## (__v4df) (B),		      \
## (int) (C),		      \
## (__v4df) (__m256d)	      \
## _mm256_setzero_pd (),	      \
## (__mmask8) (U)))

## [Macro Original]
## #define _mm512_minmax_pd(A, B, C)					      \
## ((__m512d) __builtin_ia32_minmaxpd512_mask_round ((__v8df) (A),	      \
## (__v8df) (B),	      \
## (int) (C),		      \
## (__v8df) (__m512d)	      \
## _mm512_undefined_pd (),   \
## (__mmask8) (-1),	      \
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_mask_minmax_pd(W, U, A, B, C)				      \
## ((__m512d) __builtin_ia32_minmaxpd512_mask_round ((__v8df) (A),	      \
## (__v8df) (B),	      \
## (int) (C),		      \
## (__v8df) (__m512d) (W),   \
## (__mmask8) (U),	      \
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_maskz_minmax_pd(U, A, B, C)				      \
## ((__m512d) __builtin_ia32_minmaxpd512_mask_round ((__v8df) (A),	      \
## (__v8df) (B),	      \
## (int) (C),		      \
## (__v8df) (__m512d)	      \
## _mm512_setzero_pd (),     \
## (__mmask8) (U),	      \
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_minmax_round_pd(A, B, C, R)				      \
## ((__m512d) __builtin_ia32_minmaxpd512_mask_round ((__v8df) (A),	      \
## (__v8df) (B),	      \
## (int) (C),		      \
## (__v8df) (__m512d)	      \
## _mm512_undefined_pd (),   \
## (__mmask8) (-1),	      \
## (int) (R)))

## [Macro Original]
## #define _mm512_mask_minmax_round_pd(W, U, A, B, C, R)			      \
## ((__m512d) __builtin_ia32_minmaxpd512_mask_round ((__v8df) (A),	      \
## (__v8df) (B),	      \
## (int) (C),		      \
## (__v8df) (__m512d) (W),   \
## (__mmask8) (U),	      \
## (int) (R)))

## [Macro Original]
## #define _mm512_maskz_minmax_round_pd(U, A, B, C, R)			      \
## ((__m512d) __builtin_ia32_minmaxpd512_mask_round ((__v8df) (A),	      \
## (__v8df) (B),	      \
## (int) (C),		      \
## (__v8df) (__m512d)	      \
## _mm512_setzero_pd (),     \
## (__mmask8) (U), 	      \
## (int) (R)))

## [Macro Original]
## #define _mm_minmax_ph(A, B, C)						      \
## ((__m128h) __builtin_ia32_minmaxph128_mask ((__v8hf) (A),		      \
## (__v8hf) (B),		      \
## (int) (C),		      \
## (__v8hf) (__m128h)	      \
## _mm_undefined_ph (),	      \
## (__mmask8) (-1)))

## [Macro Original]
## #define _mm_mask_minmax_ph(W, U, A, B, C)				      \
## ((__m128h) __builtin_ia32_minmaxph128_mask ((__v8hf) (A),		      \
## (__v8hf) (B),		      \
## (int) (C),		      \
## (__v8hf) (__m128h) (W),	      \
## (__mmask8) (U)))

## [Macro Original]
## #define _mm_maskz_minmax_ph(U, A, B, C)					      \
## ((__m128h) __builtin_ia32_minmaxph128_mask ((__v8hf) (A),		      \
## (__v8hf) (B),		      \
## (int) (C),		      \
## (__v8hf) (__m128h)	      \
## _mm_setzero_ph (),	      \
## (__mmask8) (U)))

## [Macro Original]
## #define _mm256_minmax_ph(A, B, C)					      \
## ((__m256h) __builtin_ia32_minmaxph256_mask ((__v16hf) (A),		      \
## (__v16hf) (B),		      \
## (int) (C),		      \
## (__v16hf) (__m256h)	      \
## _mm256_undefined_ph (),	      \
## (__mmask16) (-1)))

## [Macro Original]
## #define _mm256_mask_minmax_ph(W, U, A, B, C)				      \
## ((__m256h) __builtin_ia32_minmaxph256_mask ((__v16hf) (A),		      \
## (__v16hf) (B),		      \
## (int) (C),		      \
## (__v16hf) (__m256h) (W),	      \
## (__mmask16) (U)))

## [Macro Original]
## #define _mm256_maskz_minmax_ph(U, A, B, C)				      \
## ((__m256h) __builtin_ia32_minmaxph256_mask ((__v16hf) (A),		      \
## (__v16hf) (B),		      \
## (int) (C),		      \
## (__v16hf) (__m256h)	      \
## _mm256_setzero_ph (),	      \
## (__mmask16) (U)))

## [Macro Original]
## #define _mm512_minmax_ph(A, B, C)					      \
## ((__m512h) __builtin_ia32_minmaxph512_mask_round ((__v32hf) (A),	      \
## (__v32hf) (B),	      \
## (int) (C),		      \
## (__v32hf) (__m512h)	      \
## _mm512_undefined_ph (),   \
## (__mmask32) (-1),	      \
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_mask_minmax_ph(W, U, A, B, C)				      \
## ((__m512h) __builtin_ia32_minmaxph512_mask_round ((__v32hf) (A),	      \
## (__v32hf) (B),	      \
## (int) (C),		      \
## (__v32hf) (__m512h) (W),  \
## (__mmask32) (U),	      \
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_maskz_minmax_ph(U, A, B, C)				      \
## ((__m512h) __builtin_ia32_minmaxph512_mask_round ((__v32hf) (A),	      \
## (__v32hf) (B),	      \
## (int) (C),		      \
## (__v32hf) (__m512h)	      \
## _mm512_setzero_ph (),     \
## (__mmask32) (U),	      \
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_minmax_round_ph(A, B, C, R)				      \
## ((__m512h) __builtin_ia32_minmaxph512_mask_round ((__v32hf) (A),	      \
## (__v32hf) (B),	      \
## (int) (C),		      \
## (__v32hf) (__m512h)	      \
## _mm512_undefined_ph (),   \
## (__mmask32) (-1),	      \
## (int) (R)))

## [Macro Original]
## #define _mm512_mask_minmax_round_ph(W, U, A, B, C, R)			      \
## ((__m512h) __builtin_ia32_minmaxph512_mask_round ((__v32hf) (A),	      \
## (__v32hf) (B),	      \
## (int) (C),		      \
## (__v32hf) (__m512h) (W),  \
## (__mmask32) (U),	      \
## (int) (R)))

## [Macro Original]
## #define _mm512_maskz_minmax_round_ph(U, A, B, C, R)			      \
## ((__m512h) __builtin_ia32_minmaxph512_mask_round ((__v32hf) (A),	      \
## (__v32hf) (B),	      \
## (int) (C),		      \
## (__v32hf) (__m512h)	      \
## _mm512_setzero_ph (),     \
## (__mmask32) (U),	      \
## (int) (R)))

## [Macro Original]
## #define _mm_minmax_ps(A, B, C)						      \
## ((__m128) __builtin_ia32_minmaxps128_mask ((__v4sf) (A),		      \
## (__v4sf) (B),		      \
## (int) (C),			      \
## (__v4sf) (__m128)		      \
## _mm_undefined_ps (),	      \
## (__mmask8) (-1)))

## [Macro Original]
## #define _mm_mask_minmax_ps(W, U, A, B, C)				      \
## ((__m128) __builtin_ia32_minmaxps128_mask ((__v4sf) (A),		      \
## (__v4sf) (B),		      \
## (int) (C),			      \
## (__v4sf) (__m128) (W),	      \
## (__mmask8) (U)))

## [Macro Original]
## #define _mm_maskz_minmax_ps(U, A, B, C)					      \
## ((__m128) __builtin_ia32_minmaxps128_mask ((__v4sf) (A),		      \
## (__v4sf) (B),		      \
## (int) (C),			      \
## (__v4sf) (__m128)		      \
## _mm_setzero_ps (),		      \
## (__mmask8) (U)))

## [Macro Original]
## #define _mm256_minmax_ps(A, B, C)					      \
## ((__m256) __builtin_ia32_minmaxps256_mask ((__v8sf) (A),		      \
## (__v8sf) (B),		      \
## (int) (C),			      \
## (__v8sf) (__m256)		      \
## _mm256_undefined_ps (),	      \
## (__mmask8) (-1)))

## [Macro Original]
## #define _mm256_mask_minmax_ps(W, U, A, B, C)				      \
## ((__m256) __builtin_ia32_minmaxps256_mask ((__v8sf) (A),		      \
## (__v8sf) (B),		      \
## (int) (C),			      \
## (__v8sf) (__m256) (W),	      \
## (__mmask8) (U)))

## [Macro Original]
## #define _mm256_maskz_minmax_ps(U, A, B, C)				      \
## ((__m256) __builtin_ia32_minmaxps256_mask ((__v8sf) (A),		      \
## (__v8sf) (B),		      \
## (int) (C),			      \
## (__v8sf) (__m256)		      \
## _mm256_setzero_ps (),	      \
## (__mmask8) (U)))

## [Macro Original]
## #define _mm512_minmax_ps(A, B, C)					      \
## ((__m512) __builtin_ia32_minmaxps512_mask_round ((__v16sf) (A),	      \
## (__v16sf) (B),	      \
## (int) (C),		      \
## (__v16sf) (__m512)	      \
## _mm512_undefined_ps (),    \
## (__mmask16) (-1),	      \
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_mask_minmax_ps(W, U, A, B, C)				      \
## ((__m512) __builtin_ia32_minmaxps512_mask_round ((__v16sf) (A),	      \
## (__v16sf) (B),	      \
## (int) (C),		      \
## (__v16sf) (__m512) (W),    \
## (__mmask16) (U),	      \
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_maskz_minmax_ps(U, A, B, C)				      \
## ((__m512) __builtin_ia32_minmaxps512_mask_round ((__v16sf) (A),	      \
## (__v16sf) (B),	      \
## (int) (C),		      \
## (__v16sf) (__m512)	      \
## _mm512_setzero_ps (),      \
## (__mmask16) (U),	      \
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm512_minmax_round_ps(A, B, C, R)				      \
## ((__m512) __builtin_ia32_minmaxps512_mask_round ((__v16sf) (A),	      \
## (__v16sf) (B),	      \
## (int) (C),		      \
## (__v16sf) (__m512)	      \
## _mm512_undefined_ps (),    \
## (__mmask16) (-1),	      \
## (int) (R)))

## [Macro Original]
## #define _mm512_mask_minmax_round_ps(W, U, A, B, C, R)			      \
## ((__m512) __builtin_ia32_minmaxps512_mask_round ((__v16sf) (A),	      \
## (__v16sf) (B),	      \
## (int) (C),		      \
## (__v16sf) (__m512) (W),    \
## (__mmask16) (U),	      \
## (int) (R)))

## [Macro Original]
## #define _mm512_maskz_minmax_round_ps(U, A, B, C, R)			      \
## ((__m512) __builtin_ia32_minmaxps512_mask_round ((__v16sf) (A), 	      \
## (__v16sf) (B),	      \
## (int) (C),		      \
## (__v16sf) (__m512)	      \
## _mm512_setzero_ps (),      \
## (__mmask16) (U),	      \
## (int) (R)))

## [Macro Original]
## #define _mm_minmax_round_sd(A, B, C, R)					      \
## ((__m128d) __builtin_ia32_minmaxsd_mask_round ((__v2df) (A),		      \
## (__v2df) (B),		      \
## (int) (C),		      \
## (__v2df) (__m128d)	      \
## _mm_undefined_pd (),	      \
## (__mmask8) (-1),	      \
## (int) (R)))

## [Macro Original]
## #define _mm_mask_minmax_round_sd(W, U, A, B, C, R)			      \
## ((__m128d) __builtin_ia32_minmaxsd_mask_round ((__v2df) (A),		      \
## (__v2df) (B),		      \
## (int) (C),		      \
## (__v2df) (__m128d) (W),      \
## (__mmask8) (U),	      \
## (int) (R)))

## [Macro Original]
## #define _mm_maskz_minmax_round_sd(U, A, B, C, R)			      \
## ((__m128d) __builtin_ia32_minmaxsd_mask_round ((__v2df) (A),		      \
## (__v2df)(B),		      \
## (int) (C),		      \
## (__v2df) (__m128d)	      \
## _mm_setzero_pd (),	      \
## (__mmask8) (U),	      \
## (int) (R)))

## [Macro Original]
## #define _mm_minmax_round_sh(A, B, C, R)					      \
## ((__m128h) __builtin_ia32_minmaxsh_mask_round ((__v8hf) (A),		      \
## (__v8hf) (B),		      \
## (int) (C),		      \
## (__v8hf) (__m128h)	      \
## _mm_undefined_ph (),	      \
## (__mmask8) (-1),	      \
## (int) (R)))

## [Macro Original]
## #define _mm_mask_minmax_round_sh(W, U, A, B, C, R)			      \
## ((__m128h) __builtin_ia32_minmaxsh_mask_round ((__v8hf) (A),		      \
## (__v8hf) (B),		      \
## (int) (C),		      \
## (__v8hf) (__m128h) (W),      \
## (__mmask8) (U),	      \
## (int) (R)))

## [Macro Original]
## #define _mm_maskz_minmax_round_sh(U, A, B, C, R)			      \
## ((__m128h) __builtin_ia32_minmaxsh_mask_round ((__v8hf) (A),		      \
## (__v8hf) (B),		      \
## (int) (C),		      \
## (__v8hf) (__m128h)	      \
## _mm_setzero_ph (),	      \
## (__mmask8) (U),	      \
## (int) (R)))

## [Macro Original]
## #define _mm_minmax_round_ss(A, B, C, R)					      \
## ((__m128) __builtin_ia32_minmaxss_mask_round ((__v4sf) (A),		      \
## (__v4sf) (B),		      \
## (int) (C),		      \
## (__v4sf) (__m128)	      \
## _mm_undefined_ps (),	      \
## (__mmask8) (-1),	      \
## (int) (R)))

## [Macro Original]
## #define _mm_mask_minmax_round_ss(W, U, A, B, C, R)			      \
## ((__m128) __builtin_ia32_minmaxss_mask_round ((__v4sf) (A),		      \
## (__v4sf) (B),		      \
## (int) (C),		      \
## (__v4sf) (__m128) (W),	      \
## (__mmask8) (U),		      \
## (int) (R)))

## [Macro Original]
## #define _mm_maskz_minmax_round_ss(U, A, B, C, R)			      \
## ((__m128) __builtin_ia32_minmaxss_mask_round ((__v4sf) (A),		      \
## (__v4sf) (B),		      \
## (int) (C),		      \
## (__v4sf)(__m128)	      \
## _mm_setzero_ps (),	      \
## (__mmask8) (U),		      \
## (int) (R)))

## [Macro Original]
## #define _mm_minmax_sd(A, B, C)						      \
## ((__m128d) __builtin_ia32_minmaxsd_mask_round ((__v2df) (A),		      \
## (__v2df) (B),		      \
## (int) (C),		      \
## (__v2df) (__m128d)	      \
## _mm_undefined_pd (),	      \
## (__mmask8) (-1),	      \
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_mask_minmax_sd(W, U, A, B, C)				      \
## ((__m128d) __builtin_ia32_minmaxsd_mask_round ((__v2df) (A),		      \
## (__v2df) (B),		      \
## (int) (C),		      \
## (__v2df) (__m128d) (W),      \
## (__mmask8) (U),	      \
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_maskz_minmax_sd(U, A, B, C)					      \
## ((__m128d) __builtin_ia32_minmaxsd_mask_round ((__v2df) (A),		      \
## (__v2df) (B),		      \
## (int) (C),		      \
## (__v2df) (__m128d)	      \
## _mm_setzero_pd (),	      \
## (__mmask8) (U),	      \
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_minmax_sh(A, B, C)						      \
## ((__m128h) __builtin_ia32_minmaxsh_mask_round ((__v8hf) (A),		      \
## (__v8hf) (B),		      \
## (int) (C),		      \
## (__v8hf) (__m128h)	      \
## _mm_undefined_ph (),	      \
## (__mmask8) (-1),	      \
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_mask_minmax_sh(W, U, A, B, C)				      \
## ((__m128h) __builtin_ia32_minmaxsh_mask_round ((__v8hf) (A),		      \
## (__v8hf) (B),		      \
## (int) (C),		      \
## (__v8hf) (__m128h) (W),      \
## (__mmask8) (U),	      \
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_maskz_minmax_sh(U, A, B, C)					      \
## ((__m128h) __builtin_ia32_minmaxsh_mask_round ((__v8hf) (A),		      \
## (__v8hf) (B),		      \
## (int) (C),		      \
## (__v8hf) (__m128h)	      \
## _mm_setzero_ph (),	      \
## (__mmask8) (U),	      \
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_minmax_ss(A, B, C)						      \
## ((__m128) __builtin_ia32_minmaxss_mask_round ((__v4sf) (A),		      \
## (__v4sf) (B),		      \
## (int) (C),		      \
## (__v4sf) (__m128)	      \
## _mm_undefined_ps (),	      \
## (__mmask8) (-1),	      \
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_mask_minmax_ss(W, U, A, B, C)				      \
## ((__m128) __builtin_ia32_minmaxss_mask_round ((__v4sf) (A),		      \
## (__v4sf) (B),		      \
## (int) (C),		      \
## (__v4sf) (__m128) (W),	      \
## (__mmask8) (U),		      \
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _mm_maskz_minmax_ss(U, A, B, C)					      \
## ((__m128) __builtin_ia32_minmaxss_mask_round ((__v4sf) (A),		      \
## (__v4sf) (B),		      \
## (int) (C),		      \
## (__v4sf) (__m128)	      \
## _mm_setzero_ps (),	      \
## (__mmask8) (U),		      \
## _MM_FROUND_CUR_DIRECTION))

## [Macro Original]
## #define _AVX10_2SATCVTINTRIN_H_INCLUDED

## [Macro Original]
## #define __DISABLE_AVX10_2__

func mm_ipcvts_bf16_epi8*(a: M128bh): M128i {.importc: "_mm_ipcvts_bf16_epi8".}

func mm_mask_ipcvts_bf16_epi8*(w: M128i, u: MMask8, a: M128bh): M128i {.importc: "_mm_mask_ipcvts_bf16_epi8".}

func mm_maskz_ipcvts_bf16_epi8*(u: MMask8, a: M128bh): M128i {.importc: "_mm_maskz_ipcvts_bf16_epi8".}

func mm_ipcvts_bf16_epu8*(a: M128bh): M128i {.importc: "_mm_ipcvts_bf16_epu8".}

func mm_mask_ipcvts_bf16_epu8*(w: M128i, u: MMask8, a: M128bh): M128i {.importc: "_mm_mask_ipcvts_bf16_epu8".}

func mm_maskz_ipcvts_bf16_epu8*(u: MMask8, a: M128bh): M128i {.importc: "_mm_maskz_ipcvts_bf16_epu8".}

func mm256_ipcvts_bf16_epi8*(a: M256bh): M256i {.importc: "_mm256_ipcvts_bf16_epi8".}

func mm256_mask_ipcvts_bf16_epi8*(w: M256i, u: MMask16, a: M256bh): M256i {.importc: "_mm256_mask_ipcvts_bf16_epi8".}

func mm256_maskz_ipcvts_bf16_epi8*(u: MMask16, a: M256bh): M256i {.importc: "_mm256_maskz_ipcvts_bf16_epi8".}

func mm256_ipcvts_bf16_epu8*(a: M256bh): M256i {.importc: "_mm256_ipcvts_bf16_epu8".}

func mm256_mask_ipcvts_bf16_epu8*(w: M256i, u: MMask16, a: M256bh): M256i {.importc: "_mm256_mask_ipcvts_bf16_epu8".}

func mm256_maskz_ipcvts_bf16_epu8*(u: MMask16, a: M256bh): M256i {.importc: "_mm256_maskz_ipcvts_bf16_epu8".}

func mm512_ipcvts_bf16_epi8*(a: M512bh): M512i {.importc: "_mm512_ipcvts_bf16_epi8".}

func mm512_mask_ipcvts_bf16_epi8*(w: M512i, u: MMask32, a: M512bh): M512i {.importc: "_mm512_mask_ipcvts_bf16_epi8".}

func mm512_maskz_ipcvts_bf16_epi8*(u: MMask32, a: M512bh): M512i {.importc: "_mm512_maskz_ipcvts_bf16_epi8".}

func mm512_ipcvts_bf16_epu8*(a: M512bh): M512i {.importc: "_mm512_ipcvts_bf16_epu8".}

func mm512_mask_ipcvts_bf16_epu8*(w: M512i, u: MMask32, a: M512bh): M512i {.importc: "_mm512_mask_ipcvts_bf16_epu8".}

func mm512_maskz_ipcvts_bf16_epu8*(u: MMask32, a: M512bh): M512i {.importc: "_mm512_maskz_ipcvts_bf16_epu8".}

func mm_ipcvtts_bf16_epi8*(a: M128bh): M128i {.importc: "_mm_ipcvtts_bf16_epi8".}

func mm_mask_ipcvtts_bf16_epi8*(w: M128i, u: MMask8, a: M128bh): M128i {.importc: "_mm_mask_ipcvtts_bf16_epi8".}

func mm_maskz_ipcvtts_bf16_epi8*(u: MMask8, a: M128bh): M128i {.importc: "_mm_maskz_ipcvtts_bf16_epi8".}

func mm_ipcvtts_bf16_epu8*(a: M128bh): M128i {.importc: "_mm_ipcvtts_bf16_epu8".}

func mm_mask_ipcvtts_bf16_epu8*(w: M128i, u: MMask8, a: M128bh): M128i {.importc: "_mm_mask_ipcvtts_bf16_epu8".}

func mm_maskz_ipcvtts_bf16_epu8*(u: MMask8, a: M128bh): M128i {.importc: "_mm_maskz_ipcvtts_bf16_epu8".}

func mm256_ipcvtts_bf16_epi8*(a: M256bh): M256i {.importc: "_mm256_ipcvtts_bf16_epi8".}

func mm256_mask_ipcvtts_bf16_epi8*(w: M256i, u: MMask16, a: M256bh): M256i {.importc: "_mm256_mask_ipcvtts_bf16_epi8".}

func mm256_maskz_ipcvtts_bf16_epi8*(u: MMask16, a: M256bh): M256i {.importc: "_mm256_maskz_ipcvtts_bf16_epi8".}

func mm256_ipcvtts_bf16_epu8*(a: M256bh): M256i {.importc: "_mm256_ipcvtts_bf16_epu8".}

func mm256_mask_ipcvtts_bf16_epu8*(w: M256i, u: MMask16, a: M256bh): M256i {.importc: "_mm256_mask_ipcvtts_bf16_epu8".}

func mm256_maskz_ipcvtts_bf16_epu8*(u: MMask16, a: M256bh): M256i {.importc: "_mm256_maskz_ipcvtts_bf16_epu8".}

func mm512_ipcvtts_bf16_epi8*(a: M512bh): M512i {.importc: "_mm512_ipcvtts_bf16_epi8".}

func mm512_mask_ipcvtts_bf16_epi8*(w: M512i, u: MMask32, a: M512bh): M512i {.importc: "_mm512_mask_ipcvtts_bf16_epi8".}

func mm512_maskz_ipcvtts_bf16_epi8*(u: MMask32, a: M512bh): M512i {.importc: "_mm512_maskz_ipcvtts_bf16_epi8".}

func mm512_ipcvtts_bf16_epu8*(a: M512bh): M512i {.importc: "_mm512_ipcvtts_bf16_epu8".}

func mm512_mask_ipcvtts_bf16_epu8*(w: M512i, u: MMask32, a: M512bh): M512i {.importc: "_mm512_mask_ipcvtts_bf16_epu8".}

func mm512_maskz_ipcvtts_bf16_epu8*(u: MMask32, a: M512bh): M512i {.importc: "_mm512_maskz_ipcvtts_bf16_epu8".}

func mm_ipcvts_ph_epi8*(a: M128h): M128i {.importc: "_mm_ipcvts_ph_epi8".}

func mm_mask_ipcvts_ph_epi8*(w: M128i, u: MMask8, a: M128h): M128i {.importc: "_mm_mask_ipcvts_ph_epi8".}

func mm_maskz_ipcvts_ph_epi8*(u: MMask8, a: M128h): M128i {.importc: "_mm_maskz_ipcvts_ph_epi8".}

func mm_ipcvts_ph_epu8*(a: M128h): M128i {.importc: "_mm_ipcvts_ph_epu8".}

func mm_mask_ipcvts_ph_epu8*(w: M128i, u: MMask8, a: M128h): M128i {.importc: "_mm_mask_ipcvts_ph_epu8".}

func mm_maskz_ipcvts_ph_epu8*(u: MMask8, a: M128h): M128i {.importc: "_mm_maskz_ipcvts_ph_epu8".}

func mm_ipcvts_ps_epi8*(a: M128): M128i {.importc: "_mm_ipcvts_ps_epi8".}

func mm_mask_ipcvts_ps_epi8*(w: M128i, u: MMask8, a: M128): M128i {.importc: "_mm_mask_ipcvts_ps_epi8".}

func mm_maskz_ipcvts_ps_epi8*(u: MMask8, a: M128): M128i {.importc: "_mm_maskz_ipcvts_ps_epi8".}

func mm_ipcvts_ps_epu8*(a: M128): M128i {.importc: "_mm_ipcvts_ps_epu8".}

func mm_mask_ipcvts_ps_epu8*(w: M128i, u: MMask8, a: M128): M128i {.importc: "_mm_mask_ipcvts_ps_epu8".}

func mm_maskz_ipcvts_ps_epu8*(u: MMask8, a: M128): M128i {.importc: "_mm_maskz_ipcvts_ps_epu8".}

func mm_ipcvtts_ph_epi8*(a: M128h): M128i {.importc: "_mm_ipcvtts_ph_epi8".}

func mm_mask_ipcvtts_ph_epi8*(w: M128i, u: MMask8, a: M128h): M128i {.importc: "_mm_mask_ipcvtts_ph_epi8".}

func mm_maskz_ipcvtts_ph_epi8*(u: MMask8, a: M128h): M128i {.importc: "_mm_maskz_ipcvtts_ph_epi8".}

func mm_ipcvtts_ph_epu8*(a: M128h): M128i {.importc: "_mm_ipcvtts_ph_epu8".}

func mm_mask_ipcvtts_ph_epu8*(w: M128i, u: MMask8, a: M128h): M128i {.importc: "_mm_mask_ipcvtts_ph_epu8".}

func mm_maskz_ipcvtts_ph_epu8*(u: MMask8, a: M128h): M128i {.importc: "_mm_maskz_ipcvtts_ph_epu8".}

func mm_ipcvtts_ps_epi8*(a: M128): M128i {.importc: "_mm_ipcvtts_ps_epi8".}

func mm_mask_ipcvtts_ps_epi8*(w: M128i, u: MMask8, a: M128): M128i {.importc: "_mm_mask_ipcvtts_ps_epi8".}

func mm_maskz_ipcvtts_ps_epi8*(u: MMask8, a: M128): M128i {.importc: "_mm_maskz_ipcvtts_ps_epi8".}

func mm_ipcvtts_ps_epu8*(a: M128): M128i {.importc: "_mm_ipcvtts_ps_epu8".}

func mm_mask_ipcvtts_ps_epu8*(w: M128i, u: MMask8, a: M128): M128i {.importc: "_mm_mask_ipcvtts_ps_epu8".}

func mm_maskz_ipcvtts_ps_epu8*(u: MMask8, a: M128): M128i {.importc: "_mm_maskz_ipcvtts_ps_epu8".}

func mm_cvtts_pd_epi32*(a: M128d): M128i {.importc: "_mm_cvtts_pd_epi32".}

func mm_mask_cvtts_pd_epi32*(w: M128i, u: MMask8, a: M128d): M128i {.importc: "_mm_mask_cvtts_pd_epi32".}

func mm_maskz_cvtts_pd_epi32*(u: MMask8, a: M128d): M128i {.importc: "_mm_maskz_cvtts_pd_epi32".}

func mm_cvtts_pd_epi64*(a: M128d): M128i {.importc: "_mm_cvtts_pd_epi64".}

func mm_mask_cvtts_pd_epi64*(w: M128i, u: MMask8, a: M128d): M128i {.importc: "_mm_mask_cvtts_pd_epi64".}

func mm_maskz_cvtts_pd_epi64*(u: MMask8, a: M128d): M128i {.importc: "_mm_maskz_cvtts_pd_epi64".}

func mm_cvtts_pd_epu32*(a: M128d): M128i {.importc: "_mm_cvtts_pd_epu32".}

func mm_mask_cvtts_pd_epu32*(w: M128i, u: MMask8, a: M128d): M128i {.importc: "_mm_mask_cvtts_pd_epu32".}

func mm_maskz_cvtts_pd_epu32*(u: MMask8, a: M128d): M128i {.importc: "_mm_maskz_cvtts_pd_epu32".}

func mm_cvtts_pd_epu64*(a: M128d): M128i {.importc: "_mm_cvtts_pd_epu64".}

func mm_mask_cvtts_pd_epu64*(w: M128i, u: MMask8, a: M128d): M128i {.importc: "_mm_mask_cvtts_pd_epu64".}

func mm_maskz_cvtts_pd_epu64*(u: MMask8, a: M128d): M128i {.importc: "_mm_maskz_cvtts_pd_epu64".}

func mm_cvtts_ps_epi32*(a: M128): M128i {.importc: "_mm_cvtts_ps_epi32".}

func mm_mask_cvtts_ps_epi32*(w: M128i, u: MMask8, a: M128): M128i {.importc: "_mm_mask_cvtts_ps_epi32".}

func mm_maskz_cvtts_ps_epi32*(u: MMask8, a: M128): M128i {.importc: "_mm_maskz_cvtts_ps_epi32".}

func mm_cvtts_ps_epi64*(a: M128): M128i {.importc: "_mm_cvtts_ps_epi64".}

func mm_mask_cvtts_ps_epi64*(w: M128i, u: MMask8, a: M128): M128i {.importc: "_mm_mask_cvtts_ps_epi64".}

func mm_maskz_cvtts_ps_epi64*(u: MMask8, a: M128): M128i {.importc: "_mm_maskz_cvtts_ps_epi64".}

func mm_cvtts_ps_epu32*(a: M128): M128i {.importc: "_mm_cvtts_ps_epu32".}

func mm_mask_cvtts_ps_epu32*(w: M128i, u: MMask8, a: M128): M128i {.importc: "_mm_mask_cvtts_ps_epu32".}

func mm_maskz_cvtts_ps_epu32*(u: MMask8, a: M128): M128i {.importc: "_mm_maskz_cvtts_ps_epu32".}

func mm_cvtts_ps_epu64*(a: M128): M128i {.importc: "_mm_cvtts_ps_epu64".}

func mm_mask_cvtts_ps_epu64*(w: M128i, u: MMask8, a: M128): M128i {.importc: "_mm_mask_cvtts_ps_epu64".}

func mm_maskz_cvtts_ps_epu64*(u: MMask8, a: M128): M128i {.importc: "_mm_maskz_cvtts_ps_epu64".}

func mm256_ipcvts_ph_epi8*(a: M256h): M256i {.importc: "_mm256_ipcvts_ph_epi8".}

func mm256_mask_ipcvts_ph_epi8*(w: M256i, u: MMask16, a: M256h): M256i {.importc: "_mm256_mask_ipcvts_ph_epi8".}

func mm256_maskz_ipcvts_ph_epi8*(u: MMask16, a: M256h): M256i {.importc: "_mm256_maskz_ipcvts_ph_epi8".}

func mm256_ipcvts_ph_epu8*(a: M256h): M256i {.importc: "_mm256_ipcvts_ph_epu8".}

func mm256_mask_ipcvts_ph_epu8*(w: M256i, u: MMask16, a: M256h): M256i {.importc: "_mm256_mask_ipcvts_ph_epu8".}

func mm256_maskz_ipcvts_ph_epu8*(u: MMask16, a: M256h): M256i {.importc: "_mm256_maskz_ipcvts_ph_epu8".}

func mm256_ipcvts_ps_epi8*(a: M256): M256i {.importc: "_mm256_ipcvts_ps_epi8".}

func mm256_mask_ipcvts_ps_epi8*(w: M256i, u: MMask8, a: M256): M256i {.importc: "_mm256_mask_ipcvts_ps_epi8".}

func mm256_maskz_ipcvts_ps_epi8*(u: MMask8, a: M256): M256i {.importc: "_mm256_maskz_ipcvts_ps_epi8".}

func mm256_ipcvts_ps_epu8*(a: M256): M256i {.importc: "_mm256_ipcvts_ps_epu8".}

func mm256_mask_ipcvts_ps_epu8*(w: M256i, u: MMask8, a: M256): M256i {.importc: "_mm256_mask_ipcvts_ps_epu8".}

func mm256_maskz_ipcvts_ps_epu8*(u: MMask8, a: M256): M256i {.importc: "_mm256_maskz_ipcvts_ps_epu8".}

func mm256_ipcvtts_ph_epi8*(a: M256h): M256i {.importc: "_mm256_ipcvtts_ph_epi8".}

func mm256_mask_ipcvtts_ph_epi8*(w: M256i, u: MMask16, a: M256h): M256i {.importc: "_mm256_mask_ipcvtts_ph_epi8".}

func mm256_maskz_ipcvtts_ph_epi8*(u: MMask16, a: M256h): M256i {.importc: "_mm256_maskz_ipcvtts_ph_epi8".}

func mm256_ipcvtts_ph_epu8*(a: M256h): M256i {.importc: "_mm256_ipcvtts_ph_epu8".}

func mm256_mask_ipcvtts_ph_epu8*(w: M256i, u: MMask16, a: M256h): M256i {.importc: "_mm256_mask_ipcvtts_ph_epu8".}

func mm256_maskz_ipcvtts_ph_epu8*(u: MMask16, a: M256h): M256i {.importc: "_mm256_maskz_ipcvtts_ph_epu8".}

func mm256_ipcvtts_ps_epi8*(a: M256): M256i {.importc: "_mm256_ipcvtts_ps_epi8".}

func mm256_mask_ipcvtts_ps_epi8*(w: M256i, u: MMask8, a: M256): M256i {.importc: "_mm256_mask_ipcvtts_ps_epi8".}

func mm256_maskz_ipcvtts_ps_epi8*(u: MMask8, a: M256): M256i {.importc: "_mm256_maskz_ipcvtts_ps_epi8".}

func mm256_ipcvtts_ps_epu8*(a: M256): M256i {.importc: "_mm256_ipcvtts_ps_epu8".}

func mm256_mask_ipcvtts_ps_epu8*(w: M256i, u: MMask8, a: M256): M256i {.importc: "_mm256_mask_ipcvtts_ps_epu8".}

func mm256_maskz_ipcvtts_ps_epu8*(u: MMask8, a: M256): M256i {.importc: "_mm256_maskz_ipcvtts_ps_epu8".}

func mm256_cvtts_pd_epi32*(a: M256d): M128i {.importc: "_mm256_cvtts_pd_epi32".}

func mm256_mask_cvtts_pd_epi32*(w: M128i, u: MMask8, a: M256d): M128i {.importc: "_mm256_mask_cvtts_pd_epi32".}

func mm256_maskz_cvtts_pd_epi32*(u: MMask8, a: M256d): M128i {.importc: "_mm256_maskz_cvtts_pd_epi32".}

func mm256_cvtts_pd_epi64*(a: M256d): M256i {.importc: "_mm256_cvtts_pd_epi64".}

func mm256_mask_cvtts_pd_epi64*(w: M256i, u: MMask8, a: M256d): M256i {.importc: "_mm256_mask_cvtts_pd_epi64".}

func mm256_maskz_cvtts_pd_epi64*(u: MMask8, a: M256d): M256i {.importc: "_mm256_maskz_cvtts_pd_epi64".}

func mm256_cvtts_pd_epu32*(a: M256d): M128i {.importc: "_mm256_cvtts_pd_epu32".}

func mm256_mask_cvtts_pd_epu32*(w: M128i, u: MMask8, a: M256d): M128i {.importc: "_mm256_mask_cvtts_pd_epu32".}

func mm256_maskz_cvtts_pd_epu32*(u: MMask8, a: M256d): M128i {.importc: "_mm256_maskz_cvtts_pd_epu32".}

func mm256_cvtts_pd_epu64*(a: M256d): M256i {.importc: "_mm256_cvtts_pd_epu64".}

func mm256_mask_cvtts_pd_epu64*(w: M256i, u: MMask8, a: M256d): M256i {.importc: "_mm256_mask_cvtts_pd_epu64".}

func mm256_maskz_cvtts_pd_epu64*(u: MMask8, a: M256d): M256i {.importc: "_mm256_maskz_cvtts_pd_epu64".}

func mm256_cvtts_ps_epi32*(a: M256): M256i {.importc: "_mm256_cvtts_ps_epi32".}

func mm256_mask_cvtts_ps_epi32*(w: M256i, u: MMask8, a: M256): M256i {.importc: "_mm256_mask_cvtts_ps_epi32".}

func mm256_maskz_cvtts_ps_epi32*(u: MMask8, a: M256): M256i {.importc: "_mm256_maskz_cvtts_ps_epi32".}

func mm256_cvtts_ps_epi64*(a: M128): M256i {.importc: "_mm256_cvtts_ps_epi64".}

func mm256_mask_cvtts_ps_epi64*(w: M256i, u: MMask8, a: M128): M256i {.importc: "_mm256_mask_cvtts_ps_epi64".}

func mm256_maskz_cvtts_ps_epi64*(u: MMask8, a: M128): M256i {.importc: "_mm256_maskz_cvtts_ps_epi64".}

func mm256_cvtts_ps_epu32*(a: M256): M256i {.importc: "_mm256_cvtts_ps_epu32".}

func mm256_mask_cvtts_ps_epu32*(w: M256i, u: MMask8, a: M256): M256i {.importc: "_mm256_mask_cvtts_ps_epu32".}

func mm256_maskz_cvtts_ps_epu32*(u: MMask8, a: M256): M256i {.importc: "_mm256_maskz_cvtts_ps_epu32".}

func mm256_cvtts_ps_epu64*(a: M128): M256i {.importc: "_mm256_cvtts_ps_epu64".}

func mm256_mask_cvtts_ps_epu64*(w: M256i, u: MMask8, a: M128): M256i {.importc: "_mm256_mask_cvtts_ps_epu64".}

func mm256_maskz_cvtts_ps_epu64*(u: MMask8, a: M128): M256i {.importc: "_mm256_maskz_cvtts_ps_epu64".}

func mm512_ipcvts_ph_epi8*(a: M512h): M512i {.importc: "_mm512_ipcvts_ph_epi8".}

func mm512_mask_ipcvts_ph_epi8*(w: M512i, u: MMask32, a: M512h): M512i {.importc: "_mm512_mask_ipcvts_ph_epi8".}

func mm512_maskz_ipcvts_ph_epi8*(u: MMask32, a: M512h): M512i {.importc: "_mm512_maskz_ipcvts_ph_epi8".}

func mm512_ipcvts_ph_epu8*(a: M512h): M512i {.importc: "_mm512_ipcvts_ph_epu8".}

func mm512_mask_ipcvts_ph_epu8*(w: M512i, u: MMask32, a: M512h): M512i {.importc: "_mm512_mask_ipcvts_ph_epu8".}

func mm512_maskz_ipcvts_ph_epu8*(u: MMask32, a: M512h): M512i {.importc: "_mm512_maskz_ipcvts_ph_epu8".}

func mm512_ipcvts_ps_epi8*(a: M512): M512i {.importc: "_mm512_ipcvts_ps_epi8".}

func mm512_mask_ipcvts_ps_epi8*(w: M512i, u: MMask16, a: M512): M512i {.importc: "_mm512_mask_ipcvts_ps_epi8".}

func mm512_maskz_ipcvts_ps_epi8*(u: MMask16, a: M512): M512i {.importc: "_mm512_maskz_ipcvts_ps_epi8".}

func mm512_ipcvts_ps_epu8*(a: M512): M512i {.importc: "_mm512_ipcvts_ps_epu8".}

func mm512_mask_ipcvts_ps_epu8*(w: M512i, u: MMask16, a: M512): M512i {.importc: "_mm512_mask_ipcvts_ps_epu8".}

func mm512_maskz_ipcvts_ps_epu8*(u: MMask16, a: M512): M512i {.importc: "_mm512_maskz_ipcvts_ps_epu8".}

func mm512_ipcvtts_ph_epi8*(a: M512h): M512i {.importc: "_mm512_ipcvtts_ph_epi8".}

func mm512_mask_ipcvtts_ph_epi8*(w: M512i, u: MMask32, a: M512h): M512i {.importc: "_mm512_mask_ipcvtts_ph_epi8".}

func mm512_maskz_ipcvtts_ph_epi8*(u: MMask32, a: M512h): M512i {.importc: "_mm512_maskz_ipcvtts_ph_epi8".}

func mm512_ipcvtts_ph_epu8*(a: M512h): M512i {.importc: "_mm512_ipcvtts_ph_epu8".}

func mm512_mask_ipcvtts_ph_epu8*(w: M512i, u: MMask32, a: M512h): M512i {.importc: "_mm512_mask_ipcvtts_ph_epu8".}

func mm512_maskz_ipcvtts_ph_epu8*(u: MMask32, a: M512h): M512i {.importc: "_mm512_maskz_ipcvtts_ph_epu8".}

func mm512_ipcvtts_ps_epi8*(a: M512): M512i {.importc: "_mm512_ipcvtts_ps_epi8".}

func mm512_mask_ipcvtts_ps_epi8*(w: M512i, u: MMask16, a: M512): M512i {.importc: "_mm512_mask_ipcvtts_ps_epi8".}

func mm512_maskz_ipcvtts_ps_epi8*(u: MMask16, a: M512): M512i {.importc: "_mm512_maskz_ipcvtts_ps_epi8".}

func mm512_ipcvtts_ps_epu8*(a: M512): M512i {.importc: "_mm512_ipcvtts_ps_epu8".}

func mm512_mask_ipcvtts_ps_epu8*(w: M512i, u: MMask16, a: M512): M512i {.importc: "_mm512_mask_ipcvtts_ps_epu8".}

func mm512_maskz_ipcvtts_ps_epu8*(u: MMask16, a: M512): M512i {.importc: "_mm512_maskz_ipcvtts_ps_epu8".}

func mm512_cvtts_pd_epi32*(a: M512d): M256i {.importc: "_mm512_cvtts_pd_epi32".}

func mm512_mask_cvtts_pd_epi32*(w: M256i, u: MMask8, a: M512d): M256i {.importc: "_mm512_mask_cvtts_pd_epi32".}

func mm512_maskz_cvtts_pd_epi32*(u: MMask8, a: M512d): M256i {.importc: "_mm512_maskz_cvtts_pd_epi32".}

func mm512_cvtts_pd_epi64*(a: M512d): M512i {.importc: "_mm512_cvtts_pd_epi64".}

func mm512_mask_cvtts_pd_epi64*(w: M512i, u: MMask8, a: M512d): M512i {.importc: "_mm512_mask_cvtts_pd_epi64".}

func mm512_maskz_cvtts_pd_epi64*(u: MMask8, a: M512d): M512i {.importc: "_mm512_maskz_cvtts_pd_epi64".}

func mm512_cvtts_pd_epu32*(a: M512d): M256i {.importc: "_mm512_cvtts_pd_epu32".}

func mm512_mask_cvtts_pd_epu32*(w: M256i, u: MMask8, a: M512d): M256i {.importc: "_mm512_mask_cvtts_pd_epu32".}

func mm512_maskz_cvtts_pd_epu32*(u: MMask8, a: M512d): M256i {.importc: "_mm512_maskz_cvtts_pd_epu32".}

func mm512_cvtts_pd_epu64*(a: M512d): M512i {.importc: "_mm512_cvtts_pd_epu64".}

func mm512_mask_cvtts_pd_epu64*(w: M512i, u: MMask8, a: M512d): M512i {.importc: "_mm512_mask_cvtts_pd_epu64".}

func mm512_maskz_cvtts_pd_epu64*(u: MMask8, a: M512d): M512i {.importc: "_mm512_maskz_cvtts_pd_epu64".}

func mm512_cvtts_ps_epi32*(a: M512): M512i {.importc: "_mm512_cvtts_ps_epi32".}

func mm512_mask_cvtts_ps_epi32*(w: M512i, u: MMask16, a: M512): M512i {.importc: "_mm512_mask_cvtts_ps_epi32".}

func mm512_maskz_cvtts_ps_epi32*(u: MMask16, a: M512): M512i {.importc: "_mm512_maskz_cvtts_ps_epi32".}

func mm512_cvtts_ps_epi64*(a: M256): M512i {.importc: "_mm512_cvtts_ps_epi64".}

func mm512_mask_cvtts_ps_epi64*(w: M512i, u: MMask8, a: M256): M512i {.importc: "_mm512_mask_cvtts_ps_epi64".}

func mm512_maskz_cvtts_ps_epi64*(u: MMask8, a: M256): M512i {.importc: "_mm512_maskz_cvtts_ps_epi64".}

func mm512_cvtts_ps_epu32*(a: M512): M512i {.importc: "_mm512_cvtts_ps_epu32".}

func mm512_mask_cvtts_ps_epu32*(w: M512i, u: MMask16, a: M512): M512i {.importc: "_mm512_mask_cvtts_ps_epu32".}

func mm512_maskz_cvtts_ps_epu32*(u: MMask16, a: M512): M512i {.importc: "_mm512_maskz_cvtts_ps_epu32".}

func mm512_cvtts_ps_epu64*(a: M256): M512i {.importc: "_mm512_cvtts_ps_epu64".}

func mm512_mask_cvtts_ps_epu64*(w: M512i, u: MMask8, a: M256): M512i {.importc: "_mm512_mask_cvtts_ps_epu64".}

func mm512_maskz_cvtts_ps_epu64*(u: MMask8, a: M256): M512i {.importc: "_mm512_maskz_cvtts_ps_epu64".}

func mm512_ipcvts_roundph_epi8*(a: M512h, r: int32): M512i {.importc: "_mm512_ipcvts_roundph_epi8".}

func mm512_mask_ipcvts_roundph_epi8*(w: M512i, u: MMask32, a: M512h, r: int32): M512i {.importc: "_mm512_mask_ipcvts_roundph_epi8".}

func mm512_maskz_ipcvts_roundph_epi8*(u: MMask32, a: M512h, r: int32): M512i {.importc: "_mm512_maskz_ipcvts_roundph_epi8".}

func mm512_ipcvts_roundph_epu8*(a: M512h, r: int32): M512i {.importc: "_mm512_ipcvts_roundph_epu8".}

func mm512_mask_ipcvts_roundph_epu8*(w: M512i, u: MMask32, a: M512h, r: int32): M512i {.importc: "_mm512_mask_ipcvts_roundph_epu8".}

func mm512_maskz_ipcvts_roundph_epu8*(u: MMask32, a: M512h, r: int32): M512i {.importc: "_mm512_maskz_ipcvts_roundph_epu8".}

func mm512_ipcvts_roundps_epi8*(a: M512, r: int32): M512i {.importc: "_mm512_ipcvts_roundps_epi8".}

func mm512_mask_ipcvts_roundps_epi8*(w: M512i, u: MMask16, a: M512, r: int32): M512i {.importc: "_mm512_mask_ipcvts_roundps_epi8".}

func mm512_maskz_ipcvts_roundps_epi8*(u: MMask16, a: M512, r: int32): M512i {.importc: "_mm512_maskz_ipcvts_roundps_epi8".}

func mm512_ipcvts_roundps_epu8*(a: M512, r: int32): M512i {.importc: "_mm512_ipcvts_roundps_epu8".}

func mm512_mask_ipcvts_roundps_epu8*(w: M512i, u: MMask16, a: M512, r: int32): M512i {.importc: "_mm512_mask_ipcvts_roundps_epu8".}

func mm512_maskz_ipcvts_roundps_epu8*(u: MMask16, a: M512, r: int32): M512i {.importc: "_mm512_maskz_ipcvts_roundps_epu8".}

func mm512_ipcvtts_roundph_epi8*(a: M512h, r: int32): M512i {.importc: "_mm512_ipcvtts_roundph_epi8".}

func mm512_mask_ipcvtts_roundph_epi8*(w: M512i, u: MMask32, a: M512h, r: int32): M512i {.importc: "_mm512_mask_ipcvtts_roundph_epi8".}

func mm512_maskz_ipcvtts_roundph_epi8*(u: MMask32, a: M512h, r: int32): M512i {.importc: "_mm512_maskz_ipcvtts_roundph_epi8".}

func mm512_ipcvtts_roundph_epu8*(a: M512h, r: int32): M512i {.importc: "_mm512_ipcvtts_roundph_epu8".}

func mm512_mask_ipcvtts_roundph_epu8*(w: M512i, u: MMask32, a: M512h, r: int32): M512i {.importc: "_mm512_mask_ipcvtts_roundph_epu8".}

func mm512_maskz_ipcvtts_roundph_epu8*(u: MMask32, a: M512h, r: int32): M512i {.importc: "_mm512_maskz_ipcvtts_roundph_epu8".}

func mm512_ipcvtts_roundps_epi8*(a: M512, r: int32): M512i {.importc: "_mm512_ipcvtts_roundps_epi8".}

func mm512_mask_ipcvtts_roundps_epi8*(w: M512i, u: MMask16, a: M512, r: int32): M512i {.importc: "_mm512_mask_ipcvtts_roundps_epi8".}

func mm512_maskz_ipcvtts_roundps_epi8*(u: MMask16, a: M512, r: int32): M512i {.importc: "_mm512_maskz_ipcvtts_roundps_epi8".}

func mm512_ipcvtts_roundps_epu8*(a: M512, r: int32): M512i {.importc: "_mm512_ipcvtts_roundps_epu8".}

func mm512_mask_ipcvtts_roundps_epu8*(w: M512i, u: MMask16, a: M512, r: int32): M512i {.importc: "_mm512_mask_ipcvtts_roundps_epu8".}

func mm512_maskz_ipcvtts_roundps_epu8*(u: MMask16, a: M512, r: int32): M512i {.importc: "_mm512_maskz_ipcvtts_roundps_epu8".}

func mm512_cvtts_roundpd_epi32*(a: M512d, r: int32): M256i {.importc: "_mm512_cvtts_roundpd_epi32".}

func mm512_mask_cvtts_roundpd_epi32*(w: M256i, u: MMask8, a: M512d, r: int32): M256i {.importc: "_mm512_mask_cvtts_roundpd_epi32".}

func mm512_maskz_cvtts_roundpd_epi32*(u: MMask8, a: M512d, r: int32): M256i {.importc: "_mm512_maskz_cvtts_roundpd_epi32".}

func mm512_cvtts_roundpd_epi64*(a: M512d, r: int32): M512i {.importc: "_mm512_cvtts_roundpd_epi64".}

func mm512_mask_cvtts_roundpd_epi64*(w: M512i, u: MMask8, a: M512d, r: int32): M512i {.importc: "_mm512_mask_cvtts_roundpd_epi64".}

func mm512_maskz_cvtts_roundpd_epi64*(u: MMask8, a: M512d, r: int32): M512i {.importc: "_mm512_maskz_cvtts_roundpd_epi64".}

func mm512_cvtts_roundpd_epu32*(a: M512d, r: int32): M256i {.importc: "_mm512_cvtts_roundpd_epu32".}

func mm512_mask_cvtts_roundpd_epu32*(w: M256i, u: MMask8, a: M512d, r: int32): M256i {.importc: "_mm512_mask_cvtts_roundpd_epu32".}

func mm512_maskz_cvtts_roundpd_epu32*(u: MMask8, a: M512d, r: int32): M256i {.importc: "_mm512_maskz_cvtts_roundpd_epu32".}

func mm512_cvtts_roundpd_epu64*(a: M512d, r: int32): M512i {.importc: "_mm512_cvtts_roundpd_epu64".}

func mm512_mask_cvtts_roundpd_epu64*(w: M512i, u: MMask8, a: M512d, r: int32): M512i {.importc: "_mm512_mask_cvtts_roundpd_epu64".}

func mm512_maskz_cvtts_roundpd_epu64*(u: MMask8, a: M512d, r: int32): M512i {.importc: "_mm512_maskz_cvtts_roundpd_epu64".}

func mm512_cvtts_roundps_epi32*(a: M512, r: int32): M512i {.importc: "_mm512_cvtts_roundps_epi32".}

func mm512_mask_cvtts_roundps_epi32*(w: M512i, u: MMask16, a: M512, r: int32): M512i {.importc: "_mm512_mask_cvtts_roundps_epi32".}

func mm512_maskz_cvtts_roundps_epi32*(u: MMask16, a: M512, r: int32): M512i {.importc: "_mm512_maskz_cvtts_roundps_epi32".}

func mm512_cvtts_roundps_epi64*(a: M256, r: int32): M512i {.importc: "_mm512_cvtts_roundps_epi64".}

func mm512_mask_cvtts_roundps_epi64*(w: M512i, u: MMask8, a: M256, r: int32): M512i {.importc: "_mm512_mask_cvtts_roundps_epi64".}

func mm512_maskz_cvtts_roundps_epi64*(u: MMask8, a: M256, r: int32): M512i {.importc: "_mm512_maskz_cvtts_roundps_epi64".}

func mm512_cvtts_roundps_epu32*(a: M512, r: int32): M512i {.importc: "_mm512_cvtts_roundps_epu32".}

func mm512_mask_cvtts_roundps_epu32*(w: M512i, u: MMask16, a: M512, r: int32): M512i {.importc: "_mm512_mask_cvtts_roundps_epu32".}

func mm512_maskz_cvtts_roundps_epu32*(u: MMask16, a: M512, r: int32): M512i {.importc: "_mm512_maskz_cvtts_roundps_epu32".}

func mm512_cvtts_roundps_epu64*(a: M256, r: int32): M512i {.importc: "_mm512_cvtts_roundps_epu64".}

func mm512_mask_cvtts_roundps_epu64*(w: M512i, u: MMask8, a: M256, r: int32): M512i {.importc: "_mm512_mask_cvtts_roundps_epu64".}

func mm512_maskz_cvtts_roundps_epu64*(u: MMask8, a: M256, r: int32): M512i {.importc: "_mm512_maskz_cvtts_roundps_epu64".}

## [Macro Original]
## #define _mm512_ipcvts_roundph_epi8(A, R) \
## ((__m512i) \
## __builtin_ia32_cvtph2ibs512_mask_round ((__v32hf) (A), \
## (__v32hi) \
## (_mm512_undefined_si512 ()), \
## (__mmask32) (-1), \
## (R)))

## [Macro Original]
## #define _mm512_mask_ipcvts_roundph_epi8(W, U, A, R) \
## ((__m512i) __builtin_ia32_cvtph2ibs512_mask_round ((__v32hf) (A), \
## (__v32hi) (W), \
## (__mmask32) (U), \
## (R)))

## [Macro Original]
## #define _mm512_maskz_ipcvts_roundph_epi8(U, A, R) \
## ((__m512i) \
## __builtin_ia32_cvtph2ibs512_mask_round ((__v32hf) (A), \
## (__v32hi) \
## (_mm512_setzero_si512 ()), \
## (__mmask32) (U), \
## (R)))

## [Macro Original]
## #define _mm512_ipcvts_roundph_epu8(A, R) \
## ((__m512i) \
## __builtin_ia32_cvtph2iubs512_mask_round ((__v32hf) (A), \
## (__v32hi) \
## (_mm512_undefined_si512 ()), \
## (__mmask32) (-1), \
## (R)))

## [Macro Original]
## #define _mm512_mask_ipcvts_roundph_epu8(W, U, A, R) \
## ((__m512i) __builtin_ia32_cvtph2iubs512_mask_round ((__v32hf) (A), \
## (__v32hi) (W), \
## (__mmask32) (U), \
## (R)))

## [Macro Original]
## #define _mm512_maskz_ipcvts_roundph_epu8(U, A, R) \
## ((__m512i) \
## __builtin_ia32_cvtph2iubs512_mask_round ((__v32hf) (A), \
## (__v32hi) \
## (_mm512_setzero_si512 ()), \
## (__mmask32) (U), \
## (R)))

## [Macro Original]
## #define _mm512_ipcvts_roundps_epi8(A, R) \
## ((__m512i) \
## __builtin_ia32_cvtps2ibs512_mask_round ((__v16sf) (A), \
## (__v16si) \
## (_mm512_undefined_si512 ()), \
## (__mmask16) (-1), \
## (R)))

## [Macro Original]
## #define _mm512_mask_ipcvts_roundps_epi8(W, U, A, R) \
## ((__m512i) __builtin_ia32_cvtps2ibs512_mask_round ((__v16sf) (A), \
## (__v16si) (W), \
## (__mmask16) (U), \
## (R)))

## [Macro Original]
## #define _mm512_maskz_ipcvts_roundps_epi8(U, A, R) \
## ((__m512i) \
## __builtin_ia32_cvtps2ibs512_mask_round ((__v16sf) (A), \
## (__v16si) \
## (_mm512_setzero_si512 ()), \
## (__mmask16) (U), \
## (R)))

## [Macro Original]
## #define _mm512_ipcvts_roundps_epu8(A, R) \
## ((__m512i) \
## __builtin_ia32_cvtps2iubs512_mask_round ((__v16sf) (A), \
## (__v16si) \
## (_mm512_undefined_si512 ()), \
## (__mmask16) (-1), \
## (R)))

## [Macro Original]
## #define _mm512_mask_ipcvts_roundps_epu8(W, U, A, R) \
## ((__m512i) __builtin_ia32_cvtps2iubs512_mask_round ((__v16sf) (A), \
## (__v16si) (W), \
## (__mmask16) (U), \
## (R)))

## [Macro Original]
## #define _mm512_maskz_ipcvts_roundps_epu8(U, A, R) \
## ((__m512i) \
## __builtin_ia32_cvtps2iubs512_mask_round ((__v16sf) (A), \
## (__v16si) \
## (_mm512_setzero_si512 ()), \
## (__mmask16) (U), \
## (R)))

## [Macro Original]
## #define _mm512_ipcvtts_roundph_epi8(A, R) \
## ((__m512i) \
## __builtin_ia32_cvttph2ibs512_mask_round ((__v32hf) (A), \
## (__v32hi) \
## (_mm512_undefined_si512 ()), \
## (__mmask32) (-1), \
## (R)))

## [Macro Original]
## #define _mm512_mask_ipcvtts_roundph_epi8(W, U, A, R) \
## ((__m512i) __builtin_ia32_cvttph2ibs512_mask_round ((__v32hf) (A), \
## (__v32hi) (W), \
## (__mmask32) (U), \
## (R)))

## [Macro Original]
## #define _mm512_maskz_ipcvtts_roundph_epi8(U, A, R) \
## ((__m512i) \
## __builtin_ia32_cvttph2ibs512_mask_round ((__v32hf) (A), \
## (__v32hi) \
## (_mm512_setzero_si512 ()), \
## (__mmask32) (U), \
## (R)))

## [Macro Original]
## #define _mm512_ipcvtts_roundph_epu8(A, R) \
## ((__m512i) \
## __builtin_ia32_cvttph2iubs512_mask_round ((__v32hf) (A), \
## (__v32hi) \
## (_mm512_undefined_si512 ()), \
## (__mmask32) (-1), \
## (R)))

## [Macro Original]
## #define _mm512_mask_ipcvtts_roundph_epu8(W, U, A, R) \
## ((__m512i) __builtin_ia32_cvttph2iubs512_mask_round ((__v32hf) (A), \
## (__v32hi) (W), \
## (__mmask32) (U), \
## (R)))

## [Macro Original]
## #define _mm512_maskz_ipcvtts_roundph_epu8(U, A, R) \
## ((__m512i) \
## __builtin_ia32_cvttph2iubs512_mask_round ((__v32hf) (A), \
## (__v32hi) \
## (_mm512_setzero_si512 ()), \
## (__mmask32) (U), \
## (R)))

## [Macro Original]
## #define _mm512_ipcvtts_roundps_epi8(A, R) \
## ((__m512i) \
## __builtin_ia32_cvttps2ibs512_mask_round ((__v16sf) (A), \
## (__v16si) \
## (_mm512_undefined_si512 ()), \
## (__mmask16) (-1), \
## (R)))

## [Macro Original]
## #define _mm512_mask_ipcvtts_roundps_epi8(W, U, A, R) \
## ((__m512i) __builtin_ia32_cvttps2ibs512_mask_round ((__v16sf) (A), \
## (__v16si) (W), \
## (__mmask16) (U), \
## (R)))

## [Macro Original]
## #define _mm512_maskz_ipcvtts_roundps_epi8(U, A, R) \
## ((__m512i) \
## __builtin_ia32_cvttps2ibs512_mask_round ((__v16sf) (A), \
## (__v16si) \
## (_mm512_setzero_si512 ()), \
## (__mmask16) (U), \
## (R)))

## [Macro Original]
## #define _mm512_ipcvtts_roundps_epu8(A, R) \
## ((__m512i) \
## __builtin_ia32_cvttps2iubs512_mask_round ((__v16sf) (A), \
## (__v16si) \
## (_mm512_undefined_si512 ()), \
## (__mmask16) (-1), \
## (R)))

## [Macro Original]
## #define _mm512_mask_ipcvtts_roundps_epu8(W, U, A, R) \
## ((__m512i) __builtin_ia32_cvttps2iubs512_mask_round ((__v16sf) (A), \
## (__v16si) (W), \
## (__mmask16) (U), \
## (R)))

## [Macro Original]
## #define _mm512_maskz_ipcvtts_roundps_epu8(U, A, R) \
## ((__m512i) \
## __builtin_ia32_cvttps2iubs512_mask_round ((__v16sf) (A), \
## (__v16si) \
## (_mm512_setzero_si512 ()), \
## (__mmask16) (U), \
## (R)))

## [Macro Original]
## #define _mm512_cvtts_roundpd_epi32(A, R) \
## ((__m256i) \
## __builtin_ia32_cvttpd2dqs512_mask_round ((__v8df) (A), \
## (__v8si) \
## (_mm256_undefined_si256 ()), \
## (__mmask8) (-1), \
## (R)))

## [Macro Original]
## #define _mm512_mask_cvtts_roundpd_epi32(W, U, A, R) \
## ((__m256i) __builtin_ia32_cvttpd2dqs512_mask_round ((__v8df) (A), \
## (__v8si) (W), \
## (__mmask8) (U), \
## (R)))

## [Macro Original]
## #define _mm512_maskz_cvtts_roundpd_epi32(U, A, R) \
## ((__m256i) \
## __builtin_ia32_cvttpd2dqs512_mask_round ((__v8df) (A), \
## (__v8si) \
## (_mm256_setzero_si256 ()), \
## (__mmask8) (U), \
## (R)))

## [Macro Original]
## #define _mm512_cvtts_roundpd_epi64(A, R) \
## ((__m512i) \
## __builtin_ia32_cvttpd2qqs512_mask_round ((__v8df) (A), \
## (__v8di) \
## (_mm512_undefined_si512 ()), \
## (__mmask8) (-1), \
## (R)))

## [Macro Original]
## #define _mm512_mask_cvtts_roundpd_epi64(W, U, A, R) \
## ((__m512i) __builtin_ia32_cvttpd2qqs512_mask_round ((__v8df) (A), \
## (__v8di) (W), \
## (__mmask8) (U), \
## (R)))

## [Macro Original]
## #define _mm512_maskz_cvtts_roundpd_epi64(U, A, R) \
## ((__m512i) \
## __builtin_ia32_cvttpd2qqs512_mask_round ((__v8df) (A), \
## (__v8di) \
## (_mm512_setzero_si512 ()), \
## (__mmask8) (U), \
## (R)))

## [Macro Original]
## #define _mm512_cvtts_roundpd_epu32(A, R) \
## ((__m256i) \
## __builtin_ia32_cvttpd2udqs512_mask_round ((__v8df) (A), \
## (__v8si) \
## (_mm256_undefined_si256 ()), \
## (__mmask8) (-1), \
## (R)))

## [Macro Original]
## #define _mm512_mask_cvtts_roundpd_epu32(W, U, A, R) \
## ((__m256i) __builtin_ia32_cvttpd2udqs512_mask_round ((__v8df) (A), \
## (__v8si) (W), \
## (__mmask8) (U), \
## (R)))

## [Macro Original]
## #define _mm512_maskz_cvtts_roundpd_epu32(U, A, R) \
## ((__m256i) \
## __builtin_ia32_cvttpd2udqs512_mask_round ((__v8df) (A), \
## (__v8si) \
## (_mm256_setzero_si256 ()), \
## (__mmask8) (U), \
## (R)))

## [Macro Original]
## #define _mm512_cvtts_roundpd_epu64(A, R) \
## ((__m512i) \
## __builtin_ia32_cvttpd2uqqs512_mask_round ((__v8df) (A), \
## (__v8di) \
## (_mm512_undefined_si512 ()), \
## (__mmask8) (-1), \
## (R)))

## [Macro Original]
## #define _mm512_mask_cvtts_roundpd_epu64(W, U, A, R) \
## ((__m512i) __builtin_ia32_cvttpd2uqqs512_mask_round ((__v8df) (A), \
## (__v8di) (W), \
## (__mmask8) (U), \
## (R)))

## [Macro Original]
## #define _mm512_maskz_cvtts_roundpd_epu64(U, A, R) \
## ((__m512i) \
## __builtin_ia32_cvttpd2uqqs512_mask_round ((__v8df) (A), \
## (__v8di) \
## (_mm512_setzero_si512 ()), \
## (__mmask8) (U), \
## (R)))

## [Macro Original]
## #define _mm512_cvtts_roundps_epi32(A, R) \
## ((__m512i) \
## __builtin_ia32_cvttps2dqs512_mask_round ((__v16sf) (A), \
## (__v16si) \
## (_mm512_undefined_si512 ()), \
## (__mmask16) (-1), \
## (R)))

## [Macro Original]
## #define _mm512_mask_cvtts_roundps_epi32(W, U, A, R) \
## ((__m512i) __builtin_ia32_cvttps2dqs512_mask_round ((__v16sf) (A), \
## (__v16si) (W), \
## (__mmask16) (U), \
## (R)))

## [Macro Original]
## #define _mm512_maskz_cvtts_roundps_epi32(U, A, R) \
## ((__m512i) \
## __builtin_ia32_cvttps2dqs512_mask_round ((__v16sf) (A), \
## (__v16si) \
## (_mm512_setzero_si512 ()), \
## (__mmask16) (U), \
## (R)))

## [Macro Original]
## #define _mm512_cvtts_roundps_epi64(A, R) \
## ((__m512i) \
## __builtin_ia32_cvttps2qqs512_mask_round ((__v8sf) (A), \
## (__v8di) \
## (_mm512_undefined_si512 ()), \
## (__mmask8) (-1), \
## (R)))

## [Macro Original]
## #define _mm512_mask_cvtts_roundps_epi64(W, U, A, R) \
## ((__m512i) __builtin_ia32_cvttps2qqs512_mask_round ((__v8sf) (A), \
## (__v8di) (W), \
## (__mmask8) (U), \
## (R)))

## [Macro Original]
## #define _mm512_maskz_cvtts_roundps_epi64(U, A, R) \
## ((__m512i) \
## __builtin_ia32_cvttps2qqs512_mask_round ((__v8sf) (A), \
## (__v8di) \
## (_mm512_setzero_si512 ()), \
## (__mmask8) (U), \
## (R)))

## [Macro Original]
## #define _mm512_cvtts_roundps_epu32(A, R) \
## ((__m512i) \
## __builtin_ia32_cvttps2udqs512_mask_round ((__v16sf) (A), \
## (__v16si) \
## (_mm512_undefined_si512 ()), \
## (__mmask16) (-1), \
## (R)))

## [Macro Original]
## #define _mm512_mask_cvtts_roundps_epu32(W, U, A, R) \
## ((__m512i) __builtin_ia32_cvttps2udqs512_mask_round ((__v16sf) (A), \
## (__v16si) (W), \
## (__mmask16) (U), \
## (R)))

## [Macro Original]
## #define _mm512_maskz_cvtts_roundps_epu32(U, A, R) \
## ((__m512i) \
## __builtin_ia32_cvttps2udqs512_mask_round ((__v16sf) (A), \
## (__v16si) \
## (_mm512_setzero_si512 ()), \
## (__mmask16) (U), \
## (R)))

## [Macro Original]
## #define _mm512_cvtts_roundps_epu64(A, R) \
## ((__m512i) \
## __builtin_ia32_cvttps2uqqs512_mask_round ((__v8sf) (A), \
## (__v8di) \
## (_mm512_undefined_si512 ()), \
## (__mmask8) (-1), \
## (R)))

## [Macro Original]
## #define _mm512_mask_cvtts_roundps_epu64(W, U, A, R) \
## ((__m512i) __builtin_ia32_cvttps2uqqs512_mask_round ((__v8sf) (A), \
## (__v8di) (W), \
## (__mmask8) (U), \
## (R)))

## [Macro Original]
## #define _mm512_maskz_cvtts_roundps_epu64(U, A, R) \
## ((__m512i) \
## __builtin_ia32_cvttps2uqqs512_mask_round ((__v8sf) (A), \
## (__v8di) \
## (_mm512_setzero_si512 ()), \
## (__mmask8) (U), \
## (R)))

func mm_cvtts_sd_epi32*(a: M128d): int32 {.importc: "_mm_cvtts_sd_epi32".}

func mm_cvtts_sd_epu32*(a: M128d): uint32 {.importc: "_mm_cvtts_sd_epu32".}

func mm_cvtts_ss_epi32*(a: M128): int32 {.importc: "_mm_cvtts_ss_epi32".}

func mm_cvtts_ss_epu32*(a: M128): uint32 {.importc: "_mm_cvtts_ss_epu32".}

func mm_cvtts_roundsd_epi32*(a: M128d, r: int32): int32 {.importc: "_mm_cvtts_roundsd_epi32".}

func mm_cvtts_roundsd_epu32*(a: M128d, r: int32): uint32 {.importc: "_mm_cvtts_roundsd_epu32".}

func mm_cvtts_roundss_epi32*(a: M128, r: int32): int32 {.importc: "_mm_cvtts_roundss_epi32".}

func mm_cvtts_roundss_epu32*(a: M128, r: int32): uint32 {.importc: "_mm_cvtts_roundss_epu32".}

## [Macro Original]
## #define _mm_cvtts_roundsd_epi32(A, R) \
## ((int) __builtin_ia32_cvttsd2sis32_round ((__v2df) (A), \
## (R)))

## [Macro Original]
## #define _mm_cvtts_roundsd_epu32(A, R) \
## ((unsigned int) __builtin_ia32_cvttsd2usis32_round ((__v2df) (A), \
## (R)))

## [Macro Original]
## #define _mm_cvtts_roundss_epi32(A, R) \
## ((int) __builtin_ia32_cvttss2sis32_round ((__v4sf) (A), \
## (R)))

## [Macro Original]
## #define _mm_cvtts_roundss_epu32(A, R) \
## ((unsigned int) __builtin_ia32_cvttss2usis32_round ((__v4sf) (A), \
## (R)))

func mm_cvtts_sd_epi64*(a: M128d): int64 {.importc: "_mm_cvtts_sd_epi64".}

func mm_cvtts_sd_epu64*(a: M128d): uint64 {.importc: "_mm_cvtts_sd_epu64".}

func mm_cvtts_ss_epi64*(a: M128): int64 {.importc: "_mm_cvtts_ss_epi64".}

func mm_cvtts_ss_epu64*(a: M128): uint64 {.importc: "_mm_cvtts_ss_epu64".}

func mm_cvtts_roundsd_epi64*(a: M128d, r: int32): int64 {.importc: "_mm_cvtts_roundsd_epi64".}

func mm_cvtts_roundsd_epu64*(a: M128d, r: int32): uint64 {.importc: "_mm_cvtts_roundsd_epu64".}

func mm_cvtts_roundss_epi64*(a: M128, r: int32): int64 {.importc: "_mm_cvtts_roundss_epi64".}

func mm_cvtts_roundss_epu64*(a: M128, r: int32): uint64 {.importc: "_mm_cvtts_roundss_epu64".}

## [Macro Original]
## #define _mm_cvtts_roundsd_epi64(A, R) \
## ((long long) __builtin_ia32_cvttsd2sis64_round ((__v2df) (A), \
## (R)))

## [Macro Original]
## #define _mm_cvtts_roundsd_epu64(A, R) \
## ((unsigned long long) __builtin_ia32_cvttsd2usis64_round ((__v2df) (A), \
## (R)))

## [Macro Original]
## #define _mm_cvtts_roundss_epi64(A, R) \
## ((long long) __builtin_ia32_cvttss2sis64_round ((__v4sf) (A), \
## (R)))

## [Macro Original]
## #define _mm_cvtts_roundss_epu64(A, R) \
## ((unsigned long long) __builtin_ia32_cvttss2usis64_round ((__v4sf) (A), \
## (R))) 