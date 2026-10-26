import lsx

type
  M256* {.importc: "__m256", header: "lasxintrin.h", bycopy.} = object
  M256i* {.importc: "__m256i", header: "lasxintrin.h", bycopy.} = object
  M256d* {.importc: "__m256d", header: "lasxintrin.h", bycopy.} = object

func lasx_xvsll_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsll_b".}

func lasx_xvsll_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsll_h".}

func lasx_xvsll_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsll_w".}

func lasx_xvsll_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsll_d".}

## [Macro Original]
## #define __lasx_xvslli_b(/*__m256i*/ _1, /*ui3*/ _2) \
## ((__m256i)__builtin_lasx_xvslli_b ((v32i8)(_1), (_2)))
func lasx_xvslli_b*(a: M256i, b: int32): M128i {.importc: "__lasx_xvslli_b".}

## [Macro Original]
## #define __lasx_xvslli_h(/*__m256i*/ _1, /*ui4*/ _2) \
## ((__m256i)__builtin_lasx_xvslli_h ((v16i16)(_1), (_2)))
func lasx_xvslli_h*(a: M256i, b: int32): M128i {.importc: "__lasx_xvslli_h".}

## [Macro Original]
## #define __lasx_xvslli_w(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvslli_w ((v8i32)(_1), (_2)))
func lasx_xvslli_w*(a: M256i, b: int32): M128i {.importc: "__lasx_xvslli_w".}

## [Macro Original]
## #define __lasx_xvslli_d(/*__m256i*/ _1, /*ui6*/ _2) \
## ((__m256i)__builtin_lasx_xvslli_d ((v4i64)(_1), (_2)))
func lasx_xvslli_d*(a: M256i, b: int32): M128i {.importc: "__lasx_xvslli_d".}

func lasx_xvsra_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsra_b".}

func lasx_xvsra_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsra_h".}

func lasx_xvsra_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsra_w".}

func lasx_xvsra_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsra_d".}

## [Macro Original]
## #define __lasx_xvsrai_b(/*__m256i*/ _1, /*ui3*/ _2) \
## ((__m256i)__builtin_lasx_xvsrai_b ((v32i8)(_1), (_2)))
func lasx_xvsrai_b*(a: M256i, b: int32): M128i {.importc: "__lasx_xvsrai_b".}

## [Macro Original]
## #define __lasx_xvsrai_h(/*__m256i*/ _1, /*ui4*/ _2) \
## ((__m256i)__builtin_lasx_xvsrai_h ((v16i16)(_1), (_2)))
func lasx_xvsrai_h*(a: M256i, b: int32): M128i {.importc: "__lasx_xvsrai_h".}

## [Macro Original]
## #define __lasx_xvsrai_w(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvsrai_w ((v8i32)(_1), (_2)))
func lasx_xvsrai_w*(a: M256i, b: int32): M128i {.importc: "__lasx_xvsrai_w".}

## [Macro Original]
## #define __lasx_xvsrai_d(/*__m256i*/ _1, /*ui6*/ _2) \
## ((__m256i)__builtin_lasx_xvsrai_d ((v4i64)(_1), (_2)))
func lasx_xvsrai_d*(a: M256i, b: int32): M128i {.importc: "__lasx_xvsrai_d".}

func lasx_xvsrar_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsrar_b".}

func lasx_xvsrar_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsrar_h".}

func lasx_xvsrar_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsrar_w".}

func lasx_xvsrar_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsrar_d".}

## [Macro Original]
## #define __lasx_xvsrari_b(/*__m256i*/ _1, /*ui3*/ _2) \
## ((__m256i)__builtin_lasx_xvsrari_b ((v32i8)(_1), (_2)))
func lasx_xvsrari_b*(a: M256i, b: int32): M128i {.importc: "__lasx_xvsrari_b".}

## [Macro Original]
## #define __lasx_xvsrari_h(/*__m256i*/ _1, /*ui4*/ _2) \
## ((__m256i)__builtin_lasx_xvsrari_h ((v16i16)(_1), (_2)))
func lasx_xvsrari_h*(a: M256i, b: int32): M128i {.importc: "__lasx_xvsrari_h".}

## [Macro Original]
## #define __lasx_xvsrari_w(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvsrari_w ((v8i32)(_1), (_2)))
func lasx_xvsrari_w*(a: M256i, b: int32): M128i {.importc: "__lasx_xvsrari_w".}

## [Macro Original]
## #define __lasx_xvsrari_d(/*__m256i*/ _1, /*ui6*/ _2) \
## ((__m256i)__builtin_lasx_xvsrari_d ((v4i64)(_1), (_2)))
func lasx_xvsrari_d*(a: M256i, b: int32): M128i {.importc: "__lasx_xvsrari_d".}

func lasx_xvsrl_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsrl_b".}

func lasx_xvsrl_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsrl_h".}

func lasx_xvsrl_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsrl_w".}

func lasx_xvsrl_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsrl_d".}

## [Macro Original]
## #define __lasx_xvsrli_b(/*__m256i*/ _1, /*ui3*/ _2) \
## ((__m256i)__builtin_lasx_xvsrli_b ((v32i8)(_1), (_2)))
func lasx_xvsrli_b*(a: M256i, b: int32): M128i {.importc: "__lasx_xvsrli_b".}

## [Macro Original]
## #define __lasx_xvsrli_h(/*__m256i*/ _1, /*ui4*/ _2) \
## ((__m256i)__builtin_lasx_xvsrli_h ((v16i16)(_1), (_2)))
func lasx_xvsrli_h*(a: M256i, b: int32): M128i {.importc: "__lasx_xvsrli_h".}

## [Macro Original]
## #define __lasx_xvsrli_w(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvsrli_w ((v8i32)(_1), (_2)))
func lasx_xvsrli_w*(a: M256i, b: int32): M128i {.importc: "__lasx_xvsrli_w".}

## [Macro Original]
## #define __lasx_xvsrli_d(/*__m256i*/ _1, /*ui6*/ _2) \
## ((__m256i)__builtin_lasx_xvsrli_d ((v4i64)(_1), (_2)))
func lasx_xvsrli_d*(a: M256i, b: int32): M128i {.importc: "__lasx_xvsrli_d".}

func lasx_xvsrlr_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsrlr_b".}

func lasx_xvsrlr_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsrlr_h".}

func lasx_xvsrlr_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsrlr_w".}

func lasx_xvsrlr_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsrlr_d".}

## [Macro Original]
## #define __lasx_xvsrlri_b(/*__m256i*/ _1, /*ui3*/ _2) \
## ((__m256i)__builtin_lasx_xvsrlri_b ((v32i8)(_1), (_2)))
func lasx_xvsrlri_b*(a: M256i, b: int32): M128i {.importc: "__lasx_xvsrlri_b".}

## [Macro Original]
## #define __lasx_xvsrlri_h(/*__m256i*/ _1, /*ui4*/ _2) \
## ((__m256i)__builtin_lasx_xvsrlri_h ((v16i16)(_1), (_2)))
func lasx_xvsrlri_h*(a: M256i, b: int32): M128i {.importc: "__lasx_xvsrlri_h".}

## [Macro Original]
## #define __lasx_xvsrlri_w(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvsrlri_w ((v8i32)(_1), (_2)))
func lasx_xvsrlri_w*(a: M256i, b: int32): M128i {.importc: "__lasx_xvsrlri_w".}

## [Macro Original]
## #define __lasx_xvsrlri_d(/*__m256i*/ _1, /*ui6*/ _2) \
## ((__m256i)__builtin_lasx_xvsrlri_d ((v4i64)(_1), (_2)))
func lasx_xvsrlri_d*(a: M256i, b: int32): M128i {.importc: "__lasx_xvsrlri_d".}

func lasx_xvbitclr_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvbitclr_b".}

func lasx_xvbitclr_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvbitclr_h".}

func lasx_xvbitclr_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvbitclr_w".}

func lasx_xvbitclr_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvbitclr_d".}

## [Macro Original]
## #define __lasx_xvbitclri_b(/*__m256i*/ _1, /*ui3*/ _2) \
## ((__m256i)__builtin_lasx_xvbitclri_b ((v32u8)(_1), (_2)))
func lasx_xvbitclri_b*(a: M256i, b: int32): M128i {.importc: "__lasx_xvbitclri_b".}

## [Macro Original]
## #define __lasx_xvbitclri_h(/*__m256i*/ _1, /*ui4*/ _2) \
## ((__m256i)__builtin_lasx_xvbitclri_h ((v16u16)(_1), (_2)))
func lasx_xvbitclri_h*(a: M256i, b: int32): M128i {.importc: "__lasx_xvbitclri_h".}

## [Macro Original]
## #define __lasx_xvbitclri_w(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvbitclri_w ((v8u32)(_1), (_2)))
func lasx_xvbitclri_w*(a: M256i, b: int32): M128i {.importc: "__lasx_xvbitclri_w".}

## [Macro Original]
## #define __lasx_xvbitclri_d(/*__m256i*/ _1, /*ui6*/ _2) \
## ((__m256i)__builtin_lasx_xvbitclri_d ((v4u64)(_1), (_2)))
func lasx_xvbitclri_d*(a: M256i, b: int32): M128i {.importc: "__lasx_xvbitclri_d".}

func lasx_xvbitset_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvbitset_b".}

func lasx_xvbitset_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvbitset_h".}

func lasx_xvbitset_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvbitset_w".}

func lasx_xvbitset_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvbitset_d".}

## [Macro Original]
## #define __lasx_xvbitseti_b(/*__m256i*/ _1, /*ui3*/ _2) \
## ((__m256i)__builtin_lasx_xvbitseti_b ((v32u8)(_1), (_2)))
func lasx_xvbitseti_b*(a: M256i, b: int32): M128i {.importc: "__lasx_xvbitseti_b".}

## [Macro Original]
## #define __lasx_xvbitseti_h(/*__m256i*/ _1, /*ui4*/ _2) \
## ((__m256i)__builtin_lasx_xvbitseti_h ((v16u16)(_1), (_2)))
func lasx_xvbitseti_h*(a: M256i, b: int32): M128i {.importc: "__lasx_xvbitseti_h".}

## [Macro Original]
## #define __lasx_xvbitseti_w(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvbitseti_w ((v8u32)(_1), (_2)))
func lasx_xvbitseti_w*(a: M256i, b: int32): M128i {.importc: "__lasx_xvbitseti_w".}

## [Macro Original]
## #define __lasx_xvbitseti_d(/*__m256i*/ _1, /*ui6*/ _2) \
## ((__m256i)__builtin_lasx_xvbitseti_d ((v4u64)(_1), (_2)))
func lasx_xvbitseti_d*(a: M256i, b: int32): M128i {.importc: "__lasx_xvbitseti_d".}

func lasx_xvbitrev_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvbitrev_b".}

func lasx_xvbitrev_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvbitrev_h".}

func lasx_xvbitrev_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvbitrev_w".}

func lasx_xvbitrev_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvbitrev_d".}

## [Macro Original]
## #define __lasx_xvbitrevi_b(/*__m256i*/ _1, /*ui3*/ _2) \
## ((__m256i)__builtin_lasx_xvbitrevi_b ((v32u8)(_1), (_2)))
func lasx_xvbitrevi_b*(a: M256i, b: int32): M128i {.importc: "__lasx_xvbitrevi_b".}

## [Macro Original]
## #define __lasx_xvbitrevi_h(/*__m256i*/ _1, /*ui4*/ _2) \
## ((__m256i)__builtin_lasx_xvbitrevi_h ((v16u16)(_1), (_2)))
func lasx_xvbitrevi_h*(a: M256i, b: int32): M128i {.importc: "__lasx_xvbitrevi_h".}

## [Macro Original]
## #define __lasx_xvbitrevi_w(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvbitrevi_w ((v8u32)(_1), (_2)))
func lasx_xvbitrevi_w*(a: M256i, b: int32): M128i {.importc: "__lasx_xvbitrevi_w".}

## [Macro Original]
## #define __lasx_xvbitrevi_d(/*__m256i*/ _1, /*ui6*/ _2) \
## ((__m256i)__builtin_lasx_xvbitrevi_d ((v4u64)(_1), (_2)))
func lasx_xvbitrevi_d*(a: M256i, b: int32): M128i {.importc: "__lasx_xvbitrevi_d".}

func lasx_xvadd_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvadd_b".}

func lasx_xvadd_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvadd_h".}

func lasx_xvadd_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvadd_w".}

func lasx_xvadd_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvadd_d".}

## [Macro Original]
## #define __lasx_xvaddi_bu(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvaddi_bu ((v32i8)(_1), (_2)))
func lasx_xvaddi_bu*(a: M256i, b: int32): M128i {.importc: "__lasx_xvaddi_bu".}

## [Macro Original]
## #define __lasx_xvaddi_hu(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvaddi_hu ((v16i16)(_1), (_2)))
func lasx_xvaddi_hu*(a: M256i, b: int32): M128i {.importc: "__lasx_xvaddi_hu".}

## [Macro Original]
## #define __lasx_xvaddi_wu(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvaddi_wu ((v8i32)(_1), (_2)))
func lasx_xvaddi_wu*(a: M256i, b: int32): M128i {.importc: "__lasx_xvaddi_wu".}

## [Macro Original]
## #define __lasx_xvaddi_du(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvaddi_du ((v4i64)(_1), (_2)))
func lasx_xvaddi_du*(a: M256i, b: int32): M128i {.importc: "__lasx_xvaddi_du".}

func lasx_xvsub_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsub_b".}

func lasx_xvsub_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsub_h".}

func lasx_xvsub_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsub_w".}

func lasx_xvsub_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsub_d".}

## [Macro Original]
## #define __lasx_xvsubi_bu(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvsubi_bu ((v32i8)(_1), (_2)))
func lasx_xvsubi_bu*(a: M256i, b: int32): M128i {.importc: "__lasx_xvsubi_bu".}

## [Macro Original]
## #define __lasx_xvsubi_hu(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvsubi_hu ((v16i16)(_1), (_2)))
func lasx_xvsubi_hu*(a: M256i, b: int32): M128i {.importc: "__lasx_xvsubi_hu".}

## [Macro Original]
## #define __lasx_xvsubi_wu(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvsubi_wu ((v8i32)(_1), (_2)))
func lasx_xvsubi_wu*(a: M256i, b: int32): M128i {.importc: "__lasx_xvsubi_wu".}

## [Macro Original]
## #define __lasx_xvsubi_du(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvsubi_du ((v4i64)(_1), (_2)))
func lasx_xvsubi_du*(a: M256i, b: int32): M128i {.importc: "__lasx_xvsubi_du".}

func lasx_xvmax_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmax_b".}

func lasx_xvmax_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmax_h".}

func lasx_xvmax_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmax_w".}

func lasx_xvmax_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmax_d".}

## [Macro Original]
## #define __lasx_xvmaxi_b(/*__m256i*/ _1, /*si5*/ _2) \
## ((__m256i)__builtin_lasx_xvmaxi_b ((v32i8)(_1), (_2)))
## func lasx_xvmaxi_b*(a: M256i, b: si5): M128i {.importc: "__lasx_xvmaxi_b".}

## [Macro Original]
## #define __lasx_xvmaxi_h(/*__m256i*/ _1, /*si5*/ _2) \
## ((__m256i)__builtin_lasx_xvmaxi_h ((v16i16)(_1), (_2)))
## func lasx_xvmaxi_h*(a: M256i, b: si5): M128i {.importc: "__lasx_xvmaxi_h".}

## [Macro Original]
## #define __lasx_xvmaxi_w(/*__m256i*/ _1, /*si5*/ _2) \
## ((__m256i)__builtin_lasx_xvmaxi_w ((v8i32)(_1), (_2)))
## func lasx_xvmaxi_w*(a: M256i, b: si5): M128i {.importc: "__lasx_xvmaxi_w".}

## [Macro Original]
## #define __lasx_xvmaxi_d(/*__m256i*/ _1, /*si5*/ _2) \
## ((__m256i)__builtin_lasx_xvmaxi_d ((v4i64)(_1), (_2)))
## func lasx_xvmaxi_d*(a: M256i, b: si5): M128i {.importc: "__lasx_xvmaxi_d".}

func lasx_xvmax_bu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmax_bu".}

func lasx_xvmax_hu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmax_hu".}

func lasx_xvmax_wu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmax_wu".}

func lasx_xvmax_du*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmax_du".}

## [Macro Original]
## #define __lasx_xvmaxi_bu(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvmaxi_bu ((v32u8)(_1), (_2)))
func lasx_xvmaxi_bu*(a: M256i, b: int32): M128i {.importc: "__lasx_xvmaxi_bu".}

## [Macro Original]
## #define __lasx_xvmaxi_hu(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvmaxi_hu ((v16u16)(_1), (_2)))
func lasx_xvmaxi_hu*(a: M256i, b: int32): M128i {.importc: "__lasx_xvmaxi_hu".}

## [Macro Original]
## #define __lasx_xvmaxi_wu(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvmaxi_wu ((v8u32)(_1), (_2)))
func lasx_xvmaxi_wu*(a: M256i, b: int32): M128i {.importc: "__lasx_xvmaxi_wu".}

## [Macro Original]
## #define __lasx_xvmaxi_du(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvmaxi_du ((v4u64)(_1), (_2)))
func lasx_xvmaxi_du*(a: M256i, b: int32): M128i {.importc: "__lasx_xvmaxi_du".}

func lasx_xvmin_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmin_b".}

func lasx_xvmin_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmin_h".}

func lasx_xvmin_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmin_w".}

func lasx_xvmin_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmin_d".}

## [Macro Original]
## #define __lasx_xvmini_b(/*__m256i*/ _1, /*si5*/ _2) \
## ((__m256i)__builtin_lasx_xvmini_b ((v32i8)(_1), (_2)))
## func lasx_xvmini_b*(a: M256i, b: si5): M128i {.importc: "__lasx_xvmini_b".}

## [Macro Original]
## #define __lasx_xvmini_h(/*__m256i*/ _1, /*si5*/ _2) \
## ((__m256i)__builtin_lasx_xvmini_h ((v16i16)(_1), (_2)))
## func lasx_xvmini_h*(a: M256i, b: si5): M128i {.importc: "__lasx_xvmini_h".}

## [Macro Original]
## #define __lasx_xvmini_w(/*__m256i*/ _1, /*si5*/ _2) \
## ((__m256i)__builtin_lasx_xvmini_w ((v8i32)(_1), (_2)))
## func lasx_xvmini_w*(a: M256i, b: si5): M128i {.importc: "__lasx_xvmini_w".}

## [Macro Original]
## #define __lasx_xvmini_d(/*__m256i*/ _1, /*si5*/ _2) \
## ((__m256i)__builtin_lasx_xvmini_d ((v4i64)(_1), (_2)))
## func lasx_xvmini_d*(a: M256i, b: si5): M128i {.importc: "__lasx_xvmini_d".}

func lasx_xvmin_bu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmin_bu".}

func lasx_xvmin_hu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmin_hu".}

func lasx_xvmin_wu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmin_wu".}

func lasx_xvmin_du*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmin_du".}

## [Macro Original]
## #define __lasx_xvmini_bu(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvmini_bu ((v32u8)(_1), (_2)))
func lasx_xvmini_bu*(a: M256i, b: int32): M128i {.importc: "__lasx_xvmini_bu".}

## [Macro Original]
## #define __lasx_xvmini_hu(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvmini_hu ((v16u16)(_1), (_2)))
func lasx_xvmini_hu*(a: M256i, b: int32): M128i {.importc: "__lasx_xvmini_hu".}

## [Macro Original]
## #define __lasx_xvmini_wu(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvmini_wu ((v8u32)(_1), (_2)))
func lasx_xvmini_wu*(a: M256i, b: int32): M128i {.importc: "__lasx_xvmini_wu".}

## [Macro Original]
## #define __lasx_xvmini_du(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvmini_du ((v4u64)(_1), (_2)))
func lasx_xvmini_du*(a: M256i, b: int32): M128i {.importc: "__lasx_xvmini_du".}

func lasx_xvseq_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvseq_b".}

func lasx_xvseq_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvseq_h".}

func lasx_xvseq_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvseq_w".}

func lasx_xvseq_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvseq_d".}

## [Macro Original]
## #define __lasx_xvseqi_b(/*__m256i*/ _1, /*si5*/ _2) \
## ((__m256i)__builtin_lasx_xvseqi_b ((v32i8)(_1), (_2)))
## func lasx_xvseqi_b*(a: M256i, b: si5): M128i {.importc: "__lasx_xvseqi_b".}

## [Macro Original]
## #define __lasx_xvseqi_h(/*__m256i*/ _1, /*si5*/ _2) \
## ((__m256i)__builtin_lasx_xvseqi_h ((v16i16)(_1), (_2)))
## func lasx_xvseqi_h*(a: M256i, b: si5): M128i {.importc: "__lasx_xvseqi_h".}

## [Macro Original]
## #define __lasx_xvseqi_w(/*__m256i*/ _1, /*si5*/ _2) \
## ((__m256i)__builtin_lasx_xvseqi_w ((v8i32)(_1), (_2)))
## func lasx_xvseqi_w*(a: M256i, b: si5): M128i {.importc: "__lasx_xvseqi_w".}

## [Macro Original]
## #define __lasx_xvseqi_d(/*__m256i*/ _1, /*si5*/ _2) \
## ((__m256i)__builtin_lasx_xvseqi_d ((v4i64)(_1), (_2)))
## func lasx_xvseqi_d*(a: M256i, b: si5): M128i {.importc: "__lasx_xvseqi_d".}

func lasx_xvslt_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvslt_b".}

func lasx_xvslt_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvslt_h".}

func lasx_xvslt_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvslt_w".}

func lasx_xvslt_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvslt_d".}

## [Macro Original]
## #define __lasx_xvslti_b(/*__m256i*/ _1, /*si5*/ _2) \
## ((__m256i)__builtin_lasx_xvslti_b ((v32i8)(_1), (_2)))
## func lasx_xvslti_b*(a: M256i, b: si5): M128i {.importc: "__lasx_xvslti_b".}

## [Macro Original]
## #define __lasx_xvslti_h(/*__m256i*/ _1, /*si5*/ _2) \
## ((__m256i)__builtin_lasx_xvslti_h ((v16i16)(_1), (_2)))
## func lasx_xvslti_h*(a: M256i, b: si5): M128i {.importc: "__lasx_xvslti_h".}

## [Macro Original]
## #define __lasx_xvslti_w(/*__m256i*/ _1, /*si5*/ _2) \
## ((__m256i)__builtin_lasx_xvslti_w ((v8i32)(_1), (_2)))
## func lasx_xvslti_w*(a: M256i, b: si5): M128i {.importc: "__lasx_xvslti_w".}

## [Macro Original]
## #define __lasx_xvslti_d(/*__m256i*/ _1, /*si5*/ _2) \
## ((__m256i)__builtin_lasx_xvslti_d ((v4i64)(_1), (_2)))
## func lasx_xvslti_d*(a: M256i, b: si5): M128i {.importc: "__lasx_xvslti_d".}

func lasx_xvslt_bu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvslt_bu".}

func lasx_xvslt_hu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvslt_hu".}

func lasx_xvslt_wu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvslt_wu".}

func lasx_xvslt_du*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvslt_du".}

## [Macro Original]
## #define __lasx_xvslti_bu(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvslti_bu ((v32u8)(_1), (_2)))
func lasx_xvslti_bu*(a: M256i, b: int32): M128i {.importc: "__lasx_xvslti_bu".}

## [Macro Original]
## #define __lasx_xvslti_hu(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvslti_hu ((v16u16)(_1), (_2)))
func lasx_xvslti_hu*(a: M256i, b: int32): M128i {.importc: "__lasx_xvslti_hu".}

## [Macro Original]
## #define __lasx_xvslti_wu(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvslti_wu ((v8u32)(_1), (_2)))
func lasx_xvslti_wu*(a: M256i, b: int32): M128i {.importc: "__lasx_xvslti_wu".}

## [Macro Original]
## #define __lasx_xvslti_du(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvslti_du ((v4u64)(_1), (_2)))
func lasx_xvslti_du*(a: M256i, b: int32): M128i {.importc: "__lasx_xvslti_du".}

func lasx_xvsle_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsle_b".}

func lasx_xvsle_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsle_h".}

func lasx_xvsle_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsle_w".}

func lasx_xvsle_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsle_d".}

## [Macro Original]
## #define __lasx_xvslei_b(/*__m256i*/ _1, /*si5*/ _2) \
## ((__m256i)__builtin_lasx_xvslei_b ((v32i8)(_1), (_2)))
## func lasx_xvslei_b*(a: M256i, b: si5): M128i {.importc: "__lasx_xvslei_b".}

## [Macro Original]
## #define __lasx_xvslei_h(/*__m256i*/ _1, /*si5*/ _2) \
## ((__m256i)__builtin_lasx_xvslei_h ((v16i16)(_1), (_2)))
## func lasx_xvslei_h*(a: M256i, b: si5): M128i {.importc: "__lasx_xvslei_h".}

## [Macro Original]
## #define __lasx_xvslei_w(/*__m256i*/ _1, /*si5*/ _2) \
## ((__m256i)__builtin_lasx_xvslei_w ((v8i32)(_1), (_2)))
## func lasx_xvslei_w*(a: M256i, b: si5): M128i {.importc: "__lasx_xvslei_w".}

## [Macro Original]
## #define __lasx_xvslei_d(/*__m256i*/ _1, /*si5*/ _2) \
## ((__m256i)__builtin_lasx_xvslei_d ((v4i64)(_1), (_2)))
## func lasx_xvslei_d*(a: M256i, b: si5): M128i {.importc: "__lasx_xvslei_d".}

func lasx_xvsle_bu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsle_bu".}

func lasx_xvsle_hu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsle_hu".}

func lasx_xvsle_wu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsle_wu".}

func lasx_xvsle_du*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsle_du".}

## [Macro Original]
## #define __lasx_xvslei_bu(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvslei_bu ((v32u8)(_1), (_2)))
func lasx_xvslei_bu*(a: M256i, b: int32): M128i {.importc: "__lasx_xvslei_bu".}

## [Macro Original]
## #define __lasx_xvslei_hu(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvslei_hu ((v16u16)(_1), (_2)))
func lasx_xvslei_hu*(a: M256i, b: int32): M128i {.importc: "__lasx_xvslei_hu".}

## [Macro Original]
## #define __lasx_xvslei_wu(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvslei_wu ((v8u32)(_1), (_2)))
func lasx_xvslei_wu*(a: M256i, b: int32): M128i {.importc: "__lasx_xvslei_wu".}

## [Macro Original]
## #define __lasx_xvslei_du(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvslei_du ((v4u64)(_1), (_2)))
func lasx_xvslei_du*(a: M256i, b: int32): M128i {.importc: "__lasx_xvslei_du".}

## [Macro Original]
## #define __lasx_xvsat_b(/*__m256i*/ _1, /*ui3*/ _2) \
## ((__m256i)__builtin_lasx_xvsat_b ((v32i8)(_1), (_2)))
func lasx_xvsat_b*(a: M256i, b: int32): M128i {.importc: "__lasx_xvsat_b".}

## [Macro Original]
## #define __lasx_xvsat_h(/*__m256i*/ _1, /*ui4*/ _2) \
## ((__m256i)__builtin_lasx_xvsat_h ((v16i16)(_1), (_2)))
func lasx_xvsat_h*(a: M256i, b: int32): M128i {.importc: "__lasx_xvsat_h".}

## [Macro Original]
## #define __lasx_xvsat_w(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvsat_w ((v8i32)(_1), (_2)))
func lasx_xvsat_w*(a: M256i, b: int32): M128i {.importc: "__lasx_xvsat_w".}

## [Macro Original]
## #define __lasx_xvsat_d(/*__m256i*/ _1, /*ui6*/ _2) \
## ((__m256i)__builtin_lasx_xvsat_d ((v4i64)(_1), (_2)))
func lasx_xvsat_d*(a: M256i, b: int32): M128i {.importc: "__lasx_xvsat_d".}

## [Macro Original]
## #define __lasx_xvsat_bu(/*__m256i*/ _1, /*ui3*/ _2) \
## ((__m256i)__builtin_lasx_xvsat_bu ((v32u8)(_1), (_2)))
func lasx_xvsat_bu*(a: M256i, b: int32): M128i {.importc: "__lasx_xvsat_bu".}

## [Macro Original]
## #define __lasx_xvsat_hu(/*__m256i*/ _1, /*ui4*/ _2) \
## ((__m256i)__builtin_lasx_xvsat_hu ((v16u16)(_1), (_2)))
func lasx_xvsat_hu*(a: M256i, b: int32): M128i {.importc: "__lasx_xvsat_hu".}

## [Macro Original]
## #define __lasx_xvsat_wu(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvsat_wu ((v8u32)(_1), (_2)))
func lasx_xvsat_wu*(a: M256i, b: int32): M128i {.importc: "__lasx_xvsat_wu".}

## [Macro Original]
## #define __lasx_xvsat_du(/*__m256i*/ _1, /*ui6*/ _2) \
## ((__m256i)__builtin_lasx_xvsat_du ((v4u64)(_1), (_2)))
func lasx_xvsat_du*(a: M256i, b: int32): M128i {.importc: "__lasx_xvsat_du".}

func lasx_xvadda_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvadda_b".}

func lasx_xvadda_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvadda_h".}

func lasx_xvadda_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvadda_w".}

func lasx_xvadda_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvadda_d".}

func lasx_xvsadd_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsadd_b".}

func lasx_xvsadd_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsadd_h".}

func lasx_xvsadd_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsadd_w".}

func lasx_xvsadd_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsadd_d".}

func lasx_xvsadd_bu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsadd_bu".}

func lasx_xvsadd_hu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsadd_hu".}

func lasx_xvsadd_wu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsadd_wu".}

func lasx_xvsadd_du*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsadd_du".}

func lasx_xvavg_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvavg_b".}

func lasx_xvavg_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvavg_h".}

func lasx_xvavg_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvavg_w".}

func lasx_xvavg_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvavg_d".}

func lasx_xvavg_bu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvavg_bu".}

func lasx_xvavg_hu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvavg_hu".}

func lasx_xvavg_wu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvavg_wu".}

func lasx_xvavg_du*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvavg_du".}

func lasx_xvavgr_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvavgr_b".}

func lasx_xvavgr_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvavgr_h".}

func lasx_xvavgr_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvavgr_w".}

func lasx_xvavgr_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvavgr_d".}

func lasx_xvavgr_bu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvavgr_bu".}

func lasx_xvavgr_hu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvavgr_hu".}

func lasx_xvavgr_wu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvavgr_wu".}

func lasx_xvavgr_du*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvavgr_du".}

func lasx_xvssub_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvssub_b".}

func lasx_xvssub_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvssub_h".}

func lasx_xvssub_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvssub_w".}

func lasx_xvssub_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvssub_d".}

func lasx_xvssub_bu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvssub_bu".}

func lasx_xvssub_hu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvssub_hu".}

func lasx_xvssub_wu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvssub_wu".}

func lasx_xvssub_du*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvssub_du".}

func lasx_xvabsd_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvabsd_b".}

func lasx_xvabsd_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvabsd_h".}

func lasx_xvabsd_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvabsd_w".}

func lasx_xvabsd_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvabsd_d".}

func lasx_xvabsd_bu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvabsd_bu".}

func lasx_xvabsd_hu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvabsd_hu".}

func lasx_xvabsd_wu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvabsd_wu".}

func lasx_xvabsd_du*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvabsd_du".}

func lasx_xvmul_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmul_b".}

func lasx_xvmul_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmul_h".}

func lasx_xvmul_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmul_w".}

func lasx_xvmul_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmul_d".}

func lasx_xvmadd_b*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvmadd_b".}

func lasx_xvmadd_h*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvmadd_h".}

func lasx_xvmadd_w*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvmadd_w".}

func lasx_xvmadd_d*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvmadd_d".}

func lasx_xvmsub_b*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvmsub_b".}

func lasx_xvmsub_h*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvmsub_h".}

func lasx_xvmsub_w*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvmsub_w".}

func lasx_xvmsub_d*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvmsub_d".}

func lasx_xvdiv_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvdiv_b".}

func lasx_xvdiv_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvdiv_h".}

func lasx_xvdiv_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvdiv_w".}

func lasx_xvdiv_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvdiv_d".}

func lasx_xvdiv_bu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvdiv_bu".}

func lasx_xvdiv_hu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvdiv_hu".}

func lasx_xvdiv_wu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvdiv_wu".}

func lasx_xvdiv_du*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvdiv_du".}

func lasx_xvhaddw_h_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvhaddw_h_b".}

func lasx_xvhaddw_w_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvhaddw_w_h".}

func lasx_xvhaddw_d_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvhaddw_d_w".}

func lasx_xvhaddw_hu_bu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvhaddw_hu_bu".}

func lasx_xvhaddw_wu_hu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvhaddw_wu_hu".}

func lasx_xvhaddw_du_wu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvhaddw_du_wu".}

func lasx_xvhsubw_h_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvhsubw_h_b".}

func lasx_xvhsubw_w_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvhsubw_w_h".}

func lasx_xvhsubw_d_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvhsubw_d_w".}

func lasx_xvhsubw_hu_bu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvhsubw_hu_bu".}

func lasx_xvhsubw_wu_hu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvhsubw_wu_hu".}

func lasx_xvhsubw_du_wu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvhsubw_du_wu".}

func lasx_xvmod_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmod_b".}

func lasx_xvmod_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmod_h".}

func lasx_xvmod_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmod_w".}

func lasx_xvmod_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmod_d".}

func lasx_xvmod_bu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmod_bu".}

func lasx_xvmod_hu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmod_hu".}

func lasx_xvmod_wu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmod_wu".}

func lasx_xvmod_du*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmod_du".}

## [Macro Original]
## #define __lasx_xvrepl128vei_b(/*__m256i*/ _1, /*ui4*/ _2) \
## ((__m256i)__builtin_lasx_xvrepl128vei_b ((v32i8)(_1), (_2)))
func lasx_xvrepl128vei_b*(a: M256i, b: int32): M128i {.importc: "__lasx_xvrepl128vei_b".}

## [Macro Original]
## #define __lasx_xvrepl128vei_h(/*__m256i*/ _1, /*ui3*/ _2) \
## ((__m256i)__builtin_lasx_xvrepl128vei_h ((v16i16)(_1), (_2)))
func lasx_xvrepl128vei_h*(a: M256i, b: int32): M128i {.importc: "__lasx_xvrepl128vei_h".}

## [Macro Original]
## #define __lasx_xvrepl128vei_w(/*__m256i*/ _1, /*ui2*/ _2) \
## ((__m256i)__builtin_lasx_xvrepl128vei_w ((v8i32)(_1), (_2)))
func lasx_xvrepl128vei_w*(a: M256i, b: int32): M128i {.importc: "__lasx_xvrepl128vei_w".}

## [Macro Original]
## #define __lasx_xvrepl128vei_d(/*__m256i*/ _1, /*ui1*/ _2) \
## ((__m256i)__builtin_lasx_xvrepl128vei_d ((v4i64)(_1), (_2)))
func lasx_xvrepl128vei_d*(a: M256i, b: int32): M128i {.importc: "__lasx_xvrepl128vei_d".}

func lasx_xvpickev_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvpickev_b".}

func lasx_xvpickev_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvpickev_h".}

func lasx_xvpickev_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvpickev_w".}

func lasx_xvpickev_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvpickev_d".}

func lasx_xvpickod_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvpickod_b".}

func lasx_xvpickod_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvpickod_h".}

func lasx_xvpickod_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvpickod_w".}

func lasx_xvpickod_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvpickod_d".}

func lasx_xvilvh_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvilvh_b".}

func lasx_xvilvh_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvilvh_h".}

func lasx_xvilvh_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvilvh_w".}

func lasx_xvilvh_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvilvh_d".}

func lasx_xvilvl_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvilvl_b".}

func lasx_xvilvl_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvilvl_h".}

func lasx_xvilvl_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvilvl_w".}

func lasx_xvilvl_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvilvl_d".}

func lasx_xvpackev_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvpackev_b".}

func lasx_xvpackev_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvpackev_h".}

func lasx_xvpackev_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvpackev_w".}

func lasx_xvpackev_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvpackev_d".}

func lasx_xvpackod_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvpackod_b".}

func lasx_xvpackod_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvpackod_h".}

func lasx_xvpackod_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvpackod_w".}

func lasx_xvpackod_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvpackod_d".}

func lasx_xvshuf_b*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvshuf_b".}

func lasx_xvshuf_h*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvshuf_h".}

func lasx_xvshuf_w*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvshuf_w".}

func lasx_xvshuf_d*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvshuf_d".}

func lasx_xvand_v*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvand_v".}

## [Macro Original]
## #define __lasx_xvandi_b(/*__m256i*/ _1, /*ui8*/ _2) \
## ((__m256i)__builtin_lasx_xvandi_b ((v32u8)(_1), (_2)))
func lasx_xvandi_b*(a: M256i, b: int32): M128i {.importc: "__lasx_xvandi_b".}

func lasx_xvor_v*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvor_v".}

## [Macro Original]
## #define __lasx_xvori_b(/*__m256i*/ _1, /*ui8*/ _2) \
## ((__m256i)__builtin_lasx_xvori_b ((v32u8)(_1), (_2)))
func lasx_xvori_b*(a: M256i, b: int32): M128i {.importc: "__lasx_xvori_b".}

func lasx_xvnor_v*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvnor_v".}

## [Macro Original]
## #define __lasx_xvnori_b(/*__m256i*/ _1, /*ui8*/ _2) \
## ((__m256i)__builtin_lasx_xvnori_b ((v32u8)(_1), (_2)))
func lasx_xvnori_b*(a: M256i, b: int32): M128i {.importc: "__lasx_xvnori_b".}

func lasx_xvxor_v*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvxor_v".}

## [Macro Original]
## #define __lasx_xvxori_b(/*__m256i*/ _1, /*ui8*/ _2) \
## ((__m256i)__builtin_lasx_xvxori_b ((v32u8)(_1), (_2)))
func lasx_xvxori_b*(a: M256i, b: int32): M128i {.importc: "__lasx_xvxori_b".}

func lasx_xvbitsel_v*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvbitsel_v".}

## [Macro Original]
## #define __lasx_xvbitseli_b(/*__m256i*/ _1, /*__m256i*/ _2, /*ui8*/ _3) \
## ((__m256i)__builtin_lasx_xvbitseli_b ((v32u8)(_1), (v32u8)(_2), (_3)))
func lasx_xvbitseli_b*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvbitseli_b".}

## [Macro Original]
## #define __lasx_xvshuf4i_b(/*__m256i*/ _1, /*ui8*/ _2) \
## ((__m256i)__builtin_lasx_xvshuf4i_b ((v32i8)(_1), (_2)))
func lasx_xvshuf4i_b*(a: M256i, b: int32): M128i {.importc: "__lasx_xvshuf4i_b".}

## [Macro Original]
## #define __lasx_xvshuf4i_h(/*__m256i*/ _1, /*ui8*/ _2) \
## ((__m256i)__builtin_lasx_xvshuf4i_h ((v16i16)(_1), (_2)))
func lasx_xvshuf4i_h*(a: M256i, b: int32): M128i {.importc: "__lasx_xvshuf4i_h".}

## [Macro Original]
## #define __lasx_xvshuf4i_w(/*__m256i*/ _1, /*ui8*/ _2) \
## ((__m256i)__builtin_lasx_xvshuf4i_w ((v8i32)(_1), (_2)))
func lasx_xvshuf4i_w*(a: M256i, b: int32): M128i {.importc: "__lasx_xvshuf4i_w".}

func lasx_xvreplgr2vr_b*(a: int32): M256i {.importc: "__lasx_xvreplgr2vr_b".}

func lasx_xvreplgr2vr_h*(a: int32): M256i {.importc: "__lasx_xvreplgr2vr_h".}

func lasx_xvreplgr2vr_w*(a: int32): M256i {.importc: "__lasx_xvreplgr2vr_w".}

func lasx_xvreplgr2vr_d*(a: int64): M256i {.importc: "__lasx_xvreplgr2vr_d".}

func lasx_xvpcnt_b*(a: M256i): M256i {.importc: "__lasx_xvpcnt_b".}

func lasx_xvpcnt_h*(a: M256i): M256i {.importc: "__lasx_xvpcnt_h".}

func lasx_xvpcnt_w*(a: M256i): M256i {.importc: "__lasx_xvpcnt_w".}

func lasx_xvpcnt_d*(a: M256i): M256i {.importc: "__lasx_xvpcnt_d".}

func lasx_xvclo_b*(a: M256i): M256i {.importc: "__lasx_xvclo_b".}

func lasx_xvclo_h*(a: M256i): M256i {.importc: "__lasx_xvclo_h".}

func lasx_xvclo_w*(a: M256i): M256i {.importc: "__lasx_xvclo_w".}

func lasx_xvclo_d*(a: M256i): M256i {.importc: "__lasx_xvclo_d".}

func lasx_xvclz_b*(a: M256i): M256i {.importc: "__lasx_xvclz_b".}

func lasx_xvclz_h*(a: M256i): M256i {.importc: "__lasx_xvclz_h".}

func lasx_xvclz_w*(a: M256i): M256i {.importc: "__lasx_xvclz_w".}

func lasx_xvclz_d*(a: M256i): M256i {.importc: "__lasx_xvclz_d".}

func lasx_xvfadd_s*(a: M256, b: M256): M256 {.importc: "__lasx_xvfadd_s".}

func lasx_xvfadd_d*(a: M256d, b: M256d): M256d {.importc: "__lasx_xvfadd_d".}

func lasx_xvfsub_s*(a: M256, b: M256): M256 {.importc: "__lasx_xvfsub_s".}

func lasx_xvfsub_d*(a: M256d, b: M256d): M256d {.importc: "__lasx_xvfsub_d".}

func lasx_xvfmul_s*(a: M256, b: M256): M256 {.importc: "__lasx_xvfmul_s".}

func lasx_xvfmul_d*(a: M256d, b: M256d): M256d {.importc: "__lasx_xvfmul_d".}

func lasx_xvfdiv_s*(a: M256, b: M256): M256 {.importc: "__lasx_xvfdiv_s".}

func lasx_xvfdiv_d*(a: M256d, b: M256d): M256d {.importc: "__lasx_xvfdiv_d".}

func lasx_xvfcvt_h_s*(a: M256, b: M256): M256i {.importc: "__lasx_xvfcvt_h_s".}

func lasx_xvfcvt_s_d*(a: M256d, b: M256d): M256 {.importc: "__lasx_xvfcvt_s_d".}

func lasx_xvfmin_s*(a: M256, b: M256): M256 {.importc: "__lasx_xvfmin_s".}

func lasx_xvfmin_d*(a: M256d, b: M256d): M256d {.importc: "__lasx_xvfmin_d".}

func lasx_xvfmina_s*(a: M256, b: M256): M256 {.importc: "__lasx_xvfmina_s".}

func lasx_xvfmina_d*(a: M256d, b: M256d): M256d {.importc: "__lasx_xvfmina_d".}

func lasx_xvfmax_s*(a: M256, b: M256): M256 {.importc: "__lasx_xvfmax_s".}

func lasx_xvfmax_d*(a: M256d, b: M256d): M256d {.importc: "__lasx_xvfmax_d".}

func lasx_xvfmaxa_s*(a: M256, b: M256): M256 {.importc: "__lasx_xvfmaxa_s".}

func lasx_xvfmaxa_d*(a: M256d, b: M256d): M256d {.importc: "__lasx_xvfmaxa_d".}

func lasx_xvfclass_s*(a: M256): M256i {.importc: "__lasx_xvfclass_s".}

func lasx_xvfclass_d*(a: M256d): M256i {.importc: "__lasx_xvfclass_d".}

func lasx_xvfsqrt_s*(a: M256): M256 {.importc: "__lasx_xvfsqrt_s".}

func lasx_xvfsqrt_d*(a: M256d): M256d {.importc: "__lasx_xvfsqrt_d".}

func lasx_xvfrecip_s*(a: M256): M256 {.importc: "__lasx_xvfrecip_s".}

func lasx_xvfrecip_d*(a: M256d): M256d {.importc: "__lasx_xvfrecip_d".}

func lasx_xvfrecipe_s*(a: M256): M256 {.importc: "__lasx_xvfrecipe_s".}

func lasx_xvfrecipe_d*(a: M256d): M256d {.importc: "__lasx_xvfrecipe_d".}

func lasx_xvfrsqrte_s*(a: M256): M256 {.importc: "__lasx_xvfrsqrte_s".}

func lasx_xvfrsqrte_d*(a: M256d): M256d {.importc: "__lasx_xvfrsqrte_d".}

func lasx_xvfrint_s*(a: M256): M256 {.importc: "__lasx_xvfrint_s".}

func lasx_xvfrint_d*(a: M256d): M256d {.importc: "__lasx_xvfrint_d".}

func lasx_xvfrsqrt_s*(a: M256): M256 {.importc: "__lasx_xvfrsqrt_s".}

func lasx_xvfrsqrt_d*(a: M256d): M256d {.importc: "__lasx_xvfrsqrt_d".}

func lasx_xvflogb_s*(a: M256): M256 {.importc: "__lasx_xvflogb_s".}

func lasx_xvflogb_d*(a: M256d): M256d {.importc: "__lasx_xvflogb_d".}

func lasx_xvfcvth_s_h*(a: M256i): M256 {.importc: "__lasx_xvfcvth_s_h".}

func lasx_xvfcvth_d_s*(a: M256): M256d {.importc: "__lasx_xvfcvth_d_s".}

func lasx_xvfcvtl_s_h*(a: M256i): M256 {.importc: "__lasx_xvfcvtl_s_h".}

func lasx_xvfcvtl_d_s*(a: M256): M256d {.importc: "__lasx_xvfcvtl_d_s".}

func lasx_xvftint_w_s*(a: M256): M256i {.importc: "__lasx_xvftint_w_s".}

func lasx_xvftint_l_d*(a: M256d): M256i {.importc: "__lasx_xvftint_l_d".}

func lasx_xvftint_wu_s*(a: M256): M256i {.importc: "__lasx_xvftint_wu_s".}

func lasx_xvftint_lu_d*(a: M256d): M256i {.importc: "__lasx_xvftint_lu_d".}

func lasx_xvftintrz_w_s*(a: M256): M256i {.importc: "__lasx_xvftintrz_w_s".}

func lasx_xvftintrz_l_d*(a: M256d): M256i {.importc: "__lasx_xvftintrz_l_d".}

func lasx_xvftintrz_wu_s*(a: M256): M256i {.importc: "__lasx_xvftintrz_wu_s".}

func lasx_xvftintrz_lu_d*(a: M256d): M256i {.importc: "__lasx_xvftintrz_lu_d".}

func lasx_xvffint_s_w*(a: M256i): M256 {.importc: "__lasx_xvffint_s_w".}

func lasx_xvffint_d_l*(a: M256i): M256d {.importc: "__lasx_xvffint_d_l".}

func lasx_xvffint_s_wu*(a: M256i): M256 {.importc: "__lasx_xvffint_s_wu".}

func lasx_xvffint_d_lu*(a: M256i): M256d {.importc: "__lasx_xvffint_d_lu".}

func lasx_xvreplve_b*(a: M256i, b: int32): M256i {.importc: "__lasx_xvreplve_b".}

func lasx_xvreplve_h*(a: M256i, b: int32): M256i {.importc: "__lasx_xvreplve_h".}

func lasx_xvreplve_w*(a: M256i, b: int32): M256i {.importc: "__lasx_xvreplve_w".}

func lasx_xvreplve_d*(a: M256i, b: int32): M256i {.importc: "__lasx_xvreplve_d".}

## [Macro Original]
## #define __lasx_xvpermi_w(/*__m256i*/ _1, /*__m256i*/ _2, /*ui8*/ _3) \
## ((__m256i)__builtin_lasx_xvpermi_w ((v8i32)(_1), (v8i32)(_2), (_3)))
func lasx_xvpermi_w*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvpermi_w".}

func lasx_xvandn_v*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvandn_v".}

func lasx_xvneg_b*(a: M256i): M256i {.importc: "__lasx_xvneg_b".}

func lasx_xvneg_h*(a: M256i): M256i {.importc: "__lasx_xvneg_h".}

func lasx_xvneg_w*(a: M256i): M256i {.importc: "__lasx_xvneg_w".}

func lasx_xvneg_d*(a: M256i): M256i {.importc: "__lasx_xvneg_d".}

func lasx_xvmuh_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmuh_b".}

func lasx_xvmuh_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmuh_h".}

func lasx_xvmuh_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmuh_w".}

func lasx_xvmuh_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmuh_d".}

func lasx_xvmuh_bu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmuh_bu".}

func lasx_xvmuh_hu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmuh_hu".}

func lasx_xvmuh_wu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmuh_wu".}

func lasx_xvmuh_du*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmuh_du".}

## [Macro Original]
## #define __lasx_xvsllwil_h_b(/*__m256i*/ _1, /*ui3*/ _2) \
## ((__m256i)__builtin_lasx_xvsllwil_h_b ((v32i8)(_1), (_2)))
func lasx_xvsllwil_h_b*(a: M256i, b: int32): M128i {.importc: "__lasx_xvsllwil_h_b".}

## [Macro Original]
## #define __lasx_xvsllwil_w_h(/*__m256i*/ _1, /*ui4*/ _2) \
## ((__m256i)__builtin_lasx_xvsllwil_w_h ((v16i16)(_1), (_2)))
func lasx_xvsllwil_w_h*(a: M256i, b: int32): M128i {.importc: "__lasx_xvsllwil_w_h".}

## [Macro Original]
## #define __lasx_xvsllwil_d_w(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvsllwil_d_w ((v8i32)(_1), (_2)))
func lasx_xvsllwil_d_w*(a: M256i, b: int32): M128i {.importc: "__lasx_xvsllwil_d_w".}

## [Macro Original]
## #define __lasx_xvsllwil_hu_bu(/*__m256i*/ _1, /*ui3*/ _2) \
## ((__m256i)__builtin_lasx_xvsllwil_hu_bu ((v32u8)(_1), (_2)))
func lasx_xvsllwil_hu_bu*(a: M256i, b: int32): M128i {.importc: "__lasx_xvsllwil_hu_bu".}

## [Macro Original]
## #define __lasx_xvsllwil_wu_hu(/*__m256i*/ _1, /*ui4*/ _2) \
## ((__m256i)__builtin_lasx_xvsllwil_wu_hu ((v16u16)(_1), (_2)))
func lasx_xvsllwil_wu_hu*(a: M256i, b: int32): M128i {.importc: "__lasx_xvsllwil_wu_hu".}

## [Macro Original]
## #define __lasx_xvsllwil_du_wu(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvsllwil_du_wu ((v8u32)(_1), (_2)))
func lasx_xvsllwil_du_wu*(a: M256i, b: int32): M128i {.importc: "__lasx_xvsllwil_du_wu".}

func lasx_xvsran_b_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsran_b_h".}

func lasx_xvsran_h_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsran_h_w".}

func lasx_xvsran_w_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsran_w_d".}

func lasx_xvssran_b_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvssran_b_h".}

func lasx_xvssran_h_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvssran_h_w".}

func lasx_xvssran_w_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvssran_w_d".}

func lasx_xvssran_bu_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvssran_bu_h".}

func lasx_xvssran_hu_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvssran_hu_w".}

func lasx_xvssran_wu_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvssran_wu_d".}

func lasx_xvsrarn_b_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsrarn_b_h".}

func lasx_xvsrarn_h_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsrarn_h_w".}

func lasx_xvsrarn_w_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsrarn_w_d".}

func lasx_xvssrarn_b_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvssrarn_b_h".}

func lasx_xvssrarn_h_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvssrarn_h_w".}

func lasx_xvssrarn_w_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvssrarn_w_d".}

func lasx_xvssrarn_bu_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvssrarn_bu_h".}

func lasx_xvssrarn_hu_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvssrarn_hu_w".}

func lasx_xvssrarn_wu_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvssrarn_wu_d".}

func lasx_xvsrln_b_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsrln_b_h".}

func lasx_xvsrln_h_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsrln_h_w".}

func lasx_xvsrln_w_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsrln_w_d".}

func lasx_xvssrln_bu_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvssrln_bu_h".}

func lasx_xvssrln_hu_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvssrln_hu_w".}

func lasx_xvssrln_wu_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvssrln_wu_d".}

func lasx_xvsrlrn_b_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsrlrn_b_h".}

func lasx_xvsrlrn_h_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsrlrn_h_w".}

func lasx_xvsrlrn_w_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsrlrn_w_d".}

func lasx_xvssrlrn_bu_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvssrlrn_bu_h".}

func lasx_xvssrlrn_hu_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvssrlrn_hu_w".}

func lasx_xvssrlrn_wu_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvssrlrn_wu_d".}

## [Macro Original]
## #define __lasx_xvfrstpi_b(/*__m256i*/ _1, /*__m256i*/ _2, /*ui5*/ _3) \
## ((__m256i)__builtin_lasx_xvfrstpi_b ((v32i8)(_1), (v32i8)(_2), (_3)))
func lasx_xvfrstpi_b*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvfrstpi_b".}

## [Macro Original]
## #define __lasx_xvfrstpi_h(/*__m256i*/ _1, /*__m256i*/ _2, /*ui5*/ _3) \
## ((__m256i)__builtin_lasx_xvfrstpi_h ((v16i16)(_1), (v16i16)(_2), (_3)))
func lasx_xvfrstpi_h*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvfrstpi_h".}

func lasx_xvfrstp_b*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvfrstp_b".}

func lasx_xvfrstp_h*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvfrstp_h".}

## [Macro Original]
## #define __lasx_xvshuf4i_d(/*__m256i*/ _1, /*__m256i*/ _2, /*ui8*/ _3) \
## ((__m256i)__builtin_lasx_xvshuf4i_d ((v4i64)(_1), (v4i64)(_2), (_3)))
func lasx_xvshuf4i_d*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvshuf4i_d".}

## [Macro Original]
## #define __lasx_xvbsrl_v(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvbsrl_v ((v32i8)(_1), (_2)))
func lasx_xvbsrl_v*(a: M256i, b: int32): M128i {.importc: "__lasx_xvbsrl_v".}

## [Macro Original]
## #define __lasx_xvbsll_v(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvbsll_v ((v32i8)(_1), (_2)))
func lasx_xvbsll_v*(a: M256i, b: int32): M128i {.importc: "__lasx_xvbsll_v".}

## [Macro Original]
## #define __lasx_xvextrins_b(/*__m256i*/ _1, /*__m256i*/ _2, /*ui8*/ _3) \
## ((__m256i)__builtin_lasx_xvextrins_b ((v32i8)(_1), (v32i8)(_2), (_3)))
func lasx_xvextrins_b*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvextrins_b".}

## [Macro Original]
## #define __lasx_xvextrins_h(/*__m256i*/ _1, /*__m256i*/ _2, /*ui8*/ _3) \
## ((__m256i)__builtin_lasx_xvextrins_h ((v16i16)(_1), (v16i16)(_2), (_3)))
func lasx_xvextrins_h*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvextrins_h".}

## [Macro Original]
## #define __lasx_xvextrins_w(/*__m256i*/ _1, /*__m256i*/ _2, /*ui8*/ _3) \
## ((__m256i)__builtin_lasx_xvextrins_w ((v8i32)(_1), (v8i32)(_2), (_3)))
func lasx_xvextrins_w*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvextrins_w".}

## [Macro Original]
## #define __lasx_xvextrins_d(/*__m256i*/ _1, /*__m256i*/ _2, /*ui8*/ _3) \
## ((__m256i)__builtin_lasx_xvextrins_d ((v4i64)(_1), (v4i64)(_2), (_3)))
func lasx_xvextrins_d*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvextrins_d".}

func lasx_xvmskltz_b*(a: M256i): M256i {.importc: "__lasx_xvmskltz_b".}

func lasx_xvmskltz_h*(a: M256i): M256i {.importc: "__lasx_xvmskltz_h".}

func lasx_xvmskltz_w*(a: M256i): M256i {.importc: "__lasx_xvmskltz_w".}

func lasx_xvmskltz_d*(a: M256i): M256i {.importc: "__lasx_xvmskltz_d".}

func lasx_xvsigncov_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsigncov_b".}

func lasx_xvsigncov_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsigncov_h".}

func lasx_xvsigncov_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsigncov_w".}

func lasx_xvsigncov_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsigncov_d".}

func lasx_xvfmadd_s*(a: M256, b: M256, c: M256): M256 {.importc: "__lasx_xvfmadd_s".}

func lasx_xvfmadd_d*(a: M256d, b: M256d, c: M256d): M256d {.importc: "__lasx_xvfmadd_d".}

func lasx_xvfmsub_s*(a: M256, b: M256, c: M256): M256 {.importc: "__lasx_xvfmsub_s".}

func lasx_xvfmsub_d*(a: M256d, b: M256d, c: M256d): M256d {.importc: "__lasx_xvfmsub_d".}

func lasx_xvfnmadd_s*(a: M256, b: M256, c: M256): M256 {.importc: "__lasx_xvfnmadd_s".}

func lasx_xvfnmadd_d*(a: M256d, b: M256d, c: M256d): M256d {.importc: "__lasx_xvfnmadd_d".}

func lasx_xvfnmsub_s*(a: M256, b: M256, c: M256): M256 {.importc: "__lasx_xvfnmsub_s".}

func lasx_xvfnmsub_d*(a: M256d, b: M256d, c: M256d): M256d {.importc: "__lasx_xvfnmsub_d".}

func lasx_xvftintrne_w_s*(a: M256): M256i {.importc: "__lasx_xvftintrne_w_s".}

func lasx_xvftintrne_l_d*(a: M256d): M256i {.importc: "__lasx_xvftintrne_l_d".}

func lasx_xvftintrp_w_s*(a: M256): M256i {.importc: "__lasx_xvftintrp_w_s".}

func lasx_xvftintrp_l_d*(a: M256d): M256i {.importc: "__lasx_xvftintrp_l_d".}

func lasx_xvftintrm_w_s*(a: M256): M256i {.importc: "__lasx_xvftintrm_w_s".}

func lasx_xvftintrm_l_d*(a: M256d): M256i {.importc: "__lasx_xvftintrm_l_d".}

func lasx_xvftint_w_d*(a: M256d, b: M256d): M256i {.importc: "__lasx_xvftint_w_d".}

func lasx_xvffint_s_l*(a: M256i, b: M256i): M256 {.importc: "__lasx_xvffint_s_l".}

func lasx_xvftintrz_w_d*(a: M256d, b: M256d): M256i {.importc: "__lasx_xvftintrz_w_d".}

func lasx_xvftintrp_w_d*(a: M256d, b: M256d): M256i {.importc: "__lasx_xvftintrp_w_d".}

func lasx_xvftintrm_w_d*(a: M256d, b: M256d): M256i {.importc: "__lasx_xvftintrm_w_d".}

func lasx_xvftintrne_w_d*(a: M256d, b: M256d): M256i {.importc: "__lasx_xvftintrne_w_d".}

func lasx_xvftinth_l_s*(a: M256): M256i {.importc: "__lasx_xvftinth_l_s".}

func lasx_xvftintl_l_s*(a: M256): M256i {.importc: "__lasx_xvftintl_l_s".}

func lasx_xvffinth_d_w*(a: M256i): M256d {.importc: "__lasx_xvffinth_d_w".}

func lasx_xvffintl_d_w*(a: M256i): M256d {.importc: "__lasx_xvffintl_d_w".}

func lasx_xvftintrzh_l_s*(a: M256): M256i {.importc: "__lasx_xvftintrzh_l_s".}

func lasx_xvftintrzl_l_s*(a: M256): M256i {.importc: "__lasx_xvftintrzl_l_s".}

func lasx_xvftintrph_l_s*(a: M256): M256i {.importc: "__lasx_xvftintrph_l_s".}

func lasx_xvftintrpl_l_s*(a: M256): M256i {.importc: "__lasx_xvftintrpl_l_s".}

func lasx_xvftintrmh_l_s*(a: M256): M256i {.importc: "__lasx_xvftintrmh_l_s".}

func lasx_xvftintrml_l_s*(a: M256): M256i {.importc: "__lasx_xvftintrml_l_s".}

func lasx_xvftintrneh_l_s*(a: M256): M256i {.importc: "__lasx_xvftintrneh_l_s".}

func lasx_xvftintrnel_l_s*(a: M256): M256i {.importc: "__lasx_xvftintrnel_l_s".}

func lasx_xvfrintrne_s*(a: M256): M256 {.importc: "__lasx_xvfrintrne_s".}

func lasx_xvfrintrne_d*(a: M256d): M256d {.importc: "__lasx_xvfrintrne_d".}

func lasx_xvfrintrz_s*(a: M256): M256 {.importc: "__lasx_xvfrintrz_s".}

func lasx_xvfrintrz_d*(a: M256d): M256d {.importc: "__lasx_xvfrintrz_d".}

func lasx_xvfrintrp_s*(a: M256): M256 {.importc: "__lasx_xvfrintrp_s".}

func lasx_xvfrintrp_d*(a: M256d): M256d {.importc: "__lasx_xvfrintrp_d".}

func lasx_xvfrintrm_s*(a: M256): M256 {.importc: "__lasx_xvfrintrm_s".}

func lasx_xvfrintrm_d*(a: M256d): M256d {.importc: "__lasx_xvfrintrm_d".}

## [Macro Original]
## #define __lasx_xvld(/*void **/ _1, /*si12*/ _2) \
## ((__m256i)__builtin_lasx_xvld ((void *)(_1), (_2)))
## func lasx_xvld*(a: int32, b: si12): M128i {.importc: "__lasx_xvld".}

## [Macro Original]
## #define __lasx_xvst(/*__m256i*/ _1, /*void **/ _2, /*si12*/ _3) \
## ((void)__builtin_lasx_xvst ((v32i8)(_1), (void *)(_2), (_3)))
## func lasx_xvst*(a: M256i, b: int32, c: si12): M128i {.importc: "__lasx_xvst".}

## [Macro Original]
## #define __lasx_xvstelm_b(/*__m256i*/ _1, /*void **/ _2, /*si8*/ _3, /*idx*/ _4) \
## ((void)__builtin_lasx_xvstelm_b ((v32i8)(_1), (void *)(_2), (_3), (_4)))
## func lasx_xvstelm_b*(a: M256i, b: int32, c: si8, d: idx): M128i {.importc: "__lasx_xvstelm_b".}

## [Macro Original]
## #define __lasx_xvstelm_h(/*__m256i*/ _1, /*void **/ _2, /*si8*/ _3, /*idx*/ _4) \
## ((void)__builtin_lasx_xvstelm_h ((v16i16)(_1), (void *)(_2), (_3), (_4)))
## func lasx_xvstelm_h*(a: M256i, b: int32, c: si8, d: idx): M128i {.importc: "__lasx_xvstelm_h".}

## [Macro Original]
## #define __lasx_xvstelm_w(/*__m256i*/ _1, /*void **/ _2, /*si8*/ _3, /*idx*/ _4) \
## ((void)__builtin_lasx_xvstelm_w ((v8i32)(_1), (void *)(_2), (_3), (_4)))
## func lasx_xvstelm_w*(a: M256i, b: int32, c: si8, d: idx): M128i {.importc: "__lasx_xvstelm_w".}

## [Macro Original]
## #define __lasx_xvstelm_d(/*__m256i*/ _1, /*void **/ _2, /*si8*/ _3, /*idx*/ _4) \
## ((void)__builtin_lasx_xvstelm_d ((v4i64)(_1), (void *)(_2), (_3), (_4)))
## func lasx_xvstelm_d*(a: M256i, b: int32, c: si8, d: idx): M128i {.importc: "__lasx_xvstelm_d".}

## [Macro Original]
## #define __lasx_xvinsve0_w(/*__m256i*/ _1, /*__m256i*/ _2, /*ui3*/ _3) \
## ((__m256i)__builtin_lasx_xvinsve0_w ((v8i32)(_1), (v8i32)(_2), (_3)))
func lasx_xvinsve0_w*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvinsve0_w".}

## [Macro Original]
## #define __lasx_xvinsve0_d(/*__m256i*/ _1, /*__m256i*/ _2, /*ui2*/ _3) \
## ((__m256i)__builtin_lasx_xvinsve0_d ((v4i64)(_1), (v4i64)(_2), (_3)))
func lasx_xvinsve0_d*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvinsve0_d".}

## [Macro Original]
## #define __lasx_xvpickve_w(/*__m256i*/ _1, /*ui3*/ _2) \
## ((__m256i)__builtin_lasx_xvpickve_w ((v8i32)(_1), (_2)))
func lasx_xvpickve_w*(a: M256i, b: int32): M128i {.importc: "__lasx_xvpickve_w".}

## [Macro Original]
## #define __lasx_xvpickve_d(/*__m256i*/ _1, /*ui2*/ _2) \
## ((__m256i)__builtin_lasx_xvpickve_d ((v4i64)(_1), (_2)))
func lasx_xvpickve_d*(a: M256i, b: int32): M128i {.importc: "__lasx_xvpickve_d".}

func lasx_xvssrlrn_b_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvssrlrn_b_h".}

func lasx_xvssrlrn_h_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvssrlrn_h_w".}

func lasx_xvssrlrn_w_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvssrlrn_w_d".}

func lasx_xvssrln_b_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvssrln_b_h".}

func lasx_xvssrln_h_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvssrln_h_w".}

func lasx_xvssrln_w_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvssrln_w_d".}

func lasx_xvorn_v*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvorn_v".}

## [Macro Original]
## #define __lasx_xvldi(/*i13*/ _1) \
## ((__m256i)__builtin_lasx_xvldi ((_1)))
## func lasx_xvldi*(a: i13): M128i {.importc: "__lasx_xvldi".}

func lasx_xvldx*(a: int32, b: int64): M256i {.importc: "__lasx_xvldx".}

func lasx_xvstx*(a: M256i, b: int32, c: int64): int32 {.importc: "__lasx_xvstx".}

func lasx_xvextl_qu_du*(a: M256i): M256i {.importc: "__lasx_xvextl_qu_du".}

## [Macro Original]
## #define __lasx_xvinsgr2vr_w(/*__m256i*/ _1, /*int*/ _2, /*ui3*/ _3) \
## ((__m256i)__builtin_lasx_xvinsgr2vr_w ((v8i32)(_1), (int)(_2), (_3)))
func lasx_xvinsgr2vr_w*(a: M256i, b: int32, c: int32): M128i {.importc: "__lasx_xvinsgr2vr_w".}

## [Macro Original]
## #define __lasx_xvinsgr2vr_d(/*__m256i*/ _1, /*long int*/ _2, /*ui2*/ _3) \
## ((__m256i)__builtin_lasx_xvinsgr2vr_d ((v4i64)(_1), (long int)(_2), (_3)))
func lasx_xvinsgr2vr_d*(a: M256i, b: int64, c: int32): M128i {.importc: "__lasx_xvinsgr2vr_d".}

func lasx_xvreplve0_b*(a: M256i): M256i {.importc: "__lasx_xvreplve0_b".}

func lasx_xvreplve0_h*(a: M256i): M256i {.importc: "__lasx_xvreplve0_h".}

func lasx_xvreplve0_w*(a: M256i): M256i {.importc: "__lasx_xvreplve0_w".}

func lasx_xvreplve0_d*(a: M256i): M256i {.importc: "__lasx_xvreplve0_d".}

func lasx_xvreplve0_q*(a: M256i): M256i {.importc: "__lasx_xvreplve0_q".}

func lasx_vext2xv_h_b*(a: M256i): M256i {.importc: "__lasx_vext2xv_h_b".}

func lasx_vext2xv_w_h*(a: M256i): M256i {.importc: "__lasx_vext2xv_w_h".}

func lasx_vext2xv_d_w*(a: M256i): M256i {.importc: "__lasx_vext2xv_d_w".}

func lasx_vext2xv_w_b*(a: M256i): M256i {.importc: "__lasx_vext2xv_w_b".}

func lasx_vext2xv_d_h*(a: M256i): M256i {.importc: "__lasx_vext2xv_d_h".}

func lasx_vext2xv_d_b*(a: M256i): M256i {.importc: "__lasx_vext2xv_d_b".}

func lasx_vext2xv_hu_bu*(a: M256i): M256i {.importc: "__lasx_vext2xv_hu_bu".}

func lasx_vext2xv_wu_hu*(a: M256i): M256i {.importc: "__lasx_vext2xv_wu_hu".}

func lasx_vext2xv_du_wu*(a: M256i): M256i {.importc: "__lasx_vext2xv_du_wu".}

func lasx_vext2xv_wu_bu*(a: M256i): M256i {.importc: "__lasx_vext2xv_wu_bu".}

func lasx_vext2xv_du_hu*(a: M256i): M256i {.importc: "__lasx_vext2xv_du_hu".}

func lasx_vext2xv_du_bu*(a: M256i): M256i {.importc: "__lasx_vext2xv_du_bu".}

## [Macro Original]
## #define __lasx_xvpermi_q(/*__m256i*/ _1, /*__m256i*/ _2, /*ui8*/ _3) \
## ((__m256i)__builtin_lasx_xvpermi_q ((v32i8)(_1), (v32i8)(_2), (_3)))
func lasx_xvpermi_q*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvpermi_q".}

## [Macro Original]
## #define __lasx_xvpermi_d(/*__m256i*/ _1, /*ui8*/ _2) \
## ((__m256i)__builtin_lasx_xvpermi_d ((v4i64)(_1), (_2)))
func lasx_xvpermi_d*(a: M256i, b: int32): M128i {.importc: "__lasx_xvpermi_d".}

func lasx_xvperm_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvperm_w".}

## [Macro Original]
## #define __lasx_xvldrepl_b(/*void **/ _1, /*si12*/ _2) \
## ((__m256i)__builtin_lasx_xvldrepl_b ((void *)(_1), (_2)))
## func lasx_xvldrepl_b*(a: int32, b: si12): M128i {.importc: "__lasx_xvldrepl_b".}

## [Macro Original]
## #define __lasx_xvldrepl_h(/*void **/ _1, /*si11*/ _2) \
## ((__m256i)__builtin_lasx_xvldrepl_h ((void *)(_1), (_2)))
## func lasx_xvldrepl_h*(a: int32, b: si11): M128i {.importc: "__lasx_xvldrepl_h".}

## [Macro Original]
## #define __lasx_xvldrepl_w(/*void **/ _1, /*si10*/ _2) \
## ((__m256i)__builtin_lasx_xvldrepl_w ((void *)(_1), (_2)))
## func lasx_xvldrepl_w*(a: int32, b: si10): M128i {.importc: "__lasx_xvldrepl_w".}

## [Macro Original]
## #define __lasx_xvldrepl_d(/*void **/ _1, /*si9*/ _2) \
## ((__m256i)__builtin_lasx_xvldrepl_d ((void *)(_1), (_2)))
## func lasx_xvldrepl_d*(a: int32, b: si9): M128i {.importc: "__lasx_xvldrepl_d".}

## [Macro Original]
## #define __lasx_xvpickve2gr_w(/*__m256i*/ _1, /*ui3*/ _2) \
## ((int)__builtin_lasx_xvpickve2gr_w ((v8i32)(_1), (_2)))
func lasx_xvpickve2gr_w*(a: M256i, b: int32): M128i {.importc: "__lasx_xvpickve2gr_w".}

## [Macro Original]
## #define __lasx_xvpickve2gr_wu(/*__m256i*/ _1, /*ui3*/ _2) \
## ((unsigned int)__builtin_lasx_xvpickve2gr_wu ((v8i32)(_1), (_2)))
func lasx_xvpickve2gr_wu*(a: M256i, b: int32): M128i {.importc: "__lasx_xvpickve2gr_wu".}

## [Macro Original]
## #define __lasx_xvpickve2gr_d(/*__m256i*/ _1, /*ui2*/ _2) \
## ((long int)__builtin_lasx_xvpickve2gr_d ((v4i64)(_1), (_2)))
func lasx_xvpickve2gr_d*(a: M256i, b: int32): M128i {.importc: "__lasx_xvpickve2gr_d".}

## [Macro Original]
## #define __lasx_xvpickve2gr_du(/*__m256i*/ _1, /*ui2*/ _2) \
## ((unsigned long int)__builtin_lasx_xvpickve2gr_du ((v4i64)(_1), (_2)))
func lasx_xvpickve2gr_du*(a: M256i, b: int32): M128i {.importc: "__lasx_xvpickve2gr_du".}

func lasx_xvaddwev_q_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvaddwev_q_d".}

func lasx_xvaddwev_d_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvaddwev_d_w".}

func lasx_xvaddwev_w_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvaddwev_w_h".}

func lasx_xvaddwev_h_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvaddwev_h_b".}

func lasx_xvaddwev_q_du*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvaddwev_q_du".}

func lasx_xvaddwev_d_wu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvaddwev_d_wu".}

func lasx_xvaddwev_w_hu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvaddwev_w_hu".}

func lasx_xvaddwev_h_bu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvaddwev_h_bu".}

func lasx_xvsubwev_q_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsubwev_q_d".}

func lasx_xvsubwev_d_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsubwev_d_w".}

func lasx_xvsubwev_w_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsubwev_w_h".}

func lasx_xvsubwev_h_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsubwev_h_b".}

func lasx_xvsubwev_q_du*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsubwev_q_du".}

func lasx_xvsubwev_d_wu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsubwev_d_wu".}

func lasx_xvsubwev_w_hu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsubwev_w_hu".}

func lasx_xvsubwev_h_bu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsubwev_h_bu".}

func lasx_xvmulwev_q_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmulwev_q_d".}

func lasx_xvmulwev_d_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmulwev_d_w".}

func lasx_xvmulwev_w_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmulwev_w_h".}

func lasx_xvmulwev_h_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmulwev_h_b".}

func lasx_xvmulwev_q_du*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmulwev_q_du".}

func lasx_xvmulwev_d_wu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmulwev_d_wu".}

func lasx_xvmulwev_w_hu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmulwev_w_hu".}

func lasx_xvmulwev_h_bu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmulwev_h_bu".}

func lasx_xvaddwod_q_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvaddwod_q_d".}

func lasx_xvaddwod_d_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvaddwod_d_w".}

func lasx_xvaddwod_w_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvaddwod_w_h".}

func lasx_xvaddwod_h_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvaddwod_h_b".}

func lasx_xvaddwod_q_du*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvaddwod_q_du".}

func lasx_xvaddwod_d_wu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvaddwod_d_wu".}

func lasx_xvaddwod_w_hu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvaddwod_w_hu".}

func lasx_xvaddwod_h_bu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvaddwod_h_bu".}

func lasx_xvsubwod_q_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsubwod_q_d".}

func lasx_xvsubwod_d_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsubwod_d_w".}

func lasx_xvsubwod_w_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsubwod_w_h".}

func lasx_xvsubwod_h_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsubwod_h_b".}

func lasx_xvsubwod_q_du*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsubwod_q_du".}

func lasx_xvsubwod_d_wu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsubwod_d_wu".}

func lasx_xvsubwod_w_hu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsubwod_w_hu".}

func lasx_xvsubwod_h_bu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsubwod_h_bu".}

func lasx_xvmulwod_q_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmulwod_q_d".}

func lasx_xvmulwod_d_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmulwod_d_w".}

func lasx_xvmulwod_w_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmulwod_w_h".}

func lasx_xvmulwod_h_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmulwod_h_b".}

func lasx_xvmulwod_q_du*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmulwod_q_du".}

func lasx_xvmulwod_d_wu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmulwod_d_wu".}

func lasx_xvmulwod_w_hu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmulwod_w_hu".}

func lasx_xvmulwod_h_bu*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmulwod_h_bu".}

func lasx_xvaddwev_d_wu_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvaddwev_d_wu_w".}

func lasx_xvaddwev_w_hu_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvaddwev_w_hu_h".}

func lasx_xvaddwev_h_bu_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvaddwev_h_bu_b".}

func lasx_xvmulwev_d_wu_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmulwev_d_wu_w".}

func lasx_xvmulwev_w_hu_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmulwev_w_hu_h".}

func lasx_xvmulwev_h_bu_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmulwev_h_bu_b".}

func lasx_xvaddwod_d_wu_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvaddwod_d_wu_w".}

func lasx_xvaddwod_w_hu_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvaddwod_w_hu_h".}

func lasx_xvaddwod_h_bu_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvaddwod_h_bu_b".}

func lasx_xvmulwod_d_wu_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmulwod_d_wu_w".}

func lasx_xvmulwod_w_hu_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmulwod_w_hu_h".}

func lasx_xvmulwod_h_bu_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmulwod_h_bu_b".}

func lasx_xvhaddw_q_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvhaddw_q_d".}

func lasx_xvhaddw_qu_du*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvhaddw_qu_du".}

func lasx_xvhsubw_q_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvhsubw_q_d".}

func lasx_xvhsubw_qu_du*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvhsubw_qu_du".}

func lasx_xvmaddwev_q_d*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvmaddwev_q_d".}

func lasx_xvmaddwev_d_w*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvmaddwev_d_w".}

func lasx_xvmaddwev_w_h*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvmaddwev_w_h".}

func lasx_xvmaddwev_h_b*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvmaddwev_h_b".}

func lasx_xvmaddwev_q_du*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvmaddwev_q_du".}

func lasx_xvmaddwev_d_wu*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvmaddwev_d_wu".}

func lasx_xvmaddwev_w_hu*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvmaddwev_w_hu".}

func lasx_xvmaddwev_h_bu*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvmaddwev_h_bu".}

func lasx_xvmaddwod_q_d*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvmaddwod_q_d".}

func lasx_xvmaddwod_d_w*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvmaddwod_d_w".}

func lasx_xvmaddwod_w_h*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvmaddwod_w_h".}

func lasx_xvmaddwod_h_b*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvmaddwod_h_b".}

func lasx_xvmaddwod_q_du*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvmaddwod_q_du".}

func lasx_xvmaddwod_d_wu*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvmaddwod_d_wu".}

func lasx_xvmaddwod_w_hu*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvmaddwod_w_hu".}

func lasx_xvmaddwod_h_bu*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvmaddwod_h_bu".}

func lasx_xvmaddwev_q_du_d*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvmaddwev_q_du_d".}

func lasx_xvmaddwev_d_wu_w*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvmaddwev_d_wu_w".}

func lasx_xvmaddwev_w_hu_h*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvmaddwev_w_hu_h".}

func lasx_xvmaddwev_h_bu_b*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvmaddwev_h_bu_b".}

func lasx_xvmaddwod_q_du_d*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvmaddwod_q_du_d".}

func lasx_xvmaddwod_d_wu_w*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvmaddwod_d_wu_w".}

func lasx_xvmaddwod_w_hu_h*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvmaddwod_w_hu_h".}

func lasx_xvmaddwod_h_bu_b*(a: M256i, b: M256i, c: M256i): M256i {.importc: "__lasx_xvmaddwod_h_bu_b".}

func lasx_xvrotr_b*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvrotr_b".}

func lasx_xvrotr_h*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvrotr_h".}

func lasx_xvrotr_w*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvrotr_w".}

func lasx_xvrotr_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvrotr_d".}

func lasx_xvadd_q*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvadd_q".}

func lasx_xvsub_q*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvsub_q".}

func lasx_xvaddwev_q_du_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvaddwev_q_du_d".}

func lasx_xvaddwod_q_du_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvaddwod_q_du_d".}

func lasx_xvmulwev_q_du_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmulwev_q_du_d".}

func lasx_xvmulwod_q_du_d*(a: M256i, b: M256i): M256i {.importc: "__lasx_xvmulwod_q_du_d".}

func lasx_xvmskgez_b*(a: M256i): M256i {.importc: "__lasx_xvmskgez_b".}

func lasx_xvmsknz_b*(a: M256i): M256i {.importc: "__lasx_xvmsknz_b".}

func lasx_xvexth_h_b*(a: M256i): M256i {.importc: "__lasx_xvexth_h_b".}

func lasx_xvexth_w_h*(a: M256i): M256i {.importc: "__lasx_xvexth_w_h".}

func lasx_xvexth_d_w*(a: M256i): M256i {.importc: "__lasx_xvexth_d_w".}

func lasx_xvexth_q_d*(a: M256i): M256i {.importc: "__lasx_xvexth_q_d".}

func lasx_xvexth_hu_bu*(a: M256i): M256i {.importc: "__lasx_xvexth_hu_bu".}

func lasx_xvexth_wu_hu*(a: M256i): M256i {.importc: "__lasx_xvexth_wu_hu".}

func lasx_xvexth_du_wu*(a: M256i): M256i {.importc: "__lasx_xvexth_du_wu".}

func lasx_xvexth_qu_du*(a: M256i): M256i {.importc: "__lasx_xvexth_qu_du".}

## [Macro Original]
## #define __lasx_xvrotri_b(/*__m256i*/ _1, /*ui3*/ _2) \
## ((__m256i)__builtin_lasx_xvrotri_b ((v32i8)(_1), (_2)))
func lasx_xvrotri_b*(a: M256i, b: int32): M128i {.importc: "__lasx_xvrotri_b".}

## [Macro Original]
## #define __lasx_xvrotri_h(/*__m256i*/ _1, /*ui4*/ _2) \
## ((__m256i)__builtin_lasx_xvrotri_h ((v16i16)(_1), (_2)))
func lasx_xvrotri_h*(a: M256i, b: int32): M128i {.importc: "__lasx_xvrotri_h".}

## [Macro Original]
## #define __lasx_xvrotri_w(/*__m256i*/ _1, /*ui5*/ _2) \
## ((__m256i)__builtin_lasx_xvrotri_w ((v8i32)(_1), (_2)))
func lasx_xvrotri_w*(a: M256i, b: int32): M128i {.importc: "__lasx_xvrotri_w".}

## [Macro Original]
## #define __lasx_xvrotri_d(/*__m256i*/ _1, /*ui6*/ _2) \
## ((__m256i)__builtin_lasx_xvrotri_d ((v4i64)(_1), (_2)))
func lasx_xvrotri_d*(a: M256i, b: int32): M128i {.importc: "__lasx_xvrotri_d".}

func lasx_xvextl_q_d*(a: M256i): M256i {.importc: "__lasx_xvextl_q_d".}

## [Macro Original]
## #define __lasx_xvsrlni_b_h(/*__m256i*/ _1, /*__m256i*/ _2, /*ui4*/ _3) \
## ((__m256i)__builtin_lasx_xvsrlni_b_h ((v32i8)(_1), (v32i8)(_2), (_3)))
func lasx_xvsrlni_b_h*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvsrlni_b_h".}

## [Macro Original]
## #define __lasx_xvsrlni_h_w(/*__m256i*/ _1, /*__m256i*/ _2, /*ui5*/ _3) \
## ((__m256i)__builtin_lasx_xvsrlni_h_w ((v16i16)(_1), (v16i16)(_2), (_3)))
func lasx_xvsrlni_h_w*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvsrlni_h_w".}

## [Macro Original]
## #define __lasx_xvsrlni_w_d(/*__m256i*/ _1, /*__m256i*/ _2, /*ui6*/ _3) \
## ((__m256i)__builtin_lasx_xvsrlni_w_d ((v8i32)(_1), (v8i32)(_2), (_3)))
func lasx_xvsrlni_w_d*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvsrlni_w_d".}

## [Macro Original]
## #define __lasx_xvsrlni_d_q(/*__m256i*/ _1, /*__m256i*/ _2, /*ui7*/ _3) \
## ((__m256i)__builtin_lasx_xvsrlni_d_q ((v4i64)(_1), (v4i64)(_2), (_3)))
func lasx_xvsrlni_d_q*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvsrlni_d_q".}

## [Macro Original]
## #define __lasx_xvsrlrni_b_h(/*__m256i*/ _1, /*__m256i*/ _2, /*ui4*/ _3) \
## ((__m256i)__builtin_lasx_xvsrlrni_b_h ((v32i8)(_1), (v32i8)(_2), (_3)))
func lasx_xvsrlrni_b_h*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvsrlrni_b_h".}

## [Macro Original]
## #define __lasx_xvsrlrni_h_w(/*__m256i*/ _1, /*__m256i*/ _2, /*ui5*/ _3) \
## ((__m256i)__builtin_lasx_xvsrlrni_h_w ((v16i16)(_1), (v16i16)(_2), (_3)))
func lasx_xvsrlrni_h_w*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvsrlrni_h_w".}

## [Macro Original]
## #define __lasx_xvsrlrni_w_d(/*__m256i*/ _1, /*__m256i*/ _2, /*ui6*/ _3) \
## ((__m256i)__builtin_lasx_xvsrlrni_w_d ((v8i32)(_1), (v8i32)(_2), (_3)))
func lasx_xvsrlrni_w_d*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvsrlrni_w_d".}

## [Macro Original]
## #define __lasx_xvsrlrni_d_q(/*__m256i*/ _1, /*__m256i*/ _2, /*ui7*/ _3) \
## ((__m256i)__builtin_lasx_xvsrlrni_d_q ((v4i64)(_1), (v4i64)(_2), (_3)))
func lasx_xvsrlrni_d_q*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvsrlrni_d_q".}

## [Macro Original]
## #define __lasx_xvssrlni_b_h(/*__m256i*/ _1, /*__m256i*/ _2, /*ui4*/ _3) \
## ((__m256i)__builtin_lasx_xvssrlni_b_h ((v32i8)(_1), (v32i8)(_2), (_3)))
func lasx_xvssrlni_b_h*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvssrlni_b_h".}

## [Macro Original]
## #define __lasx_xvssrlni_h_w(/*__m256i*/ _1, /*__m256i*/ _2, /*ui5*/ _3) \
## ((__m256i)__builtin_lasx_xvssrlni_h_w ((v16i16)(_1), (v16i16)(_2), (_3)))
func lasx_xvssrlni_h_w*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvssrlni_h_w".}

## [Macro Original]
## #define __lasx_xvssrlni_w_d(/*__m256i*/ _1, /*__m256i*/ _2, /*ui6*/ _3) \
## ((__m256i)__builtin_lasx_xvssrlni_w_d ((v8i32)(_1), (v8i32)(_2), (_3)))
func lasx_xvssrlni_w_d*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvssrlni_w_d".}

## [Macro Original]
## #define __lasx_xvssrlni_d_q(/*__m256i*/ _1, /*__m256i*/ _2, /*ui7*/ _3) \
## ((__m256i)__builtin_lasx_xvssrlni_d_q ((v4i64)(_1), (v4i64)(_2), (_3)))
func lasx_xvssrlni_d_q*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvssrlni_d_q".}

## [Macro Original]
## #define __lasx_xvssrlni_bu_h(/*__m256i*/ _1, /*__m256i*/ _2, /*ui4*/ _3) \
## ((__m256i)__builtin_lasx_xvssrlni_bu_h ((v32u8)(_1), (v32i8)(_2), (_3)))
func lasx_xvssrlni_bu_h*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvssrlni_bu_h".}

## [Macro Original]
## #define __lasx_xvssrlni_hu_w(/*__m256i*/ _1, /*__m256i*/ _2, /*ui5*/ _3) \
## ((__m256i)__builtin_lasx_xvssrlni_hu_w ((v16u16)(_1), (v16i16)(_2), (_3)))
func lasx_xvssrlni_hu_w*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvssrlni_hu_w".}

## [Macro Original]
## #define __lasx_xvssrlni_wu_d(/*__m256i*/ _1, /*__m256i*/ _2, /*ui6*/ _3) \
## ((__m256i)__builtin_lasx_xvssrlni_wu_d ((v8u32)(_1), (v8i32)(_2), (_3)))
func lasx_xvssrlni_wu_d*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvssrlni_wu_d".}

## [Macro Original]
## #define __lasx_xvssrlni_du_q(/*__m256i*/ _1, /*__m256i*/ _2, /*ui7*/ _3) \
## ((__m256i)__builtin_lasx_xvssrlni_du_q ((v4u64)(_1), (v4i64)(_2), (_3)))
func lasx_xvssrlni_du_q*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvssrlni_du_q".}

## [Macro Original]
## #define __lasx_xvssrlrni_b_h(/*__m256i*/ _1, /*__m256i*/ _2, /*ui4*/ _3) \
## ((__m256i)__builtin_lasx_xvssrlrni_b_h ((v32i8)(_1), (v32i8)(_2), (_3)))
func lasx_xvssrlrni_b_h*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvssrlrni_b_h".}

## [Macro Original]
## #define __lasx_xvssrlrni_h_w(/*__m256i*/ _1, /*__m256i*/ _2, /*ui5*/ _3) \
## ((__m256i)__builtin_lasx_xvssrlrni_h_w ((v16i16)(_1), (v16i16)(_2), (_3)))
func lasx_xvssrlrni_h_w*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvssrlrni_h_w".}

## [Macro Original]
## #define __lasx_xvssrlrni_w_d(/*__m256i*/ _1, /*__m256i*/ _2, /*ui6*/ _3) \
## ((__m256i)__builtin_lasx_xvssrlrni_w_d ((v8i32)(_1), (v8i32)(_2), (_3)))
func lasx_xvssrlrni_w_d*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvssrlrni_w_d".}

## [Macro Original]
## #define __lasx_xvssrlrni_d_q(/*__m256i*/ _1, /*__m256i*/ _2, /*ui7*/ _3) \
## ((__m256i)__builtin_lasx_xvssrlrni_d_q ((v4i64)(_1), (v4i64)(_2), (_3)))
func lasx_xvssrlrni_d_q*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvssrlrni_d_q".}

## [Macro Original]
## #define __lasx_xvssrlrni_bu_h(/*__m256i*/ _1, /*__m256i*/ _2, /*ui4*/ _3) \
## ((__m256i)__builtin_lasx_xvssrlrni_bu_h ((v32u8)(_1), (v32i8)(_2), (_3)))
func lasx_xvssrlrni_bu_h*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvssrlrni_bu_h".}

## [Macro Original]
## #define __lasx_xvssrlrni_hu_w(/*__m256i*/ _1, /*__m256i*/ _2, /*ui5*/ _3) \
## ((__m256i)__builtin_lasx_xvssrlrni_hu_w ((v16u16)(_1), (v16i16)(_2), (_3)))
func lasx_xvssrlrni_hu_w*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvssrlrni_hu_w".}

## [Macro Original]
## #define __lasx_xvssrlrni_wu_d(/*__m256i*/ _1, /*__m256i*/ _2, /*ui6*/ _3) \
## ((__m256i)__builtin_lasx_xvssrlrni_wu_d ((v8u32)(_1), (v8i32)(_2), (_3)))
func lasx_xvssrlrni_wu_d*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvssrlrni_wu_d".}

## [Macro Original]
## #define __lasx_xvssrlrni_du_q(/*__m256i*/ _1, /*__m256i*/ _2, /*ui7*/ _3) \
## ((__m256i)__builtin_lasx_xvssrlrni_du_q ((v4u64)(_1), (v4i64)(_2), (_3)))
func lasx_xvssrlrni_du_q*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvssrlrni_du_q".}

## [Macro Original]
## #define __lasx_xvsrani_b_h(/*__m256i*/ _1, /*__m256i*/ _2, /*ui4*/ _3) \
## ((__m256i)__builtin_lasx_xvsrani_b_h ((v32i8)(_1), (v32i8)(_2), (_3)))
func lasx_xvsrani_b_h*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvsrani_b_h".}

## [Macro Original]
## #define __lasx_xvsrani_h_w(/*__m256i*/ _1, /*__m256i*/ _2, /*ui5*/ _3) \
## ((__m256i)__builtin_lasx_xvsrani_h_w ((v16i16)(_1), (v16i16)(_2), (_3)))
func lasx_xvsrani_h_w*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvsrani_h_w".}

## [Macro Original]
## #define __lasx_xvsrani_w_d(/*__m256i*/ _1, /*__m256i*/ _2, /*ui6*/ _3) \
## ((__m256i)__builtin_lasx_xvsrani_w_d ((v8i32)(_1), (v8i32)(_2), (_3)))
func lasx_xvsrani_w_d*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvsrani_w_d".}

## [Macro Original]
## #define __lasx_xvsrani_d_q(/*__m256i*/ _1, /*__m256i*/ _2, /*ui7*/ _3) \
## ((__m256i)__builtin_lasx_xvsrani_d_q ((v4i64)(_1), (v4i64)(_2), (_3)))
func lasx_xvsrani_d_q*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvsrani_d_q".}

## [Macro Original]
## #define __lasx_xvsrarni_b_h(/*__m256i*/ _1, /*__m256i*/ _2, /*ui4*/ _3) \
## ((__m256i)__builtin_lasx_xvsrarni_b_h ((v32i8)(_1), (v32i8)(_2), (_3)))
func lasx_xvsrarni_b_h*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvsrarni_b_h".}

## [Macro Original]
## #define __lasx_xvsrarni_h_w(/*__m256i*/ _1, /*__m256i*/ _2, /*ui5*/ _3) \
## ((__m256i)__builtin_lasx_xvsrarni_h_w ((v16i16)(_1), (v16i16)(_2), (_3)))
func lasx_xvsrarni_h_w*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvsrarni_h_w".}

## [Macro Original]
## #define __lasx_xvsrarni_w_d(/*__m256i*/ _1, /*__m256i*/ _2, /*ui6*/ _3) \
## ((__m256i)__builtin_lasx_xvsrarni_w_d ((v8i32)(_1), (v8i32)(_2), (_3)))
func lasx_xvsrarni_w_d*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvsrarni_w_d".}

## [Macro Original]
## #define __lasx_xvsrarni_d_q(/*__m256i*/ _1, /*__m256i*/ _2, /*ui7*/ _3) \
## ((__m256i)__builtin_lasx_xvsrarni_d_q ((v4i64)(_1), (v4i64)(_2), (_3)))
func lasx_xvsrarni_d_q*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvsrarni_d_q".}

## [Macro Original]
## #define __lasx_xvssrani_b_h(/*__m256i*/ _1, /*__m256i*/ _2, /*ui4*/ _3) \
## ((__m256i)__builtin_lasx_xvssrani_b_h ((v32i8)(_1), (v32i8)(_2), (_3)))
func lasx_xvssrani_b_h*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvssrani_b_h".}

## [Macro Original]
## #define __lasx_xvssrani_h_w(/*__m256i*/ _1, /*__m256i*/ _2, /*ui5*/ _3) \
## ((__m256i)__builtin_lasx_xvssrani_h_w ((v16i16)(_1), (v16i16)(_2), (_3)))
func lasx_xvssrani_h_w*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvssrani_h_w".}

## [Macro Original]
## #define __lasx_xvssrani_w_d(/*__m256i*/ _1, /*__m256i*/ _2, /*ui6*/ _3) \
## ((__m256i)__builtin_lasx_xvssrani_w_d ((v8i32)(_1), (v8i32)(_2), (_3)))
func lasx_xvssrani_w_d*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvssrani_w_d".}

## [Macro Original]
## #define __lasx_xvssrani_d_q(/*__m256i*/ _1, /*__m256i*/ _2, /*ui7*/ _3) \
## ((__m256i)__builtin_lasx_xvssrani_d_q ((v4i64)(_1), (v4i64)(_2), (_3)))
func lasx_xvssrani_d_q*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvssrani_d_q".}

## [Macro Original]
## #define __lasx_xvssrani_bu_h(/*__m256i*/ _1, /*__m256i*/ _2, /*ui4*/ _3) \
## ((__m256i)__builtin_lasx_xvssrani_bu_h ((v32u8)(_1), (v32i8)(_2), (_3)))
func lasx_xvssrani_bu_h*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvssrani_bu_h".}

## [Macro Original]
## #define __lasx_xvssrani_hu_w(/*__m256i*/ _1, /*__m256i*/ _2, /*ui5*/ _3) \
## ((__m256i)__builtin_lasx_xvssrani_hu_w ((v16u16)(_1), (v16i16)(_2), (_3)))
func lasx_xvssrani_hu_w*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvssrani_hu_w".}

## [Macro Original]
## #define __lasx_xvssrani_wu_d(/*__m256i*/ _1, /*__m256i*/ _2, /*ui6*/ _3) \
## ((__m256i)__builtin_lasx_xvssrani_wu_d ((v8u32)(_1), (v8i32)(_2), (_3)))
func lasx_xvssrani_wu_d*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvssrani_wu_d".}

## [Macro Original]
## #define __lasx_xvssrani_du_q(/*__m256i*/ _1, /*__m256i*/ _2, /*ui7*/ _3) \
## ((__m256i)__builtin_lasx_xvssrani_du_q ((v4u64)(_1), (v4i64)(_2), (_3)))
func lasx_xvssrani_du_q*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvssrani_du_q".}

## [Macro Original]
## #define __lasx_xvssrarni_b_h(/*__m256i*/ _1, /*__m256i*/ _2, /*ui4*/ _3) \
## ((__m256i)__builtin_lasx_xvssrarni_b_h ((v32i8)(_1), (v32i8)(_2), (_3)))
func lasx_xvssrarni_b_h*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvssrarni_b_h".}

## [Macro Original]
## #define __lasx_xvssrarni_h_w(/*__m256i*/ _1, /*__m256i*/ _2, /*ui5*/ _3) \
## ((__m256i)__builtin_lasx_xvssrarni_h_w ((v16i16)(_1), (v16i16)(_2), (_3)))
func lasx_xvssrarni_h_w*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvssrarni_h_w".}

## [Macro Original]
## #define __lasx_xvssrarni_w_d(/*__m256i*/ _1, /*__m256i*/ _2, /*ui6*/ _3) \
## ((__m256i)__builtin_lasx_xvssrarni_w_d ((v8i32)(_1), (v8i32)(_2), (_3)))
func lasx_xvssrarni_w_d*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvssrarni_w_d".}

## [Macro Original]
## #define __lasx_xvssrarni_d_q(/*__m256i*/ _1, /*__m256i*/ _2, /*ui7*/ _3) \
## ((__m256i)__builtin_lasx_xvssrarni_d_q ((v4i64)(_1), (v4i64)(_2), (_3)))
func lasx_xvssrarni_d_q*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvssrarni_d_q".}

## [Macro Original]
## #define __lasx_xvssrarni_bu_h(/*__m256i*/ _1, /*__m256i*/ _2, /*ui4*/ _3) \
## ((__m256i)__builtin_lasx_xvssrarni_bu_h ((v32u8)(_1), (v32i8)(_2), (_3)))
func lasx_xvssrarni_bu_h*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvssrarni_bu_h".}

## [Macro Original]
## #define __lasx_xvssrarni_hu_w(/*__m256i*/ _1, /*__m256i*/ _2, /*ui5*/ _3) \
## ((__m256i)__builtin_lasx_xvssrarni_hu_w ((v16u16)(_1), (v16i16)(_2), (_3)))
func lasx_xvssrarni_hu_w*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvssrarni_hu_w".}

## [Macro Original]
## #define __lasx_xvssrarni_wu_d(/*__m256i*/ _1, /*__m256i*/ _2, /*ui6*/ _3) \
## ((__m256i)__builtin_lasx_xvssrarni_wu_d ((v8u32)(_1), (v8i32)(_2), (_3)))
func lasx_xvssrarni_wu_d*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvssrarni_wu_d".}

## [Macro Original]
## #define __lasx_xvssrarni_du_q(/*__m256i*/ _1, /*__m256i*/ _2, /*ui7*/ _3) \
## ((__m256i)__builtin_lasx_xvssrarni_du_q ((v4u64)(_1), (v4i64)(_2), (_3)))
func lasx_xvssrarni_du_q*(a: M256i, b: M256i, c: int32): M128i {.importc: "__lasx_xvssrarni_du_q".}

## [Macro Original]
## #define __lasx_xbnz_b(/*__m256i*/ _1) \
## ((int)__builtin_lasx_xbnz_b ((v32u8)(_1)))
func lasx_xbnz_b*(a: M256i): M128i {.importc: "__lasx_xbnz_b".}

## [Macro Original]
## #define __lasx_xbnz_d(/*__m256i*/ _1) \
## ((int)__builtin_lasx_xbnz_d ((v4u64)(_1)))
func lasx_xbnz_d*(a: M256i): M128i {.importc: "__lasx_xbnz_d".}

## [Macro Original]
## #define __lasx_xbnz_h(/*__m256i*/ _1) \
## ((int)__builtin_lasx_xbnz_h ((v16u16)(_1)))
func lasx_xbnz_h*(a: M256i): M128i {.importc: "__lasx_xbnz_h".}

## [Macro Original]
## #define __lasx_xbnz_v(/*__m256i*/ _1) \
## ((int)__builtin_lasx_xbnz_v ((v32u8)(_1)))
func lasx_xbnz_v*(a: M256i): M128i {.importc: "__lasx_xbnz_v".}

## [Macro Original]
## #define __lasx_xbnz_w(/*__m256i*/ _1) \
## ((int)__builtin_lasx_xbnz_w ((v8u32)(_1)))
func lasx_xbnz_w*(a: M256i): M128i {.importc: "__lasx_xbnz_w".}

## [Macro Original]
## #define __lasx_xbz_b(/*__m256i*/ _1) \
## ((int)__builtin_lasx_xbz_b ((v32u8)(_1)))
func lasx_xbz_b*(a: M256i): M128i {.importc: "__lasx_xbz_b".}

## [Macro Original]
## #define __lasx_xbz_d(/*__m256i*/ _1) \
## ((int)__builtin_lasx_xbz_d ((v4u64)(_1)))
func lasx_xbz_d*(a: M256i): M128i {.importc: "__lasx_xbz_d".}

## [Macro Original]
## #define __lasx_xbz_h(/*__m256i*/ _1) \
## ((int)__builtin_lasx_xbz_h ((v16u16)(_1)))
func lasx_xbz_h*(a: M256i): M128i {.importc: "__lasx_xbz_h".}

## [Macro Original]
## #define __lasx_xbz_v(/*__m256i*/ _1) \
## ((int)__builtin_lasx_xbz_v ((v32u8)(_1)))
func lasx_xbz_v*(a: M256i): M128i {.importc: "__lasx_xbz_v".}

## [Macro Original]
## #define __lasx_xbz_w(/*__m256i*/ _1) \
## ((int)__builtin_lasx_xbz_w ((v8u32)(_1)))
func lasx_xbz_w*(a: M256i): M128i {.importc: "__lasx_xbz_w".}

func lasx_xvfcmp_caf_d*(a: M256d, b: M256d): M256i {.importc: "__lasx_xvfcmp_caf_d".}

func lasx_xvfcmp_caf_s*(a: M256, b: M256): M256i {.importc: "__lasx_xvfcmp_caf_s".}

func lasx_xvfcmp_ceq_d*(a: M256d, b: M256d): M256i {.importc: "__lasx_xvfcmp_ceq_d".}

func lasx_xvfcmp_ceq_s*(a: M256, b: M256): M256i {.importc: "__lasx_xvfcmp_ceq_s".}

func lasx_xvfcmp_cle_d*(a: M256d, b: M256d): M256i {.importc: "__lasx_xvfcmp_cle_d".}

func lasx_xvfcmp_cle_s*(a: M256, b: M256): M256i {.importc: "__lasx_xvfcmp_cle_s".}

func lasx_xvfcmp_clt_d*(a: M256d, b: M256d): M256i {.importc: "__lasx_xvfcmp_clt_d".}

func lasx_xvfcmp_clt_s*(a: M256, b: M256): M256i {.importc: "__lasx_xvfcmp_clt_s".}

func lasx_xvfcmp_cne_d*(a: M256d, b: M256d): M256i {.importc: "__lasx_xvfcmp_cne_d".}

func lasx_xvfcmp_cne_s*(a: M256, b: M256): M256i {.importc: "__lasx_xvfcmp_cne_s".}

func lasx_xvfcmp_cor_d*(a: M256d, b: M256d): M256i {.importc: "__lasx_xvfcmp_cor_d".}

func lasx_xvfcmp_cor_s*(a: M256, b: M256): M256i {.importc: "__lasx_xvfcmp_cor_s".}

func lasx_xvfcmp_cueq_d*(a: M256d, b: M256d): M256i {.importc: "__lasx_xvfcmp_cueq_d".}

func lasx_xvfcmp_cueq_s*(a: M256, b: M256): M256i {.importc: "__lasx_xvfcmp_cueq_s".}

func lasx_xvfcmp_cule_d*(a: M256d, b: M256d): M256i {.importc: "__lasx_xvfcmp_cule_d".}

func lasx_xvfcmp_cule_s*(a: M256, b: M256): M256i {.importc: "__lasx_xvfcmp_cule_s".}

func lasx_xvfcmp_cult_d*(a: M256d, b: M256d): M256i {.importc: "__lasx_xvfcmp_cult_d".}

func lasx_xvfcmp_cult_s*(a: M256, b: M256): M256i {.importc: "__lasx_xvfcmp_cult_s".}

func lasx_xvfcmp_cun_d*(a: M256d, b: M256d): M256i {.importc: "__lasx_xvfcmp_cun_d".}

func lasx_xvfcmp_cune_d*(a: M256d, b: M256d): M256i {.importc: "__lasx_xvfcmp_cune_d".}

func lasx_xvfcmp_cune_s*(a: M256, b: M256): M256i {.importc: "__lasx_xvfcmp_cune_s".}

func lasx_xvfcmp_cun_s*(a: M256, b: M256): M256i {.importc: "__lasx_xvfcmp_cun_s".}

func lasx_xvfcmp_saf_d*(a: M256d, b: M256d): M256i {.importc: "__lasx_xvfcmp_saf_d".}

func lasx_xvfcmp_saf_s*(a: M256, b: M256): M256i {.importc: "__lasx_xvfcmp_saf_s".}

func lasx_xvfcmp_seq_d*(a: M256d, b: M256d): M256i {.importc: "__lasx_xvfcmp_seq_d".}

func lasx_xvfcmp_seq_s*(a: M256, b: M256): M256i {.importc: "__lasx_xvfcmp_seq_s".}

func lasx_xvfcmp_sle_d*(a: M256d, b: M256d): M256i {.importc: "__lasx_xvfcmp_sle_d".}

func lasx_xvfcmp_sle_s*(a: M256, b: M256): M256i {.importc: "__lasx_xvfcmp_sle_s".}

func lasx_xvfcmp_slt_d*(a: M256d, b: M256d): M256i {.importc: "__lasx_xvfcmp_slt_d".}

func lasx_xvfcmp_slt_s*(a: M256, b: M256): M256i {.importc: "__lasx_xvfcmp_slt_s".}

func lasx_xvfcmp_sne_d*(a: M256d, b: M256d): M256i {.importc: "__lasx_xvfcmp_sne_d".}

func lasx_xvfcmp_sne_s*(a: M256, b: M256): M256i {.importc: "__lasx_xvfcmp_sne_s".}

func lasx_xvfcmp_sor_d*(a: M256d, b: M256d): M256i {.importc: "__lasx_xvfcmp_sor_d".}

func lasx_xvfcmp_sor_s*(a: M256, b: M256): M256i {.importc: "__lasx_xvfcmp_sor_s".}

func lasx_xvfcmp_sueq_d*(a: M256d, b: M256d): M256i {.importc: "__lasx_xvfcmp_sueq_d".}

func lasx_xvfcmp_sueq_s*(a: M256, b: M256): M256i {.importc: "__lasx_xvfcmp_sueq_s".}

func lasx_xvfcmp_sule_d*(a: M256d, b: M256d): M256i {.importc: "__lasx_xvfcmp_sule_d".}

func lasx_xvfcmp_sule_s*(a: M256, b: M256): M256i {.importc: "__lasx_xvfcmp_sule_s".}

func lasx_xvfcmp_sult_d*(a: M256d, b: M256d): M256i {.importc: "__lasx_xvfcmp_sult_d".}

func lasx_xvfcmp_sult_s*(a: M256, b: M256): M256i {.importc: "__lasx_xvfcmp_sult_s".}

func lasx_xvfcmp_sun_d*(a: M256d, b: M256d): M256i {.importc: "__lasx_xvfcmp_sun_d".}

func lasx_xvfcmp_sune_d*(a: M256d, b: M256d): M256i {.importc: "__lasx_xvfcmp_sune_d".}

func lasx_xvfcmp_sune_s*(a: M256, b: M256): M256i {.importc: "__lasx_xvfcmp_sune_s".}

func lasx_xvfcmp_sun_s*(a: M256, b: M256): M256i {.importc: "__lasx_xvfcmp_sun_s".}

## [Macro Original]
## #define __lasx_xvpickve_d_f(/*__m256d*/ _1, /*ui2*/ _2) \
## ((__m256d)__builtin_lasx_xvpickve_d_f ((v4f64)(_1), (_2)))
func lasx_xvpickve_d_f*(a: M256d, b: int32): M128i {.importc: "__lasx_xvpickve_d_f".}

## [Macro Original]
## #define __lasx_xvpickve_w_f(/*__m256*/ _1, /*ui3*/ _2) \
## ((__m256)__builtin_lasx_xvpickve_w_f ((v8f32)(_1), (_2)))
func lasx_xvpickve_w_f*(a: M256, b: int32): M128i {.importc: "__lasx_xvpickve_w_f".}

## [Macro Original]
## #define __lasx_xvrepli_b(/*si10*/ _1) \
## ((__m256i)__builtin_lasx_xvrepli_b ((_1)))
## func lasx_xvrepli_b*(a: si10): M128i {.importc: "__lasx_xvrepli_b".}

## [Macro Original]
## #define __lasx_xvrepli_d(/*si10*/ _1) \
## ((__m256i)__builtin_lasx_xvrepli_d ((_1)))
## func lasx_xvrepli_d*(a: si10): M128i {.importc: "__lasx_xvrepli_d".}

## [Macro Original]
## #define __lasx_xvrepli_h(/*si10*/ _1) \
## ((__m256i)__builtin_lasx_xvrepli_h ((_1)))
## func lasx_xvrepli_h*(a: si10): M128i {.importc: "__lasx_xvrepli_h".}

## [Macro Original]
## #define __lasx_xvrepli_w(/*si10*/ _1) \
## ((__m256i)__builtin_lasx_xvrepli_w ((_1)))
## func lasx_xvrepli_w*(a: si10): M128i {.importc: "__lasx_xvrepli_w".}

func lasx_cast_128_s*(a: M128): M256 {.importc: "__lasx_cast_128_s".}

func lasx_cast_128_d*(a: M128d): M256d {.importc: "__lasx_cast_128_d".}

func lasx_cast_128*(a: M128i): M256i {.importc: "__lasx_cast_128".}

func lasx_concat_128_s*(a: M128, b: M128): M256 {.importc: "__lasx_concat_128_s".}

func lasx_concat_128_d*(a: M128d, b: M128d): M256d {.importc: "__lasx_concat_128_d".}

func lasx_concat_128*(a: M128i, b: M128i): M256i {.importc: "__lasx_concat_128".}

func lasx_extract_128_lo_s*(a: M256): M128 {.importc: "__lasx_extract_128_lo_s".}

func lasx_extract_128_hi_s*(a: M256): M128 {.importc: "__lasx_extract_128_hi_s".}

func lasx_extract_128_lo_d*(a: M256d): M128d {.importc: "__lasx_extract_128_lo_d".}

func lasx_extract_128_hi_d*(a: M256d): M128d {.importc: "__lasx_extract_128_hi_d".}

func lasx_extract_128_lo*(a: M256i): M128i {.importc: "__lasx_extract_128_lo".}

func lasx_extract_128_hi*(a: M256i): M128i {.importc: "__lasx_extract_128_hi".}

func lasx_insert_128_lo_s*(a: M256, b: M128): M256 {.importc: "__lasx_insert_128_lo_s".}

func lasx_insert_128_hi_s*(a: M256, b: M128): M256 {.importc: "__lasx_insert_128_hi_s".}

func lasx_insert_128_lo_d*(a: M256d, b: M128d): M256d {.importc: "__lasx_insert_128_lo_d".}

func lasx_insert_128_hi_d*(a: M256d, b: M128d): M256d {.importc: "__lasx_insert_128_hi_d".}

func lasx_insert_128_lo*(a: M256i, b: M128i): M256i {.importc: "__lasx_insert_128_lo".}

func lasx_insert_128_hi*(a: M256i, b: M128i): M256i {.importc: "__lasx_insert_128_hi".}
