type
  M128* {.importc: "__m128", header: "lsxintrin.h", bycopy.} = object
  M128i* {.importc: "__m128i", header: "lsxintrin.h", bycopy.} = object
  M128d* {.importc: "__m128d", header: "lsxintrin.h", bycopy.} = object

func lsx_vsll_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsll_b".}

func lsx_vsll_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsll_h".}

func lsx_vsll_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsll_w".}

func lsx_vsll_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsll_d".}

## [Macro Original]
## #define __lsx_vslli_b(/*__m128i*/ _1, /*ui3*/ _2) \
## ((__m128i)__builtin_lsx_vslli_b ((v16i8)(_1), (_2)))
func lsx_vslli_b*(a: M128i, b: int32): M128i {.importc: "__lsx_vslli_b".}

## [Macro Original]
## #define __lsx_vslli_h(/*__m128i*/ _1, /*ui4*/ _2) \
## ((__m128i)__builtin_lsx_vslli_h ((v8i16)(_1), (_2)))
func lsx_vslli_h*(a: M128i, b: int32): M128i {.importc: "__lsx_vslli_h".}

## [Macro Original]
## #define __lsx_vslli_w(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vslli_w ((v4i32)(_1), (_2)))
func lsx_vslli_w*(a: M128i, b: int32): M128i {.importc: "__lsx_vslli_w".}

## [Macro Original]
## #define __lsx_vslli_d(/*__m128i*/ _1, /*ui6*/ _2) \
## ((__m128i)__builtin_lsx_vslli_d ((v2i64)(_1), (_2)))
func lsx_vslli_d*(a: M128i, b: int32): M128i {.importc: "__lsx_vslli_d".}

func lsx_vsra_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsra_b".}

func lsx_vsra_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsra_h".}

func lsx_vsra_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsra_w".}

func lsx_vsra_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsra_d".}

## [Macro Original]
## #define __lsx_vsrai_b(/*__m128i*/ _1, /*ui3*/ _2) \
## ((__m128i)__builtin_lsx_vsrai_b ((v16i8)(_1), (_2)))
func lsx_vsrai_b*(a: M128i, b: int32): M128i {.importc: "__lsx_vsrai_b".}

## [Macro Original]
## #define __lsx_vsrai_h(/*__m128i*/ _1, /*ui4*/ _2) \
## ((__m128i)__builtin_lsx_vsrai_h ((v8i16)(_1), (_2)))
func lsx_vsrai_h*(a: M128i, b: int32): M128i {.importc: "__lsx_vsrai_h".}

## [Macro Original]
## #define __lsx_vsrai_w(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vsrai_w ((v4i32)(_1), (_2)))
func lsx_vsrai_w*(a: M128i, b: int32): M128i {.importc: "__lsx_vsrai_w".}

## [Macro Original]
## #define __lsx_vsrai_d(/*__m128i*/ _1, /*ui6*/ _2) \
## ((__m128i)__builtin_lsx_vsrai_d ((v2i64)(_1), (_2)))
func lsx_vsrai_d*(a: M128i, b: int32): M128i {.importc: "__lsx_vsrai_d".}

func lsx_vsrar_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsrar_b".}

func lsx_vsrar_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsrar_h".}

func lsx_vsrar_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsrar_w".}

func lsx_vsrar_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsrar_d".}

## [Macro Original]
## #define __lsx_vsrari_b(/*__m128i*/ _1, /*ui3*/ _2) \
## ((__m128i)__builtin_lsx_vsrari_b ((v16i8)(_1), (_2)))
func lsx_vsrari_b*(a: M128i, b: int32): M128i {.importc: "__lsx_vsrari_b".}

## [Macro Original]
## #define __lsx_vsrari_h(/*__m128i*/ _1, /*ui4*/ _2) \
## ((__m128i)__builtin_lsx_vsrari_h ((v8i16)(_1), (_2)))
func lsx_vsrari_h*(a: M128i, b: int32): M128i {.importc: "__lsx_vsrari_h".}

## [Macro Original]
## #define __lsx_vsrari_w(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vsrari_w ((v4i32)(_1), (_2)))
func lsx_vsrari_w*(a: M128i, b: int32): M128i {.importc: "__lsx_vsrari_w".}

## [Macro Original]
## #define __lsx_vsrari_d(/*__m128i*/ _1, /*ui6*/ _2) \
## ((__m128i)__builtin_lsx_vsrari_d ((v2i64)(_1), (_2)))
func lsx_vsrari_d*(a: M128i, b: int32): M128i {.importc: "__lsx_vsrari_d".}

func lsx_vsrl_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsrl_b".}

func lsx_vsrl_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsrl_h".}

func lsx_vsrl_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsrl_w".}

func lsx_vsrl_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsrl_d".}

## [Macro Original]
## #define __lsx_vsrli_b(/*__m128i*/ _1, /*ui3*/ _2) \
## ((__m128i)__builtin_lsx_vsrli_b ((v16i8)(_1), (_2)))
func lsx_vsrli_b*(a: M128i, b: int32): M128i {.importc: "__lsx_vsrli_b".}

## [Macro Original]
## #define __lsx_vsrli_h(/*__m128i*/ _1, /*ui4*/ _2) \
## ((__m128i)__builtin_lsx_vsrli_h ((v8i16)(_1), (_2)))
func lsx_vsrli_h*(a: M128i, b: int32): M128i {.importc: "__lsx_vsrli_h".}

## [Macro Original]
## #define __lsx_vsrli_w(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vsrli_w ((v4i32)(_1), (_2)))
func lsx_vsrli_w*(a: M128i, b: int32): M128i {.importc: "__lsx_vsrli_w".}

## [Macro Original]
## #define __lsx_vsrli_d(/*__m128i*/ _1, /*ui6*/ _2) \
## ((__m128i)__builtin_lsx_vsrli_d ((v2i64)(_1), (_2)))
func lsx_vsrli_d*(a: M128i, b: int32): M128i {.importc: "__lsx_vsrli_d".}

func lsx_vsrlr_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsrlr_b".}

func lsx_vsrlr_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsrlr_h".}

func lsx_vsrlr_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsrlr_w".}

func lsx_vsrlr_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsrlr_d".}

## [Macro Original]
## #define __lsx_vsrlri_b(/*__m128i*/ _1, /*ui3*/ _2) \
## ((__m128i)__builtin_lsx_vsrlri_b ((v16i8)(_1), (_2)))
func lsx_vsrlri_b*(a: M128i, b: int32): M128i {.importc: "__lsx_vsrlri_b".}

## [Macro Original]
## #define __lsx_vsrlri_h(/*__m128i*/ _1, /*ui4*/ _2) \
## ((__m128i)__builtin_lsx_vsrlri_h ((v8i16)(_1), (_2)))
func lsx_vsrlri_h*(a: M128i, b: int32): M128i {.importc: "__lsx_vsrlri_h".}

## [Macro Original]
## #define __lsx_vsrlri_w(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vsrlri_w ((v4i32)(_1), (_2)))
func lsx_vsrlri_w*(a: M128i, b: int32): M128i {.importc: "__lsx_vsrlri_w".}

## [Macro Original]
## #define __lsx_vsrlri_d(/*__m128i*/ _1, /*ui6*/ _2) \
## ((__m128i)__builtin_lsx_vsrlri_d ((v2i64)(_1), (_2)))
func lsx_vsrlri_d*(a: M128i, b: int32): M128i {.importc: "__lsx_vsrlri_d".}

func lsx_vbitclr_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vbitclr_b".}

func lsx_vbitclr_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vbitclr_h".}

func lsx_vbitclr_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vbitclr_w".}

func lsx_vbitclr_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vbitclr_d".}

## [Macro Original]
## #define __lsx_vbitclri_b(/*__m128i*/ _1, /*ui3*/ _2) \
## ((__m128i)__builtin_lsx_vbitclri_b ((v16u8)(_1), (_2)))
func lsx_vbitclri_b*(a: M128i, b: int32): M128i {.importc: "__lsx_vbitclri_b".}

## [Macro Original]
## #define __lsx_vbitclri_h(/*__m128i*/ _1, /*ui4*/ _2) \
## ((__m128i)__builtin_lsx_vbitclri_h ((v8u16)(_1), (_2)))
func lsx_vbitclri_h*(a: M128i, b: int32): M128i {.importc: "__lsx_vbitclri_h".}

## [Macro Original]
## #define __lsx_vbitclri_w(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vbitclri_w ((v4u32)(_1), (_2)))
func lsx_vbitclri_w*(a: M128i, b: int32): M128i {.importc: "__lsx_vbitclri_w".}

## [Macro Original]
## #define __lsx_vbitclri_d(/*__m128i*/ _1, /*ui6*/ _2) \
## ((__m128i)__builtin_lsx_vbitclri_d ((v2u64)(_1), (_2)))
func lsx_vbitclri_d*(a: M128i, b: int32): M128i {.importc: "__lsx_vbitclri_d".}

func lsx_vbitset_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vbitset_b".}

func lsx_vbitset_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vbitset_h".}

func lsx_vbitset_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vbitset_w".}

func lsx_vbitset_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vbitset_d".}

## [Macro Original]
## #define __lsx_vbitseti_b(/*__m128i*/ _1, /*ui3*/ _2) \
## ((__m128i)__builtin_lsx_vbitseti_b ((v16u8)(_1), (_2)))
func lsx_vbitseti_b*(a: M128i, b: int32): M128i {.importc: "__lsx_vbitseti_b".}

## [Macro Original]
## #define __lsx_vbitseti_h(/*__m128i*/ _1, /*ui4*/ _2) \
## ((__m128i)__builtin_lsx_vbitseti_h ((v8u16)(_1), (_2)))
func lsx_vbitseti_h*(a: M128i, b: int32): M128i {.importc: "__lsx_vbitseti_h".}

## [Macro Original]
## #define __lsx_vbitseti_w(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vbitseti_w ((v4u32)(_1), (_2)))
func lsx_vbitseti_w*(a: M128i, b: int32): M128i {.importc: "__lsx_vbitseti_w".}

## [Macro Original]
## #define __lsx_vbitseti_d(/*__m128i*/ _1, /*ui6*/ _2) \
## ((__m128i)__builtin_lsx_vbitseti_d ((v2u64)(_1), (_2)))
func lsx_vbitseti_d*(a: M128i, b: int32): M128i {.importc: "__lsx_vbitseti_d".}

func lsx_vbitrev_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vbitrev_b".}

func lsx_vbitrev_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vbitrev_h".}

func lsx_vbitrev_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vbitrev_w".}

func lsx_vbitrev_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vbitrev_d".}

## [Macro Original]
## #define __lsx_vbitrevi_b(/*__m128i*/ _1, /*ui3*/ _2) \
## ((__m128i)__builtin_lsx_vbitrevi_b ((v16u8)(_1), (_2)))
func lsx_vbitrevi_b*(a: M128i, b: int32): M128i {.importc: "__lsx_vbitrevi_b".}

## [Macro Original]
## #define __lsx_vbitrevi_h(/*__m128i*/ _1, /*ui4*/ _2) \
## ((__m128i)__builtin_lsx_vbitrevi_h ((v8u16)(_1), (_2)))
func lsx_vbitrevi_h*(a: M128i, b: int32): M128i {.importc: "__lsx_vbitrevi_h".}

## [Macro Original]
## #define __lsx_vbitrevi_w(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vbitrevi_w ((v4u32)(_1), (_2)))
func lsx_vbitrevi_w*(a: M128i, b: int32): M128i {.importc: "__lsx_vbitrevi_w".}

## [Macro Original]
## #define __lsx_vbitrevi_d(/*__m128i*/ _1, /*ui6*/ _2) \
## ((__m128i)__builtin_lsx_vbitrevi_d ((v2u64)(_1), (_2)))
func lsx_vbitrevi_d*(a: M128i, b: int32): M128i {.importc: "__lsx_vbitrevi_d".}

func lsx_vadd_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vadd_b".}

func lsx_vadd_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vadd_h".}

func lsx_vadd_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vadd_w".}

func lsx_vadd_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vadd_d".}

## [Macro Original]
## #define __lsx_vaddi_bu(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vaddi_bu ((v16i8)(_1), (_2)))
func lsx_vaddi_bu*(a: M128i, b: int32): M128i {.importc: "__lsx_vaddi_bu".}

## [Macro Original]
## #define __lsx_vaddi_hu(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vaddi_hu ((v8i16)(_1), (_2)))
func lsx_vaddi_hu*(a: M128i, b: int32): M128i {.importc: "__lsx_vaddi_hu".}

## [Macro Original]
## #define __lsx_vaddi_wu(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vaddi_wu ((v4i32)(_1), (_2)))
func lsx_vaddi_wu*(a: M128i, b: int32): M128i {.importc: "__lsx_vaddi_wu".}

## [Macro Original]
## #define __lsx_vaddi_du(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vaddi_du ((v2i64)(_1), (_2)))
func lsx_vaddi_du*(a: M128i, b: int32): M128i {.importc: "__lsx_vaddi_du".}

func lsx_vsub_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsub_b".}

func lsx_vsub_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsub_h".}

func lsx_vsub_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsub_w".}

func lsx_vsub_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsub_d".}

## [Macro Original]
## #define __lsx_vsubi_bu(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vsubi_bu ((v16i8)(_1), (_2)))
func lsx_vsubi_bu*(a: M128i, b: int32): M128i {.importc: "__lsx_vsubi_bu".}

## [Macro Original]
## #define __lsx_vsubi_hu(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vsubi_hu ((v8i16)(_1), (_2)))
func lsx_vsubi_hu*(a: M128i, b: int32): M128i {.importc: "__lsx_vsubi_hu".}

## [Macro Original]
## #define __lsx_vsubi_wu(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vsubi_wu ((v4i32)(_1), (_2)))
func lsx_vsubi_wu*(a: M128i, b: int32): M128i {.importc: "__lsx_vsubi_wu".}

## [Macro Original]
## #define __lsx_vsubi_du(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vsubi_du ((v2i64)(_1), (_2)))
func lsx_vsubi_du*(a: M128i, b: int32): M128i {.importc: "__lsx_vsubi_du".}

func lsx_vmax_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmax_b".}

func lsx_vmax_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmax_h".}

func lsx_vmax_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmax_w".}

func lsx_vmax_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmax_d".}

## [Macro Original]
## #define __lsx_vmaxi_b(/*__m128i*/ _1, /*si5*/ _2) \
## ((__m128i)__builtin_lsx_vmaxi_b ((v16i8)(_1), (_2)))
## func lsx_vmaxi_b*(a: M128i, b: si5): M128i {.importc: "__lsx_vmaxi_b".}

## [Macro Original]
## #define __lsx_vmaxi_h(/*__m128i*/ _1, /*si5*/ _2) \
## ((__m128i)__builtin_lsx_vmaxi_h ((v8i16)(_1), (_2)))
## func lsx_vmaxi_h*(a: M128i, b: si5): M128i {.importc: "__lsx_vmaxi_h".}

## [Macro Original]
## #define __lsx_vmaxi_w(/*__m128i*/ _1, /*si5*/ _2) \
## ((__m128i)__builtin_lsx_vmaxi_w ((v4i32)(_1), (_2)))
## func lsx_vmaxi_w*(a: M128i, b: si5): M128i {.importc: "__lsx_vmaxi_w".}

## [Macro Original]
## #define __lsx_vmaxi_d(/*__m128i*/ _1, /*si5*/ _2) \
## ((__m128i)__builtin_lsx_vmaxi_d ((v2i64)(_1), (_2)))
## func lsx_vmaxi_d*(a: M128i, b: si5): M128i {.importc: "__lsx_vmaxi_d".}

func lsx_vmax_bu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmax_bu".}

func lsx_vmax_hu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmax_hu".}

func lsx_vmax_wu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmax_wu".}

func lsx_vmax_du*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmax_du".}

## [Macro Original]
## #define __lsx_vmaxi_bu(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vmaxi_bu ((v16u8)(_1), (_2)))
func lsx_vmaxi_bu*(a: M128i, b: int32): M128i {.importc: "__lsx_vmaxi_bu".}

## [Macro Original]
## #define __lsx_vmaxi_hu(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vmaxi_hu ((v8u16)(_1), (_2)))
func lsx_vmaxi_hu*(a: M128i, b: int32): M128i {.importc: "__lsx_vmaxi_hu".}

## [Macro Original]
## #define __lsx_vmaxi_wu(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vmaxi_wu ((v4u32)(_1), (_2)))
func lsx_vmaxi_wu*(a: M128i, b: int32): M128i {.importc: "__lsx_vmaxi_wu".}

## [Macro Original]
## #define __lsx_vmaxi_du(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vmaxi_du ((v2u64)(_1), (_2)))
func lsx_vmaxi_du*(a: M128i, b: int32): M128i {.importc: "__lsx_vmaxi_du".}

func lsx_vmin_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmin_b".}

func lsx_vmin_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmin_h".}

func lsx_vmin_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmin_w".}

func lsx_vmin_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmin_d".}

## [Macro Original]
## #define __lsx_vmini_b(/*__m128i*/ _1, /*si5*/ _2) \
## ((__m128i)__builtin_lsx_vmini_b ((v16i8)(_1), (_2)))
## func lsx_vmini_b*(a: M128i, b: si5): M128i {.importc: "__lsx_vmini_b".}

## [Macro Original]
## #define __lsx_vmini_h(/*__m128i*/ _1, /*si5*/ _2) \
## ((__m128i)__builtin_lsx_vmini_h ((v8i16)(_1), (_2)))
## func lsx_vmini_h*(a: M128i, b: si5): M128i {.importc: "__lsx_vmini_h".}

## [Macro Original]
## #define __lsx_vmini_w(/*__m128i*/ _1, /*si5*/ _2) \
## ((__m128i)__builtin_lsx_vmini_w ((v4i32)(_1), (_2)))
## func lsx_vmini_w*(a: M128i, b: si5): M128i {.importc: "__lsx_vmini_w".}

## [Macro Original]
## #define __lsx_vmini_d(/*__m128i*/ _1, /*si5*/ _2) \
## ((__m128i)__builtin_lsx_vmini_d ((v2i64)(_1), (_2)))
## func lsx_vmini_d*(a: M128i, b: si5): M128i {.importc: "__lsx_vmini_d".}

func lsx_vmin_bu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmin_bu".}

func lsx_vmin_hu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmin_hu".}

func lsx_vmin_wu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmin_wu".}

func lsx_vmin_du*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmin_du".}

## [Macro Original]
## #define __lsx_vmini_bu(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vmini_bu ((v16u8)(_1), (_2)))
func lsx_vmini_bu*(a: M128i, b: int32): M128i {.importc: "__lsx_vmini_bu".}

## [Macro Original]
## #define __lsx_vmini_hu(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vmini_hu ((v8u16)(_1), (_2)))
func lsx_vmini_hu*(a: M128i, b: int32): M128i {.importc: "__lsx_vmini_hu".}

## [Macro Original]
## #define __lsx_vmini_wu(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vmini_wu ((v4u32)(_1), (_2)))
func lsx_vmini_wu*(a: M128i, b: int32): M128i {.importc: "__lsx_vmini_wu".}

## [Macro Original]
## #define __lsx_vmini_du(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vmini_du ((v2u64)(_1), (_2)))
func lsx_vmini_du*(a: M128i, b: int32): M128i {.importc: "__lsx_vmini_du".}

func lsx_vseq_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vseq_b".}

func lsx_vseq_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vseq_h".}

func lsx_vseq_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vseq_w".}

func lsx_vseq_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vseq_d".}

## [Macro Original]
## #define __lsx_vseqi_b(/*__m128i*/ _1, /*si5*/ _2) \
## ((__m128i)__builtin_lsx_vseqi_b ((v16i8)(_1), (_2)))
## func lsx_vseqi_b*(a: M128i, b: si5): M128i {.importc: "__lsx_vseqi_b".}

## [Macro Original]
## #define __lsx_vseqi_h(/*__m128i*/ _1, /*si5*/ _2) \
## ((__m128i)__builtin_lsx_vseqi_h ((v8i16)(_1), (_2)))
## func lsx_vseqi_h*(a: M128i, b: si5): M128i {.importc: "__lsx_vseqi_h".}

## [Macro Original]
## #define __lsx_vseqi_w(/*__m128i*/ _1, /*si5*/ _2) \
## ((__m128i)__builtin_lsx_vseqi_w ((v4i32)(_1), (_2)))
## func lsx_vseqi_w*(a: M128i, b: si5): M128i {.importc: "__lsx_vseqi_w".}

## [Macro Original]
## #define __lsx_vseqi_d(/*__m128i*/ _1, /*si5*/ _2) \
## ((__m128i)__builtin_lsx_vseqi_d ((v2i64)(_1), (_2)))
## func lsx_vseqi_d*(a: M128i, b: si5): M128i {.importc: "__lsx_vseqi_d".}

## [Macro Original]
## #define __lsx_vslti_b(/*__m128i*/ _1, /*si5*/ _2) \
## ((__m128i)__builtin_lsx_vslti_b ((v16i8)(_1), (_2)))
## func lsx_vslti_b*(a: M128i, b: si5): M128i {.importc: "__lsx_vslti_b".}

func lsx_vslt_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vslt_b".}

func lsx_vslt_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vslt_h".}

func lsx_vslt_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vslt_w".}

func lsx_vslt_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vslt_d".}

## [Macro Original]
## #define __lsx_vslti_h(/*__m128i*/ _1, /*si5*/ _2) \
## ((__m128i)__builtin_lsx_vslti_h ((v8i16)(_1), (_2)))
## func lsx_vslti_h*(a: M128i, b: si5): M128i {.importc: "__lsx_vslti_h".}

## [Macro Original]
## #define __lsx_vslti_w(/*__m128i*/ _1, /*si5*/ _2) \
## ((__m128i)__builtin_lsx_vslti_w ((v4i32)(_1), (_2)))
## func lsx_vslti_w*(a: M128i, b: si5): M128i {.importc: "__lsx_vslti_w".}

## [Macro Original]
## #define __lsx_vslti_d(/*__m128i*/ _1, /*si5*/ _2) \
## ((__m128i)__builtin_lsx_vslti_d ((v2i64)(_1), (_2)))
## func lsx_vslti_d*(a: M128i, b: si5): M128i {.importc: "__lsx_vslti_d".}

func lsx_vslt_bu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vslt_bu".}

func lsx_vslt_hu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vslt_hu".}

func lsx_vslt_wu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vslt_wu".}

func lsx_vslt_du*(a: M128i, b: M128i): M128i {.importc: "__lsx_vslt_du".}

## [Macro Original]
## #define __lsx_vslti_bu(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vslti_bu ((v16u8)(_1), (_2)))
func lsx_vslti_bu*(a: M128i, b: int32): M128i {.importc: "__lsx_vslti_bu".}

## [Macro Original]
## #define __lsx_vslti_hu(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vslti_hu ((v8u16)(_1), (_2)))
func lsx_vslti_hu*(a: M128i, b: int32): M128i {.importc: "__lsx_vslti_hu".}

## [Macro Original]
## #define __lsx_vslti_wu(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vslti_wu ((v4u32)(_1), (_2)))
func lsx_vslti_wu*(a: M128i, b: int32): M128i {.importc: "__lsx_vslti_wu".}

## [Macro Original]
## #define __lsx_vslti_du(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vslti_du ((v2u64)(_1), (_2)))
func lsx_vslti_du*(a: M128i, b: int32): M128i {.importc: "__lsx_vslti_du".}

func lsx_vsle_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsle_b".}

func lsx_vsle_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsle_h".}

func lsx_vsle_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsle_w".}

func lsx_vsle_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsle_d".}

## [Macro Original]
## #define __lsx_vslei_b(/*__m128i*/ _1, /*si5*/ _2) \
## ((__m128i)__builtin_lsx_vslei_b ((v16i8)(_1), (_2)))
## func lsx_vslei_b*(a: M128i, b: si5): M128i {.importc: "__lsx_vslei_b".}

## [Macro Original]
## #define __lsx_vslei_h(/*__m128i*/ _1, /*si5*/ _2) \
## ((__m128i)__builtin_lsx_vslei_h ((v8i16)(_1), (_2)))
## func lsx_vslei_h*(a: M128i, b: si5): M128i {.importc: "__lsx_vslei_h".}

## [Macro Original]
## #define __lsx_vslei_w(/*__m128i*/ _1, /*si5*/ _2) \
## ((__m128i)__builtin_lsx_vslei_w ((v4i32)(_1), (_2)))
## func lsx_vslei_w*(a: M128i, b: si5): M128i {.importc: "__lsx_vslei_w".}

## [Macro Original]
## #define __lsx_vslei_d(/*__m128i*/ _1, /*si5*/ _2) \
## ((__m128i)__builtin_lsx_vslei_d ((v2i64)(_1), (_2)))
## func lsx_vslei_d*(a: M128i, b: si5): M128i {.importc: "__lsx_vslei_d".}

func lsx_vsle_bu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsle_bu".}

func lsx_vsle_hu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsle_hu".}

func lsx_vsle_wu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsle_wu".}

func lsx_vsle_du*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsle_du".}

## [Macro Original]
## #define __lsx_vslei_bu(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vslei_bu ((v16u8)(_1), (_2)))
func lsx_vslei_bu*(a: M128i, b: int32): M128i {.importc: "__lsx_vslei_bu".}

## [Macro Original]
## #define __lsx_vslei_hu(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vslei_hu ((v8u16)(_1), (_2)))
func lsx_vslei_hu*(a: M128i, b: int32): M128i {.importc: "__lsx_vslei_hu".}

## [Macro Original]
## #define __lsx_vslei_wu(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vslei_wu ((v4u32)(_1), (_2)))
func lsx_vslei_wu*(a: M128i, b: int32): M128i {.importc: "__lsx_vslei_wu".}

## [Macro Original]
## #define __lsx_vslei_du(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vslei_du ((v2u64)(_1), (_2)))
func lsx_vslei_du*(a: M128i, b: int32): M128i {.importc: "__lsx_vslei_du".}

## [Macro Original]
## #define __lsx_vsat_b(/*__m128i*/ _1, /*ui3*/ _2) \
## ((__m128i)__builtin_lsx_vsat_b ((v16i8)(_1), (_2)))
func lsx_vsat_b*(a: M128i, b: int32): M128i {.importc: "__lsx_vsat_b".}

## [Macro Original]
## #define __lsx_vsat_h(/*__m128i*/ _1, /*ui4*/ _2) \
## ((__m128i)__builtin_lsx_vsat_h ((v8i16)(_1), (_2)))
func lsx_vsat_h*(a: M128i, b: int32): M128i {.importc: "__lsx_vsat_h".}

## [Macro Original]
## #define __lsx_vsat_w(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vsat_w ((v4i32)(_1), (_2)))
func lsx_vsat_w*(a: M128i, b: int32): M128i {.importc: "__lsx_vsat_w".}

## [Macro Original]
## #define __lsx_vsat_d(/*__m128i*/ _1, /*ui6*/ _2) \
## ((__m128i)__builtin_lsx_vsat_d ((v2i64)(_1), (_2)))
func lsx_vsat_d*(a: M128i, b: int32): M128i {.importc: "__lsx_vsat_d".}

## [Macro Original]
## #define __lsx_vsat_bu(/*__m128i*/ _1, /*ui3*/ _2) \
## ((__m128i)__builtin_lsx_vsat_bu ((v16u8)(_1), (_2)))
func lsx_vsat_bu*(a: M128i, b: int32): M128i {.importc: "__lsx_vsat_bu".}

## [Macro Original]
## #define __lsx_vsat_hu(/*__m128i*/ _1, /*ui4*/ _2) \
## ((__m128i)__builtin_lsx_vsat_hu ((v8u16)(_1), (_2)))
func lsx_vsat_hu*(a: M128i, b: int32): M128i {.importc: "__lsx_vsat_hu".}

## [Macro Original]
## #define __lsx_vsat_wu(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vsat_wu ((v4u32)(_1), (_2)))
func lsx_vsat_wu*(a: M128i, b: int32): M128i {.importc: "__lsx_vsat_wu".}

## [Macro Original]
## #define __lsx_vsat_du(/*__m128i*/ _1, /*ui6*/ _2) \
## ((__m128i)__builtin_lsx_vsat_du ((v2u64)(_1), (_2)))
func lsx_vsat_du*(a: M128i, b: int32): M128i {.importc: "__lsx_vsat_du".}

func lsx_vadda_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vadda_b".}

func lsx_vadda_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vadda_h".}

func lsx_vadda_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vadda_w".}

func lsx_vadda_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vadda_d".}

func lsx_vsadd_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsadd_b".}

func lsx_vsadd_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsadd_h".}

func lsx_vsadd_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsadd_w".}

func lsx_vsadd_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsadd_d".}

func lsx_vsadd_bu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsadd_bu".}

func lsx_vsadd_hu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsadd_hu".}

func lsx_vsadd_wu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsadd_wu".}

func lsx_vsadd_du*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsadd_du".}

func lsx_vavg_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vavg_b".}

func lsx_vavg_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vavg_h".}

func lsx_vavg_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vavg_w".}

func lsx_vavg_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vavg_d".}

func lsx_vavg_bu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vavg_bu".}

func lsx_vavg_hu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vavg_hu".}

func lsx_vavg_wu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vavg_wu".}

func lsx_vavg_du*(a: M128i, b: M128i): M128i {.importc: "__lsx_vavg_du".}

func lsx_vavgr_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vavgr_b".}

func lsx_vavgr_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vavgr_h".}

func lsx_vavgr_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vavgr_w".}

func lsx_vavgr_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vavgr_d".}

func lsx_vavgr_bu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vavgr_bu".}

func lsx_vavgr_hu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vavgr_hu".}

func lsx_vavgr_wu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vavgr_wu".}

func lsx_vavgr_du*(a: M128i, b: M128i): M128i {.importc: "__lsx_vavgr_du".}

func lsx_vssub_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vssub_b".}

func lsx_vssub_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vssub_h".}

func lsx_vssub_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vssub_w".}

func lsx_vssub_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vssub_d".}

func lsx_vssub_bu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vssub_bu".}

func lsx_vssub_hu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vssub_hu".}

func lsx_vssub_wu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vssub_wu".}

func lsx_vssub_du*(a: M128i, b: M128i): M128i {.importc: "__lsx_vssub_du".}

func lsx_vabsd_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vabsd_b".}

func lsx_vabsd_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vabsd_h".}

func lsx_vabsd_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vabsd_w".}

func lsx_vabsd_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vabsd_d".}

func lsx_vabsd_bu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vabsd_bu".}

func lsx_vabsd_hu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vabsd_hu".}

func lsx_vabsd_wu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vabsd_wu".}

func lsx_vabsd_du*(a: M128i, b: M128i): M128i {.importc: "__lsx_vabsd_du".}

func lsx_vmul_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmul_b".}

func lsx_vmul_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmul_h".}

func lsx_vmul_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmul_w".}

func lsx_vmul_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmul_d".}

func lsx_vmadd_b*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vmadd_b".}

func lsx_vmadd_h*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vmadd_h".}

func lsx_vmadd_w*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vmadd_w".}

func lsx_vmadd_d*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vmadd_d".}

func lsx_vmsub_b*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vmsub_b".}

func lsx_vmsub_h*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vmsub_h".}

func lsx_vmsub_w*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vmsub_w".}

func lsx_vmsub_d*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vmsub_d".}

func lsx_vdiv_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vdiv_b".}

func lsx_vdiv_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vdiv_h".}

func lsx_vdiv_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vdiv_w".}

func lsx_vdiv_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vdiv_d".}

func lsx_vdiv_bu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vdiv_bu".}

func lsx_vdiv_hu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vdiv_hu".}

func lsx_vdiv_wu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vdiv_wu".}

func lsx_vdiv_du*(a: M128i, b: M128i): M128i {.importc: "__lsx_vdiv_du".}

func lsx_vhaddw_h_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vhaddw_h_b".}

func lsx_vhaddw_w_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vhaddw_w_h".}

func lsx_vhaddw_d_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vhaddw_d_w".}

func lsx_vhaddw_hu_bu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vhaddw_hu_bu".}

func lsx_vhaddw_wu_hu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vhaddw_wu_hu".}

func lsx_vhaddw_du_wu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vhaddw_du_wu".}

func lsx_vhsubw_h_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vhsubw_h_b".}

func lsx_vhsubw_w_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vhsubw_w_h".}

func lsx_vhsubw_d_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vhsubw_d_w".}

func lsx_vhsubw_hu_bu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vhsubw_hu_bu".}

func lsx_vhsubw_wu_hu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vhsubw_wu_hu".}

func lsx_vhsubw_du_wu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vhsubw_du_wu".}

func lsx_vmod_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmod_b".}

func lsx_vmod_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmod_h".}

func lsx_vmod_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmod_w".}

func lsx_vmod_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmod_d".}

func lsx_vmod_bu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmod_bu".}

func lsx_vmod_hu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmod_hu".}

func lsx_vmod_wu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmod_wu".}

func lsx_vmod_du*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmod_du".}

func lsx_vreplve_b*(a: M128i, b: int32): M128i {.importc: "__lsx_vreplve_b".}

func lsx_vreplve_h*(a: M128i, b: int32): M128i {.importc: "__lsx_vreplve_h".}

func lsx_vreplve_w*(a: M128i, b: int32): M128i {.importc: "__lsx_vreplve_w".}

func lsx_vreplve_d*(a: M128i, b: int32): M128i {.importc: "__lsx_vreplve_d".}

## [Macro Original]
## #define __lsx_vreplvei_b(/*__m128i*/ _1, /*ui4*/ _2) \
## ((__m128i)__builtin_lsx_vreplvei_b ((v16i8)(_1), (_2)))
func lsx_vreplvei_b*(a: M128i, b: int32): M128i {.importc: "__lsx_vreplvei_b".}

## [Macro Original]
## #define __lsx_vreplvei_h(/*__m128i*/ _1, /*ui3*/ _2) \
## ((__m128i)__builtin_lsx_vreplvei_h ((v8i16)(_1), (_2)))
func lsx_vreplvei_h*(a: M128i, b: int32): M128i {.importc: "__lsx_vreplvei_h".}

## [Macro Original]
## #define __lsx_vreplvei_w(/*__m128i*/ _1, /*ui2*/ _2) \
## ((__m128i)__builtin_lsx_vreplvei_w ((v4i32)(_1), (_2)))
func lsx_vreplvei_w*(a: M128i, b: int32): M128i {.importc: "__lsx_vreplvei_w".}

## [Macro Original]
## #define __lsx_vreplvei_d(/*__m128i*/ _1, /*ui1*/ _2) \
## ((__m128i)__builtin_lsx_vreplvei_d ((v2i64)(_1), (_2)))
func lsx_vreplvei_d*(a: M128i, b: int32): M128i {.importc: "__lsx_vreplvei_d".}

func lsx_vpickev_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vpickev_b".}

func lsx_vpickev_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vpickev_h".}

func lsx_vpickev_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vpickev_w".}

func lsx_vpickev_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vpickev_d".}

func lsx_vpickod_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vpickod_b".}

func lsx_vpickod_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vpickod_h".}

func lsx_vpickod_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vpickod_w".}

func lsx_vpickod_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vpickod_d".}

func lsx_vilvh_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vilvh_b".}

func lsx_vilvh_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vilvh_h".}

func lsx_vilvh_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vilvh_w".}

func lsx_vilvh_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vilvh_d".}

func lsx_vilvl_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vilvl_b".}

func lsx_vilvl_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vilvl_h".}

func lsx_vilvl_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vilvl_w".}

func lsx_vilvl_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vilvl_d".}

func lsx_vpackev_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vpackev_b".}

func lsx_vpackev_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vpackev_h".}

func lsx_vpackev_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vpackev_w".}

func lsx_vpackev_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vpackev_d".}

func lsx_vpackod_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vpackod_b".}

func lsx_vpackod_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vpackod_h".}

func lsx_vpackod_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vpackod_w".}

func lsx_vpackod_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vpackod_d".}

func lsx_vshuf_h*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vshuf_h".}

func lsx_vshuf_w*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vshuf_w".}

func lsx_vshuf_d*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vshuf_d".}

func lsx_vand_v*(a: M128i, b: M128i): M128i {.importc: "__lsx_vand_v".}

## [Macro Original]
## #define __lsx_vandi_b(/*__m128i*/ _1, /*ui8*/ _2) \
## ((__m128i)__builtin_lsx_vandi_b ((v16u8)(_1), (_2)))
func lsx_vandi_b*(a: M128i, b: int32): M128i {.importc: "__lsx_vandi_b".}

func lsx_vor_v*(a: M128i, b: M128i): M128i {.importc: "__lsx_vor_v".}

## [Macro Original]
## #define __lsx_vori_b(/*__m128i*/ _1, /*ui8*/ _2) \
## ((__m128i)__builtin_lsx_vori_b ((v16u8)(_1), (_2)))
func lsx_vori_b*(a: M128i, b: int32): M128i {.importc: "__lsx_vori_b".}

func lsx_vnor_v*(a: M128i, b: M128i): M128i {.importc: "__lsx_vnor_v".}

## [Macro Original]
## #define __lsx_vnori_b(/*__m128i*/ _1, /*ui8*/ _2) \
## ((__m128i)__builtin_lsx_vnori_b ((v16u8)(_1), (_2)))
func lsx_vnori_b*(a: M128i, b: int32): M128i {.importc: "__lsx_vnori_b".}

func lsx_vxor_v*(a: M128i, b: M128i): M128i {.importc: "__lsx_vxor_v".}

## [Macro Original]
## #define __lsx_vxori_b(/*__m128i*/ _1, /*ui8*/ _2) \
## ((__m128i)__builtin_lsx_vxori_b ((v16u8)(_1), (_2)))
func lsx_vxori_b*(a: M128i, b: int32): M128i {.importc: "__lsx_vxori_b".}

func lsx_vbitsel_v*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vbitsel_v".}

## [Macro Original]
## #define __lsx_vbitseli_b(/*__m128i*/ _1, /*__m128i*/ _2, /*ui8*/ _3) \
## ((__m128i)__builtin_lsx_vbitseli_b ((v16u8)(_1), (v16u8)(_2), (_3)))
func lsx_vbitseli_b*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vbitseli_b".}

## [Macro Original]
## #define __lsx_vshuf4i_b(/*__m128i*/ _1, /*ui8*/ _2) \
## ((__m128i)__builtin_lsx_vshuf4i_b ((v16i8)(_1), (_2)))
func lsx_vshuf4i_b*(a: M128i, b: int32): M128i {.importc: "__lsx_vshuf4i_b".}

## [Macro Original]
## #define __lsx_vshuf4i_h(/*__m128i*/ _1, /*ui8*/ _2) \
## ((__m128i)__builtin_lsx_vshuf4i_h ((v8i16)(_1), (_2)))
func lsx_vshuf4i_h*(a: M128i, b: int32): M128i {.importc: "__lsx_vshuf4i_h".}

## [Macro Original]
## #define __lsx_vshuf4i_w(/*__m128i*/ _1, /*ui8*/ _2) \
## ((__m128i)__builtin_lsx_vshuf4i_w ((v4i32)(_1), (_2)))
func lsx_vshuf4i_w*(a: M128i, b: int32): M128i {.importc: "__lsx_vshuf4i_w".}

func lsx_vreplgr2vr_b*(a: int32): M128i {.importc: "__lsx_vreplgr2vr_b".}

func lsx_vreplgr2vr_h*(a: int32): M128i {.importc: "__lsx_vreplgr2vr_h".}

func lsx_vreplgr2vr_w*(a: int32): M128i {.importc: "__lsx_vreplgr2vr_w".}

func lsx_vreplgr2vr_d*(a: int64): M128i {.importc: "__lsx_vreplgr2vr_d".}

func lsx_vpcnt_b*(a: M128i): M128i {.importc: "__lsx_vpcnt_b".}

func lsx_vpcnt_h*(a: M128i): M128i {.importc: "__lsx_vpcnt_h".}

func lsx_vpcnt_w*(a: M128i): M128i {.importc: "__lsx_vpcnt_w".}

func lsx_vpcnt_d*(a: M128i): M128i {.importc: "__lsx_vpcnt_d".}

func lsx_vclo_b*(a: M128i): M128i {.importc: "__lsx_vclo_b".}

func lsx_vclo_h*(a: M128i): M128i {.importc: "__lsx_vclo_h".}

func lsx_vclo_w*(a: M128i): M128i {.importc: "__lsx_vclo_w".}

func lsx_vclo_d*(a: M128i): M128i {.importc: "__lsx_vclo_d".}

func lsx_vclz_b*(a: M128i): M128i {.importc: "__lsx_vclz_b".}

func lsx_vclz_h*(a: M128i): M128i {.importc: "__lsx_vclz_h".}

func lsx_vclz_w*(a: M128i): M128i {.importc: "__lsx_vclz_w".}

func lsx_vclz_d*(a: M128i): M128i {.importc: "__lsx_vclz_d".}

## [Macro Original]
## #define __lsx_vpickve2gr_b(/*__m128i*/ _1, /*ui4*/ _2) \
## ((int)__builtin_lsx_vpickve2gr_b ((v16i8)(_1), (_2)))
func lsx_vpickve2gr_b*(a: M128i, b: int32): M128i {.importc: "__lsx_vpickve2gr_b".}

## [Macro Original]
## #define __lsx_vpickve2gr_h(/*__m128i*/ _1, /*ui3*/ _2) \
## ((int)__builtin_lsx_vpickve2gr_h ((v8i16)(_1), (_2)))
func lsx_vpickve2gr_h*(a: M128i, b: int32): M128i {.importc: "__lsx_vpickve2gr_h".}

## [Macro Original]
## #define __lsx_vpickve2gr_w(/*__m128i*/ _1, /*ui2*/ _2) \
## ((int)__builtin_lsx_vpickve2gr_w ((v4i32)(_1), (_2)))
func lsx_vpickve2gr_w*(a: M128i, b: int32): M128i {.importc: "__lsx_vpickve2gr_w".}

## [Macro Original]
## #define __lsx_vpickve2gr_d(/*__m128i*/ _1, /*ui1*/ _2) \
## ((long int)__builtin_lsx_vpickve2gr_d ((v2i64)(_1), (_2)))
func lsx_vpickve2gr_d*(a: M128i, b: int32): M128i {.importc: "__lsx_vpickve2gr_d".}

## [Macro Original]
## #define __lsx_vpickve2gr_bu(/*__m128i*/ _1, /*ui4*/ _2) \
## ((unsigned int)__builtin_lsx_vpickve2gr_bu ((v16i8)(_1), (_2)))
func lsx_vpickve2gr_bu*(a: M128i, b: int32): M128i {.importc: "__lsx_vpickve2gr_bu".}

## [Macro Original]
## #define __lsx_vpickve2gr_hu(/*__m128i*/ _1, /*ui3*/ _2) \
## ((unsigned int)__builtin_lsx_vpickve2gr_hu ((v8i16)(_1), (_2)))
func lsx_vpickve2gr_hu*(a: M128i, b: int32): M128i {.importc: "__lsx_vpickve2gr_hu".}

## [Macro Original]
## #define __lsx_vpickve2gr_wu(/*__m128i*/ _1, /*ui2*/ _2) \
## ((unsigned int)__builtin_lsx_vpickve2gr_wu ((v4i32)(_1), (_2)))
func lsx_vpickve2gr_wu*(a: M128i, b: int32): M128i {.importc: "__lsx_vpickve2gr_wu".}

## [Macro Original]
## #define __lsx_vpickve2gr_du(/*__m128i*/ _1, /*ui1*/ _2) \
## ((unsigned long int)__builtin_lsx_vpickve2gr_du ((v2i64)(_1), (_2)))
func lsx_vpickve2gr_du*(a: M128i, b: int32): M128i {.importc: "__lsx_vpickve2gr_du".}

## [Macro Original]
## #define __lsx_vinsgr2vr_b(/*__m128i*/ _1, /*int*/ _2, /*ui4*/ _3) \
## ((__m128i)__builtin_lsx_vinsgr2vr_b ((v16i8)(_1), (int)(_2), (_3)))
func lsx_vinsgr2vr_b*(a: M128i, b: int32, c: int32): M128i {.importc: "__lsx_vinsgr2vr_b".}

## [Macro Original]
## #define __lsx_vinsgr2vr_h(/*__m128i*/ _1, /*int*/ _2, /*ui3*/ _3) \
## ((__m128i)__builtin_lsx_vinsgr2vr_h ((v8i16)(_1), (int)(_2), (_3)))
func lsx_vinsgr2vr_h*(a: M128i, b: int32, c: int32): M128i {.importc: "__lsx_vinsgr2vr_h".}

## [Macro Original]
## #define __lsx_vinsgr2vr_w(/*__m128i*/ _1, /*int*/ _2, /*ui2*/ _3) \
## ((__m128i)__builtin_lsx_vinsgr2vr_w ((v4i32)(_1), (int)(_2), (_3)))
func lsx_vinsgr2vr_w*(a: M128i, b: int32, c: int32): M128i {.importc: "__lsx_vinsgr2vr_w".}

## [Macro Original]
## #define __lsx_vinsgr2vr_d(/*__m128i*/ _1, /*long int*/ _2, /*ui1*/ _3) \
## ((__m128i)__builtin_lsx_vinsgr2vr_d ((v2i64)(_1), (long int)(_2), (_3)))
func lsx_vinsgr2vr_d*(a: M128i, b: int64, c: int32): M128i {.importc: "__lsx_vinsgr2vr_d".}

func lsx_vfadd_s*(a: M128, b: M128): M128 {.importc: "__lsx_vfadd_s".}

func lsx_vfadd_d*(a: M128d, b: M128d): M128d {.importc: "__lsx_vfadd_d".}

func lsx_vfsub_s*(a: M128, b: M128): M128 {.importc: "__lsx_vfsub_s".}

func lsx_vfsub_d*(a: M128d, b: M128d): M128d {.importc: "__lsx_vfsub_d".}

func lsx_vfmul_s*(a: M128, b: M128): M128 {.importc: "__lsx_vfmul_s".}

func lsx_vfmul_d*(a: M128d, b: M128d): M128d {.importc: "__lsx_vfmul_d".}

func lsx_vfdiv_s*(a: M128, b: M128): M128 {.importc: "__lsx_vfdiv_s".}

func lsx_vfdiv_d*(a: M128d, b: M128d): M128d {.importc: "__lsx_vfdiv_d".}

func lsx_vfcvt_h_s*(a: M128, b: M128): M128i {.importc: "__lsx_vfcvt_h_s".}

func lsx_vfcvt_s_d*(a: M128d, b: M128d): M128 {.importc: "__lsx_vfcvt_s_d".}

func lsx_vfmin_s*(a: M128, b: M128): M128 {.importc: "__lsx_vfmin_s".}

func lsx_vfmin_d*(a: M128d, b: M128d): M128d {.importc: "__lsx_vfmin_d".}

func lsx_vfmina_s*(a: M128, b: M128): M128 {.importc: "__lsx_vfmina_s".}

func lsx_vfmina_d*(a: M128d, b: M128d): M128d {.importc: "__lsx_vfmina_d".}

func lsx_vfmax_s*(a: M128, b: M128): M128 {.importc: "__lsx_vfmax_s".}

func lsx_vfmax_d*(a: M128d, b: M128d): M128d {.importc: "__lsx_vfmax_d".}

func lsx_vfmaxa_s*(a: M128, b: M128): M128 {.importc: "__lsx_vfmaxa_s".}

func lsx_vfmaxa_d*(a: M128d, b: M128d): M128d {.importc: "__lsx_vfmaxa_d".}

func lsx_vfclass_s*(a: M128): M128i {.importc: "__lsx_vfclass_s".}

func lsx_vfclass_d*(a: M128d): M128i {.importc: "__lsx_vfclass_d".}

func lsx_vfsqrt_s*(a: M128): M128 {.importc: "__lsx_vfsqrt_s".}

func lsx_vfsqrt_d*(a: M128d): M128d {.importc: "__lsx_vfsqrt_d".}

func lsx_vfrecip_s*(a: M128): M128 {.importc: "__lsx_vfrecip_s".}

func lsx_vfrecip_d*(a: M128d): M128d {.importc: "__lsx_vfrecip_d".}

func lsx_vfrecipe_s*(a: M128): M128 {.importc: "__lsx_vfrecipe_s".}

func lsx_vfrecipe_d*(a: M128d): M128d {.importc: "__lsx_vfrecipe_d".}

func lsx_vfrsqrte_s*(a: M128): M128 {.importc: "__lsx_vfrsqrte_s".}

func lsx_vfrsqrte_d*(a: M128d): M128d {.importc: "__lsx_vfrsqrte_d".}

func lsx_vfrint_s*(a: M128): M128 {.importc: "__lsx_vfrint_s".}

func lsx_vfrint_d*(a: M128d): M128d {.importc: "__lsx_vfrint_d".}

func lsx_vfrsqrt_s*(a: M128): M128 {.importc: "__lsx_vfrsqrt_s".}

func lsx_vfrsqrt_d*(a: M128d): M128d {.importc: "__lsx_vfrsqrt_d".}

func lsx_vflogb_s*(a: M128): M128 {.importc: "__lsx_vflogb_s".}

func lsx_vflogb_d*(a: M128d): M128d {.importc: "__lsx_vflogb_d".}

func lsx_vfcvth_s_h*(a: M128i): M128 {.importc: "__lsx_vfcvth_s_h".}

func lsx_vfcvth_d_s*(a: M128): M128d {.importc: "__lsx_vfcvth_d_s".}

func lsx_vfcvtl_s_h*(a: M128i): M128 {.importc: "__lsx_vfcvtl_s_h".}

func lsx_vfcvtl_d_s*(a: M128): M128d {.importc: "__lsx_vfcvtl_d_s".}

func lsx_vftint_w_s*(a: M128): M128i {.importc: "__lsx_vftint_w_s".}

func lsx_vftint_l_d*(a: M128d): M128i {.importc: "__lsx_vftint_l_d".}

func lsx_vftint_wu_s*(a: M128): M128i {.importc: "__lsx_vftint_wu_s".}

func lsx_vftint_lu_d*(a: M128d): M128i {.importc: "__lsx_vftint_lu_d".}

func lsx_vftintrz_w_s*(a: M128): M128i {.importc: "__lsx_vftintrz_w_s".}

func lsx_vftintrz_l_d*(a: M128d): M128i {.importc: "__lsx_vftintrz_l_d".}

func lsx_vftintrz_wu_s*(a: M128): M128i {.importc: "__lsx_vftintrz_wu_s".}

func lsx_vftintrz_lu_d*(a: M128d): M128i {.importc: "__lsx_vftintrz_lu_d".}

func lsx_vffint_s_w*(a: M128i): M128 {.importc: "__lsx_vffint_s_w".}

func lsx_vffint_d_l*(a: M128i): M128d {.importc: "__lsx_vffint_d_l".}

func lsx_vffint_s_wu*(a: M128i): M128 {.importc: "__lsx_vffint_s_wu".}

func lsx_vffint_d_lu*(a: M128i): M128d {.importc: "__lsx_vffint_d_lu".}

func lsx_vandn_v*(a: M128i, b: M128i): M128i {.importc: "__lsx_vandn_v".}

func lsx_vneg_b*(a: M128i): M128i {.importc: "__lsx_vneg_b".}

func lsx_vneg_h*(a: M128i): M128i {.importc: "__lsx_vneg_h".}

func lsx_vneg_w*(a: M128i): M128i {.importc: "__lsx_vneg_w".}

func lsx_vneg_d*(a: M128i): M128i {.importc: "__lsx_vneg_d".}

func lsx_vmuh_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmuh_b".}

func lsx_vmuh_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmuh_h".}

func lsx_vmuh_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmuh_w".}

func lsx_vmuh_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmuh_d".}

func lsx_vmuh_bu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmuh_bu".}

func lsx_vmuh_hu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmuh_hu".}

func lsx_vmuh_wu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmuh_wu".}

func lsx_vmuh_du*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmuh_du".}

## [Macro Original]
## #define __lsx_vsllwil_h_b(/*__m128i*/ _1, /*ui3*/ _2) \
## ((__m128i)__builtin_lsx_vsllwil_h_b ((v16i8)(_1), (_2)))
func lsx_vsllwil_h_b*(a: M128i, b: int32): M128i {.importc: "__lsx_vsllwil_h_b".}

## [Macro Original]
## #define __lsx_vsllwil_w_h(/*__m128i*/ _1, /*ui4*/ _2) \
## ((__m128i)__builtin_lsx_vsllwil_w_h ((v8i16)(_1), (_2)))
func lsx_vsllwil_w_h*(a: M128i, b: int32): M128i {.importc: "__lsx_vsllwil_w_h".}

## [Macro Original]
## #define __lsx_vsllwil_d_w(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vsllwil_d_w ((v4i32)(_1), (_2)))
func lsx_vsllwil_d_w*(a: M128i, b: int32): M128i {.importc: "__lsx_vsllwil_d_w".}

## [Macro Original]
## #define __lsx_vsllwil_hu_bu(/*__m128i*/ _1, /*ui3*/ _2) \
## ((__m128i)__builtin_lsx_vsllwil_hu_bu ((v16u8)(_1), (_2)))
func lsx_vsllwil_hu_bu*(a: M128i, b: int32): M128i {.importc: "__lsx_vsllwil_hu_bu".}

## [Macro Original]
## #define __lsx_vsllwil_wu_hu(/*__m128i*/ _1, /*ui4*/ _2) \
## ((__m128i)__builtin_lsx_vsllwil_wu_hu ((v8u16)(_1), (_2)))
func lsx_vsllwil_wu_hu*(a: M128i, b: int32): M128i {.importc: "__lsx_vsllwil_wu_hu".}

## [Macro Original]
## #define __lsx_vsllwil_du_wu(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vsllwil_du_wu ((v4u32)(_1), (_2)))
func lsx_vsllwil_du_wu*(a: M128i, b: int32): M128i {.importc: "__lsx_vsllwil_du_wu".}

func lsx_vsran_b_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsran_b_h".}

func lsx_vsran_h_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsran_h_w".}

func lsx_vsran_w_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsran_w_d".}

func lsx_vssran_b_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vssran_b_h".}

func lsx_vssran_h_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vssran_h_w".}

func lsx_vssran_w_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vssran_w_d".}

func lsx_vssran_bu_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vssran_bu_h".}

func lsx_vssran_hu_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vssran_hu_w".}

func lsx_vssran_wu_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vssran_wu_d".}

func lsx_vsrarn_b_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsrarn_b_h".}

func lsx_vsrarn_h_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsrarn_h_w".}

func lsx_vsrarn_w_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsrarn_w_d".}

func lsx_vssrarn_b_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vssrarn_b_h".}

func lsx_vssrarn_h_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vssrarn_h_w".}

func lsx_vssrarn_w_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vssrarn_w_d".}

func lsx_vssrarn_bu_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vssrarn_bu_h".}

func lsx_vssrarn_hu_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vssrarn_hu_w".}

func lsx_vssrarn_wu_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vssrarn_wu_d".}

func lsx_vsrln_b_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsrln_b_h".}

func lsx_vsrln_h_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsrln_h_w".}

func lsx_vsrln_w_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsrln_w_d".}

func lsx_vssrln_bu_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vssrln_bu_h".}

func lsx_vssrln_hu_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vssrln_hu_w".}

func lsx_vssrln_wu_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vssrln_wu_d".}

func lsx_vsrlrn_b_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsrlrn_b_h".}

func lsx_vsrlrn_h_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsrlrn_h_w".}

func lsx_vsrlrn_w_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsrlrn_w_d".}

func lsx_vssrlrn_bu_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vssrlrn_bu_h".}

func lsx_vssrlrn_hu_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vssrlrn_hu_w".}

func lsx_vssrlrn_wu_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vssrlrn_wu_d".}

## [Macro Original]
## #define __lsx_vfrstpi_b(/*__m128i*/ _1, /*__m128i*/ _2, /*ui5*/ _3) \
## ((__m128i)__builtin_lsx_vfrstpi_b ((v16i8)(_1), (v16i8)(_2), (_3)))
func lsx_vfrstpi_b*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vfrstpi_b".}

## [Macro Original]
## #define __lsx_vfrstpi_h(/*__m128i*/ _1, /*__m128i*/ _2, /*ui5*/ _3) \
## ((__m128i)__builtin_lsx_vfrstpi_h ((v8i16)(_1), (v8i16)(_2), (_3)))
func lsx_vfrstpi_h*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vfrstpi_h".}

func lsx_vfrstp_b*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vfrstp_b".}

func lsx_vfrstp_h*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vfrstp_h".}

## [Macro Original]
## #define __lsx_vshuf4i_d(/*__m128i*/ _1, /*__m128i*/ _2, /*ui8*/ _3) \
## ((__m128i)__builtin_lsx_vshuf4i_d ((v2i64)(_1), (v2i64)(_2), (_3)))
func lsx_vshuf4i_d*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vshuf4i_d".}

## [Macro Original]
## #define __lsx_vbsrl_v(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vbsrl_v ((v16i8)(_1), (_2)))
func lsx_vbsrl_v*(a: M128i, b: int32): M128i {.importc: "__lsx_vbsrl_v".}

## [Macro Original]
## #define __lsx_vbsll_v(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vbsll_v ((v16i8)(_1), (_2)))
func lsx_vbsll_v*(a: M128i, b: int32): M128i {.importc: "__lsx_vbsll_v".}

## [Macro Original]
## #define __lsx_vextrins_b(/*__m128i*/ _1, /*__m128i*/ _2, /*ui8*/ _3) \
## ((__m128i)__builtin_lsx_vextrins_b ((v16i8)(_1), (v16i8)(_2), (_3)))
func lsx_vextrins_b*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vextrins_b".}

## [Macro Original]
## #define __lsx_vextrins_h(/*__m128i*/ _1, /*__m128i*/ _2, /*ui8*/ _3) \
## ((__m128i)__builtin_lsx_vextrins_h ((v8i16)(_1), (v8i16)(_2), (_3)))
func lsx_vextrins_h*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vextrins_h".}

## [Macro Original]
## #define __lsx_vextrins_w(/*__m128i*/ _1, /*__m128i*/ _2, /*ui8*/ _3) \
## ((__m128i)__builtin_lsx_vextrins_w ((v4i32)(_1), (v4i32)(_2), (_3)))
func lsx_vextrins_w*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vextrins_w".}

## [Macro Original]
## #define __lsx_vextrins_d(/*__m128i*/ _1, /*__m128i*/ _2, /*ui8*/ _3) \
## ((__m128i)__builtin_lsx_vextrins_d ((v2i64)(_1), (v2i64)(_2), (_3)))
func lsx_vextrins_d*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vextrins_d".}

func lsx_vmskltz_b*(a: M128i): M128i {.importc: "__lsx_vmskltz_b".}

func lsx_vmskltz_h*(a: M128i): M128i {.importc: "__lsx_vmskltz_h".}

func lsx_vmskltz_w*(a: M128i): M128i {.importc: "__lsx_vmskltz_w".}

func lsx_vmskltz_d*(a: M128i): M128i {.importc: "__lsx_vmskltz_d".}

func lsx_vsigncov_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsigncov_b".}

func lsx_vsigncov_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsigncov_h".}

func lsx_vsigncov_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsigncov_w".}

func lsx_vsigncov_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsigncov_d".}

func lsx_vfmadd_s*(a: M128, b: M128, c: M128): M128 {.importc: "__lsx_vfmadd_s".}

func lsx_vfmadd_d*(a: M128d, b: M128d, c: M128d): M128d {.importc: "__lsx_vfmadd_d".}

func lsx_vfmsub_s*(a: M128, b: M128, c: M128): M128 {.importc: "__lsx_vfmsub_s".}

func lsx_vfmsub_d*(a: M128d, b: M128d, c: M128d): M128d {.importc: "__lsx_vfmsub_d".}

func lsx_vfnmadd_s*(a: M128, b: M128, c: M128): M128 {.importc: "__lsx_vfnmadd_s".}

func lsx_vfnmadd_d*(a: M128d, b: M128d, c: M128d): M128d {.importc: "__lsx_vfnmadd_d".}

func lsx_vfnmsub_s*(a: M128, b: M128, c: M128): M128 {.importc: "__lsx_vfnmsub_s".}

func lsx_vfnmsub_d*(a: M128d, b: M128d, c: M128d): M128d {.importc: "__lsx_vfnmsub_d".}

func lsx_vftintrne_w_s*(a: M128): M128i {.importc: "__lsx_vftintrne_w_s".}

func lsx_vftintrne_l_d*(a: M128d): M128i {.importc: "__lsx_vftintrne_l_d".}

func lsx_vftintrp_w_s*(a: M128): M128i {.importc: "__lsx_vftintrp_w_s".}

func lsx_vftintrp_l_d*(a: M128d): M128i {.importc: "__lsx_vftintrp_l_d".}

func lsx_vftintrm_w_s*(a: M128): M128i {.importc: "__lsx_vftintrm_w_s".}

func lsx_vftintrm_l_d*(a: M128d): M128i {.importc: "__lsx_vftintrm_l_d".}

func lsx_vftint_w_d*(a: M128d, b: M128d): M128i {.importc: "__lsx_vftint_w_d".}

func lsx_vffint_s_l*(a: M128i, b: M128i): M128 {.importc: "__lsx_vffint_s_l".}

func lsx_vftintrz_w_d*(a: M128d, b: M128d): M128i {.importc: "__lsx_vftintrz_w_d".}

func lsx_vftintrp_w_d*(a: M128d, b: M128d): M128i {.importc: "__lsx_vftintrp_w_d".}

func lsx_vftintrm_w_d*(a: M128d, b: M128d): M128i {.importc: "__lsx_vftintrm_w_d".}

func lsx_vftintrne_w_d*(a: M128d, b: M128d): M128i {.importc: "__lsx_vftintrne_w_d".}

func lsx_vftintl_l_s*(a: M128): M128i {.importc: "__lsx_vftintl_l_s".}

func lsx_vftinth_l_s*(a: M128): M128i {.importc: "__lsx_vftinth_l_s".}

func lsx_vffinth_d_w*(a: M128i): M128d {.importc: "__lsx_vffinth_d_w".}

func lsx_vffintl_d_w*(a: M128i): M128d {.importc: "__lsx_vffintl_d_w".}

func lsx_vftintrzl_l_s*(a: M128): M128i {.importc: "__lsx_vftintrzl_l_s".}

func lsx_vftintrzh_l_s*(a: M128): M128i {.importc: "__lsx_vftintrzh_l_s".}

func lsx_vftintrpl_l_s*(a: M128): M128i {.importc: "__lsx_vftintrpl_l_s".}

func lsx_vftintrph_l_s*(a: M128): M128i {.importc: "__lsx_vftintrph_l_s".}

func lsx_vftintrml_l_s*(a: M128): M128i {.importc: "__lsx_vftintrml_l_s".}

func lsx_vftintrmh_l_s*(a: M128): M128i {.importc: "__lsx_vftintrmh_l_s".}

func lsx_vftintrnel_l_s*(a: M128): M128i {.importc: "__lsx_vftintrnel_l_s".}

func lsx_vftintrneh_l_s*(a: M128): M128i {.importc: "__lsx_vftintrneh_l_s".}

func lsx_vfrintrne_s*(a: M128): M128 {.importc: "__lsx_vfrintrne_s".}

func lsx_vfrintrne_d*(a: M128d): M128d {.importc: "__lsx_vfrintrne_d".}

func lsx_vfrintrz_s*(a: M128): M128 {.importc: "__lsx_vfrintrz_s".}

func lsx_vfrintrz_d*(a: M128d): M128d {.importc: "__lsx_vfrintrz_d".}

func lsx_vfrintrp_s*(a: M128): M128 {.importc: "__lsx_vfrintrp_s".}

func lsx_vfrintrp_d*(a: M128d): M128d {.importc: "__lsx_vfrintrp_d".}

func lsx_vfrintrm_s*(a: M128): M128 {.importc: "__lsx_vfrintrm_s".}

func lsx_vfrintrm_d*(a: M128d): M128d {.importc: "__lsx_vfrintrm_d".}

## [Macro Original]
## #define __lsx_vstelm_b(/*__m128i*/ _1, /*void **/ _2, /*si8*/ _3, /*idx*/ _4) \
## ((void)__builtin_lsx_vstelm_b ((v16i8)(_1), (void *)(_2), (_3), (_4)))
## func lsx_vstelm_b*(a: M128i, b: int32, c: si8, d: idx): M128i {.importc: "__lsx_vstelm_b".}

## [Macro Original]
## #define __lsx_vstelm_h(/*__m128i*/ _1, /*void **/ _2, /*si8*/ _3, /*idx*/ _4) \
## ((void)__builtin_lsx_vstelm_h ((v8i16)(_1), (void *)(_2), (_3), (_4)))
## func lsx_vstelm_h*(a: M128i, b: int32, c: si8, d: idx): M128i {.importc: "__lsx_vstelm_h".}

## [Macro Original]
## #define __lsx_vstelm_w(/*__m128i*/ _1, /*void **/ _2, /*si8*/ _3, /*idx*/ _4) \
## ((void)__builtin_lsx_vstelm_w ((v4i32)(_1), (void *)(_2), (_3), (_4)))
## func lsx_vstelm_w*(a: M128i, b: int32, c: si8, d: idx): M128i {.importc: "__lsx_vstelm_w".}

## [Macro Original]
## #define __lsx_vstelm_d(/*__m128i*/ _1, /*void **/ _2, /*si8*/ _3, /*idx*/ _4) \
## ((void)__builtin_lsx_vstelm_d ((v2i64)(_1), (void *)(_2), (_3), (_4)))
## func lsx_vstelm_d*(a: M128i, b: int32, c: si8, d: idx): M128i {.importc: "__lsx_vstelm_d".}

func lsx_vaddwev_d_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vaddwev_d_w".}

func lsx_vaddwev_w_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vaddwev_w_h".}

func lsx_vaddwev_h_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vaddwev_h_b".}

func lsx_vaddwod_d_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vaddwod_d_w".}

func lsx_vaddwod_w_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vaddwod_w_h".}

func lsx_vaddwod_h_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vaddwod_h_b".}

func lsx_vaddwev_d_wu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vaddwev_d_wu".}

func lsx_vaddwev_w_hu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vaddwev_w_hu".}

func lsx_vaddwev_h_bu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vaddwev_h_bu".}

func lsx_vaddwod_d_wu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vaddwod_d_wu".}

func lsx_vaddwod_w_hu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vaddwod_w_hu".}

func lsx_vaddwod_h_bu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vaddwod_h_bu".}

func lsx_vaddwev_d_wu_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vaddwev_d_wu_w".}

func lsx_vaddwev_w_hu_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vaddwev_w_hu_h".}

func lsx_vaddwev_h_bu_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vaddwev_h_bu_b".}

func lsx_vaddwod_d_wu_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vaddwod_d_wu_w".}

func lsx_vaddwod_w_hu_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vaddwod_w_hu_h".}

func lsx_vaddwod_h_bu_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vaddwod_h_bu_b".}

func lsx_vsubwev_d_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsubwev_d_w".}

func lsx_vsubwev_w_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsubwev_w_h".}

func lsx_vsubwev_h_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsubwev_h_b".}

func lsx_vsubwod_d_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsubwod_d_w".}

func lsx_vsubwod_w_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsubwod_w_h".}

func lsx_vsubwod_h_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsubwod_h_b".}

func lsx_vsubwev_d_wu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsubwev_d_wu".}

func lsx_vsubwev_w_hu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsubwev_w_hu".}

func lsx_vsubwev_h_bu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsubwev_h_bu".}

func lsx_vsubwod_d_wu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsubwod_d_wu".}

func lsx_vsubwod_w_hu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsubwod_w_hu".}

func lsx_vsubwod_h_bu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsubwod_h_bu".}

func lsx_vaddwev_q_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vaddwev_q_d".}

func lsx_vaddwod_q_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vaddwod_q_d".}

func lsx_vaddwev_q_du*(a: M128i, b: M128i): M128i {.importc: "__lsx_vaddwev_q_du".}

func lsx_vaddwod_q_du*(a: M128i, b: M128i): M128i {.importc: "__lsx_vaddwod_q_du".}

func lsx_vsubwev_q_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsubwev_q_d".}

func lsx_vsubwod_q_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsubwod_q_d".}

func lsx_vsubwev_q_du*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsubwev_q_du".}

func lsx_vsubwod_q_du*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsubwod_q_du".}

func lsx_vaddwev_q_du_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vaddwev_q_du_d".}

func lsx_vaddwod_q_du_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vaddwod_q_du_d".}

func lsx_vmulwev_d_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmulwev_d_w".}

func lsx_vmulwev_w_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmulwev_w_h".}

func lsx_vmulwev_h_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmulwev_h_b".}

func lsx_vmulwod_d_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmulwod_d_w".}

func lsx_vmulwod_w_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmulwod_w_h".}

func lsx_vmulwod_h_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmulwod_h_b".}

func lsx_vmulwev_d_wu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmulwev_d_wu".}

func lsx_vmulwev_w_hu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmulwev_w_hu".}

func lsx_vmulwev_h_bu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmulwev_h_bu".}

func lsx_vmulwod_d_wu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmulwod_d_wu".}

func lsx_vmulwod_w_hu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmulwod_w_hu".}

func lsx_vmulwod_h_bu*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmulwod_h_bu".}

func lsx_vmulwev_d_wu_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmulwev_d_wu_w".}

func lsx_vmulwev_w_hu_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmulwev_w_hu_h".}

func lsx_vmulwev_h_bu_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmulwev_h_bu_b".}

func lsx_vmulwod_d_wu_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmulwod_d_wu_w".}

func lsx_vmulwod_w_hu_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmulwod_w_hu_h".}

func lsx_vmulwod_h_bu_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmulwod_h_bu_b".}

func lsx_vmulwev_q_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmulwev_q_d".}

func lsx_vmulwod_q_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmulwod_q_d".}

func lsx_vmulwev_q_du*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmulwev_q_du".}

func lsx_vmulwod_q_du*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmulwod_q_du".}

func lsx_vmulwev_q_du_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmulwev_q_du_d".}

func lsx_vmulwod_q_du_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vmulwod_q_du_d".}

func lsx_vhaddw_q_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vhaddw_q_d".}

func lsx_vhaddw_qu_du*(a: M128i, b: M128i): M128i {.importc: "__lsx_vhaddw_qu_du".}

func lsx_vhsubw_q_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vhsubw_q_d".}

func lsx_vhsubw_qu_du*(a: M128i, b: M128i): M128i {.importc: "__lsx_vhsubw_qu_du".}

func lsx_vmaddwev_d_w*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vmaddwev_d_w".}

func lsx_vmaddwev_w_h*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vmaddwev_w_h".}

func lsx_vmaddwev_h_b*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vmaddwev_h_b".}

func lsx_vmaddwev_d_wu*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vmaddwev_d_wu".}

func lsx_vmaddwev_w_hu*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vmaddwev_w_hu".}

func lsx_vmaddwev_h_bu*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vmaddwev_h_bu".}

func lsx_vmaddwod_d_w*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vmaddwod_d_w".}

func lsx_vmaddwod_w_h*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vmaddwod_w_h".}

func lsx_vmaddwod_h_b*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vmaddwod_h_b".}

func lsx_vmaddwod_d_wu*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vmaddwod_d_wu".}

func lsx_vmaddwod_w_hu*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vmaddwod_w_hu".}

func lsx_vmaddwod_h_bu*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vmaddwod_h_bu".}

func lsx_vmaddwev_d_wu_w*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vmaddwev_d_wu_w".}

func lsx_vmaddwev_w_hu_h*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vmaddwev_w_hu_h".}

func lsx_vmaddwev_h_bu_b*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vmaddwev_h_bu_b".}

func lsx_vmaddwod_d_wu_w*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vmaddwod_d_wu_w".}

func lsx_vmaddwod_w_hu_h*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vmaddwod_w_hu_h".}

func lsx_vmaddwod_h_bu_b*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vmaddwod_h_bu_b".}

func lsx_vmaddwev_q_d*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vmaddwev_q_d".}

func lsx_vmaddwod_q_d*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vmaddwod_q_d".}

func lsx_vmaddwev_q_du*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vmaddwev_q_du".}

func lsx_vmaddwod_q_du*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vmaddwod_q_du".}

func lsx_vmaddwev_q_du_d*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vmaddwev_q_du_d".}

func lsx_vmaddwod_q_du_d*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vmaddwod_q_du_d".}

func lsx_vrotr_b*(a: M128i, b: M128i): M128i {.importc: "__lsx_vrotr_b".}

func lsx_vrotr_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vrotr_h".}

func lsx_vrotr_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vrotr_w".}

func lsx_vrotr_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vrotr_d".}

func lsx_vadd_q*(a: M128i, b: M128i): M128i {.importc: "__lsx_vadd_q".}

func lsx_vsub_q*(a: M128i, b: M128i): M128i {.importc: "__lsx_vsub_q".}

func lsx_vldrepl_b*(p: pointer, imm: int32): M128i {.importc: "__lsx_vldrepl_b".}

func lsx_vldrepl_h*(p: pointer, imm: int32): M128i {.importc: "__lsx_vldrepl_h".}

func lsx_vldrepl_w*(p: pointer, imm: int32): M128i {.importc: "__lsx_vldrepl_w".}

func lsx_vldrepl_d*(p: pointer, imm: int32): M128i {.importc: "__lsx_vldrepl_d".}

func lsx_vmskgez_b*(a: M128i): M128i {.importc: "__lsx_vmskgez_b".}

func lsx_vmsknz_b*(a: M128i): M128i {.importc: "__lsx_vmsknz_b".}

func lsx_vexth_h_b*(a: M128i): M128i {.importc: "__lsx_vexth_h_b".}

func lsx_vexth_w_h*(a: M128i): M128i {.importc: "__lsx_vexth_w_h".}

func lsx_vexth_d_w*(a: M128i): M128i {.importc: "__lsx_vexth_d_w".}

func lsx_vexth_q_d*(a: M128i): M128i {.importc: "__lsx_vexth_q_d".}

func lsx_vexth_hu_bu*(a: M128i): M128i {.importc: "__lsx_vexth_hu_bu".}

func lsx_vexth_wu_hu*(a: M128i): M128i {.importc: "__lsx_vexth_wu_hu".}

func lsx_vexth_du_wu*(a: M128i): M128i {.importc: "__lsx_vexth_du_wu".}

func lsx_vexth_qu_du*(a: M128i): M128i {.importc: "__lsx_vexth_qu_du".}

## [Macro Original]
## #define __lsx_vrotri_b(/*__m128i*/ _1, /*ui3*/ _2) \
## ((__m128i)__builtin_lsx_vrotri_b ((v16i8)(_1), (_2)))
func lsx_vrotri_b*(a: M128i, b: int32): M128i {.importc: "__lsx_vrotri_b".}

## [Macro Original]
## #define __lsx_vrotri_h(/*__m128i*/ _1, /*ui4*/ _2) \
## ((__m128i)__builtin_lsx_vrotri_h ((v8i16)(_1), (_2)))
func lsx_vrotri_h*(a: M128i, b: int32): M128i {.importc: "__lsx_vrotri_h".}

## [Macro Original]
## #define __lsx_vrotri_w(/*__m128i*/ _1, /*ui5*/ _2) \
## ((__m128i)__builtin_lsx_vrotri_w ((v4i32)(_1), (_2)))
func lsx_vrotri_w*(a: M128i, b: int32): M128i {.importc: "__lsx_vrotri_w".}

## [Macro Original]
## #define __lsx_vrotri_d(/*__m128i*/ _1, /*ui6*/ _2) \
## ((__m128i)__builtin_lsx_vrotri_d ((v2i64)(_1), (_2)))
func lsx_vrotri_d*(a: M128i, b: int32): M128i {.importc: "__lsx_vrotri_d".}

func lsx_vextl_q_d*(a: M128i): M128i {.importc: "__lsx_vextl_q_d".}

## [Macro Original]
## #define __lsx_vsrlni_b_h(/*__m128i*/ _1, /*__m128i*/ _2, /*ui4*/ _3) \
## ((__m128i)__builtin_lsx_vsrlni_b_h ((v16i8)(_1), (v16i8)(_2), (_3)))
func lsx_vsrlni_b_h*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vsrlni_b_h".}

## [Macro Original]
## #define __lsx_vsrlni_h_w(/*__m128i*/ _1, /*__m128i*/ _2, /*ui5*/ _3) \
## ((__m128i)__builtin_lsx_vsrlni_h_w ((v8i16)(_1), (v8i16)(_2), (_3)))
func lsx_vsrlni_h_w*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vsrlni_h_w".}

## [Macro Original]
## #define __lsx_vsrlni_w_d(/*__m128i*/ _1, /*__m128i*/ _2, /*ui6*/ _3) \
## ((__m128i)__builtin_lsx_vsrlni_w_d ((v4i32)(_1), (v4i32)(_2), (_3)))
func lsx_vsrlni_w_d*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vsrlni_w_d".}

## [Macro Original]
## #define __lsx_vsrlni_d_q(/*__m128i*/ _1, /*__m128i*/ _2, /*ui7*/ _3) \
## ((__m128i)__builtin_lsx_vsrlni_d_q ((v2i64)(_1), (v2i64)(_2), (_3)))
func lsx_vsrlni_d_q*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vsrlni_d_q".}

## [Macro Original]
## #define __lsx_vsrlrni_b_h(/*__m128i*/ _1, /*__m128i*/ _2, /*ui4*/ _3) \
## ((__m128i)__builtin_lsx_vsrlrni_b_h ((v16i8)(_1), (v16i8)(_2), (_3)))
func lsx_vsrlrni_b_h*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vsrlrni_b_h".}

## [Macro Original]
## #define __lsx_vsrlrni_h_w(/*__m128i*/ _1, /*__m128i*/ _2, /*ui5*/ _3) \
## ((__m128i)__builtin_lsx_vsrlrni_h_w ((v8i16)(_1), (v8i16)(_2), (_3)))
func lsx_vsrlrni_h_w*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vsrlrni_h_w".}

## [Macro Original]
## #define __lsx_vsrlrni_w_d(/*__m128i*/ _1, /*__m128i*/ _2, /*ui6*/ _3) \
## ((__m128i)__builtin_lsx_vsrlrni_w_d ((v4i32)(_1), (v4i32)(_2), (_3)))
func lsx_vsrlrni_w_d*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vsrlrni_w_d".}

## [Macro Original]
## #define __lsx_vsrlrni_d_q(/*__m128i*/ _1, /*__m128i*/ _2, /*ui7*/ _3) \
## ((__m128i)__builtin_lsx_vsrlrni_d_q ((v2i64)(_1), (v2i64)(_2), (_3)))
func lsx_vsrlrni_d_q*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vsrlrni_d_q".}

## [Macro Original]
## #define __lsx_vssrlni_b_h(/*__m128i*/ _1, /*__m128i*/ _2, /*ui4*/ _3) \
## ((__m128i)__builtin_lsx_vssrlni_b_h ((v16i8)(_1), (v16i8)(_2), (_3)))
func lsx_vssrlni_b_h*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vssrlni_b_h".}

## [Macro Original]
## #define __lsx_vssrlni_h_w(/*__m128i*/ _1, /*__m128i*/ _2, /*ui5*/ _3) \
## ((__m128i)__builtin_lsx_vssrlni_h_w ((v8i16)(_1), (v8i16)(_2), (_3)))
func lsx_vssrlni_h_w*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vssrlni_h_w".}

## [Macro Original]
## #define __lsx_vssrlni_w_d(/*__m128i*/ _1, /*__m128i*/ _2, /*ui6*/ _3) \
## ((__m128i)__builtin_lsx_vssrlni_w_d ((v4i32)(_1), (v4i32)(_2), (_3)))
func lsx_vssrlni_w_d*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vssrlni_w_d".}

## [Macro Original]
## #define __lsx_vssrlni_d_q(/*__m128i*/ _1, /*__m128i*/ _2, /*ui7*/ _3) \
## ((__m128i)__builtin_lsx_vssrlni_d_q ((v2i64)(_1), (v2i64)(_2), (_3)))
func lsx_vssrlni_d_q*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vssrlni_d_q".}

## [Macro Original]
## #define __lsx_vssrlni_bu_h(/*__m128i*/ _1, /*__m128i*/ _2, /*ui4*/ _3) \
## ((__m128i)__builtin_lsx_vssrlni_bu_h ((v16u8)(_1), (v16i8)(_2), (_3)))
func lsx_vssrlni_bu_h*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vssrlni_bu_h".}

## [Macro Original]
## #define __lsx_vssrlni_hu_w(/*__m128i*/ _1, /*__m128i*/ _2, /*ui5*/ _3) \
## ((__m128i)__builtin_lsx_vssrlni_hu_w ((v8u16)(_1), (v8i16)(_2), (_3)))
func lsx_vssrlni_hu_w*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vssrlni_hu_w".}

## [Macro Original]
## #define __lsx_vssrlni_wu_d(/*__m128i*/ _1, /*__m128i*/ _2, /*ui6*/ _3) \
## ((__m128i)__builtin_lsx_vssrlni_wu_d ((v4u32)(_1), (v4i32)(_2), (_3)))
func lsx_vssrlni_wu_d*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vssrlni_wu_d".}

## [Macro Original]
## #define __lsx_vssrlni_du_q(/*__m128i*/ _1, /*__m128i*/ _2, /*ui7*/ _3) \
## ((__m128i)__builtin_lsx_vssrlni_du_q ((v2u64)(_1), (v2i64)(_2), (_3)))
func lsx_vssrlni_du_q*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vssrlni_du_q".}

## [Macro Original]
## #define __lsx_vssrlrni_b_h(/*__m128i*/ _1, /*__m128i*/ _2, /*ui4*/ _3) \
## ((__m128i)__builtin_lsx_vssrlrni_b_h ((v16i8)(_1), (v16i8)(_2), (_3)))
func lsx_vssrlrni_b_h*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vssrlrni_b_h".}

## [Macro Original]
## #define __lsx_vssrlrni_h_w(/*__m128i*/ _1, /*__m128i*/ _2, /*ui5*/ _3) \
## ((__m128i)__builtin_lsx_vssrlrni_h_w ((v8i16)(_1), (v8i16)(_2), (_3)))
func lsx_vssrlrni_h_w*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vssrlrni_h_w".}

## [Macro Original]
## #define __lsx_vssrlrni_w_d(/*__m128i*/ _1, /*__m128i*/ _2, /*ui6*/ _3) \
## ((__m128i)__builtin_lsx_vssrlrni_w_d ((v4i32)(_1), (v4i32)(_2), (_3)))
func lsx_vssrlrni_w_d*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vssrlrni_w_d".}

## [Macro Original]
## #define __lsx_vssrlrni_d_q(/*__m128i*/ _1, /*__m128i*/ _2, /*ui7*/ _3) \
## ((__m128i)__builtin_lsx_vssrlrni_d_q ((v2i64)(_1), (v2i64)(_2), (_3)))
func lsx_vssrlrni_d_q*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vssrlrni_d_q".}

## [Macro Original]
## #define __lsx_vssrlrni_bu_h(/*__m128i*/ _1, /*__m128i*/ _2, /*ui4*/ _3) \
## ((__m128i)__builtin_lsx_vssrlrni_bu_h ((v16u8)(_1), (v16i8)(_2), (_3)))
func lsx_vssrlrni_bu_h*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vssrlrni_bu_h".}

## [Macro Original]
## #define __lsx_vssrlrni_hu_w(/*__m128i*/ _1, /*__m128i*/ _2, /*ui5*/ _3) \
## ((__m128i)__builtin_lsx_vssrlrni_hu_w ((v8u16)(_1), (v8i16)(_2), (_3)))
func lsx_vssrlrni_hu_w*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vssrlrni_hu_w".}

## [Macro Original]
## #define __lsx_vssrlrni_wu_d(/*__m128i*/ _1, /*__m128i*/ _2, /*ui6*/ _3) \
## ((__m128i)__builtin_lsx_vssrlrni_wu_d ((v4u32)(_1), (v4i32)(_2), (_3)))
func lsx_vssrlrni_wu_d*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vssrlrni_wu_d".}

## [Macro Original]
## #define __lsx_vssrlrni_du_q(/*__m128i*/ _1, /*__m128i*/ _2, /*ui7*/ _3) \
## ((__m128i)__builtin_lsx_vssrlrni_du_q ((v2u64)(_1), (v2i64)(_2), (_3)))
func lsx_vssrlrni_du_q*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vssrlrni_du_q".}

## [Macro Original]
## #define __lsx_vsrani_b_h(/*__m128i*/ _1, /*__m128i*/ _2, /*ui4*/ _3) \
## ((__m128i)__builtin_lsx_vsrani_b_h ((v16i8)(_1), (v16i8)(_2), (_3)))
func lsx_vsrani_b_h*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vsrani_b_h".}

## [Macro Original]
## #define __lsx_vsrani_h_w(/*__m128i*/ _1, /*__m128i*/ _2, /*ui5*/ _3) \
## ((__m128i)__builtin_lsx_vsrani_h_w ((v8i16)(_1), (v8i16)(_2), (_3)))
func lsx_vsrani_h_w*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vsrani_h_w".}

## [Macro Original]
## #define __lsx_vsrani_w_d(/*__m128i*/ _1, /*__m128i*/ _2, /*ui6*/ _3) \
## ((__m128i)__builtin_lsx_vsrani_w_d ((v4i32)(_1), (v4i32)(_2), (_3)))
func lsx_vsrani_w_d*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vsrani_w_d".}

## [Macro Original]
## #define __lsx_vsrani_d_q(/*__m128i*/ _1, /*__m128i*/ _2, /*ui7*/ _3) \
## ((__m128i)__builtin_lsx_vsrani_d_q ((v2i64)(_1), (v2i64)(_2), (_3)))
func lsx_vsrani_d_q*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vsrani_d_q".}

## [Macro Original]
## #define __lsx_vsrarni_b_h(/*__m128i*/ _1, /*__m128i*/ _2, /*ui4*/ _3) \
## ((__m128i)__builtin_lsx_vsrarni_b_h ((v16i8)(_1), (v16i8)(_2), (_3)))
func lsx_vsrarni_b_h*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vsrarni_b_h".}

## [Macro Original]
## #define __lsx_vsrarni_h_w(/*__m128i*/ _1, /*__m128i*/ _2, /*ui5*/ _3) \
## ((__m128i)__builtin_lsx_vsrarni_h_w ((v8i16)(_1), (v8i16)(_2), (_3)))
func lsx_vsrarni_h_w*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vsrarni_h_w".}

## [Macro Original]
## #define __lsx_vsrarni_w_d(/*__m128i*/ _1, /*__m128i*/ _2, /*ui6*/ _3) \
## ((__m128i)__builtin_lsx_vsrarni_w_d ((v4i32)(_1), (v4i32)(_2), (_3)))
func lsx_vsrarni_w_d*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vsrarni_w_d".}

## [Macro Original]
## #define __lsx_vsrarni_d_q(/*__m128i*/ _1, /*__m128i*/ _2, /*ui7*/ _3) \
## ((__m128i)__builtin_lsx_vsrarni_d_q ((v2i64)(_1), (v2i64)(_2), (_3)))
func lsx_vsrarni_d_q*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vsrarni_d_q".}

## [Macro Original]
## #define __lsx_vssrani_b_h(/*__m128i*/ _1, /*__m128i*/ _2, /*ui4*/ _3) \
## ((__m128i)__builtin_lsx_vssrani_b_h ((v16i8)(_1), (v16i8)(_2), (_3)))
func lsx_vssrani_b_h*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vssrani_b_h".}

## [Macro Original]
## #define __lsx_vssrani_h_w(/*__m128i*/ _1, /*__m128i*/ _2, /*ui5*/ _3) \
## ((__m128i)__builtin_lsx_vssrani_h_w ((v8i16)(_1), (v8i16)(_2), (_3)))
func lsx_vssrani_h_w*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vssrani_h_w".}

## [Macro Original]
## #define __lsx_vssrani_w_d(/*__m128i*/ _1, /*__m128i*/ _2, /*ui6*/ _3) \
## ((__m128i)__builtin_lsx_vssrani_w_d ((v4i32)(_1), (v4i32)(_2), (_3)))
func lsx_vssrani_w_d*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vssrani_w_d".}

## [Macro Original]
## #define __lsx_vssrani_d_q(/*__m128i*/ _1, /*__m128i*/ _2, /*ui7*/ _3) \
## ((__m128i)__builtin_lsx_vssrani_d_q ((v2i64)(_1), (v2i64)(_2), (_3)))
func lsx_vssrani_d_q*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vssrani_d_q".}

## [Macro Original]
## #define __lsx_vssrani_bu_h(/*__m128i*/ _1, /*__m128i*/ _2, /*ui4*/ _3) \
## ((__m128i)__builtin_lsx_vssrani_bu_h ((v16u8)(_1), (v16i8)(_2), (_3)))
func lsx_vssrani_bu_h*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vssrani_bu_h".}

## [Macro Original]
## #define __lsx_vssrani_hu_w(/*__m128i*/ _1, /*__m128i*/ _2, /*ui5*/ _3) \
## ((__m128i)__builtin_lsx_vssrani_hu_w ((v8u16)(_1), (v8i16)(_2), (_3)))
func lsx_vssrani_hu_w*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vssrani_hu_w".}

## [Macro Original]
## #define __lsx_vssrani_wu_d(/*__m128i*/ _1, /*__m128i*/ _2, /*ui6*/ _3) \
## ((__m128i)__builtin_lsx_vssrani_wu_d ((v4u32)(_1), (v4i32)(_2), (_3)))
func lsx_vssrani_wu_d*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vssrani_wu_d".}

## [Macro Original]
## #define __lsx_vssrani_du_q(/*__m128i*/ _1, /*__m128i*/ _2, /*ui7*/ _3) \
## ((__m128i)__builtin_lsx_vssrani_du_q ((v2u64)(_1), (v2i64)(_2), (_3)))
func lsx_vssrani_du_q*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vssrani_du_q".}

## [Macro Original]
## #define __lsx_vssrarni_b_h(/*__m128i*/ _1, /*__m128i*/ _2, /*ui4*/ _3) \
## ((__m128i)__builtin_lsx_vssrarni_b_h ((v16i8)(_1), (v16i8)(_2), (_3)))
func lsx_vssrarni_b_h*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vssrarni_b_h".}

## [Macro Original]
## #define __lsx_vssrarni_h_w(/*__m128i*/ _1, /*__m128i*/ _2, /*ui5*/ _3) \
## ((__m128i)__builtin_lsx_vssrarni_h_w ((v8i16)(_1), (v8i16)(_2), (_3)))
func lsx_vssrarni_h_w*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vssrarni_h_w".}

## [Macro Original]
## #define __lsx_vssrarni_w_d(/*__m128i*/ _1, /*__m128i*/ _2, /*ui6*/ _3) \
## ((__m128i)__builtin_lsx_vssrarni_w_d ((v4i32)(_1), (v4i32)(_2), (_3)))
func lsx_vssrarni_w_d*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vssrarni_w_d".}

## [Macro Original]
## #define __lsx_vssrarni_d_q(/*__m128i*/ _1, /*__m128i*/ _2, /*ui7*/ _3) \
## ((__m128i)__builtin_lsx_vssrarni_d_q ((v2i64)(_1), (v2i64)(_2), (_3)))
func lsx_vssrarni_d_q*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vssrarni_d_q".}

## [Macro Original]
## #define __lsx_vssrarni_bu_h(/*__m128i*/ _1, /*__m128i*/ _2, /*ui4*/ _3) \
## ((__m128i)__builtin_lsx_vssrarni_bu_h ((v16u8)(_1), (v16i8)(_2), (_3)))
func lsx_vssrarni_bu_h*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vssrarni_bu_h".}

## [Macro Original]
## #define __lsx_vssrarni_hu_w(/*__m128i*/ _1, /*__m128i*/ _2, /*ui5*/ _3) \
## ((__m128i)__builtin_lsx_vssrarni_hu_w ((v8u16)(_1), (v8i16)(_2), (_3)))
func lsx_vssrarni_hu_w*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vssrarni_hu_w".}

## [Macro Original]
## #define __lsx_vssrarni_wu_d(/*__m128i*/ _1, /*__m128i*/ _2, /*ui6*/ _3) \
## ((__m128i)__builtin_lsx_vssrarni_wu_d ((v4u32)(_1), (v4i32)(_2), (_3)))
func lsx_vssrarni_wu_d*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vssrarni_wu_d".}

## [Macro Original]
## #define __lsx_vssrarni_du_q(/*__m128i*/ _1, /*__m128i*/ _2, /*ui7*/ _3) \
## ((__m128i)__builtin_lsx_vssrarni_du_q ((v2u64)(_1), (v2i64)(_2), (_3)))
func lsx_vssrarni_du_q*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vssrarni_du_q".}

## [Macro Original]
## #define __lsx_vpermi_w(/*__m128i*/ _1, /*__m128i*/ _2, /*ui8*/ _3) \
## ((__m128i)__builtin_lsx_vpermi_w ((v4i32)(_1), (v4i32)(_2), (_3)))
func lsx_vpermi_w*(a: M128i, b: M128i, c: int32): M128i {.importc: "__lsx_vpermi_w".}

func lsx_vld*(p: pointer, imm: int32): M128i {.importc: "__lsx_vld".}

## [Macro Original]
## #define __lsx_vst(/*__m128i*/ _1, /*void **/ _2, /*si12*/ _3) \
## ((void)__builtin_lsx_vst ((v16i8)(_1), (void *)(_2), (_3)))
## func lsx_vst*(a: M128i, b: int32, c: si12): M128i {.importc: "__lsx_vst".}

func lsx_vssrlrn_b_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vssrlrn_b_h".}

func lsx_vssrlrn_h_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vssrlrn_h_w".}

func lsx_vssrlrn_w_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vssrlrn_w_d".}

func lsx_vssrln_b_h*(a: M128i, b: M128i): M128i {.importc: "__lsx_vssrln_b_h".}

func lsx_vssrln_h_w*(a: M128i, b: M128i): M128i {.importc: "__lsx_vssrln_h_w".}

func lsx_vssrln_w_d*(a: M128i, b: M128i): M128i {.importc: "__lsx_vssrln_w_d".}

func lsx_vorn_v*(a: M128i, b: M128i): M128i {.importc: "__lsx_vorn_v".}

func lsx_vldi*(imm: int32): M128i {.importc: "__lsx_vldi".}

func lsx_vshuf_b*(a: M128i, b: M128i, c: M128i): M128i {.importc: "__lsx_vshuf_b".}

func lsx_vldx*(a: int32, b: int64): M128i {.importc: "__lsx_vldx".}

func lsx_vstx*(a: M128i, b: int32, c: int64): int32 {.importc: "__lsx_vstx".}

func lsx_vextl_qu_du*(a: M128i): M128i {.importc: "__lsx_vextl_qu_du".}

## [Macro Original]
## #define __lsx_bnz_b(/*__m128i*/ _1) \
## ((int)__builtin_lsx_bnz_b ((v16u8)(_1)))
func lsx_bnz_b*(a: M128i): M128i {.importc: "__lsx_bnz_b".}

## [Macro Original]
## #define __lsx_bnz_d(/*__m128i*/ _1) \
## ((int)__builtin_lsx_bnz_d ((v2u64)(_1)))
func lsx_bnz_d*(a: M128i): M128i {.importc: "__lsx_bnz_d".}

## [Macro Original]
## #define __lsx_bnz_h(/*__m128i*/ _1) \
## ((int)__builtin_lsx_bnz_h ((v8u16)(_1)))
func lsx_bnz_h*(a: M128i): M128i {.importc: "__lsx_bnz_h".}

## [Macro Original]
## #define __lsx_bnz_v(/*__m128i*/ _1) \
## ((int)__builtin_lsx_bnz_v ((v16u8)(_1)))
func lsx_bnz_v*(a: M128i): M128i {.importc: "__lsx_bnz_v".}

## [Macro Original]
## #define __lsx_bnz_w(/*__m128i*/ _1) \
## ((int)__builtin_lsx_bnz_w ((v4u32)(_1)))
func lsx_bnz_w*(a: M128i): M128i {.importc: "__lsx_bnz_w".}

## [Macro Original]
## #define __lsx_bz_b(/*__m128i*/ _1) \
## ((int)__builtin_lsx_bz_b ((v16u8)(_1)))
func lsx_bz_b*(a: M128i): M128i {.importc: "__lsx_bz_b".}

## [Macro Original]
## #define __lsx_bz_d(/*__m128i*/ _1) \
## ((int)__builtin_lsx_bz_d ((v2u64)(_1)))
func lsx_bz_d*(a: M128i): M128i {.importc: "__lsx_bz_d".}

## [Macro Original]
## #define __lsx_bz_h(/*__m128i*/ _1) \
## ((int)__builtin_lsx_bz_h ((v8u16)(_1)))
func lsx_bz_h*(a: M128i): M128i {.importc: "__lsx_bz_h".}

## [Macro Original]
## #define __lsx_bz_v(/*__m128i*/ _1) \
## ((int)__builtin_lsx_bz_v ((v16u8)(_1)))
func lsx_bz_v*(a: M128i): M128i {.importc: "__lsx_bz_v".}

## [Macro Original]
## #define __lsx_bz_w(/*__m128i*/ _1) \
## ((int)__builtin_lsx_bz_w ((v4u32)(_1)))
func lsx_bz_w*(a: M128i): M128i {.importc: "__lsx_bz_w".}

func lsx_vfcmp_caf_d*(a: M128d, b: M128d): M128i {.importc: "__lsx_vfcmp_caf_d".}

func lsx_vfcmp_caf_s*(a: M128, b: M128): M128i {.importc: "__lsx_vfcmp_caf_s".}

func lsx_vfcmp_ceq_d*(a: M128d, b: M128d): M128i {.importc: "__lsx_vfcmp_ceq_d".}

func lsx_vfcmp_ceq_s*(a: M128, b: M128): M128i {.importc: "__lsx_vfcmp_ceq_s".}

func lsx_vfcmp_cle_d*(a: M128d, b: M128d): M128i {.importc: "__lsx_vfcmp_cle_d".}

func lsx_vfcmp_cle_s*(a: M128, b: M128): M128i {.importc: "__lsx_vfcmp_cle_s".}

func lsx_vfcmp_clt_d*(a: M128d, b: M128d): M128i {.importc: "__lsx_vfcmp_clt_d".}

func lsx_vfcmp_clt_s*(a: M128, b: M128): M128i {.importc: "__lsx_vfcmp_clt_s".}

func lsx_vfcmp_cne_d*(a: M128d, b: M128d): M128i {.importc: "__lsx_vfcmp_cne_d".}

func lsx_vfcmp_cne_s*(a: M128, b: M128): M128i {.importc: "__lsx_vfcmp_cne_s".}

func lsx_vfcmp_cor_d*(a: M128d, b: M128d): M128i {.importc: "__lsx_vfcmp_cor_d".}

func lsx_vfcmp_cor_s*(a: M128, b: M128): M128i {.importc: "__lsx_vfcmp_cor_s".}

func lsx_vfcmp_cueq_d*(a: M128d, b: M128d): M128i {.importc: "__lsx_vfcmp_cueq_d".}

func lsx_vfcmp_cueq_s*(a: M128, b: M128): M128i {.importc: "__lsx_vfcmp_cueq_s".}

func lsx_vfcmp_cule_d*(a: M128d, b: M128d): M128i {.importc: "__lsx_vfcmp_cule_d".}

func lsx_vfcmp_cule_s*(a: M128, b: M128): M128i {.importc: "__lsx_vfcmp_cule_s".}

func lsx_vfcmp_cult_d*(a: M128d, b: M128d): M128i {.importc: "__lsx_vfcmp_cult_d".}

func lsx_vfcmp_cult_s*(a: M128, b: M128): M128i {.importc: "__lsx_vfcmp_cult_s".}

func lsx_vfcmp_cun_d*(a: M128d, b: M128d): M128i {.importc: "__lsx_vfcmp_cun_d".}

func lsx_vfcmp_cune_d*(a: M128d, b: M128d): M128i {.importc: "__lsx_vfcmp_cune_d".}

func lsx_vfcmp_cune_s*(a: M128, b: M128): M128i {.importc: "__lsx_vfcmp_cune_s".}

func lsx_vfcmp_cun_s*(a: M128, b: M128): M128i {.importc: "__lsx_vfcmp_cun_s".}

func lsx_vfcmp_saf_d*(a: M128d, b: M128d): M128i {.importc: "__lsx_vfcmp_saf_d".}

func lsx_vfcmp_saf_s*(a: M128, b: M128): M128i {.importc: "__lsx_vfcmp_saf_s".}

func lsx_vfcmp_seq_d*(a: M128d, b: M128d): M128i {.importc: "__lsx_vfcmp_seq_d".}

func lsx_vfcmp_seq_s*(a: M128, b: M128): M128i {.importc: "__lsx_vfcmp_seq_s".}

func lsx_vfcmp_sle_d*(a: M128d, b: M128d): M128i {.importc: "__lsx_vfcmp_sle_d".}

func lsx_vfcmp_sle_s*(a: M128, b: M128): M128i {.importc: "__lsx_vfcmp_sle_s".}

func lsx_vfcmp_slt_d*(a: M128d, b: M128d): M128i {.importc: "__lsx_vfcmp_slt_d".}

func lsx_vfcmp_slt_s*(a: M128, b: M128): M128i {.importc: "__lsx_vfcmp_slt_s".}

func lsx_vfcmp_sne_d*(a: M128d, b: M128d): M128i {.importc: "__lsx_vfcmp_sne_d".}

func lsx_vfcmp_sne_s*(a: M128, b: M128): M128i {.importc: "__lsx_vfcmp_sne_s".}

func lsx_vfcmp_sor_d*(a: M128d, b: M128d): M128i {.importc: "__lsx_vfcmp_sor_d".}

func lsx_vfcmp_sor_s*(a: M128, b: M128): M128i {.importc: "__lsx_vfcmp_sor_s".}

func lsx_vfcmp_sueq_d*(a: M128d, b: M128d): M128i {.importc: "__lsx_vfcmp_sueq_d".}

func lsx_vfcmp_sueq_s*(a: M128, b: M128): M128i {.importc: "__lsx_vfcmp_sueq_s".}

func lsx_vfcmp_sule_d*(a: M128d, b: M128d): M128i {.importc: "__lsx_vfcmp_sule_d".}

func lsx_vfcmp_sule_s*(a: M128, b: M128): M128i {.importc: "__lsx_vfcmp_sule_s".}

func lsx_vfcmp_sult_d*(a: M128d, b: M128d): M128i {.importc: "__lsx_vfcmp_sult_d".}

func lsx_vfcmp_sult_s*(a: M128, b: M128): M128i {.importc: "__lsx_vfcmp_sult_s".}

func lsx_vfcmp_sun_d*(a: M128d, b: M128d): M128i {.importc: "__lsx_vfcmp_sun_d".}

func lsx_vfcmp_sune_d*(a: M128d, b: M128d): M128i {.importc: "__lsx_vfcmp_sune_d".}

func lsx_vfcmp_sune_s*(a: M128, b: M128): M128i {.importc: "__lsx_vfcmp_sune_s".}

func lsx_vfcmp_sun_s*(a: M128, b: M128): M128i {.importc: "__lsx_vfcmp_sun_s".}

## [Macro Original]
## #define __lsx_vrepli_b(/*si10*/ _1) \
## ((__m128i)__builtin_lsx_vrepli_b ((_1)))
## func lsx_vrepli_b*(a: si10): M128i {.importc: "__lsx_vrepli_b".}

## [Macro Original]
## #define __lsx_vrepli_d(/*si10*/ _1) \
## ((__m128i)__builtin_lsx_vrepli_d ((_1)))
## func lsx_vrepli_d*(a: si10): M128i {.importc: "__lsx_vrepli_d".}

## [Macro Original]
## #define __lsx_vrepli_h(/*si10*/ _1) \
## ((__m128i)__builtin_lsx_vrepli_h ((_1)))
## func lsx_vrepli_h*(a: si10): M128i {.importc: "__lsx_vrepli_h".}

## [Macro Original]
## #define __lsx_vrepli_w(/*si10*/ _1) \
## ((__m128i)__builtin_lsx_vrepli_w ((_1)))
## func lsx_vrepli_w*(a: si10): M128i {.importc: "__lsx_vrepli_w".}
