type
  Int8x8* {.importc: "int8x8_t", header: "arm_neon.h", bycopy.} = object
  Int16x4* {.importc: "int16x4_t", header: "arm_neon.h", bycopy.} = object
  Int32x2* {.importc: "int32x2_t", header: "arm_neon.h", bycopy.} = object
  Int64x1* {.importc: "int64x1_t", header: "arm_neon.h", bycopy.} = object

  Uint8x8* {.importc: "uint8x8_t", header: "arm_neon.h", bycopy.} = object
  Uint16x4* {.importc: "uint16x4_t", header: "arm_neon.h", bycopy.} = object
  Uint32x2* {.importc: "uint32x2_t", header: "arm_neon.h", bycopy.} = object
  Uint64x1* {.importc: "uint64x1_t", header: "arm_neon.h", bycopy.} = object

  Float16x4* {.importc: "float16x4_t", header: "arm_neon.h", bycopy.} = object
  Float32x2* {.importc: "float32x2_t", header: "arm_neon.h", bycopy.} = object
  Float64x1* {.importc: "float64x1_t", header: "arm_neon.h", bycopy.} = object
  Bfloat16x4* {.importc: "bfloat16x4_t", header: "arm_neon.h", bycopy.} = object
  Mfloat8x8* {.importc: "mfloat8x8_t", header: "arm_neon.h", bycopy.} = object

  Poly8x8* {.importc: "poly8x8_t", header: "arm_neon.h", bycopy.} = object
  Poly16x4* {.importc: "poly16x4_t", header: "arm_neon.h", bycopy.} = object
  Poly64x1* {.importc: "poly64x1_t", header: "arm_neon.h", bycopy.} = object

  Int8x16* {.importc: "int8x16_t", header: "arm_neon.h", bycopy.} = object
  Int16x8* {.importc: "int16x8_t", header: "arm_neon.h", bycopy.} = object
  Int32x4* {.importc: "int32x4_t", header: "arm_neon.h", bycopy.} = object
  Int64x2* {.importc: "int64x2_t", header: "arm_neon.h", bycopy.} = object

  Uint8x16* {.importc: "uint8x16_t", header: "arm_neon.h", bycopy.} = object
  Uint16x8* {.importc: "uint16x8_t", header: "arm_neon.h", bycopy.} = object
  Uint32x4* {.importc: "uint32x4_t", header: "arm_neon.h", bycopy.} = object
  Uint64x2* {.importc: "uint64x2_t", header: "arm_neon.h", bycopy.} = object

  Float16x8* {.importc: "float16x8_t", header: "arm_neon.h", bycopy.} = object
  Float32x4* {.importc: "float32x4_t", header: "arm_neon.h", bycopy.} = object
  Float64x2* {.importc: "float64x2_t", header: "arm_neon.h", bycopy.} = object
  Bfloat16x8* {.importc: "bfloat16x8_t", header: "arm_neon.h", bycopy.} = object
  Mfloat8x16* {.importc: "mfloat8x16_t", header: "arm_neon.h", bycopy.} = object

  Poly8x16* {.importc: "poly8x16_t", header: "arm_neon.h", bycopy.} = object
  Poly16x8* {.importc: "poly16x8_t", header: "arm_neon.h", bycopy.} = object
  Poly64x2* {.importc: "poly64x2_t", header: "arm_neon.h", bycopy.} = object

  Poly8* {.importc: "poly8_t", header: "arm_neon.h".} = ptr uint8
  Poly16* {.importc: "poly16_t", header: "arm_neon.h".} = ptr uint16
  Poly64* {.importc: "poly64_t", header: "arm_neon.h".} = ptr uint64
  Poly128* {.importc: "poly128_t", header: "arm_neon.h".} = ptr uint64

  float16* {.importc: "float16_t", header: "arm_neon.h".} = uint16
  float32* {.importc: "float32_t", header: "arm_neon.h".} = float32
  float64* {.importc: "float64_t", header: "arm_neon.h".} = float64

  bfloat16* {.importc: "bfloat16_t", header: "arm_neon.h".} = uint16

  Int8x8x2* {.importc: "int8x8x2_t", header: "arm_neon.h".} = object
  Int16x4x2* {.importc: "int16x4x2_t", header: "arm_neon.h".} = object
  Int32x2x2* {.importc: "int32x2x2_t", header: "arm_neon.h".} = object
  Int64x1x2* {.importc: "int64x1x2_t", header: "arm_neon.h".} = object
  Uint8x8x2* {.importc: "uint8x8x2_t", header: "arm_neon.h".} = object
  Uint16x4x2* {.importc: "uint16x4x2_t", header: "arm_neon.h".} = object
  Uint32x2x2* {.importc: "uint32x2x2_t", header: "arm_neon.h".} = object
  Uint64x1x2* {.importc: "uint64x1x2_t", header: "arm_neon.h".} = object
  Float16x4x2* {.importc: "float16x4x2_t", header: "arm_neon.h".} = object
  Float32x2x2* {.importc: "float32x2x2_t", header: "arm_neon.h".} = object
  Float64x1x2* {.importc: "float64x1x2_t", header: "arm_neon.h".} = object
  Bfloat16x4x2* {.importc: "bfloat16x4x2_t", header: "arm_neon.h".} = object
  Poly8x8x2* {.importc: "poly8x8x2_t", header: "arm_neon.h".} = object
  Poly16x4x2* {.importc: "poly16x4x2_t", header: "arm_neon.h".} = object
  Poly32x2x2* {.importc: "poly32x2x2_t", header: "arm_neon.h".} = object
  Poly64x1x2* {.importc: "poly64x1x2_t", header: "arm_neon.h".} = object

  Int8x8x3* {.importc: "int8x8x3_t", header: "arm_neon.h".} = object
  Int16x4x3* {.importc: "int16x4x3_t", header: "arm_neon.h".} = object
  Int32x2x3* {.importc: "int32x2x3_t", header: "arm_neon.h".} = object
  Int64x1x3* {.importc: "int64x1x3_t", header: "arm_neon.h".} = object
  Uint8x8x3* {.importc: "uint8x8x3_t", header: "arm_neon.h".} = object
  Uint16x4x3* {.importc: "uint16x4x3_t", header: "arm_neon.h".} = object
  Uint32x2x3* {.importc: "uint32x2x3_t", header: "arm_neon.h".} = object
  Uint64x1x3* {.importc: "uint64x1x3_t", header: "arm_neon.h".} = object
  Float16x4x3* {.importc: "float16x4x3_t", header: "arm_neon.h".} = object
  Float32x2x3* {.importc: "float32x2x3_t", header: "arm_neon.h".} = object
  Float64x1x3* {.importc: "float64x1x3_t", header: "arm_neon.h".} = object
  Bfloat16x4x3* {.importc: "bfloat16x4x3_t", header: "arm_neon.h".} = object
  Poly8x8x3* {.importc: "poly8x8x3_t", header: "arm_neon.h".} = object
  Poly16x4x3* {.importc: "poly16x4x3_t", header: "arm_neon.h".} = object
  Poly32x2x3* {.importc: "poly32x2x3_t", header: "arm_neon.h".} = object
  Poly64x1x3* {.importc: "poly64x1x3_t", header: "arm_neon.h".} = object

  Int8x8x4* {.importc: "int8x8x4_t", header: "arm_neon.h".} = object
  Int16x4x4* {.importc: "int16x4x4_t", header: "arm_neon.h".} = object
  Int32x2x4* {.importc: "int32x2x4_t", header: "arm_neon.h".} = object
  Int64x1x4* {.importc: "int64x1x4_t", header: "arm_neon.h".} = object
  Uint8x8x4* {.importc: "uint8x8x4_t", header: "arm_neon.h".} = object
  Uint16x4x4* {.importc: "uint16x4x4_t", header: "arm_neon.h".} = object
  Uint32x2x4* {.importc: "uint32x2x4_t", header: "arm_neon.h".} = object
  Uint64x1x4* {.importc: "uint64x1x4_t", header: "arm_neon.h".} = object
  Float16x4x4* {.importc: "float16x4x4_t", header: "arm_neon.h".} = object
  Float32x2x4* {.importc: "float32x2x4_t", header: "arm_neon.h".} = object
  Float64x1x4* {.importc: "float64x1x4_t", header: "arm_neon.h".} = object
  Bfloat16x4x4* {.importc: "bfloat16x4x4_t", header: "arm_neon.h".} = object
  Poly8x8x4* {.importc: "poly8x8x4_t", header: "arm_neon.h".} = object
  Poly16x4x4* {.importc: "poly16x4x4_t", header: "arm_neon.h".} = object
  Poly32x2x4* {.importc: "poly32x2x4_t", header: "arm_neon.h".} = object
  Poly64x1x4* {.importc: "poly64x1x4_t", header: "arm_neon.h".} = object

  Int8x16x2* {.importc: "int8x16x2_t", header: "arm_neon.h".} = object
  Int16x8x2* {.importc: "int16x8x2_t", header: "arm_neon.h".} = object
  Int32x4x2* {.importc: "int32x4x2_t", header: "arm_neon.h".} = object
  Int64x2x2* {.importc: "int64x2x2_t", header: "arm_neon.h".} = object
  Uint8x16x2* {.importc: "uint8x16x2_t", header: "arm_neon.h".} = object
  Uint16x8x2* {.importc: "uint16x8x2_t", header: "arm_neon.h".} = object
  Uint32x4x2* {.importc: "uint32x4x2_t", header: "arm_neon.h".} = object
  Uint64x2x2* {.importc: "uint64x2x2_t", header: "arm_neon.h".} = object
  Float16x8x2* {.importc: "float16x8x2_t", header: "arm_neon.h".} = object
  Float32x4x2* {.importc: "float32x4x2_t", header: "arm_neon.h".} = object
  Float64x2x2* {.importc: "float64x2x2_t", header: "arm_neon.h".} = object
  Bfloat16x8x2* {.importc: "bfloat16x8x2_t", header: "arm_neon.h".} = object
  Poly8x16x2* {.importc: "poly8x16x2_t", header: "arm_neon.h".} = object
  Poly16x8x2* {.importc: "poly16x8x2_t", header: "arm_neon.h".} = object
  Poly64x2x2* {.importc: "poly64x2x2_t", header: "arm_neon.h".} = object

  Int8x16x3* {.importc: "int8x16x3_t", header: "arm_neon.h".} = object
  Int16x8x3* {.importc: "int16x8x3_t", header: "arm_neon.h".} = object
  Int32x4x3* {.importc: "int32x4x3_t", header: "arm_neon.h".} = object
  Int64x2x3* {.importc: "int64x2x3_t", header: "arm_neon.h".} = object
  Uint8x16x3* {.importc: "uint8x16x3_t", header: "arm_neon.h".} = object
  Uint16x8x3* {.importc: "uint16x8x3_t", header: "arm_neon.h".} = object
  Uint32x4x3* {.importc: "uint32x4x3_t", header: "arm_neon.h".} = object
  Uint64x2x3* {.importc: "uint64x2x3_t", header: "arm_neon.h".} = object
  Float16x8x3* {.importc: "float16x8x3_t", header: "arm_neon.h".} = object
  Float32x4x3* {.importc: "float32x4x3_t", header: "arm_neon.h".} = object
  Float64x2x3* {.importc: "float64x2x3_t", header: "arm_neon.h".} = object
  Bfloat16x8x3* {.importc: "bfloat16x8x3_t", header: "arm_neon.h".} = object
  Poly8x16x3* {.importc: "poly8x16x3_t", header: "arm_neon.h".} = object
  Poly16x8x3* {.importc: "poly16x8x3_t", header: "arm_neon.h".} = object
  Poly64x2x3* {.importc: "poly64x2x3_t", header: "arm_neon.h".} = object

  Int8x16x4* {.importc: "int8x16x4_t", header: "arm_neon.h".} = object
  Int16x8x4* {.importc: "int16x8x4_t", header: "arm_neon.h".} = object
  Int32x4x4* {.importc: "int32x4x4_t", header: "arm_neon.h".} = object
  Int64x2x4* {.importc: "int64x2x4_t", header: "arm_neon.h".} = object
  Uint8x16x4* {.importc: "uint8x16x4_t", header: "arm_neon.h".} = object
  Uint16x8x4* {.importc: "uint16x8x4_t", header: "arm_neon.h".} = object
  Uint32x4x4* {.importc: "uint32x4x4_t", header: "arm_neon.h".} = object
  Uint64x2x4* {.importc: "uint64x2x4_t", header: "arm_neon.h".} = object
  Float16x8x4* {.importc: "float16x8x4_t", header: "arm_neon.h".} = object
  Float32x4x4* {.importc: "float32x4x4_t", header: "arm_neon.h".} = object
  Float64x2x4* {.importc: "float64x2x4_t", header: "arm_neon.h".} = object
  Bfloat16x8x4* {.importc: "bfloat16x8x4_t", header: "arm_neon.h".} = object
  Poly8x16x4* {.importc: "poly8x16x4_t", header: "arm_neon.h".} = object
  Poly16x8x4* {.importc: "poly16x8x4_t", header: "arm_neon.h".} = object
  Poly64x2x4* {.importc: "poly64x2x4_t", header: "arm_neon.h".} = object

## [Macro Original]
## #define __AARCH64_UINT64_C(__C) ((uint64_t) __C)

## [Macro Original]
## #define __AARCH64_INT64_C(__C) ((int64_t) __C)

## [Macro Original]
## #define __aarch64_vdup_lane_any(__size, __q, __a, __b) \
## vdup##__q##_n_##__size (__aarch64_vget_lane_any (__a, __b))

## [Macro Original]
## #define __aarch64_vdup_lane_f16(__a, __b) \
## __aarch64_vdup_lane_any (f16, , __a, __b)

## [Macro Original]
## #define __aarch64_vdup_lane_f32(__a, __b) \
## __aarch64_vdup_lane_any (f32, , __a, __b)

## [Macro Original]
## #define __aarch64_vdup_lane_f64(__a, __b) \
## __aarch64_vdup_lane_any (f64, , __a, __b)

## [Macro Original]
## #define __aarch64_vdup_lane_p8(__a, __b) \
## __aarch64_vdup_lane_any (p8, , __a, __b)

## [Macro Original]
## #define __aarch64_vdup_lane_p16(__a, __b) \
## __aarch64_vdup_lane_any (p16, , __a, __b)

## [Macro Original]
## #define __aarch64_vdup_lane_p64(__a, __b) \
## __aarch64_vdup_lane_any (p64, , __a, __b)

## [Macro Original]
## #define __aarch64_vdup_lane_s8(__a, __b) \
## __aarch64_vdup_lane_any (s8, , __a, __b)

## [Macro Original]
## #define __aarch64_vdup_lane_s16(__a, __b) \
## __aarch64_vdup_lane_any (s16, , __a, __b)

## [Macro Original]
## #define __aarch64_vdup_lane_s32(__a, __b) \
## __aarch64_vdup_lane_any (s32, , __a, __b)

## [Macro Original]
## #define __aarch64_vdup_lane_s64(__a, __b) \
## __aarch64_vdup_lane_any (s64, , __a, __b)

## [Macro Original]
## #define __aarch64_vdup_lane_u8(__a, __b) \
## __aarch64_vdup_lane_any (u8, , __a, __b)

## [Macro Original]
## #define __aarch64_vdup_lane_u16(__a, __b) \
## __aarch64_vdup_lane_any (u16, , __a, __b)

## [Macro Original]
## #define __aarch64_vdup_lane_u32(__a, __b) \
## __aarch64_vdup_lane_any (u32, , __a, __b)

## [Macro Original]
## #define __aarch64_vdup_lane_u64(__a, __b) \
## __aarch64_vdup_lane_any (u64, , __a, __b)

## [Macro Original]
## #define __aarch64_vdup_laneq_f16(__a, __b) \
## __aarch64_vdup_lane_any (f16, , __a, __b)

## [Macro Original]
## #define __aarch64_vdup_laneq_f32(__a, __b) \
## __aarch64_vdup_lane_any (f32, , __a, __b)

## [Macro Original]
## #define __aarch64_vdup_laneq_f64(__a, __b) \
## __aarch64_vdup_lane_any (f64, , __a, __b)

## [Macro Original]
## #define __aarch64_vdup_laneq_p8(__a, __b) \
## __aarch64_vdup_lane_any (p8, , __a, __b)

## [Macro Original]
## #define __aarch64_vdup_laneq_p16(__a, __b) \
## __aarch64_vdup_lane_any (p16, , __a, __b)

## [Macro Original]
## #define __aarch64_vdup_laneq_p64(__a, __b) \
## __aarch64_vdup_lane_any (p64, , __a, __b)

## [Macro Original]
## #define __aarch64_vdup_laneq_s8(__a, __b) \
## __aarch64_vdup_lane_any (s8, , __a, __b)

## [Macro Original]
## #define __aarch64_vdup_laneq_s16(__a, __b) \
## __aarch64_vdup_lane_any (s16, , __a, __b)

## [Macro Original]
## #define __aarch64_vdup_laneq_s32(__a, __b) \
## __aarch64_vdup_lane_any (s32, , __a, __b)

## [Macro Original]
## #define __aarch64_vdup_laneq_s64(__a, __b) \
## __aarch64_vdup_lane_any (s64, , __a, __b)

## [Macro Original]
## #define __aarch64_vdup_laneq_u8(__a, __b) \
## __aarch64_vdup_lane_any (u8, , __a, __b)

## [Macro Original]
## #define __aarch64_vdup_laneq_u16(__a, __b) \
## __aarch64_vdup_lane_any (u16, , __a, __b)

## [Macro Original]
## #define __aarch64_vdup_laneq_u32(__a, __b) \
## __aarch64_vdup_lane_any (u32, , __a, __b)

## [Macro Original]
## #define __aarch64_vdup_laneq_u64(__a, __b) \
## __aarch64_vdup_lane_any (u64, , __a, __b)

## [Macro Original]
## #define __aarch64_vdupq_lane_f16(__a, __b) \
## __aarch64_vdup_lane_any (f16, q, __a, __b)

## [Macro Original]
## #define __aarch64_vdupq_lane_f32(__a, __b) \
## __aarch64_vdup_lane_any (f32, q, __a, __b)

## [Macro Original]
## #define __aarch64_vdupq_lane_f64(__a, __b) \
## __aarch64_vdup_lane_any (f64, q, __a, __b)

## [Macro Original]
## #define __aarch64_vdupq_lane_p8(__a, __b) \
## __aarch64_vdup_lane_any (p8, q, __a, __b)

## [Macro Original]
## #define __aarch64_vdupq_lane_p16(__a, __b) \
## __aarch64_vdup_lane_any (p16, q, __a, __b)

## [Macro Original]
## #define __aarch64_vdupq_lane_p64(__a, __b) \
## __aarch64_vdup_lane_any (p64, q, __a, __b)

## [Macro Original]
## #define __aarch64_vdupq_lane_s8(__a, __b) \
## __aarch64_vdup_lane_any (s8, q, __a, __b)

## [Macro Original]
## #define __aarch64_vdupq_lane_s16(__a, __b) \
## __aarch64_vdup_lane_any (s16, q, __a, __b)

## [Macro Original]
## #define __aarch64_vdupq_lane_s32(__a, __b) \
## __aarch64_vdup_lane_any (s32, q, __a, __b)

## [Macro Original]
## #define __aarch64_vdupq_lane_s64(__a, __b) \
## __aarch64_vdup_lane_any (s64, q, __a, __b)

## [Macro Original]
## #define __aarch64_vdupq_lane_u8(__a, __b) \
## __aarch64_vdup_lane_any (u8, q, __a, __b)

## [Macro Original]
## #define __aarch64_vdupq_lane_u16(__a, __b) \
## __aarch64_vdup_lane_any (u16, q, __a, __b)

## [Macro Original]
## #define __aarch64_vdupq_lane_u32(__a, __b) \
## __aarch64_vdup_lane_any (u32, q, __a, __b)

## [Macro Original]
## #define __aarch64_vdupq_lane_u64(__a, __b) \
## __aarch64_vdup_lane_any (u64, q, __a, __b)

## [Macro Original]
## #define __aarch64_vdupq_laneq_f16(__a, __b) \
## __aarch64_vdup_lane_any (f16, q, __a, __b)

## [Macro Original]
## #define __aarch64_vdupq_laneq_f32(__a, __b) \
## __aarch64_vdup_lane_any (f32, q, __a, __b)

## [Macro Original]
## #define __aarch64_vdupq_laneq_f64(__a, __b) \
## __aarch64_vdup_lane_any (f64, q, __a, __b)

## [Macro Original]
## #define __aarch64_vdupq_laneq_p8(__a, __b) \
## __aarch64_vdup_lane_any (p8, q, __a, __b)

## [Macro Original]
## #define __aarch64_vdupq_laneq_p16(__a, __b) \
## __aarch64_vdup_lane_any (p16, q, __a, __b)

## [Macro Original]
## #define __aarch64_vdupq_laneq_p64(__a, __b) \
## __aarch64_vdup_lane_any (p64, q, __a, __b)

## [Macro Original]
## #define __aarch64_vdupq_laneq_s8(__a, __b) \
## __aarch64_vdup_lane_any (s8, q, __a, __b)

## [Macro Original]
## #define __aarch64_vdupq_laneq_s16(__a, __b) \
## __aarch64_vdup_lane_any (s16, q, __a, __b)

## [Macro Original]
## #define __aarch64_vdupq_laneq_s32(__a, __b) \
## __aarch64_vdup_lane_any (s32, q, __a, __b)

## [Macro Original]
## #define __aarch64_vdupq_laneq_s64(__a, __b) \
## __aarch64_vdup_lane_any (s64, q, __a, __b)

## [Macro Original]
## #define __aarch64_vdupq_laneq_u8(__a, __b) \
## __aarch64_vdup_lane_any (u8, q, __a, __b)

## [Macro Original]
## #define __aarch64_vdupq_laneq_u16(__a, __b) \
## __aarch64_vdup_lane_any (u16, q, __a, __b)

## [Macro Original]
## #define __aarch64_vdupq_laneq_u32(__a, __b) \
## __aarch64_vdup_lane_any (u32, q, __a, __b)

## [Macro Original]
## #define __aarch64_vdupq_laneq_u64(__a, __b) \
## __aarch64_vdup_lane_any (u64, q, __a, __b)

## [Macro Original]
## #define __AARCH64_NUM_LANES(__v) (sizeof (__v) / sizeof (__v[0]))

## [Macro Original]
## #define __AARCH64_LANE_CHECK(__vec, __idx)	\
## __builtin_aarch64_im_lane_boundsi (sizeof(__vec), sizeof(__vec[0]), __idx)

## [Macro Original]
## #define __aarch64_lane(__vec, __idx) (__AARCH64_NUM_LANES (__vec) - 1 - __idx)

## [Macro Original]
## #define __aarch64_lane(__vec, __idx) __idx

## [Macro Original]
## #define __aarch64_vget_lane_any(__vec, __index)				\
## __extension__								\
## ({									\
## __AARCH64_LANE_CHECK (__vec, __index);				\
## __vec[__aarch64_lane (__vec, __index)];				\
## })

## [Macro Original]
## #define __aarch64_vset_lane_any(__elem, __vec, __index)			\
## __extension__								\
## ({									\
## __AARCH64_LANE_CHECK (__vec, __index);				\
## __vec[__aarch64_lane (__vec, __index)] = __elem;			\
## __vec;								\
## })

func vadd_s8*(a: Int8x8, b: Int8x8): Int8x8 {.importc: "vadd_s8".}

func vadd_s16*(a: Int16x4, b: Int16x4): Int16x4 {.importc: "vadd_s16".}

func vadd_s32*(a: Int32x2, b: Int32x2): Int32x2 {.importc: "vadd_s32".}

func vadd_f32*(a: Float32x2, b: Float32x2): Float32x2 {.importc: "vadd_f32".}

func vadd_f64*(a: Float64x1, b: Float64x1): Float64x1 {.importc: "vadd_f64".}

func vadd_u8*(a: Uint8x8, b: Uint8x8): Uint8x8 {.importc: "vadd_u8".}

func vadd_u16*(a: Uint16x4, b: Uint16x4): Uint16x4 {.importc: "vadd_u16".}

func vadd_u32*(a: Uint32x2, b: Uint32x2): Uint32x2 {.importc: "vadd_u32".}

func vadd_s64*(a: Int64x1, b: Int64x1): Int64x1 {.importc: "vadd_s64".}

func vadd_u64*(a: Uint64x1, b: Uint64x1): Uint64x1 {.importc: "vadd_u64".}

func vaddq_s8*(a: Int8x16, b: Int8x16): Int8x16 {.importc: "vaddq_s8".}

func vaddq_s16*(a: Int16x8, b: Int16x8): Int16x8 {.importc: "vaddq_s16".}

func vaddq_s32*(a: Int32x4, b: Int32x4): Int32x4 {.importc: "vaddq_s32".}

func vaddq_s64*(a: Int64x2, b: Int64x2): Int64x2 {.importc: "vaddq_s64".}

func vaddq_f32*(a: Float32x4, b: Float32x4): Float32x4 {.importc: "vaddq_f32".}

func vaddq_f64*(a: Float64x2, b: Float64x2): Float64x2 {.importc: "vaddq_f64".}

func vaddq_u8*(a: Uint8x16, b: Uint8x16): Uint8x16 {.importc: "vaddq_u8".}

func vaddq_u16*(a: Uint16x8, b: Uint16x8): Uint16x8 {.importc: "vaddq_u16".}

func vaddq_u32*(a: Uint32x4, b: Uint32x4): Uint32x4 {.importc: "vaddq_u32".}

func vaddq_u64*(a: Uint64x2, b: Uint64x2): Uint64x2 {.importc: "vaddq_u64".}

func vaddl_s8*(a: Int8x8, b: Int8x8): Int16x8 {.importc: "vaddl_s8".}

func vaddl_s16*(a: Int16x4, b: Int16x4): Int32x4 {.importc: "vaddl_s16".}

func vaddl_s32*(a: Int32x2, b: Int32x2): Int64x2 {.importc: "vaddl_s32".}

func vaddl_u8*(a: Uint8x8, b: Uint8x8): Uint16x8 {.importc: "vaddl_u8".}

func vaddl_u16*(a: Uint16x4, b: Uint16x4): Uint32x4 {.importc: "vaddl_u16".}

func vaddl_u32*(a: Uint32x2, b: Uint32x2): Uint64x2 {.importc: "vaddl_u32".}

func vaddl_high_s8*(a: Int8x16, b: Int8x16): Int16x8 {.importc: "vaddl_high_s8".}

func vaddl_high_s16*(a: Int16x8, b: Int16x8): Int32x4 {.importc: "vaddl_high_s16".}

func vaddl_high_s32*(a: Int32x4, b: Int32x4): Int64x2 {.importc: "vaddl_high_s32".}

func vaddl_high_u8*(a: Uint8x16, b: Uint8x16): Uint16x8 {.importc: "vaddl_high_u8".}

func vaddl_high_u16*(a: Uint16x8, b: Uint16x8): Uint32x4 {.importc: "vaddl_high_u16".}

func vaddl_high_u32*(a: Uint32x4, b: Uint32x4): Uint64x2 {.importc: "vaddl_high_u32".}

func vaddw_s8*(a: Int16x8, b: Int8x8): Int16x8 {.importc: "vaddw_s8".}

func vaddw_s16*(a: Int32x4, b: Int16x4): Int32x4 {.importc: "vaddw_s16".}

func vaddw_s32*(a: Int64x2, b: Int32x2): Int64x2 {.importc: "vaddw_s32".}

func vaddw_u8*(a: Uint16x8, b: Uint8x8): Uint16x8 {.importc: "vaddw_u8".}

func vaddw_u16*(a: Uint32x4, b: Uint16x4): Uint32x4 {.importc: "vaddw_u16".}

func vaddw_u32*(a: Uint64x2, b: Uint32x2): Uint64x2 {.importc: "vaddw_u32".}

func vaddw_high_s8*(a: Int16x8, b: Int8x16): Int16x8 {.importc: "vaddw_high_s8".}

func vaddw_high_s16*(a: Int32x4, b: Int16x8): Int32x4 {.importc: "vaddw_high_s16".}

func vaddw_high_s32*(a: Int64x2, b: Int32x4): Int64x2 {.importc: "vaddw_high_s32".}

func vaddw_high_u8*(a: Uint16x8, b: Uint8x16): Uint16x8 {.importc: "vaddw_high_u8".}

func vaddw_high_u16*(a: Uint32x4, b: Uint16x8): Uint32x4 {.importc: "vaddw_high_u16".}

func vaddw_high_u32*(a: Uint64x2, b: Uint32x4): Uint64x2 {.importc: "vaddw_high_u32".}

func vhadd_s8*(a: Int8x8, b: Int8x8): Int8x8 {.importc: "vhadd_s8".}

func vhadd_s16*(a: Int16x4, b: Int16x4): Int16x4 {.importc: "vhadd_s16".}

func vhadd_s32*(a: Int32x2, b: Int32x2): Int32x2 {.importc: "vhadd_s32".}

func vhadd_u8*(a: Uint8x8, b: Uint8x8): Uint8x8 {.importc: "vhadd_u8".}

func vhadd_u16*(a: Uint16x4, b: Uint16x4): Uint16x4 {.importc: "vhadd_u16".}

func vhadd_u32*(a: Uint32x2, b: Uint32x2): Uint32x2 {.importc: "vhadd_u32".}

func vhaddq_s8*(a: Int8x16, b: Int8x16): Int8x16 {.importc: "vhaddq_s8".}

func vhaddq_s16*(a: Int16x8, b: Int16x8): Int16x8 {.importc: "vhaddq_s16".}

func vhaddq_s32*(a: Int32x4, b: Int32x4): Int32x4 {.importc: "vhaddq_s32".}

func vhaddq_u8*(a: Uint8x16, b: Uint8x16): Uint8x16 {.importc: "vhaddq_u8".}

func vhaddq_u16*(a: Uint16x8, b: Uint16x8): Uint16x8 {.importc: "vhaddq_u16".}

func vhaddq_u32*(a: Uint32x4, b: Uint32x4): Uint32x4 {.importc: "vhaddq_u32".}

func vrhadd_s8*(a: Int8x8, b: Int8x8): Int8x8 {.importc: "vrhadd_s8".}

func vrhadd_s16*(a: Int16x4, b: Int16x4): Int16x4 {.importc: "vrhadd_s16".}

func vrhadd_s32*(a: Int32x2, b: Int32x2): Int32x2 {.importc: "vrhadd_s32".}

func vrhadd_u8*(a: Uint8x8, b: Uint8x8): Uint8x8 {.importc: "vrhadd_u8".}

func vrhadd_u16*(a: Uint16x4, b: Uint16x4): Uint16x4 {.importc: "vrhadd_u16".}

func vrhadd_u32*(a: Uint32x2, b: Uint32x2): Uint32x2 {.importc: "vrhadd_u32".}

func vrhaddq_s8*(a: Int8x16, b: Int8x16): Int8x16 {.importc: "vrhaddq_s8".}

func vrhaddq_s16*(a: Int16x8, b: Int16x8): Int16x8 {.importc: "vrhaddq_s16".}

func vrhaddq_s32*(a: Int32x4, b: Int32x4): Int32x4 {.importc: "vrhaddq_s32".}

func vrhaddq_u8*(a: Uint8x16, b: Uint8x16): Uint8x16 {.importc: "vrhaddq_u8".}

func vrhaddq_u16*(a: Uint16x8, b: Uint16x8): Uint16x8 {.importc: "vrhaddq_u16".}

func vrhaddq_u32*(a: Uint32x4, b: Uint32x4): Uint32x4 {.importc: "vrhaddq_u32".}

func vaddhn_s16*(a: Int16x8, b: Int16x8): Int8x8 {.importc: "vaddhn_s16".}

func vaddhn_s32*(a: Int32x4, b: Int32x4): Int16x4 {.importc: "vaddhn_s32".}

func vaddhn_s64*(a: Int64x2, b: Int64x2): Int32x2 {.importc: "vaddhn_s64".}

func vaddhn_u16*(a: Uint16x8, b: Uint16x8): Uint8x8 {.importc: "vaddhn_u16".}

func vaddhn_u32*(a: Uint32x4, b: Uint32x4): Uint16x4 {.importc: "vaddhn_u32".}

func vaddhn_u64*(a: Uint64x2, b: Uint64x2): Uint32x2 {.importc: "vaddhn_u64".}

func vraddhn_s16*(a: Int16x8, b: Int16x8): Int8x8 {.importc: "vraddhn_s16".}

func vraddhn_s32*(a: Int32x4, b: Int32x4): Int16x4 {.importc: "vraddhn_s32".}

func vraddhn_s64*(a: Int64x2, b: Int64x2): Int32x2 {.importc: "vraddhn_s64".}

func vraddhn_u16*(a: Uint16x8, b: Uint16x8): Uint8x8 {.importc: "vraddhn_u16".}

func vraddhn_u32*(a: Uint32x4, b: Uint32x4): Uint16x4 {.importc: "vraddhn_u32".}

func vraddhn_u64*(a: Uint64x2, b: Uint64x2): Uint32x2 {.importc: "vraddhn_u64".}

func vaddhn_high_s16*(a: Int8x8, b: Int16x8, c: Int16x8): Int8x16 {.importc: "vaddhn_high_s16".}

func vaddhn_high_s32*(a: Int16x4, b: Int32x4, c: Int32x4): Int16x8 {.importc: "vaddhn_high_s32".}

func vaddhn_high_s64*(a: Int32x2, b: Int64x2, c: Int64x2): Int32x4 {.importc: "vaddhn_high_s64".}

func vaddhn_high_u16*(a: Uint8x8, b: Uint16x8, c: Uint16x8): Uint8x16 {.importc: "vaddhn_high_u16".}

func vaddhn_high_u32*(a: Uint16x4, b: Uint32x4, c: Uint32x4): Uint16x8 {.importc: "vaddhn_high_u32".}

func vaddhn_high_u64*(a: Uint32x2, b: Uint64x2, c: Uint64x2): Uint32x4 {.importc: "vaddhn_high_u64".}

func vraddhn_high_s16*(a: Int8x8, b: Int16x8, c: Int16x8): Int8x16 {.importc: "vraddhn_high_s16".}

func vraddhn_high_s32*(a: Int16x4, b: Int32x4, c: Int32x4): Int16x8 {.importc: "vraddhn_high_s32".}

func vraddhn_high_s64*(a: Int32x2, b: Int64x2, c: Int64x2): Int32x4 {.importc: "vraddhn_high_s64".}

func vraddhn_high_u16*(a: Uint8x8, b: Uint16x8, c: Uint16x8): Uint8x16 {.importc: "vraddhn_high_u16".}

func vraddhn_high_u32*(a: Uint16x4, b: Uint32x4, c: Uint32x4): Uint16x8 {.importc: "vraddhn_high_u32".}

func vraddhn_high_u64*(a: Uint32x2, b: Uint64x2, c: Uint64x2): Uint32x4 {.importc: "vraddhn_high_u64".}

func vdiv_f32*(a: Float32x2, b: Float32x2): Float32x2 {.importc: "vdiv_f32".}

func vdiv_f64*(a: Float64x1, b: Float64x1): Float64x1 {.importc: "vdiv_f64".}

func vdivq_f32*(a: Float32x4, b: Float32x4): Float32x4 {.importc: "vdivq_f32".}

func vdivq_f64*(a: Float64x2, b: Float64x2): Float64x2 {.importc: "vdivq_f64".}

func vmul_s8*(a: Int8x8, b: Int8x8): Int8x8 {.importc: "vmul_s8".}

func vmul_s16*(a: Int16x4, b: Int16x4): Int16x4 {.importc: "vmul_s16".}

func vmul_s32*(a: Int32x2, b: Int32x2): Int32x2 {.importc: "vmul_s32".}

func vmul_f32*(a: Float32x2, b: Float32x2): Float32x2 {.importc: "vmul_f32".}

func vmul_f64*(a: Float64x1, b: Float64x1): Float64x1 {.importc: "vmul_f64".}

func vmul_u8*(a: Uint8x8, b: Uint8x8): Uint8x8 {.importc: "vmul_u8".}

func vmul_u16*(a: Uint16x4, b: Uint16x4): Uint16x4 {.importc: "vmul_u16".}

func vmul_u32*(a: Uint32x2, b: Uint32x2): Uint32x2 {.importc: "vmul_u32".}

func vmul_p8*(a: Poly8x8, b: Poly8x8): Poly8x8 {.importc: "vmul_p8".}

func vmulq_s8*(a: Int8x16, b: Int8x16): Int8x16 {.importc: "vmulq_s8".}

func vmulq_s16*(a: Int16x8, b: Int16x8): Int16x8 {.importc: "vmulq_s16".}

func vmulq_s32*(a: Int32x4, b: Int32x4): Int32x4 {.importc: "vmulq_s32".}

func vmulq_f32*(a: Float32x4, b: Float32x4): Float32x4 {.importc: "vmulq_f32".}

func vmulq_f64*(a: Float64x2, b: Float64x2): Float64x2 {.importc: "vmulq_f64".}

func vmulq_u8*(a: Uint8x16, b: Uint8x16): Uint8x16 {.importc: "vmulq_u8".}

func vmulq_u16*(a: Uint16x8, b: Uint16x8): Uint16x8 {.importc: "vmulq_u16".}

func vmulq_u32*(a: Uint32x4, b: Uint32x4): Uint32x4 {.importc: "vmulq_u32".}

func vmulq_p8*(a: Poly8x16, b: Poly8x16): Poly8x16 {.importc: "vmulq_p8".}

func vand_s8*(a: Int8x8, b: Int8x8): Int8x8 {.importc: "vand_s8".}

func vand_s16*(a: Int16x4, b: Int16x4): Int16x4 {.importc: "vand_s16".}

func vand_s32*(a: Int32x2, b: Int32x2): Int32x2 {.importc: "vand_s32".}

func vand_u8*(a: Uint8x8, b: Uint8x8): Uint8x8 {.importc: "vand_u8".}

func vand_u16*(a: Uint16x4, b: Uint16x4): Uint16x4 {.importc: "vand_u16".}

func vand_u32*(a: Uint32x2, b: Uint32x2): Uint32x2 {.importc: "vand_u32".}

func vand_s64*(a: Int64x1, b: Int64x1): Int64x1 {.importc: "vand_s64".}

func vand_u64*(a: Uint64x1, b: Uint64x1): Uint64x1 {.importc: "vand_u64".}

func vandq_s8*(a: Int8x16, b: Int8x16): Int8x16 {.importc: "vandq_s8".}

func vandq_s16*(a: Int16x8, b: Int16x8): Int16x8 {.importc: "vandq_s16".}

func vandq_s32*(a: Int32x4, b: Int32x4): Int32x4 {.importc: "vandq_s32".}

func vandq_s64*(a: Int64x2, b: Int64x2): Int64x2 {.importc: "vandq_s64".}

func vandq_u8*(a: Uint8x16, b: Uint8x16): Uint8x16 {.importc: "vandq_u8".}

func vandq_u16*(a: Uint16x8, b: Uint16x8): Uint16x8 {.importc: "vandq_u16".}

func vandq_u32*(a: Uint32x4, b: Uint32x4): Uint32x4 {.importc: "vandq_u32".}

func vandq_u64*(a: Uint64x2, b: Uint64x2): Uint64x2 {.importc: "vandq_u64".}

func vorr_s8*(a: Int8x8, b: Int8x8): Int8x8 {.importc: "vorr_s8".}

func vorr_s16*(a: Int16x4, b: Int16x4): Int16x4 {.importc: "vorr_s16".}

func vorr_s32*(a: Int32x2, b: Int32x2): Int32x2 {.importc: "vorr_s32".}

func vorr_u8*(a: Uint8x8, b: Uint8x8): Uint8x8 {.importc: "vorr_u8".}

func vorr_u16*(a: Uint16x4, b: Uint16x4): Uint16x4 {.importc: "vorr_u16".}

func vorr_u32*(a: Uint32x2, b: Uint32x2): Uint32x2 {.importc: "vorr_u32".}

func vorr_s64*(a: Int64x1, b: Int64x1): Int64x1 {.importc: "vorr_s64".}

func vorr_u64*(a: Uint64x1, b: Uint64x1): Uint64x1 {.importc: "vorr_u64".}

func vorrq_s8*(a: Int8x16, b: Int8x16): Int8x16 {.importc: "vorrq_s8".}

func vorrq_s16*(a: Int16x8, b: Int16x8): Int16x8 {.importc: "vorrq_s16".}

func vorrq_s32*(a: Int32x4, b: Int32x4): Int32x4 {.importc: "vorrq_s32".}

func vorrq_s64*(a: Int64x2, b: Int64x2): Int64x2 {.importc: "vorrq_s64".}

func vorrq_u8*(a: Uint8x16, b: Uint8x16): Uint8x16 {.importc: "vorrq_u8".}

func vorrq_u16*(a: Uint16x8, b: Uint16x8): Uint16x8 {.importc: "vorrq_u16".}

func vorrq_u32*(a: Uint32x4, b: Uint32x4): Uint32x4 {.importc: "vorrq_u32".}

func vorrq_u64*(a: Uint64x2, b: Uint64x2): Uint64x2 {.importc: "vorrq_u64".}

func veor_s8*(a: Int8x8, b: Int8x8): Int8x8 {.importc: "veor_s8".}

func veor_s16*(a: Int16x4, b: Int16x4): Int16x4 {.importc: "veor_s16".}

func veor_s32*(a: Int32x2, b: Int32x2): Int32x2 {.importc: "veor_s32".}

func veor_u8*(a: Uint8x8, b: Uint8x8): Uint8x8 {.importc: "veor_u8".}

func veor_u16*(a: Uint16x4, b: Uint16x4): Uint16x4 {.importc: "veor_u16".}

func veor_u32*(a: Uint32x2, b: Uint32x2): Uint32x2 {.importc: "veor_u32".}

func veor_s64*(a: Int64x1, b: Int64x1): Int64x1 {.importc: "veor_s64".}

func veor_u64*(a: Uint64x1, b: Uint64x1): Uint64x1 {.importc: "veor_u64".}

func veorq_s8*(a: Int8x16, b: Int8x16): Int8x16 {.importc: "veorq_s8".}

func veorq_s16*(a: Int16x8, b: Int16x8): Int16x8 {.importc: "veorq_s16".}

func veorq_s32*(a: Int32x4, b: Int32x4): Int32x4 {.importc: "veorq_s32".}

func veorq_s64*(a: Int64x2, b: Int64x2): Int64x2 {.importc: "veorq_s64".}

func veorq_u8*(a: Uint8x16, b: Uint8x16): Uint8x16 {.importc: "veorq_u8".}

func veorq_u16*(a: Uint16x8, b: Uint16x8): Uint16x8 {.importc: "veorq_u16".}

func veorq_u32*(a: Uint32x4, b: Uint32x4): Uint32x4 {.importc: "veorq_u32".}

func veorq_u64*(a: Uint64x2, b: Uint64x2): Uint64x2 {.importc: "veorq_u64".}

func vbic_s8*(a: Int8x8, b: Int8x8): Int8x8 {.importc: "vbic_s8".}

func vbic_s16*(a: Int16x4, b: Int16x4): Int16x4 {.importc: "vbic_s16".}

func vbic_s32*(a: Int32x2, b: Int32x2): Int32x2 {.importc: "vbic_s32".}

func vbic_u8*(a: Uint8x8, b: Uint8x8): Uint8x8 {.importc: "vbic_u8".}

func vbic_u16*(a: Uint16x4, b: Uint16x4): Uint16x4 {.importc: "vbic_u16".}

func vbic_u32*(a: Uint32x2, b: Uint32x2): Uint32x2 {.importc: "vbic_u32".}

func vbic_s64*(a: Int64x1, b: Int64x1): Int64x1 {.importc: "vbic_s64".}

func vbic_u64*(a: Uint64x1, b: Uint64x1): Uint64x1 {.importc: "vbic_u64".}

func vbicq_s8*(a: Int8x16, b: Int8x16): Int8x16 {.importc: "vbicq_s8".}

func vbicq_s16*(a: Int16x8, b: Int16x8): Int16x8 {.importc: "vbicq_s16".}

func vbicq_s32*(a: Int32x4, b: Int32x4): Int32x4 {.importc: "vbicq_s32".}

func vbicq_s64*(a: Int64x2, b: Int64x2): Int64x2 {.importc: "vbicq_s64".}

func vbicq_u8*(a: Uint8x16, b: Uint8x16): Uint8x16 {.importc: "vbicq_u8".}

func vbicq_u16*(a: Uint16x8, b: Uint16x8): Uint16x8 {.importc: "vbicq_u16".}

func vbicq_u32*(a: Uint32x4, b: Uint32x4): Uint32x4 {.importc: "vbicq_u32".}

func vbicq_u64*(a: Uint64x2, b: Uint64x2): Uint64x2 {.importc: "vbicq_u64".}

func vorn_s8*(a: Int8x8, b: Int8x8): Int8x8 {.importc: "vorn_s8".}

func vorn_s16*(a: Int16x4, b: Int16x4): Int16x4 {.importc: "vorn_s16".}

func vorn_s32*(a: Int32x2, b: Int32x2): Int32x2 {.importc: "vorn_s32".}

func vorn_u8*(a: Uint8x8, b: Uint8x8): Uint8x8 {.importc: "vorn_u8".}

func vorn_u16*(a: Uint16x4, b: Uint16x4): Uint16x4 {.importc: "vorn_u16".}

func vorn_u32*(a: Uint32x2, b: Uint32x2): Uint32x2 {.importc: "vorn_u32".}

func vorn_s64*(a: Int64x1, b: Int64x1): Int64x1 {.importc: "vorn_s64".}

func vorn_u64*(a: Uint64x1, b: Uint64x1): Uint64x1 {.importc: "vorn_u64".}

func vornq_s8*(a: Int8x16, b: Int8x16): Int8x16 {.importc: "vornq_s8".}

func vornq_s16*(a: Int16x8, b: Int16x8): Int16x8 {.importc: "vornq_s16".}

func vornq_s32*(a: Int32x4, b: Int32x4): Int32x4 {.importc: "vornq_s32".}

func vornq_s64*(a: Int64x2, b: Int64x2): Int64x2 {.importc: "vornq_s64".}

func vornq_u8*(a: Uint8x16, b: Uint8x16): Uint8x16 {.importc: "vornq_u8".}

func vornq_u16*(a: Uint16x8, b: Uint16x8): Uint16x8 {.importc: "vornq_u16".}

func vornq_u32*(a: Uint32x4, b: Uint32x4): Uint32x4 {.importc: "vornq_u32".}

func vornq_u64*(a: Uint64x2, b: Uint64x2): Uint64x2 {.importc: "vornq_u64".}

func vsub_s8*(a: Int8x8, b: Int8x8): Int8x8 {.importc: "vsub_s8".}

func vsub_s16*(a: Int16x4, b: Int16x4): Int16x4 {.importc: "vsub_s16".}

func vsub_s32*(a: Int32x2, b: Int32x2): Int32x2 {.importc: "vsub_s32".}

func vsub_f32*(a: Float32x2, b: Float32x2): Float32x2 {.importc: "vsub_f32".}

func vsub_f64*(a: Float64x1, b: Float64x1): Float64x1 {.importc: "vsub_f64".}

func vsub_u8*(a: Uint8x8, b: Uint8x8): Uint8x8 {.importc: "vsub_u8".}

func vsub_u16*(a: Uint16x4, b: Uint16x4): Uint16x4 {.importc: "vsub_u16".}

func vsub_u32*(a: Uint32x2, b: Uint32x2): Uint32x2 {.importc: "vsub_u32".}

func vsub_s64*(a: Int64x1, b: Int64x1): Int64x1 {.importc: "vsub_s64".}

func vsub_u64*(a: Uint64x1, b: Uint64x1): Uint64x1 {.importc: "vsub_u64".}

func vsubq_s8*(a: Int8x16, b: Int8x16): Int8x16 {.importc: "vsubq_s8".}

func vsubq_s16*(a: Int16x8, b: Int16x8): Int16x8 {.importc: "vsubq_s16".}

func vsubq_s32*(a: Int32x4, b: Int32x4): Int32x4 {.importc: "vsubq_s32".}

func vsubq_s64*(a: Int64x2, b: Int64x2): Int64x2 {.importc: "vsubq_s64".}

func vsubq_f32*(a: Float32x4, b: Float32x4): Float32x4 {.importc: "vsubq_f32".}

func vsubq_f64*(a: Float64x2, b: Float64x2): Float64x2 {.importc: "vsubq_f64".}

func vsubq_u8*(a: Uint8x16, b: Uint8x16): Uint8x16 {.importc: "vsubq_u8".}

func vsubq_u16*(a: Uint16x8, b: Uint16x8): Uint16x8 {.importc: "vsubq_u16".}

func vsubq_u32*(a: Uint32x4, b: Uint32x4): Uint32x4 {.importc: "vsubq_u32".}

func vsubq_u64*(a: Uint64x2, b: Uint64x2): Uint64x2 {.importc: "vsubq_u64".}

func vsubl_s8*(a: Int8x8, b: Int8x8): Int16x8 {.importc: "vsubl_s8".}

func vsubl_s16*(a: Int16x4, b: Int16x4): Int32x4 {.importc: "vsubl_s16".}

func vsubl_s32*(a: Int32x2, b: Int32x2): Int64x2 {.importc: "vsubl_s32".}

func vsubl_u8*(a: Uint8x8, b: Uint8x8): Uint16x8 {.importc: "vsubl_u8".}

func vsubl_u16*(a: Uint16x4, b: Uint16x4): Uint32x4 {.importc: "vsubl_u16".}

func vsubl_u32*(a: Uint32x2, b: Uint32x2): Uint64x2 {.importc: "vsubl_u32".}

func vsubl_high_s8*(a: Int8x16, b: Int8x16): Int16x8 {.importc: "vsubl_high_s8".}

func vsubl_high_s16*(a: Int16x8, b: Int16x8): Int32x4 {.importc: "vsubl_high_s16".}

func vsubl_high_s32*(a: Int32x4, b: Int32x4): Int64x2 {.importc: "vsubl_high_s32".}

func vsubl_high_u8*(a: Uint8x16, b: Uint8x16): Uint16x8 {.importc: "vsubl_high_u8".}

func vsubl_high_u16*(a: Uint16x8, b: Uint16x8): Uint32x4 {.importc: "vsubl_high_u16".}

func vsubl_high_u32*(a: Uint32x4, b: Uint32x4): Uint64x2 {.importc: "vsubl_high_u32".}

func vsubw_s8*(a: Int16x8, b: Int8x8): Int16x8 {.importc: "vsubw_s8".}

func vsubw_s16*(a: Int32x4, b: Int16x4): Int32x4 {.importc: "vsubw_s16".}

func vsubw_s32*(a: Int64x2, b: Int32x2): Int64x2 {.importc: "vsubw_s32".}

func vsubw_u8*(a: Uint16x8, b: Uint8x8): Uint16x8 {.importc: "vsubw_u8".}

func vsubw_u16*(a: Uint32x4, b: Uint16x4): Uint32x4 {.importc: "vsubw_u16".}

func vsubw_u32*(a: Uint64x2, b: Uint32x2): Uint64x2 {.importc: "vsubw_u32".}

func vsubw_high_s8*(a: Int16x8, b: Int8x16): Int16x8 {.importc: "vsubw_high_s8".}

func vsubw_high_s16*(a: Int32x4, b: Int16x8): Int32x4 {.importc: "vsubw_high_s16".}

func vsubw_high_s32*(a: Int64x2, b: Int32x4): Int64x2 {.importc: "vsubw_high_s32".}

func vsubw_high_u8*(a: Uint16x8, b: Uint8x16): Uint16x8 {.importc: "vsubw_high_u8".}

func vsubw_high_u16*(a: Uint32x4, b: Uint16x8): Uint32x4 {.importc: "vsubw_high_u16".}

func vsubw_high_u32*(a: Uint64x2, b: Uint32x4): Uint64x2 {.importc: "vsubw_high_u32".}

func vqadd_s8*(a: Int8x8, b: Int8x8): Int8x8 {.importc: "vqadd_s8".}

func vqadd_s16*(a: Int16x4, b: Int16x4): Int16x4 {.importc: "vqadd_s16".}

func vqadd_s32*(a: Int32x2, b: Int32x2): Int32x2 {.importc: "vqadd_s32".}

func vqadd_s64*(a: Int64x1, b: Int64x1): Int64x1 {.importc: "vqadd_s64".}

func vqadd_u8*(a: Uint8x8, b: Uint8x8): Uint8x8 {.importc: "vqadd_u8".}

func vhsub_s8*(a: Int8x8, b: Int8x8): Int8x8 {.importc: "vhsub_s8".}

func vhsub_s16*(a: Int16x4, b: Int16x4): Int16x4 {.importc: "vhsub_s16".}

func vhsub_s32*(a: Int32x2, b: Int32x2): Int32x2 {.importc: "vhsub_s32".}

func vhsub_u8*(a: Uint8x8, b: Uint8x8): Uint8x8 {.importc: "vhsub_u8".}

func vhsub_u16*(a: Uint16x4, b: Uint16x4): Uint16x4 {.importc: "vhsub_u16".}

func vhsub_u32*(a: Uint32x2, b: Uint32x2): Uint32x2 {.importc: "vhsub_u32".}

func vhsubq_s8*(a: Int8x16, b: Int8x16): Int8x16 {.importc: "vhsubq_s8".}

func vhsubq_s16*(a: Int16x8, b: Int16x8): Int16x8 {.importc: "vhsubq_s16".}

func vhsubq_s32*(a: Int32x4, b: Int32x4): Int32x4 {.importc: "vhsubq_s32".}

func vhsubq_u8*(a: Uint8x16, b: Uint8x16): Uint8x16 {.importc: "vhsubq_u8".}

func vhsubq_u16*(a: Uint16x8, b: Uint16x8): Uint16x8 {.importc: "vhsubq_u16".}

func vhsubq_u32*(a: Uint32x4, b: Uint32x4): Uint32x4 {.importc: "vhsubq_u32".}

func vsubhn_s16*(a: Int16x8, b: Int16x8): Int8x8 {.importc: "vsubhn_s16".}

func vsubhn_s32*(a: Int32x4, b: Int32x4): Int16x4 {.importc: "vsubhn_s32".}

func vsubhn_s64*(a: Int64x2, b: Int64x2): Int32x2 {.importc: "vsubhn_s64".}

func vsubhn_u16*(a: Uint16x8, b: Uint16x8): Uint8x8 {.importc: "vsubhn_u16".}

func vsubhn_u32*(a: Uint32x4, b: Uint32x4): Uint16x4 {.importc: "vsubhn_u32".}

func vsubhn_u64*(a: Uint64x2, b: Uint64x2): Uint32x2 {.importc: "vsubhn_u64".}

func vrsubhn_s16*(a: Int16x8, b: Int16x8): Int8x8 {.importc: "vrsubhn_s16".}

func vrsubhn_s32*(a: Int32x4, b: Int32x4): Int16x4 {.importc: "vrsubhn_s32".}

func vrsubhn_s64*(a: Int64x2, b: Int64x2): Int32x2 {.importc: "vrsubhn_s64".}

func vrsubhn_u16*(a: Uint16x8, b: Uint16x8): Uint8x8 {.importc: "vrsubhn_u16".}

func vrsubhn_u32*(a: Uint32x4, b: Uint32x4): Uint16x4 {.importc: "vrsubhn_u32".}

func vrsubhn_u64*(a: Uint64x2, b: Uint64x2): Uint32x2 {.importc: "vrsubhn_u64".}

func vrsubhn_high_s16*(a: Int8x8, b: Int16x8, c: Int16x8): Int8x16 {.importc: "vrsubhn_high_s16".}

func vrsubhn_high_s32*(a: Int16x4, b: Int32x4, c: Int32x4): Int16x8 {.importc: "vrsubhn_high_s32".}

func vrsubhn_high_s64*(a: Int32x2, b: Int64x2, c: Int64x2): Int32x4 {.importc: "vrsubhn_high_s64".}

func vrsubhn_high_u16*(a: Uint8x8, b: Uint16x8, c: Uint16x8): Uint8x16 {.importc: "vrsubhn_high_u16".}

func vrsubhn_high_u32*(a: Uint16x4, b: Uint32x4, c: Uint32x4): Uint16x8 {.importc: "vrsubhn_high_u32".}

func vrsubhn_high_u64*(a: Uint32x2, b: Uint64x2, c: Uint64x2): Uint32x4 {.importc: "vrsubhn_high_u64".}

func vsubhn_high_s16*(a: Int8x8, b: Int16x8, c: Int16x8): Int8x16 {.importc: "vsubhn_high_s16".}

func vsubhn_high_s32*(a: Int16x4, b: Int32x4, c: Int32x4): Int16x8 {.importc: "vsubhn_high_s32".}

func vsubhn_high_s64*(a: Int32x2, b: Int64x2, c: Int64x2): Int32x4 {.importc: "vsubhn_high_s64".}

func vsubhn_high_u16*(a: Uint8x8, b: Uint16x8, c: Uint16x8): Uint8x16 {.importc: "vsubhn_high_u16".}

func vsubhn_high_u32*(a: Uint16x4, b: Uint32x4, c: Uint32x4): Uint16x8 {.importc: "vsubhn_high_u32".}

func vsubhn_high_u64*(a: Uint32x2, b: Uint64x2, c: Uint64x2): Uint32x4 {.importc: "vsubhn_high_u64".}

func vqadd_u16*(a: Uint16x4, b: Uint16x4): Uint16x4 {.importc: "vqadd_u16".}

func vqadd_u32*(a: Uint32x2, b: Uint32x2): Uint32x2 {.importc: "vqadd_u32".}

func vqadd_u64*(a: Uint64x1, b: Uint64x1): Uint64x1 {.importc: "vqadd_u64".}

func vqaddq_s8*(a: Int8x16, b: Int8x16): Int8x16 {.importc: "vqaddq_s8".}

func vqaddq_s16*(a: Int16x8, b: Int16x8): Int16x8 {.importc: "vqaddq_s16".}

func vqaddq_s32*(a: Int32x4, b: Int32x4): Int32x4 {.importc: "vqaddq_s32".}

func vqaddq_s64*(a: Int64x2, b: Int64x2): Int64x2 {.importc: "vqaddq_s64".}

func vqaddq_u8*(a: Uint8x16, b: Uint8x16): Uint8x16 {.importc: "vqaddq_u8".}

func vqaddq_u16*(a: Uint16x8, b: Uint16x8): Uint16x8 {.importc: "vqaddq_u16".}

func vqaddq_u32*(a: Uint32x4, b: Uint32x4): Uint32x4 {.importc: "vqaddq_u32".}

func vqaddq_u64*(a: Uint64x2, b: Uint64x2): Uint64x2 {.importc: "vqaddq_u64".}

func vqsub_s8*(a: Int8x8, b: Int8x8): Int8x8 {.importc: "vqsub_s8".}

func vqsub_s16*(a: Int16x4, b: Int16x4): Int16x4 {.importc: "vqsub_s16".}

func vqsub_s32*(a: Int32x2, b: Int32x2): Int32x2 {.importc: "vqsub_s32".}

func vqsub_s64*(a: Int64x1, b: Int64x1): Int64x1 {.importc: "vqsub_s64".}

func vqsub_u8*(a: Uint8x8, b: Uint8x8): Uint8x8 {.importc: "vqsub_u8".}

func vqsub_u16*(a: Uint16x4, b: Uint16x4): Uint16x4 {.importc: "vqsub_u16".}

func vqsub_u32*(a: Uint32x2, b: Uint32x2): Uint32x2 {.importc: "vqsub_u32".}

func vqsub_u64*(a: Uint64x1, b: Uint64x1): Uint64x1 {.importc: "vqsub_u64".}

func vqsubq_s8*(a: Int8x16, b: Int8x16): Int8x16 {.importc: "vqsubq_s8".}

func vqsubq_s16*(a: Int16x8, b: Int16x8): Int16x8 {.importc: "vqsubq_s16".}

func vqsubq_s32*(a: Int32x4, b: Int32x4): Int32x4 {.importc: "vqsubq_s32".}

func vqsubq_s64*(a: Int64x2, b: Int64x2): Int64x2 {.importc: "vqsubq_s64".}

func vqsubq_u8*(a: Uint8x16, b: Uint8x16): Uint8x16 {.importc: "vqsubq_u8".}

func vqsubq_u16*(a: Uint16x8, b: Uint16x8): Uint16x8 {.importc: "vqsubq_u16".}

func vqsubq_u32*(a: Uint32x4, b: Uint32x4): Uint32x4 {.importc: "vqsubq_u32".}

func vqsubq_u64*(a: Uint64x2, b: Uint64x2): Uint64x2 {.importc: "vqsubq_u64".}

func vqneg_s8*(a: Int8x8): Int8x8 {.importc: "vqneg_s8".}

func vqneg_s16*(a: Int16x4): Int16x4 {.importc: "vqneg_s16".}

func vqneg_s32*(a: Int32x2): Int32x2 {.importc: "vqneg_s32".}

func vqneg_s64*(a: Int64x1): Int64x1 {.importc: "vqneg_s64".}

func vqnegq_s8*(a: Int8x16): Int8x16 {.importc: "vqnegq_s8".}

func vqnegq_s16*(a: Int16x8): Int16x8 {.importc: "vqnegq_s16".}

func vqnegq_s32*(a: Int32x4): Int32x4 {.importc: "vqnegq_s32".}

func vqabs_s8*(a: Int8x8): Int8x8 {.importc: "vqabs_s8".}

func vqabs_s16*(a: Int16x4): Int16x4 {.importc: "vqabs_s16".}

func vqabs_s32*(a: Int32x2): Int32x2 {.importc: "vqabs_s32".}

func vqabs_s64*(a: Int64x1): Int64x1 {.importc: "vqabs_s64".}

func vqabsq_s8*(a: Int8x16): Int8x16 {.importc: "vqabsq_s8".}

func vqabsq_s16*(a: Int16x8): Int16x8 {.importc: "vqabsq_s16".}

func vqabsq_s32*(a: Int32x4): Int32x4 {.importc: "vqabsq_s32".}

func vqdmulh_s16*(a: Int16x4, b: Int16x4): Int16x4 {.importc: "vqdmulh_s16".}

func vqdmulh_s32*(a: Int32x2, b: Int32x2): Int32x2 {.importc: "vqdmulh_s32".}

func vqdmulhq_s16*(a: Int16x8, b: Int16x8): Int16x8 {.importc: "vqdmulhq_s16".}

func vqdmulhq_s32*(a: Int32x4, b: Int32x4): Int32x4 {.importc: "vqdmulhq_s32".}

func vqrdmulh_s16*(a: Int16x4, b: Int16x4): Int16x4 {.importc: "vqrdmulh_s16".}

func vqrdmulh_s32*(a: Int32x2, b: Int32x2): Int32x2 {.importc: "vqrdmulh_s32".}

func vqrdmulhq_s16*(a: Int16x8, b: Int16x8): Int16x8 {.importc: "vqrdmulhq_s16".}

func vqrdmulhq_s32*(a: Int32x4, b: Int32x4): Int32x4 {.importc: "vqrdmulhq_s32".}

func vcreate_s8*(a: uint64): Int8x8 {.importc: "vcreate_s8".}

func vcreate_s16*(a: uint64): Int16x4 {.importc: "vcreate_s16".}

func vcreate_s32*(a: uint64): Int32x2 {.importc: "vcreate_s32".}

func vcreate_s64*(a: uint64): Int64x1 {.importc: "vcreate_s64".}

func vcreate_f16*(a: uint64): Float16x4 {.importc: "vcreate_f16".}

func vcreate_f32*(a: uint64): Float32x2 {.importc: "vcreate_f32".}

func vcreate_u8*(a: uint64): Uint8x8 {.importc: "vcreate_u8".}

func vcreate_u16*(a: uint64): Uint16x4 {.importc: "vcreate_u16".}

func vcreate_u32*(a: uint64): Uint32x2 {.importc: "vcreate_u32".}

func vcreate_u64*(a: uint64): Uint64x1 {.importc: "vcreate_u64".}

func vcreate_f64*(a: uint64): Float64x1 {.importc: "vcreate_f64".}

func vcreate_p8*(a: uint64): Poly8x8 {.importc: "vcreate_p8".}

func vcreate_p16*(a: uint64): Poly16x4 {.importc: "vcreate_p16".}

func vcreate_p64*(a: uint64): Poly64x1 {.importc: "vcreate_p64".}

func vget_lane_f16*(a: Float16x4, b: int32): float16 {.importc: "vget_lane_f16".}

func vget_lane_f32*(a: Float32x2, b: int32): float32 {.importc: "vget_lane_f32".}

func vget_lane_f64*(a: Float64x1, b: int32): float64 {.importc: "vget_lane_f64".}

func vget_lane_p8*(a: Poly8x8, b: int32): Poly8 {.importc: "vget_lane_p8".}

func vget_lane_p16*(a: Poly16x4, b: int32): Poly16 {.importc: "vget_lane_p16".}

func vget_lane_p64*(a: Poly64x1, b: int32): Poly64 {.importc: "vget_lane_p64".}

func vget_lane_s8*(a: Int8x8, b: int32): int8 {.importc: "vget_lane_s8".}

func vget_lane_s16*(a: Int16x4, b: int32): int16 {.importc: "vget_lane_s16".}

func vget_lane_s32*(a: Int32x2, b: int32): int32 {.importc: "vget_lane_s32".}

func vget_lane_s64*(a: Int64x1, b: int32): int64 {.importc: "vget_lane_s64".}

func vget_lane_u8*(a: Uint8x8, b: int32): uint8 {.importc: "vget_lane_u8".}

func vget_lane_u16*(a: Uint16x4, b: int32): uint16 {.importc: "vget_lane_u16".}

func vget_lane_u32*(a: Uint32x2, b: int32): uint32 {.importc: "vget_lane_u32".}

func vget_lane_u64*(a: Uint64x1, b: int32): uint64 {.importc: "vget_lane_u64".}

func vgetq_lane_f16*(a: Float16x8, b: int32): float16 {.importc: "vgetq_lane_f16".}

func vgetq_lane_f32*(a: Float32x4, b: int32): float32 {.importc: "vgetq_lane_f32".}

func vgetq_lane_f64*(a: Float64x2, b: int32): float64 {.importc: "vgetq_lane_f64".}

func vgetq_lane_p8*(a: Poly8x16, b: int32): Poly8 {.importc: "vgetq_lane_p8".}

func vgetq_lane_p16*(a: Poly16x8, b: int32): Poly16 {.importc: "vgetq_lane_p16".}

func vgetq_lane_p64*(a: Poly64x2, b: int32): Poly64 {.importc: "vgetq_lane_p64".}

func vgetq_lane_s8*(a: Int8x16, b: int32): int8 {.importc: "vgetq_lane_s8".}

func vgetq_lane_s16*(a: Int16x8, b: int32): int16 {.importc: "vgetq_lane_s16".}

func vgetq_lane_s32*(a: Int32x4, b: int32): int32 {.importc: "vgetq_lane_s32".}

func vgetq_lane_s64*(a: Int64x2, b: int32): int64 {.importc: "vgetq_lane_s64".}

func vgetq_lane_u8*(a: Uint8x16, b: int32): uint8 {.importc: "vgetq_lane_u8".}

func vgetq_lane_u16*(a: Uint16x8, b: int32): uint16 {.importc: "vgetq_lane_u16".}

func vgetq_lane_u32*(a: Uint32x4, b: int32): uint32 {.importc: "vgetq_lane_u32".}

func vgetq_lane_u64*(a: Uint64x2, b: int32): uint64 {.importc: "vgetq_lane_u64".}

func vset_lane_f16*(elem: float16, vec: Float16x4, index: int32): Float16x4 {.importc: "vset_lane_f16".}

func vset_lane_f32*(elem: float32, vec: Float32x2, index: int32): Float32x2 {.importc: "vset_lane_f32".}

func vset_lane_f64*(elem: float64, vec: Float64x1, index: int32): Float64x1 {.importc: "vset_lane_f64".}

func vset_lane_p8*(elem: Poly8, vec: Poly8x8, index: int32): Poly8x8 {.importc: "vset_lane_p8".}

func vset_lane_p16*(elem: Poly16, vec: Poly16x4, index: int32): Poly16x4 {.importc: "vset_lane_p16".}

func vset_lane_p64*(elem: Poly64, vec: Poly64x1, index: int32): Poly64x1 {.importc: "vset_lane_p64".}

func vset_lane_s8*(elem: int8, vec: Int8x8, index: int32): Int8x8 {.importc: "vset_lane_s8".}

func vset_lane_s16*(elem: int16, vec: Int16x4, index: int32): Int16x4 {.importc: "vset_lane_s16".}

func vset_lane_s32*(elem: int32, vec: Int32x2, index: int32): Int32x2 {.importc: "vset_lane_s32".}

func vset_lane_s64*(elem: int64, vec: Int64x1, index: int32): Int64x1 {.importc: "vset_lane_s64".}

func vset_lane_u8*(elem: uint8, vec: Uint8x8, index: int32): Uint8x8 {.importc: "vset_lane_u8".}

func vset_lane_u16*(elem: uint16, vec: Uint16x4, index: int32): Uint16x4 {.importc: "vset_lane_u16".}

func vset_lane_u32*(elem: uint32, vec: Uint32x2, index: int32): Uint32x2 {.importc: "vset_lane_u32".}

func vset_lane_u64*(elem: uint64, vec: Uint64x1, index: int32): Uint64x1 {.importc: "vset_lane_u64".}

func vsetq_lane_f16*(elem: float16, vec: Float16x8, index: int32): Float16x8 {.importc: "vsetq_lane_f16".}

func vsetq_lane_f32*(elem: float32, vec: Float32x4, index: int32): Float32x4 {.importc: "vsetq_lane_f32".}

func vsetq_lane_f64*(elem: float64, vec: Float64x2, index: int32): Float64x2 {.importc: "vsetq_lane_f64".}

func vsetq_lane_p8*(elem: Poly8, vec: Poly8x16, index: int32): Poly8x16 {.importc: "vsetq_lane_p8".}

func vsetq_lane_p16*(elem: Poly16, vec: Poly16x8, index: int32): Poly16x8 {.importc: "vsetq_lane_p16".}

func vsetq_lane_p64*(elem: Poly64, vec: Poly64x2, index: int32): Poly64x2 {.importc: "vsetq_lane_p64".}

func vsetq_lane_s8*(elem: int8, vec: Int8x16, index: int32): Int8x16 {.importc: "vsetq_lane_s8".}

func vsetq_lane_s16*(elem: int16, vec: Int16x8, index: int32): Int16x8 {.importc: "vsetq_lane_s16".}

func vsetq_lane_s32*(elem: int32, vec: Int32x4, index: int32): Int32x4 {.importc: "vsetq_lane_s32".}

func vsetq_lane_s64*(elem: int64, vec: Int64x2, index: int32): Int64x2 {.importc: "vsetq_lane_s64".}

func vsetq_lane_u8*(elem: uint8, vec: Uint8x16, index: int32): Uint8x16 {.importc: "vsetq_lane_u8".}

func vsetq_lane_u16*(elem: uint16, vec: Uint16x8, index: int32): Uint16x8 {.importc: "vsetq_lane_u16".}

func vsetq_lane_u32*(elem: uint32, vec: Uint32x4, index: int32): Uint32x4 {.importc: "vsetq_lane_u32".}

func vsetq_lane_u64*(elem: uint64, vec: Uint64x2, index: int32): Uint64x2 {.importc: "vsetq_lane_u64".}

func vcombine_s8*(a: Int8x8, b: Int8x8): Int8x16 {.importc: "vcombine_s8".}

func vcombine_s16*(a: Int16x4, b: Int16x4): Int16x8 {.importc: "vcombine_s16".}

func vcombine_s32*(a: Int32x2, b: Int32x2): Int32x4 {.importc: "vcombine_s32".}

func vcombine_s64*(a: Int64x1, b: Int64x1): Int64x2 {.importc: "vcombine_s64".}

func vcombine_f16*(a: Float16x4, b: Float16x4): Float16x8 {.importc: "vcombine_f16".}

func vcombine_f32*(a: Float32x2, b: Float32x2): Float32x4 {.importc: "vcombine_f32".}

func vcombine_u8*(a: Uint8x8, b: Uint8x8): Uint8x16 {.importc: "vcombine_u8".}

func vcombine_u16*(a: Uint16x4, b: Uint16x4): Uint16x8 {.importc: "vcombine_u16".}

func vcombine_u32*(a: Uint32x2, b: Uint32x2): Uint32x4 {.importc: "vcombine_u32".}

func vcombine_u64*(a: Uint64x1, b: Uint64x1): Uint64x2 {.importc: "vcombine_u64".}

func vcombine_f64*(a: Float64x1, b: Float64x1): Float64x2 {.importc: "vcombine_f64".}

func vcombine_p8*(a: Poly8x8, b: Poly8x8): Poly8x16 {.importc: "vcombine_p8".}

func vcombine_p16*(a: Poly16x4, b: Poly16x4): Poly16x8 {.importc: "vcombine_p16".}

func vcombine_p64*(a: Poly64x1, b: Poly64x1): Poly64x2 {.importc: "vcombine_p64".}

func vaba_s8*(a: Int8x8, b: Int8x8, c: Int8x8): Int8x8 {.importc: "vaba_s8".}

func vaba_s16*(a: Int16x4, b: Int16x4, c: Int16x4): Int16x4 {.importc: "vaba_s16".}

func vaba_s32*(a: Int32x2, b: Int32x2, c: Int32x2): Int32x2 {.importc: "vaba_s32".}

func vaba_u8*(a: Uint8x8, b: Uint8x8, c: Uint8x8): Uint8x8 {.importc: "vaba_u8".}

func vaba_u16*(a: Uint16x4, b: Uint16x4, c: Uint16x4): Uint16x4 {.importc: "vaba_u16".}

func vaba_u32*(a: Uint32x2, b: Uint32x2, c: Uint32x2): Uint32x2 {.importc: "vaba_u32".}

func vabal_high_s8*(a: Int16x8, b: Int8x16, c: Int8x16): Int16x8 {.importc: "vabal_high_s8".}

func vabal_high_s16*(a: Int32x4, b: Int16x8, c: Int16x8): Int32x4 {.importc: "vabal_high_s16".}

func vabal_high_s32*(a: Int64x2, b: Int32x4, c: Int32x4): Int64x2 {.importc: "vabal_high_s32".}

func vabal_high_u8*(a: Uint16x8, b: Uint8x16, c: Uint8x16): Uint16x8 {.importc: "vabal_high_u8".}

func vabal_high_u16*(a: Uint32x4, b: Uint16x8, c: Uint16x8): Uint32x4 {.importc: "vabal_high_u16".}

func vabal_high_u32*(a: Uint64x2, b: Uint32x4, c: Uint32x4): Uint64x2 {.importc: "vabal_high_u32".}

func vabal_s8*(a: Int16x8, b: Int8x8, c: Int8x8): Int16x8 {.importc: "vabal_s8".}

func vabal_s16*(a: Int32x4, b: Int16x4, c: Int16x4): Int32x4 {.importc: "vabal_s16".}

func vabal_s32*(a: Int64x2, b: Int32x2, c: Int32x2): Int64x2 {.importc: "vabal_s32".}

func vabal_u8*(a: Uint16x8, b: Uint8x8, c: Uint8x8): Uint16x8 {.importc: "vabal_u8".}

func vabal_u16*(a: Uint32x4, b: Uint16x4, c: Uint16x4): Uint32x4 {.importc: "vabal_u16".}

func vabal_u32*(a: Uint64x2, b: Uint32x2, c: Uint32x2): Uint64x2 {.importc: "vabal_u32".}

func vabaq_s8*(a: Int8x16, b: Int8x16, c: Int8x16): Int8x16 {.importc: "vabaq_s8".}

func vabaq_s16*(a: Int16x8, b: Int16x8, c: Int16x8): Int16x8 {.importc: "vabaq_s16".}

func vabaq_s32*(a: Int32x4, b: Int32x4, c: Int32x4): Int32x4 {.importc: "vabaq_s32".}

func vabaq_u8*(a: Uint8x16, b: Uint8x16, c: Uint8x16): Uint8x16 {.importc: "vabaq_u8".}

func vabaq_u16*(a: Uint16x8, b: Uint16x8, c: Uint16x8): Uint16x8 {.importc: "vabaq_u16".}

func vabaq_u32*(a: Uint32x4, b: Uint32x4, c: Uint32x4): Uint32x4 {.importc: "vabaq_u32".}

func vabd_s8*(a: Int8x8, b: Int8x8): Int8x8 {.importc: "vabd_s8".}

func vabd_s16*(a: Int16x4, b: Int16x4): Int16x4 {.importc: "vabd_s16".}

func vabd_s32*(a: Int32x2, b: Int32x2): Int32x2 {.importc: "vabd_s32".}

func vabd_u8*(a: Uint8x8, b: Uint8x8): Uint8x8 {.importc: "vabd_u8".}

func vabd_u16*(a: Uint16x4, b: Uint16x4): Uint16x4 {.importc: "vabd_u16".}

func vabd_u32*(a: Uint32x2, b: Uint32x2): Uint32x2 {.importc: "vabd_u32".}

func vabdl_high_s8*(a: Int8x16, b: Int8x16): Int16x8 {.importc: "vabdl_high_s8".}

func vabdl_high_s16*(a: Int16x8, b: Int16x8): Int32x4 {.importc: "vabdl_high_s16".}

func vabdl_high_s32*(a: Int32x4, b: Int32x4): Int64x2 {.importc: "vabdl_high_s32".}

func vabdl_high_u8*(a: Uint8x16, b: Uint8x16): Uint16x8 {.importc: "vabdl_high_u8".}

func vabdl_high_u16*(a: Uint16x8, b: Uint16x8): Uint32x4 {.importc: "vabdl_high_u16".}

func vabdl_high_u32*(a: Uint32x4, b: Uint32x4): Uint64x2 {.importc: "vabdl_high_u32".}

func vabdl_s8*(a: Int8x8, b: Int8x8): Int16x8 {.importc: "vabdl_s8".}

func vabdl_s16*(a: Int16x4, b: Int16x4): Int32x4 {.importc: "vabdl_s16".}

func vabdl_s32*(a: Int32x2, b: Int32x2): Int64x2 {.importc: "vabdl_s32".}

func vabdl_u8*(a: Uint8x8, b: Uint8x8): Uint16x8 {.importc: "vabdl_u8".}

func vabdl_u16*(a: Uint16x4, b: Uint16x4): Uint32x4 {.importc: "vabdl_u16".}

func vabdl_u32*(a: Uint32x2, b: Uint32x2): Uint64x2 {.importc: "vabdl_u32".}

func vabdq_s8*(a: Int8x16, b: Int8x16): Int8x16 {.importc: "vabdq_s8".}

func vabdq_s16*(a: Int16x8, b: Int16x8): Int16x8 {.importc: "vabdq_s16".}

func vabdq_s32*(a: Int32x4, b: Int32x4): Int32x4 {.importc: "vabdq_s32".}

func vabdq_u8*(a: Uint8x16, b: Uint8x16): Uint8x16 {.importc: "vabdq_u8".}

func vabdq_u16*(a: Uint16x8, b: Uint16x8): Uint16x8 {.importc: "vabdq_u16".}

func vabdq_u32*(a: Uint32x4, b: Uint32x4): Uint32x4 {.importc: "vabdq_u32".}

func vaddlv_s8*(a: Int8x8): int16 {.importc: "vaddlv_s8".}

func vaddlv_s16*(a: Int16x4): int32 {.importc: "vaddlv_s16".}

func vaddlv_u8*(a: Uint8x8): uint16 {.importc: "vaddlv_u8".}

func vaddlv_u16*(a: Uint16x4): uint32 {.importc: "vaddlv_u16".}

func vaddlvq_s8*(a: Int8x16): int16 {.importc: "vaddlvq_s8".}

func vaddlvq_s16*(a: Int16x8): int32 {.importc: "vaddlvq_s16".}

func vaddlvq_s32*(a: Int32x4): int64 {.importc: "vaddlvq_s32".}

func vaddlvq_u8*(a: Uint8x16): uint16 {.importc: "vaddlvq_u8".}

func vaddlvq_u16*(a: Uint16x8): uint32 {.importc: "vaddlvq_u16".}

func vaddlvq_u32*(a: Uint32x4): uint64 {.importc: "vaddlvq_u32".}

func vcvtx_f32_f64*(a: Float64x2): Float32x2 {.importc: "vcvtx_f32_f64".}

func vcvtx_high_f32_f64*(a: Float32x2, b: Float64x2): Float32x4 {.importc: "vcvtx_high_f32_f64".}

func vcvtxd_f32_f64*(a: float64): float32 {.importc: "vcvtxd_f32_f64".}

func vmla_n_f32*(a: Float32x2, b: Float32x2, c: float32): Float32x2 {.importc: "vmla_n_f32".}

func vmla_n_s16*(a: Int16x4, b: Int16x4, c: int16): Int16x4 {.importc: "vmla_n_s16".}

func vmla_n_s32*(a: Int32x2, b: Int32x2, c: int32): Int32x2 {.importc: "vmla_n_s32".}

func vmla_n_u16*(a: Uint16x4, b: Uint16x4, c: uint16): Uint16x4 {.importc: "vmla_n_u16".}

func vmla_n_u32*(a: Uint32x2, b: Uint32x2, c: uint32): Uint32x2 {.importc: "vmla_n_u32".}

func vmla_s8*(a: Int8x8, b: Int8x8, c: Int8x8): Int8x8 {.importc: "vmla_s8".}

func vmla_s16*(a: Int16x4, b: Int16x4, c: Int16x4): Int16x4 {.importc: "vmla_s16".}

func vmla_s32*(a: Int32x2, b: Int32x2, c: Int32x2): Int32x2 {.importc: "vmla_s32".}

func vmla_u8*(a: Uint8x8, b: Uint8x8, c: Uint8x8): Uint8x8 {.importc: "vmla_u8".}

func vmla_u16*(a: Uint16x4, b: Uint16x4, c: Uint16x4): Uint16x4 {.importc: "vmla_u16".}

func vmla_u32*(a: Uint32x2, b: Uint32x2, c: Uint32x2): Uint32x2 {.importc: "vmla_u32".}

func vmlal_high_lane_s16*(a: Int32x4, b: Int16x8, v: Int16x4, lane: int32): Int32x4 {.importc: "vmlal_high_lane_s16".}

func vmlal_high_lane_s32*(a: Int64x2, b: Int32x4, v: Int32x2, lane: int32): Int64x2 {.importc: "vmlal_high_lane_s32".}

func vmlal_high_lane_u16*(a: Uint32x4, b: Uint16x8, v: Uint16x4, lane: int32): Uint32x4 {.importc: "vmlal_high_lane_u16".}

func vmlal_high_lane_u32*(a: Uint64x2, b: Uint32x4, v: Uint32x2, lane: int32): Uint64x2 {.importc: "vmlal_high_lane_u32".}

func vmlal_high_laneq_s16*(a: Int32x4, b: Int16x8, v: Int16x8, lane: int32): Int32x4 {.importc: "vmlal_high_laneq_s16".}

func vmlal_high_laneq_s32*(a: Int64x2, b: Int32x4, v: Int32x4, lane: int32): Int64x2 {.importc: "vmlal_high_laneq_s32".}

func vmlal_high_laneq_u16*(a: Uint32x4, b: Uint16x8, v: Uint16x8, lane: int32): Uint32x4 {.importc: "vmlal_high_laneq_u16".}

func vmlal_high_laneq_u32*(a: Uint64x2, b: Uint32x4, v: Uint32x4, lane: int32): Uint64x2 {.importc: "vmlal_high_laneq_u32".}

func vmlal_high_n_s16*(a: Int32x4, b: Int16x8, c: int16): Int32x4 {.importc: "vmlal_high_n_s16".}

func vmlal_high_n_s32*(a: Int64x2, b: Int32x4, c: int32): Int64x2 {.importc: "vmlal_high_n_s32".}

func vmlal_high_n_u16*(a: Uint32x4, b: Uint16x8, c: uint16): Uint32x4 {.importc: "vmlal_high_n_u16".}

func vmlal_high_n_u32*(a: Uint64x2, b: Uint32x4, c: uint32): Uint64x2 {.importc: "vmlal_high_n_u32".}

func vmlal_high_s8*(a: Int16x8, b: Int8x16, c: Int8x16): Int16x8 {.importc: "vmlal_high_s8".}

func vmlal_high_s16*(a: Int32x4, b: Int16x8, c: Int16x8): Int32x4 {.importc: "vmlal_high_s16".}

func vmlal_high_s32*(a: Int64x2, b: Int32x4, c: Int32x4): Int64x2 {.importc: "vmlal_high_s32".}

func vmlal_high_u8*(a: Uint16x8, b: Uint8x16, c: Uint8x16): Uint16x8 {.importc: "vmlal_high_u8".}

func vmlal_high_u16*(a: Uint32x4, b: Uint16x8, c: Uint16x8): Uint32x4 {.importc: "vmlal_high_u16".}

func vmlal_high_u32*(a: Uint64x2, b: Uint32x4, c: Uint32x4): Uint64x2 {.importc: "vmlal_high_u32".}

func vmlal_lane_s16*(acc: Int32x4, a: Int16x4, b: Int16x4, c: int32): Int32x4 {.importc: "vmlal_lane_s16".}

func vmlal_lane_s32*(acc: Int64x2, a: Int32x2, b: Int32x2, c: int32): Int64x2 {.importc: "vmlal_lane_s32".}

func vmlal_lane_u16*(acc: Uint32x4, a: Uint16x4, b: Uint16x4, c: int32): Uint32x4 {.importc: "vmlal_lane_u16".}

func vmlal_lane_u32*(acc: Uint64x2, a: Uint32x2, b: Uint32x2, c: int32): Uint64x2 {.importc: "vmlal_lane_u32".}

func vmlal_laneq_s16*(acc: Int32x4, a: Int16x4, b: Int16x8, c: int32): Int32x4 {.importc: "vmlal_laneq_s16".}

func vmlal_laneq_s32*(acc: Int64x2, a: Int32x2, b: Int32x4, c: int32): Int64x2 {.importc: "vmlal_laneq_s32".}

func vmlal_laneq_u16*(acc: Uint32x4, a: Uint16x4, b: Uint16x8, c: int32): Uint32x4 {.importc: "vmlal_laneq_u16".}

func vmlal_laneq_u32*(acc: Uint64x2, a: Uint32x2, b: Uint32x4, c: int32): Uint64x2 {.importc: "vmlal_laneq_u32".}

func vmlal_n_s16*(a: Int32x4, b: Int16x4, c: int16): Int32x4 {.importc: "vmlal_n_s16".}

func vmlal_n_s32*(a: Int64x2, b: Int32x2, c: int32): Int64x2 {.importc: "vmlal_n_s32".}

func vmlal_n_u16*(a: Uint32x4, b: Uint16x4, c: uint16): Uint32x4 {.importc: "vmlal_n_u16".}

func vmlal_n_u32*(a: Uint64x2, b: Uint32x2, c: uint32): Uint64x2 {.importc: "vmlal_n_u32".}

func vmlal_s8*(a: Int16x8, b: Int8x8, c: Int8x8): Int16x8 {.importc: "vmlal_s8".}

func vmlal_s16*(a: Int32x4, b: Int16x4, c: Int16x4): Int32x4 {.importc: "vmlal_s16".}

func vmlal_s32*(a: Int64x2, b: Int32x2, c: Int32x2): Int64x2 {.importc: "vmlal_s32".}

func vmlal_u8*(a: Uint16x8, b: Uint8x8, c: Uint8x8): Uint16x8 {.importc: "vmlal_u8".}

func vmlal_u16*(a: Uint32x4, b: Uint16x4, c: Uint16x4): Uint32x4 {.importc: "vmlal_u16".}

func vmlal_u32*(a: Uint64x2, b: Uint32x2, c: Uint32x2): Uint64x2 {.importc: "vmlal_u32".}

func vmlaq_n_f32*(a: Float32x4, b: Float32x4, c: float32): Float32x4 {.importc: "vmlaq_n_f32".}

func vmlaq_n_s16*(a: Int16x8, b: Int16x8, c: int16): Int16x8 {.importc: "vmlaq_n_s16".}

func vmlaq_n_s32*(a: Int32x4, b: Int32x4, c: int32): Int32x4 {.importc: "vmlaq_n_s32".}

func vmlaq_n_u16*(a: Uint16x8, b: Uint16x8, c: uint16): Uint16x8 {.importc: "vmlaq_n_u16".}

func vmlaq_n_u32*(a: Uint32x4, b: Uint32x4, c: uint32): Uint32x4 {.importc: "vmlaq_n_u32".}

func vmlaq_s8*(a: Int8x16, b: Int8x16, c: Int8x16): Int8x16 {.importc: "vmlaq_s8".}

func vmlaq_s16*(a: Int16x8, b: Int16x8, c: Int16x8): Int16x8 {.importc: "vmlaq_s16".}

func vmlaq_s32*(a: Int32x4, b: Int32x4, c: Int32x4): Int32x4 {.importc: "vmlaq_s32".}

func vmlaq_u8*(a: Uint8x16, b: Uint8x16, c: Uint8x16): Uint8x16 {.importc: "vmlaq_u8".}

func vmlaq_u16*(a: Uint16x8, b: Uint16x8, c: Uint16x8): Uint16x8 {.importc: "vmlaq_u16".}

func vmlaq_u32*(a: Uint32x4, b: Uint32x4, c: Uint32x4): Uint32x4 {.importc: "vmlaq_u32".}

func vmls_n_f32*(a: Float32x2, b: Float32x2, c: float32): Float32x2 {.importc: "vmls_n_f32".}

func vmls_n_s16*(a: Int16x4, b: Int16x4, c: int16): Int16x4 {.importc: "vmls_n_s16".}

func vmls_n_s32*(a: Int32x2, b: Int32x2, c: int32): Int32x2 {.importc: "vmls_n_s32".}

func vmls_n_u16*(a: Uint16x4, b: Uint16x4, c: uint16): Uint16x4 {.importc: "vmls_n_u16".}

func vmls_n_u32*(a: Uint32x2, b: Uint32x2, c: uint32): Uint32x2 {.importc: "vmls_n_u32".}

func vmls_s8*(a: Int8x8, b: Int8x8, c: Int8x8): Int8x8 {.importc: "vmls_s8".}

func vmls_s16*(a: Int16x4, b: Int16x4, c: Int16x4): Int16x4 {.importc: "vmls_s16".}

func vmls_s32*(a: Int32x2, b: Int32x2, c: Int32x2): Int32x2 {.importc: "vmls_s32".}

func vmls_u8*(a: Uint8x8, b: Uint8x8, c: Uint8x8): Uint8x8 {.importc: "vmls_u8".}

func vmls_u16*(a: Uint16x4, b: Uint16x4, c: Uint16x4): Uint16x4 {.importc: "vmls_u16".}

func vmls_u32*(a: Uint32x2, b: Uint32x2, c: Uint32x2): Uint32x2 {.importc: "vmls_u32".}

func vmlsl_high_lane_s16*(a: Int32x4, b: Int16x8, v: Int16x4, lane: int32): Int32x4 {.importc: "vmlsl_high_lane_s16".}

func vmlsl_high_lane_s32*(a: Int64x2, b: Int32x4, v: Int32x2, lane: int32): Int64x2 {.importc: "vmlsl_high_lane_s32".}

func vmlsl_high_lane_u16*(a: Uint32x4, b: Uint16x8, v: Uint16x4, lane: int32): Uint32x4 {.importc: "vmlsl_high_lane_u16".}

func vmlsl_high_lane_u32*(a: Uint64x2, b: Uint32x4, v: Uint32x2, lane: int32): Uint64x2 {.importc: "vmlsl_high_lane_u32".}

func vmlsl_high_laneq_s16*(a: Int32x4, b: Int16x8, v: Int16x8, lane: int32): Int32x4 {.importc: "vmlsl_high_laneq_s16".}

func vmlsl_high_laneq_s32*(a: Int64x2, b: Int32x4, v: Int32x4, lane: int32): Int64x2 {.importc: "vmlsl_high_laneq_s32".}

func vmlsl_high_laneq_u16*(a: Uint32x4, b: Uint16x8, v: Uint16x8, lane: int32): Uint32x4 {.importc: "vmlsl_high_laneq_u16".}

func vmlsl_high_laneq_u32*(a: Uint64x2, b: Uint32x4, v: Uint32x4, lane: int32): Uint64x2 {.importc: "vmlsl_high_laneq_u32".}

func vmlsl_high_n_s16*(a: Int32x4, b: Int16x8, c: int16): Int32x4 {.importc: "vmlsl_high_n_s16".}

func vmlsl_high_n_s32*(a: Int64x2, b: Int32x4, c: int32): Int64x2 {.importc: "vmlsl_high_n_s32".}

func vmlsl_high_n_u16*(a: Uint32x4, b: Uint16x8, c: uint16): Uint32x4 {.importc: "vmlsl_high_n_u16".}

func vmlsl_high_n_u32*(a: Uint64x2, b: Uint32x4, c: uint32): Uint64x2 {.importc: "vmlsl_high_n_u32".}

func vmlsl_high_s8*(a: Int16x8, b: Int8x16, c: Int8x16): Int16x8 {.importc: "vmlsl_high_s8".}

func vmlsl_high_s16*(a: Int32x4, b: Int16x8, c: Int16x8): Int32x4 {.importc: "vmlsl_high_s16".}

func vmlsl_high_s32*(a: Int64x2, b: Int32x4, c: Int32x4): Int64x2 {.importc: "vmlsl_high_s32".}

func vmlsl_high_u8*(a: Uint16x8, b: Uint8x16, c: Uint8x16): Uint16x8 {.importc: "vmlsl_high_u8".}

func vmlsl_high_u16*(a: Uint32x4, b: Uint16x8, c: Uint16x8): Uint32x4 {.importc: "vmlsl_high_u16".}

func vmlsl_high_u32*(a: Uint64x2, b: Uint32x4, c: Uint32x4): Uint64x2 {.importc: "vmlsl_high_u32".}

func vmlsl_lane_s16*(a: Int32x4, b: Int16x4, v: Int16x4, lane: int32): Int32x4 {.importc: "vmlsl_lane_s16".}

func vmlsl_lane_s32*(a: Int64x2, b: Int32x2, v: Int32x2, lane: int32): Int64x2 {.importc: "vmlsl_lane_s32".}

func vmlsl_lane_u16*(a: Uint32x4, b: Uint16x4, v: Uint16x4, lane: int32): Uint32x4 {.importc: "vmlsl_lane_u16".}

func vmlsl_lane_u32*(a: Uint64x2, b: Uint32x2, v: Uint32x2, lane: int32): Uint64x2 {.importc: "vmlsl_lane_u32".}

func vmlsl_laneq_s16*(a: Int32x4, b: Int16x4, v: Int16x8, lane: int32): Int32x4 {.importc: "vmlsl_laneq_s16".}

func vmlsl_laneq_s32*(a: Int64x2, b: Int32x2, v: Int32x4, lane: int32): Int64x2 {.importc: "vmlsl_laneq_s32".}

func vmlsl_laneq_u16*(a: Uint32x4, b: Uint16x4, v: Uint16x8, lane: int32): Uint32x4 {.importc: "vmlsl_laneq_u16".}

func vmlsl_laneq_u32*(a: Uint64x2, b: Uint32x2, v: Uint32x4, lane: int32): Uint64x2 {.importc: "vmlsl_laneq_u32".}

func vmlsl_n_s16*(a: Int32x4, b: Int16x4, c: int16): Int32x4 {.importc: "vmlsl_n_s16".}

func vmlsl_n_s32*(a: Int64x2, b: Int32x2, c: int32): Int64x2 {.importc: "vmlsl_n_s32".}

func vmlsl_n_u16*(a: Uint32x4, b: Uint16x4, c: uint16): Uint32x4 {.importc: "vmlsl_n_u16".}

func vmlsl_n_u32*(a: Uint64x2, b: Uint32x2, c: uint32): Uint64x2 {.importc: "vmlsl_n_u32".}

func vmlsl_s8*(a: Int16x8, b: Int8x8, c: Int8x8): Int16x8 {.importc: "vmlsl_s8".}

func vmlsl_s16*(a: Int32x4, b: Int16x4, c: Int16x4): Int32x4 {.importc: "vmlsl_s16".}

func vmlsl_s32*(a: Int64x2, b: Int32x2, c: Int32x2): Int64x2 {.importc: "vmlsl_s32".}

func vmlsl_u8*(a: Uint16x8, b: Uint8x8, c: Uint8x8): Uint16x8 {.importc: "vmlsl_u8".}

func vmlsl_u16*(a: Uint32x4, b: Uint16x4, c: Uint16x4): Uint32x4 {.importc: "vmlsl_u16".}

func vmlsl_u32*(a: Uint64x2, b: Uint32x2, c: Uint32x2): Uint64x2 {.importc: "vmlsl_u32".}

func vmlsq_n_f32*(a: Float32x4, b: Float32x4, c: float32): Float32x4 {.importc: "vmlsq_n_f32".}

func vmlsq_n_s16*(a: Int16x8, b: Int16x8, c: int16): Int16x8 {.importc: "vmlsq_n_s16".}

func vmlsq_n_s32*(a: Int32x4, b: Int32x4, c: int32): Int32x4 {.importc: "vmlsq_n_s32".}

func vmlsq_n_u16*(a: Uint16x8, b: Uint16x8, c: uint16): Uint16x8 {.importc: "vmlsq_n_u16".}

func vmlsq_n_u32*(a: Uint32x4, b: Uint32x4, c: uint32): Uint32x4 {.importc: "vmlsq_n_u32".}

func vmlsq_s8*(a: Int8x16, b: Int8x16, c: Int8x16): Int8x16 {.importc: "vmlsq_s8".}

func vmlsq_s16*(a: Int16x8, b: Int16x8, c: Int16x8): Int16x8 {.importc: "vmlsq_s16".}

func vmlsq_s32*(a: Int32x4, b: Int32x4, c: Int32x4): Int32x4 {.importc: "vmlsq_s32".}

func vmlsq_u8*(a: Uint8x16, b: Uint8x16, c: Uint8x16): Uint8x16 {.importc: "vmlsq_u8".}

func vmlsq_u16*(a: Uint16x8, b: Uint16x8, c: Uint16x8): Uint16x8 {.importc: "vmlsq_u16".}

func vmlsq_u32*(a: Uint32x4, b: Uint32x4, c: Uint32x4): Uint32x4 {.importc: "vmlsq_u32".}

func vmovl_high_s8*(a: Int8x16): Int16x8 {.importc: "vmovl_high_s8".}

func vmovl_high_s16*(a: Int16x8): Int32x4 {.importc: "vmovl_high_s16".}

func vmovl_high_s32*(a: Int32x4): Int64x2 {.importc: "vmovl_high_s32".}

func vmovl_high_u8*(a: Uint8x16): Uint16x8 {.importc: "vmovl_high_u8".}

func vmovl_high_u16*(a: Uint16x8): Uint32x4 {.importc: "vmovl_high_u16".}

func vmovl_high_u32*(a: Uint32x4): Uint64x2 {.importc: "vmovl_high_u32".}

func vmovl_s8*(a: Int8x8): Int16x8 {.importc: "vmovl_s8".}

func vmovl_s16*(a: Int16x4): Int32x4 {.importc: "vmovl_s16".}

func vmovl_s32*(a: Int32x2): Int64x2 {.importc: "vmovl_s32".}

func vmovl_u8*(a: Uint8x8): Uint16x8 {.importc: "vmovl_u8".}

func vmovl_u16*(a: Uint16x4): Uint32x4 {.importc: "vmovl_u16".}

func vmovl_u32*(a: Uint32x2): Uint64x2 {.importc: "vmovl_u32".}

func vmovn_high_s16*(a: Int8x8, b: Int16x8): Int8x16 {.importc: "vmovn_high_s16".}

func vmovn_high_s32*(a: Int16x4, b: Int32x4): Int16x8 {.importc: "vmovn_high_s32".}

func vmovn_high_s64*(a: Int32x2, b: Int64x2): Int32x4 {.importc: "vmovn_high_s64".}

func vmovn_high_u16*(a: Uint8x8, b: Uint16x8): Uint8x16 {.importc: "vmovn_high_u16".}

func vmovn_high_u32*(a: Uint16x4, b: Uint32x4): Uint16x8 {.importc: "vmovn_high_u32".}

func vmovn_high_u64*(a: Uint32x2, b: Uint64x2): Uint32x4 {.importc: "vmovn_high_u64".}

func vmovn_s16*(a: Int16x8): Int8x8 {.importc: "vmovn_s16".}

func vmovn_s32*(a: Int32x4): Int16x4 {.importc: "vmovn_s32".}

func vmovn_s64*(a: Int64x2): Int32x2 {.importc: "vmovn_s64".}

func vmovn_u16*(a: Uint16x8): Uint8x8 {.importc: "vmovn_u16".}

func vmovn_u32*(a: Uint32x4): Uint16x4 {.importc: "vmovn_u32".}

func vmovn_u64*(a: Uint64x2): Uint32x2 {.importc: "vmovn_u64".}

func vshrn_n_s16*(a: Int16x8, b: int32): Int8x8 {.importc: "vshrn_n_s16".}

func vshrn_n_s32*(a: Int32x4, b: int32): Int16x4 {.importc: "vshrn_n_s32".}

func vshrn_n_s64*(a: Int64x2, b: int32): Int32x2 {.importc: "vshrn_n_s64".}

func vshrn_n_u16*(a: Uint16x8, b: int32): Uint8x8 {.importc: "vshrn_n_u16".}

func vshrn_n_u32*(a: Uint32x4, b: int32): Uint16x4 {.importc: "vshrn_n_u32".}

func vshrn_n_u64*(a: Uint64x2, b: int32): Uint32x2 {.importc: "vshrn_n_u64".}

func vmull_high_lane_s16*(a: Int16x8, v: Int16x4, lane: int32): Int32x4 {.importc: "vmull_high_lane_s16".}

func vmull_high_lane_s32*(a: Int32x4, v: Int32x2, lane: int32): Int64x2 {.importc: "vmull_high_lane_s32".}

func vmull_high_lane_u16*(a: Uint16x8, v: Uint16x4, lane: int32): Uint32x4 {.importc: "vmull_high_lane_u16".}

func vmull_high_lane_u32*(a: Uint32x4, v: Uint32x2, lane: int32): Uint64x2 {.importc: "vmull_high_lane_u32".}

func vmull_high_laneq_s16*(a: Int16x8, v: Int16x8, lane: int32): Int32x4 {.importc: "vmull_high_laneq_s16".}

func vmull_high_laneq_s32*(a: Int32x4, v: Int32x4, lane: int32): Int64x2 {.importc: "vmull_high_laneq_s32".}

func vmull_high_laneq_u16*(a: Uint16x8, v: Uint16x8, lane: int32): Uint32x4 {.importc: "vmull_high_laneq_u16".}

func vmull_high_laneq_u32*(a: Uint32x4, v: Uint32x4, lane: int32): Uint64x2 {.importc: "vmull_high_laneq_u32".}

func vmull_high_n_s16*(a: Int16x8, b: int16): Int32x4 {.importc: "vmull_high_n_s16".}

func vmull_high_n_s32*(a: Int32x4, b: int32): Int64x2 {.importc: "vmull_high_n_s32".}

func vmull_high_n_u16*(a: Uint16x8, b: uint16): Uint32x4 {.importc: "vmull_high_n_u16".}

func vmull_high_n_u32*(a: Uint32x4, b: uint32): Uint64x2 {.importc: "vmull_high_n_u32".}

func vmull_high_p8*(a: Poly8x16, b: Poly8x16): Poly16x8 {.importc: "vmull_high_p8".}

func vmull_high_s8*(a: Int8x16, b: Int8x16): Int16x8 {.importc: "vmull_high_s8".}

func vmull_high_s16*(a: Int16x8, b: Int16x8): Int32x4 {.importc: "vmull_high_s16".}

func vmull_high_s32*(a: Int32x4, b: Int32x4): Int64x2 {.importc: "vmull_high_s32".}

func vmull_high_u8*(a: Uint8x16, b: Uint8x16): Uint16x8 {.importc: "vmull_high_u8".}

func vmull_high_u16*(a: Uint16x8, b: Uint16x8): Uint32x4 {.importc: "vmull_high_u16".}

func vmull_high_u32*(a: Uint32x4, b: Uint32x4): Uint64x2 {.importc: "vmull_high_u32".}

func vmull_lane_s16*(a: Int16x4, b: Int16x4, c: int32): Int32x4 {.importc: "vmull_lane_s16".}

func vmull_lane_s32*(a: Int32x2, b: Int32x2, c: int32): Int64x2 {.importc: "vmull_lane_s32".}

func vmull_lane_u16*(a: Uint16x4, b: Uint16x4, c: int32): Uint32x4 {.importc: "vmull_lane_u16".}

func vmull_lane_u32*(a: Uint32x2, b: Uint32x2, c: int32): Uint64x2 {.importc: "vmull_lane_u32".}

func vmull_laneq_s16*(a: Int16x4, b: Int16x8, c: int32): Int32x4 {.importc: "vmull_laneq_s16".}

func vmull_laneq_s32*(a: Int32x2, b: Int32x4, c: int32): Int64x2 {.importc: "vmull_laneq_s32".}

func vmull_laneq_u16*(a: Uint16x4, b: Uint16x8, c: int32): Uint32x4 {.importc: "vmull_laneq_u16".}

func vmull_laneq_u32*(a: Uint32x2, b: Uint32x4, c: int32): Uint64x2 {.importc: "vmull_laneq_u32".}

func vmull_n_s16*(a: Int16x4, b: int16): Int32x4 {.importc: "vmull_n_s16".}

func vmull_n_s32*(a: Int32x2, b: int32): Int64x2 {.importc: "vmull_n_s32".}

func vmull_n_u16*(a: Uint16x4, b: uint16): Uint32x4 {.importc: "vmull_n_u16".}

func vmull_n_u32*(a: Uint32x2, b: uint32): Uint64x2 {.importc: "vmull_n_u32".}

func vmull_p8*(a: Poly8x8, b: Poly8x8): Poly16x8 {.importc: "vmull_p8".}

func vmull_s8*(a: Int8x8, b: Int8x8): Int16x8 {.importc: "vmull_s8".}

func vmull_s16*(a: Int16x4, b: Int16x4): Int32x4 {.importc: "vmull_s16".}

func vmull_s32*(a: Int32x2, b: Int32x2): Int64x2 {.importc: "vmull_s32".}

func vmull_u8*(a: Uint8x8, b: Uint8x8): Uint16x8 {.importc: "vmull_u8".}

func vmull_u16*(a: Uint16x4, b: Uint16x4): Uint32x4 {.importc: "vmull_u16".}

func vmull_u32*(a: Uint32x2, b: Uint32x2): Uint64x2 {.importc: "vmull_u32".}

func vpadal_s8*(a: Int16x4, b: Int8x8): Int16x4 {.importc: "vpadal_s8".}

func vpadal_s16*(a: Int32x2, b: Int16x4): Int32x2 {.importc: "vpadal_s16".}

func vpadal_s32*(a: Int64x1, b: Int32x2): Int64x1 {.importc: "vpadal_s32".}

func vpadal_u8*(a: Uint16x4, b: Uint8x8): Uint16x4 {.importc: "vpadal_u8".}

func vpadal_u16*(a: Uint32x2, b: Uint16x4): Uint32x2 {.importc: "vpadal_u16".}

func vpadal_u32*(a: Uint64x1, b: Uint32x2): Uint64x1 {.importc: "vpadal_u32".}

func vpadalq_s8*(a: Int16x8, b: Int8x16): Int16x8 {.importc: "vpadalq_s8".}

func vpadalq_s16*(a: Int32x4, b: Int16x8): Int32x4 {.importc: "vpadalq_s16".}

func vpadalq_s32*(a: Int64x2, b: Int32x4): Int64x2 {.importc: "vpadalq_s32".}

func vpadalq_u8*(a: Uint16x8, b: Uint8x16): Uint16x8 {.importc: "vpadalq_u8".}

func vpadalq_u16*(a: Uint32x4, b: Uint16x8): Uint32x4 {.importc: "vpadalq_u16".}

func vpadalq_u32*(a: Uint64x2, b: Uint32x4): Uint64x2 {.importc: "vpadalq_u32".}

func vpaddl_s8*(a: Int8x8): Int16x4 {.importc: "vpaddl_s8".}

func vpaddl_s16*(a: Int16x4): Int32x2 {.importc: "vpaddl_s16".}

func vpaddl_s32*(a: Int32x2): Int64x1 {.importc: "vpaddl_s32".}

func vpaddl_u8*(a: Uint8x8): Uint16x4 {.importc: "vpaddl_u8".}

func vpaddl_u16*(a: Uint16x4): Uint32x2 {.importc: "vpaddl_u16".}

func vpaddl_u32*(a: Uint32x2): Uint64x1 {.importc: "vpaddl_u32".}

func vpaddlq_s8*(a: Int8x16): Int16x8 {.importc: "vpaddlq_s8".}

func vpaddlq_s16*(a: Int16x8): Int32x4 {.importc: "vpaddlq_s16".}

func vpaddlq_s32*(a: Int32x4): Int64x2 {.importc: "vpaddlq_s32".}

func vpaddlq_u8*(a: Uint8x16): Uint16x8 {.importc: "vpaddlq_u8".}

func vpaddlq_u16*(a: Uint16x8): Uint32x4 {.importc: "vpaddlq_u16".}

func vpaddlq_u32*(a: Uint32x4): Uint64x2 {.importc: "vpaddlq_u32".}

func vpaddq_s8*(a: Int8x16, b: Int8x16): Int8x16 {.importc: "vpaddq_s8".}

func vpaddq_s16*(a: Int16x8, b: Int16x8): Int16x8 {.importc: "vpaddq_s16".}

func vpaddq_s32*(a: Int32x4, b: Int32x4): Int32x4 {.importc: "vpaddq_s32".}

func vpaddq_s64*(a: Int64x2, b: Int64x2): Int64x2 {.importc: "vpaddq_s64".}

func vpaddq_u8*(a: Uint8x16, b: Uint8x16): Uint8x16 {.importc: "vpaddq_u8".}

func vpaddq_u16*(a: Uint16x8, b: Uint16x8): Uint16x8 {.importc: "vpaddq_u16".}

func vpaddq_u32*(a: Uint32x4, b: Uint32x4): Uint32x4 {.importc: "vpaddq_u32".}

func vpaddq_u64*(a: Uint64x2, b: Uint64x2): Uint64x2 {.importc: "vpaddq_u64".}

func vqdmulh_n_s16*(a: Int16x4, b: int16): Int16x4 {.importc: "vqdmulh_n_s16".}

func vqdmulh_n_s32*(a: Int32x2, b: int32): Int32x2 {.importc: "vqdmulh_n_s32".}

func vqdmulhq_n_s16*(a: Int16x8, b: int16): Int16x8 {.importc: "vqdmulhq_n_s16".}

func vqdmulhq_n_s32*(a: Int32x4, b: int32): Int32x4 {.importc: "vqdmulhq_n_s32".}

func vqmovn_high_s16*(a: Int8x8, b: Int16x8): Int8x16 {.importc: "vqmovn_high_s16".}

func vqmovn_high_s32*(a: Int16x4, b: Int32x4): Int16x8 {.importc: "vqmovn_high_s32".}

func vqmovn_high_s64*(a: Int32x2, b: Int64x2): Int32x4 {.importc: "vqmovn_high_s64".}

func vqmovn_high_u16*(a: Uint8x8, b: Uint16x8): Uint8x16 {.importc: "vqmovn_high_u16".}

func vqmovn_high_u32*(a: Uint16x4, b: Uint32x4): Uint16x8 {.importc: "vqmovn_high_u32".}

func vqmovn_high_u64*(a: Uint32x2, b: Uint64x2): Uint32x4 {.importc: "vqmovn_high_u64".}

func vqmovun_high_s16*(a: Uint8x8, b: Int16x8): Uint8x16 {.importc: "vqmovun_high_s16".}

func vqmovun_high_s32*(a: Uint16x4, b: Int32x4): Uint16x8 {.importc: "vqmovun_high_s32".}

func vqmovun_high_s64*(a: Uint32x2, b: Int64x2): Uint32x4 {.importc: "vqmovun_high_s64".}

func vqrdmulh_n_s16*(a: Int16x4, b: int16): Int16x4 {.importc: "vqrdmulh_n_s16".}

func vqrdmulh_n_s32*(a: Int32x2, b: int32): Int32x2 {.importc: "vqrdmulh_n_s32".}

func vqrdmulhq_n_s16*(a: Int16x8, b: int16): Int16x8 {.importc: "vqrdmulhq_n_s16".}

func vqrdmulhq_n_s32*(a: Int32x4, b: int32): Int32x4 {.importc: "vqrdmulhq_n_s32".}

func vqrshrn_high_n_s16*(a: Int8x8, b: Int16x8, c: int32): Int8x16 {.importc: "vqrshrn_high_n_s16".}

func vqrshrn_high_n_s32*(a: Int16x4, b: Int32x4, c: int32): Int16x8 {.importc: "vqrshrn_high_n_s32".}

func vqrshrn_high_n_s64*(a: Int32x2, b: Int64x2, c: int32): Int32x4 {.importc: "vqrshrn_high_n_s64".}

func vqrshrn_high_n_u16*(a: Uint8x8, b: Uint16x8, c: int32): Uint8x16 {.importc: "vqrshrn_high_n_u16".}

func vqrshrn_high_n_u32*(a: Uint16x4, b: Uint32x4, c: int32): Uint16x8 {.importc: "vqrshrn_high_n_u32".}

func vqrshrn_high_n_u64*(a: Uint32x2, b: Uint64x2, c: int32): Uint32x4 {.importc: "vqrshrn_high_n_u64".}

func vqrshrun_high_n_s16*(a: Uint8x8, b: Int16x8, c: int32): Uint8x16 {.importc: "vqrshrun_high_n_s16".}

func vqrshrun_high_n_s32*(a: Uint16x4, b: Int32x4, c: int32): Uint16x8 {.importc: "vqrshrun_high_n_s32".}

func vqrshrun_high_n_s64*(a: Uint32x2, b: Int64x2, c: int32): Uint32x4 {.importc: "vqrshrun_high_n_s64".}

func vqshrn_high_n_s16*(a: Int8x8, b: Int16x8, c: int32): Int8x16 {.importc: "vqshrn_high_n_s16".}

func vqshrn_high_n_s32*(a: Int16x4, b: Int32x4, c: int32): Int16x8 {.importc: "vqshrn_high_n_s32".}

func vqshrn_high_n_s64*(a: Int32x2, b: Int64x2, c: int32): Int32x4 {.importc: "vqshrn_high_n_s64".}

func vqshrn_high_n_u16*(a: Uint8x8, b: Uint16x8, c: int32): Uint8x16 {.importc: "vqshrn_high_n_u16".}

func vqshrn_high_n_u32*(a: Uint16x4, b: Uint32x4, c: int32): Uint16x8 {.importc: "vqshrn_high_n_u32".}

func vqshrn_high_n_u64*(a: Uint32x2, b: Uint64x2, c: int32): Uint32x4 {.importc: "vqshrn_high_n_u64".}

func vqshrun_high_n_s16*(a: Uint8x8, b: Int16x8, c: int32): Uint8x16 {.importc: "vqshrun_high_n_s16".}

func vqshrun_high_n_s32*(a: Uint16x4, b: Int32x4, c: int32): Uint16x8 {.importc: "vqshrun_high_n_s32".}

func vqshrun_high_n_s64*(a: Uint32x2, b: Int64x2, c: int32): Uint32x4 {.importc: "vqshrun_high_n_s64".}

func vrshrn_high_n_s16*(a: Int8x8, b: Int16x8, c: int32): Int8x16 {.importc: "vrshrn_high_n_s16".}

func vrshrn_high_n_s32*(a: Int16x4, b: Int32x4, c: int32): Int16x8 {.importc: "vrshrn_high_n_s32".}

func vrshrn_high_n_s64*(a: Int32x2, b: Int64x2, c: int32): Int32x4 {.importc: "vrshrn_high_n_s64".}

func vrshrn_high_n_u16*(a: Uint8x8, b: Uint16x8, c: int32): Uint8x16 {.importc: "vrshrn_high_n_u16".}

func vrshrn_high_n_u32*(a: Uint16x4, b: Uint32x4, c: int32): Uint16x8 {.importc: "vrshrn_high_n_u32".}

func vrshrn_high_n_u64*(a: Uint32x2, b: Uint64x2, c: int32): Uint32x4 {.importc: "vrshrn_high_n_u64".}

func vrshrn_n_s16*(a: Int16x8, b: int32): Int8x8 {.importc: "vrshrn_n_s16".}

func vrshrn_n_s32*(a: Int32x4, b: int32): Int16x4 {.importc: "vrshrn_n_s32".}

func vrshrn_n_s64*(a: Int64x2, b: int32): Int32x2 {.importc: "vrshrn_n_s64".}

func vrshrn_n_u16*(a: Uint16x8, b: int32): Uint8x8 {.importc: "vrshrn_n_u16".}

func vrshrn_n_u32*(a: Uint32x4, b: int32): Uint16x4 {.importc: "vrshrn_n_u32".}

func vrshrn_n_u64*(a: Uint64x2, b: int32): Uint32x2 {.importc: "vrshrn_n_u64".}

func vrsqrte_u32*(a: Uint32x2): Uint32x2 {.importc: "vrsqrte_u32".}

func vrsqrteq_u32*(a: Uint32x4): Uint32x4 {.importc: "vrsqrteq_u32".}

func vshrn_high_n_s16*(a: Int8x8, b: Int16x8, c: int32): Int8x16 {.importc: "vshrn_high_n_s16".}

func vshrn_high_n_s32*(a: Int16x4, b: Int32x4, c: int32): Int16x8 {.importc: "vshrn_high_n_s32".}

func vshrn_high_n_s64*(a: Int32x2, b: Int64x2, c: int32): Int32x4 {.importc: "vshrn_high_n_s64".}

func vshrn_high_n_u16*(a: Uint8x8, b: Uint16x8, c: int32): Uint8x16 {.importc: "vshrn_high_n_u16".}

func vshrn_high_n_u32*(a: Uint16x4, b: Uint32x4, c: int32): Uint16x8 {.importc: "vshrn_high_n_u32".}

func vshrn_high_n_u64*(a: Uint32x2, b: Uint64x2, c: int32): Uint32x4 {.importc: "vshrn_high_n_u64".}

func vsli_n_p8*(a: Poly8x8, b: Poly8x8, c: int32): Poly8x8 {.importc: "vsli_n_p8".}

func vsli_n_p16*(a: Poly16x4, b: Poly16x4, c: int32): Poly16x4 {.importc: "vsli_n_p16".}

func vsliq_n_p8*(a: Poly8x16, b: Poly8x16, c: int32): Poly8x16 {.importc: "vsliq_n_p8".}

func vsliq_n_p16*(a: Poly16x8, b: Poly16x8, c: int32): Poly16x8 {.importc: "vsliq_n_p16".}

func vsri_n_p8*(a: Poly8x8, b: Poly8x8, c: int32): Poly8x8 {.importc: "vsri_n_p8".}

func vsri_n_p16*(a: Poly16x4, b: Poly16x4, c: int32): Poly16x4 {.importc: "vsri_n_p16".}

func vsri_n_p64*(a: Poly64x1, b: Poly64x1, c: int32): Poly64x1 {.importc: "vsri_n_p64".}

func vsriq_n_p8*(a: Poly8x16, b: Poly8x16, c: int32): Poly8x16 {.importc: "vsriq_n_p8".}

func vsriq_n_p16*(a: Poly16x8, b: Poly16x8, c: int32): Poly16x8 {.importc: "vsriq_n_p16".}

func vsriq_n_p64*(a: Poly64x2, b: Poly64x2, c: int32): Poly64x2 {.importc: "vsriq_n_p64".}

func vtst_p8*(a: Poly8x8, b: Poly8x8): Uint8x8 {.importc: "vtst_p8".}

func vtst_p16*(a: Poly16x4, b: Poly16x4): Uint16x4 {.importc: "vtst_p16".}

func vtst_p64*(a: Poly64x1, b: Poly64x1): Uint64x1 {.importc: "vtst_p64".}

func vtstq_p8*(a: Poly8x16, b: Poly8x16): Uint8x16 {.importc: "vtstq_p8".}

func vtstq_p16*(a: Poly16x8, b: Poly16x8): Uint16x8 {.importc: "vtstq_p16".}

func vtstq_p64*(a: Poly64x2, b: Poly64x2): Uint64x2 {.importc: "vtstq_p64".}

func vst2_lane_f16*(ptr: ptr float16, val: Float16x4x2, lane: int32): void {.importc: "vst2_lane_f16".}

func vst2_lane_f32*(ptr: ptr float32, val: Float32x2x2, lane: int32): void {.importc: "vst2_lane_f32".}

func vst2_lane_f64*(ptr: ptr float64, val: Float64x1x2, lane: int32): void {.importc: "vst2_lane_f64".}

func vst2_lane_p8*(ptr: ptr Poly8, val: Poly8x8x2, lane: int32): void {.importc: "vst2_lane_p8".}

func vst2_lane_p16*(ptr: ptr Poly16, val: Poly16x4x2, lane: int32): void {.importc: "vst2_lane_p16".}

func vst2_lane_p64*(ptr: ptr Poly64, val: Poly64x1x2, lane: int32): void {.importc: "vst2_lane_p64".}

func vst2_lane_s8*(ptr: ptr int8, val: Int8x8x2, lane: int32): void {.importc: "vst2_lane_s8".}

func vst2_lane_s16*(ptr: ptr int16, val: Int16x4x2, lane: int32): void {.importc: "vst2_lane_s16".}

func vst2_lane_s32*(ptr: ptr int32, val: Int32x2x2, lane: int32): void {.importc: "vst2_lane_s32".}

func vst2_lane_s64*(ptr: ptr int64, val: Int64x1x2, lane: int32): void {.importc: "vst2_lane_s64".}

func vst2_lane_u8*(ptr: ptr uint8, val: Uint8x8x2, lane: int32): void {.importc: "vst2_lane_u8".}

func vst2_lane_u16*(ptr: ptr uint16, val: Uint16x4x2, lane: int32): void {.importc: "vst2_lane_u16".}

func vst2_lane_u32*(ptr: ptr uint32, val: Uint32x2x2, lane: int32): void {.importc: "vst2_lane_u32".}

func vst2_lane_u64*(ptr: ptr uint64, val: Uint64x1x2, lane: int32): void {.importc: "vst2_lane_u64".}

func vst2q_lane_f16*(ptr: ptr float16, val: Float16x8x2, lane: int32): void {.importc: "vst2q_lane_f16".}

func vst2q_lane_f32*(ptr: ptr float32, val: Float32x4x2, lane: int32): void {.importc: "vst2q_lane_f32".}

func vst2q_lane_f64*(ptr: ptr float64, val: Float64x2x2, lane: int32): void {.importc: "vst2q_lane_f64".}

func vst2q_lane_p8*(ptr: ptr Poly8, val: Poly8x16x2, lane: int32): void {.importc: "vst2q_lane_p8".}

func vst2q_lane_p16*(ptr: ptr Poly16, val: Poly16x8x2, lane: int32): void {.importc: "vst2q_lane_p16".}

func vst2q_lane_p64*(ptr: ptr Poly64, val: Poly64x2x2, lane: int32): void {.importc: "vst2q_lane_p64".}

func vst2q_lane_s8*(ptr: ptr int8, val: Int8x16x2, lane: int32): void {.importc: "vst2q_lane_s8".}

func vst2q_lane_s16*(ptr: ptr int16, val: Int16x8x2, lane: int32): void {.importc: "vst2q_lane_s16".}

func vst2q_lane_s32*(ptr: ptr int32, val: Int32x4x2, lane: int32): void {.importc: "vst2q_lane_s32".}

func vst2q_lane_s64*(ptr: ptr int64, val: Int64x2x2, lane: int32): void {.importc: "vst2q_lane_s64".}

func vst2q_lane_u8*(ptr: ptr uint8, val: Uint8x16x2, lane: int32): void {.importc: "vst2q_lane_u8".}

func vst2q_lane_u16*(ptr: ptr uint16, val: Uint16x8x2, lane: int32): void {.importc: "vst2q_lane_u16".}

func vst2q_lane_u32*(ptr: ptr uint32, val: Uint32x4x2, lane: int32): void {.importc: "vst2q_lane_u32".}

func vst2q_lane_u64*(ptr: ptr uint64, val: Uint64x2x2, lane: int32): void {.importc: "vst2q_lane_u64".}

func vst3_lane_f16*(ptr: ptr float16, val: Float16x4x3, lane: int32): void {.importc: "vst3_lane_f16".}

func vst3_lane_f32*(ptr: ptr float32, val: Float32x2x3, lane: int32): void {.importc: "vst3_lane_f32".}

func vst3_lane_f64*(ptr: ptr float64, val: Float64x1x3, lane: int32): void {.importc: "vst3_lane_f64".}

func vst3_lane_p8*(ptr: ptr Poly8, val: Poly8x8x3, lane: int32): void {.importc: "vst3_lane_p8".}

func vst3_lane_p16*(ptr: ptr Poly16, val: Poly16x4x3, lane: int32): void {.importc: "vst3_lane_p16".}

func vst3_lane_p64*(ptr: ptr Poly64, val: Poly64x1x3, lane: int32): void {.importc: "vst3_lane_p64".}

func vst3_lane_s8*(ptr: ptr int8, val: Int8x8x3, lane: int32): void {.importc: "vst3_lane_s8".}

func vst3_lane_s16*(ptr: ptr int16, val: Int16x4x3, lane: int32): void {.importc: "vst3_lane_s16".}

func vst3_lane_s32*(ptr: ptr int32, val: Int32x2x3, lane: int32): void {.importc: "vst3_lane_s32".}

func vst3_lane_s64*(ptr: ptr int64, val: Int64x1x3, lane: int32): void {.importc: "vst3_lane_s64".}

func vst3_lane_u8*(ptr: ptr uint8, val: Uint8x8x3, lane: int32): void {.importc: "vst3_lane_u8".}

func vst3_lane_u16*(ptr: ptr uint16, val: Uint16x4x3, lane: int32): void {.importc: "vst3_lane_u16".}

func vst3_lane_u32*(ptr: ptr uint32, val: Uint32x2x3, lane: int32): void {.importc: "vst3_lane_u32".}

func vst3_lane_u64*(ptr: ptr uint64, val: Uint64x1x3, lane: int32): void {.importc: "vst3_lane_u64".}

func vst3q_lane_f16*(ptr: ptr float16, val: Float16x8x3, lane: int32): void {.importc: "vst3q_lane_f16".}

func vst3q_lane_f32*(ptr: ptr float32, val: Float32x4x3, lane: int32): void {.importc: "vst3q_lane_f32".}

func vst3q_lane_f64*(ptr: ptr float64, val: Float64x2x3, lane: int32): void {.importc: "vst3q_lane_f64".}

func vst3q_lane_p8*(ptr: ptr Poly8, val: Poly8x16x3, lane: int32): void {.importc: "vst3q_lane_p8".}

func vst3q_lane_p16*(ptr: ptr Poly16, val: Poly16x8x3, lane: int32): void {.importc: "vst3q_lane_p16".}

func vst3q_lane_p64*(ptr: ptr Poly64, val: Poly64x2x3, lane: int32): void {.importc: "vst3q_lane_p64".}

func vst3q_lane_s8*(ptr: ptr int8, val: Int8x16x3, lane: int32): void {.importc: "vst3q_lane_s8".}

func vst3q_lane_s16*(ptr: ptr int16, val: Int16x8x3, lane: int32): void {.importc: "vst3q_lane_s16".}

func vst3q_lane_s32*(ptr: ptr int32, val: Int32x4x3, lane: int32): void {.importc: "vst3q_lane_s32".}

func vst3q_lane_s64*(ptr: ptr int64, val: Int64x2x3, lane: int32): void {.importc: "vst3q_lane_s64".}

func vst3q_lane_u8*(ptr: ptr uint8, val: Uint8x16x3, lane: int32): void {.importc: "vst3q_lane_u8".}

func vst3q_lane_u16*(ptr: ptr uint16, val: Uint16x8x3, lane: int32): void {.importc: "vst3q_lane_u16".}

func vst3q_lane_u32*(ptr: ptr uint32, val: Uint32x4x3, lane: int32): void {.importc: "vst3q_lane_u32".}

func vst3q_lane_u64*(ptr: ptr uint64, val: Uint64x2x3, lane: int32): void {.importc: "vst3q_lane_u64".}

func vst4_lane_f16*(ptr: ptr float16, val: Float16x4x4, lane: int32): void {.importc: "vst4_lane_f16".}

func vst4_lane_f32*(ptr: ptr float32, val: Float32x2x4, lane: int32): void {.importc: "vst4_lane_f32".}

func vst4_lane_f64*(ptr: ptr float64, val: Float64x1x4, lane: int32): void {.importc: "vst4_lane_f64".}

func vst4_lane_p8*(ptr: ptr Poly8, val: Poly8x8x4, lane: int32): void {.importc: "vst4_lane_p8".}

func vst4_lane_p16*(ptr: ptr Poly16, val: Poly16x4x4, lane: int32): void {.importc: "vst4_lane_p16".}

func vst4_lane_p64*(ptr: ptr Poly64, val: Poly64x1x4, lane: int32): void {.importc: "vst4_lane_p64".}

func vst4_lane_s8*(ptr: ptr int8, val: Int8x8x4, lane: int32): void {.importc: "vst4_lane_s8".}

func vst4_lane_s16*(ptr: ptr int16, val: Int16x4x4, lane: int32): void {.importc: "vst4_lane_s16".}

func vst4_lane_s32*(ptr: ptr int32, val: Int32x2x4, lane: int32): void {.importc: "vst4_lane_s32".}

func vst4_lane_s64*(ptr: ptr int64, val: Int64x1x4, lane: int32): void {.importc: "vst4_lane_s64".}

func vst4_lane_u8*(ptr: ptr uint8, val: Uint8x8x4, lane: int32): void {.importc: "vst4_lane_u8".}

func vst4_lane_u16*(ptr: ptr uint16, val: Uint16x4x4, lane: int32): void {.importc: "vst4_lane_u16".}

func vst4_lane_u32*(ptr: ptr uint32, val: Uint32x2x4, lane: int32): void {.importc: "vst4_lane_u32".}

func vst4_lane_u64*(ptr: ptr uint64, val: Uint64x1x4, lane: int32): void {.importc: "vst4_lane_u64".}

func vst4q_lane_f16*(ptr: ptr float16, val: Float16x8x4, lane: int32): void {.importc: "vst4q_lane_f16".}

func vst4q_lane_f32*(ptr: ptr float32, val: Float32x4x4, lane: int32): void {.importc: "vst4q_lane_f32".}

func vst4q_lane_f64*(ptr: ptr float64, val: Float64x2x4, lane: int32): void {.importc: "vst4q_lane_f64".}

func vst4q_lane_p8*(ptr: ptr Poly8, val: Poly8x16x4, lane: int32): void {.importc: "vst4q_lane_p8".}

func vst4q_lane_p16*(ptr: ptr Poly16, val: Poly16x8x4, lane: int32): void {.importc: "vst4q_lane_p16".}

func vst4q_lane_p64*(ptr: ptr Poly64, val: Poly64x2x4, lane: int32): void {.importc: "vst4q_lane_p64".}

func vst4q_lane_s8*(ptr: ptr int8, val: Int8x16x4, lane: int32): void {.importc: "vst4q_lane_s8".}

func vst4q_lane_s16*(ptr: ptr int16, val: Int16x8x4, lane: int32): void {.importc: "vst4q_lane_s16".}

func vst4q_lane_s32*(ptr: ptr int32, val: Int32x4x4, lane: int32): void {.importc: "vst4q_lane_s32".}

func vst4q_lane_s64*(ptr: ptr int64, val: Int64x2x4, lane: int32): void {.importc: "vst4q_lane_s64".}

func vst4q_lane_u8*(ptr: ptr uint8, val: Uint8x16x4, lane: int32): void {.importc: "vst4q_lane_u8".}

func vst4q_lane_u16*(ptr: ptr uint16, val: Uint16x8x4, lane: int32): void {.importc: "vst4q_lane_u16".}

func vst4q_lane_u32*(ptr: ptr uint32, val: Uint32x4x4, lane: int32): void {.importc: "vst4q_lane_u32".}

func vst4q_lane_u64*(ptr: ptr uint64, val: Uint64x2x4, lane: int32): void {.importc: "vst4q_lane_u64".}

func vaddlv_s32*(a: Int32x2): int64 {.importc: "vaddlv_s32".}

func vaddlv_u32*(a: Uint32x2): uint64 {.importc: "vaddlv_u32".}

func vqdmulh_laneq_s16*(a: Int16x4, b: Int16x8, c: int32): Int16x4 {.importc: "vqdmulh_laneq_s16".}

func vqdmulh_laneq_s32*(a: Int32x2, b: Int32x4, c: int32): Int32x2 {.importc: "vqdmulh_laneq_s32".}

func vqdmulhq_laneq_s16*(a: Int16x8, b: Int16x8, c: int32): Int16x8 {.importc: "vqdmulhq_laneq_s16".}

func vqdmulhq_laneq_s32*(a: Int32x4, b: Int32x4, c: int32): Int32x4 {.importc: "vqdmulhq_laneq_s32".}

func vqrdmulh_laneq_s16*(a: Int16x4, b: Int16x8, c: int32): Int16x4 {.importc: "vqrdmulh_laneq_s16".}

func vqrdmulh_laneq_s32*(a: Int32x2, b: Int32x4, c: int32): Int32x2 {.importc: "vqrdmulh_laneq_s32".}

func vqrdmulhq_laneq_s16*(a: Int16x8, b: Int16x8, c: int32): Int16x8 {.importc: "vqrdmulhq_laneq_s16".}

func vqrdmulhq_laneq_s32*(a: Int32x4, b: Int32x4, c: int32): Int32x4 {.importc: "vqrdmulhq_laneq_s32".}

func vqtbl1_p8*(tab: Poly8x16, idx: Uint8x8): Poly8x8 {.importc: "vqtbl1_p8".}

func vqtbl1_s8*(tab: Int8x16, idx: Uint8x8): Int8x8 {.importc: "vqtbl1_s8".}

func vqtbl1_u8*(tab: Uint8x16, idx: Uint8x8): Uint8x8 {.importc: "vqtbl1_u8".}

func vqtbl1q_p8*(tab: Poly8x16, idx: Uint8x16): Poly8x16 {.importc: "vqtbl1q_p8".}

func vqtbl1q_s8*(tab: Int8x16, idx: Uint8x16): Int8x16 {.importc: "vqtbl1q_s8".}

func vqtbl1q_u8*(tab: Uint8x16, idx: Uint8x16): Uint8x16 {.importc: "vqtbl1q_u8".}

func vqtbx1_s8*(r: Int8x8, tab: Int8x16, idx: Uint8x8): Int8x8 {.importc: "vqtbx1_s8".}

func vqtbx1_u8*(r: Uint8x8, tab: Uint8x16, idx: Uint8x8): Uint8x8 {.importc: "vqtbx1_u8".}

func vqtbx1_p8*(r: Poly8x8, tab: Poly8x16, idx: Uint8x8): Poly8x8 {.importc: "vqtbx1_p8".}

func vqtbx1q_s8*(r: Int8x16, tab: Int8x16, idx: Uint8x16): Int8x16 {.importc: "vqtbx1q_s8".}

func vqtbx1q_u8*(r: Uint8x16, tab: Uint8x16, idx: Uint8x16): Uint8x16 {.importc: "vqtbx1q_u8".}

func vqtbx1q_p8*(r: Poly8x16, tab: Poly8x16, idx: Uint8x16): Poly8x16 {.importc: "vqtbx1q_p8".}

func vtbl1_s8*(tab: Int8x8, idx: Int8x8): Int8x8 {.importc: "vtbl1_s8".}

func vtbl1_u8*(tab: Uint8x8, idx: Uint8x8): Uint8x8 {.importc: "vtbl1_u8".}

func vtbl1_p8*(tab: Poly8x8, idx: Uint8x8): Poly8x8 {.importc: "vtbl1_p8".}

func vtbl2_s8*(tab: Int8x8x2, idx: Int8x8): Int8x8 {.importc: "vtbl2_s8".}

func vtbl2_u8*(tab: Uint8x8x2, idx: Uint8x8): Uint8x8 {.importc: "vtbl2_u8".}

func vtbl2_p8*(tab: Poly8x8x2, idx: Uint8x8): Poly8x8 {.importc: "vtbl2_p8".}

func vtbl3_s8*(tab: Int8x8x3, idx: Int8x8): Int8x8 {.importc: "vtbl3_s8".}

func vtbl3_u8*(tab: Uint8x8x3, idx: Uint8x8): Uint8x8 {.importc: "vtbl3_u8".}

func vtbl3_p8*(tab: Poly8x8x3, idx: Uint8x8): Poly8x8 {.importc: "vtbl3_p8".}

func vtbl4_s8*(tab: Int8x8x4, idx: Int8x8): Int8x8 {.importc: "vtbl4_s8".}

func vtbl4_u8*(tab: Uint8x8x4, idx: Uint8x8): Uint8x8 {.importc: "vtbl4_u8".}

func vtbl4_p8*(tab: Poly8x8x4, idx: Uint8x8): Poly8x8 {.importc: "vtbl4_p8".}

func vtbx2_s8*(r: Int8x8, tab: Int8x8x2, idx: Int8x8): Int8x8 {.importc: "vtbx2_s8".}

func vtbx2_u8*(r: Uint8x8, tab: Uint8x8x2, idx: Uint8x8): Uint8x8 {.importc: "vtbx2_u8".}

func vtbx2_p8*(r: Poly8x8, tab: Poly8x8x2, idx: Uint8x8): Poly8x8 {.importc: "vtbx2_p8".}

func vabds_f32*(a: float32, b: float32): float32 {.importc: "vabds_f32".}

func vabdd_f64*(a: float64, b: float64): float64 {.importc: "vabdd_f64".}

func vabd_f32*(a: Float32x2, b: Float32x2): Float32x2 {.importc: "vabd_f32".}

func vabd_f64*(a: Float64x1, b: Float64x1): Float64x1 {.importc: "vabd_f64".}

func vabdq_f32*(a: Float32x4, b: Float32x4): Float32x4 {.importc: "vabdq_f32".}

func vabdq_f64*(a: Float64x2, b: Float64x2): Float64x2 {.importc: "vabdq_f64".}

func vabs_f32*(a: Float32x2): Float32x2 {.importc: "vabs_f32".}

func vabs_f64*(a: Float64x1): Float64x1 {.importc: "vabs_f64".}

func vabs_s8*(a: Int8x8): Int8x8 {.importc: "vabs_s8".}

func vabs_s16*(a: Int16x4): Int16x4 {.importc: "vabs_s16".}

func vabs_s32*(a: Int32x2): Int32x2 {.importc: "vabs_s32".}

func vabs_s64*(a: Int64x1): Int64x1 {.importc: "vabs_s64".}

func vabsq_f32*(a: Float32x4): Float32x4 {.importc: "vabsq_f32".}

func vabsq_f64*(a: Float64x2): Float64x2 {.importc: "vabsq_f64".}

func vabsq_s8*(a: Int8x16): Int8x16 {.importc: "vabsq_s8".}

func vabsq_s16*(a: Int16x8): Int16x8 {.importc: "vabsq_s16".}

func vabsq_s32*(a: Int32x4): Int32x4 {.importc: "vabsq_s32".}

func vabsq_s64*(a: Int64x2): Int64x2 {.importc: "vabsq_s64".}

func vabsd_s64*(a: int64): int64 {.importc: "vabsd_s64".}

func vaddd_s64*(a: int64, b: int64): int64 {.importc: "vaddd_s64".}

func vaddd_u64*(a: uint64, b: uint64): uint64 {.importc: "vaddd_u64".}

func vaddv_s8*(a: Int8x8): int8 {.importc: "vaddv_s8".}

func vaddv_s16*(a: Int16x4): int16 {.importc: "vaddv_s16".}

func vaddv_s32*(a: Int32x2): int32 {.importc: "vaddv_s32".}

func vaddv_u8*(a: Uint8x8): uint8 {.importc: "vaddv_u8".}

func vaddv_u16*(a: Uint16x4): uint16 {.importc: "vaddv_u16".}

func vaddv_u32*(a: Uint32x2): uint32 {.importc: "vaddv_u32".}

func vaddvq_s8*(a: Int8x16): int8 {.importc: "vaddvq_s8".}

func vaddvq_s16*(a: Int16x8): int16 {.importc: "vaddvq_s16".}

func vaddvq_s32*(a: Int32x4): int32 {.importc: "vaddvq_s32".}

func vaddvq_s64*(a: Int64x2): int64 {.importc: "vaddvq_s64".}

func vaddvq_u8*(a: Uint8x16): uint8 {.importc: "vaddvq_u8".}

func vaddvq_u16*(a: Uint16x8): uint16 {.importc: "vaddvq_u16".}

func vaddvq_u32*(a: Uint32x4): uint32 {.importc: "vaddvq_u32".}

func vaddvq_u64*(a: Uint64x2): uint64 {.importc: "vaddvq_u64".}

func vaddv_f32*(a: Float32x2): float32 {.importc: "vaddv_f32".}

func vaddvq_f32*(a: Float32x4): float32 {.importc: "vaddvq_f32".}

func vaddvq_f64*(a: Float64x2): float64 {.importc: "vaddvq_f64".}

func vbsl_f16*(a: Uint16x4, b: Float16x4, c: Float16x4): Float16x4 {.importc: "vbsl_f16".}

func vbsl_f32*(a: Uint32x2, b: Float32x2, c: Float32x2): Float32x2 {.importc: "vbsl_f32".}

func vbsl_f64*(a: Uint64x1, b: Float64x1, c: Float64x1): Float64x1 {.importc: "vbsl_f64".}

func vbsl_p8*(a: Uint8x8, b: Poly8x8, c: Poly8x8): Poly8x8 {.importc: "vbsl_p8".}

func vbsl_p16*(a: Uint16x4, b: Poly16x4, c: Poly16x4): Poly16x4 {.importc: "vbsl_p16".}

func vbsl_p64*(a: Uint64x1, b: Poly64x1, c: Poly64x1): Poly64x1 {.importc: "vbsl_p64".}

func vbsl_s8*(a: Uint8x8, b: Int8x8, c: Int8x8): Int8x8 {.importc: "vbsl_s8".}

func vbsl_s16*(a: Uint16x4, b: Int16x4, c: Int16x4): Int16x4 {.importc: "vbsl_s16".}

func vbsl_s32*(a: Uint32x2, b: Int32x2, c: Int32x2): Int32x2 {.importc: "vbsl_s32".}

func vbsl_s64*(a: Uint64x1, b: Int64x1, c: Int64x1): Int64x1 {.importc: "vbsl_s64".}

func vbsl_u8*(a: Uint8x8, b: Uint8x8, c: Uint8x8): Uint8x8 {.importc: "vbsl_u8".}

func vbsl_u16*(a: Uint16x4, b: Uint16x4, c: Uint16x4): Uint16x4 {.importc: "vbsl_u16".}

func vbsl_u32*(a: Uint32x2, b: Uint32x2, c: Uint32x2): Uint32x2 {.importc: "vbsl_u32".}

func vbsl_u64*(a: Uint64x1, b: Uint64x1, c: Uint64x1): Uint64x1 {.importc: "vbsl_u64".}

func vbslq_f16*(a: Uint16x8, b: Float16x8, c: Float16x8): Float16x8 {.importc: "vbslq_f16".}

func vbslq_f32*(a: Uint32x4, b: Float32x4, c: Float32x4): Float32x4 {.importc: "vbslq_f32".}

func vbslq_f64*(a: Uint64x2, b: Float64x2, c: Float64x2): Float64x2 {.importc: "vbslq_f64".}

func vbslq_p8*(a: Uint8x16, b: Poly8x16, c: Poly8x16): Poly8x16 {.importc: "vbslq_p8".}

func vbslq_p16*(a: Uint16x8, b: Poly16x8, c: Poly16x8): Poly16x8 {.importc: "vbslq_p16".}

func vbslq_s8*(a: Uint8x16, b: Int8x16, c: Int8x16): Int8x16 {.importc: "vbslq_s8".}

func vbslq_s16*(a: Uint16x8, b: Int16x8, c: Int16x8): Int16x8 {.importc: "vbslq_s16".}

func vbslq_p64*(a: Uint64x2, b: Poly64x2, c: Poly64x2): Poly64x2 {.importc: "vbslq_p64".}

func vbslq_s32*(a: Uint32x4, b: Int32x4, c: Int32x4): Int32x4 {.importc: "vbslq_s32".}

func vbslq_s64*(a: Uint64x2, b: Int64x2, c: Int64x2): Int64x2 {.importc: "vbslq_s64".}

func vbslq_u8*(a: Uint8x16, b: Uint8x16, c: Uint8x16): Uint8x16 {.importc: "vbslq_u8".}

func vbslq_u16*(a: Uint16x8, b: Uint16x8, c: Uint16x8): Uint16x8 {.importc: "vbslq_u16".}

func vbslq_u32*(a: Uint32x4, b: Uint32x4, c: Uint32x4): Uint32x4 {.importc: "vbslq_u32".}

func vbslq_u64*(a: Uint64x2, b: Uint64x2, c: Uint64x2): Uint64x2 {.importc: "vbslq_u64".}

func vqrdmlah_s16*(a: Int16x4, b: Int16x4, c: Int16x4): Int16x4 {.importc: "vqrdmlah_s16".}

func vqrdmlah_s32*(a: Int32x2, b: Int32x2, c: Int32x2): Int32x2 {.importc: "vqrdmlah_s32".}

func vqrdmlahq_s16*(a: Int16x8, b: Int16x8, c: Int16x8): Int16x8 {.importc: "vqrdmlahq_s16".}

func vqrdmlahq_s32*(a: Int32x4, b: Int32x4, c: Int32x4): Int32x4 {.importc: "vqrdmlahq_s32".}

func vqrdmlsh_s16*(a: Int16x4, b: Int16x4, c: Int16x4): Int16x4 {.importc: "vqrdmlsh_s16".}

func vqrdmlsh_s32*(a: Int32x2, b: Int32x2, c: Int32x2): Int32x2 {.importc: "vqrdmlsh_s32".}

func vqrdmlshq_s16*(a: Int16x8, b: Int16x8, c: Int16x8): Int16x8 {.importc: "vqrdmlshq_s16".}

func vqrdmlshq_s32*(a: Int32x4, b: Int32x4, c: Int32x4): Int32x4 {.importc: "vqrdmlshq_s32".}

func vqrdmlah_laneq_s16*(a: Int16x4, b: Int16x4, c: Int16x8, d: int32): Int16x4 {.importc: "vqrdmlah_laneq_s16".}

func vqrdmlah_laneq_s32*(a: Int32x2, b: Int32x2, c: Int32x4, d: int32): Int32x2 {.importc: "vqrdmlah_laneq_s32".}

func vqrdmlahq_laneq_s16*(a: Int16x8, b: Int16x8, c: Int16x8, d: int32): Int16x8 {.importc: "vqrdmlahq_laneq_s16".}

func vqrdmlahq_laneq_s32*(a: Int32x4, b: Int32x4, c: Int32x4, d: int32): Int32x4 {.importc: "vqrdmlahq_laneq_s32".}

func vqrdmlsh_laneq_s16*(a: Int16x4, b: Int16x4, c: Int16x8, d: int32): Int16x4 {.importc: "vqrdmlsh_laneq_s16".}

func vqrdmlsh_laneq_s32*(a: Int32x2, b: Int32x2, c: Int32x4, d: int32): Int32x2 {.importc: "vqrdmlsh_laneq_s32".}

func vqrdmlshq_laneq_s16*(a: Int16x8, b: Int16x8, c: Int16x8, d: int32): Int16x8 {.importc: "vqrdmlshq_laneq_s16".}

func vqrdmlshq_laneq_s32*(a: Int32x4, b: Int32x4, c: Int32x4, d: int32): Int32x4 {.importc: "vqrdmlshq_laneq_s32".}

func vqrdmlah_lane_s16*(a: Int16x4, b: Int16x4, c: Int16x4, d: int32): Int16x4 {.importc: "vqrdmlah_lane_s16".}

func vqrdmlah_lane_s32*(a: Int32x2, b: Int32x2, c: Int32x2, d: int32): Int32x2 {.importc: "vqrdmlah_lane_s32".}

func vqrdmlahq_lane_s16*(a: Int16x8, b: Int16x8, c: Int16x4, d: int32): Int16x8 {.importc: "vqrdmlahq_lane_s16".}

func vqrdmlahq_lane_s32*(a: Int32x4, b: Int32x4, c: Int32x2, d: int32): Int32x4 {.importc: "vqrdmlahq_lane_s32".}

func vqrdmlahh_s16*(a: int16, b: int16, c: int16): int16 {.importc: "vqrdmlahh_s16".}

func vqrdmlahh_lane_s16*(a: int16, b: int16, c: Int16x4, d: int32): int16 {.importc: "vqrdmlahh_lane_s16".}

func vqrdmlahh_laneq_s16*(a: int16, b: int16, c: Int16x8, d: int32): int16 {.importc: "vqrdmlahh_laneq_s16".}

func vqrdmlahs_s32*(a: int32, b: int32, c: int32): int32 {.importc: "vqrdmlahs_s32".}

func vqrdmlahs_lane_s32*(a: int32, b: int32, c: Int32x2, d: int32): int32 {.importc: "vqrdmlahs_lane_s32".}

func vqrdmlahs_laneq_s32*(a: int32, b: int32, c: Int32x4, d: int32): int32 {.importc: "vqrdmlahs_laneq_s32".}

func vqrdmlsh_lane_s16*(a: Int16x4, b: Int16x4, c: Int16x4, d: int32): Int16x4 {.importc: "vqrdmlsh_lane_s16".}

func vqrdmlsh_lane_s32*(a: Int32x2, b: Int32x2, c: Int32x2, d: int32): Int32x2 {.importc: "vqrdmlsh_lane_s32".}

func vqrdmlshq_lane_s16*(a: Int16x8, b: Int16x8, c: Int16x4, d: int32): Int16x8 {.importc: "vqrdmlshq_lane_s16".}

func vqrdmlshq_lane_s32*(a: Int32x4, b: Int32x4, c: Int32x2, d: int32): Int32x4 {.importc: "vqrdmlshq_lane_s32".}

func vqrdmlshh_s16*(a: int16, b: int16, c: int16): int16 {.importc: "vqrdmlshh_s16".}

func vqrdmlshh_lane_s16*(a: int16, b: int16, c: Int16x4, d: int32): int16 {.importc: "vqrdmlshh_lane_s16".}

func vqrdmlshh_laneq_s16*(a: int16, b: int16, c: Int16x8, d: int32): int16 {.importc: "vqrdmlshh_laneq_s16".}

func vqrdmlshs_s32*(a: int32, b: int32, c: int32): int32 {.importc: "vqrdmlshs_s32".}

func vqrdmlshs_lane_s32*(a: int32, b: int32, c: Int32x2, d: int32): int32 {.importc: "vqrdmlshs_lane_s32".}

func vqrdmlshs_laneq_s32*(a: int32, b: int32, c: Int32x4, d: int32): int32 {.importc: "vqrdmlshs_laneq_s32".}

func vaeseq_u8*(data: Uint8x16, key: Uint8x16): Uint8x16 {.importc: "vaeseq_u8".}

func vaesdq_u8*(data: Uint8x16, key: Uint8x16): Uint8x16 {.importc: "vaesdq_u8".}

func vaesmcq_u8*(data: Uint8x16): Uint8x16 {.importc: "vaesmcq_u8".}

func vaesimcq_u8*(data: Uint8x16): Uint8x16 {.importc: "vaesimcq_u8".}

func vmull_p64*(a: Poly64, b: Poly64): Poly128 {.importc: "vmull_p64".}

func vmull_high_p64*(a: Poly64x2, b: Poly64x2): Poly128 {.importc: "vmull_high_p64".}

func vcage_f64*(a: Float64x1, b: Float64x1): Uint64x1 {.importc: "vcage_f64".}

func vcages_f32*(a: float32, b: float32): uint32 {.importc: "vcages_f32".}

func vcage_f32*(a: Float32x2, b: Float32x2): Uint32x2 {.importc: "vcage_f32".}

func vcageq_f32*(a: Float32x4, b: Float32x4): Uint32x4 {.importc: "vcageq_f32".}

func vcaged_f64*(a: float64, b: float64): uint64 {.importc: "vcaged_f64".}

func vcageq_f64*(a: Float64x2, b: Float64x2): Uint64x2 {.importc: "vcageq_f64".}

func vcagts_f32*(a: float32, b: float32): uint32 {.importc: "vcagts_f32".}

func vcagt_f32*(a: Float32x2, b: Float32x2): Uint32x2 {.importc: "vcagt_f32".}

func vcagt_f64*(a: Float64x1, b: Float64x1): Uint64x1 {.importc: "vcagt_f64".}

func vcagtq_f32*(a: Float32x4, b: Float32x4): Uint32x4 {.importc: "vcagtq_f32".}

func vcagtd_f64*(a: float64, b: float64): uint64 {.importc: "vcagtd_f64".}

func vcagtq_f64*(a: Float64x2, b: Float64x2): Uint64x2 {.importc: "vcagtq_f64".}

func vcale_f32*(a: Float32x2, b: Float32x2): Uint32x2 {.importc: "vcale_f32".}

func vcale_f64*(a: Float64x1, b: Float64x1): Uint64x1 {.importc: "vcale_f64".}

func vcaled_f64*(a: float64, b: float64): uint64 {.importc: "vcaled_f64".}

func vcales_f32*(a: float32, b: float32): uint32 {.importc: "vcales_f32".}

func vcaleq_f32*(a: Float32x4, b: Float32x4): Uint32x4 {.importc: "vcaleq_f32".}

func vcaleq_f64*(a: Float64x2, b: Float64x2): Uint64x2 {.importc: "vcaleq_f64".}

func vcalt_f32*(a: Float32x2, b: Float32x2): Uint32x2 {.importc: "vcalt_f32".}

func vcalt_f64*(a: Float64x1, b: Float64x1): Uint64x1 {.importc: "vcalt_f64".}

func vcaltd_f64*(a: float64, b: float64): uint64 {.importc: "vcaltd_f64".}

func vcaltq_f32*(a: Float32x4, b: Float32x4): Uint32x4 {.importc: "vcaltq_f32".}

func vcaltq_f64*(a: Float64x2, b: Float64x2): Uint64x2 {.importc: "vcaltq_f64".}

func vcalts_f32*(a: float32, b: float32): uint32 {.importc: "vcalts_f32".}

func vceq_f32*(a: Float32x2, b: Float32x2): Uint32x2 {.importc: "vceq_f32".}

func vceq_f64*(a: Float64x1, b: Float64x1): Uint64x1 {.importc: "vceq_f64".}

func vceq_p8*(a: Poly8x8, b: Poly8x8): Uint8x8 {.importc: "vceq_p8".}

func vceq_p64*(a: Poly64x1, b: Poly64x1): Uint64x1 {.importc: "vceq_p64".}

func vceq_s8*(a: Int8x8, b: Int8x8): Uint8x8 {.importc: "vceq_s8".}

func vceq_s16*(a: Int16x4, b: Int16x4): Uint16x4 {.importc: "vceq_s16".}

func vceq_s32*(a: Int32x2, b: Int32x2): Uint32x2 {.importc: "vceq_s32".}

func vceq_s64*(a: Int64x1, b: Int64x1): Uint64x1 {.importc: "vceq_s64".}

func vceq_u8*(a: Uint8x8, b: Uint8x8): Uint8x8 {.importc: "vceq_u8".}

func vceq_u16*(a: Uint16x4, b: Uint16x4): Uint16x4 {.importc: "vceq_u16".}

func vceq_u32*(a: Uint32x2, b: Uint32x2): Uint32x2 {.importc: "vceq_u32".}

func vceq_u64*(a: Uint64x1, b: Uint64x1): Uint64x1 {.importc: "vceq_u64".}

func vceqq_f32*(a: Float32x4, b: Float32x4): Uint32x4 {.importc: "vceqq_f32".}

func vceqq_f64*(a: Float64x2, b: Float64x2): Uint64x2 {.importc: "vceqq_f64".}

func vceqq_p8*(a: Poly8x16, b: Poly8x16): Uint8x16 {.importc: "vceqq_p8".}

func vceqq_s8*(a: Int8x16, b: Int8x16): Uint8x16 {.importc: "vceqq_s8".}

func vceqq_s16*(a: Int16x8, b: Int16x8): Uint16x8 {.importc: "vceqq_s16".}

func vceqq_s32*(a: Int32x4, b: Int32x4): Uint32x4 {.importc: "vceqq_s32".}

func vceqq_s64*(a: Int64x2, b: Int64x2): Uint64x2 {.importc: "vceqq_s64".}

func vceqq_u8*(a: Uint8x16, b: Uint8x16): Uint8x16 {.importc: "vceqq_u8".}

func vceqq_u16*(a: Uint16x8, b: Uint16x8): Uint16x8 {.importc: "vceqq_u16".}

func vceqq_u32*(a: Uint32x4, b: Uint32x4): Uint32x4 {.importc: "vceqq_u32".}

func vceqq_u64*(a: Uint64x2, b: Uint64x2): Uint64x2 {.importc: "vceqq_u64".}

func vceqq_p64*(a: Poly64x2, b: Poly64x2): Uint64x2 {.importc: "vceqq_p64".}

func vceqs_f32*(a: float32, b: float32): uint32 {.importc: "vceqs_f32".}

func vceqd_s64*(a: int64, b: int64): uint64 {.importc: "vceqd_s64".}

func vceqd_u64*(a: uint64, b: uint64): uint64 {.importc: "vceqd_u64".}

func vceqd_f64*(a: float64, b: float64): uint64 {.importc: "vceqd_f64".}

func vceqz_f32*(a: Float32x2): Uint32x2 {.importc: "vceqz_f32".}

func vceqz_f64*(a: Float64x1): Uint64x1 {.importc: "vceqz_f64".}

func vceqz_p8*(a: Poly8x8): Uint8x8 {.importc: "vceqz_p8".}

func vceqz_s8*(a: Int8x8): Uint8x8 {.importc: "vceqz_s8".}

func vceqz_s16*(a: Int16x4): Uint16x4 {.importc: "vceqz_s16".}

func vceqz_s32*(a: Int32x2): Uint32x2 {.importc: "vceqz_s32".}

func vceqz_s64*(a: Int64x1): Uint64x1 {.importc: "vceqz_s64".}

func vceqz_u8*(a: Uint8x8): Uint8x8 {.importc: "vceqz_u8".}

func vceqz_u16*(a: Uint16x4): Uint16x4 {.importc: "vceqz_u16".}

func vceqz_u32*(a: Uint32x2): Uint32x2 {.importc: "vceqz_u32".}

func vceqz_u64*(a: Uint64x1): Uint64x1 {.importc: "vceqz_u64".}

func vceqz_p64*(a: Poly64x1): Uint64x1 {.importc: "vceqz_p64".}

func vceqzq_f32*(a: Float32x4): Uint32x4 {.importc: "vceqzq_f32".}

func vceqzq_f64*(a: Float64x2): Uint64x2 {.importc: "vceqzq_f64".}

func vceqzq_p8*(a: Poly8x16): Uint8x16 {.importc: "vceqzq_p8".}

func vceqzq_s8*(a: Int8x16): Uint8x16 {.importc: "vceqzq_s8".}

func vceqzq_s16*(a: Int16x8): Uint16x8 {.importc: "vceqzq_s16".}

func vceqzq_s32*(a: Int32x4): Uint32x4 {.importc: "vceqzq_s32".}

func vceqzq_s64*(a: Int64x2): Uint64x2 {.importc: "vceqzq_s64".}

func vceqzq_u8*(a: Uint8x16): Uint8x16 {.importc: "vceqzq_u8".}

func vceqzq_u16*(a: Uint16x8): Uint16x8 {.importc: "vceqzq_u16".}

func vceqzq_u32*(a: Uint32x4): Uint32x4 {.importc: "vceqzq_u32".}

func vceqzq_u64*(a: Uint64x2): Uint64x2 {.importc: "vceqzq_u64".}

func vceqzq_p64*(a: Poly64x2): Uint64x2 {.importc: "vceqzq_p64".}

func vceqzs_f32*(a: float32): uint32 {.importc: "vceqzs_f32".}

func vceqzd_s64*(a: int64): uint64 {.importc: "vceqzd_s64".}

func vceqzd_u64*(a: uint64): uint64 {.importc: "vceqzd_u64".}

func vceqzd_f64*(a: float64): uint64 {.importc: "vceqzd_f64".}

func vcge_f32*(a: Float32x2, b: Float32x2): Uint32x2 {.importc: "vcge_f32".}

func vcge_f64*(a: Float64x1, b: Float64x1): Uint64x1 {.importc: "vcge_f64".}

func vcge_s8*(a: Int8x8, b: Int8x8): Uint8x8 {.importc: "vcge_s8".}

func vcge_s16*(a: Int16x4, b: Int16x4): Uint16x4 {.importc: "vcge_s16".}

func vcge_s32*(a: Int32x2, b: Int32x2): Uint32x2 {.importc: "vcge_s32".}

func vcge_s64*(a: Int64x1, b: Int64x1): Uint64x1 {.importc: "vcge_s64".}

func vcge_u8*(a: Uint8x8, b: Uint8x8): Uint8x8 {.importc: "vcge_u8".}

func vcge_u16*(a: Uint16x4, b: Uint16x4): Uint16x4 {.importc: "vcge_u16".}

func vcge_u32*(a: Uint32x2, b: Uint32x2): Uint32x2 {.importc: "vcge_u32".}

func vcge_u64*(a: Uint64x1, b: Uint64x1): Uint64x1 {.importc: "vcge_u64".}

func vcgeq_f32*(a: Float32x4, b: Float32x4): Uint32x4 {.importc: "vcgeq_f32".}

func vcgeq_f64*(a: Float64x2, b: Float64x2): Uint64x2 {.importc: "vcgeq_f64".}

func vcgeq_s8*(a: Int8x16, b: Int8x16): Uint8x16 {.importc: "vcgeq_s8".}

func vcgeq_s16*(a: Int16x8, b: Int16x8): Uint16x8 {.importc: "vcgeq_s16".}

func vcgeq_s32*(a: Int32x4, b: Int32x4): Uint32x4 {.importc: "vcgeq_s32".}

func vcgeq_s64*(a: Int64x2, b: Int64x2): Uint64x2 {.importc: "vcgeq_s64".}

func vcgeq_u8*(a: Uint8x16, b: Uint8x16): Uint8x16 {.importc: "vcgeq_u8".}

func vcgeq_u16*(a: Uint16x8, b: Uint16x8): Uint16x8 {.importc: "vcgeq_u16".}

func vcgeq_u32*(a: Uint32x4, b: Uint32x4): Uint32x4 {.importc: "vcgeq_u32".}

func vcgeq_u64*(a: Uint64x2, b: Uint64x2): Uint64x2 {.importc: "vcgeq_u64".}

func vcges_f32*(a: float32, b: float32): uint32 {.importc: "vcges_f32".}

func vcged_s64*(a: int64, b: int64): uint64 {.importc: "vcged_s64".}

func vcged_u64*(a: uint64, b: uint64): uint64 {.importc: "vcged_u64".}

func vcged_f64*(a: float64, b: float64): uint64 {.importc: "vcged_f64".}

func vcgez_f32*(a: Float32x2): Uint32x2 {.importc: "vcgez_f32".}

func vcgez_f64*(a: Float64x1): Uint64x1 {.importc: "vcgez_f64".}

func vcgez_s8*(a: Int8x8): Uint8x8 {.importc: "vcgez_s8".}

func vcgez_s16*(a: Int16x4): Uint16x4 {.importc: "vcgez_s16".}

func vcgez_s32*(a: Int32x2): Uint32x2 {.importc: "vcgez_s32".}

func vcgez_s64*(a: Int64x1): Uint64x1 {.importc: "vcgez_s64".}

func vcgezq_f32*(a: Float32x4): Uint32x4 {.importc: "vcgezq_f32".}

func vcgezq_f64*(a: Float64x2): Uint64x2 {.importc: "vcgezq_f64".}

func vcgezq_s8*(a: Int8x16): Uint8x16 {.importc: "vcgezq_s8".}

func vcgezq_s16*(a: Int16x8): Uint16x8 {.importc: "vcgezq_s16".}

func vcgezq_s32*(a: Int32x4): Uint32x4 {.importc: "vcgezq_s32".}

func vcgezq_s64*(a: Int64x2): Uint64x2 {.importc: "vcgezq_s64".}

func vcgezs_f32*(a: float32): uint32 {.importc: "vcgezs_f32".}

func vcgezd_s64*(a: int64): uint64 {.importc: "vcgezd_s64".}

func vcgezd_f64*(a: float64): uint64 {.importc: "vcgezd_f64".}

func vcgt_f32*(a: Float32x2, b: Float32x2): Uint32x2 {.importc: "vcgt_f32".}

func vcgt_f64*(a: Float64x1, b: Float64x1): Uint64x1 {.importc: "vcgt_f64".}

func vcgt_s8*(a: Int8x8, b: Int8x8): Uint8x8 {.importc: "vcgt_s8".}

func vcgt_s16*(a: Int16x4, b: Int16x4): Uint16x4 {.importc: "vcgt_s16".}

func vcgt_s32*(a: Int32x2, b: Int32x2): Uint32x2 {.importc: "vcgt_s32".}

func vcgt_s64*(a: Int64x1, b: Int64x1): Uint64x1 {.importc: "vcgt_s64".}

func vcgt_u8*(a: Uint8x8, b: Uint8x8): Uint8x8 {.importc: "vcgt_u8".}

func vcgt_u16*(a: Uint16x4, b: Uint16x4): Uint16x4 {.importc: "vcgt_u16".}

func vcgt_u32*(a: Uint32x2, b: Uint32x2): Uint32x2 {.importc: "vcgt_u32".}

func vcgt_u64*(a: Uint64x1, b: Uint64x1): Uint64x1 {.importc: "vcgt_u64".}

func vcgtq_f32*(a: Float32x4, b: Float32x4): Uint32x4 {.importc: "vcgtq_f32".}

func vcgtq_f64*(a: Float64x2, b: Float64x2): Uint64x2 {.importc: "vcgtq_f64".}

func vcgtq_s8*(a: Int8x16, b: Int8x16): Uint8x16 {.importc: "vcgtq_s8".}

func vcgtq_s16*(a: Int16x8, b: Int16x8): Uint16x8 {.importc: "vcgtq_s16".}

func vcgtq_s32*(a: Int32x4, b: Int32x4): Uint32x4 {.importc: "vcgtq_s32".}

func vcgtq_s64*(a: Int64x2, b: Int64x2): Uint64x2 {.importc: "vcgtq_s64".}

func vcgtq_u8*(a: Uint8x16, b: Uint8x16): Uint8x16 {.importc: "vcgtq_u8".}

func vcgtq_u16*(a: Uint16x8, b: Uint16x8): Uint16x8 {.importc: "vcgtq_u16".}

func vcgtq_u32*(a: Uint32x4, b: Uint32x4): Uint32x4 {.importc: "vcgtq_u32".}

func vcgtq_u64*(a: Uint64x2, b: Uint64x2): Uint64x2 {.importc: "vcgtq_u64".}

func vcgts_f32*(a: float32, b: float32): uint32 {.importc: "vcgts_f32".}

func vcgtd_s64*(a: int64, b: int64): uint64 {.importc: "vcgtd_s64".}

func vcgtd_u64*(a: uint64, b: uint64): uint64 {.importc: "vcgtd_u64".}

func vcgtd_f64*(a: float64, b: float64): uint64 {.importc: "vcgtd_f64".}

func vcgtz_f32*(a: Float32x2): Uint32x2 {.importc: "vcgtz_f32".}

func vcgtz_f64*(a: Float64x1): Uint64x1 {.importc: "vcgtz_f64".}

func vcgtz_s8*(a: Int8x8): Uint8x8 {.importc: "vcgtz_s8".}

func vcgtz_s16*(a: Int16x4): Uint16x4 {.importc: "vcgtz_s16".}

func vcgtz_s32*(a: Int32x2): Uint32x2 {.importc: "vcgtz_s32".}

func vcgtz_s64*(a: Int64x1): Uint64x1 {.importc: "vcgtz_s64".}

func vcgtzq_f32*(a: Float32x4): Uint32x4 {.importc: "vcgtzq_f32".}

func vcgtzq_f64*(a: Float64x2): Uint64x2 {.importc: "vcgtzq_f64".}

func vcgtzq_s8*(a: Int8x16): Uint8x16 {.importc: "vcgtzq_s8".}

func vcgtzq_s16*(a: Int16x8): Uint16x8 {.importc: "vcgtzq_s16".}

func vcgtzq_s32*(a: Int32x4): Uint32x4 {.importc: "vcgtzq_s32".}

func vcgtzq_s64*(a: Int64x2): Uint64x2 {.importc: "vcgtzq_s64".}

func vcgtzs_f32*(a: float32): uint32 {.importc: "vcgtzs_f32".}

func vcgtzd_s64*(a: int64): uint64 {.importc: "vcgtzd_s64".}

func vcgtzd_f64*(a: float64): uint64 {.importc: "vcgtzd_f64".}

func vcle_f32*(a: Float32x2, b: Float32x2): Uint32x2 {.importc: "vcle_f32".}

func vcle_f64*(a: Float64x1, b: Float64x1): Uint64x1 {.importc: "vcle_f64".}

func vcle_s8*(a: Int8x8, b: Int8x8): Uint8x8 {.importc: "vcle_s8".}

func vcle_s16*(a: Int16x4, b: Int16x4): Uint16x4 {.importc: "vcle_s16".}

func vcle_s32*(a: Int32x2, b: Int32x2): Uint32x2 {.importc: "vcle_s32".}

func vcle_s64*(a: Int64x1, b: Int64x1): Uint64x1 {.importc: "vcle_s64".}

func vcle_u8*(a: Uint8x8, b: Uint8x8): Uint8x8 {.importc: "vcle_u8".}

func vcle_u16*(a: Uint16x4, b: Uint16x4): Uint16x4 {.importc: "vcle_u16".}

func vcle_u32*(a: Uint32x2, b: Uint32x2): Uint32x2 {.importc: "vcle_u32".}

func vcle_u64*(a: Uint64x1, b: Uint64x1): Uint64x1 {.importc: "vcle_u64".}

func vcleq_f32*(a: Float32x4, b: Float32x4): Uint32x4 {.importc: "vcleq_f32".}

func vcleq_f64*(a: Float64x2, b: Float64x2): Uint64x2 {.importc: "vcleq_f64".}

func vcleq_s8*(a: Int8x16, b: Int8x16): Uint8x16 {.importc: "vcleq_s8".}

func vcleq_s16*(a: Int16x8, b: Int16x8): Uint16x8 {.importc: "vcleq_s16".}

func vcleq_s32*(a: Int32x4, b: Int32x4): Uint32x4 {.importc: "vcleq_s32".}

func vcleq_s64*(a: Int64x2, b: Int64x2): Uint64x2 {.importc: "vcleq_s64".}

func vcleq_u8*(a: Uint8x16, b: Uint8x16): Uint8x16 {.importc: "vcleq_u8".}

func vcleq_u16*(a: Uint16x8, b: Uint16x8): Uint16x8 {.importc: "vcleq_u16".}

func vcleq_u32*(a: Uint32x4, b: Uint32x4): Uint32x4 {.importc: "vcleq_u32".}

func vcleq_u64*(a: Uint64x2, b: Uint64x2): Uint64x2 {.importc: "vcleq_u64".}

func vcles_f32*(a: float32, b: float32): uint32 {.importc: "vcles_f32".}

func vcled_s64*(a: int64, b: int64): uint64 {.importc: "vcled_s64".}

func vcled_u64*(a: uint64, b: uint64): uint64 {.importc: "vcled_u64".}

func vcled_f64*(a: float64, b: float64): uint64 {.importc: "vcled_f64".}

func vclez_f32*(a: Float32x2): Uint32x2 {.importc: "vclez_f32".}

func vclez_f64*(a: Float64x1): Uint64x1 {.importc: "vclez_f64".}

func vclez_s8*(a: Int8x8): Uint8x8 {.importc: "vclez_s8".}

func vclez_s16*(a: Int16x4): Uint16x4 {.importc: "vclez_s16".}

func vclez_s32*(a: Int32x2): Uint32x2 {.importc: "vclez_s32".}

func vclez_s64*(a: Int64x1): Uint64x1 {.importc: "vclez_s64".}

func vclezq_f32*(a: Float32x4): Uint32x4 {.importc: "vclezq_f32".}

func vclezq_f64*(a: Float64x2): Uint64x2 {.importc: "vclezq_f64".}

func vclezq_s8*(a: Int8x16): Uint8x16 {.importc: "vclezq_s8".}

func vclezq_s16*(a: Int16x8): Uint16x8 {.importc: "vclezq_s16".}

func vclezq_s32*(a: Int32x4): Uint32x4 {.importc: "vclezq_s32".}

func vclezq_s64*(a: Int64x2): Uint64x2 {.importc: "vclezq_s64".}

func vclezs_f32*(a: float32): uint32 {.importc: "vclezs_f32".}

func vclezd_s64*(a: int64): uint64 {.importc: "vclezd_s64".}

func vclezd_f64*(a: float64): uint64 {.importc: "vclezd_f64".}

func vclt_f32*(a: Float32x2, b: Float32x2): Uint32x2 {.importc: "vclt_f32".}

func vclt_f64*(a: Float64x1, b: Float64x1): Uint64x1 {.importc: "vclt_f64".}

func vclt_s8*(a: Int8x8, b: Int8x8): Uint8x8 {.importc: "vclt_s8".}

func vclt_s16*(a: Int16x4, b: Int16x4): Uint16x4 {.importc: "vclt_s16".}

func vclt_s32*(a: Int32x2, b: Int32x2): Uint32x2 {.importc: "vclt_s32".}

func vclt_s64*(a: Int64x1, b: Int64x1): Uint64x1 {.importc: "vclt_s64".}

func vclt_u8*(a: Uint8x8, b: Uint8x8): Uint8x8 {.importc: "vclt_u8".}

func vclt_u16*(a: Uint16x4, b: Uint16x4): Uint16x4 {.importc: "vclt_u16".}

func vclt_u32*(a: Uint32x2, b: Uint32x2): Uint32x2 {.importc: "vclt_u32".}

func vclt_u64*(a: Uint64x1, b: Uint64x1): Uint64x1 {.importc: "vclt_u64".}

func vcltq_f32*(a: Float32x4, b: Float32x4): Uint32x4 {.importc: "vcltq_f32".}

func vcltq_f64*(a: Float64x2, b: Float64x2): Uint64x2 {.importc: "vcltq_f64".}

func vcltq_s8*(a: Int8x16, b: Int8x16): Uint8x16 {.importc: "vcltq_s8".}

func vcltq_s16*(a: Int16x8, b: Int16x8): Uint16x8 {.importc: "vcltq_s16".}

func vcltq_s32*(a: Int32x4, b: Int32x4): Uint32x4 {.importc: "vcltq_s32".}

func vcltq_s64*(a: Int64x2, b: Int64x2): Uint64x2 {.importc: "vcltq_s64".}

func vcltq_u8*(a: Uint8x16, b: Uint8x16): Uint8x16 {.importc: "vcltq_u8".}

func vcltq_u16*(a: Uint16x8, b: Uint16x8): Uint16x8 {.importc: "vcltq_u16".}

func vcltq_u32*(a: Uint32x4, b: Uint32x4): Uint32x4 {.importc: "vcltq_u32".}

func vcltq_u64*(a: Uint64x2, b: Uint64x2): Uint64x2 {.importc: "vcltq_u64".}

func vclts_f32*(a: float32, b: float32): uint32 {.importc: "vclts_f32".}

func vcltd_s64*(a: int64, b: int64): uint64 {.importc: "vcltd_s64".}

func vcltd_u64*(a: uint64, b: uint64): uint64 {.importc: "vcltd_u64".}

func vcltd_f64*(a: float64, b: float64): uint64 {.importc: "vcltd_f64".}

func vcltz_f32*(a: Float32x2): Uint32x2 {.importc: "vcltz_f32".}

func vcltz_f64*(a: Float64x1): Uint64x1 {.importc: "vcltz_f64".}

func vcltz_s8*(a: Int8x8): Uint8x8 {.importc: "vcltz_s8".}

func vcltz_s16*(a: Int16x4): Uint16x4 {.importc: "vcltz_s16".}

func vcltz_s32*(a: Int32x2): Uint32x2 {.importc: "vcltz_s32".}

func vcltz_s64*(a: Int64x1): Uint64x1 {.importc: "vcltz_s64".}

func vcltzq_f32*(a: Float32x4): Uint32x4 {.importc: "vcltzq_f32".}

func vcltzq_f64*(a: Float64x2): Uint64x2 {.importc: "vcltzq_f64".}

func vcltzq_s8*(a: Int8x16): Uint8x16 {.importc: "vcltzq_s8".}

func vcltzq_s16*(a: Int16x8): Uint16x8 {.importc: "vcltzq_s16".}

func vcltzq_s32*(a: Int32x4): Uint32x4 {.importc: "vcltzq_s32".}

func vcltzq_s64*(a: Int64x2): Uint64x2 {.importc: "vcltzq_s64".}

func vcltzs_f32*(a: float32): uint32 {.importc: "vcltzs_f32".}

func vcltzd_s64*(a: int64): uint64 {.importc: "vcltzd_s64".}

func vcltzd_f64*(a: float64): uint64 {.importc: "vcltzd_f64".}

func vcls_s8*(a: Int8x8): Int8x8 {.importc: "vcls_s8".}

func vcls_s16*(a: Int16x4): Int16x4 {.importc: "vcls_s16".}

func vcls_s32*(a: Int32x2): Int32x2 {.importc: "vcls_s32".}

func vclsq_s8*(a: Int8x16): Int8x16 {.importc: "vclsq_s8".}

func vclsq_s16*(a: Int16x8): Int16x8 {.importc: "vclsq_s16".}

func vclsq_s32*(a: Int32x4): Int32x4 {.importc: "vclsq_s32".}

func vcls_u8*(a: Uint8x8): Int8x8 {.importc: "vcls_u8".}

func vcls_u16*(a: Uint16x4): Int16x4 {.importc: "vcls_u16".}

func vcls_u32*(a: Uint32x2): Int32x2 {.importc: "vcls_u32".}

func vclsq_u8*(a: Uint8x16): Int8x16 {.importc: "vclsq_u8".}

func vclsq_u16*(a: Uint16x8): Int16x8 {.importc: "vclsq_u16".}

func vclsq_u32*(a: Uint32x4): Int32x4 {.importc: "vclsq_u32".}

func vclz_s8*(a: Int8x8): Int8x8 {.importc: "vclz_s8".}

func vclz_s16*(a: Int16x4): Int16x4 {.importc: "vclz_s16".}

func vclz_s32*(a: Int32x2): Int32x2 {.importc: "vclz_s32".}

func vclz_u8*(a: Uint8x8): Uint8x8 {.importc: "vclz_u8".}

func vclz_u16*(a: Uint16x4): Uint16x4 {.importc: "vclz_u16".}

func vclz_u32*(a: Uint32x2): Uint32x2 {.importc: "vclz_u32".}

func vclzq_s8*(a: Int8x16): Int8x16 {.importc: "vclzq_s8".}

func vclzq_s16*(a: Int16x8): Int16x8 {.importc: "vclzq_s16".}

func vclzq_s32*(a: Int32x4): Int32x4 {.importc: "vclzq_s32".}

func vclzq_u8*(a: Uint8x16): Uint8x16 {.importc: "vclzq_u8".}

func vclzq_u16*(a: Uint16x8): Uint16x8 {.importc: "vclzq_u16".}

func vclzq_u32*(a: Uint32x4): Uint32x4 {.importc: "vclzq_u32".}

func vcnt_p8*(a: Poly8x8): Poly8x8 {.importc: "vcnt_p8".}

func vcnt_s8*(a: Int8x8): Int8x8 {.importc: "vcnt_s8".}

func vcnt_u8*(a: Uint8x8): Uint8x8 {.importc: "vcnt_u8".}

func vcntq_p8*(a: Poly8x16): Poly8x16 {.importc: "vcntq_p8".}

func vcntq_s8*(a: Int8x16): Int8x16 {.importc: "vcntq_s8".}

func vcntq_u8*(a: Uint8x16): Uint8x16 {.importc: "vcntq_u8".}

func vcopy_lane_f32*(a: Float32x2, lane1: int32, b: Float32x2, lane2: int32): Float32x2 {.importc: "vcopy_lane_f32".}

func vcopy_lane_f64*(a: Float64x1, lane1: int32, b: Float64x1, lane2: int32): Float64x1 {.importc: "vcopy_lane_f64".}

func vcopy_lane_p8*(a: Poly8x8, lane1: int32, b: Poly8x8, lane2: int32): Poly8x8 {.importc: "vcopy_lane_p8".}

func vcopy_lane_p16*(a: Poly16x4, lane1: int32, b: Poly16x4, lane2: int32): Poly16x4 {.importc: "vcopy_lane_p16".}

func vcopy_lane_p64*(a: Poly64x1, lane1: int32, b: Poly64x1, lane2: int32): Poly64x1 {.importc: "vcopy_lane_p64".}

func vcopy_lane_s8*(a: Int8x8, lane1: int32, b: Int8x8, lane2: int32): Int8x8 {.importc: "vcopy_lane_s8".}

func vcopy_lane_s16*(a: Int16x4, lane1: int32, b: Int16x4, lane2: int32): Int16x4 {.importc: "vcopy_lane_s16".}

func vcopy_lane_s32*(a: Int32x2, lane1: int32, b: Int32x2, lane2: int32): Int32x2 {.importc: "vcopy_lane_s32".}

func vcopy_lane_s64*(a: Int64x1, lane1: int32, b: Int64x1, lane2: int32): Int64x1 {.importc: "vcopy_lane_s64".}

func vcopy_lane_u8*(a: Uint8x8, lane1: int32, b: Uint8x8, lane2: int32): Uint8x8 {.importc: "vcopy_lane_u8".}

func vcopy_lane_u16*(a: Uint16x4, lane1: int32, b: Uint16x4, lane2: int32): Uint16x4 {.importc: "vcopy_lane_u16".}

func vcopy_lane_u32*(a: Uint32x2, lane1: int32, b: Uint32x2, lane2: int32): Uint32x2 {.importc: "vcopy_lane_u32".}

func vcopy_lane_u64*(a: Uint64x1, lane1: int32, b: Uint64x1, lane2: int32): Uint64x1 {.importc: "vcopy_lane_u64".}

func vcopy_laneq_f32*(a: Float32x2, lane1: int32, b: Float32x4, lane2: int32): Float32x2 {.importc: "vcopy_laneq_f32".}

func vcopy_laneq_f64*(a: Float64x1, lane1: int32, b: Float64x2, lane2: int32): Float64x1 {.importc: "vcopy_laneq_f64".}

func vcopy_laneq_p8*(a: Poly8x8, lane1: int32, b: Poly8x16, lane2: int32): Poly8x8 {.importc: "vcopy_laneq_p8".}

func vcopy_laneq_p16*(a: Poly16x4, lane1: int32, b: Poly16x8, lane2: int32): Poly16x4 {.importc: "vcopy_laneq_p16".}

func vcopy_laneq_p64*(a: Poly64x1, lane1: int32, b: Poly64x2, lane2: int32): Poly64x1 {.importc: "vcopy_laneq_p64".}

func vcopy_laneq_s8*(a: Int8x8, lane1: int32, b: Int8x16, lane2: int32): Int8x8 {.importc: "vcopy_laneq_s8".}

func vcopy_laneq_s16*(a: Int16x4, lane1: int32, b: Int16x8, lane2: int32): Int16x4 {.importc: "vcopy_laneq_s16".}

func vcopy_laneq_s32*(a: Int32x2, lane1: int32, b: Int32x4, lane2: int32): Int32x2 {.importc: "vcopy_laneq_s32".}

func vcopy_laneq_s64*(a: Int64x1, lane1: int32, b: Int64x2, lane2: int32): Int64x1 {.importc: "vcopy_laneq_s64".}

func vcopy_laneq_u8*(a: Uint8x8, lane1: int32, b: Uint8x16, lane2: int32): Uint8x8 {.importc: "vcopy_laneq_u8".}

func vcopy_laneq_u16*(a: Uint16x4, lane1: int32, b: Uint16x8, lane2: int32): Uint16x4 {.importc: "vcopy_laneq_u16".}

func vcopy_laneq_u32*(a: Uint32x2, lane1: int32, b: Uint32x4, lane2: int32): Uint32x2 {.importc: "vcopy_laneq_u32".}

func vcopy_laneq_u64*(a: Uint64x1, lane1: int32, b: Uint64x2, lane2: int32): Uint64x1 {.importc: "vcopy_laneq_u64".}

func vcopyq_lane_f32*(a: Float32x4, lane1: int32, b: Float32x2, lane2: int32): Float32x4 {.importc: "vcopyq_lane_f32".}

func vcopyq_lane_f64*(a: Float64x2, lane1: int32, b: Float64x1, lane2: int32): Float64x2 {.importc: "vcopyq_lane_f64".}

func vcopyq_lane_p8*(a: Poly8x16, lane1: int32, b: Poly8x8, lane2: int32): Poly8x16 {.importc: "vcopyq_lane_p8".}

func vcopyq_lane_p16*(a: Poly16x8, lane1: int32, b: Poly16x4, lane2: int32): Poly16x8 {.importc: "vcopyq_lane_p16".}

func vcopyq_lane_p64*(a: Poly64x2, lane1: int32, b: Poly64x1, lane2: int32): Poly64x2 {.importc: "vcopyq_lane_p64".}

func vcopyq_lane_s8*(a: Int8x16, lane1: int32, b: Int8x8, lane2: int32): Int8x16 {.importc: "vcopyq_lane_s8".}

func vcopyq_lane_s16*(a: Int16x8, lane1: int32, b: Int16x4, lane2: int32): Int16x8 {.importc: "vcopyq_lane_s16".}

func vcopyq_lane_s32*(a: Int32x4, lane1: int32, b: Int32x2, lane2: int32): Int32x4 {.importc: "vcopyq_lane_s32".}

func vcopyq_lane_s64*(a: Int64x2, lane1: int32, b: Int64x1, lane2: int32): Int64x2 {.importc: "vcopyq_lane_s64".}

func vcopyq_lane_u8*(a: Uint8x16, lane1: int32, b: Uint8x8, lane2: int32): Uint8x16 {.importc: "vcopyq_lane_u8".}

func vcopyq_lane_u16*(a: Uint16x8, lane1: int32, b: Uint16x4, lane2: int32): Uint16x8 {.importc: "vcopyq_lane_u16".}

func vcopyq_lane_u32*(a: Uint32x4, lane1: int32, b: Uint32x2, lane2: int32): Uint32x4 {.importc: "vcopyq_lane_u32".}

func vcopyq_lane_u64*(a: Uint64x2, lane1: int32, b: Uint64x1, lane2: int32): Uint64x2 {.importc: "vcopyq_lane_u64".}

func vcopyq_laneq_f32*(a: Float32x4, lane1: int32, b: Float32x4, lane2: int32): Float32x4 {.importc: "vcopyq_laneq_f32".}

func vcopyq_laneq_f64*(a: Float64x2, lane1: int32, b: Float64x2, lane2: int32): Float64x2 {.importc: "vcopyq_laneq_f64".}

func vcopyq_laneq_p8*(a: Poly8x16, lane1: int32, b: Poly8x16, lane2: int32): Poly8x16 {.importc: "vcopyq_laneq_p8".}

func vcopyq_laneq_p16*(a: Poly16x8, lane1: int32, b: Poly16x8, lane2: int32): Poly16x8 {.importc: "vcopyq_laneq_p16".}

func vcopyq_laneq_p64*(a: Poly64x2, lane1: int32, b: Poly64x2, lane2: int32): Poly64x2 {.importc: "vcopyq_laneq_p64".}

func vcopyq_laneq_s8*(a: Int8x16, lane1: int32, b: Int8x16, lane2: int32): Int8x16 {.importc: "vcopyq_laneq_s8".}

func vcopyq_laneq_s16*(a: Int16x8, lane1: int32, b: Int16x8, lane2: int32): Int16x8 {.importc: "vcopyq_laneq_s16".}

func vcopyq_laneq_s32*(a: Int32x4, lane1: int32, b: Int32x4, lane2: int32): Int32x4 {.importc: "vcopyq_laneq_s32".}

func vcopyq_laneq_s64*(a: Int64x2, lane1: int32, b: Int64x2, lane2: int32): Int64x2 {.importc: "vcopyq_laneq_s64".}

func vcopyq_laneq_u8*(a: Uint8x16, lane1: int32, b: Uint8x16, lane2: int32): Uint8x16 {.importc: "vcopyq_laneq_u8".}

func vcopyq_laneq_u16*(a: Uint16x8, lane1: int32, b: Uint16x8, lane2: int32): Uint16x8 {.importc: "vcopyq_laneq_u16".}

func vcopyq_laneq_u32*(a: Uint32x4, lane1: int32, b: Uint32x4, lane2: int32): Uint32x4 {.importc: "vcopyq_laneq_u32".}

func vcopyq_laneq_u64*(a: Uint64x2, lane1: int32, b: Uint64x2, lane2: int32): Uint64x2 {.importc: "vcopyq_laneq_u64".}

func vcvt_f16_f32*(a: Float32x4): Float16x4 {.importc: "vcvt_f16_f32".}

func vcvt_high_f16_f32*(a: Float16x4, b: Float32x4): Float16x8 {.importc: "vcvt_high_f16_f32".}

func vcvt_f32_f64*(a: Float64x2): Float32x2 {.importc: "vcvt_f32_f64".}

func vcvt_high_f32_f64*(a: Float32x2, b: Float64x2): Float32x4 {.importc: "vcvt_high_f32_f64".}

func vcvt_f32_f16*(a: Float16x4): Float32x4 {.importc: "vcvt_f32_f16".}

func vcvt_f64_f32*(a: Float32x2): Float64x2 {.importc: "vcvt_f64_f32".}

func vcvt_high_f32_f16*(a: Float16x8): Float32x4 {.importc: "vcvt_high_f32_f16".}

func vcvt_high_f64_f32*(a: Float32x4): Float64x2 {.importc: "vcvt_high_f64_f32".}

func vcvtd_n_f64_s64*(a: int64, b: int32): float64 {.importc: "vcvtd_n_f64_s64".}

func vcvtd_n_f64_u64*(a: uint64, b: int32): float64 {.importc: "vcvtd_n_f64_u64".}

func vcvts_n_f32_s32*(a: int32, b: int32): float32 {.importc: "vcvts_n_f32_s32".}

func vcvts_n_f32_u32*(a: uint32, b: int32): float32 {.importc: "vcvts_n_f32_u32".}

func vcvt_n_f32_s32*(a: Int32x2, b: int32): Float32x2 {.importc: "vcvt_n_f32_s32".}

func vcvt_n_f32_u32*(a: Uint32x2, b: int32): Float32x2 {.importc: "vcvt_n_f32_u32".}

func vcvt_n_f64_s64*(a: Int64x1, b: int32): Float64x1 {.importc: "vcvt_n_f64_s64".}

func vcvt_n_f64_u64*(a: Uint64x1, b: int32): Float64x1 {.importc: "vcvt_n_f64_u64".}

func vcvtq_n_f32_s32*(a: Int32x4, b: int32): Float32x4 {.importc: "vcvtq_n_f32_s32".}

func vcvtq_n_f32_u32*(a: Uint32x4, b: int32): Float32x4 {.importc: "vcvtq_n_f32_u32".}

func vcvtq_n_f64_s64*(a: Int64x2, b: int32): Float64x2 {.importc: "vcvtq_n_f64_s64".}

func vcvtq_n_f64_u64*(a: Uint64x2, b: int32): Float64x2 {.importc: "vcvtq_n_f64_u64".}

func vcvtd_n_s64_f64*(a: float64, b: int32): int64 {.importc: "vcvtd_n_s64_f64".}

func vcvtd_n_u64_f64*(a: float64, b: int32): uint64 {.importc: "vcvtd_n_u64_f64".}

func vcvts_n_s32_f32*(a: float32, b: int32): int32 {.importc: "vcvts_n_s32_f32".}

func vcvts_n_u32_f32*(a: float32, b: int32): uint32 {.importc: "vcvts_n_u32_f32".}

func vcvt_n_s32_f32*(a: Float32x2, b: int32): Int32x2 {.importc: "vcvt_n_s32_f32".}

func vcvt_n_u32_f32*(a: Float32x2, b: int32): Uint32x2 {.importc: "vcvt_n_u32_f32".}

func vcvt_n_s64_f64*(a: Float64x1, b: int32): Int64x1 {.importc: "vcvt_n_s64_f64".}

func vcvt_n_u64_f64*(a: Float64x1, b: int32): Uint64x1 {.importc: "vcvt_n_u64_f64".}

func vcvtq_n_s32_f32*(a: Float32x4, b: int32): Int32x4 {.importc: "vcvtq_n_s32_f32".}

func vcvtq_n_u32_f32*(a: Float32x4, b: int32): Uint32x4 {.importc: "vcvtq_n_u32_f32".}

func vcvtq_n_s64_f64*(a: Float64x2, b: int32): Int64x2 {.importc: "vcvtq_n_s64_f64".}

func vcvtq_n_u64_f64*(a: Float64x2, b: int32): Uint64x2 {.importc: "vcvtq_n_u64_f64".}

func vcvtd_f64_s64*(a: int64): float64 {.importc: "vcvtd_f64_s64".}

func vcvtd_f64_u64*(a: uint64): float64 {.importc: "vcvtd_f64_u64".}

func vcvts_f32_s32*(a: int32): float32 {.importc: "vcvts_f32_s32".}

func vcvts_f32_u32*(a: uint32): float32 {.importc: "vcvts_f32_u32".}

func vcvt_f32_s32*(a: Int32x2): Float32x2 {.importc: "vcvt_f32_s32".}

func vcvt_f32_u32*(a: Uint32x2): Float32x2 {.importc: "vcvt_f32_u32".}

func vcvt_f64_s64*(a: Int64x1): Float64x1 {.importc: "vcvt_f64_s64".}

func vcvt_f64_u64*(a: Uint64x1): Float64x1 {.importc: "vcvt_f64_u64".}

func vcvtq_f32_s32*(a: Int32x4): Float32x4 {.importc: "vcvtq_f32_s32".}

func vcvtq_f32_u32*(a: Uint32x4): Float32x4 {.importc: "vcvtq_f32_u32".}

func vcvtq_f64_s64*(a: Int64x2): Float64x2 {.importc: "vcvtq_f64_s64".}

func vcvtq_f64_u64*(a: Uint64x2): Float64x2 {.importc: "vcvtq_f64_u64".}

func vcvtd_s64_f64*(a: float64): int64 {.importc: "vcvtd_s64_f64".}

func vcvtd_u64_f64*(a: float64): uint64 {.importc: "vcvtd_u64_f64".}

func vcvts_s32_f32*(a: float32): int32 {.importc: "vcvts_s32_f32".}

func vcvts_u32_f32*(a: float32): uint32 {.importc: "vcvts_u32_f32".}

func vcvt_s32_f32*(a: Float32x2): Int32x2 {.importc: "vcvt_s32_f32".}

func vcvt_u32_f32*(a: Float32x2): Uint32x2 {.importc: "vcvt_u32_f32".}

func vcvtq_s32_f32*(a: Float32x4): Int32x4 {.importc: "vcvtq_s32_f32".}

func vcvtq_u32_f32*(a: Float32x4): Uint32x4 {.importc: "vcvtq_u32_f32".}

func vcvt_s64_f64*(a: Float64x1): Int64x1 {.importc: "vcvt_s64_f64".}

func vcvt_u64_f64*(a: Float64x1): Uint64x1 {.importc: "vcvt_u64_f64".}

func vcvtq_s64_f64*(a: Float64x2): Int64x2 {.importc: "vcvtq_s64_f64".}

func vcvtq_u64_f64*(a: Float64x2): Uint64x2 {.importc: "vcvtq_u64_f64".}

func vcvtad_s64_f64*(a: float64): int64 {.importc: "vcvtad_s64_f64".}

func vcvtad_u64_f64*(a: float64): uint64 {.importc: "vcvtad_u64_f64".}

func vcvtas_s32_f32*(a: float32): int32 {.importc: "vcvtas_s32_f32".}

func vcvtas_u32_f32*(a: float32): uint32 {.importc: "vcvtas_u32_f32".}

func vcvta_s32_f32*(a: Float32x2): Int32x2 {.importc: "vcvta_s32_f32".}

func vcvta_u32_f32*(a: Float32x2): Uint32x2 {.importc: "vcvta_u32_f32".}

func vcvtaq_s32_f32*(a: Float32x4): Int32x4 {.importc: "vcvtaq_s32_f32".}

func vcvtaq_u32_f32*(a: Float32x4): Uint32x4 {.importc: "vcvtaq_u32_f32".}

func vcvta_s64_f64*(a: Float64x1): Int64x1 {.importc: "vcvta_s64_f64".}

func vcvta_u64_f64*(a: Float64x1): Uint64x1 {.importc: "vcvta_u64_f64".}

func vcvtaq_s64_f64*(a: Float64x2): Int64x2 {.importc: "vcvtaq_s64_f64".}

func vcvtaq_u64_f64*(a: Float64x2): Uint64x2 {.importc: "vcvtaq_u64_f64".}

func vcvtmd_s64_f64*(a: float64): int64 {.importc: "vcvtmd_s64_f64".}

func vcvtmd_u64_f64*(a: float64): uint64 {.importc: "vcvtmd_u64_f64".}

func vcvtms_s32_f32*(a: float32): int32 {.importc: "vcvtms_s32_f32".}

func vcvtms_u32_f32*(a: float32): uint32 {.importc: "vcvtms_u32_f32".}

func vcvtm_s32_f32*(a: Float32x2): Int32x2 {.importc: "vcvtm_s32_f32".}

func vcvtm_u32_f32*(a: Float32x2): Uint32x2 {.importc: "vcvtm_u32_f32".}

func vcvtmq_s32_f32*(a: Float32x4): Int32x4 {.importc: "vcvtmq_s32_f32".}

func vcvtmq_u32_f32*(a: Float32x4): Uint32x4 {.importc: "vcvtmq_u32_f32".}

func vcvtm_s64_f64*(a: Float64x1): Int64x1 {.importc: "vcvtm_s64_f64".}

func vcvtm_u64_f64*(a: Float64x1): Uint64x1 {.importc: "vcvtm_u64_f64".}

func vcvtmq_s64_f64*(a: Float64x2): Int64x2 {.importc: "vcvtmq_s64_f64".}

func vcvtmq_u64_f64*(a: Float64x2): Uint64x2 {.importc: "vcvtmq_u64_f64".}

func vcvtnd_s64_f64*(a: float64): int64 {.importc: "vcvtnd_s64_f64".}

func vcvtnd_u64_f64*(a: float64): uint64 {.importc: "vcvtnd_u64_f64".}

func vcvtns_s32_f32*(a: float32): int32 {.importc: "vcvtns_s32_f32".}

func vcvtns_u32_f32*(a: float32): uint32 {.importc: "vcvtns_u32_f32".}

func vcvtn_s32_f32*(a: Float32x2): Int32x2 {.importc: "vcvtn_s32_f32".}

func vcvtn_u32_f32*(a: Float32x2): Uint32x2 {.importc: "vcvtn_u32_f32".}

func vcvtnq_s32_f32*(a: Float32x4): Int32x4 {.importc: "vcvtnq_s32_f32".}

func vcvtnq_u32_f32*(a: Float32x4): Uint32x4 {.importc: "vcvtnq_u32_f32".}

func vcvtn_s64_f64*(a: Float64x1): Int64x1 {.importc: "vcvtn_s64_f64".}

func vcvtn_u64_f64*(a: Float64x1): Uint64x1 {.importc: "vcvtn_u64_f64".}

func vcvtnq_s64_f64*(a: Float64x2): Int64x2 {.importc: "vcvtnq_s64_f64".}

func vcvtnq_u64_f64*(a: Float64x2): Uint64x2 {.importc: "vcvtnq_u64_f64".}

func vcvtpd_s64_f64*(a: float64): int64 {.importc: "vcvtpd_s64_f64".}

func vcvtpd_u64_f64*(a: float64): uint64 {.importc: "vcvtpd_u64_f64".}

func vcvtps_s32_f32*(a: float32): int32 {.importc: "vcvtps_s32_f32".}

func vcvtps_u32_f32*(a: float32): uint32 {.importc: "vcvtps_u32_f32".}

func vcvtp_s32_f32*(a: Float32x2): Int32x2 {.importc: "vcvtp_s32_f32".}

func vcvtp_u32_f32*(a: Float32x2): Uint32x2 {.importc: "vcvtp_u32_f32".}

func vcvtpq_s32_f32*(a: Float32x4): Int32x4 {.importc: "vcvtpq_s32_f32".}

func vcvtpq_u32_f32*(a: Float32x4): Uint32x4 {.importc: "vcvtpq_u32_f32".}

func vcvtp_s64_f64*(a: Float64x1): Int64x1 {.importc: "vcvtp_s64_f64".}

func vcvtp_u64_f64*(a: Float64x1): Uint64x1 {.importc: "vcvtp_u64_f64".}

func vcvtpq_s64_f64*(a: Float64x2): Int64x2 {.importc: "vcvtpq_s64_f64".}

func vcvtpq_u64_f64*(a: Float64x2): Uint64x2 {.importc: "vcvtpq_u64_f64".}

func vdup_n_f16*(a: float16): Float16x4 {.importc: "vdup_n_f16".}

func vdup_n_f32*(a: float32): Float32x2 {.importc: "vdup_n_f32".}

func vdup_n_f64*(a: float64): Float64x1 {.importc: "vdup_n_f64".}

func vdup_n_p8*(a: Poly8): Poly8x8 {.importc: "vdup_n_p8".}

func vdup_n_p16*(a: Poly16): Poly16x4 {.importc: "vdup_n_p16".}

func vdup_n_p64*(a: Poly64): Poly64x1 {.importc: "vdup_n_p64".}

func vdup_n_s8*(a: int8): Int8x8 {.importc: "vdup_n_s8".}

func vdup_n_s16*(a: int16): Int16x4 {.importc: "vdup_n_s16".}

func vdup_n_s32*(a: int32): Int32x2 {.importc: "vdup_n_s32".}

func vdup_n_s64*(a: int64): Int64x1 {.importc: "vdup_n_s64".}

func vdup_n_u8*(a: uint8): Uint8x8 {.importc: "vdup_n_u8".}

func vdup_n_u16*(a: uint16): Uint16x4 {.importc: "vdup_n_u16".}

func vdup_n_u32*(a: uint32): Uint32x2 {.importc: "vdup_n_u32".}

func vdup_n_u64*(a: uint64): Uint64x1 {.importc: "vdup_n_u64".}

func vdupq_n_f16*(a: float16): Float16x8 {.importc: "vdupq_n_f16".}

func vdupq_n_f32*(a: float32): Float32x4 {.importc: "vdupq_n_f32".}

func vdupq_n_f64*(a: float64): Float64x2 {.importc: "vdupq_n_f64".}

func vdupq_n_p8*(a: Poly8): Poly8x16 {.importc: "vdupq_n_p8".}

func vdupq_n_p16*(a: Poly16): Poly16x8 {.importc: "vdupq_n_p16".}

func vdupq_n_p64*(a: Poly64): Poly64x2 {.importc: "vdupq_n_p64".}

func vdupq_n_s8*(a: int8): Int8x16 {.importc: "vdupq_n_s8".}

func vdupq_n_s16*(a: int16): Int16x8 {.importc: "vdupq_n_s16".}

func vdupq_n_s32*(a: int32): Int32x4 {.importc: "vdupq_n_s32".}

func vdupq_n_s64*(a: int64): Int64x2 {.importc: "vdupq_n_s64".}

func vdupq_n_u8*(a: uint8): Uint8x16 {.importc: "vdupq_n_u8".}

func vdupq_n_u16*(a: uint16): Uint16x8 {.importc: "vdupq_n_u16".}

func vdupq_n_u32*(a: uint32): Uint32x4 {.importc: "vdupq_n_u32".}

func vdupq_n_u64*(a: uint64): Uint64x2 {.importc: "vdupq_n_u64".}

func vdup_lane_f16*(a: Float16x4, b: int32): Float16x4 {.importc: "vdup_lane_f16".}

func vdup_lane_f32*(a: Float32x2, b: int32): Float32x2 {.importc: "vdup_lane_f32".}

func vdup_lane_f64*(a: Float64x1, b: int32): Float64x1 {.importc: "vdup_lane_f64".}

func vdup_lane_p8*(a: Poly8x8, b: int32): Poly8x8 {.importc: "vdup_lane_p8".}

func vdup_lane_p16*(a: Poly16x4, b: int32): Poly16x4 {.importc: "vdup_lane_p16".}

func vdup_lane_p64*(a: Poly64x1, b: int32): Poly64x1 {.importc: "vdup_lane_p64".}

func vdup_lane_s8*(a: Int8x8, b: int32): Int8x8 {.importc: "vdup_lane_s8".}

func vdup_lane_s16*(a: Int16x4, b: int32): Int16x4 {.importc: "vdup_lane_s16".}

func vdup_lane_s32*(a: Int32x2, b: int32): Int32x2 {.importc: "vdup_lane_s32".}

func vdup_lane_s64*(a: Int64x1, b: int32): Int64x1 {.importc: "vdup_lane_s64".}

func vdup_lane_u8*(a: Uint8x8, b: int32): Uint8x8 {.importc: "vdup_lane_u8".}

func vdup_lane_u16*(a: Uint16x4, b: int32): Uint16x4 {.importc: "vdup_lane_u16".}

func vdup_lane_u32*(a: Uint32x2, b: int32): Uint32x2 {.importc: "vdup_lane_u32".}

func vdup_lane_u64*(a: Uint64x1, b: int32): Uint64x1 {.importc: "vdup_lane_u64".}

func vdup_laneq_f16*(a: Float16x8, b: int32): Float16x4 {.importc: "vdup_laneq_f16".}

func vdup_laneq_f32*(a: Float32x4, b: int32): Float32x2 {.importc: "vdup_laneq_f32".}

func vdup_laneq_f64*(a: Float64x2, b: int32): Float64x1 {.importc: "vdup_laneq_f64".}

func vdup_laneq_p8*(a: Poly8x16, b: int32): Poly8x8 {.importc: "vdup_laneq_p8".}

func vdup_laneq_p16*(a: Poly16x8, b: int32): Poly16x4 {.importc: "vdup_laneq_p16".}

func vdup_laneq_p64*(a: Poly64x2, b: int32): Poly64x1 {.importc: "vdup_laneq_p64".}

func vdup_laneq_s8*(a: Int8x16, b: int32): Int8x8 {.importc: "vdup_laneq_s8".}

func vdup_laneq_s16*(a: Int16x8, b: int32): Int16x4 {.importc: "vdup_laneq_s16".}

func vdup_laneq_s32*(a: Int32x4, b: int32): Int32x2 {.importc: "vdup_laneq_s32".}

func vdup_laneq_s64*(a: Int64x2, b: int32): Int64x1 {.importc: "vdup_laneq_s64".}

func vdup_laneq_u8*(a: Uint8x16, b: int32): Uint8x8 {.importc: "vdup_laneq_u8".}

func vdup_laneq_u16*(a: Uint16x8, b: int32): Uint16x4 {.importc: "vdup_laneq_u16".}

func vdup_laneq_u32*(a: Uint32x4, b: int32): Uint32x2 {.importc: "vdup_laneq_u32".}

func vdup_laneq_u64*(a: Uint64x2, b: int32): Uint64x1 {.importc: "vdup_laneq_u64".}

func vdupq_lane_f16*(a: Float16x4, b: int32): Float16x8 {.importc: "vdupq_lane_f16".}

func vdupq_lane_f32*(a: Float32x2, b: int32): Float32x4 {.importc: "vdupq_lane_f32".}

func vdupq_lane_f64*(a: Float64x1, b: int32): Float64x2 {.importc: "vdupq_lane_f64".}

func vdupq_lane_p8*(a: Poly8x8, b: int32): Poly8x16 {.importc: "vdupq_lane_p8".}

func vdupq_lane_p16*(a: Poly16x4, b: int32): Poly16x8 {.importc: "vdupq_lane_p16".}

func vdupq_lane_p64*(a: Poly64x1, b: int32): Poly64x2 {.importc: "vdupq_lane_p64".}

func vdupq_lane_s8*(a: Int8x8, b: int32): Int8x16 {.importc: "vdupq_lane_s8".}

func vdupq_lane_s16*(a: Int16x4, b: int32): Int16x8 {.importc: "vdupq_lane_s16".}

func vdupq_lane_s32*(a: Int32x2, b: int32): Int32x4 {.importc: "vdupq_lane_s32".}

func vdupq_lane_s64*(a: Int64x1, b: int32): Int64x2 {.importc: "vdupq_lane_s64".}

func vdupq_lane_u8*(a: Uint8x8, b: int32): Uint8x16 {.importc: "vdupq_lane_u8".}

func vdupq_lane_u16*(a: Uint16x4, b: int32): Uint16x8 {.importc: "vdupq_lane_u16".}

func vdupq_lane_u32*(a: Uint32x2, b: int32): Uint32x4 {.importc: "vdupq_lane_u32".}

func vdupq_lane_u64*(a: Uint64x1, b: int32): Uint64x2 {.importc: "vdupq_lane_u64".}

func vdupq_laneq_f16*(a: Float16x8, b: int32): Float16x8 {.importc: "vdupq_laneq_f16".}

func vdupq_laneq_f32*(a: Float32x4, b: int32): Float32x4 {.importc: "vdupq_laneq_f32".}

func vdupq_laneq_f64*(a: Float64x2, b: int32): Float64x2 {.importc: "vdupq_laneq_f64".}

func vdupq_laneq_p8*(a: Poly8x16, b: int32): Poly8x16 {.importc: "vdupq_laneq_p8".}

func vdupq_laneq_p16*(a: Poly16x8, b: int32): Poly16x8 {.importc: "vdupq_laneq_p16".}

func vdupq_laneq_p64*(a: Poly64x2, b: int32): Poly64x2 {.importc: "vdupq_laneq_p64".}

func vdupq_laneq_s8*(a: Int8x16, b: int32): Int8x16 {.importc: "vdupq_laneq_s8".}

func vdupq_laneq_s16*(a: Int16x8, b: int32): Int16x8 {.importc: "vdupq_laneq_s16".}

func vdupq_laneq_s32*(a: Int32x4, b: int32): Int32x4 {.importc: "vdupq_laneq_s32".}

func vdupq_laneq_s64*(a: Int64x2, b: int32): Int64x2 {.importc: "vdupq_laneq_s64".}

func vdupq_laneq_u8*(a: Uint8x16, b: int32): Uint8x16 {.importc: "vdupq_laneq_u8".}

func vdupq_laneq_u16*(a: Uint16x8, b: int32): Uint16x8 {.importc: "vdupq_laneq_u16".}

func vdupq_laneq_u32*(a: Uint32x4, b: int32): Uint32x4 {.importc: "vdupq_laneq_u32".}

func vdupq_laneq_u64*(a: Uint64x2, b: int32): Uint64x2 {.importc: "vdupq_laneq_u64".}

func vdupb_lane_p8*(a: Poly8x8, b: int32): Poly8 {.importc: "vdupb_lane_p8".}

func vdupb_lane_s8*(a: Int8x8, b: int32): int8 {.importc: "vdupb_lane_s8".}

func vdupb_lane_u8*(a: Uint8x8, b: int32): uint8 {.importc: "vdupb_lane_u8".}

func vduph_lane_f16*(a: Float16x4, b: int32): float16 {.importc: "vduph_lane_f16".}

func vduph_lane_p16*(a: Poly16x4, b: int32): Poly16 {.importc: "vduph_lane_p16".}

func vduph_lane_s16*(a: Int16x4, b: int32): int16 {.importc: "vduph_lane_s16".}

func vduph_lane_u16*(a: Uint16x4, b: int32): uint16 {.importc: "vduph_lane_u16".}

func vdups_lane_f32*(a: Float32x2, b: int32): float32 {.importc: "vdups_lane_f32".}

func vdups_lane_s32*(a: Int32x2, b: int32): int32 {.importc: "vdups_lane_s32".}

func vdups_lane_u32*(a: Uint32x2, b: int32): uint32 {.importc: "vdups_lane_u32".}

func vdupd_lane_f64*(a: Float64x1, b: int32): float64 {.importc: "vdupd_lane_f64".}

func vdupd_lane_s64*(a: Int64x1, b: int32): int64 {.importc: "vdupd_lane_s64".}

func vdupd_lane_u64*(a: Uint64x1, b: int32): uint64 {.importc: "vdupd_lane_u64".}

func vdupb_laneq_p8*(a: Poly8x16, b: int32): Poly8 {.importc: "vdupb_laneq_p8".}

func vdupb_laneq_s8*(a: Int8x16, b: int32): int8 {.importc: "vdupb_laneq_s8".}

func vdupb_laneq_u8*(a: Uint8x16, b: int32): uint8 {.importc: "vdupb_laneq_u8".}

func vduph_laneq_f16*(a: Float16x8, b: int32): float16 {.importc: "vduph_laneq_f16".}

func vduph_laneq_p16*(a: Poly16x8, b: int32): Poly16 {.importc: "vduph_laneq_p16".}

func vduph_laneq_s16*(a: Int16x8, b: int32): int16 {.importc: "vduph_laneq_s16".}

func vduph_laneq_u16*(a: Uint16x8, b: int32): uint16 {.importc: "vduph_laneq_u16".}

func vdups_laneq_f32*(a: Float32x4, b: int32): float32 {.importc: "vdups_laneq_f32".}

func vdups_laneq_s32*(a: Int32x4, b: int32): int32 {.importc: "vdups_laneq_s32".}

func vdups_laneq_u32*(a: Uint32x4, b: int32): uint32 {.importc: "vdups_laneq_u32".}

func vdupd_laneq_f64*(a: Float64x2, b: int32): float64 {.importc: "vdupd_laneq_f64".}

func vdupd_laneq_s64*(a: Int64x2, b: int32): int64 {.importc: "vdupd_laneq_s64".}

func vdupd_laneq_u64*(a: Uint64x2, b: int32): uint64 {.importc: "vdupd_laneq_u64".}

func vext_f16*(a: Float16x4, b: Float16x4, c: int32): Float16x4 {.importc: "vext_f16".}

func vext_f32*(a: Float32x2, b: Float32x2, c: int32): Float32x2 {.importc: "vext_f32".}

func vext_f64*(a: Float64x1, b: Float64x1, c: int32): Float64x1 {.importc: "vext_f64".}

func vext_p8*(a: Poly8x8, b: Poly8x8, c: int32): Poly8x8 {.importc: "vext_p8".}

func vext_p16*(a: Poly16x4, b: Poly16x4, c: int32): Poly16x4 {.importc: "vext_p16".}

func vext_p64*(a: Poly64x1, b: Poly64x1, c: int32): Poly64x1 {.importc: "vext_p64".}

func vext_s8*(a: Int8x8, b: Int8x8, c: int32): Int8x8 {.importc: "vext_s8".}

func vext_s16*(a: Int16x4, b: Int16x4, c: int32): Int16x4 {.importc: "vext_s16".}

func vext_s32*(a: Int32x2, b: Int32x2, c: int32): Int32x2 {.importc: "vext_s32".}

func vext_s64*(a: Int64x1, b: Int64x1, c: int32): Int64x1 {.importc: "vext_s64".}

func vext_u8*(a: Uint8x8, b: Uint8x8, c: int32): Uint8x8 {.importc: "vext_u8".}

func vext_u16*(a: Uint16x4, b: Uint16x4, c: int32): Uint16x4 {.importc: "vext_u16".}

func vext_u32*(a: Uint32x2, b: Uint32x2, c: int32): Uint32x2 {.importc: "vext_u32".}

func vext_u64*(a: Uint64x1, b: Uint64x1, c: int32): Uint64x1 {.importc: "vext_u64".}

func vextq_f16*(a: Float16x8, b: Float16x8, c: int32): Float16x8 {.importc: "vextq_f16".}

func vextq_f32*(a: Float32x4, b: Float32x4, c: int32): Float32x4 {.importc: "vextq_f32".}

func vextq_f64*(a: Float64x2, b: Float64x2, c: int32): Float64x2 {.importc: "vextq_f64".}

func vextq_p8*(a: Poly8x16, b: Poly8x16, c: int32): Poly8x16 {.importc: "vextq_p8".}

func vextq_p16*(a: Poly16x8, b: Poly16x8, c: int32): Poly16x8 {.importc: "vextq_p16".}

func vextq_p64*(a: Poly64x2, b: Poly64x2, c: int32): Poly64x2 {.importc: "vextq_p64".}

func vextq_s8*(a: Int8x16, b: Int8x16, c: int32): Int8x16 {.importc: "vextq_s8".}

func vextq_s16*(a: Int16x8, b: Int16x8, c: int32): Int16x8 {.importc: "vextq_s16".}

func vextq_s32*(a: Int32x4, b: Int32x4, c: int32): Int32x4 {.importc: "vextq_s32".}

func vextq_s64*(a: Int64x2, b: Int64x2, c: int32): Int64x2 {.importc: "vextq_s64".}

func vextq_u8*(a: Uint8x16, b: Uint8x16, c: int32): Uint8x16 {.importc: "vextq_u8".}

func vextq_u16*(a: Uint16x8, b: Uint16x8, c: int32): Uint16x8 {.importc: "vextq_u16".}

func vextq_u32*(a: Uint32x4, b: Uint32x4, c: int32): Uint32x4 {.importc: "vextq_u32".}

func vextq_u64*(a: Uint64x2, b: Uint64x2, c: int32): Uint64x2 {.importc: "vextq_u64".}

func vfma_f64*(a: Float64x1, b: Float64x1, c: Float64x1): Float64x1 {.importc: "vfma_f64".}

func vfma_f32*(a: Float32x2, b: Float32x2, c: Float32x2): Float32x2 {.importc: "vfma_f32".}

func vfmaq_f32*(a: Float32x4, b: Float32x4, c: Float32x4): Float32x4 {.importc: "vfmaq_f32".}

func vfmaq_f64*(a: Float64x2, b: Float64x2, c: Float64x2): Float64x2 {.importc: "vfmaq_f64".}

func vfma_n_f32*(a: Float32x2, b: Float32x2, c: float32): Float32x2 {.importc: "vfma_n_f32".}

func vfma_n_f64*(a: Float64x1, b: Float64x1, c: float64): Float64x1 {.importc: "vfma_n_f64".}

func vfmaq_n_f32*(a: Float32x4, b: Float32x4, c: float32): Float32x4 {.importc: "vfmaq_n_f32".}

func vfmaq_n_f64*(a: Float64x2, b: Float64x2, c: float64): Float64x2 {.importc: "vfmaq_n_f64".}

func vfma_lane_f32*(a: Float32x2, b: Float32x2, c: Float32x2, lane: int32): Float32x2 {.importc: "vfma_lane_f32".}

func vfma_lane_f64*(a: Float64x1, b: Float64x1, c: Float64x1, lane: int32): Float64x1 {.importc: "vfma_lane_f64".}

func vfmad_lane_f64*(a: float64, b: float64, c: Float64x1, lane: int32): float64 {.importc: "vfmad_lane_f64".}

func vfmas_lane_f32*(a: float32, b: float32, c: Float32x2, lane: int32): float32 {.importc: "vfmas_lane_f32".}

func vfma_laneq_f32*(a: Float32x2, b: Float32x2, c: Float32x4, lane: int32): Float32x2 {.importc: "vfma_laneq_f32".}

func vfma_laneq_f64*(a: Float64x1, b: Float64x1, c: Float64x2, lane: int32): Float64x1 {.importc: "vfma_laneq_f64".}

func vfmad_laneq_f64*(a: float64, b: float64, c: Float64x2, lane: int32): float64 {.importc: "vfmad_laneq_f64".}

func vfmas_laneq_f32*(a: float32, b: float32, c: Float32x4, lane: int32): float32 {.importc: "vfmas_laneq_f32".}

func vfmaq_lane_f32*(a: Float32x4, b: Float32x4, c: Float32x2, lane: int32): Float32x4 {.importc: "vfmaq_lane_f32".}

func vfmaq_lane_f64*(a: Float64x2, b: Float64x2, c: Float64x1, lane: int32): Float64x2 {.importc: "vfmaq_lane_f64".}

func vfmaq_laneq_f32*(a: Float32x4, b: Float32x4, c: Float32x4, lane: int32): Float32x4 {.importc: "vfmaq_laneq_f32".}

func vfmaq_laneq_f64*(a: Float64x2, b: Float64x2, c: Float64x2, lane: int32): Float64x2 {.importc: "vfmaq_laneq_f64".}

func vfms_f64*(a: Float64x1, b: Float64x1, c: Float64x1): Float64x1 {.importc: "vfms_f64".}

func vfms_f32*(a: Float32x2, b: Float32x2, c: Float32x2): Float32x2 {.importc: "vfms_f32".}

func vfmsq_f32*(a: Float32x4, b: Float32x4, c: Float32x4): Float32x4 {.importc: "vfmsq_f32".}

func vfmsq_f64*(a: Float64x2, b: Float64x2, c: Float64x2): Float64x2 {.importc: "vfmsq_f64".}

func vfms_n_f32*(a: Float32x2, b: Float32x2, c: float32): Float32x2 {.importc: "vfms_n_f32".}

func vfms_n_f64*(a: Float64x1, b: Float64x1, c: float64): Float64x1 {.importc: "vfms_n_f64".}

func vfmsq_n_f32*(a: Float32x4, b: Float32x4, c: float32): Float32x4 {.importc: "vfmsq_n_f32".}

func vfmsq_n_f64*(a: Float64x2, b: Float64x2, c: float64): Float64x2 {.importc: "vfmsq_n_f64".}

func vfms_lane_f32*(a: Float32x2, b: Float32x2, c: Float32x2, lane: int32): Float32x2 {.importc: "vfms_lane_f32".}

func vfms_lane_f64*(a: Float64x1, b: Float64x1, c: Float64x1, lane: int32): Float64x1 {.importc: "vfms_lane_f64".}

func vfmsd_lane_f64*(a: float64, b: float64, c: Float64x1, lane: int32): float64 {.importc: "vfmsd_lane_f64".}

func vfmss_lane_f32*(a: float32, b: float32, c: Float32x2, lane: int32): float32 {.importc: "vfmss_lane_f32".}

func vfms_laneq_f32*(a: Float32x2, b: Float32x2, c: Float32x4, lane: int32): Float32x2 {.importc: "vfms_laneq_f32".}

func vfms_laneq_f64*(a: Float64x1, b: Float64x1, c: Float64x2, lane: int32): Float64x1 {.importc: "vfms_laneq_f64".}

func vfmsd_laneq_f64*(a: float64, b: float64, c: Float64x2, lane: int32): float64 {.importc: "vfmsd_laneq_f64".}

func vfmss_laneq_f32*(a: float32, b: float32, c: Float32x4, lane: int32): float32 {.importc: "vfmss_laneq_f32".}

func vfmsq_lane_f32*(a: Float32x4, b: Float32x4, c: Float32x2, lane: int32): Float32x4 {.importc: "vfmsq_lane_f32".}

func vfmsq_lane_f64*(a: Float64x2, b: Float64x2, c: Float64x1, lane: int32): Float64x2 {.importc: "vfmsq_lane_f64".}

func vfmsq_laneq_f32*(a: Float32x4, b: Float32x4, c: Float32x4, lane: int32): Float32x4 {.importc: "vfmsq_laneq_f32".}

func vfmsq_laneq_f64*(a: Float64x2, b: Float64x2, c: Float64x2, lane: int32): Float64x2 {.importc: "vfmsq_laneq_f64".}

func vld1_f16*(a: ptr float16): Float16x4 {.importc: "vld1_f16".}

func vld1_f32*(a: ptr float32): Float32x2 {.importc: "vld1_f32".}

func vld1_f64*(a: ptr float64): Float64x1 {.importc: "vld1_f64".}

func vld1_p8*(a: ptr Poly8): Poly8x8 {.importc: "vld1_p8".}

func vld1_p16*(a: ptr Poly16): Poly16x4 {.importc: "vld1_p16".}

func vld1_p64*(a: ptr Poly64): Poly64x1 {.importc: "vld1_p64".}

func vld1_s8*(a: ptr int8): Int8x8 {.importc: "vld1_s8".}

func vld1_s16*(a: ptr int16): Int16x4 {.importc: "vld1_s16".}

func vld1_s32*(a: ptr int32): Int32x2 {.importc: "vld1_s32".}

func vld1_s64*(a: ptr int64): Int64x1 {.importc: "vld1_s64".}

func vld1_u8*(a: ptr uint8): Uint8x8 {.importc: "vld1_u8".}

func vld1_u16*(a: ptr uint16): Uint16x4 {.importc: "vld1_u16".}

func vld1_u32*(a: ptr uint32): Uint32x2 {.importc: "vld1_u32".}

func vld1_u64*(a: ptr uint64): Uint64x1 {.importc: "vld1_u64".}

func vld1_u8_x3*(a: ptr uint8): Uint8x8x3 {.importc: "vld1_u8_x3".}

func vld1_s8_x3*(a: ptr int8): Int8x8x3 {.importc: "vld1_s8_x3".}

func vld1_u16_x3*(a: ptr uint16): Uint16x4x3 {.importc: "vld1_u16_x3".}

func vld1_s16_x3*(a: ptr int16): Int16x4x3 {.importc: "vld1_s16_x3".}

func vld1_u32_x3*(a: ptr uint32): Uint32x2x3 {.importc: "vld1_u32_x3".}

func vld1_s32_x3*(a: ptr int32): Int32x2x3 {.importc: "vld1_s32_x3".}

func vld1_u64_x3*(a: ptr uint64): Uint64x1x3 {.importc: "vld1_u64_x3".}

func vld1_s64_x3*(a: ptr int64): Int64x1x3 {.importc: "vld1_s64_x3".}

func vld1_f16_x3*(a: ptr float16): Float16x4x3 {.importc: "vld1_f16_x3".}

func vld1_f32_x3*(a: ptr float32): Float32x2x3 {.importc: "vld1_f32_x3".}

func vld1_f64_x3*(a: ptr float64): Float64x1x3 {.importc: "vld1_f64_x3".}

func vld1_p8_x3*(a: ptr Poly8): Poly8x8x3 {.importc: "vld1_p8_x3".}

func vld1_p16_x3*(a: ptr Poly16): Poly16x4x3 {.importc: "vld1_p16_x3".}

func vld1_p64_x3*(a: ptr Poly64): Poly64x1x3 {.importc: "vld1_p64_x3".}

func vld1q_u8_x3*(a: ptr uint8): Uint8x16x3 {.importc: "vld1q_u8_x3".}

func vld1q_s8_x3*(a: ptr int8): Int8x16x3 {.importc: "vld1q_s8_x3".}

func vld1q_u16_x3*(a: ptr uint16): Uint16x8x3 {.importc: "vld1q_u16_x3".}

func vld1q_s16_x3*(a: ptr int16): Int16x8x3 {.importc: "vld1q_s16_x3".}

func vld1q_u32_x3*(a: ptr uint32): Uint32x4x3 {.importc: "vld1q_u32_x3".}

func vld1q_s32_x3*(a: ptr int32): Int32x4x3 {.importc: "vld1q_s32_x3".}

func vld1q_u64_x3*(a: ptr uint64): Uint64x2x3 {.importc: "vld1q_u64_x3".}

func vld1q_s64_x3*(a: ptr int64): Int64x2x3 {.importc: "vld1q_s64_x3".}

func vld1q_f16_x3*(a: ptr float16): Float16x8x3 {.importc: "vld1q_f16_x3".}

func vld1q_f32_x3*(a: ptr float32): Float32x4x3 {.importc: "vld1q_f32_x3".}

func vld1q_f64_x3*(a: ptr float64): Float64x2x3 {.importc: "vld1q_f64_x3".}

func vld1q_p8_x3*(a: ptr Poly8): Poly8x16x3 {.importc: "vld1q_p8_x3".}

func vld1q_p16_x3*(a: ptr Poly16): Poly16x8x3 {.importc: "vld1q_p16_x3".}

func vld1q_p64_x3*(a: ptr Poly64): Poly64x2x3 {.importc: "vld1q_p64_x3".}

func vld1q_f16*(a: ptr float16): Float16x8 {.importc: "vld1q_f16".}

func vld1q_f32*(a: ptr float32): Float32x4 {.importc: "vld1q_f32".}

func vld1q_f64*(a: ptr float64): Float64x2 {.importc: "vld1q_f64".}

func vld1q_p8*(a: ptr Poly8): Poly8x16 {.importc: "vld1q_p8".}

func vld1q_p16*(a: ptr Poly16): Poly16x8 {.importc: "vld1q_p16".}

func vld1q_p64*(a: ptr Poly64): Poly64x2 {.importc: "vld1q_p64".}

func vld1q_s8*(a: ptr int8): Int8x16 {.importc: "vld1q_s8".}

func vld1q_s16*(a: ptr int16): Int16x8 {.importc: "vld1q_s16".}

func vld1q_s32*(a: ptr int32): Int32x4 {.importc: "vld1q_s32".}

func vld1q_s64*(a: ptr int64): Int64x2 {.importc: "vld1q_s64".}

func vld1q_u8*(a: ptr uint8): Uint8x16 {.importc: "vld1q_u8".}

func vld1_u8_x2*(a: ptr uint8): Uint8x8x2 {.importc: "vld1_u8_x2".}

func vld1_s8_x2*(a: ptr int8): Int8x8x2 {.importc: "vld1_s8_x2".}

func vld1_u16_x2*(a: ptr uint16): Uint16x4x2 {.importc: "vld1_u16_x2".}

func vld1_s16_x2*(a: ptr int16): Int16x4x2 {.importc: "vld1_s16_x2".}

func vld1_u32_x2*(a: ptr uint32): Uint32x2x2 {.importc: "vld1_u32_x2".}

func vld1_s32_x2*(a: ptr int32): Int32x2x2 {.importc: "vld1_s32_x2".}

func vld1_u64_x2*(a: ptr uint64): Uint64x1x2 {.importc: "vld1_u64_x2".}

func vld1_s64_x2*(a: ptr int64): Int64x1x2 {.importc: "vld1_s64_x2".}

func vld1_f16_x2*(a: ptr float16): Float16x4x2 {.importc: "vld1_f16_x2".}

func vld1_f32_x2*(a: ptr float32): Float32x2x2 {.importc: "vld1_f32_x2".}

func vld1_f64_x2*(a: ptr float64): Float64x1x2 {.importc: "vld1_f64_x2".}

func vld1_p8_x2*(a: ptr Poly8): Poly8x8x2 {.importc: "vld1_p8_x2".}

func vld1_p16_x2*(a: ptr Poly16): Poly16x4x2 {.importc: "vld1_p16_x2".}

func vld1_p64_x2*(a: ptr Poly64): Poly64x1x2 {.importc: "vld1_p64_x2".}

func vld1q_u8_x2*(a: ptr uint8): Uint8x16x2 {.importc: "vld1q_u8_x2".}

func vld1q_s8_x2*(a: ptr int8): Int8x16x2 {.importc: "vld1q_s8_x2".}

func vld1q_u16_x2*(a: ptr uint16): Uint16x8x2 {.importc: "vld1q_u16_x2".}

func vld1q_s16_x2*(a: ptr int16): Int16x8x2 {.importc: "vld1q_s16_x2".}

func vld1q_u32_x2*(a: ptr uint32): Uint32x4x2 {.importc: "vld1q_u32_x2".}

func vld1q_s32_x2*(a: ptr int32): Int32x4x2 {.importc: "vld1q_s32_x2".}

func vld1q_u64_x2*(a: ptr uint64): Uint64x2x2 {.importc: "vld1q_u64_x2".}

func vld1q_s64_x2*(a: ptr int64): Int64x2x2 {.importc: "vld1q_s64_x2".}

func vld1q_f16_x2*(a: ptr float16): Float16x8x2 {.importc: "vld1q_f16_x2".}

func vld1q_f32_x2*(a: ptr float32): Float32x4x2 {.importc: "vld1q_f32_x2".}

func vld1q_f64_x2*(a: ptr float64): Float64x2x2 {.importc: "vld1q_f64_x2".}

func vld1q_p8_x2*(a: ptr Poly8): Poly8x16x2 {.importc: "vld1q_p8_x2".}

func vld1q_p16_x2*(a: ptr Poly16): Poly16x8x2 {.importc: "vld1q_p16_x2".}

func vld1q_p64_x2*(a: ptr Poly64): Poly64x2x2 {.importc: "vld1q_p64_x2".}

func vld1q_u16*(a: ptr uint16): Uint16x8 {.importc: "vld1q_u16".}

func vld1q_u32*(a: ptr uint32): Uint32x4 {.importc: "vld1q_u32".}

func vld1q_u64*(a: ptr uint64): Uint64x2 {.importc: "vld1q_u64".}

func vld1_s8_x4*(a: ptr int8): Int8x8x4 {.importc: "vld1_s8_x4".}

func vld1q_s8_x4*(a: ptr int8): Int8x16x4 {.importc: "vld1q_s8_x4".}

func vld1_s16_x4*(a: ptr int16): Int16x4x4 {.importc: "vld1_s16_x4".}

func vld1q_s16_x4*(a: ptr int16): Int16x8x4 {.importc: "vld1q_s16_x4".}

func vld1_s32_x4*(a: ptr int32): Int32x2x4 {.importc: "vld1_s32_x4".}

func vld1q_s32_x4*(a: ptr int32): Int32x4x4 {.importc: "vld1q_s32_x4".}

func vld1_u8_x4*(a: ptr uint8): Uint8x8x4 {.importc: "vld1_u8_x4".}

func vld1q_u8_x4*(a: ptr uint8): Uint8x16x4 {.importc: "vld1q_u8_x4".}

func vld1_u16_x4*(a: ptr uint16): Uint16x4x4 {.importc: "vld1_u16_x4".}

func vld1q_u16_x4*(a: ptr uint16): Uint16x8x4 {.importc: "vld1q_u16_x4".}

func vld1_u32_x4*(a: ptr uint32): Uint32x2x4 {.importc: "vld1_u32_x4".}

func vld1q_u32_x4*(a: ptr uint32): Uint32x4x4 {.importc: "vld1q_u32_x4".}

func vld1_f16_x4*(a: ptr float16): Float16x4x4 {.importc: "vld1_f16_x4".}

func vld1q_f16_x4*(a: ptr float16): Float16x8x4 {.importc: "vld1q_f16_x4".}

func vld1_f32_x4*(a: ptr float32): Float32x2x4 {.importc: "vld1_f32_x4".}

func vld1q_f32_x4*(a: ptr float32): Float32x4x4 {.importc: "vld1q_f32_x4".}

func vld1_p8_x4*(a: ptr Poly8): Poly8x8x4 {.importc: "vld1_p8_x4".}

func vld1q_p8_x4*(a: ptr Poly8): Poly8x16x4 {.importc: "vld1q_p8_x4".}

func vld1_p16_x4*(a: ptr Poly16): Poly16x4x4 {.importc: "vld1_p16_x4".}

func vld1q_p16_x4*(a: ptr Poly16): Poly16x8x4 {.importc: "vld1q_p16_x4".}

func vld1_s64_x4*(a: ptr int64): Int64x1x4 {.importc: "vld1_s64_x4".}

func vld1_u64_x4*(a: ptr uint64): Uint64x1x4 {.importc: "vld1_u64_x4".}

func vld1_p64_x4*(a: ptr Poly64): Poly64x1x4 {.importc: "vld1_p64_x4".}

func vld1q_s64_x4*(a: ptr int64): Int64x2x4 {.importc: "vld1q_s64_x4".}

func vld1q_u64_x4*(a: ptr uint64): Uint64x2x4 {.importc: "vld1q_u64_x4".}

func vld1q_p64_x4*(a: ptr Poly64): Poly64x2x4 {.importc: "vld1q_p64_x4".}

func vld1_f64_x4*(a: ptr float64): Float64x1x4 {.importc: "vld1_f64_x4".}

func vld1q_f64_x4*(a: ptr float64): Float64x2x4 {.importc: "vld1q_f64_x4".}

func vld1_dup_f16*(a: ptr float16): Float16x4 {.importc: "vld1_dup_f16".}

func vld1_dup_f32*(a: ptr float32): Float32x2 {.importc: "vld1_dup_f32".}

func vld1_dup_f64*(a: ptr float64): Float64x1 {.importc: "vld1_dup_f64".}

func vld1_dup_p8*(a: ptr Poly8): Poly8x8 {.importc: "vld1_dup_p8".}

func vld1_dup_p16*(a: ptr Poly16): Poly16x4 {.importc: "vld1_dup_p16".}

func vld1_dup_p64*(a: ptr Poly64): Poly64x1 {.importc: "vld1_dup_p64".}

func vld1_dup_s8*(a: ptr int8): Int8x8 {.importc: "vld1_dup_s8".}

func vld1_dup_s16*(a: ptr int16): Int16x4 {.importc: "vld1_dup_s16".}

func vld1_dup_s32*(a: ptr int32): Int32x2 {.importc: "vld1_dup_s32".}

func vld1_dup_s64*(a: ptr int64): Int64x1 {.importc: "vld1_dup_s64".}

func vld1_dup_u8*(a: ptr uint8): Uint8x8 {.importc: "vld1_dup_u8".}

func vld1_dup_u16*(a: ptr uint16): Uint16x4 {.importc: "vld1_dup_u16".}

func vld1_dup_u32*(a: ptr uint32): Uint32x2 {.importc: "vld1_dup_u32".}

func vld1_dup_u64*(a: ptr uint64): Uint64x1 {.importc: "vld1_dup_u64".}

func vld1q_dup_f16*(a: ptr float16): Float16x8 {.importc: "vld1q_dup_f16".}

func vld1q_dup_f32*(a: ptr float32): Float32x4 {.importc: "vld1q_dup_f32".}

func vld1q_dup_f64*(a: ptr float64): Float64x2 {.importc: "vld1q_dup_f64".}

func vld1q_dup_p8*(a: ptr Poly8): Poly8x16 {.importc: "vld1q_dup_p8".}

func vld1q_dup_p16*(a: ptr Poly16): Poly16x8 {.importc: "vld1q_dup_p16".}

func vld1q_dup_p64*(a: ptr Poly64): Poly64x2 {.importc: "vld1q_dup_p64".}

func vld1q_dup_s8*(a: ptr int8): Int8x16 {.importc: "vld1q_dup_s8".}

func vld1q_dup_s16*(a: ptr int16): Int16x8 {.importc: "vld1q_dup_s16".}

func vld1q_dup_s32*(a: ptr int32): Int32x4 {.importc: "vld1q_dup_s32".}

func vld1q_dup_s64*(a: ptr int64): Int64x2 {.importc: "vld1q_dup_s64".}

func vld1q_dup_u8*(a: ptr uint8): Uint8x16 {.importc: "vld1q_dup_u8".}

func vld1q_dup_u16*(a: ptr uint16): Uint16x8 {.importc: "vld1q_dup_u16".}

func vld1q_dup_u32*(a: ptr uint32): Uint32x4 {.importc: "vld1q_dup_u32".}

func vld1q_dup_u64*(a: ptr uint64): Uint64x2 {.importc: "vld1q_dup_u64".}

func vld1_lane_f16*(src: ptr float16, vec: Float16x4, lane: int32): Float16x4 {.importc: "vld1_lane_f16".}

func vld1_lane_f32*(src: ptr float32, vec: Float32x2, lane: int32): Float32x2 {.importc: "vld1_lane_f32".}

func vld1_lane_f64*(src: ptr float64, vec: Float64x1, lane: int32): Float64x1 {.importc: "vld1_lane_f64".}

func vld1_lane_p8*(src: ptr Poly8, vec: Poly8x8, lane: int32): Poly8x8 {.importc: "vld1_lane_p8".}

func vld1_lane_p16*(src: ptr Poly16, vec: Poly16x4, lane: int32): Poly16x4 {.importc: "vld1_lane_p16".}

func vld1_lane_p64*(src: ptr Poly64, vec: Poly64x1, lane: int32): Poly64x1 {.importc: "vld1_lane_p64".}

func vld1_lane_s8*(src: ptr int8, vec: Int8x8, lane: int32): Int8x8 {.importc: "vld1_lane_s8".}

func vld1_lane_s16*(src: ptr int16, vec: Int16x4, lane: int32): Int16x4 {.importc: "vld1_lane_s16".}

func vld1_lane_s32*(src: ptr int32, vec: Int32x2, lane: int32): Int32x2 {.importc: "vld1_lane_s32".}

func vld1_lane_s64*(src: ptr int64, vec: Int64x1, lane: int32): Int64x1 {.importc: "vld1_lane_s64".}

func vld1_lane_u8*(src: ptr uint8, vec: Uint8x8, lane: int32): Uint8x8 {.importc: "vld1_lane_u8".}

func vld1_lane_u16*(src: ptr uint16, vec: Uint16x4, lane: int32): Uint16x4 {.importc: "vld1_lane_u16".}

func vld1_lane_u32*(src: ptr uint32, vec: Uint32x2, lane: int32): Uint32x2 {.importc: "vld1_lane_u32".}

func vld1_lane_u64*(src: ptr uint64, vec: Uint64x1, lane: int32): Uint64x1 {.importc: "vld1_lane_u64".}

func vld1q_lane_f16*(src: ptr float16, vec: Float16x8, lane: int32): Float16x8 {.importc: "vld1q_lane_f16".}

func vld1q_lane_f32*(src: ptr float32, vec: Float32x4, lane: int32): Float32x4 {.importc: "vld1q_lane_f32".}

func vld1q_lane_f64*(src: ptr float64, vec: Float64x2, lane: int32): Float64x2 {.importc: "vld1q_lane_f64".}

func vld1q_lane_p8*(src: ptr Poly8, vec: Poly8x16, lane: int32): Poly8x16 {.importc: "vld1q_lane_p8".}

func vld1q_lane_p16*(src: ptr Poly16, vec: Poly16x8, lane: int32): Poly16x8 {.importc: "vld1q_lane_p16".}

func vld1q_lane_p64*(src: ptr Poly64, vec: Poly64x2, lane: int32): Poly64x2 {.importc: "vld1q_lane_p64".}

func vld1q_lane_s8*(src: ptr int8, vec: Int8x16, lane: int32): Int8x16 {.importc: "vld1q_lane_s8".}

func vld1q_lane_s16*(src: ptr int16, vec: Int16x8, lane: int32): Int16x8 {.importc: "vld1q_lane_s16".}

func vld1q_lane_s32*(src: ptr int32, vec: Int32x4, lane: int32): Int32x4 {.importc: "vld1q_lane_s32".}

func vld1q_lane_s64*(src: ptr int64, vec: Int64x2, lane: int32): Int64x2 {.importc: "vld1q_lane_s64".}

func vld1q_lane_u8*(src: ptr uint8, vec: Uint8x16, lane: int32): Uint8x16 {.importc: "vld1q_lane_u8".}

func vld1q_lane_u16*(src: ptr uint16, vec: Uint16x8, lane: int32): Uint16x8 {.importc: "vld1q_lane_u16".}

func vld1q_lane_u32*(src: ptr uint32, vec: Uint32x4, lane: int32): Uint32x4 {.importc: "vld1q_lane_u32".}

func vld1q_lane_u64*(src: ptr uint64, vec: Uint64x2, lane: int32): Uint64x2 {.importc: "vld1q_lane_u64".}

func vldap1_lane_u64*(src: ptr uint64, vec: Uint64x1, lane: int32): Uint64x1 {.importc: "vldap1_lane_u64".}

func vldap1q_lane_u64*(src: ptr uint64, vec: Uint64x2, lane: int32): Uint64x2 {.importc: "vldap1q_lane_u64".}

func vldap1_lane_s64*(src: ptr int64, vec: Int64x1, lane: int32): Int64x1 {.importc: "vldap1_lane_s64".}

func vldap1q_lane_s64*(src: ptr int64, vec: Int64x2, lane: int32): Int64x2 {.importc: "vldap1q_lane_s64".}

func vldap1_lane_f64*(src: ptr float64, vec: Float64x1, lane: int32): Float64x1 {.importc: "vldap1_lane_f64".}

func vldap1q_lane_f64*(src: ptr float64, vec: Float64x2, lane: int32): Float64x2 {.importc: "vldap1q_lane_f64".}

func vldap1_lane_p64*(src: ptr Poly64, vec: Poly64x1, lane: int32): Poly64x1 {.importc: "vldap1_lane_p64".}

func vldap1q_lane_p64*(src: ptr Poly64, vec: Poly64x2, lane: int32): Poly64x2 {.importc: "vldap1q_lane_p64".}

func vstl1_lane_u64*(src: ptr uint64, vec: Uint64x1, lane: int32): void {.importc: "vstl1_lane_u64".}

func vstl1q_lane_u64*(src: ptr uint64, vec: Uint64x2, lane: int32): void {.importc: "vstl1q_lane_u64".}

func vstl1_lane_s64*(src: ptr int64, vec: Int64x1, lane: int32): void {.importc: "vstl1_lane_s64".}

func vstl1q_lane_s64*(src: ptr int64, vec: Int64x2, lane: int32): void {.importc: "vstl1q_lane_s64".}

func vstl1_lane_f64*(src: ptr float64, vec: Float64x1, lane: int32): void {.importc: "vstl1_lane_f64".}

func vstl1q_lane_f64*(src: ptr float64, vec: Float64x2, lane: int32): void {.importc: "vstl1q_lane_f64".}

func vstl1_lane_p64*(src: ptr Poly64, vec: Poly64x1, lane: int32): void {.importc: "vstl1_lane_p64".}

func vstl1q_lane_p64*(src: ptr Poly64, vec: Poly64x2, lane: int32): void {.importc: "vstl1q_lane_p64".}

func vld2_s64*(a: ptr int64): Int64x1x2 {.importc: "vld2_s64".}

func vld2_u64*(a: ptr uint64): Uint64x1x2 {.importc: "vld2_u64".}

func vld2_f64*(a: ptr float64): Float64x1x2 {.importc: "vld2_f64".}

func vld2_s8*(a: ptr int8): Int8x8x2 {.importc: "vld2_s8".}

func vld2_p8*(a: ptr Poly8): Poly8x8x2 {.importc: "vld2_p8".}

func vld2_p64*(a: ptr Poly64): Poly64x1x2 {.importc: "vld2_p64".}

func vld2_s16*(a: ptr int16): Int16x4x2 {.importc: "vld2_s16".}

func vld2_p16*(a: ptr Poly16): Poly16x4x2 {.importc: "vld2_p16".}

func vld2_s32*(a: ptr int32): Int32x2x2 {.importc: "vld2_s32".}

func vld2_u8*(a: ptr uint8): Uint8x8x2 {.importc: "vld2_u8".}

func vld2_u16*(a: ptr uint16): Uint16x4x2 {.importc: "vld2_u16".}

func vld2_u32*(a: ptr uint32): Uint32x2x2 {.importc: "vld2_u32".}

func vld2_f16*(a: ptr float16): Float16x4x2 {.importc: "vld2_f16".}

func vld2_f32*(a: ptr float32): Float32x2x2 {.importc: "vld2_f32".}

func vld2q_s8*(a: ptr int8): Int8x16x2 {.importc: "vld2q_s8".}

func vld2q_p8*(a: ptr Poly8): Poly8x16x2 {.importc: "vld2q_p8".}

func vld2q_s16*(a: ptr int16): Int16x8x2 {.importc: "vld2q_s16".}

func vld2q_p16*(a: ptr Poly16): Poly16x8x2 {.importc: "vld2q_p16".}

func vld2q_p64*(a: ptr Poly64): Poly64x2x2 {.importc: "vld2q_p64".}

func vld2q_s32*(a: ptr int32): Int32x4x2 {.importc: "vld2q_s32".}

func vld2q_s64*(a: ptr int64): Int64x2x2 {.importc: "vld2q_s64".}

func vld2q_u8*(a: ptr uint8): Uint8x16x2 {.importc: "vld2q_u8".}

func vld2q_u16*(a: ptr uint16): Uint16x8x2 {.importc: "vld2q_u16".}

func vld2q_u32*(a: ptr uint32): Uint32x4x2 {.importc: "vld2q_u32".}

func vld2q_u64*(a: ptr uint64): Uint64x2x2 {.importc: "vld2q_u64".}

func vld2q_f16*(a: ptr float16): Float16x8x2 {.importc: "vld2q_f16".}

func vld2q_f32*(a: ptr float32): Float32x4x2 {.importc: "vld2q_f32".}

func vld2q_f64*(a: ptr float64): Float64x2x2 {.importc: "vld2q_f64".}

func vld3_s64*(a: ptr int64): Int64x1x3 {.importc: "vld3_s64".}

func vld3_u64*(a: ptr uint64): Uint64x1x3 {.importc: "vld3_u64".}

func vld3_f64*(a: ptr float64): Float64x1x3 {.importc: "vld3_f64".}

func vld3_s8*(a: ptr int8): Int8x8x3 {.importc: "vld3_s8".}

func vld3_p8*(a: ptr Poly8): Poly8x8x3 {.importc: "vld3_p8".}

func vld3_s16*(a: ptr int16): Int16x4x3 {.importc: "vld3_s16".}

func vld3_p16*(a: ptr Poly16): Poly16x4x3 {.importc: "vld3_p16".}

func vld3_s32*(a: ptr int32): Int32x2x3 {.importc: "vld3_s32".}

func vld3_u8*(a: ptr uint8): Uint8x8x3 {.importc: "vld3_u8".}

func vld3_u16*(a: ptr uint16): Uint16x4x3 {.importc: "vld3_u16".}

func vld3_u32*(a: ptr uint32): Uint32x2x3 {.importc: "vld3_u32".}

func vld3_f16*(a: ptr float16): Float16x4x3 {.importc: "vld3_f16".}

func vld3_f32*(a: ptr float32): Float32x2x3 {.importc: "vld3_f32".}

func vld3_p64*(a: ptr Poly64): Poly64x1x3 {.importc: "vld3_p64".}

func vld3q_s8*(a: ptr int8): Int8x16x3 {.importc: "vld3q_s8".}

func vld3q_p8*(a: ptr Poly8): Poly8x16x3 {.importc: "vld3q_p8".}

func vld3q_s16*(a: ptr int16): Int16x8x3 {.importc: "vld3q_s16".}

func vld3q_p16*(a: ptr Poly16): Poly16x8x3 {.importc: "vld3q_p16".}

func vld3q_s32*(a: ptr int32): Int32x4x3 {.importc: "vld3q_s32".}

func vld3q_s64*(a: ptr int64): Int64x2x3 {.importc: "vld3q_s64".}

func vld3q_u8*(a: ptr uint8): Uint8x16x3 {.importc: "vld3q_u8".}

func vld3q_u16*(a: ptr uint16): Uint16x8x3 {.importc: "vld3q_u16".}

func vld3q_u32*(a: ptr uint32): Uint32x4x3 {.importc: "vld3q_u32".}

func vld3q_u64*(a: ptr uint64): Uint64x2x3 {.importc: "vld3q_u64".}

func vld3q_f16*(a: ptr float16): Float16x8x3 {.importc: "vld3q_f16".}

func vld3q_f32*(a: ptr float32): Float32x4x3 {.importc: "vld3q_f32".}

func vld3q_f64*(a: ptr float64): Float64x2x3 {.importc: "vld3q_f64".}

func vld3q_p64*(a: ptr Poly64): Poly64x2x3 {.importc: "vld3q_p64".}

func vld4_s64*(a: ptr int64): Int64x1x4 {.importc: "vld4_s64".}

func vld4_u64*(a: ptr uint64): Uint64x1x4 {.importc: "vld4_u64".}

func vld4_f64*(a: ptr float64): Float64x1x4 {.importc: "vld4_f64".}

func vld4_s8*(a: ptr int8): Int8x8x4 {.importc: "vld4_s8".}

func vld4_p8*(a: ptr Poly8): Poly8x8x4 {.importc: "vld4_p8".}

func vld4_s16*(a: ptr int16): Int16x4x4 {.importc: "vld4_s16".}

func vld4_p16*(a: ptr Poly16): Poly16x4x4 {.importc: "vld4_p16".}

func vld4_s32*(a: ptr int32): Int32x2x4 {.importc: "vld4_s32".}

func vld4_u8*(a: ptr uint8): Uint8x8x4 {.importc: "vld4_u8".}

func vld4_u16*(a: ptr uint16): Uint16x4x4 {.importc: "vld4_u16".}

func vld4_u32*(a: ptr uint32): Uint32x2x4 {.importc: "vld4_u32".}

func vld4_f16*(a: ptr float16): Float16x4x4 {.importc: "vld4_f16".}

func vld4_f32*(a: ptr float32): Float32x2x4 {.importc: "vld4_f32".}

func vld4_p64*(a: ptr Poly64): Poly64x1x4 {.importc: "vld4_p64".}

func vld4q_s8*(a: ptr int8): Int8x16x4 {.importc: "vld4q_s8".}

func vld4q_p8*(a: ptr Poly8): Poly8x16x4 {.importc: "vld4q_p8".}

func vld4q_s16*(a: ptr int16): Int16x8x4 {.importc: "vld4q_s16".}

func vld4q_p16*(a: ptr Poly16): Poly16x8x4 {.importc: "vld4q_p16".}

func vld4q_s32*(a: ptr int32): Int32x4x4 {.importc: "vld4q_s32".}

func vld4q_s64*(a: ptr int64): Int64x2x4 {.importc: "vld4q_s64".}

func vld4q_u8*(a: ptr uint8): Uint8x16x4 {.importc: "vld4q_u8".}

func vld4q_u16*(a: ptr uint16): Uint16x8x4 {.importc: "vld4q_u16".}

func vld4q_u32*(a: ptr uint32): Uint32x4x4 {.importc: "vld4q_u32".}

func vld4q_u64*(a: ptr uint64): Uint64x2x4 {.importc: "vld4q_u64".}

func vld4q_f16*(a: ptr float16): Float16x8x4 {.importc: "vld4q_f16".}

func vld4q_f32*(a: ptr float32): Float32x4x4 {.importc: "vld4q_f32".}

func vld4q_f64*(a: ptr float64): Float64x2x4 {.importc: "vld4q_f64".}

func vld4q_p64*(a: ptr Poly64): Poly64x2x4 {.importc: "vld4q_p64".}

func vldrq_p128*(ptr: ptr Poly128): Poly128 {.importc: "vldrq_p128".}

func vld2_dup_s8*(a: ptr int8): Int8x8x2 {.importc: "vld2_dup_s8".}

func vld2_dup_s16*(a: ptr int16): Int16x4x2 {.importc: "vld2_dup_s16".}

func vld2_dup_s32*(a: ptr int32): Int32x2x2 {.importc: "vld2_dup_s32".}

func vld2_dup_f16*(a: ptr float16): Float16x4x2 {.importc: "vld2_dup_f16".}

func vld2_dup_f32*(a: ptr float32): Float32x2x2 {.importc: "vld2_dup_f32".}

func vld2_dup_f64*(a: ptr float64): Float64x1x2 {.importc: "vld2_dup_f64".}

func vld2_dup_u8*(a: ptr uint8): Uint8x8x2 {.importc: "vld2_dup_u8".}

func vld2_dup_u16*(a: ptr uint16): Uint16x4x2 {.importc: "vld2_dup_u16".}

func vld2_dup_u32*(a: ptr uint32): Uint32x2x2 {.importc: "vld2_dup_u32".}

func vld2_dup_p8*(a: ptr Poly8): Poly8x8x2 {.importc: "vld2_dup_p8".}

func vld2_dup_p16*(a: ptr Poly16): Poly16x4x2 {.importc: "vld2_dup_p16".}

func vld2_dup_p64*(a: ptr Poly64): Poly64x1x2 {.importc: "vld2_dup_p64".}

func vld2_dup_s64*(a: ptr int64): Int64x1x2 {.importc: "vld2_dup_s64".}

func vld2_dup_u64*(a: ptr uint64): Uint64x1x2 {.importc: "vld2_dup_u64".}

func vld2q_dup_s8*(a: ptr int8): Int8x16x2 {.importc: "vld2q_dup_s8".}

func vld2q_dup_p8*(a: ptr Poly8): Poly8x16x2 {.importc: "vld2q_dup_p8".}

func vld2q_dup_s16*(a: ptr int16): Int16x8x2 {.importc: "vld2q_dup_s16".}

func vld2q_dup_p16*(a: ptr Poly16): Poly16x8x2 {.importc: "vld2q_dup_p16".}

func vld2q_dup_s32*(a: ptr int32): Int32x4x2 {.importc: "vld2q_dup_s32".}

func vld2q_dup_s64*(a: ptr int64): Int64x2x2 {.importc: "vld2q_dup_s64".}

func vld2q_dup_u8*(a: ptr uint8): Uint8x16x2 {.importc: "vld2q_dup_u8".}

func vld2q_dup_u16*(a: ptr uint16): Uint16x8x2 {.importc: "vld2q_dup_u16".}

func vld2q_dup_u32*(a: ptr uint32): Uint32x4x2 {.importc: "vld2q_dup_u32".}

func vld2q_dup_u64*(a: ptr uint64): Uint64x2x2 {.importc: "vld2q_dup_u64".}

func vld2q_dup_f16*(a: ptr float16): Float16x8x2 {.importc: "vld2q_dup_f16".}

func vld2q_dup_f32*(a: ptr float32): Float32x4x2 {.importc: "vld2q_dup_f32".}

func vld2q_dup_f64*(a: ptr float64): Float64x2x2 {.importc: "vld2q_dup_f64".}

func vld2q_dup_p64*(a: ptr Poly64): Poly64x2x2 {.importc: "vld2q_dup_p64".}

func vld3_dup_s64*(a: ptr int64): Int64x1x3 {.importc: "vld3_dup_s64".}

func vld3_dup_u64*(a: ptr uint64): Uint64x1x3 {.importc: "vld3_dup_u64".}

func vld3_dup_f64*(a: ptr float64): Float64x1x3 {.importc: "vld3_dup_f64".}

func vld3_dup_s8*(a: ptr int8): Int8x8x3 {.importc: "vld3_dup_s8".}

func vld3_dup_p8*(a: ptr Poly8): Poly8x8x3 {.importc: "vld3_dup_p8".}

func vld3_dup_s16*(a: ptr int16): Int16x4x3 {.importc: "vld3_dup_s16".}

func vld3_dup_p16*(a: ptr Poly16): Poly16x4x3 {.importc: "vld3_dup_p16".}

func vld3_dup_s32*(a: ptr int32): Int32x2x3 {.importc: "vld3_dup_s32".}

func vld3_dup_u8*(a: ptr uint8): Uint8x8x3 {.importc: "vld3_dup_u8".}

func vld3_dup_u16*(a: ptr uint16): Uint16x4x3 {.importc: "vld3_dup_u16".}

func vld3_dup_u32*(a: ptr uint32): Uint32x2x3 {.importc: "vld3_dup_u32".}

func vld3_dup_f16*(a: ptr float16): Float16x4x3 {.importc: "vld3_dup_f16".}

func vld3_dup_f32*(a: ptr float32): Float32x2x3 {.importc: "vld3_dup_f32".}

func vld3_dup_p64*(a: ptr Poly64): Poly64x1x3 {.importc: "vld3_dup_p64".}

func vld3q_dup_s8*(a: ptr int8): Int8x16x3 {.importc: "vld3q_dup_s8".}

func vld3q_dup_p8*(a: ptr Poly8): Poly8x16x3 {.importc: "vld3q_dup_p8".}

func vld3q_dup_s16*(a: ptr int16): Int16x8x3 {.importc: "vld3q_dup_s16".}

func vld3q_dup_p16*(a: ptr Poly16): Poly16x8x3 {.importc: "vld3q_dup_p16".}

func vld3q_dup_s32*(a: ptr int32): Int32x4x3 {.importc: "vld3q_dup_s32".}

func vld3q_dup_s64*(a: ptr int64): Int64x2x3 {.importc: "vld3q_dup_s64".}

func vld3q_dup_u8*(a: ptr uint8): Uint8x16x3 {.importc: "vld3q_dup_u8".}

func vld3q_dup_u16*(a: ptr uint16): Uint16x8x3 {.importc: "vld3q_dup_u16".}

func vld3q_dup_u32*(a: ptr uint32): Uint32x4x3 {.importc: "vld3q_dup_u32".}

func vld3q_dup_u64*(a: ptr uint64): Uint64x2x3 {.importc: "vld3q_dup_u64".}

func vld3q_dup_f16*(a: ptr float16): Float16x8x3 {.importc: "vld3q_dup_f16".}

func vld3q_dup_f32*(a: ptr float32): Float32x4x3 {.importc: "vld3q_dup_f32".}

func vld3q_dup_f64*(a: ptr float64): Float64x2x3 {.importc: "vld3q_dup_f64".}

func vld3q_dup_p64*(a: ptr Poly64): Poly64x2x3 {.importc: "vld3q_dup_p64".}

func vld4_dup_s64*(a: ptr int64): Int64x1x4 {.importc: "vld4_dup_s64".}

func vld4_dup_u64*(a: ptr uint64): Uint64x1x4 {.importc: "vld4_dup_u64".}

func vld4_dup_f64*(a: ptr float64): Float64x1x4 {.importc: "vld4_dup_f64".}

func vld4_dup_s8*(a: ptr int8): Int8x8x4 {.importc: "vld4_dup_s8".}

func vld4_dup_p8*(a: ptr Poly8): Poly8x8x4 {.importc: "vld4_dup_p8".}

func vld4_dup_s16*(a: ptr int16): Int16x4x4 {.importc: "vld4_dup_s16".}

func vld4_dup_p16*(a: ptr Poly16): Poly16x4x4 {.importc: "vld4_dup_p16".}

func vld4_dup_s32*(a: ptr int32): Int32x2x4 {.importc: "vld4_dup_s32".}

func vld4_dup_u8*(a: ptr uint8): Uint8x8x4 {.importc: "vld4_dup_u8".}

func vld4_dup_u16*(a: ptr uint16): Uint16x4x4 {.importc: "vld4_dup_u16".}

func vld4_dup_u32*(a: ptr uint32): Uint32x2x4 {.importc: "vld4_dup_u32".}

func vld4_dup_f16*(a: ptr float16): Float16x4x4 {.importc: "vld4_dup_f16".}

func vld4_dup_f32*(a: ptr float32): Float32x2x4 {.importc: "vld4_dup_f32".}

func vld4_dup_p64*(a: ptr Poly64): Poly64x1x4 {.importc: "vld4_dup_p64".}

func vld4q_dup_s8*(a: ptr int8): Int8x16x4 {.importc: "vld4q_dup_s8".}

func vld4q_dup_p8*(a: ptr Poly8): Poly8x16x4 {.importc: "vld4q_dup_p8".}

func vld4q_dup_s16*(a: ptr int16): Int16x8x4 {.importc: "vld4q_dup_s16".}

func vld4q_dup_p16*(a: ptr Poly16): Poly16x8x4 {.importc: "vld4q_dup_p16".}

func vld4q_dup_s32*(a: ptr int32): Int32x4x4 {.importc: "vld4q_dup_s32".}

func vld4q_dup_s64*(a: ptr int64): Int64x2x4 {.importc: "vld4q_dup_s64".}

func vld4q_dup_u8*(a: ptr uint8): Uint8x16x4 {.importc: "vld4q_dup_u8".}

func vld4q_dup_u16*(a: ptr uint16): Uint16x8x4 {.importc: "vld4q_dup_u16".}

func vld4q_dup_u32*(a: ptr uint32): Uint32x4x4 {.importc: "vld4q_dup_u32".}

func vld4q_dup_u64*(a: ptr uint64): Uint64x2x4 {.importc: "vld4q_dup_u64".}

func vld4q_dup_f16*(a: ptr float16): Float16x8x4 {.importc: "vld4q_dup_f16".}

func vld4q_dup_f32*(a: ptr float32): Float32x4x4 {.importc: "vld4q_dup_f32".}

func vld4q_dup_f64*(a: ptr float64): Float64x2x4 {.importc: "vld4q_dup_f64".}

func vld4q_dup_p64*(a: ptr Poly64): Poly64x2x4 {.importc: "vld4q_dup_p64".}

func vld2_lane_u8*(ptr: ptr uint8, b: Uint8x8x2, c: int32): Uint8x8x2 {.importc: "vld2_lane_u8".}

func vld2_lane_u16*(ptr: ptr uint16, b: Uint16x4x2, c: int32): Uint16x4x2 {.importc: "vld2_lane_u16".}

func vld2_lane_u32*(ptr: ptr uint32, b: Uint32x2x2, c: int32): Uint32x2x2 {.importc: "vld2_lane_u32".}

func vld2_lane_u64*(ptr: ptr uint64, b: Uint64x1x2, c: int32): Uint64x1x2 {.importc: "vld2_lane_u64".}

func vld2_lane_s8*(ptr: ptr int8, b: Int8x8x2, c: int32): Int8x8x2 {.importc: "vld2_lane_s8".}

func vld2_lane_s16*(ptr: ptr int16, b: Int16x4x2, c: int32): Int16x4x2 {.importc: "vld2_lane_s16".}

func vld2_lane_s32*(ptr: ptr int32, b: Int32x2x2, c: int32): Int32x2x2 {.importc: "vld2_lane_s32".}

func vld2_lane_s64*(ptr: ptr int64, b: Int64x1x2, c: int32): Int64x1x2 {.importc: "vld2_lane_s64".}

func vld2_lane_f16*(ptr: ptr float16, b: Float16x4x2, c: int32): Float16x4x2 {.importc: "vld2_lane_f16".}

func vld2_lane_f32*(ptr: ptr float32, b: Float32x2x2, c: int32): Float32x2x2 {.importc: "vld2_lane_f32".}

func vld2_lane_f64*(ptr: ptr float64, b: Float64x1x2, c: int32): Float64x1x2 {.importc: "vld2_lane_f64".}

func vld2_lane_p8*(ptr: ptr Poly8, b: Poly8x8x2, c: int32): Poly8x8x2 {.importc: "vld2_lane_p8".}

func vld2_lane_p16*(ptr: ptr Poly16, b: Poly16x4x2, c: int32): Poly16x4x2 {.importc: "vld2_lane_p16".}

func vld2_lane_p64*(ptr: ptr Poly64, b: Poly64x1x2, c: int32): Poly64x1x2 {.importc: "vld2_lane_p64".}

func vld2q_lane_u8*(ptr: ptr uint8, b: Uint8x16x2, c: int32): Uint8x16x2 {.importc: "vld2q_lane_u8".}

func vld2q_lane_u16*(ptr: ptr uint16, b: Uint16x8x2, c: int32): Uint16x8x2 {.importc: "vld2q_lane_u16".}

func vld2q_lane_u32*(ptr: ptr uint32, b: Uint32x4x2, c: int32): Uint32x4x2 {.importc: "vld2q_lane_u32".}

func vld2q_lane_u64*(ptr: ptr uint64, b: Uint64x2x2, c: int32): Uint64x2x2 {.importc: "vld2q_lane_u64".}

func vld2q_lane_s8*(ptr: ptr int8, b: Int8x16x2, c: int32): Int8x16x2 {.importc: "vld2q_lane_s8".}

func vld2q_lane_s16*(ptr: ptr int16, b: Int16x8x2, c: int32): Int16x8x2 {.importc: "vld2q_lane_s16".}

func vld2q_lane_s32*(ptr: ptr int32, b: Int32x4x2, c: int32): Int32x4x2 {.importc: "vld2q_lane_s32".}

func vld2q_lane_s64*(ptr: ptr int64, b: Int64x2x2, c: int32): Int64x2x2 {.importc: "vld2q_lane_s64".}

func vld2q_lane_f16*(ptr: ptr float16, b: Float16x8x2, c: int32): Float16x8x2 {.importc: "vld2q_lane_f16".}

func vld2q_lane_f32*(ptr: ptr float32, b: Float32x4x2, c: int32): Float32x4x2 {.importc: "vld2q_lane_f32".}

func vld2q_lane_f64*(ptr: ptr float64, b: Float64x2x2, c: int32): Float64x2x2 {.importc: "vld2q_lane_f64".}

func vld2q_lane_p8*(ptr: ptr Poly8, b: Poly8x16x2, c: int32): Poly8x16x2 {.importc: "vld2q_lane_p8".}

func vld2q_lane_p16*(ptr: ptr Poly16, b: Poly16x8x2, c: int32): Poly16x8x2 {.importc: "vld2q_lane_p16".}

func vld2q_lane_p64*(ptr: ptr Poly64, b: Poly64x2x2, c: int32): Poly64x2x2 {.importc: "vld2q_lane_p64".}

func vld3_lane_u8*(ptr: ptr uint8, b: Uint8x8x3, c: int32): Uint8x8x3 {.importc: "vld3_lane_u8".}

func vld3_lane_u16*(ptr: ptr uint16, b: Uint16x4x3, c: int32): Uint16x4x3 {.importc: "vld3_lane_u16".}

func vld3_lane_u32*(ptr: ptr uint32, b: Uint32x2x3, c: int32): Uint32x2x3 {.importc: "vld3_lane_u32".}

func vld3_lane_u64*(ptr: ptr uint64, b: Uint64x1x3, c: int32): Uint64x1x3 {.importc: "vld3_lane_u64".}

func vld3_lane_s8*(ptr: ptr int8, b: Int8x8x3, c: int32): Int8x8x3 {.importc: "vld3_lane_s8".}

func vld3_lane_s16*(ptr: ptr int16, b: Int16x4x3, c: int32): Int16x4x3 {.importc: "vld3_lane_s16".}

func vld3_lane_s32*(ptr: ptr int32, b: Int32x2x3, c: int32): Int32x2x3 {.importc: "vld3_lane_s32".}

func vld3_lane_s64*(ptr: ptr int64, b: Int64x1x3, c: int32): Int64x1x3 {.importc: "vld3_lane_s64".}

func vld3_lane_f16*(ptr: ptr float16, b: Float16x4x3, c: int32): Float16x4x3 {.importc: "vld3_lane_f16".}

func vld3_lane_f32*(ptr: ptr float32, b: Float32x2x3, c: int32): Float32x2x3 {.importc: "vld3_lane_f32".}

func vld3_lane_f64*(ptr: ptr float64, b: Float64x1x3, c: int32): Float64x1x3 {.importc: "vld3_lane_f64".}

func vld3_lane_p8*(ptr: ptr Poly8, b: Poly8x8x3, c: int32): Poly8x8x3 {.importc: "vld3_lane_p8".}

func vld3_lane_p16*(ptr: ptr Poly16, b: Poly16x4x3, c: int32): Poly16x4x3 {.importc: "vld3_lane_p16".}

func vld3_lane_p64*(ptr: ptr Poly64, b: Poly64x1x3, c: int32): Poly64x1x3 {.importc: "vld3_lane_p64".}

func vld3q_lane_u8*(ptr: ptr uint8, b: Uint8x16x3, c: int32): Uint8x16x3 {.importc: "vld3q_lane_u8".}

func vld3q_lane_u16*(ptr: ptr uint16, b: Uint16x8x3, c: int32): Uint16x8x3 {.importc: "vld3q_lane_u16".}

func vld3q_lane_u32*(ptr: ptr uint32, b: Uint32x4x3, c: int32): Uint32x4x3 {.importc: "vld3q_lane_u32".}

func vld3q_lane_u64*(ptr: ptr uint64, b: Uint64x2x3, c: int32): Uint64x2x3 {.importc: "vld3q_lane_u64".}

func vld3q_lane_s8*(ptr: ptr int8, b: Int8x16x3, c: int32): Int8x16x3 {.importc: "vld3q_lane_s8".}

func vld3q_lane_s16*(ptr: ptr int16, b: Int16x8x3, c: int32): Int16x8x3 {.importc: "vld3q_lane_s16".}

func vld3q_lane_s32*(ptr: ptr int32, b: Int32x4x3, c: int32): Int32x4x3 {.importc: "vld3q_lane_s32".}

func vld3q_lane_s64*(ptr: ptr int64, b: Int64x2x3, c: int32): Int64x2x3 {.importc: "vld3q_lane_s64".}

func vld3q_lane_f16*(ptr: ptr float16, b: Float16x8x3, c: int32): Float16x8x3 {.importc: "vld3q_lane_f16".}

func vld3q_lane_f32*(ptr: ptr float32, b: Float32x4x3, c: int32): Float32x4x3 {.importc: "vld3q_lane_f32".}

func vld3q_lane_f64*(ptr: ptr float64, b: Float64x2x3, c: int32): Float64x2x3 {.importc: "vld3q_lane_f64".}

func vld3q_lane_p8*(ptr: ptr Poly8, b: Poly8x16x3, c: int32): Poly8x16x3 {.importc: "vld3q_lane_p8".}

func vld3q_lane_p16*(ptr: ptr Poly16, b: Poly16x8x3, c: int32): Poly16x8x3 {.importc: "vld3q_lane_p16".}

func vld3q_lane_p64*(ptr: ptr Poly64, b: Poly64x2x3, c: int32): Poly64x2x3 {.importc: "vld3q_lane_p64".}

func vld4_lane_u8*(ptr: ptr uint8, b: Uint8x8x4, c: int32): Uint8x8x4 {.importc: "vld4_lane_u8".}

func vld4_lane_u16*(ptr: ptr uint16, b: Uint16x4x4, c: int32): Uint16x4x4 {.importc: "vld4_lane_u16".}

func vld4_lane_u32*(ptr: ptr uint32, b: Uint32x2x4, c: int32): Uint32x2x4 {.importc: "vld4_lane_u32".}

func vld4_lane_u64*(ptr: ptr uint64, b: Uint64x1x4, c: int32): Uint64x1x4 {.importc: "vld4_lane_u64".}

func vld4_lane_s8*(ptr: ptr int8, b: Int8x8x4, c: int32): Int8x8x4 {.importc: "vld4_lane_s8".}

func vld4_lane_s16*(ptr: ptr int16, b: Int16x4x4, c: int32): Int16x4x4 {.importc: "vld4_lane_s16".}

func vld4_lane_s32*(ptr: ptr int32, b: Int32x2x4, c: int32): Int32x2x4 {.importc: "vld4_lane_s32".}

func vld4_lane_s64*(ptr: ptr int64, b: Int64x1x4, c: int32): Int64x1x4 {.importc: "vld4_lane_s64".}

func vld4_lane_f16*(ptr: ptr float16, b: Float16x4x4, c: int32): Float16x4x4 {.importc: "vld4_lane_f16".}

func vld4_lane_f32*(ptr: ptr float32, b: Float32x2x4, c: int32): Float32x2x4 {.importc: "vld4_lane_f32".}

func vld4_lane_f64*(ptr: ptr float64, b: Float64x1x4, c: int32): Float64x1x4 {.importc: "vld4_lane_f64".}

func vld4_lane_p8*(ptr: ptr Poly8, b: Poly8x8x4, c: int32): Poly8x8x4 {.importc: "vld4_lane_p8".}

func vld4_lane_p16*(ptr: ptr Poly16, b: Poly16x4x4, c: int32): Poly16x4x4 {.importc: "vld4_lane_p16".}

func vld4_lane_p64*(ptr: ptr Poly64, b: Poly64x1x4, c: int32): Poly64x1x4 {.importc: "vld4_lane_p64".}

func vld4q_lane_u8*(ptr: ptr uint8, b: Uint8x16x4, c: int32): Uint8x16x4 {.importc: "vld4q_lane_u8".}

func vld4q_lane_u16*(ptr: ptr uint16, b: Uint16x8x4, c: int32): Uint16x8x4 {.importc: "vld4q_lane_u16".}

func vld4q_lane_u32*(ptr: ptr uint32, b: Uint32x4x4, c: int32): Uint32x4x4 {.importc: "vld4q_lane_u32".}

func vld4q_lane_u64*(ptr: ptr uint64, b: Uint64x2x4, c: int32): Uint64x2x4 {.importc: "vld4q_lane_u64".}

func vld4q_lane_s8*(ptr: ptr int8, b: Int8x16x4, c: int32): Int8x16x4 {.importc: "vld4q_lane_s8".}

func vld4q_lane_s16*(ptr: ptr int16, b: Int16x8x4, c: int32): Int16x8x4 {.importc: "vld4q_lane_s16".}

func vld4q_lane_s32*(ptr: ptr int32, b: Int32x4x4, c: int32): Int32x4x4 {.importc: "vld4q_lane_s32".}

func vld4q_lane_s64*(ptr: ptr int64, b: Int64x2x4, c: int32): Int64x2x4 {.importc: "vld4q_lane_s64".}

func vld4q_lane_f16*(ptr: ptr float16, b: Float16x8x4, c: int32): Float16x8x4 {.importc: "vld4q_lane_f16".}

func vld4q_lane_f32*(ptr: ptr float32, b: Float32x4x4, c: int32): Float32x4x4 {.importc: "vld4q_lane_f32".}

func vld4q_lane_f64*(ptr: ptr float64, b: Float64x2x4, c: int32): Float64x2x4 {.importc: "vld4q_lane_f64".}

func vld4q_lane_p8*(ptr: ptr Poly8, b: Poly8x16x4, c: int32): Poly8x16x4 {.importc: "vld4q_lane_p8".}

func vld4q_lane_p16*(ptr: ptr Poly16, b: Poly16x8x4, c: int32): Poly16x8x4 {.importc: "vld4q_lane_p16".}

func vld4q_lane_p64*(ptr: ptr Poly64, b: Poly64x2x4, c: int32): Poly64x2x4 {.importc: "vld4q_lane_p64".}

func vmax_f32*(a: Float32x2, b: Float32x2): Float32x2 {.importc: "vmax_f32".}

func vmax_f64*(a: Float64x1, b: Float64x1): Float64x1 {.importc: "vmax_f64".}

func vmax_s8*(a: Int8x8, b: Int8x8): Int8x8 {.importc: "vmax_s8".}

func vmax_s16*(a: Int16x4, b: Int16x4): Int16x4 {.importc: "vmax_s16".}

func vmax_s32*(a: Int32x2, b: Int32x2): Int32x2 {.importc: "vmax_s32".}

func vmax_u8*(a: Uint8x8, b: Uint8x8): Uint8x8 {.importc: "vmax_u8".}

func vmax_u16*(a: Uint16x4, b: Uint16x4): Uint16x4 {.importc: "vmax_u16".}

func vmax_u32*(a: Uint32x2, b: Uint32x2): Uint32x2 {.importc: "vmax_u32".}

func vmaxq_f32*(a: Float32x4, b: Float32x4): Float32x4 {.importc: "vmaxq_f32".}

func vmaxq_f64*(a: Float64x2, b: Float64x2): Float64x2 {.importc: "vmaxq_f64".}

func vmaxq_s8*(a: Int8x16, b: Int8x16): Int8x16 {.importc: "vmaxq_s8".}

func vmaxq_s16*(a: Int16x8, b: Int16x8): Int16x8 {.importc: "vmaxq_s16".}

func vmaxq_s32*(a: Int32x4, b: Int32x4): Int32x4 {.importc: "vmaxq_s32".}

func vmaxq_u8*(a: Uint8x16, b: Uint8x16): Uint8x16 {.importc: "vmaxq_u8".}

func vmaxq_u16*(a: Uint16x8, b: Uint16x8): Uint16x8 {.importc: "vmaxq_u16".}

func vmaxq_u32*(a: Uint32x4, b: Uint32x4): Uint32x4 {.importc: "vmaxq_u32".}

func vmulx_f32*(a: Float32x2, b: Float32x2): Float32x2 {.importc: "vmulx_f32".}

func vmulxq_f32*(a: Float32x4, b: Float32x4): Float32x4 {.importc: "vmulxq_f32".}

func vmulx_f64*(a: Float64x1, b: Float64x1): Float64x1 {.importc: "vmulx_f64".}

func vmulxq_f64*(a: Float64x2, b: Float64x2): Float64x2 {.importc: "vmulxq_f64".}

func vmulxs_f32*(a: float32, b: float32): float32 {.importc: "vmulxs_f32".}

func vmulxd_f64*(a: float64, b: float64): float64 {.importc: "vmulxd_f64".}

func vmulx_lane_f32*(a: Float32x2, v: Float32x2, lane: int32): Float32x2 {.importc: "vmulx_lane_f32".}

func vmulx_lane_f64*(a: Float64x1, v: Float64x1, lane: int32): Float64x1 {.importc: "vmulx_lane_f64".}

func vmulxq_lane_f32*(a: Float32x4, v: Float32x2, lane: int32): Float32x4 {.importc: "vmulxq_lane_f32".}

func vmulxq_lane_f64*(a: Float64x2, v: Float64x1, lane: int32): Float64x2 {.importc: "vmulxq_lane_f64".}

func vmulx_laneq_f32*(a: Float32x2, v: Float32x4, lane: int32): Float32x2 {.importc: "vmulx_laneq_f32".}

func vmulx_laneq_f64*(a: Float64x1, v: Float64x2, lane: int32): Float64x1 {.importc: "vmulx_laneq_f64".}

func vmulxq_laneq_f32*(a: Float32x4, v: Float32x4, lane: int32): Float32x4 {.importc: "vmulxq_laneq_f32".}

func vmulxq_laneq_f64*(a: Float64x2, v: Float64x2, lane: int32): Float64x2 {.importc: "vmulxq_laneq_f64".}

func vmulxs_lane_f32*(a: float32, v: Float32x2, lane: int32): float32 {.importc: "vmulxs_lane_f32".}

func vmulxs_laneq_f32*(a: float32, v: Float32x4, lane: int32): float32 {.importc: "vmulxs_laneq_f32".}

func vmulxd_lane_f64*(a: float64, v: Float64x1, lane: int32): float64 {.importc: "vmulxd_lane_f64".}

func vmulxd_laneq_f64*(a: float64, v: Float64x2, lane: int32): float64 {.importc: "vmulxd_laneq_f64".}

func vpmax_s8*(a: Int8x8, b: Int8x8): Int8x8 {.importc: "vpmax_s8".}

func vpmax_s16*(a: Int16x4, b: Int16x4): Int16x4 {.importc: "vpmax_s16".}

func vpmax_s32*(a: Int32x2, b: Int32x2): Int32x2 {.importc: "vpmax_s32".}

func vpmax_u8*(a: Uint8x8, b: Uint8x8): Uint8x8 {.importc: "vpmax_u8".}

func vpmax_u16*(a: Uint16x4, b: Uint16x4): Uint16x4 {.importc: "vpmax_u16".}

func vpmax_u32*(a: Uint32x2, b: Uint32x2): Uint32x2 {.importc: "vpmax_u32".}

func vpmaxq_s8*(a: Int8x16, b: Int8x16): Int8x16 {.importc: "vpmaxq_s8".}

func vpmaxq_s16*(a: Int16x8, b: Int16x8): Int16x8 {.importc: "vpmaxq_s16".}

func vpmaxq_s32*(a: Int32x4, b: Int32x4): Int32x4 {.importc: "vpmaxq_s32".}

func vpmaxq_u8*(a: Uint8x16, b: Uint8x16): Uint8x16 {.importc: "vpmaxq_u8".}

func vpmaxq_u16*(a: Uint16x8, b: Uint16x8): Uint16x8 {.importc: "vpmaxq_u16".}

func vpmaxq_u32*(a: Uint32x4, b: Uint32x4): Uint32x4 {.importc: "vpmaxq_u32".}

func vpmax_f32*(a: Float32x2, b: Float32x2): Float32x2 {.importc: "vpmax_f32".}

func vpmaxq_f32*(a: Float32x4, b: Float32x4): Float32x4 {.importc: "vpmaxq_f32".}

func vpmaxq_f64*(a: Float64x2, b: Float64x2): Float64x2 {.importc: "vpmaxq_f64".}

func vpmaxqd_f64*(a: Float64x2): float64 {.importc: "vpmaxqd_f64".}

func vpmaxs_f32*(a: Float32x2): float32 {.importc: "vpmaxs_f32".}

func vpmaxnm_f32*(a: Float32x2, b: Float32x2): Float32x2 {.importc: "vpmaxnm_f32".}

func vpmaxnmq_f32*(a: Float32x4, b: Float32x4): Float32x4 {.importc: "vpmaxnmq_f32".}

func vpmaxnmq_f64*(a: Float64x2, b: Float64x2): Float64x2 {.importc: "vpmaxnmq_f64".}

func vpmaxnmqd_f64*(a: Float64x2): float64 {.importc: "vpmaxnmqd_f64".}

func vpmaxnms_f32*(a: Float32x2): float32 {.importc: "vpmaxnms_f32".}

func vpmin_s8*(a: Int8x8, b: Int8x8): Int8x8 {.importc: "vpmin_s8".}

func vpmin_s16*(a: Int16x4, b: Int16x4): Int16x4 {.importc: "vpmin_s16".}

func vpmin_s32*(a: Int32x2, b: Int32x2): Int32x2 {.importc: "vpmin_s32".}

func vpmin_u8*(a: Uint8x8, b: Uint8x8): Uint8x8 {.importc: "vpmin_u8".}

func vpmin_u16*(a: Uint16x4, b: Uint16x4): Uint16x4 {.importc: "vpmin_u16".}

func vpmin_u32*(a: Uint32x2, b: Uint32x2): Uint32x2 {.importc: "vpmin_u32".}

func vpminq_s8*(a: Int8x16, b: Int8x16): Int8x16 {.importc: "vpminq_s8".}

func vpminq_s16*(a: Int16x8, b: Int16x8): Int16x8 {.importc: "vpminq_s16".}

func vpminq_s32*(a: Int32x4, b: Int32x4): Int32x4 {.importc: "vpminq_s32".}

func vpminq_u8*(a: Uint8x16, b: Uint8x16): Uint8x16 {.importc: "vpminq_u8".}

func vpminq_u16*(a: Uint16x8, b: Uint16x8): Uint16x8 {.importc: "vpminq_u16".}

func vpminq_u32*(a: Uint32x4, b: Uint32x4): Uint32x4 {.importc: "vpminq_u32".}

func vpmin_f32*(a: Float32x2, b: Float32x2): Float32x2 {.importc: "vpmin_f32".}

func vpminq_f32*(a: Float32x4, b: Float32x4): Float32x4 {.importc: "vpminq_f32".}

func vpminq_f64*(a: Float64x2, b: Float64x2): Float64x2 {.importc: "vpminq_f64".}

func vpminqd_f64*(a: Float64x2): float64 {.importc: "vpminqd_f64".}

func vpmins_f32*(a: Float32x2): float32 {.importc: "vpmins_f32".}

func vpminnm_f32*(a: Float32x2, b: Float32x2): Float32x2 {.importc: "vpminnm_f32".}

func vpminnmq_f32*(a: Float32x4, b: Float32x4): Float32x4 {.importc: "vpminnmq_f32".}

func vpminnmq_f64*(a: Float64x2, b: Float64x2): Float64x2 {.importc: "vpminnmq_f64".}

func vpminnmqd_f64*(a: Float64x2): float64 {.importc: "vpminnmqd_f64".}

func vpminnms_f32*(a: Float32x2): float32 {.importc: "vpminnms_f32".}

func vmaxnm_f32*(a: Float32x2, b: Float32x2): Float32x2 {.importc: "vmaxnm_f32".}

func vmaxnm_f64*(a: Float64x1, b: Float64x1): Float64x1 {.importc: "vmaxnm_f64".}

func vmaxnmq_f32*(a: Float32x4, b: Float32x4): Float32x4 {.importc: "vmaxnmq_f32".}

func vmaxnmq_f64*(a: Float64x2, b: Float64x2): Float64x2 {.importc: "vmaxnmq_f64".}

func vmaxv_f32*(a: Float32x2): float32 {.importc: "vmaxv_f32".}

func vmaxv_s8*(a: Int8x8): int8 {.importc: "vmaxv_s8".}

func vmaxv_s16*(a: Int16x4): int16 {.importc: "vmaxv_s16".}

func vmaxv_s32*(a: Int32x2): int32 {.importc: "vmaxv_s32".}

func vmaxv_u8*(a: Uint8x8): uint8 {.importc: "vmaxv_u8".}

func vmaxv_u16*(a: Uint16x4): uint16 {.importc: "vmaxv_u16".}

func vmaxv_u32*(a: Uint32x2): uint32 {.importc: "vmaxv_u32".}

func vmaxvq_f32*(a: Float32x4): float32 {.importc: "vmaxvq_f32".}

func vmaxvq_f64*(a: Float64x2): float64 {.importc: "vmaxvq_f64".}

func vmaxvq_s8*(a: Int8x16): int8 {.importc: "vmaxvq_s8".}

func vmaxvq_s16*(a: Int16x8): int16 {.importc: "vmaxvq_s16".}

func vmaxvq_s32*(a: Int32x4): int32 {.importc: "vmaxvq_s32".}

func vmaxvq_u8*(a: Uint8x16): uint8 {.importc: "vmaxvq_u8".}

func vmaxvq_u16*(a: Uint16x8): uint16 {.importc: "vmaxvq_u16".}

func vmaxvq_u32*(a: Uint32x4): uint32 {.importc: "vmaxvq_u32".}

func vmaxnmv_f32*(a: Float32x2): float32 {.importc: "vmaxnmv_f32".}

func vmaxnmvq_f32*(a: Float32x4): float32 {.importc: "vmaxnmvq_f32".}

func vmaxnmvq_f64*(a: Float64x2): float64 {.importc: "vmaxnmvq_f64".}

func vmin_f32*(a: Float32x2, b: Float32x2): Float32x2 {.importc: "vmin_f32".}

func vmin_f64*(a: Float64x1, b: Float64x1): Float64x1 {.importc: "vmin_f64".}

func vmin_s8*(a: Int8x8, b: Int8x8): Int8x8 {.importc: "vmin_s8".}

func vmin_s16*(a: Int16x4, b: Int16x4): Int16x4 {.importc: "vmin_s16".}

func vmin_s32*(a: Int32x2, b: Int32x2): Int32x2 {.importc: "vmin_s32".}

func vmin_u8*(a: Uint8x8, b: Uint8x8): Uint8x8 {.importc: "vmin_u8".}

func vmin_u16*(a: Uint16x4, b: Uint16x4): Uint16x4 {.importc: "vmin_u16".}

func vmin_u32*(a: Uint32x2, b: Uint32x2): Uint32x2 {.importc: "vmin_u32".}

func vminq_f32*(a: Float32x4, b: Float32x4): Float32x4 {.importc: "vminq_f32".}

func vminq_f64*(a: Float64x2, b: Float64x2): Float64x2 {.importc: "vminq_f64".}

func vminq_s8*(a: Int8x16, b: Int8x16): Int8x16 {.importc: "vminq_s8".}

func vminq_s16*(a: Int16x8, b: Int16x8): Int16x8 {.importc: "vminq_s16".}

func vminq_s32*(a: Int32x4, b: Int32x4): Int32x4 {.importc: "vminq_s32".}

func vminq_u8*(a: Uint8x16, b: Uint8x16): Uint8x16 {.importc: "vminq_u8".}

func vminq_u16*(a: Uint16x8, b: Uint16x8): Uint16x8 {.importc: "vminq_u16".}

func vminq_u32*(a: Uint32x4, b: Uint32x4): Uint32x4 {.importc: "vminq_u32".}

func vminnm_f32*(a: Float32x2, b: Float32x2): Float32x2 {.importc: "vminnm_f32".}

func vminnm_f64*(a: Float64x1, b: Float64x1): Float64x1 {.importc: "vminnm_f64".}

func vminnmq_f32*(a: Float32x4, b: Float32x4): Float32x4 {.importc: "vminnmq_f32".}

func vminnmq_f64*(a: Float64x2, b: Float64x2): Float64x2 {.importc: "vminnmq_f64".}

func vminv_f32*(a: Float32x2): float32 {.importc: "vminv_f32".}

func vminv_s8*(a: Int8x8): int8 {.importc: "vminv_s8".}

func vminv_s16*(a: Int16x4): int16 {.importc: "vminv_s16".}

func vminv_s32*(a: Int32x2): int32 {.importc: "vminv_s32".}

func vminv_u8*(a: Uint8x8): uint8 {.importc: "vminv_u8".}

func vminv_u16*(a: Uint16x4): uint16 {.importc: "vminv_u16".}

func vminv_u32*(a: Uint32x2): uint32 {.importc: "vminv_u32".}

func vminvq_f32*(a: Float32x4): float32 {.importc: "vminvq_f32".}

func vminvq_f64*(a: Float64x2): float64 {.importc: "vminvq_f64".}

func vminvq_s8*(a: Int8x16): int8 {.importc: "vminvq_s8".}

func vminvq_s16*(a: Int16x8): int16 {.importc: "vminvq_s16".}

func vminvq_s32*(a: Int32x4): int32 {.importc: "vminvq_s32".}

func vminvq_u8*(a: Uint8x16): uint8 {.importc: "vminvq_u8".}

func vminvq_u16*(a: Uint16x8): uint16 {.importc: "vminvq_u16".}

func vminvq_u32*(a: Uint32x4): uint32 {.importc: "vminvq_u32".}

func vminnmv_f32*(a: Float32x2): float32 {.importc: "vminnmv_f32".}

func vminnmvq_f32*(a: Float32x4): float32 {.importc: "vminnmvq_f32".}

func vminnmvq_f64*(a: Float64x2): float64 {.importc: "vminnmvq_f64".}

func vmla_f32*(a: Float32x2, b: Float32x2, c: Float32x2): Float32x2 {.importc: "vmla_f32".}

func vmla_f64*(a: Float64x1, b: Float64x1, c: Float64x1): Float64x1 {.importc: "vmla_f64".}

func vmlaq_f32*(a: Float32x4, b: Float32x4, c: Float32x4): Float32x4 {.importc: "vmlaq_f32".}

func vmlaq_f64*(a: Float64x2, b: Float64x2, c: Float64x2): Float64x2 {.importc: "vmlaq_f64".}

func vmla_lane_f32*(a: Float32x2, b: Float32x2, c: Float32x2, lane: int32): Float32x2 {.importc: "vmla_lane_f32".}

func vmla_lane_s16*(a: Int16x4, b: Int16x4, c: Int16x4, lane: int32): Int16x4 {.importc: "vmla_lane_s16".}

func vmla_lane_s32*(a: Int32x2, b: Int32x2, c: Int32x2, lane: int32): Int32x2 {.importc: "vmla_lane_s32".}

func vmla_lane_u16*(a: Uint16x4, b: Uint16x4, c: Uint16x4, lane: int32): Uint16x4 {.importc: "vmla_lane_u16".}

func vmla_lane_u32*(a: Uint32x2, b: Uint32x2, c: Uint32x2, lane: int32): Uint32x2 {.importc: "vmla_lane_u32".}

func vmla_laneq_f32*(a: Float32x2, b: Float32x2, c: Float32x4, lane: int32): Float32x2 {.importc: "vmla_laneq_f32".}

func vmla_laneq_s16*(a: Int16x4, b: Int16x4, c: Int16x8, lane: int32): Int16x4 {.importc: "vmla_laneq_s16".}

func vmla_laneq_s32*(a: Int32x2, b: Int32x2, c: Int32x4, lane: int32): Int32x2 {.importc: "vmla_laneq_s32".}

func vmla_laneq_u16*(a: Uint16x4, b: Uint16x4, c: Uint16x8, lane: int32): Uint16x4 {.importc: "vmla_laneq_u16".}

func vmla_laneq_u32*(a: Uint32x2, b: Uint32x2, c: Uint32x4, lane: int32): Uint32x2 {.importc: "vmla_laneq_u32".}

func vmlaq_lane_f32*(a: Float32x4, b: Float32x4, c: Float32x2, lane: int32): Float32x4 {.importc: "vmlaq_lane_f32".}

func vmlaq_lane_s16*(a: Int16x8, b: Int16x8, c: Int16x4, lane: int32): Int16x8 {.importc: "vmlaq_lane_s16".}

func vmlaq_lane_s32*(a: Int32x4, b: Int32x4, c: Int32x2, lane: int32): Int32x4 {.importc: "vmlaq_lane_s32".}

func vmlaq_lane_u16*(a: Uint16x8, b: Uint16x8, c: Uint16x4, lane: int32): Uint16x8 {.importc: "vmlaq_lane_u16".}

func vmlaq_lane_u32*(a: Uint32x4, b: Uint32x4, c: Uint32x2, lane: int32): Uint32x4 {.importc: "vmlaq_lane_u32".}

func vmlaq_laneq_f32*(a: Float32x4, b: Float32x4, c: Float32x4, lane: int32): Float32x4 {.importc: "vmlaq_laneq_f32".}

func vmlaq_laneq_s16*(a: Int16x8, b: Int16x8, c: Int16x8, lane: int32): Int16x8 {.importc: "vmlaq_laneq_s16".}

func vmlaq_laneq_s32*(a: Int32x4, b: Int32x4, c: Int32x4, lane: int32): Int32x4 {.importc: "vmlaq_laneq_s32".}

func vmlaq_laneq_u16*(a: Uint16x8, b: Uint16x8, c: Uint16x8, lane: int32): Uint16x8 {.importc: "vmlaq_laneq_u16".}

func vmlaq_laneq_u32*(a: Uint32x4, b: Uint32x4, c: Uint32x4, lane: int32): Uint32x4 {.importc: "vmlaq_laneq_u32".}

func vmls_f32*(a: Float32x2, b: Float32x2, c: Float32x2): Float32x2 {.importc: "vmls_f32".}

func vmls_f64*(a: Float64x1, b: Float64x1, c: Float64x1): Float64x1 {.importc: "vmls_f64".}

func vmlsq_f32*(a: Float32x4, b: Float32x4, c: Float32x4): Float32x4 {.importc: "vmlsq_f32".}

func vmlsq_f64*(a: Float64x2, b: Float64x2, c: Float64x2): Float64x2 {.importc: "vmlsq_f64".}

func vmls_lane_f32*(a: Float32x2, b: Float32x2, c: Float32x2, lane: int32): Float32x2 {.importc: "vmls_lane_f32".}

func vmls_lane_s16*(a: Int16x4, b: Int16x4, c: Int16x4, lane: int32): Int16x4 {.importc: "vmls_lane_s16".}

func vmls_lane_s32*(a: Int32x2, b: Int32x2, c: Int32x2, lane: int32): Int32x2 {.importc: "vmls_lane_s32".}

func vmls_lane_u16*(a: Uint16x4, b: Uint16x4, c: Uint16x4, lane: int32): Uint16x4 {.importc: "vmls_lane_u16".}

func vmls_lane_u32*(a: Uint32x2, b: Uint32x2, c: Uint32x2, lane: int32): Uint32x2 {.importc: "vmls_lane_u32".}

func vmls_laneq_f32*(a: Float32x2, b: Float32x2, c: Float32x4, lane: int32): Float32x2 {.importc: "vmls_laneq_f32".}

func vmls_laneq_s16*(a: Int16x4, b: Int16x4, c: Int16x8, lane: int32): Int16x4 {.importc: "vmls_laneq_s16".}

func vmls_laneq_s32*(a: Int32x2, b: Int32x2, c: Int32x4, lane: int32): Int32x2 {.importc: "vmls_laneq_s32".}

func vmls_laneq_u16*(a: Uint16x4, b: Uint16x4, c: Uint16x8, lane: int32): Uint16x4 {.importc: "vmls_laneq_u16".}

func vmls_laneq_u32*(a: Uint32x2, b: Uint32x2, c: Uint32x4, lane: int32): Uint32x2 {.importc: "vmls_laneq_u32".}

func vmlsq_lane_f32*(a: Float32x4, b: Float32x4, c: Float32x2, lane: int32): Float32x4 {.importc: "vmlsq_lane_f32".}

func vmlsq_lane_s16*(a: Int16x8, b: Int16x8, c: Int16x4, lane: int32): Int16x8 {.importc: "vmlsq_lane_s16".}

func vmlsq_lane_s32*(a: Int32x4, b: Int32x4, c: Int32x2, lane: int32): Int32x4 {.importc: "vmlsq_lane_s32".}

func vmlsq_lane_u16*(a: Uint16x8, b: Uint16x8, c: Uint16x4, lane: int32): Uint16x8 {.importc: "vmlsq_lane_u16".}

func vmlsq_lane_u32*(a: Uint32x4, b: Uint32x4, c: Uint32x2, lane: int32): Uint32x4 {.importc: "vmlsq_lane_u32".}

func vmlsq_laneq_f32*(a: Float32x4, b: Float32x4, c: Float32x4, lane: int32): Float32x4 {.importc: "vmlsq_laneq_f32".}

func vmlsq_laneq_s16*(a: Int16x8, b: Int16x8, c: Int16x8, lane: int32): Int16x8 {.importc: "vmlsq_laneq_s16".}

func vmlsq_laneq_s32*(a: Int32x4, b: Int32x4, c: Int32x4, lane: int32): Int32x4 {.importc: "vmlsq_laneq_s32".}

func vmlsq_laneq_u16*(a: Uint16x8, b: Uint16x8, c: Uint16x8, lane: int32): Uint16x8 {.importc: "vmlsq_laneq_u16".}

func vmlsq_laneq_u32*(a: Uint32x4, b: Uint32x4, c: Uint32x4, lane: int32): Uint32x4 {.importc: "vmlsq_laneq_u32".}

func vmov_n_f16*(a: float16): Float16x4 {.importc: "vmov_n_f16".}

func vmov_n_f32*(a: float32): Float32x2 {.importc: "vmov_n_f32".}

func vmov_n_f64*(a: float64): Float64x1 {.importc: "vmov_n_f64".}

func vmov_n_p8*(a: Poly8): Poly8x8 {.importc: "vmov_n_p8".}

func vmov_n_p16*(a: Poly16): Poly16x4 {.importc: "vmov_n_p16".}

func vmov_n_p64*(a: Poly64): Poly64x1 {.importc: "vmov_n_p64".}

func vmov_n_s8*(a: int8): Int8x8 {.importc: "vmov_n_s8".}

func vmov_n_s16*(a: int16): Int16x4 {.importc: "vmov_n_s16".}

func vmov_n_s32*(a: int32): Int32x2 {.importc: "vmov_n_s32".}

func vmov_n_s64*(a: int64): Int64x1 {.importc: "vmov_n_s64".}

func vmov_n_u8*(a: uint8): Uint8x8 {.importc: "vmov_n_u8".}

func vmov_n_u16*(a: uint16): Uint16x4 {.importc: "vmov_n_u16".}

func vmov_n_u32*(a: uint32): Uint32x2 {.importc: "vmov_n_u32".}

func vmov_n_u64*(a: uint64): Uint64x1 {.importc: "vmov_n_u64".}

func vmovq_n_f16*(a: float16): Float16x8 {.importc: "vmovq_n_f16".}

func vmovq_n_f32*(a: float32): Float32x4 {.importc: "vmovq_n_f32".}

func vmovq_n_f64*(a: float64): Float64x2 {.importc: "vmovq_n_f64".}

func vmovq_n_p8*(a: Poly8): Poly8x16 {.importc: "vmovq_n_p8".}

func vmovq_n_p16*(a: Poly16): Poly16x8 {.importc: "vmovq_n_p16".}

func vmovq_n_p64*(a: Poly64): Poly64x2 {.importc: "vmovq_n_p64".}

func vmovq_n_s8*(a: int8): Int8x16 {.importc: "vmovq_n_s8".}

func vmovq_n_s16*(a: int16): Int16x8 {.importc: "vmovq_n_s16".}

func vmovq_n_s32*(a: int32): Int32x4 {.importc: "vmovq_n_s32".}

func vmovq_n_s64*(a: int64): Int64x2 {.importc: "vmovq_n_s64".}

func vmovq_n_u8*(a: uint8): Uint8x16 {.importc: "vmovq_n_u8".}

func vmovq_n_u16*(a: uint16): Uint16x8 {.importc: "vmovq_n_u16".}

func vmovq_n_u32*(a: uint32): Uint32x4 {.importc: "vmovq_n_u32".}

func vmovq_n_u64*(a: uint64): Uint64x2 {.importc: "vmovq_n_u64".}

func vmul_lane_f32*(a: Float32x2, b: Float32x2, lane: int32): Float32x2 {.importc: "vmul_lane_f32".}

func vmul_lane_f64*(a: Float64x1, b: Float64x1, lane: int32): Float64x1 {.importc: "vmul_lane_f64".}

func vmul_lane_s16*(a: Int16x4, b: Int16x4, lane: int32): Int16x4 {.importc: "vmul_lane_s16".}

func vmul_lane_s32*(a: Int32x2, b: Int32x2, lane: int32): Int32x2 {.importc: "vmul_lane_s32".}

func vmul_lane_u16*(a: Uint16x4, b: Uint16x4, lane: int32): Uint16x4 {.importc: "vmul_lane_u16".}

func vmul_lane_u32*(a: Uint32x2, b: Uint32x2, lane: int32): Uint32x2 {.importc: "vmul_lane_u32".}

func vmuld_lane_f64*(a: float64, b: Float64x1, lane: int32): float64 {.importc: "vmuld_lane_f64".}

func vmuld_laneq_f64*(a: float64, b: Float64x2, lane: int32): float64 {.importc: "vmuld_laneq_f64".}

func vmuls_lane_f32*(a: float32, b: Float32x2, lane: int32): float32 {.importc: "vmuls_lane_f32".}

func vmuls_laneq_f32*(a: float32, b: Float32x4, lane: int32): float32 {.importc: "vmuls_laneq_f32".}

func vmul_laneq_f32*(a: Float32x2, b: Float32x4, lane: int32): Float32x2 {.importc: "vmul_laneq_f32".}

func vmul_laneq_f64*(a: Float64x1, b: Float64x2, lane: int32): Float64x1 {.importc: "vmul_laneq_f64".}

func vmul_laneq_s16*(a: Int16x4, b: Int16x8, lane: int32): Int16x4 {.importc: "vmul_laneq_s16".}

func vmul_laneq_s32*(a: Int32x2, b: Int32x4, lane: int32): Int32x2 {.importc: "vmul_laneq_s32".}

func vmul_laneq_u16*(a: Uint16x4, b: Uint16x8, lane: int32): Uint16x4 {.importc: "vmul_laneq_u16".}

func vmul_laneq_u32*(a: Uint32x2, b: Uint32x4, lane: int32): Uint32x2 {.importc: "vmul_laneq_u32".}

func vmul_n_f64*(a: Float64x1, b: float64): Float64x1 {.importc: "vmul_n_f64".}

func vmulq_lane_f32*(a: Float32x4, b: Float32x2, lane: int32): Float32x4 {.importc: "vmulq_lane_f32".}

func vmulq_lane_f64*(a: Float64x2, b: Float64x1, lane: int32): Float64x2 {.importc: "vmulq_lane_f64".}

func vmulq_lane_s16*(a: Int16x8, b: Int16x4, lane: int32): Int16x8 {.importc: "vmulq_lane_s16".}

func vmulq_lane_s32*(a: Int32x4, b: Int32x2, lane: int32): Int32x4 {.importc: "vmulq_lane_s32".}

func vmulq_lane_u16*(a: Uint16x8, b: Uint16x4, lane: int32): Uint16x8 {.importc: "vmulq_lane_u16".}

func vmulq_lane_u32*(a: Uint32x4, b: Uint32x2, lane: int32): Uint32x4 {.importc: "vmulq_lane_u32".}

func vmulq_laneq_f32*(a: Float32x4, b: Float32x4, lane: int32): Float32x4 {.importc: "vmulq_laneq_f32".}

func vmulq_laneq_f64*(a: Float64x2, b: Float64x2, lane: int32): Float64x2 {.importc: "vmulq_laneq_f64".}

func vmulq_laneq_s16*(a: Int16x8, b: Int16x8, lane: int32): Int16x8 {.importc: "vmulq_laneq_s16".}

func vmulq_laneq_s32*(a: Int32x4, b: Int32x4, lane: int32): Int32x4 {.importc: "vmulq_laneq_s32".}

func vmulq_laneq_u16*(a: Uint16x8, b: Uint16x8, lane: int32): Uint16x8 {.importc: "vmulq_laneq_u16".}

func vmulq_laneq_u32*(a: Uint32x4, b: Uint32x4, lane: int32): Uint32x4 {.importc: "vmulq_laneq_u32".}

func vmul_n_f32*(a: Float32x2, b: float32): Float32x2 {.importc: "vmul_n_f32".}

func vmulq_n_f32*(a: Float32x4, b: float32): Float32x4 {.importc: "vmulq_n_f32".}

func vmulq_n_f64*(a: Float64x2, b: float64): Float64x2 {.importc: "vmulq_n_f64".}

func vmul_n_s16*(a: Int16x4, b: int16): Int16x4 {.importc: "vmul_n_s16".}

func vmulq_n_s16*(a: Int16x8, b: int16): Int16x8 {.importc: "vmulq_n_s16".}

func vmul_n_s32*(a: Int32x2, b: int32): Int32x2 {.importc: "vmul_n_s32".}

func vmulq_n_s32*(a: Int32x4, b: int32): Int32x4 {.importc: "vmulq_n_s32".}

func vmul_n_u16*(a: Uint16x4, b: uint16): Uint16x4 {.importc: "vmul_n_u16".}

func vmulq_n_u16*(a: Uint16x8, b: uint16): Uint16x8 {.importc: "vmulq_n_u16".}

func vmul_n_u32*(a: Uint32x2, b: uint32): Uint32x2 {.importc: "vmul_n_u32".}

func vmulq_n_u32*(a: Uint32x4, b: uint32): Uint32x4 {.importc: "vmulq_n_u32".}

func vmvn_p8*(a: Poly8x8): Poly8x8 {.importc: "vmvn_p8".}

func vmvn_s8*(a: Int8x8): Int8x8 {.importc: "vmvn_s8".}

func vmvn_s16*(a: Int16x4): Int16x4 {.importc: "vmvn_s16".}

func vmvn_s32*(a: Int32x2): Int32x2 {.importc: "vmvn_s32".}

func vmvn_u8*(a: Uint8x8): Uint8x8 {.importc: "vmvn_u8".}

func vmvn_u16*(a: Uint16x4): Uint16x4 {.importc: "vmvn_u16".}

func vmvn_u32*(a: Uint32x2): Uint32x2 {.importc: "vmvn_u32".}

func vmvnq_p8*(a: Poly8x16): Poly8x16 {.importc: "vmvnq_p8".}

func vmvnq_s8*(a: Int8x16): Int8x16 {.importc: "vmvnq_s8".}

func vmvnq_s16*(a: Int16x8): Int16x8 {.importc: "vmvnq_s16".}

func vmvnq_s32*(a: Int32x4): Int32x4 {.importc: "vmvnq_s32".}

func vmvnq_u8*(a: Uint8x16): Uint8x16 {.importc: "vmvnq_u8".}

func vmvnq_u16*(a: Uint16x8): Uint16x8 {.importc: "vmvnq_u16".}

func vmvnq_u32*(a: Uint32x4): Uint32x4 {.importc: "vmvnq_u32".}

func vneg_f32*(a: Float32x2): Float32x2 {.importc: "vneg_f32".}

func vneg_f64*(a: Float64x1): Float64x1 {.importc: "vneg_f64".}

func vneg_s8*(a: Int8x8): Int8x8 {.importc: "vneg_s8".}

func vneg_s16*(a: Int16x4): Int16x4 {.importc: "vneg_s16".}

func vneg_s32*(a: Int32x2): Int32x2 {.importc: "vneg_s32".}

func vneg_s64*(a: Int64x1): Int64x1 {.importc: "vneg_s64".}

func vnegd_s64*(a: int64): int64 {.importc: "vnegd_s64".}

func vnegq_f32*(a: Float32x4): Float32x4 {.importc: "vnegq_f32".}

func vnegq_f64*(a: Float64x2): Float64x2 {.importc: "vnegq_f64".}

func vnegq_s8*(a: Int8x16): Int8x16 {.importc: "vnegq_s8".}

func vnegq_s16*(a: Int16x8): Int16x8 {.importc: "vnegq_s16".}

func vnegq_s32*(a: Int32x4): Int32x4 {.importc: "vnegq_s32".}

func vnegq_s64*(a: Int64x2): Int64x2 {.importc: "vnegq_s64".}

func vpadd_f32*(a: Float32x2, b: Float32x2): Float32x2 {.importc: "vpadd_f32".}

func vpaddq_f32*(a: Float32x4, b: Float32x4): Float32x4 {.importc: "vpaddq_f32".}

func vpaddq_f64*(a: Float64x2, b: Float64x2): Float64x2 {.importc: "vpaddq_f64".}

func vpadd_s8*(a: Int8x8, b: Int8x8): Int8x8 {.importc: "vpadd_s8".}

func vpadd_s16*(a: Int16x4, b: Int16x4): Int16x4 {.importc: "vpadd_s16".}

func vpadd_s32*(a: Int32x2, b: Int32x2): Int32x2 {.importc: "vpadd_s32".}

func vpadd_u8*(a: Uint8x8, b: Uint8x8): Uint8x8 {.importc: "vpadd_u8".}

func vpadd_u16*(a: Uint16x4, b: Uint16x4): Uint16x4 {.importc: "vpadd_u16".}

func vpadd_u32*(a: Uint32x2, b: Uint32x2): Uint32x2 {.importc: "vpadd_u32".}

func vpadds_f32*(a: Float32x2): float32 {.importc: "vpadds_f32".}

func vpaddd_f64*(a: Float64x2): float64 {.importc: "vpaddd_f64".}

func vpaddd_s64*(a: Int64x2): int64 {.importc: "vpaddd_s64".}

func vpaddd_u64*(a: Uint64x2): uint64 {.importc: "vpaddd_u64".}

func vqabsq_s64*(a: Int64x2): Int64x2 {.importc: "vqabsq_s64".}

func vqabsb_s8*(a: int8): int8 {.importc: "vqabsb_s8".}

func vqabsh_s16*(a: int16): int16 {.importc: "vqabsh_s16".}

func vqabss_s32*(a: int32): int32 {.importc: "vqabss_s32".}

func vqabsd_s64*(a: int64): int64 {.importc: "vqabsd_s64".}

func vqaddb_s8*(a: int8, b: int8): int8 {.importc: "vqaddb_s8".}

func vqaddh_s16*(a: int16, b: int16): int16 {.importc: "vqaddh_s16".}

func vqadds_s32*(a: int32, b: int32): int32 {.importc: "vqadds_s32".}

func vqaddd_s64*(a: int64, b: int64): int64 {.importc: "vqaddd_s64".}

func vqaddb_u8*(a: uint8, b: uint8): uint8 {.importc: "vqaddb_u8".}

func vqaddh_u16*(a: uint16, b: uint16): uint16 {.importc: "vqaddh_u16".}

func vqadds_u32*(a: uint32, b: uint32): uint32 {.importc: "vqadds_u32".}

func vqaddd_u64*(a: uint64, b: uint64): uint64 {.importc: "vqaddd_u64".}

func vqdmlal_s16*(a: Int32x4, b: Int16x4, c: Int16x4): Int32x4 {.importc: "vqdmlal_s16".}

func vqdmlal_high_s16*(a: Int32x4, b: Int16x8, c: Int16x8): Int32x4 {.importc: "vqdmlal_high_s16".}

func vqdmlal_high_lane_s16*(a: Int32x4, b: Int16x8, c: Int16x4, d: int32): Int32x4 {.importc: "vqdmlal_high_lane_s16".}

func vqdmlal_high_laneq_s16*(a: Int32x4, b: Int16x8, c: Int16x8, d: int32): Int32x4 {.importc: "vqdmlal_high_laneq_s16".}

func vqdmlal_high_n_s16*(a: Int32x4, b: Int16x8, c: int16): Int32x4 {.importc: "vqdmlal_high_n_s16".}

func vqdmlal_lane_s16*(a: Int32x4, b: Int16x4, c: Int16x4, d: int32): Int32x4 {.importc: "vqdmlal_lane_s16".}

func vqdmlal_laneq_s16*(a: Int32x4, b: Int16x4, c: Int16x8, d: int32): Int32x4 {.importc: "vqdmlal_laneq_s16".}

func vqdmlal_n_s16*(a: Int32x4, b: Int16x4, c: int16): Int32x4 {.importc: "vqdmlal_n_s16".}

func vqdmlal_s32*(a: Int64x2, b: Int32x2, c: Int32x2): Int64x2 {.importc: "vqdmlal_s32".}

func vqdmlal_high_s32*(a: Int64x2, b: Int32x4, c: Int32x4): Int64x2 {.importc: "vqdmlal_high_s32".}

func vqdmlal_high_lane_s32*(a: Int64x2, b: Int32x4, c: Int32x2, d: int32): Int64x2 {.importc: "vqdmlal_high_lane_s32".}

func vqdmlal_high_laneq_s32*(a: Int64x2, b: Int32x4, c: Int32x4, d: int32): Int64x2 {.importc: "vqdmlal_high_laneq_s32".}

func vqdmlal_high_n_s32*(a: Int64x2, b: Int32x4, c: int32): Int64x2 {.importc: "vqdmlal_high_n_s32".}

func vqdmlal_lane_s32*(a: Int64x2, b: Int32x2, c: Int32x2, d: int32): Int64x2 {.importc: "vqdmlal_lane_s32".}

func vqdmlal_laneq_s32*(a: Int64x2, b: Int32x2, c: Int32x4, d: int32): Int64x2 {.importc: "vqdmlal_laneq_s32".}

func vqdmlal_n_s32*(a: Int64x2, b: Int32x2, c: int32): Int64x2 {.importc: "vqdmlal_n_s32".}

func vqdmlalh_s16*(a: int32, b: int16, c: int16): int32 {.importc: "vqdmlalh_s16".}

func vqdmlalh_lane_s16*(a: int32, b: int16, c: Int16x4, d: int32): int32 {.importc: "vqdmlalh_lane_s16".}

func vqdmlalh_laneq_s16*(a: int32, b: int16, c: Int16x8, d: int32): int32 {.importc: "vqdmlalh_laneq_s16".}

func vqdmlals_s32*(a: int64, b: int32, c: int32): int64 {.importc: "vqdmlals_s32".}

func vqdmlals_lane_s32*(a: int64, b: int32, c: Int32x2, d: int32): int64 {.importc: "vqdmlals_lane_s32".}

func vqdmlals_laneq_s32*(a: int64, b: int32, c: Int32x4, d: int32): int64 {.importc: "vqdmlals_laneq_s32".}

func vqdmlsl_s16*(a: Int32x4, b: Int16x4, c: Int16x4): Int32x4 {.importc: "vqdmlsl_s16".}

func vqdmlsl_high_s16*(a: Int32x4, b: Int16x8, c: Int16x8): Int32x4 {.importc: "vqdmlsl_high_s16".}

func vqdmlsl_high_lane_s16*(a: Int32x4, b: Int16x8, c: Int16x4, d: int32): Int32x4 {.importc: "vqdmlsl_high_lane_s16".}

func vqdmlsl_high_laneq_s16*(a: Int32x4, b: Int16x8, c: Int16x8, d: int32): Int32x4 {.importc: "vqdmlsl_high_laneq_s16".}

func vqdmlsl_high_n_s16*(a: Int32x4, b: Int16x8, c: int16): Int32x4 {.importc: "vqdmlsl_high_n_s16".}

func vqdmlsl_lane_s16*(a: Int32x4, b: Int16x4, c: Int16x4, d: int32): Int32x4 {.importc: "vqdmlsl_lane_s16".}

func vqdmlsl_laneq_s16*(a: Int32x4, b: Int16x4, c: Int16x8, d: int32): Int32x4 {.importc: "vqdmlsl_laneq_s16".}

func vqdmlsl_n_s16*(a: Int32x4, b: Int16x4, c: int16): Int32x4 {.importc: "vqdmlsl_n_s16".}

func vqdmlsl_s32*(a: Int64x2, b: Int32x2, c: Int32x2): Int64x2 {.importc: "vqdmlsl_s32".}

func vqdmlsl_high_s32*(a: Int64x2, b: Int32x4, c: Int32x4): Int64x2 {.importc: "vqdmlsl_high_s32".}

func vqdmlsl_high_lane_s32*(a: Int64x2, b: Int32x4, c: Int32x2, d: int32): Int64x2 {.importc: "vqdmlsl_high_lane_s32".}

func vqdmlsl_high_laneq_s32*(a: Int64x2, b: Int32x4, c: Int32x4, d: int32): Int64x2 {.importc: "vqdmlsl_high_laneq_s32".}

func vqdmlsl_high_n_s32*(a: Int64x2, b: Int32x4, c: int32): Int64x2 {.importc: "vqdmlsl_high_n_s32".}

func vqdmlsl_lane_s32*(a: Int64x2, b: Int32x2, c: Int32x2, d: int32): Int64x2 {.importc: "vqdmlsl_lane_s32".}

func vqdmlsl_laneq_s32*(a: Int64x2, b: Int32x2, c: Int32x4, d: int32): Int64x2 {.importc: "vqdmlsl_laneq_s32".}

func vqdmlsl_n_s32*(a: Int64x2, b: Int32x2, c: int32): Int64x2 {.importc: "vqdmlsl_n_s32".}

func vqdmlslh_s16*(a: int32, b: int16, c: int16): int32 {.importc: "vqdmlslh_s16".}

func vqdmlslh_lane_s16*(a: int32, b: int16, c: Int16x4, d: int32): int32 {.importc: "vqdmlslh_lane_s16".}

func vqdmlslh_laneq_s16*(a: int32, b: int16, c: Int16x8, d: int32): int32 {.importc: "vqdmlslh_laneq_s16".}

func vqdmlsls_s32*(a: int64, b: int32, c: int32): int64 {.importc: "vqdmlsls_s32".}

func vqdmlsls_lane_s32*(a: int64, b: int32, c: Int32x2, d: int32): int64 {.importc: "vqdmlsls_lane_s32".}

func vqdmlsls_laneq_s32*(a: int64, b: int32, c: Int32x4, d: int32): int64 {.importc: "vqdmlsls_laneq_s32".}

func vqdmulh_lane_s16*(a: Int16x4, b: Int16x4, c: int32): Int16x4 {.importc: "vqdmulh_lane_s16".}

func vqdmulh_lane_s32*(a: Int32x2, b: Int32x2, c: int32): Int32x2 {.importc: "vqdmulh_lane_s32".}

func vqdmulhq_lane_s16*(a: Int16x8, b: Int16x4, c: int32): Int16x8 {.importc: "vqdmulhq_lane_s16".}

func vqdmulhq_lane_s32*(a: Int32x4, b: Int32x2, c: int32): Int32x4 {.importc: "vqdmulhq_lane_s32".}

func vqdmulhh_s16*(a: int16, b: int16): int16 {.importc: "vqdmulhh_s16".}

func vqdmulhh_lane_s16*(a: int16, b: Int16x4, c: int32): int16 {.importc: "vqdmulhh_lane_s16".}

func vqdmulhh_laneq_s16*(a: int16, b: Int16x8, c: int32): int16 {.importc: "vqdmulhh_laneq_s16".}

func vqdmulhs_s32*(a: int32, b: int32): int32 {.importc: "vqdmulhs_s32".}

func vqdmulhs_lane_s32*(a: int32, b: Int32x2, c: int32): int32 {.importc: "vqdmulhs_lane_s32".}

func vqdmulhs_laneq_s32*(a: int32, b: Int32x4, c: int32): int32 {.importc: "vqdmulhs_laneq_s32".}

func vqdmull_s16*(a: Int16x4, b: Int16x4): Int32x4 {.importc: "vqdmull_s16".}

func vqdmull_high_s16*(a: Int16x8, b: Int16x8): Int32x4 {.importc: "vqdmull_high_s16".}

func vqdmull_high_lane_s16*(a: Int16x8, b: Int16x4, c: int32): Int32x4 {.importc: "vqdmull_high_lane_s16".}

func vqdmull_high_laneq_s16*(a: Int16x8, b: Int16x8, c: int32): Int32x4 {.importc: "vqdmull_high_laneq_s16".}

func vqdmull_high_n_s16*(a: Int16x8, b: int16): Int32x4 {.importc: "vqdmull_high_n_s16".}

func vqdmull_lane_s16*(a: Int16x4, b: Int16x4, c: int32): Int32x4 {.importc: "vqdmull_lane_s16".}

func vqdmull_laneq_s16*(a: Int16x4, b: Int16x8, c: int32): Int32x4 {.importc: "vqdmull_laneq_s16".}

func vqdmull_n_s16*(a: Int16x4, b: int16): Int32x4 {.importc: "vqdmull_n_s16".}

func vqdmull_s32*(a: Int32x2, b: Int32x2): Int64x2 {.importc: "vqdmull_s32".}

func vqdmull_high_s32*(a: Int32x4, b: Int32x4): Int64x2 {.importc: "vqdmull_high_s32".}

func vqdmull_high_lane_s32*(a: Int32x4, b: Int32x2, c: int32): Int64x2 {.importc: "vqdmull_high_lane_s32".}

func vqdmull_high_laneq_s32*(a: Int32x4, b: Int32x4, c: int32): Int64x2 {.importc: "vqdmull_high_laneq_s32".}

func vqdmull_high_n_s32*(a: Int32x4, b: int32): Int64x2 {.importc: "vqdmull_high_n_s32".}

func vqdmull_lane_s32*(a: Int32x2, b: Int32x2, c: int32): Int64x2 {.importc: "vqdmull_lane_s32".}

func vqdmull_laneq_s32*(a: Int32x2, b: Int32x4, c: int32): Int64x2 {.importc: "vqdmull_laneq_s32".}

func vqdmull_n_s32*(a: Int32x2, b: int32): Int64x2 {.importc: "vqdmull_n_s32".}

func vqdmullh_s16*(a: int16, b: int16): int32 {.importc: "vqdmullh_s16".}

func vqdmullh_lane_s16*(a: int16, b: Int16x4, c: int32): int32 {.importc: "vqdmullh_lane_s16".}

func vqdmullh_laneq_s16*(a: int16, b: Int16x8, c: int32): int32 {.importc: "vqdmullh_laneq_s16".}

func vqdmulls_s32*(a: int32, b: int32): int64 {.importc: "vqdmulls_s32".}

func vqdmulls_lane_s32*(a: int32, b: Int32x2, c: int32): int64 {.importc: "vqdmulls_lane_s32".}

func vqdmulls_laneq_s32*(a: int32, b: Int32x4, c: int32): int64 {.importc: "vqdmulls_laneq_s32".}

func vqmovn_s16*(a: Int16x8): Int8x8 {.importc: "vqmovn_s16".}

func vqmovn_s32*(a: Int32x4): Int16x4 {.importc: "vqmovn_s32".}

func vqmovn_s64*(a: Int64x2): Int32x2 {.importc: "vqmovn_s64".}

func vqmovn_u16*(a: Uint16x8): Uint8x8 {.importc: "vqmovn_u16".}

func vqmovn_u32*(a: Uint32x4): Uint16x4 {.importc: "vqmovn_u32".}

func vqmovn_u64*(a: Uint64x2): Uint32x2 {.importc: "vqmovn_u64".}

func vqmovnh_s16*(a: int16): int8 {.importc: "vqmovnh_s16".}

func vqmovns_s32*(a: int32): int16 {.importc: "vqmovns_s32".}

func vqmovnd_s64*(a: int64): int32 {.importc: "vqmovnd_s64".}

func vqmovnh_u16*(a: uint16): uint8 {.importc: "vqmovnh_u16".}

func vqmovns_u32*(a: uint32): uint16 {.importc: "vqmovns_u32".}

func vqmovnd_u64*(a: uint64): uint32 {.importc: "vqmovnd_u64".}

func vqmovun_s16*(a: Int16x8): Uint8x8 {.importc: "vqmovun_s16".}

func vqmovun_s32*(a: Int32x4): Uint16x4 {.importc: "vqmovun_s32".}

func vqmovun_s64*(a: Int64x2): Uint32x2 {.importc: "vqmovun_s64".}

func vqmovunh_s16*(a: int16): uint8 {.importc: "vqmovunh_s16".}

func vqmovuns_s32*(a: int32): uint16 {.importc: "vqmovuns_s32".}

func vqmovund_s64*(a: int64): uint32 {.importc: "vqmovund_s64".}

func vqnegq_s64*(a: Int64x2): Int64x2 {.importc: "vqnegq_s64".}

func vqnegb_s8*(a: int8): int8 {.importc: "vqnegb_s8".}

func vqnegh_s16*(a: int16): int16 {.importc: "vqnegh_s16".}

func vqnegs_s32*(a: int32): int32 {.importc: "vqnegs_s32".}

func vqnegd_s64*(a: int64): int64 {.importc: "vqnegd_s64".}

func vqrdmulh_lane_s16*(a: Int16x4, b: Int16x4, c: int32): Int16x4 {.importc: "vqrdmulh_lane_s16".}

func vqrdmulh_lane_s32*(a: Int32x2, b: Int32x2, c: int32): Int32x2 {.importc: "vqrdmulh_lane_s32".}

func vqrdmulhq_lane_s16*(a: Int16x8, b: Int16x4, c: int32): Int16x8 {.importc: "vqrdmulhq_lane_s16".}

func vqrdmulhq_lane_s32*(a: Int32x4, b: Int32x2, c: int32): Int32x4 {.importc: "vqrdmulhq_lane_s32".}

func vqrdmulhh_s16*(a: int16, b: int16): int16 {.importc: "vqrdmulhh_s16".}

func vqrdmulhh_lane_s16*(a: int16, b: Int16x4, c: int32): int16 {.importc: "vqrdmulhh_lane_s16".}

func vqrdmulhh_laneq_s16*(a: int16, b: Int16x8, c: int32): int16 {.importc: "vqrdmulhh_laneq_s16".}

func vqrdmulhs_s32*(a: int32, b: int32): int32 {.importc: "vqrdmulhs_s32".}

func vqrdmulhs_lane_s32*(a: int32, b: Int32x2, c: int32): int32 {.importc: "vqrdmulhs_lane_s32".}

func vqrdmulhs_laneq_s32*(a: int32, b: Int32x4, c: int32): int32 {.importc: "vqrdmulhs_laneq_s32".}

func vqrshl_s8*(a: Int8x8, b: Int8x8): Int8x8 {.importc: "vqrshl_s8".}

func vqrshl_s16*(a: Int16x4, b: Int16x4): Int16x4 {.importc: "vqrshl_s16".}

func vqrshl_s32*(a: Int32x2, b: Int32x2): Int32x2 {.importc: "vqrshl_s32".}

func vqrshl_s64*(a: Int64x1, b: Int64x1): Int64x1 {.importc: "vqrshl_s64".}

func vqrshl_u8*(a: Uint8x8, b: Int8x8): Uint8x8 {.importc: "vqrshl_u8".}

func vqrshl_u16*(a: Uint16x4, b: Int16x4): Uint16x4 {.importc: "vqrshl_u16".}

func vqrshl_u32*(a: Uint32x2, b: Int32x2): Uint32x2 {.importc: "vqrshl_u32".}

func vqrshl_u64*(a: Uint64x1, b: Int64x1): Uint64x1 {.importc: "vqrshl_u64".}

func vqrshlq_s8*(a: Int8x16, b: Int8x16): Int8x16 {.importc: "vqrshlq_s8".}

func vqrshlq_s16*(a: Int16x8, b: Int16x8): Int16x8 {.importc: "vqrshlq_s16".}

func vqrshlq_s32*(a: Int32x4, b: Int32x4): Int32x4 {.importc: "vqrshlq_s32".}

func vqrshlq_s64*(a: Int64x2, b: Int64x2): Int64x2 {.importc: "vqrshlq_s64".}

func vqrshlq_u8*(a: Uint8x16, b: Int8x16): Uint8x16 {.importc: "vqrshlq_u8".}

func vqrshlq_u16*(a: Uint16x8, b: Int16x8): Uint16x8 {.importc: "vqrshlq_u16".}

func vqrshlq_u32*(a: Uint32x4, b: Int32x4): Uint32x4 {.importc: "vqrshlq_u32".}

func vqrshlq_u64*(a: Uint64x2, b: Int64x2): Uint64x2 {.importc: "vqrshlq_u64".}

func vqrshlb_s8*(a: int8, b: int8): int8 {.importc: "vqrshlb_s8".}

func vqrshlh_s16*(a: int16, b: int16): int16 {.importc: "vqrshlh_s16".}

func vqrshls_s32*(a: int32, b: int32): int32 {.importc: "vqrshls_s32".}

func vqrshld_s64*(a: int64, b: int64): int64 {.importc: "vqrshld_s64".}

func vqrshlb_u8*(a: uint8, b: int8): uint8 {.importc: "vqrshlb_u8".}

func vqrshlh_u16*(a: uint16, b: int16): uint16 {.importc: "vqrshlh_u16".}

func vqrshls_u32*(a: uint32, b: int32): uint32 {.importc: "vqrshls_u32".}

func vqrshld_u64*(a: uint64, b: int64): uint64 {.importc: "vqrshld_u64".}

func vqrshrn_n_s16*(a: Int16x8, b: int32): Int8x8 {.importc: "vqrshrn_n_s16".}

func vqrshrn_n_s32*(a: Int32x4, b: int32): Int16x4 {.importc: "vqrshrn_n_s32".}

func vqrshrn_n_s64*(a: Int64x2, b: int32): Int32x2 {.importc: "vqrshrn_n_s64".}

func vqrshrn_n_u16*(a: Uint16x8, b: int32): Uint8x8 {.importc: "vqrshrn_n_u16".}

func vqrshrn_n_u32*(a: Uint32x4, b: int32): Uint16x4 {.importc: "vqrshrn_n_u32".}

func vqrshrn_n_u64*(a: Uint64x2, b: int32): Uint32x2 {.importc: "vqrshrn_n_u64".}

func vqrshrnh_n_s16*(a: int16, b: int32): int8 {.importc: "vqrshrnh_n_s16".}

func vqrshrns_n_s32*(a: int32, b: int32): int16 {.importc: "vqrshrns_n_s32".}

func vqrshrnd_n_s64*(a: int64, b: int32): int32 {.importc: "vqrshrnd_n_s64".}

func vqrshrnh_n_u16*(a: uint16, b: int32): uint8 {.importc: "vqrshrnh_n_u16".}

func vqrshrns_n_u32*(a: uint32, b: int32): uint16 {.importc: "vqrshrns_n_u32".}

func vqrshrnd_n_u64*(a: uint64, b: int32): uint32 {.importc: "vqrshrnd_n_u64".}

func vqrshrun_n_s16*(a: Int16x8, b: int32): Uint8x8 {.importc: "vqrshrun_n_s16".}

func vqrshrun_n_s32*(a: Int32x4, b: int32): Uint16x4 {.importc: "vqrshrun_n_s32".}

func vqrshrun_n_s64*(a: Int64x2, b: int32): Uint32x2 {.importc: "vqrshrun_n_s64".}

func vqrshrunh_n_s16*(a: int16, b: int32): int8 {.importc: "vqrshrunh_n_s16".}

func vqrshruns_n_s32*(a: int32, b: int32): int16 {.importc: "vqrshruns_n_s32".}

func vqrshrund_n_s64*(a: int64, b: int32): int32 {.importc: "vqrshrund_n_s64".}

func vqshl_s8*(a: Int8x8, b: Int8x8): Int8x8 {.importc: "vqshl_s8".}

func vqshl_s16*(a: Int16x4, b: Int16x4): Int16x4 {.importc: "vqshl_s16".}

func vqshl_s32*(a: Int32x2, b: Int32x2): Int32x2 {.importc: "vqshl_s32".}

func vqshl_s64*(a: Int64x1, b: Int64x1): Int64x1 {.importc: "vqshl_s64".}

func vqshl_u8*(a: Uint8x8, b: Int8x8): Uint8x8 {.importc: "vqshl_u8".}

func vqshl_u16*(a: Uint16x4, b: Int16x4): Uint16x4 {.importc: "vqshl_u16".}

func vqshl_u32*(a: Uint32x2, b: Int32x2): Uint32x2 {.importc: "vqshl_u32".}

func vqshl_u64*(a: Uint64x1, b: Int64x1): Uint64x1 {.importc: "vqshl_u64".}

func vqshlq_s8*(a: Int8x16, b: Int8x16): Int8x16 {.importc: "vqshlq_s8".}

func vqshlq_s16*(a: Int16x8, b: Int16x8): Int16x8 {.importc: "vqshlq_s16".}

func vqshlq_s32*(a: Int32x4, b: Int32x4): Int32x4 {.importc: "vqshlq_s32".}

func vqshlq_s64*(a: Int64x2, b: Int64x2): Int64x2 {.importc: "vqshlq_s64".}

func vqshlq_u8*(a: Uint8x16, b: Int8x16): Uint8x16 {.importc: "vqshlq_u8".}

func vqshlq_u16*(a: Uint16x8, b: Int16x8): Uint16x8 {.importc: "vqshlq_u16".}

func vqshlq_u32*(a: Uint32x4, b: Int32x4): Uint32x4 {.importc: "vqshlq_u32".}

func vqshlq_u64*(a: Uint64x2, b: Int64x2): Uint64x2 {.importc: "vqshlq_u64".}

func vqshlb_s8*(a: int8, b: int8): int8 {.importc: "vqshlb_s8".}

func vqshlh_s16*(a: int16, b: int16): int16 {.importc: "vqshlh_s16".}

func vqshls_s32*(a: int32, b: int32): int32 {.importc: "vqshls_s32".}

func vqshld_s64*(a: int64, b: int64): int64 {.importc: "vqshld_s64".}

func vqshlb_u8*(a: uint8, b: int8): uint8 {.importc: "vqshlb_u8".}

func vqshlh_u16*(a: uint16, b: int16): uint16 {.importc: "vqshlh_u16".}

func vqshls_u32*(a: uint32, b: int32): uint32 {.importc: "vqshls_u32".}

func vqshld_u64*(a: uint64, b: int64): uint64 {.importc: "vqshld_u64".}

func vqshl_n_s8*(a: Int8x8, b: int32): Int8x8 {.importc: "vqshl_n_s8".}

func vqshl_n_s16*(a: Int16x4, b: int32): Int16x4 {.importc: "vqshl_n_s16".}

func vqshl_n_s32*(a: Int32x2, b: int32): Int32x2 {.importc: "vqshl_n_s32".}

func vqshl_n_s64*(a: Int64x1, b: int32): Int64x1 {.importc: "vqshl_n_s64".}

func vqshl_n_u8*(a: Uint8x8, b: int32): Uint8x8 {.importc: "vqshl_n_u8".}

func vqshl_n_u16*(a: Uint16x4, b: int32): Uint16x4 {.importc: "vqshl_n_u16".}

func vqshl_n_u32*(a: Uint32x2, b: int32): Uint32x2 {.importc: "vqshl_n_u32".}

func vqshl_n_u64*(a: Uint64x1, b: int32): Uint64x1 {.importc: "vqshl_n_u64".}

func vqshlq_n_s8*(a: Int8x16, b: int32): Int8x16 {.importc: "vqshlq_n_s8".}

func vqshlq_n_s16*(a: Int16x8, b: int32): Int16x8 {.importc: "vqshlq_n_s16".}

func vqshlq_n_s32*(a: Int32x4, b: int32): Int32x4 {.importc: "vqshlq_n_s32".}

func vqshlq_n_s64*(a: Int64x2, b: int32): Int64x2 {.importc: "vqshlq_n_s64".}

func vqshlq_n_u8*(a: Uint8x16, b: int32): Uint8x16 {.importc: "vqshlq_n_u8".}

func vqshlq_n_u16*(a: Uint16x8, b: int32): Uint16x8 {.importc: "vqshlq_n_u16".}

func vqshlq_n_u32*(a: Uint32x4, b: int32): Uint32x4 {.importc: "vqshlq_n_u32".}

func vqshlq_n_u64*(a: Uint64x2, b: int32): Uint64x2 {.importc: "vqshlq_n_u64".}

func vqshlb_n_s8*(a: int8, b: int32): int8 {.importc: "vqshlb_n_s8".}

func vqshlh_n_s16*(a: int16, b: int32): int16 {.importc: "vqshlh_n_s16".}

func vqshls_n_s32*(a: int32, b: int32): int32 {.importc: "vqshls_n_s32".}

func vqshld_n_s64*(a: int64, b: int32): int64 {.importc: "vqshld_n_s64".}

func vqshlb_n_u8*(a: uint8, b: int32): uint8 {.importc: "vqshlb_n_u8".}

func vqshlh_n_u16*(a: uint16, b: int32): uint16 {.importc: "vqshlh_n_u16".}

func vqshls_n_u32*(a: uint32, b: int32): uint32 {.importc: "vqshls_n_u32".}

func vqshld_n_u64*(a: uint64, b: int32): uint64 {.importc: "vqshld_n_u64".}

func vqshlu_n_s8*(a: Int8x8, b: int32): Uint8x8 {.importc: "vqshlu_n_s8".}

func vqshlu_n_s16*(a: Int16x4, b: int32): Uint16x4 {.importc: "vqshlu_n_s16".}

func vqshlu_n_s32*(a: Int32x2, b: int32): Uint32x2 {.importc: "vqshlu_n_s32".}

func vqshlu_n_s64*(a: Int64x1, b: int32): Uint64x1 {.importc: "vqshlu_n_s64".}

func vqshluq_n_s8*(a: Int8x16, b: int32): Uint8x16 {.importc: "vqshluq_n_s8".}

func vqshluq_n_s16*(a: Int16x8, b: int32): Uint16x8 {.importc: "vqshluq_n_s16".}

func vqshluq_n_s32*(a: Int32x4, b: int32): Uint32x4 {.importc: "vqshluq_n_s32".}

func vqshluq_n_s64*(a: Int64x2, b: int32): Uint64x2 {.importc: "vqshluq_n_s64".}

func vqshlub_n_s8*(a: int8, b: int32): int8 {.importc: "vqshlub_n_s8".}

func vqshluh_n_s16*(a: int16, b: int32): int16 {.importc: "vqshluh_n_s16".}

func vqshlus_n_s32*(a: int32, b: int32): int32 {.importc: "vqshlus_n_s32".}

func vqshlud_n_s64*(a: int64, b: int32): uint64 {.importc: "vqshlud_n_s64".}

func vqshrn_n_s16*(a: Int16x8, b: int32): Int8x8 {.importc: "vqshrn_n_s16".}

func vqshrn_n_s32*(a: Int32x4, b: int32): Int16x4 {.importc: "vqshrn_n_s32".}

func vqshrn_n_s64*(a: Int64x2, b: int32): Int32x2 {.importc: "vqshrn_n_s64".}

func vqshrn_n_u16*(a: Uint16x8, b: int32): Uint8x8 {.importc: "vqshrn_n_u16".}

func vqshrn_n_u32*(a: Uint32x4, b: int32): Uint16x4 {.importc: "vqshrn_n_u32".}

func vqshrn_n_u64*(a: Uint64x2, b: int32): Uint32x2 {.importc: "vqshrn_n_u64".}

func vqshrnh_n_s16*(a: int16, b: int32): int8 {.importc: "vqshrnh_n_s16".}

func vqshrns_n_s32*(a: int32, b: int32): int16 {.importc: "vqshrns_n_s32".}

func vqshrnd_n_s64*(a: int64, b: int32): int32 {.importc: "vqshrnd_n_s64".}

func vqshrnh_n_u16*(a: uint16, b: int32): uint8 {.importc: "vqshrnh_n_u16".}

func vqshrns_n_u32*(a: uint32, b: int32): uint16 {.importc: "vqshrns_n_u32".}

func vqshrnd_n_u64*(a: uint64, b: int32): uint32 {.importc: "vqshrnd_n_u64".}

func vqshrun_n_s16*(a: Int16x8, b: int32): Uint8x8 {.importc: "vqshrun_n_s16".}

func vqshrun_n_s32*(a: Int32x4, b: int32): Uint16x4 {.importc: "vqshrun_n_s32".}

func vqshrun_n_s64*(a: Int64x2, b: int32): Uint32x2 {.importc: "vqshrun_n_s64".}

func vqshrunh_n_s16*(a: int16, b: int32): int8 {.importc: "vqshrunh_n_s16".}

func vqshruns_n_s32*(a: int32, b: int32): int16 {.importc: "vqshruns_n_s32".}

func vqshrund_n_s64*(a: int64, b: int32): int32 {.importc: "vqshrund_n_s64".}

func vqsubb_s8*(a: int8, b: int8): int8 {.importc: "vqsubb_s8".}

func vqsubh_s16*(a: int16, b: int16): int16 {.importc: "vqsubh_s16".}

func vqsubs_s32*(a: int32, b: int32): int32 {.importc: "vqsubs_s32".}

func vqsubd_s64*(a: int64, b: int64): int64 {.importc: "vqsubd_s64".}

func vqsubb_u8*(a: uint8, b: uint8): uint8 {.importc: "vqsubb_u8".}

func vqsubh_u16*(a: uint16, b: uint16): uint16 {.importc: "vqsubh_u16".}

func vqsubs_u32*(a: uint32, b: uint32): uint32 {.importc: "vqsubs_u32".}

func vqsubd_u64*(a: uint64, b: uint64): uint64 {.importc: "vqsubd_u64".}

func vqtbl2_s8*(tab: Int8x16x2, idx: Uint8x8): Int8x8 {.importc: "vqtbl2_s8".}

func vqtbl2_u8*(tab: Uint8x16x2, idx: Uint8x8): Uint8x8 {.importc: "vqtbl2_u8".}

func vqtbl2_p8*(tab: Poly8x16x2, idx: Uint8x8): Poly8x8 {.importc: "vqtbl2_p8".}

func vqtbl2q_s8*(tab: Int8x16x2, idx: Uint8x16): Int8x16 {.importc: "vqtbl2q_s8".}

func vqtbl2q_u8*(tab: Uint8x16x2, idx: Uint8x16): Uint8x16 {.importc: "vqtbl2q_u8".}

func vqtbl2q_p8*(tab: Poly8x16x2, idx: Uint8x16): Poly8x16 {.importc: "vqtbl2q_p8".}

func vqtbl3_s8*(tab: Int8x16x3, idx: Uint8x8): Int8x8 {.importc: "vqtbl3_s8".}

func vqtbl3_u8*(tab: Uint8x16x3, idx: Uint8x8): Uint8x8 {.importc: "vqtbl3_u8".}

func vqtbl3_p8*(tab: Poly8x16x3, idx: Uint8x8): Poly8x8 {.importc: "vqtbl3_p8".}

func vqtbl3q_s8*(tab: Int8x16x3, idx: Uint8x16): Int8x16 {.importc: "vqtbl3q_s8".}

func vqtbl3q_u8*(tab: Uint8x16x3, idx: Uint8x16): Uint8x16 {.importc: "vqtbl3q_u8".}

func vqtbl3q_p8*(tab: Poly8x16x3, idx: Uint8x16): Poly8x16 {.importc: "vqtbl3q_p8".}

func vqtbl4_s8*(tab: Int8x16x4, idx: Uint8x8): Int8x8 {.importc: "vqtbl4_s8".}

func vqtbl4_u8*(tab: Uint8x16x4, idx: Uint8x8): Uint8x8 {.importc: "vqtbl4_u8".}

func vqtbl4_p8*(tab: Poly8x16x4, idx: Uint8x8): Poly8x8 {.importc: "vqtbl4_p8".}

func vqtbl4q_s8*(tab: Int8x16x4, idx: Uint8x16): Int8x16 {.importc: "vqtbl4q_s8".}

func vqtbl4q_u8*(tab: Uint8x16x4, idx: Uint8x16): Uint8x16 {.importc: "vqtbl4q_u8".}

func vqtbl4q_p8*(tab: Poly8x16x4, idx: Uint8x16): Poly8x16 {.importc: "vqtbl4q_p8".}

func vqtbx2_s8*(r: Int8x8, tab: Int8x16x2, idx: Uint8x8): Int8x8 {.importc: "vqtbx2_s8".}

func vqtbx2_u8*(r: Uint8x8, tab: Uint8x16x2, idx: Uint8x8): Uint8x8 {.importc: "vqtbx2_u8".}

func vqtbx2_p8*(r: Poly8x8, tab: Poly8x16x2, idx: Uint8x8): Poly8x8 {.importc: "vqtbx2_p8".}

func vqtbx2q_s8*(r: Int8x16, tab: Int8x16x2, idx: Uint8x16): Int8x16 {.importc: "vqtbx2q_s8".}

func vqtbx2q_u8*(r: Uint8x16, tab: Uint8x16x2, idx: Uint8x16): Uint8x16 {.importc: "vqtbx2q_u8".}

func vqtbx2q_p8*(r: Poly8x16, tab: Poly8x16x2, idx: Uint8x16): Poly8x16 {.importc: "vqtbx2q_p8".}

func vqtbx3_s8*(r: Int8x8, tab: Int8x16x3, idx: Uint8x8): Int8x8 {.importc: "vqtbx3_s8".}

func vqtbx3_u8*(r: Uint8x8, tab: Uint8x16x3, idx: Uint8x8): Uint8x8 {.importc: "vqtbx3_u8".}

func vqtbx3_p8*(r: Poly8x8, tab: Poly8x16x3, idx: Uint8x8): Poly8x8 {.importc: "vqtbx3_p8".}

func vqtbx3q_s8*(r: Int8x16, tab: Int8x16x3, idx: Uint8x16): Int8x16 {.importc: "vqtbx3q_s8".}

func vqtbx3q_u8*(r: Uint8x16, tab: Uint8x16x3, idx: Uint8x16): Uint8x16 {.importc: "vqtbx3q_u8".}

func vqtbx3q_p8*(r: Poly8x16, tab: Poly8x16x3, idx: Uint8x16): Poly8x16 {.importc: "vqtbx3q_p8".}

func vqtbx4_s8*(r: Int8x8, tab: Int8x16x4, idx: Uint8x8): Int8x8 {.importc: "vqtbx4_s8".}

func vqtbx4_u8*(r: Uint8x8, tab: Uint8x16x4, idx: Uint8x8): Uint8x8 {.importc: "vqtbx4_u8".}

func vqtbx4_p8*(r: Poly8x8, tab: Poly8x16x4, idx: Uint8x8): Poly8x8 {.importc: "vqtbx4_p8".}

func vqtbx4q_s8*(r: Int8x16, tab: Int8x16x4, idx: Uint8x16): Int8x16 {.importc: "vqtbx4q_s8".}

func vqtbx4q_u8*(r: Uint8x16, tab: Uint8x16x4, idx: Uint8x16): Uint8x16 {.importc: "vqtbx4q_u8".}

func vqtbx4q_p8*(r: Poly8x16, tab: Poly8x16x4, idx: Uint8x16): Poly8x16 {.importc: "vqtbx4q_p8".}

func vrbit_p8*(a: Poly8x8): Poly8x8 {.importc: "vrbit_p8".}

func vrbit_s8*(a: Int8x8): Int8x8 {.importc: "vrbit_s8".}

func vrbit_u8*(a: Uint8x8): Uint8x8 {.importc: "vrbit_u8".}

func vrbitq_p8*(a: Poly8x16): Poly8x16 {.importc: "vrbitq_p8".}

func vrbitq_s8*(a: Int8x16): Int8x16 {.importc: "vrbitq_s8".}

func vrbitq_u8*(a: Uint8x16): Uint8x16 {.importc: "vrbitq_u8".}

func vrecpe_u32*(a: Uint32x2): Uint32x2 {.importc: "vrecpe_u32".}

func vrecpeq_u32*(a: Uint32x4): Uint32x4 {.importc: "vrecpeq_u32".}

func vrecpes_f32*(a: float32): float32 {.importc: "vrecpes_f32".}

func vrecped_f64*(a: float64): float64 {.importc: "vrecped_f64".}

func vrecpe_f32*(a: Float32x2): Float32x2 {.importc: "vrecpe_f32".}

func vrecpe_f64*(a: Float64x1): Float64x1 {.importc: "vrecpe_f64".}

func vrecpeq_f32*(a: Float32x4): Float32x4 {.importc: "vrecpeq_f32".}

func vrecpeq_f64*(a: Float64x2): Float64x2 {.importc: "vrecpeq_f64".}

func vrecpss_f32*(a: float32, b: float32): float32 {.importc: "vrecpss_f32".}

func vrecpsd_f64*(a: float64, b: float64): float64 {.importc: "vrecpsd_f64".}

func vrecps_f32*(a: Float32x2, b: Float32x2): Float32x2 {.importc: "vrecps_f32".}

func vrecps_f64*(a: Float64x1, b: Float64x1): Float64x1 {.importc: "vrecps_f64".}

func vrecpsq_f32*(a: Float32x4, b: Float32x4): Float32x4 {.importc: "vrecpsq_f32".}

func vrecpsq_f64*(a: Float64x2, b: Float64x2): Float64x2 {.importc: "vrecpsq_f64".}

func vrecpxs_f32*(a: float32): float32 {.importc: "vrecpxs_f32".}

func vrecpxd_f64*(a: float64): float64 {.importc: "vrecpxd_f64".}

func vrev16_p8*(a: Poly8x8): Poly8x8 {.importc: "vrev16_p8".}

func vrev16_s8*(a: Int8x8): Int8x8 {.importc: "vrev16_s8".}

func vrev16_u8*(a: Uint8x8): Uint8x8 {.importc: "vrev16_u8".}

func vrev16q_p8*(a: Poly8x16): Poly8x16 {.importc: "vrev16q_p8".}

func vrev16q_s8*(a: Int8x16): Int8x16 {.importc: "vrev16q_s8".}

func vrev16q_u8*(a: Uint8x16): Uint8x16 {.importc: "vrev16q_u8".}

func vrev32_p8*(a: Poly8x8): Poly8x8 {.importc: "vrev32_p8".}

func vrev32_p16*(a: Poly16x4): Poly16x4 {.importc: "vrev32_p16".}

func vrev32_s8*(a: Int8x8): Int8x8 {.importc: "vrev32_s8".}

func vrev32_s16*(a: Int16x4): Int16x4 {.importc: "vrev32_s16".}

func vrev32_u8*(a: Uint8x8): Uint8x8 {.importc: "vrev32_u8".}

func vrev32_u16*(a: Uint16x4): Uint16x4 {.importc: "vrev32_u16".}

func vrev32q_p8*(a: Poly8x16): Poly8x16 {.importc: "vrev32q_p8".}

func vrev32q_p16*(a: Poly16x8): Poly16x8 {.importc: "vrev32q_p16".}

func vrev32q_s8*(a: Int8x16): Int8x16 {.importc: "vrev32q_s8".}

func vrev32q_s16*(a: Int16x8): Int16x8 {.importc: "vrev32q_s16".}

func vrev32q_u8*(a: Uint8x16): Uint8x16 {.importc: "vrev32q_u8".}

func vrev32q_u16*(a: Uint16x8): Uint16x8 {.importc: "vrev32q_u16".}

func vrev64_f16*(a: Float16x4): Float16x4 {.importc: "vrev64_f16".}

func vrev64_f32*(a: Float32x2): Float32x2 {.importc: "vrev64_f32".}

func vrev64_p8*(a: Poly8x8): Poly8x8 {.importc: "vrev64_p8".}

func vrev64_p16*(a: Poly16x4): Poly16x4 {.importc: "vrev64_p16".}

func vrev64_s8*(a: Int8x8): Int8x8 {.importc: "vrev64_s8".}

func vrev64_s16*(a: Int16x4): Int16x4 {.importc: "vrev64_s16".}

func vrev64_s32*(a: Int32x2): Int32x2 {.importc: "vrev64_s32".}

func vrev64_u8*(a: Uint8x8): Uint8x8 {.importc: "vrev64_u8".}

func vrev64_u16*(a: Uint16x4): Uint16x4 {.importc: "vrev64_u16".}

func vrev64_u32*(a: Uint32x2): Uint32x2 {.importc: "vrev64_u32".}

func vrev64q_f16*(a: Float16x8): Float16x8 {.importc: "vrev64q_f16".}

func vrev64q_f32*(a: Float32x4): Float32x4 {.importc: "vrev64q_f32".}

func vrev64q_p8*(a: Poly8x16): Poly8x16 {.importc: "vrev64q_p8".}

func vrev64q_p16*(a: Poly16x8): Poly16x8 {.importc: "vrev64q_p16".}

func vrev64q_s8*(a: Int8x16): Int8x16 {.importc: "vrev64q_s8".}

func vrev64q_s16*(a: Int16x8): Int16x8 {.importc: "vrev64q_s16".}

func vrev64q_s32*(a: Int32x4): Int32x4 {.importc: "vrev64q_s32".}

func vrev64q_u8*(a: Uint8x16): Uint8x16 {.importc: "vrev64q_u8".}

func vrev64q_u16*(a: Uint16x8): Uint16x8 {.importc: "vrev64q_u16".}

func vrev64q_u32*(a: Uint32x4): Uint32x4 {.importc: "vrev64q_u32".}

func vrnd_f32*(a: Float32x2): Float32x2 {.importc: "vrnd_f32".}

func vrnd_f64*(a: Float64x1): Float64x1 {.importc: "vrnd_f64".}

func vrndq_f32*(a: Float32x4): Float32x4 {.importc: "vrndq_f32".}

func vrndq_f64*(a: Float64x2): Float64x2 {.importc: "vrndq_f64".}

func vrnda_f32*(a: Float32x2): Float32x2 {.importc: "vrnda_f32".}

func vrnda_f64*(a: Float64x1): Float64x1 {.importc: "vrnda_f64".}

func vrndaq_f32*(a: Float32x4): Float32x4 {.importc: "vrndaq_f32".}

func vrndaq_f64*(a: Float64x2): Float64x2 {.importc: "vrndaq_f64".}

func vrndi_f32*(a: Float32x2): Float32x2 {.importc: "vrndi_f32".}

func vrndi_f64*(a: Float64x1): Float64x1 {.importc: "vrndi_f64".}

func vrndiq_f32*(a: Float32x4): Float32x4 {.importc: "vrndiq_f32".}

func vrndiq_f64*(a: Float64x2): Float64x2 {.importc: "vrndiq_f64".}

func vrndm_f32*(a: Float32x2): Float32x2 {.importc: "vrndm_f32".}

func vrndm_f64*(a: Float64x1): Float64x1 {.importc: "vrndm_f64".}

func vrndmq_f32*(a: Float32x4): Float32x4 {.importc: "vrndmq_f32".}

func vrndmq_f64*(a: Float64x2): Float64x2 {.importc: "vrndmq_f64".}

func vrndns_f32*(a: float32): float32 {.importc: "vrndns_f32".}

func vrndn_f32*(a: Float32x2): Float32x2 {.importc: "vrndn_f32".}

func vrndn_f64*(a: Float64x1): Float64x1 {.importc: "vrndn_f64".}

func vrndnq_f32*(a: Float32x4): Float32x4 {.importc: "vrndnq_f32".}

func vrndnq_f64*(a: Float64x2): Float64x2 {.importc: "vrndnq_f64".}

func vrndp_f32*(a: Float32x2): Float32x2 {.importc: "vrndp_f32".}

func vrndp_f64*(a: Float64x1): Float64x1 {.importc: "vrndp_f64".}

func vrndpq_f32*(a: Float32x4): Float32x4 {.importc: "vrndpq_f32".}

func vrndpq_f64*(a: Float64x2): Float64x2 {.importc: "vrndpq_f64".}

func vrndx_f32*(a: Float32x2): Float32x2 {.importc: "vrndx_f32".}

func vrndx_f64*(a: Float64x1): Float64x1 {.importc: "vrndx_f64".}

func vrndxq_f32*(a: Float32x4): Float32x4 {.importc: "vrndxq_f32".}

func vrndxq_f64*(a: Float64x2): Float64x2 {.importc: "vrndxq_f64".}

func vrshl_s8*(a: Int8x8, b: Int8x8): Int8x8 {.importc: "vrshl_s8".}

func vrshl_s16*(a: Int16x4, b: Int16x4): Int16x4 {.importc: "vrshl_s16".}

func vrshl_s32*(a: Int32x2, b: Int32x2): Int32x2 {.importc: "vrshl_s32".}

func vrshl_s64*(a: Int64x1, b: Int64x1): Int64x1 {.importc: "vrshl_s64".}

func vrshl_u8*(a: Uint8x8, b: Int8x8): Uint8x8 {.importc: "vrshl_u8".}

func vrshl_u16*(a: Uint16x4, b: Int16x4): Uint16x4 {.importc: "vrshl_u16".}

func vrshl_u32*(a: Uint32x2, b: Int32x2): Uint32x2 {.importc: "vrshl_u32".}

func vrshl_u64*(a: Uint64x1, b: Int64x1): Uint64x1 {.importc: "vrshl_u64".}

func vrshlq_s8*(a: Int8x16, b: Int8x16): Int8x16 {.importc: "vrshlq_s8".}

func vrshlq_s16*(a: Int16x8, b: Int16x8): Int16x8 {.importc: "vrshlq_s16".}

func vrshlq_s32*(a: Int32x4, b: Int32x4): Int32x4 {.importc: "vrshlq_s32".}

func vrshlq_s64*(a: Int64x2, b: Int64x2): Int64x2 {.importc: "vrshlq_s64".}

func vrshlq_u8*(a: Uint8x16, b: Int8x16): Uint8x16 {.importc: "vrshlq_u8".}

func vrshlq_u16*(a: Uint16x8, b: Int16x8): Uint16x8 {.importc: "vrshlq_u16".}

func vrshlq_u32*(a: Uint32x4, b: Int32x4): Uint32x4 {.importc: "vrshlq_u32".}

func vrshlq_u64*(a: Uint64x2, b: Int64x2): Uint64x2 {.importc: "vrshlq_u64".}

func vrshld_s64*(a: int64, b: int64): int64 {.importc: "vrshld_s64".}

func vrshld_u64*(a: uint64, b: int64): uint64 {.importc: "vrshld_u64".}

func vrshr_n_s8*(a: Int8x8, b: int32): Int8x8 {.importc: "vrshr_n_s8".}

func vrshr_n_s16*(a: Int16x4, b: int32): Int16x4 {.importc: "vrshr_n_s16".}

func vrshr_n_s32*(a: Int32x2, b: int32): Int32x2 {.importc: "vrshr_n_s32".}

func vrshr_n_s64*(a: Int64x1, b: int32): Int64x1 {.importc: "vrshr_n_s64".}

func vrshr_n_u8*(a: Uint8x8, b: int32): Uint8x8 {.importc: "vrshr_n_u8".}

func vrshr_n_u16*(a: Uint16x4, b: int32): Uint16x4 {.importc: "vrshr_n_u16".}

func vrshr_n_u32*(a: Uint32x2, b: int32): Uint32x2 {.importc: "vrshr_n_u32".}

func vrshr_n_u64*(a: Uint64x1, b: int32): Uint64x1 {.importc: "vrshr_n_u64".}

func vrshrq_n_s8*(a: Int8x16, b: int32): Int8x16 {.importc: "vrshrq_n_s8".}

func vrshrq_n_s16*(a: Int16x8, b: int32): Int16x8 {.importc: "vrshrq_n_s16".}

func vrshrq_n_s32*(a: Int32x4, b: int32): Int32x4 {.importc: "vrshrq_n_s32".}

func vrshrq_n_s64*(a: Int64x2, b: int32): Int64x2 {.importc: "vrshrq_n_s64".}

func vrshrq_n_u8*(a: Uint8x16, b: int32): Uint8x16 {.importc: "vrshrq_n_u8".}

func vrshrq_n_u16*(a: Uint16x8, b: int32): Uint16x8 {.importc: "vrshrq_n_u16".}

func vrshrq_n_u32*(a: Uint32x4, b: int32): Uint32x4 {.importc: "vrshrq_n_u32".}

func vrshrq_n_u64*(a: Uint64x2, b: int32): Uint64x2 {.importc: "vrshrq_n_u64".}

func vrshrd_n_s64*(a: int64, b: int32): int64 {.importc: "vrshrd_n_s64".}

func vrshrd_n_u64*(a: uint64, b: int32): uint64 {.importc: "vrshrd_n_u64".}

func vrsqrtes_f32*(a: float32): float32 {.importc: "vrsqrtes_f32".}

func vrsqrted_f64*(a: float64): float64 {.importc: "vrsqrted_f64".}

func vrsqrte_f32*(a: Float32x2): Float32x2 {.importc: "vrsqrte_f32".}

func vrsqrte_f64*(a: Float64x1): Float64x1 {.importc: "vrsqrte_f64".}

func vrsqrteq_f32*(a: Float32x4): Float32x4 {.importc: "vrsqrteq_f32".}

func vrsqrteq_f64*(a: Float64x2): Float64x2 {.importc: "vrsqrteq_f64".}

func vrsqrtss_f32*(a: float32, b: float32): float32 {.importc: "vrsqrtss_f32".}

func vrsqrtsd_f64*(a: float64, b: float64): float64 {.importc: "vrsqrtsd_f64".}

func vrsqrts_f32*(a: Float32x2, b: Float32x2): Float32x2 {.importc: "vrsqrts_f32".}

func vrsqrts_f64*(a: Float64x1, b: Float64x1): Float64x1 {.importc: "vrsqrts_f64".}

func vrsqrtsq_f32*(a: Float32x4, b: Float32x4): Float32x4 {.importc: "vrsqrtsq_f32".}

func vrsqrtsq_f64*(a: Float64x2, b: Float64x2): Float64x2 {.importc: "vrsqrtsq_f64".}

func vrsra_n_s8*(a: Int8x8, b: Int8x8, c: int32): Int8x8 {.importc: "vrsra_n_s8".}

func vrsra_n_s16*(a: Int16x4, b: Int16x4, c: int32): Int16x4 {.importc: "vrsra_n_s16".}

func vrsra_n_s32*(a: Int32x2, b: Int32x2, c: int32): Int32x2 {.importc: "vrsra_n_s32".}

func vrsra_n_s64*(a: Int64x1, b: Int64x1, c: int32): Int64x1 {.importc: "vrsra_n_s64".}

func vrsra_n_u8*(a: Uint8x8, b: Uint8x8, c: int32): Uint8x8 {.importc: "vrsra_n_u8".}

func vrsra_n_u16*(a: Uint16x4, b: Uint16x4, c: int32): Uint16x4 {.importc: "vrsra_n_u16".}

func vrsra_n_u32*(a: Uint32x2, b: Uint32x2, c: int32): Uint32x2 {.importc: "vrsra_n_u32".}

func vrsra_n_u64*(a: Uint64x1, b: Uint64x1, c: int32): Uint64x1 {.importc: "vrsra_n_u64".}

func vrsraq_n_s8*(a: Int8x16, b: Int8x16, c: int32): Int8x16 {.importc: "vrsraq_n_s8".}

func vrsraq_n_s16*(a: Int16x8, b: Int16x8, c: int32): Int16x8 {.importc: "vrsraq_n_s16".}

func vrsraq_n_s32*(a: Int32x4, b: Int32x4, c: int32): Int32x4 {.importc: "vrsraq_n_s32".}

func vrsraq_n_s64*(a: Int64x2, b: Int64x2, c: int32): Int64x2 {.importc: "vrsraq_n_s64".}

func vrsraq_n_u8*(a: Uint8x16, b: Uint8x16, c: int32): Uint8x16 {.importc: "vrsraq_n_u8".}

func vrsraq_n_u16*(a: Uint16x8, b: Uint16x8, c: int32): Uint16x8 {.importc: "vrsraq_n_u16".}

func vrsraq_n_u32*(a: Uint32x4, b: Uint32x4, c: int32): Uint32x4 {.importc: "vrsraq_n_u32".}

func vrsraq_n_u64*(a: Uint64x2, b: Uint64x2, c: int32): Uint64x2 {.importc: "vrsraq_n_u64".}

func vrsrad_n_s64*(a: int64, b: int64, c: int32): int64 {.importc: "vrsrad_n_s64".}

func vrsrad_n_u64*(a: uint64, b: uint64, c: int32): uint64 {.importc: "vrsrad_n_u64".}

func vsha1cq_u32*(hash_abcd: Uint32x4, hash_e: uint32, wk: Uint32x4): Uint32x4 {.importc: "vsha1cq_u32".}

func vsha1mq_u32*(hash_abcd: Uint32x4, hash_e: uint32, wk: Uint32x4): Uint32x4 {.importc: "vsha1mq_u32".}

func vsha1pq_u32*(hash_abcd: Uint32x4, hash_e: uint32, wk: Uint32x4): Uint32x4 {.importc: "vsha1pq_u32".}

func vsha1h_u32*(hash_e: uint32): uint32 {.importc: "vsha1h_u32".}

func vsha1su0q_u32*(w0_3: Uint32x4, w4_7: Uint32x4, w8_11: Uint32x4): Uint32x4 {.importc: "vsha1su0q_u32".}

func vsha1su1q_u32*(tw0_3: Uint32x4, w12_15: Uint32x4): Uint32x4 {.importc: "vsha1su1q_u32".}

func vsha256hq_u32*(hash_abcd: Uint32x4, hash_efgh: Uint32x4, wk: Uint32x4): Uint32x4 {.importc: "vsha256hq_u32".}

func vsha256h2q_u32*(hash_efgh: Uint32x4, hash_abcd: Uint32x4, wk: Uint32x4): Uint32x4 {.importc: "vsha256h2q_u32".}

func vsha256su0q_u32*(w0_3: Uint32x4, w4_7: Uint32x4): Uint32x4 {.importc: "vsha256su0q_u32".}

func vsha256su1q_u32*(tw0_3: Uint32x4, w8_11: Uint32x4, w12_15: Uint32x4): Uint32x4 {.importc: "vsha256su1q_u32".}

func vshl_n_s8*(a: Int8x8, b: int32): Int8x8 {.importc: "vshl_n_s8".}

func vshl_n_s16*(a: Int16x4, b: int32): Int16x4 {.importc: "vshl_n_s16".}

func vshl_n_s32*(a: Int32x2, b: int32): Int32x2 {.importc: "vshl_n_s32".}

func vshl_n_s64*(a: Int64x1, b: int32): Int64x1 {.importc: "vshl_n_s64".}

func vshl_n_u8*(a: Uint8x8, b: int32): Uint8x8 {.importc: "vshl_n_u8".}

func vshl_n_u16*(a: Uint16x4, b: int32): Uint16x4 {.importc: "vshl_n_u16".}

func vshl_n_u32*(a: Uint32x2, b: int32): Uint32x2 {.importc: "vshl_n_u32".}

func vshl_n_u64*(a: Uint64x1, b: int32): Uint64x1 {.importc: "vshl_n_u64".}

func vshlq_n_s8*(a: Int8x16, b: int32): Int8x16 {.importc: "vshlq_n_s8".}

func vshlq_n_s16*(a: Int16x8, b: int32): Int16x8 {.importc: "vshlq_n_s16".}

func vshlq_n_s32*(a: Int32x4, b: int32): Int32x4 {.importc: "vshlq_n_s32".}

func vshlq_n_s64*(a: Int64x2, b: int32): Int64x2 {.importc: "vshlq_n_s64".}

func vshlq_n_u8*(a: Uint8x16, b: int32): Uint8x16 {.importc: "vshlq_n_u8".}

func vshlq_n_u16*(a: Uint16x8, b: int32): Uint16x8 {.importc: "vshlq_n_u16".}

func vshlq_n_u32*(a: Uint32x4, b: int32): Uint32x4 {.importc: "vshlq_n_u32".}

func vshlq_n_u64*(a: Uint64x2, b: int32): Uint64x2 {.importc: "vshlq_n_u64".}

func vshld_n_s64*(a: int64, b: int32): int64 {.importc: "vshld_n_s64".}

func vshld_n_u64*(a: uint64, b: int32): uint64 {.importc: "vshld_n_u64".}

func vshl_s8*(a: Int8x8, b: Int8x8): Int8x8 {.importc: "vshl_s8".}

func vshl_s16*(a: Int16x4, b: Int16x4): Int16x4 {.importc: "vshl_s16".}

func vshl_s32*(a: Int32x2, b: Int32x2): Int32x2 {.importc: "vshl_s32".}

func vshl_s64*(a: Int64x1, b: Int64x1): Int64x1 {.importc: "vshl_s64".}

func vshl_u8*(a: Uint8x8, b: Int8x8): Uint8x8 {.importc: "vshl_u8".}

func vshl_u16*(a: Uint16x4, b: Int16x4): Uint16x4 {.importc: "vshl_u16".}

func vshl_u32*(a: Uint32x2, b: Int32x2): Uint32x2 {.importc: "vshl_u32".}

func vshl_u64*(a: Uint64x1, b: Int64x1): Uint64x1 {.importc: "vshl_u64".}

func vshlq_s8*(a: Int8x16, b: Int8x16): Int8x16 {.importc: "vshlq_s8".}

func vshlq_s16*(a: Int16x8, b: Int16x8): Int16x8 {.importc: "vshlq_s16".}

func vshlq_s32*(a: Int32x4, b: Int32x4): Int32x4 {.importc: "vshlq_s32".}

func vshlq_s64*(a: Int64x2, b: Int64x2): Int64x2 {.importc: "vshlq_s64".}

func vshlq_u8*(a: Uint8x16, b: Int8x16): Uint8x16 {.importc: "vshlq_u8".}

func vshlq_u16*(a: Uint16x8, b: Int16x8): Uint16x8 {.importc: "vshlq_u16".}

func vshlq_u32*(a: Uint32x4, b: Int32x4): Uint32x4 {.importc: "vshlq_u32".}

func vshlq_u64*(a: Uint64x2, b: Int64x2): Uint64x2 {.importc: "vshlq_u64".}

func vshld_s64*(a: int64, b: int64): int64 {.importc: "vshld_s64".}

func vshld_u64*(a: uint64, b: int64): uint64 {.importc: "vshld_u64".}

func vshll_high_n_s8*(a: Int8x16, b: int32): Int16x8 {.importc: "vshll_high_n_s8".}

func vshll_high_n_s16*(a: Int16x8, b: int32): Int32x4 {.importc: "vshll_high_n_s16".}

func vshll_high_n_s32*(a: Int32x4, b: int32): Int64x2 {.importc: "vshll_high_n_s32".}

func vshll_high_n_u8*(a: Uint8x16, b: int32): Uint16x8 {.importc: "vshll_high_n_u8".}

func vshll_high_n_u16*(a: Uint16x8, b: int32): Uint32x4 {.importc: "vshll_high_n_u16".}

func vshll_high_n_u32*(a: Uint32x4, b: int32): Uint64x2 {.importc: "vshll_high_n_u32".}

func vshll_n_s8*(a: Int8x8, b: int32): Int16x8 {.importc: "vshll_n_s8".}

func vshll_n_s16*(a: Int16x4, b: int32): Int32x4 {.importc: "vshll_n_s16".}

func vshll_n_s32*(a: Int32x2, b: int32): Int64x2 {.importc: "vshll_n_s32".}

func vshll_n_u8*(a: Uint8x8, b: int32): Uint16x8 {.importc: "vshll_n_u8".}

func vshll_n_u16*(a: Uint16x4, b: int32): Uint32x4 {.importc: "vshll_n_u16".}

func vshll_n_u32*(a: Uint32x2, b: int32): Uint64x2 {.importc: "vshll_n_u32".}

func vshr_n_s8*(a: Int8x8, b: int32): Int8x8 {.importc: "vshr_n_s8".}

func vshr_n_s16*(a: Int16x4, b: int32): Int16x4 {.importc: "vshr_n_s16".}

func vshr_n_s32*(a: Int32x2, b: int32): Int32x2 {.importc: "vshr_n_s32".}

func vshr_n_s64*(a: Int64x1, b: int32): Int64x1 {.importc: "vshr_n_s64".}

func vshr_n_u8*(a: Uint8x8, b: int32): Uint8x8 {.importc: "vshr_n_u8".}

func vshr_n_u16*(a: Uint16x4, b: int32): Uint16x4 {.importc: "vshr_n_u16".}

func vshr_n_u32*(a: Uint32x2, b: int32): Uint32x2 {.importc: "vshr_n_u32".}

func vshr_n_u64*(a: Uint64x1, b: int32): Uint64x1 {.importc: "vshr_n_u64".}

func vshrq_n_s8*(a: Int8x16, b: int32): Int8x16 {.importc: "vshrq_n_s8".}

func vshrq_n_s16*(a: Int16x8, b: int32): Int16x8 {.importc: "vshrq_n_s16".}

func vshrq_n_s32*(a: Int32x4, b: int32): Int32x4 {.importc: "vshrq_n_s32".}

func vshrq_n_s64*(a: Int64x2, b: int32): Int64x2 {.importc: "vshrq_n_s64".}

func vshrq_n_u8*(a: Uint8x16, b: int32): Uint8x16 {.importc: "vshrq_n_u8".}

func vshrq_n_u16*(a: Uint16x8, b: int32): Uint16x8 {.importc: "vshrq_n_u16".}

func vshrq_n_u32*(a: Uint32x4, b: int32): Uint32x4 {.importc: "vshrq_n_u32".}

func vshrq_n_u64*(a: Uint64x2, b: int32): Uint64x2 {.importc: "vshrq_n_u64".}

func vshrd_n_s64*(a: int64, b: int32): int64 {.importc: "vshrd_n_s64".}

func vshrd_n_u64*(a: uint64, b: int32): uint64 {.importc: "vshrd_n_u64".}

func vsli_n_s8*(a: Int8x8, b: Int8x8, c: int32): Int8x8 {.importc: "vsli_n_s8".}

func vsli_n_s16*(a: Int16x4, b: Int16x4, c: int32): Int16x4 {.importc: "vsli_n_s16".}

func vsli_n_s32*(a: Int32x2, b: Int32x2, c: int32): Int32x2 {.importc: "vsli_n_s32".}

func vsli_n_s64*(a: Int64x1, b: Int64x1, c: int32): Int64x1 {.importc: "vsli_n_s64".}

func vsli_n_u8*(a: Uint8x8, b: Uint8x8, c: int32): Uint8x8 {.importc: "vsli_n_u8".}

func vsli_n_u16*(a: Uint16x4, b: Uint16x4, c: int32): Uint16x4 {.importc: "vsli_n_u16".}

func vsli_n_u32*(a: Uint32x2, b: Uint32x2, c: int32): Uint32x2 {.importc: "vsli_n_u32".}

func vsli_n_u64*(a: Uint64x1, b: Uint64x1, c: int32): Uint64x1 {.importc: "vsli_n_u64".}

func vsli_n_p64*(a: Poly64x1, b: Poly64x1, c: int32): Poly64x1 {.importc: "vsli_n_p64".}

func vsliq_n_s8*(a: Int8x16, b: Int8x16, c: int32): Int8x16 {.importc: "vsliq_n_s8".}

func vsliq_n_s16*(a: Int16x8, b: Int16x8, c: int32): Int16x8 {.importc: "vsliq_n_s16".}

func vsliq_n_s32*(a: Int32x4, b: Int32x4, c: int32): Int32x4 {.importc: "vsliq_n_s32".}

func vsliq_n_s64*(a: Int64x2, b: Int64x2, c: int32): Int64x2 {.importc: "vsliq_n_s64".}

func vsliq_n_u8*(a: Uint8x16, b: Uint8x16, c: int32): Uint8x16 {.importc: "vsliq_n_u8".}

func vsliq_n_u16*(a: Uint16x8, b: Uint16x8, c: int32): Uint16x8 {.importc: "vsliq_n_u16".}

func vsliq_n_u32*(a: Uint32x4, b: Uint32x4, c: int32): Uint32x4 {.importc: "vsliq_n_u32".}

func vsliq_n_u64*(a: Uint64x2, b: Uint64x2, c: int32): Uint64x2 {.importc: "vsliq_n_u64".}

func vsliq_n_p64*(a: Poly64x2, b: Poly64x2, c: int32): Poly64x2 {.importc: "vsliq_n_p64".}

func vslid_n_s64*(a: int64, b: int64, c: int32): int64 {.importc: "vslid_n_s64".}

func vslid_n_u64*(a: uint64, b: uint64, c: int32): uint64 {.importc: "vslid_n_u64".}

func vsqadd_u8*(a: Uint8x8, b: Int8x8): Uint8x8 {.importc: "vsqadd_u8".}

func vsqadd_u16*(a: Uint16x4, b: Int16x4): Uint16x4 {.importc: "vsqadd_u16".}

func vsqadd_u32*(a: Uint32x2, b: Int32x2): Uint32x2 {.importc: "vsqadd_u32".}

func vsqadd_u64*(a: Uint64x1, b: Int64x1): Uint64x1 {.importc: "vsqadd_u64".}

func vsqaddq_u8*(a: Uint8x16, b: Int8x16): Uint8x16 {.importc: "vsqaddq_u8".}

func vsqaddq_u16*(a: Uint16x8, b: Int16x8): Uint16x8 {.importc: "vsqaddq_u16".}

func vsqaddq_u32*(a: Uint32x4, b: Int32x4): Uint32x4 {.importc: "vsqaddq_u32".}

func vsqaddq_u64*(a: Uint64x2, b: Int64x2): Uint64x2 {.importc: "vsqaddq_u64".}

func vsqaddb_u8*(a: uint8, b: int8): uint8 {.importc: "vsqaddb_u8".}

func vsqaddh_u16*(a: uint16, b: int16): uint16 {.importc: "vsqaddh_u16".}

func vsqadds_u32*(a: uint32, b: int32): uint32 {.importc: "vsqadds_u32".}

func vsqaddd_u64*(a: uint64, b: int64): uint64 {.importc: "vsqaddd_u64".}

func vsqrt_f32*(a: Float32x2): Float32x2 {.importc: "vsqrt_f32".}

func vsqrtq_f32*(a: Float32x4): Float32x4 {.importc: "vsqrtq_f32".}

func vsqrt_f64*(a: Float64x1): Float64x1 {.importc: "vsqrt_f64".}

func vsqrtq_f64*(a: Float64x2): Float64x2 {.importc: "vsqrtq_f64".}

func vsra_n_s8*(a: Int8x8, b: Int8x8, c: int32): Int8x8 {.importc: "vsra_n_s8".}

func vsra_n_s16*(a: Int16x4, b: Int16x4, c: int32): Int16x4 {.importc: "vsra_n_s16".}

func vsra_n_s32*(a: Int32x2, b: Int32x2, c: int32): Int32x2 {.importc: "vsra_n_s32".}

func vsra_n_s64*(a: Int64x1, b: Int64x1, c: int32): Int64x1 {.importc: "vsra_n_s64".}

func vsra_n_u8*(a: Uint8x8, b: Uint8x8, c: int32): Uint8x8 {.importc: "vsra_n_u8".}

func vsra_n_u16*(a: Uint16x4, b: Uint16x4, c: int32): Uint16x4 {.importc: "vsra_n_u16".}

func vsra_n_u32*(a: Uint32x2, b: Uint32x2, c: int32): Uint32x2 {.importc: "vsra_n_u32".}

func vsra_n_u64*(a: Uint64x1, b: Uint64x1, c: int32): Uint64x1 {.importc: "vsra_n_u64".}

func vsraq_n_s8*(a: Int8x16, b: Int8x16, c: int32): Int8x16 {.importc: "vsraq_n_s8".}

func vsraq_n_s16*(a: Int16x8, b: Int16x8, c: int32): Int16x8 {.importc: "vsraq_n_s16".}

func vsraq_n_s32*(a: Int32x4, b: Int32x4, c: int32): Int32x4 {.importc: "vsraq_n_s32".}

func vsraq_n_s64*(a: Int64x2, b: Int64x2, c: int32): Int64x2 {.importc: "vsraq_n_s64".}

func vsraq_n_u8*(a: Uint8x16, b: Uint8x16, c: int32): Uint8x16 {.importc: "vsraq_n_u8".}

func vsraq_n_u16*(a: Uint16x8, b: Uint16x8, c: int32): Uint16x8 {.importc: "vsraq_n_u16".}

func vsraq_n_u32*(a: Uint32x4, b: Uint32x4, c: int32): Uint32x4 {.importc: "vsraq_n_u32".}

func vsraq_n_u64*(a: Uint64x2, b: Uint64x2, c: int32): Uint64x2 {.importc: "vsraq_n_u64".}

func vsrad_n_s64*(a: int64, b: int64, c: int32): int64 {.importc: "vsrad_n_s64".}

func vsrad_n_u64*(a: uint64, b: uint64, c: int32): uint64 {.importc: "vsrad_n_u64".}

func vsri_n_s8*(a: Int8x8, b: Int8x8, c: int32): Int8x8 {.importc: "vsri_n_s8".}

func vsri_n_s16*(a: Int16x4, b: Int16x4, c: int32): Int16x4 {.importc: "vsri_n_s16".}

func vsri_n_s32*(a: Int32x2, b: Int32x2, c: int32): Int32x2 {.importc: "vsri_n_s32".}

func vsri_n_s64*(a: Int64x1, b: Int64x1, c: int32): Int64x1 {.importc: "vsri_n_s64".}

func vsri_n_u8*(a: Uint8x8, b: Uint8x8, c: int32): Uint8x8 {.importc: "vsri_n_u8".}

func vsri_n_u16*(a: Uint16x4, b: Uint16x4, c: int32): Uint16x4 {.importc: "vsri_n_u16".}

func vsri_n_u32*(a: Uint32x2, b: Uint32x2, c: int32): Uint32x2 {.importc: "vsri_n_u32".}

func vsri_n_u64*(a: Uint64x1, b: Uint64x1, c: int32): Uint64x1 {.importc: "vsri_n_u64".}

func vsriq_n_s8*(a: Int8x16, b: Int8x16, c: int32): Int8x16 {.importc: "vsriq_n_s8".}

func vsriq_n_s16*(a: Int16x8, b: Int16x8, c: int32): Int16x8 {.importc: "vsriq_n_s16".}

func vsriq_n_s32*(a: Int32x4, b: Int32x4, c: int32): Int32x4 {.importc: "vsriq_n_s32".}

func vsriq_n_s64*(a: Int64x2, b: Int64x2, c: int32): Int64x2 {.importc: "vsriq_n_s64".}

func vsriq_n_u8*(a: Uint8x16, b: Uint8x16, c: int32): Uint8x16 {.importc: "vsriq_n_u8".}

func vsriq_n_u16*(a: Uint16x8, b: Uint16x8, c: int32): Uint16x8 {.importc: "vsriq_n_u16".}

func vsriq_n_u32*(a: Uint32x4, b: Uint32x4, c: int32): Uint32x4 {.importc: "vsriq_n_u32".}

func vsriq_n_u64*(a: Uint64x2, b: Uint64x2, c: int32): Uint64x2 {.importc: "vsriq_n_u64".}

func vsrid_n_s64*(a: int64, b: int64, c: int32): int64 {.importc: "vsrid_n_s64".}

func vsrid_n_u64*(a: uint64, b: uint64, c: int32): uint64 {.importc: "vsrid_n_u64".}

func vst1_f16*(a: ptr float16, b: Float16x4): void {.importc: "vst1_f16".}

func vst1_f32*(a: ptr float32, b: Float32x2): void {.importc: "vst1_f32".}

func vst1_f64*(a: ptr float64, b: Float64x1): void {.importc: "vst1_f64".}

func vst1_p8*(a: ptr Poly8, b: Poly8x8): void {.importc: "vst1_p8".}

func vst1_p16*(a: ptr Poly16, b: Poly16x4): void {.importc: "vst1_p16".}

func vst1_p64*(a: ptr Poly64, b: Poly64x1): void {.importc: "vst1_p64".}

func vst1_s8*(a: ptr int8, b: Int8x8): void {.importc: "vst1_s8".}

func vst1_s16*(a: ptr int16, b: Int16x4): void {.importc: "vst1_s16".}

func vst1_s32*(a: ptr int32, b: Int32x2): void {.importc: "vst1_s32".}

func vst1_s64*(a: ptr int64, b: Int64x1): void {.importc: "vst1_s64".}

func vst1_u8*(a: ptr uint8, b: Uint8x8): void {.importc: "vst1_u8".}

func vst1_u16*(a: ptr uint16, b: Uint16x4): void {.importc: "vst1_u16".}

func vst1_u32*(a: ptr uint32, b: Uint32x2): void {.importc: "vst1_u32".}

func vst1_u64*(a: ptr uint64, b: Uint64x1): void {.importc: "vst1_u64".}

func vst1q_f16*(a: ptr float16, b: Float16x8): void {.importc: "vst1q_f16".}

func vst1q_f32*(a: ptr float32, b: Float32x4): void {.importc: "vst1q_f32".}

func vst1q_f64*(a: ptr float64, b: Float64x2): void {.importc: "vst1q_f64".}

func vst1q_p8*(a: ptr Poly8, b: Poly8x16): void {.importc: "vst1q_p8".}

func vst1q_p16*(a: ptr Poly16, b: Poly16x8): void {.importc: "vst1q_p16".}

func vst1q_p64*(a: ptr Poly64, b: Poly64x2): void {.importc: "vst1q_p64".}

func vst1q_s8*(a: ptr int8, b: Int8x16): void {.importc: "vst1q_s8".}

func vst1q_s16*(a: ptr int16, b: Int16x8): void {.importc: "vst1q_s16".}

func vst1q_s32*(a: ptr int32, b: Int32x4): void {.importc: "vst1q_s32".}

func vst1q_s64*(a: ptr int64, b: Int64x2): void {.importc: "vst1q_s64".}

func vst1q_u8*(a: ptr uint8, b: Uint8x16): void {.importc: "vst1q_u8".}

func vst1q_u16*(a: ptr uint16, b: Uint16x8): void {.importc: "vst1q_u16".}

func vst1q_u32*(a: ptr uint32, b: Uint32x4): void {.importc: "vst1q_u32".}

func vst1q_u64*(a: ptr uint64, b: Uint64x2): void {.importc: "vst1q_u64".}

func vst1_lane_f16*(a: ptr float16, b: Float16x4, lane: int32): void {.importc: "vst1_lane_f16".}

func vst1_lane_f32*(a: ptr float32, b: Float32x2, lane: int32): void {.importc: "vst1_lane_f32".}

func vst1_lane_f64*(a: ptr float64, b: Float64x1, lane: int32): void {.importc: "vst1_lane_f64".}

func vst1_lane_p8*(a: ptr Poly8, b: Poly8x8, lane: int32): void {.importc: "vst1_lane_p8".}

func vst1_lane_p16*(a: ptr Poly16, b: Poly16x4, lane: int32): void {.importc: "vst1_lane_p16".}

func vst1_lane_p64*(a: ptr Poly64, b: Poly64x1, lane: int32): void {.importc: "vst1_lane_p64".}

func vst1_lane_s8*(a: ptr int8, b: Int8x8, lane: int32): void {.importc: "vst1_lane_s8".}

func vst1_lane_s16*(a: ptr int16, b: Int16x4, lane: int32): void {.importc: "vst1_lane_s16".}

func vst1_lane_s32*(a: ptr int32, b: Int32x2, lane: int32): void {.importc: "vst1_lane_s32".}

func vst1_lane_s64*(a: ptr int64, b: Int64x1, lane: int32): void {.importc: "vst1_lane_s64".}

func vst1_lane_u8*(a: ptr uint8, b: Uint8x8, lane: int32): void {.importc: "vst1_lane_u8".}

func vst1_lane_u16*(a: ptr uint16, b: Uint16x4, lane: int32): void {.importc: "vst1_lane_u16".}

func vst1_lane_u32*(a: ptr uint32, b: Uint32x2, lane: int32): void {.importc: "vst1_lane_u32".}

func vst1_lane_u64*(a: ptr uint64, b: Uint64x1, lane: int32): void {.importc: "vst1_lane_u64".}

func vst1q_lane_f16*(a: ptr float16, b: Float16x8, lane: int32): void {.importc: "vst1q_lane_f16".}

func vst1q_lane_f32*(a: ptr float32, b: Float32x4, lane: int32): void {.importc: "vst1q_lane_f32".}

func vst1q_lane_f64*(a: ptr float64, b: Float64x2, lane: int32): void {.importc: "vst1q_lane_f64".}

func vst1q_lane_p8*(a: ptr Poly8, b: Poly8x16, lane: int32): void {.importc: "vst1q_lane_p8".}

func vst1q_lane_p16*(a: ptr Poly16, b: Poly16x8, lane: int32): void {.importc: "vst1q_lane_p16".}

func vst1q_lane_p64*(a: ptr Poly64, b: Poly64x2, lane: int32): void {.importc: "vst1q_lane_p64".}

func vst1q_lane_s8*(a: ptr int8, b: Int8x16, lane: int32): void {.importc: "vst1q_lane_s8".}

func vst1q_lane_s16*(a: ptr int16, b: Int16x8, lane: int32): void {.importc: "vst1q_lane_s16".}

func vst1q_lane_s32*(a: ptr int32, b: Int32x4, lane: int32): void {.importc: "vst1q_lane_s32".}

func vst1q_lane_s64*(a: ptr int64, b: Int64x2, lane: int32): void {.importc: "vst1q_lane_s64".}

func vst1q_lane_u8*(a: ptr uint8, b: Uint8x16, lane: int32): void {.importc: "vst1q_lane_u8".}

func vst1q_lane_u16*(a: ptr uint16, b: Uint16x8, lane: int32): void {.importc: "vst1q_lane_u16".}

func vst1q_lane_u32*(a: ptr uint32, b: Uint32x4, lane: int32): void {.importc: "vst1q_lane_u32".}

func vst1q_lane_u64*(a: ptr uint64, b: Uint64x2, lane: int32): void {.importc: "vst1q_lane_u64".}

func vst1_s64_x2*(a: ptr int64, val: Int64x1x2): void {.importc: "vst1_s64_x2".}

func vst1_u64_x2*(a: ptr uint64, val: Uint64x1x2): void {.importc: "vst1_u64_x2".}

func vst1_f64_x2*(a: ptr float64, val: Float64x1x2): void {.importc: "vst1_f64_x2".}

func vst1_s8_x2*(a: ptr int8, val: Int8x8x2): void {.importc: "vst1_s8_x2".}

func vst1_p8_x2*(a: ptr Poly8, val: Poly8x8x2): void {.importc: "vst1_p8_x2".}

func vst1_s16_x2*(a: ptr int16, val: Int16x4x2): void {.importc: "vst1_s16_x2".}

func vst1_p16_x2*(a: ptr Poly16, val: Poly16x4x2): void {.importc: "vst1_p16_x2".}

func vst1_s32_x2*(a: ptr int32, val: Int32x2x2): void {.importc: "vst1_s32_x2".}

func vst1_u8_x2*(a: ptr uint8, val: Uint8x8x2): void {.importc: "vst1_u8_x2".}

func vst1_u16_x2*(a: ptr uint16, val: Uint16x4x2): void {.importc: "vst1_u16_x2".}

func vst1_u32_x2*(a: ptr uint32, val: Uint32x2x2): void {.importc: "vst1_u32_x2".}

func vst1_f16_x2*(a: ptr float16, val: Float16x4x2): void {.importc: "vst1_f16_x2".}

func vst1_f32_x2*(a: ptr float32, val: Float32x2x2): void {.importc: "vst1_f32_x2".}

func vst1_p64_x2*(a: ptr Poly64, val: Poly64x1x2): void {.importc: "vst1_p64_x2".}

func vst1q_s8_x2*(a: ptr int8, val: Int8x16x2): void {.importc: "vst1q_s8_x2".}

func vst1q_p8_x2*(a: ptr Poly8, val: Poly8x16x2): void {.importc: "vst1q_p8_x2".}

func vst1q_s16_x2*(a: ptr int16, val: Int16x8x2): void {.importc: "vst1q_s16_x2".}

func vst1q_p16_x2*(a: ptr Poly16, val: Poly16x8x2): void {.importc: "vst1q_p16_x2".}

func vst1q_s32_x2*(a: ptr int32, val: Int32x4x2): void {.importc: "vst1q_s32_x2".}

func vst1q_s64_x2*(a: ptr int64, val: Int64x2x2): void {.importc: "vst1q_s64_x2".}

func vst1q_u8_x2*(a: ptr uint8, val: Uint8x16x2): void {.importc: "vst1q_u8_x2".}

func vst1q_u16_x2*(a: ptr uint16, val: Uint16x8x2): void {.importc: "vst1q_u16_x2".}

func vst1q_u32_x2*(a: ptr uint32, val: Uint32x4x2): void {.importc: "vst1q_u32_x2".}

func vst1q_u64_x2*(a: ptr uint64, val: Uint64x2x2): void {.importc: "vst1q_u64_x2".}

func vst1q_f16_x2*(a: ptr float16, val: Float16x8x2): void {.importc: "vst1q_f16_x2".}

func vst1q_f32_x2*(a: ptr float32, val: Float32x4x2): void {.importc: "vst1q_f32_x2".}

func vst1q_f64_x2*(a: ptr float64, val: Float64x2x2): void {.importc: "vst1q_f64_x2".}

func vst1q_p64_x2*(a: ptr Poly64, val: Poly64x2x2): void {.importc: "vst1q_p64_x2".}

func vst1_s64_x3*(a: ptr int64, val: Int64x1x3): void {.importc: "vst1_s64_x3".}

func vst1_u64_x3*(a: ptr uint64, val: Uint64x1x3): void {.importc: "vst1_u64_x3".}

func vst1_f64_x3*(a: ptr float64, val: Float64x1x3): void {.importc: "vst1_f64_x3".}

func vst1_s8_x3*(a: ptr int8, val: Int8x8x3): void {.importc: "vst1_s8_x3".}

func vst1_p8_x3*(a: ptr Poly8, val: Poly8x8x3): void {.importc: "vst1_p8_x3".}

func vst1_s16_x3*(a: ptr int16, val: Int16x4x3): void {.importc: "vst1_s16_x3".}

func vst1_p16_x3*(a: ptr Poly16, val: Poly16x4x3): void {.importc: "vst1_p16_x3".}

func vst1_s32_x3*(a: ptr int32, val: Int32x2x3): void {.importc: "vst1_s32_x3".}

func vst1_u8_x3*(a: ptr uint8, val: Uint8x8x3): void {.importc: "vst1_u8_x3".}

func vst1_u16_x3*(a: ptr uint16, val: Uint16x4x3): void {.importc: "vst1_u16_x3".}

func vst1_u32_x3*(a: ptr uint32, val: Uint32x2x3): void {.importc: "vst1_u32_x3".}

func vst1_f16_x3*(a: ptr float16, val: Float16x4x3): void {.importc: "vst1_f16_x3".}

func vst1_f32_x3*(a: ptr float32, val: Float32x2x3): void {.importc: "vst1_f32_x3".}

func vst1_p64_x3*(a: ptr Poly64, val: Poly64x1x3): void {.importc: "vst1_p64_x3".}

func vst1q_s8_x3*(a: ptr int8, val: Int8x16x3): void {.importc: "vst1q_s8_x3".}

func vst1q_p8_x3*(a: ptr Poly8, val: Poly8x16x3): void {.importc: "vst1q_p8_x3".}

func vst1q_s16_x3*(a: ptr int16, val: Int16x8x3): void {.importc: "vst1q_s16_x3".}

func vst1q_p16_x3*(a: ptr Poly16, val: Poly16x8x3): void {.importc: "vst1q_p16_x3".}

func vst1q_s32_x3*(a: ptr int32, val: Int32x4x3): void {.importc: "vst1q_s32_x3".}

func vst1q_s64_x3*(a: ptr int64, val: Int64x2x3): void {.importc: "vst1q_s64_x3".}

func vst1q_u8_x3*(a: ptr uint8, val: Uint8x16x3): void {.importc: "vst1q_u8_x3".}

func vst1q_u16_x3*(a: ptr uint16, val: Uint16x8x3): void {.importc: "vst1q_u16_x3".}

func vst1q_u32_x3*(a: ptr uint32, val: Uint32x4x3): void {.importc: "vst1q_u32_x3".}

func vst1q_u64_x3*(a: ptr uint64, val: Uint64x2x3): void {.importc: "vst1q_u64_x3".}

func vst1q_f16_x3*(a: ptr float16, val: Float16x8x3): void {.importc: "vst1q_f16_x3".}

func vst1q_f32_x3*(a: ptr float32, val: Float32x4x3): void {.importc: "vst1q_f32_x3".}

func vst1q_f64_x3*(a: ptr float64, val: Float64x2x3): void {.importc: "vst1q_f64_x3".}

func vst1q_p64_x3*(a: ptr Poly64, val: Poly64x2x3): void {.importc: "vst1q_p64_x3".}

func vst1_s8_x4*(a: ptr int8, val: Int8x8x4): void {.importc: "vst1_s8_x4".}

func vst1q_s8_x4*(a: ptr int8, val: Int8x16x4): void {.importc: "vst1q_s8_x4".}

func vst1_s16_x4*(a: ptr int16, val: Int16x4x4): void {.importc: "vst1_s16_x4".}

func vst1q_s16_x4*(a: ptr int16, val: Int16x8x4): void {.importc: "vst1q_s16_x4".}

func vst1_s32_x4*(a: ptr int32, val: Int32x2x4): void {.importc: "vst1_s32_x4".}

func vst1q_s32_x4*(a: ptr int32, val: Int32x4x4): void {.importc: "vst1q_s32_x4".}

func vst1_u8_x4*(a: ptr uint8, val: Uint8x8x4): void {.importc: "vst1_u8_x4".}

func vst1q_u8_x4*(a: ptr uint8, val: Uint8x16x4): void {.importc: "vst1q_u8_x4".}

func vst1_u16_x4*(a: ptr uint16, val: Uint16x4x4): void {.importc: "vst1_u16_x4".}

func vst1q_u16_x4*(a: ptr uint16, val: Uint16x8x4): void {.importc: "vst1q_u16_x4".}

func vst1_u32_x4*(a: ptr uint32, val: Uint32x2x4): void {.importc: "vst1_u32_x4".}

func vst1q_u32_x4*(a: ptr uint32, val: Uint32x4x4): void {.importc: "vst1q_u32_x4".}

func vst1_f16_x4*(a: ptr float16, val: Float16x4x4): void {.importc: "vst1_f16_x4".}

func vst1q_f16_x4*(a: ptr float16, val: Float16x8x4): void {.importc: "vst1q_f16_x4".}

func vst1_f32_x4*(a: ptr float32, val: Float32x2x4): void {.importc: "vst1_f32_x4".}

func vst1q_f32_x4*(a: ptr float32, val: Float32x4x4): void {.importc: "vst1q_f32_x4".}

func vst1_p8_x4*(a: ptr Poly8, val: Poly8x8x4): void {.importc: "vst1_p8_x4".}

func vst1q_p8_x4*(a: ptr Poly8, val: Poly8x16x4): void {.importc: "vst1q_p8_x4".}

func vst1_p16_x4*(a: ptr Poly16, val: Poly16x4x4): void {.importc: "vst1_p16_x4".}

func vst1q_p16_x4*(a: ptr Poly16, val: Poly16x8x4): void {.importc: "vst1q_p16_x4".}

func vst1_s64_x4*(a: ptr int64, val: Int64x1x4): void {.importc: "vst1_s64_x4".}

func vst1_u64_x4*(a: ptr uint64, val: Uint64x1x4): void {.importc: "vst1_u64_x4".}

func vst1_p64_x4*(a: ptr Poly64, val: Poly64x1x4): void {.importc: "vst1_p64_x4".}

func vst1q_s64_x4*(a: ptr int64, val: Int64x2x4): void {.importc: "vst1q_s64_x4".}

func vst1q_u64_x4*(a: ptr uint64, val: Uint64x2x4): void {.importc: "vst1q_u64_x4".}

func vst1q_p64_x4*(a: ptr Poly64, val: Poly64x2x4): void {.importc: "vst1q_p64_x4".}

func vst1_f64_x4*(a: ptr float64, val: Float64x1x4): void {.importc: "vst1_f64_x4".}

func vst1q_f64_x4*(a: ptr float64, val: Float64x2x4): void {.importc: "vst1q_f64_x4".}

func vst2_s64*(a: ptr int64, val: Int64x1x2): void {.importc: "vst2_s64".}

func vst2_u64*(a: ptr uint64, val: Uint64x1x2): void {.importc: "vst2_u64".}

func vst2_f64*(a: ptr float64, val: Float64x1x2): void {.importc: "vst2_f64".}

func vst2_s8*(a: ptr int8, val: Int8x8x2): void {.importc: "vst2_s8".}

func vst2_p8*(a: ptr Poly8, val: Poly8x8x2): void {.importc: "vst2_p8".}

func vst2_s16*(a: ptr int16, val: Int16x4x2): void {.importc: "vst2_s16".}

func vst2_p16*(a: ptr Poly16, val: Poly16x4x2): void {.importc: "vst2_p16".}

func vst2_s32*(a: ptr int32, val: Int32x2x2): void {.importc: "vst2_s32".}

func vst2_u8*(a: ptr uint8, val: Uint8x8x2): void {.importc: "vst2_u8".}

func vst2_u16*(a: ptr uint16, val: Uint16x4x2): void {.importc: "vst2_u16".}

func vst2_u32*(a: ptr uint32, val: Uint32x2x2): void {.importc: "vst2_u32".}

func vst2_f16*(a: ptr float16, val: Float16x4x2): void {.importc: "vst2_f16".}

func vst2_f32*(a: ptr float32, val: Float32x2x2): void {.importc: "vst2_f32".}

func vst2_p64*(a: ptr Poly64, val: Poly64x1x2): void {.importc: "vst2_p64".}

func vst2q_s8*(a: ptr int8, val: Int8x16x2): void {.importc: "vst2q_s8".}

func vst2q_p8*(a: ptr Poly8, val: Poly8x16x2): void {.importc: "vst2q_p8".}

func vst2q_s16*(a: ptr int16, val: Int16x8x2): void {.importc: "vst2q_s16".}

func vst2q_p16*(a: ptr Poly16, val: Poly16x8x2): void {.importc: "vst2q_p16".}

func vst2q_s32*(a: ptr int32, val: Int32x4x2): void {.importc: "vst2q_s32".}

func vst2q_s64*(a: ptr int64, val: Int64x2x2): void {.importc: "vst2q_s64".}

func vst2q_u8*(a: ptr uint8, val: Uint8x16x2): void {.importc: "vst2q_u8".}

func vst2q_u16*(a: ptr uint16, val: Uint16x8x2): void {.importc: "vst2q_u16".}

func vst2q_u32*(a: ptr uint32, val: Uint32x4x2): void {.importc: "vst2q_u32".}

func vst2q_u64*(a: ptr uint64, val: Uint64x2x2): void {.importc: "vst2q_u64".}

func vst2q_f16*(a: ptr float16, val: Float16x8x2): void {.importc: "vst2q_f16".}

func vst2q_f32*(a: ptr float32, val: Float32x4x2): void {.importc: "vst2q_f32".}

func vst2q_f64*(a: ptr float64, val: Float64x2x2): void {.importc: "vst2q_f64".}

func vst2q_p64*(a: ptr Poly64, val: Poly64x2x2): void {.importc: "vst2q_p64".}

func vst3_s64*(a: ptr int64, val: Int64x1x3): void {.importc: "vst3_s64".}

func vst3_u64*(a: ptr uint64, val: Uint64x1x3): void {.importc: "vst3_u64".}

func vst3_f64*(a: ptr float64, val: Float64x1x3): void {.importc: "vst3_f64".}

func vst3_s8*(a: ptr int8, val: Int8x8x3): void {.importc: "vst3_s8".}

func vst3_p8*(a: ptr Poly8, val: Poly8x8x3): void {.importc: "vst3_p8".}

func vst3_s16*(a: ptr int16, val: Int16x4x3): void {.importc: "vst3_s16".}

func vst3_p16*(a: ptr Poly16, val: Poly16x4x3): void {.importc: "vst3_p16".}

func vst3_s32*(a: ptr int32, val: Int32x2x3): void {.importc: "vst3_s32".}

func vst3_u8*(a: ptr uint8, val: Uint8x8x3): void {.importc: "vst3_u8".}

func vst3_u16*(a: ptr uint16, val: Uint16x4x3): void {.importc: "vst3_u16".}

func vst3_u32*(a: ptr uint32, val: Uint32x2x3): void {.importc: "vst3_u32".}

func vst3_f16*(a: ptr float16, val: Float16x4x3): void {.importc: "vst3_f16".}

func vst3_f32*(a: ptr float32, val: Float32x2x3): void {.importc: "vst3_f32".}

func vst3_p64*(a: ptr Poly64, val: Poly64x1x3): void {.importc: "vst3_p64".}

func vst3q_s8*(a: ptr int8, val: Int8x16x3): void {.importc: "vst3q_s8".}

func vst3q_p8*(a: ptr Poly8, val: Poly8x16x3): void {.importc: "vst3q_p8".}

func vst3q_s16*(a: ptr int16, val: Int16x8x3): void {.importc: "vst3q_s16".}

func vst3q_p16*(a: ptr Poly16, val: Poly16x8x3): void {.importc: "vst3q_p16".}

func vst3q_s32*(a: ptr int32, val: Int32x4x3): void {.importc: "vst3q_s32".}

func vst3q_s64*(a: ptr int64, val: Int64x2x3): void {.importc: "vst3q_s64".}

func vst3q_u8*(a: ptr uint8, val: Uint8x16x3): void {.importc: "vst3q_u8".}

func vst3q_u16*(a: ptr uint16, val: Uint16x8x3): void {.importc: "vst3q_u16".}

func vst3q_u32*(a: ptr uint32, val: Uint32x4x3): void {.importc: "vst3q_u32".}

func vst3q_u64*(a: ptr uint64, val: Uint64x2x3): void {.importc: "vst3q_u64".}

func vst3q_f16*(a: ptr float16, val: Float16x8x3): void {.importc: "vst3q_f16".}

func vst3q_f32*(a: ptr float32, val: Float32x4x3): void {.importc: "vst3q_f32".}

func vst3q_f64*(a: ptr float64, val: Float64x2x3): void {.importc: "vst3q_f64".}

func vst3q_p64*(a: ptr Poly64, val: Poly64x2x3): void {.importc: "vst3q_p64".}

func vst4_s64*(a: ptr int64, val: Int64x1x4): void {.importc: "vst4_s64".}

func vst4_u64*(a: ptr uint64, val: Uint64x1x4): void {.importc: "vst4_u64".}

func vst4_f64*(a: ptr float64, val: Float64x1x4): void {.importc: "vst4_f64".}

func vst4_s8*(a: ptr int8, val: Int8x8x4): void {.importc: "vst4_s8".}

func vst4_p8*(a: ptr Poly8, val: Poly8x8x4): void {.importc: "vst4_p8".}

func vst4_s16*(a: ptr int16, val: Int16x4x4): void {.importc: "vst4_s16".}

func vst4_p16*(a: ptr Poly16, val: Poly16x4x4): void {.importc: "vst4_p16".}

func vst4_s32*(a: ptr int32, val: Int32x2x4): void {.importc: "vst4_s32".}

func vst4_u8*(a: ptr uint8, val: Uint8x8x4): void {.importc: "vst4_u8".}

func vst4_u16*(a: ptr uint16, val: Uint16x4x4): void {.importc: "vst4_u16".}

func vst4_u32*(a: ptr uint32, val: Uint32x2x4): void {.importc: "vst4_u32".}

func vst4_f16*(a: ptr float16, val: Float16x4x4): void {.importc: "vst4_f16".}

func vst4_f32*(a: ptr float32, val: Float32x2x4): void {.importc: "vst4_f32".}

func vst4_p64*(a: ptr Poly64, val: Poly64x1x4): void {.importc: "vst4_p64".}

func vst4q_s8*(a: ptr int8, val: Int8x16x4): void {.importc: "vst4q_s8".}

func vst4q_p8*(a: ptr Poly8, val: Poly8x16x4): void {.importc: "vst4q_p8".}

func vst4q_s16*(a: ptr int16, val: Int16x8x4): void {.importc: "vst4q_s16".}

func vst4q_p16*(a: ptr Poly16, val: Poly16x8x4): void {.importc: "vst4q_p16".}

func vst4q_s32*(a: ptr int32, val: Int32x4x4): void {.importc: "vst4q_s32".}

func vst4q_s64*(a: ptr int64, val: Int64x2x4): void {.importc: "vst4q_s64".}

func vst4q_u8*(a: ptr uint8, val: Uint8x16x4): void {.importc: "vst4q_u8".}

func vst4q_u16*(a: ptr uint16, val: Uint16x8x4): void {.importc: "vst4q_u16".}

func vst4q_u32*(a: ptr uint32, val: Uint32x4x4): void {.importc: "vst4q_u32".}

func vst4q_u64*(a: ptr uint64, val: Uint64x2x4): void {.importc: "vst4q_u64".}

func vst4q_f16*(a: ptr float16, val: Float16x8x4): void {.importc: "vst4q_f16".}

func vst4q_f32*(a: ptr float32, val: Float32x4x4): void {.importc: "vst4q_f32".}

func vst4q_f64*(a: ptr float64, val: Float64x2x4): void {.importc: "vst4q_f64".}

func vst4q_p64*(a: ptr Poly64, val: Poly64x2x4): void {.importc: "vst4q_p64".}

func vstrq_p128*(ptr: ptr Poly128, val: Poly128): void {.importc: "vstrq_p128".}

func vsubd_s64*(a: int64, b: int64): int64 {.importc: "vsubd_s64".}

func vsubd_u64*(a: uint64, b: uint64): uint64 {.importc: "vsubd_u64".}

func vtbx1_s8*(r: Int8x8, tab: Int8x8, idx: Int8x8): Int8x8 {.importc: "vtbx1_s8".}

func vtbx1_u8*(r: Uint8x8, tab: Uint8x8, idx: Uint8x8): Uint8x8 {.importc: "vtbx1_u8".}

func vtbx1_p8*(r: Poly8x8, tab: Poly8x8, idx: Uint8x8): Poly8x8 {.importc: "vtbx1_p8".}

func vtbx3_s8*(r: Int8x8, tab: Int8x8x3, idx: Int8x8): Int8x8 {.importc: "vtbx3_s8".}

func vtbx3_u8*(r: Uint8x8, tab: Uint8x8x3, idx: Uint8x8): Uint8x8 {.importc: "vtbx3_u8".}

func vtbx3_p8*(r: Poly8x8, tab: Poly8x8x3, idx: Uint8x8): Poly8x8 {.importc: "vtbx3_p8".}

func vtbx4_s8*(r: Int8x8, tab: Int8x8x4, idx: Int8x8): Int8x8 {.importc: "vtbx4_s8".}

func vtbx4_u8*(r: Uint8x8, tab: Uint8x8x4, idx: Uint8x8): Uint8x8 {.importc: "vtbx4_u8".}

func vtbx4_p8*(r: Poly8x8, tab: Poly8x8x4, idx: Uint8x8): Poly8x8 {.importc: "vtbx4_p8".}

func vtrn1_f16*(a: Float16x4, b: Float16x4): Float16x4 {.importc: "vtrn1_f16".}

func vtrn1_f32*(a: Float32x2, b: Float32x2): Float32x2 {.importc: "vtrn1_f32".}

func vtrn1_p8*(a: Poly8x8, b: Poly8x8): Poly8x8 {.importc: "vtrn1_p8".}

func vtrn1_p16*(a: Poly16x4, b: Poly16x4): Poly16x4 {.importc: "vtrn1_p16".}

func vtrn1_s8*(a: Int8x8, b: Int8x8): Int8x8 {.importc: "vtrn1_s8".}

func vtrn1_s16*(a: Int16x4, b: Int16x4): Int16x4 {.importc: "vtrn1_s16".}

func vtrn1_s32*(a: Int32x2, b: Int32x2): Int32x2 {.importc: "vtrn1_s32".}

func vtrn1_u8*(a: Uint8x8, b: Uint8x8): Uint8x8 {.importc: "vtrn1_u8".}

func vtrn1_u16*(a: Uint16x4, b: Uint16x4): Uint16x4 {.importc: "vtrn1_u16".}

func vtrn1_u32*(a: Uint32x2, b: Uint32x2): Uint32x2 {.importc: "vtrn1_u32".}

func vtrn1q_f16*(a: Float16x8, b: Float16x8): Float16x8 {.importc: "vtrn1q_f16".}

func vtrn1q_f32*(a: Float32x4, b: Float32x4): Float32x4 {.importc: "vtrn1q_f32".}

func vtrn1q_f64*(a: Float64x2, b: Float64x2): Float64x2 {.importc: "vtrn1q_f64".}

func vtrn1q_p8*(a: Poly8x16, b: Poly8x16): Poly8x16 {.importc: "vtrn1q_p8".}

func vtrn1q_p16*(a: Poly16x8, b: Poly16x8): Poly16x8 {.importc: "vtrn1q_p16".}

func vtrn1q_s8*(a: Int8x16, b: Int8x16): Int8x16 {.importc: "vtrn1q_s8".}

func vtrn1q_s16*(a: Int16x8, b: Int16x8): Int16x8 {.importc: "vtrn1q_s16".}

func vtrn1q_s32*(a: Int32x4, b: Int32x4): Int32x4 {.importc: "vtrn1q_s32".}

func vtrn1q_s64*(a: Int64x2, b: Int64x2): Int64x2 {.importc: "vtrn1q_s64".}

func vtrn1q_u8*(a: Uint8x16, b: Uint8x16): Uint8x16 {.importc: "vtrn1q_u8".}

func vtrn1q_u16*(a: Uint16x8, b: Uint16x8): Uint16x8 {.importc: "vtrn1q_u16".}

func vtrn1q_u32*(a: Uint32x4, b: Uint32x4): Uint32x4 {.importc: "vtrn1q_u32".}

func vtrn1q_p64*(a: Poly64x2, b: Poly64x2): Poly64x2 {.importc: "vtrn1q_p64".}

func vtrn1q_u64*(a: Uint64x2, b: Uint64x2): Uint64x2 {.importc: "vtrn1q_u64".}

func vtrn2_f16*(a: Float16x4, b: Float16x4): Float16x4 {.importc: "vtrn2_f16".}

func vtrn2_f32*(a: Float32x2, b: Float32x2): Float32x2 {.importc: "vtrn2_f32".}

func vtrn2_p8*(a: Poly8x8, b: Poly8x8): Poly8x8 {.importc: "vtrn2_p8".}

func vtrn2_p16*(a: Poly16x4, b: Poly16x4): Poly16x4 {.importc: "vtrn2_p16".}

func vtrn2_s8*(a: Int8x8, b: Int8x8): Int8x8 {.importc: "vtrn2_s8".}

func vtrn2_s16*(a: Int16x4, b: Int16x4): Int16x4 {.importc: "vtrn2_s16".}

func vtrn2_s32*(a: Int32x2, b: Int32x2): Int32x2 {.importc: "vtrn2_s32".}

func vtrn2_u8*(a: Uint8x8, b: Uint8x8): Uint8x8 {.importc: "vtrn2_u8".}

func vtrn2_u16*(a: Uint16x4, b: Uint16x4): Uint16x4 {.importc: "vtrn2_u16".}

func vtrn2_u32*(a: Uint32x2, b: Uint32x2): Uint32x2 {.importc: "vtrn2_u32".}

func vtrn2q_f16*(a: Float16x8, b: Float16x8): Float16x8 {.importc: "vtrn2q_f16".}

func vtrn2q_f32*(a: Float32x4, b: Float32x4): Float32x4 {.importc: "vtrn2q_f32".}

func vtrn2q_f64*(a: Float64x2, b: Float64x2): Float64x2 {.importc: "vtrn2q_f64".}

func vtrn2q_p8*(a: Poly8x16, b: Poly8x16): Poly8x16 {.importc: "vtrn2q_p8".}

func vtrn2q_p16*(a: Poly16x8, b: Poly16x8): Poly16x8 {.importc: "vtrn2q_p16".}

func vtrn2q_s8*(a: Int8x16, b: Int8x16): Int8x16 {.importc: "vtrn2q_s8".}

func vtrn2q_s16*(a: Int16x8, b: Int16x8): Int16x8 {.importc: "vtrn2q_s16".}

func vtrn2q_s32*(a: Int32x4, b: Int32x4): Int32x4 {.importc: "vtrn2q_s32".}

func vtrn2q_s64*(a: Int64x2, b: Int64x2): Int64x2 {.importc: "vtrn2q_s64".}

func vtrn2q_u8*(a: Uint8x16, b: Uint8x16): Uint8x16 {.importc: "vtrn2q_u8".}

func vtrn2q_u16*(a: Uint16x8, b: Uint16x8): Uint16x8 {.importc: "vtrn2q_u16".}

func vtrn2q_u32*(a: Uint32x4, b: Uint32x4): Uint32x4 {.importc: "vtrn2q_u32".}

func vtrn2q_u64*(a: Uint64x2, b: Uint64x2): Uint64x2 {.importc: "vtrn2q_u64".}

func vtrn2q_p64*(a: Poly64x2, b: Poly64x2): Poly64x2 {.importc: "vtrn2q_p64".}

func vtrn_f16*(a: Float16x4, b: Float16x4): Float16x4x2 {.importc: "vtrn_f16".}

func vtrn_f32*(a: Float32x2, b: Float32x2): Float32x2x2 {.importc: "vtrn_f32".}

func vtrn_p8*(a: Poly8x8, b: Poly8x8): Poly8x8x2 {.importc: "vtrn_p8".}

func vtrn_p16*(a: Poly16x4, b: Poly16x4): Poly16x4x2 {.importc: "vtrn_p16".}

func vtrn_s8*(a: Int8x8, b: Int8x8): Int8x8x2 {.importc: "vtrn_s8".}

func vtrn_s16*(a: Int16x4, b: Int16x4): Int16x4x2 {.importc: "vtrn_s16".}

func vtrn_s32*(a: Int32x2, b: Int32x2): Int32x2x2 {.importc: "vtrn_s32".}

func vtrn_u8*(a: Uint8x8, b: Uint8x8): Uint8x8x2 {.importc: "vtrn_u8".}

func vtrn_u16*(a: Uint16x4, b: Uint16x4): Uint16x4x2 {.importc: "vtrn_u16".}

func vtrn_u32*(a: Uint32x2, b: Uint32x2): Uint32x2x2 {.importc: "vtrn_u32".}

func vtrnq_f16*(a: Float16x8, b: Float16x8): Float16x8x2 {.importc: "vtrnq_f16".}

func vtrnq_f32*(a: Float32x4, b: Float32x4): Float32x4x2 {.importc: "vtrnq_f32".}

func vtrnq_p8*(a: Poly8x16, b: Poly8x16): Poly8x16x2 {.importc: "vtrnq_p8".}

func vtrnq_p16*(a: Poly16x8, b: Poly16x8): Poly16x8x2 {.importc: "vtrnq_p16".}

func vtrnq_s8*(a: Int8x16, b: Int8x16): Int8x16x2 {.importc: "vtrnq_s8".}

func vtrnq_s16*(a: Int16x8, b: Int16x8): Int16x8x2 {.importc: "vtrnq_s16".}

func vtrnq_s32*(a: Int32x4, b: Int32x4): Int32x4x2 {.importc: "vtrnq_s32".}

func vtrnq_u8*(a: Uint8x16, b: Uint8x16): Uint8x16x2 {.importc: "vtrnq_u8".}

func vtrnq_u16*(a: Uint16x8, b: Uint16x8): Uint16x8x2 {.importc: "vtrnq_u16".}

func vtrnq_u32*(a: Uint32x4, b: Uint32x4): Uint32x4x2 {.importc: "vtrnq_u32".}

func vtst_s8*(a: Int8x8, b: Int8x8): Uint8x8 {.importc: "vtst_s8".}

func vtst_s16*(a: Int16x4, b: Int16x4): Uint16x4 {.importc: "vtst_s16".}

func vtst_s32*(a: Int32x2, b: Int32x2): Uint32x2 {.importc: "vtst_s32".}

func vtst_s64*(a: Int64x1, b: Int64x1): Uint64x1 {.importc: "vtst_s64".}

func vtst_u8*(a: Uint8x8, b: Uint8x8): Uint8x8 {.importc: "vtst_u8".}

func vtst_u16*(a: Uint16x4, b: Uint16x4): Uint16x4 {.importc: "vtst_u16".}

func vtst_u32*(a: Uint32x2, b: Uint32x2): Uint32x2 {.importc: "vtst_u32".}

func vtst_u64*(a: Uint64x1, b: Uint64x1): Uint64x1 {.importc: "vtst_u64".}

func vtstq_s8*(a: Int8x16, b: Int8x16): Uint8x16 {.importc: "vtstq_s8".}

func vtstq_s16*(a: Int16x8, b: Int16x8): Uint16x8 {.importc: "vtstq_s16".}

func vtstq_s32*(a: Int32x4, b: Int32x4): Uint32x4 {.importc: "vtstq_s32".}

func vtstq_s64*(a: Int64x2, b: Int64x2): Uint64x2 {.importc: "vtstq_s64".}

func vtstq_u8*(a: Uint8x16, b: Uint8x16): Uint8x16 {.importc: "vtstq_u8".}

func vtstq_u16*(a: Uint16x8, b: Uint16x8): Uint16x8 {.importc: "vtstq_u16".}

func vtstq_u32*(a: Uint32x4, b: Uint32x4): Uint32x4 {.importc: "vtstq_u32".}

func vtstq_u64*(a: Uint64x2, b: Uint64x2): Uint64x2 {.importc: "vtstq_u64".}

func vtstd_s64*(a: int64, b: int64): uint64 {.importc: "vtstd_s64".}

func vtstd_u64*(a: uint64, b: uint64): uint64 {.importc: "vtstd_u64".}

func vuqadd_s8*(a: Int8x8, b: Uint8x8): Int8x8 {.importc: "vuqadd_s8".}

func vuqadd_s16*(a: Int16x4, b: Uint16x4): Int16x4 {.importc: "vuqadd_s16".}

func vuqadd_s32*(a: Int32x2, b: Uint32x2): Int32x2 {.importc: "vuqadd_s32".}

func vuqadd_s64*(a: Int64x1, b: Uint64x1): Int64x1 {.importc: "vuqadd_s64".}

func vuqaddq_s8*(a: Int8x16, b: Uint8x16): Int8x16 {.importc: "vuqaddq_s8".}

func vuqaddq_s16*(a: Int16x8, b: Uint16x8): Int16x8 {.importc: "vuqaddq_s16".}

func vuqaddq_s32*(a: Int32x4, b: Uint32x4): Int32x4 {.importc: "vuqaddq_s32".}

func vuqaddq_s64*(a: Int64x2, b: Uint64x2): Int64x2 {.importc: "vuqaddq_s64".}

func vuqaddb_s8*(a: int8, b: uint8): int8 {.importc: "vuqaddb_s8".}

func vuqaddh_s16*(a: int16, b: uint16): int16 {.importc: "vuqaddh_s16".}

func vuqadds_s32*(a: int32, b: uint32): int32 {.importc: "vuqadds_s32".}

func vuqaddd_s64*(a: int64, b: uint64): int64 {.importc: "vuqaddd_s64".}

## [Macro Original]
## #define __DEFINTERLEAVE(op, rettype, intype, funcsuffix, Q) 		\
## __extension__ extern __inline rettype					\
## __attribute__ ((__always_inline__, __gnu_inline__, __artificial__)) \
## v ## op ## Q ## _ ## funcsuffix (intype a, intype b)			\
## {									\
## return (rettype) {v ## op ## 1 ## Q ## _ ## funcsuffix (a, b),	\
## v ## op ## 2 ## Q ## _ ## funcsuffix (a, b)};	\
## }

## [Macro Original]
## #define __INTERLEAVE_LIST(op)					\
## __DEFINTERLEAVE (op, float16x4x2_t, float16x4_t, f16,)	\
## __DEFINTERLEAVE (op, float32x2x2_t, float32x2_t, f32,)	\
## __DEFINTERLEAVE (op, poly8x8x2_t, poly8x8_t, p8,)		\
## __DEFINTERLEAVE (op, poly16x4x2_t, poly16x4_t, p16,)		\
## __DEFINTERLEAVE (op, int8x8x2_t, int8x8_t, s8,)		\
## __DEFINTERLEAVE (op, int16x4x2_t, int16x4_t, s16,)		\
## __DEFINTERLEAVE (op, int32x2x2_t, int32x2_t, s32,)		\
## __DEFINTERLEAVE (op, uint8x8x2_t, uint8x8_t, u8,)		\
## __DEFINTERLEAVE (op, uint16x4x2_t, uint16x4_t, u16,)		\
## __DEFINTERLEAVE (op, uint32x2x2_t, uint32x2_t, u32,)		\
## __DEFINTERLEAVE (op, float16x8x2_t, float16x8_t, f16, q)	\
## __DEFINTERLEAVE (op, float32x4x2_t, float32x4_t, f32, q)	\
## __DEFINTERLEAVE (op, poly8x16x2_t, poly8x16_t, p8, q)		\
## __DEFINTERLEAVE (op, poly16x8x2_t, poly16x8_t, p16, q)	\
## __DEFINTERLEAVE (op, int8x16x2_t, int8x16_t, s8, q)		\
## __DEFINTERLEAVE (op, int16x8x2_t, int16x8_t, s16, q)		\
## __DEFINTERLEAVE (op, int32x4x2_t, int32x4_t, s32, q)		\
## __DEFINTERLEAVE (op, uint8x16x2_t, uint8x16_t, u8, q)		\
## __DEFINTERLEAVE (op, uint16x8x2_t, uint16x8_t, u16, q)	\
## __DEFINTERLEAVE (op, uint32x4x2_t, uint32x4_t, u32, q)

func vuzp1_f16*(a: Float16x4, b: Float16x4): Float16x4 {.importc: "vuzp1_f16".}

func vuzp1_f32*(a: Float32x2, b: Float32x2): Float32x2 {.importc: "vuzp1_f32".}

func vuzp1_p8*(a: Poly8x8, b: Poly8x8): Poly8x8 {.importc: "vuzp1_p8".}

func vuzp1_p16*(a: Poly16x4, b: Poly16x4): Poly16x4 {.importc: "vuzp1_p16".}

func vuzp1_s8*(a: Int8x8, b: Int8x8): Int8x8 {.importc: "vuzp1_s8".}

func vuzp1_s16*(a: Int16x4, b: Int16x4): Int16x4 {.importc: "vuzp1_s16".}

func vuzp1_s32*(a: Int32x2, b: Int32x2): Int32x2 {.importc: "vuzp1_s32".}

func vuzp1_u8*(a: Uint8x8, b: Uint8x8): Uint8x8 {.importc: "vuzp1_u8".}

func vuzp1_u16*(a: Uint16x4, b: Uint16x4): Uint16x4 {.importc: "vuzp1_u16".}

func vuzp1_u32*(a: Uint32x2, b: Uint32x2): Uint32x2 {.importc: "vuzp1_u32".}

func vuzp1q_f16*(a: Float16x8, b: Float16x8): Float16x8 {.importc: "vuzp1q_f16".}

func vuzp1q_f32*(a: Float32x4, b: Float32x4): Float32x4 {.importc: "vuzp1q_f32".}

func vuzp1q_f64*(a: Float64x2, b: Float64x2): Float64x2 {.importc: "vuzp1q_f64".}

func vuzp1q_p8*(a: Poly8x16, b: Poly8x16): Poly8x16 {.importc: "vuzp1q_p8".}

func vuzp1q_p16*(a: Poly16x8, b: Poly16x8): Poly16x8 {.importc: "vuzp1q_p16".}

func vuzp1q_s8*(a: Int8x16, b: Int8x16): Int8x16 {.importc: "vuzp1q_s8".}

func vuzp1q_s16*(a: Int16x8, b: Int16x8): Int16x8 {.importc: "vuzp1q_s16".}

func vuzp1q_s32*(a: Int32x4, b: Int32x4): Int32x4 {.importc: "vuzp1q_s32".}

func vuzp1q_s64*(a: Int64x2, b: Int64x2): Int64x2 {.importc: "vuzp1q_s64".}

func vuzp1q_u8*(a: Uint8x16, b: Uint8x16): Uint8x16 {.importc: "vuzp1q_u8".}

func vuzp1q_u16*(a: Uint16x8, b: Uint16x8): Uint16x8 {.importc: "vuzp1q_u16".}

func vuzp1q_u32*(a: Uint32x4, b: Uint32x4): Uint32x4 {.importc: "vuzp1q_u32".}

func vuzp1q_u64*(a: Uint64x2, b: Uint64x2): Uint64x2 {.importc: "vuzp1q_u64".}

func vuzp1q_p64*(a: Poly64x2, b: Poly64x2): Poly64x2 {.importc: "vuzp1q_p64".}

func vuzp2_f16*(a: Float16x4, b: Float16x4): Float16x4 {.importc: "vuzp2_f16".}

func vuzp2_f32*(a: Float32x2, b: Float32x2): Float32x2 {.importc: "vuzp2_f32".}

func vuzp2_p8*(a: Poly8x8, b: Poly8x8): Poly8x8 {.importc: "vuzp2_p8".}

func vuzp2_p16*(a: Poly16x4, b: Poly16x4): Poly16x4 {.importc: "vuzp2_p16".}

func vuzp2_s8*(a: Int8x8, b: Int8x8): Int8x8 {.importc: "vuzp2_s8".}

func vuzp2_s16*(a: Int16x4, b: Int16x4): Int16x4 {.importc: "vuzp2_s16".}

func vuzp2_s32*(a: Int32x2, b: Int32x2): Int32x2 {.importc: "vuzp2_s32".}

func vuzp2_u8*(a: Uint8x8, b: Uint8x8): Uint8x8 {.importc: "vuzp2_u8".}

func vuzp2_u16*(a: Uint16x4, b: Uint16x4): Uint16x4 {.importc: "vuzp2_u16".}

func vuzp2_u32*(a: Uint32x2, b: Uint32x2): Uint32x2 {.importc: "vuzp2_u32".}

func vuzp2q_f16*(a: Float16x8, b: Float16x8): Float16x8 {.importc: "vuzp2q_f16".}

func vuzp2q_f32*(a: Float32x4, b: Float32x4): Float32x4 {.importc: "vuzp2q_f32".}

func vuzp2q_f64*(a: Float64x2, b: Float64x2): Float64x2 {.importc: "vuzp2q_f64".}

func vuzp2q_p8*(a: Poly8x16, b: Poly8x16): Poly8x16 {.importc: "vuzp2q_p8".}

func vuzp2q_p16*(a: Poly16x8, b: Poly16x8): Poly16x8 {.importc: "vuzp2q_p16".}

func vuzp2q_s8*(a: Int8x16, b: Int8x16): Int8x16 {.importc: "vuzp2q_s8".}

func vuzp2q_s16*(a: Int16x8, b: Int16x8): Int16x8 {.importc: "vuzp2q_s16".}

func vuzp2q_s32*(a: Int32x4, b: Int32x4): Int32x4 {.importc: "vuzp2q_s32".}

func vuzp2q_s64*(a: Int64x2, b: Int64x2): Int64x2 {.importc: "vuzp2q_s64".}

func vuzp2q_u8*(a: Uint8x16, b: Uint8x16): Uint8x16 {.importc: "vuzp2q_u8".}

func vuzp2q_u16*(a: Uint16x8, b: Uint16x8): Uint16x8 {.importc: "vuzp2q_u16".}

func vuzp2q_u32*(a: Uint32x4, b: Uint32x4): Uint32x4 {.importc: "vuzp2q_u32".}

func vuzp2q_u64*(a: Uint64x2, b: Uint64x2): Uint64x2 {.importc: "vuzp2q_u64".}

func vuzp2q_p64*(a: Poly64x2, b: Poly64x2): Poly64x2 {.importc: "vuzp2q_p64".}

func vzip1_f16*(a: Float16x4, b: Float16x4): Float16x4 {.importc: "vzip1_f16".}

func vzip1_f32*(a: Float32x2, b: Float32x2): Float32x2 {.importc: "vzip1_f32".}

func vzip1_p8*(a: Poly8x8, b: Poly8x8): Poly8x8 {.importc: "vzip1_p8".}

func vzip1_p16*(a: Poly16x4, b: Poly16x4): Poly16x4 {.importc: "vzip1_p16".}

func vzip1_s8*(a: Int8x8, b: Int8x8): Int8x8 {.importc: "vzip1_s8".}

func vzip1_s16*(a: Int16x4, b: Int16x4): Int16x4 {.importc: "vzip1_s16".}

func vzip1_s32*(a: Int32x2, b: Int32x2): Int32x2 {.importc: "vzip1_s32".}

func vzip1_u8*(a: Uint8x8, b: Uint8x8): Uint8x8 {.importc: "vzip1_u8".}

func vzip1_u16*(a: Uint16x4, b: Uint16x4): Uint16x4 {.importc: "vzip1_u16".}

func vzip1_u32*(a: Uint32x2, b: Uint32x2): Uint32x2 {.importc: "vzip1_u32".}

func vzip1q_f16*(a: Float16x8, b: Float16x8): Float16x8 {.importc: "vzip1q_f16".}

func vzip1q_f32*(a: Float32x4, b: Float32x4): Float32x4 {.importc: "vzip1q_f32".}

func vzip1q_f64*(a: Float64x2, b: Float64x2): Float64x2 {.importc: "vzip1q_f64".}

func vzip1q_p8*(a: Poly8x16, b: Poly8x16): Poly8x16 {.importc: "vzip1q_p8".}

func vzip1q_p16*(a: Poly16x8, b: Poly16x8): Poly16x8 {.importc: "vzip1q_p16".}

func vzip1q_s8*(a: Int8x16, b: Int8x16): Int8x16 {.importc: "vzip1q_s8".}

func vzip1q_s16*(a: Int16x8, b: Int16x8): Int16x8 {.importc: "vzip1q_s16".}

func vzip1q_s32*(a: Int32x4, b: Int32x4): Int32x4 {.importc: "vzip1q_s32".}

func vzip1q_s64*(a: Int64x2, b: Int64x2): Int64x2 {.importc: "vzip1q_s64".}

func vzip1q_u8*(a: Uint8x16, b: Uint8x16): Uint8x16 {.importc: "vzip1q_u8".}

func vzip1q_u16*(a: Uint16x8, b: Uint16x8): Uint16x8 {.importc: "vzip1q_u16".}

func vzip1q_u32*(a: Uint32x4, b: Uint32x4): Uint32x4 {.importc: "vzip1q_u32".}

func vzip1q_u64*(a: Uint64x2, b: Uint64x2): Uint64x2 {.importc: "vzip1q_u64".}

func vzip1q_p64*(a: Poly64x2, b: Poly64x2): Poly64x2 {.importc: "vzip1q_p64".}

func vzip2_f16*(a: Float16x4, b: Float16x4): Float16x4 {.importc: "vzip2_f16".}

func vzip2_f32*(a: Float32x2, b: Float32x2): Float32x2 {.importc: "vzip2_f32".}

func vzip2_p8*(a: Poly8x8, b: Poly8x8): Poly8x8 {.importc: "vzip2_p8".}

func vzip2_p16*(a: Poly16x4, b: Poly16x4): Poly16x4 {.importc: "vzip2_p16".}

func vzip2_s8*(a: Int8x8, b: Int8x8): Int8x8 {.importc: "vzip2_s8".}

func vzip2_s16*(a: Int16x4, b: Int16x4): Int16x4 {.importc: "vzip2_s16".}

func vzip2_s32*(a: Int32x2, b: Int32x2): Int32x2 {.importc: "vzip2_s32".}

func vzip2_u8*(a: Uint8x8, b: Uint8x8): Uint8x8 {.importc: "vzip2_u8".}

func vzip2_u16*(a: Uint16x4, b: Uint16x4): Uint16x4 {.importc: "vzip2_u16".}

func vzip2_u32*(a: Uint32x2, b: Uint32x2): Uint32x2 {.importc: "vzip2_u32".}

func vzip2q_f16*(a: Float16x8, b: Float16x8): Float16x8 {.importc: "vzip2q_f16".}

func vzip2q_f32*(a: Float32x4, b: Float32x4): Float32x4 {.importc: "vzip2q_f32".}

func vzip2q_f64*(a: Float64x2, b: Float64x2): Float64x2 {.importc: "vzip2q_f64".}

func vzip2q_p8*(a: Poly8x16, b: Poly8x16): Poly8x16 {.importc: "vzip2q_p8".}

func vzip2q_p16*(a: Poly16x8, b: Poly16x8): Poly16x8 {.importc: "vzip2q_p16".}

func vzip2q_s8*(a: Int8x16, b: Int8x16): Int8x16 {.importc: "vzip2q_s8".}

func vzip2q_s16*(a: Int16x8, b: Int16x8): Int16x8 {.importc: "vzip2q_s16".}

func vzip2q_s32*(a: Int32x4, b: Int32x4): Int32x4 {.importc: "vzip2q_s32".}

func vzip2q_s64*(a: Int64x2, b: Int64x2): Int64x2 {.importc: "vzip2q_s64".}

func vzip2q_u8*(a: Uint8x16, b: Uint8x16): Uint8x16 {.importc: "vzip2q_u8".}

func vzip2q_u16*(a: Uint16x8, b: Uint16x8): Uint16x8 {.importc: "vzip2q_u16".}

func vzip2q_u32*(a: Uint32x4, b: Uint32x4): Uint32x4 {.importc: "vzip2q_u32".}

func vzip2q_u64*(a: Uint64x2, b: Uint64x2): Uint64x2 {.importc: "vzip2q_u64".}

func vzip2q_p64*(a: Poly64x2, b: Poly64x2): Poly64x2 {.importc: "vzip2q_p64".}

func vabs_f16*(a: Float16x4): Float16x4 {.importc: "vabs_f16".}

func vabsq_f16*(a: Float16x8): Float16x8 {.importc: "vabsq_f16".}

func vceqz_f16*(a: Float16x4): Uint16x4 {.importc: "vceqz_f16".}

func vceqzq_f16*(a: Float16x8): Uint16x8 {.importc: "vceqzq_f16".}

func vcgez_f16*(a: Float16x4): Uint16x4 {.importc: "vcgez_f16".}

func vcgezq_f16*(a: Float16x8): Uint16x8 {.importc: "vcgezq_f16".}

func vcgtz_f16*(a: Float16x4): Uint16x4 {.importc: "vcgtz_f16".}

func vcgtzq_f16*(a: Float16x8): Uint16x8 {.importc: "vcgtzq_f16".}

func vclez_f16*(a: Float16x4): Uint16x4 {.importc: "vclez_f16".}

func vclezq_f16*(a: Float16x8): Uint16x8 {.importc: "vclezq_f16".}

func vcltz_f16*(a: Float16x4): Uint16x4 {.importc: "vcltz_f16".}

func vcltzq_f16*(a: Float16x8): Uint16x8 {.importc: "vcltzq_f16".}

func vcvt_f16_s16*(a: Int16x4): Float16x4 {.importc: "vcvt_f16_s16".}

func vcvtq_f16_s16*(a: Int16x8): Float16x8 {.importc: "vcvtq_f16_s16".}

func vcvt_f16_u16*(a: Uint16x4): Float16x4 {.importc: "vcvt_f16_u16".}

func vcvtq_f16_u16*(a: Uint16x8): Float16x8 {.importc: "vcvtq_f16_u16".}

func vcvt_s16_f16*(a: Float16x4): Int16x4 {.importc: "vcvt_s16_f16".}

func vcvtq_s16_f16*(a: Float16x8): Int16x8 {.importc: "vcvtq_s16_f16".}

func vcvt_u16_f16*(a: Float16x4): Uint16x4 {.importc: "vcvt_u16_f16".}

func vcvtq_u16_f16*(a: Float16x8): Uint16x8 {.importc: "vcvtq_u16_f16".}

func vcvta_s16_f16*(a: Float16x4): Int16x4 {.importc: "vcvta_s16_f16".}

func vcvtaq_s16_f16*(a: Float16x8): Int16x8 {.importc: "vcvtaq_s16_f16".}

func vcvta_u16_f16*(a: Float16x4): Uint16x4 {.importc: "vcvta_u16_f16".}

func vcvtaq_u16_f16*(a: Float16x8): Uint16x8 {.importc: "vcvtaq_u16_f16".}

func vcvtm_s16_f16*(a: Float16x4): Int16x4 {.importc: "vcvtm_s16_f16".}

func vcvtmq_s16_f16*(a: Float16x8): Int16x8 {.importc: "vcvtmq_s16_f16".}

func vcvtm_u16_f16*(a: Float16x4): Uint16x4 {.importc: "vcvtm_u16_f16".}

func vcvtmq_u16_f16*(a: Float16x8): Uint16x8 {.importc: "vcvtmq_u16_f16".}

func vcvtn_s16_f16*(a: Float16x4): Int16x4 {.importc: "vcvtn_s16_f16".}

func vcvtnq_s16_f16*(a: Float16x8): Int16x8 {.importc: "vcvtnq_s16_f16".}

func vcvtn_u16_f16*(a: Float16x4): Uint16x4 {.importc: "vcvtn_u16_f16".}

func vcvtnq_u16_f16*(a: Float16x8): Uint16x8 {.importc: "vcvtnq_u16_f16".}

func vcvtp_s16_f16*(a: Float16x4): Int16x4 {.importc: "vcvtp_s16_f16".}

func vcvtpq_s16_f16*(a: Float16x8): Int16x8 {.importc: "vcvtpq_s16_f16".}

func vcvtp_u16_f16*(a: Float16x4): Uint16x4 {.importc: "vcvtp_u16_f16".}

func vcvtpq_u16_f16*(a: Float16x8): Uint16x8 {.importc: "vcvtpq_u16_f16".}

func vneg_f16*(a: Float16x4): Float16x4 {.importc: "vneg_f16".}

func vnegq_f16*(a: Float16x8): Float16x8 {.importc: "vnegq_f16".}

func vrecpe_f16*(a: Float16x4): Float16x4 {.importc: "vrecpe_f16".}

func vrecpeq_f16*(a: Float16x8): Float16x8 {.importc: "vrecpeq_f16".}

func vrnd_f16*(a: Float16x4): Float16x4 {.importc: "vrnd_f16".}

func vrndq_f16*(a: Float16x8): Float16x8 {.importc: "vrndq_f16".}

func vrnda_f16*(a: Float16x4): Float16x4 {.importc: "vrnda_f16".}

func vrndaq_f16*(a: Float16x8): Float16x8 {.importc: "vrndaq_f16".}

func vrndi_f16*(a: Float16x4): Float16x4 {.importc: "vrndi_f16".}

func vrndiq_f16*(a: Float16x8): Float16x8 {.importc: "vrndiq_f16".}

func vrndm_f16*(a: Float16x4): Float16x4 {.importc: "vrndm_f16".}

func vrndmq_f16*(a: Float16x8): Float16x8 {.importc: "vrndmq_f16".}

func vrndn_f16*(a: Float16x4): Float16x4 {.importc: "vrndn_f16".}

func vrndnq_f16*(a: Float16x8): Float16x8 {.importc: "vrndnq_f16".}

func vrndp_f16*(a: Float16x4): Float16x4 {.importc: "vrndp_f16".}

func vrndpq_f16*(a: Float16x8): Float16x8 {.importc: "vrndpq_f16".}

func vrndx_f16*(a: Float16x4): Float16x4 {.importc: "vrndx_f16".}

func vrndxq_f16*(a: Float16x8): Float16x8 {.importc: "vrndxq_f16".}

func vrsqrte_f16*(a: Float16x4): Float16x4 {.importc: "vrsqrte_f16".}

func vrsqrteq_f16*(a: Float16x8): Float16x8 {.importc: "vrsqrteq_f16".}

func vsqrt_f16*(a: Float16x4): Float16x4 {.importc: "vsqrt_f16".}

func vsqrtq_f16*(a: Float16x8): Float16x8 {.importc: "vsqrtq_f16".}

func vadd_f16*(a: Float16x4, b: Float16x4): Float16x4 {.importc: "vadd_f16".}

func vaddq_f16*(a: Float16x8, b: Float16x8): Float16x8 {.importc: "vaddq_f16".}

func vabd_f16*(a: Float16x4, b: Float16x4): Float16x4 {.importc: "vabd_f16".}

func vabdq_f16*(a: Float16x8, b: Float16x8): Float16x8 {.importc: "vabdq_f16".}

func vcage_f16*(a: Float16x4, b: Float16x4): Uint16x4 {.importc: "vcage_f16".}

func vcageq_f16*(a: Float16x8, b: Float16x8): Uint16x8 {.importc: "vcageq_f16".}

func vcagt_f16*(a: Float16x4, b: Float16x4): Uint16x4 {.importc: "vcagt_f16".}

func vcagtq_f16*(a: Float16x8, b: Float16x8): Uint16x8 {.importc: "vcagtq_f16".}

func vcale_f16*(a: Float16x4, b: Float16x4): Uint16x4 {.importc: "vcale_f16".}

func vcaleq_f16*(a: Float16x8, b: Float16x8): Uint16x8 {.importc: "vcaleq_f16".}

func vcalt_f16*(a: Float16x4, b: Float16x4): Uint16x4 {.importc: "vcalt_f16".}

func vcaltq_f16*(a: Float16x8, b: Float16x8): Uint16x8 {.importc: "vcaltq_f16".}

func vceq_f16*(a: Float16x4, b: Float16x4): Uint16x4 {.importc: "vceq_f16".}

func vceqq_f16*(a: Float16x8, b: Float16x8): Uint16x8 {.importc: "vceqq_f16".}

func vcge_f16*(a: Float16x4, b: Float16x4): Uint16x4 {.importc: "vcge_f16".}

func vcgeq_f16*(a: Float16x8, b: Float16x8): Uint16x8 {.importc: "vcgeq_f16".}

func vcgt_f16*(a: Float16x4, b: Float16x4): Uint16x4 {.importc: "vcgt_f16".}

func vcgtq_f16*(a: Float16x8, b: Float16x8): Uint16x8 {.importc: "vcgtq_f16".}

func vcle_f16*(a: Float16x4, b: Float16x4): Uint16x4 {.importc: "vcle_f16".}

func vcleq_f16*(a: Float16x8, b: Float16x8): Uint16x8 {.importc: "vcleq_f16".}

func vclt_f16*(a: Float16x4, b: Float16x4): Uint16x4 {.importc: "vclt_f16".}

func vcltq_f16*(a: Float16x8, b: Float16x8): Uint16x8 {.importc: "vcltq_f16".}

func vcvt_n_f16_s16*(a: Int16x4, b: int32): Float16x4 {.importc: "vcvt_n_f16_s16".}

func vcvtq_n_f16_s16*(a: Int16x8, b: int32): Float16x8 {.importc: "vcvtq_n_f16_s16".}

func vcvt_n_f16_u16*(a: Uint16x4, b: int32): Float16x4 {.importc: "vcvt_n_f16_u16".}

func vcvtq_n_f16_u16*(a: Uint16x8, b: int32): Float16x8 {.importc: "vcvtq_n_f16_u16".}

func vcvt_n_s16_f16*(a: Float16x4, b: int32): Int16x4 {.importc: "vcvt_n_s16_f16".}

func vcvtq_n_s16_f16*(a: Float16x8, b: int32): Int16x8 {.importc: "vcvtq_n_s16_f16".}

func vcvt_n_u16_f16*(a: Float16x4, b: int32): Uint16x4 {.importc: "vcvt_n_u16_f16".}

func vcvtq_n_u16_f16*(a: Float16x8, b: int32): Uint16x8 {.importc: "vcvtq_n_u16_f16".}

func vdiv_f16*(a: Float16x4, b: Float16x4): Float16x4 {.importc: "vdiv_f16".}

func vdivq_f16*(a: Float16x8, b: Float16x8): Float16x8 {.importc: "vdivq_f16".}

func vmax_f16*(a: Float16x4, b: Float16x4): Float16x4 {.importc: "vmax_f16".}

func vmaxq_f16*(a: Float16x8, b: Float16x8): Float16x8 {.importc: "vmaxq_f16".}

func vmaxnm_f16*(a: Float16x4, b: Float16x4): Float16x4 {.importc: "vmaxnm_f16".}

func vmaxnmq_f16*(a: Float16x8, b: Float16x8): Float16x8 {.importc: "vmaxnmq_f16".}

func vmin_f16*(a: Float16x4, b: Float16x4): Float16x4 {.importc: "vmin_f16".}

func vminq_f16*(a: Float16x8, b: Float16x8): Float16x8 {.importc: "vminq_f16".}

func vminnm_f16*(a: Float16x4, b: Float16x4): Float16x4 {.importc: "vminnm_f16".}

func vminnmq_f16*(a: Float16x8, b: Float16x8): Float16x8 {.importc: "vminnmq_f16".}

func vmul_f16*(a: Float16x4, b: Float16x4): Float16x4 {.importc: "vmul_f16".}

func vmulq_f16*(a: Float16x8, b: Float16x8): Float16x8 {.importc: "vmulq_f16".}

func vmulx_f16*(a: Float16x4, b: Float16x4): Float16x4 {.importc: "vmulx_f16".}

func vmulxq_f16*(a: Float16x8, b: Float16x8): Float16x8 {.importc: "vmulxq_f16".}

func vpadd_f16*(a: Float16x4, b: Float16x4): Float16x4 {.importc: "vpadd_f16".}

func vpaddq_f16*(a: Float16x8, b: Float16x8): Float16x8 {.importc: "vpaddq_f16".}

func vpmax_f16*(a: Float16x4, b: Float16x4): Float16x4 {.importc: "vpmax_f16".}

func vpmaxq_f16*(a: Float16x8, b: Float16x8): Float16x8 {.importc: "vpmaxq_f16".}

func vpmaxnm_f16*(a: Float16x4, b: Float16x4): Float16x4 {.importc: "vpmaxnm_f16".}

func vpmaxnmq_f16*(a: Float16x8, b: Float16x8): Float16x8 {.importc: "vpmaxnmq_f16".}

func vpmin_f16*(a: Float16x4, b: Float16x4): Float16x4 {.importc: "vpmin_f16".}

func vpminq_f16*(a: Float16x8, b: Float16x8): Float16x8 {.importc: "vpminq_f16".}

func vpminnm_f16*(a: Float16x4, b: Float16x4): Float16x4 {.importc: "vpminnm_f16".}

func vpminnmq_f16*(a: Float16x8, b: Float16x8): Float16x8 {.importc: "vpminnmq_f16".}

func vrecps_f16*(a: Float16x4, b: Float16x4): Float16x4 {.importc: "vrecps_f16".}

func vrecpsq_f16*(a: Float16x8, b: Float16x8): Float16x8 {.importc: "vrecpsq_f16".}

func vrsqrts_f16*(a: Float16x4, b: Float16x4): Float16x4 {.importc: "vrsqrts_f16".}

func vrsqrtsq_f16*(a: Float16x8, b: Float16x8): Float16x8 {.importc: "vrsqrtsq_f16".}

func vsub_f16*(a: Float16x4, b: Float16x4): Float16x4 {.importc: "vsub_f16".}

func vsubq_f16*(a: Float16x8, b: Float16x8): Float16x8 {.importc: "vsubq_f16".}

func vfma_f16*(a: Float16x4, b: Float16x4, c: Float16x4): Float16x4 {.importc: "vfma_f16".}

func vfmaq_f16*(a: Float16x8, b: Float16x8, c: Float16x8): Float16x8 {.importc: "vfmaq_f16".}

func vfms_f16*(a: Float16x4, b: Float16x4, c: Float16x4): Float16x4 {.importc: "vfms_f16".}

func vfmsq_f16*(a: Float16x8, b: Float16x8, c: Float16x8): Float16x8 {.importc: "vfmsq_f16".}

func vfmah_lane_f16*(a: float16, b: float16, c: Float16x4, lane: int32): float16 {.importc: "vfmah_lane_f16".}

func vfmah_laneq_f16*(a: float16, b: float16, c: Float16x8, lane: int32): float16 {.importc: "vfmah_laneq_f16".}

func vfma_lane_f16*(a: Float16x4, b: Float16x4, c: Float16x4, lane: int32): Float16x4 {.importc: "vfma_lane_f16".}

func vfmaq_lane_f16*(a: Float16x8, b: Float16x8, c: Float16x4, lane: int32): Float16x8 {.importc: "vfmaq_lane_f16".}

func vfma_laneq_f16*(a: Float16x4, b: Float16x4, c: Float16x8, lane: int32): Float16x4 {.importc: "vfma_laneq_f16".}

func vfmaq_laneq_f16*(a: Float16x8, b: Float16x8, c: Float16x8, lane: int32): Float16x8 {.importc: "vfmaq_laneq_f16".}

func vfma_n_f16*(a: Float16x4, b: Float16x4, c: float16): Float16x4 {.importc: "vfma_n_f16".}

func vfmaq_n_f16*(a: Float16x8, b: Float16x8, c: float16): Float16x8 {.importc: "vfmaq_n_f16".}

func vfmsh_lane_f16*(a: float16, b: float16, c: Float16x4, lane: int32): float16 {.importc: "vfmsh_lane_f16".}

func vfmsh_laneq_f16*(a: float16, b: float16, c: Float16x8, lane: int32): float16 {.importc: "vfmsh_laneq_f16".}

func vfms_lane_f16*(a: Float16x4, b: Float16x4, c: Float16x4, lane: int32): Float16x4 {.importc: "vfms_lane_f16".}

func vfmsq_lane_f16*(a: Float16x8, b: Float16x8, c: Float16x4, lane: int32): Float16x8 {.importc: "vfmsq_lane_f16".}

func vfms_laneq_f16*(a: Float16x4, b: Float16x4, c: Float16x8, lane: int32): Float16x4 {.importc: "vfms_laneq_f16".}

func vfmsq_laneq_f16*(a: Float16x8, b: Float16x8, c: Float16x8, lane: int32): Float16x8 {.importc: "vfmsq_laneq_f16".}

func vfms_n_f16*(a: Float16x4, b: Float16x4, c: float16): Float16x4 {.importc: "vfms_n_f16".}

func vfmsq_n_f16*(a: Float16x8, b: Float16x8, c: float16): Float16x8 {.importc: "vfmsq_n_f16".}

func vmulh_lane_f16*(a: float16, b: Float16x4, lane: int32): float16 {.importc: "vmulh_lane_f16".}

func vmul_lane_f16*(a: Float16x4, b: Float16x4, lane: int32): Float16x4 {.importc: "vmul_lane_f16".}

func vmulq_lane_f16*(a: Float16x8, b: Float16x4, lane: int32): Float16x8 {.importc: "vmulq_lane_f16".}

func vmulh_laneq_f16*(a: float16, b: Float16x8, lane: int32): float16 {.importc: "vmulh_laneq_f16".}

func vmul_laneq_f16*(a: Float16x4, b: Float16x8, lane: int32): Float16x4 {.importc: "vmul_laneq_f16".}

func vmulq_laneq_f16*(a: Float16x8, b: Float16x8, lane: int32): Float16x8 {.importc: "vmulq_laneq_f16".}

func vmul_n_f16*(a: Float16x4, b: float16): Float16x4 {.importc: "vmul_n_f16".}

func vmulq_n_f16*(a: Float16x8, b: float16): Float16x8 {.importc: "vmulq_n_f16".}

func vmulxh_lane_f16*(a: float16, b: Float16x4, lane: int32): float16 {.importc: "vmulxh_lane_f16".}

func vmulx_lane_f16*(a: Float16x4, b: Float16x4, lane: int32): Float16x4 {.importc: "vmulx_lane_f16".}

func vmulxq_lane_f16*(a: Float16x8, b: Float16x4, lane: int32): Float16x8 {.importc: "vmulxq_lane_f16".}

func vmulxh_laneq_f16*(a: float16, b: Float16x8, lane: int32): float16 {.importc: "vmulxh_laneq_f16".}

func vmulx_laneq_f16*(a: Float16x4, b: Float16x8, lane: int32): Float16x4 {.importc: "vmulx_laneq_f16".}

func vmulxq_laneq_f16*(a: Float16x8, b: Float16x8, lane: int32): Float16x8 {.importc: "vmulxq_laneq_f16".}

func vmulx_n_f16*(a: Float16x4, b: float16): Float16x4 {.importc: "vmulx_n_f16".}

func vmulxq_n_f16*(a: Float16x8, b: float16): Float16x8 {.importc: "vmulxq_n_f16".}

func vmaxv_f16*(a: Float16x4): float16 {.importc: "vmaxv_f16".}

func vmaxvq_f16*(a: Float16x8): float16 {.importc: "vmaxvq_f16".}

func vminv_f16*(a: Float16x4): float16 {.importc: "vminv_f16".}

func vminvq_f16*(a: Float16x8): float16 {.importc: "vminvq_f16".}

func vmaxnmv_f16*(a: Float16x4): float16 {.importc: "vmaxnmv_f16".}

func vmaxnmvq_f16*(a: Float16x8): float16 {.importc: "vmaxnmvq_f16".}

func vminnmv_f16*(a: Float16x4): float16 {.importc: "vminnmv_f16".}

func vminnmvq_f16*(a: Float16x8): float16 {.importc: "vminnmvq_f16".}

func vdot_u32*(r: Uint32x2, a: Uint8x8, b: Uint8x8): Uint32x2 {.importc: "vdot_u32".}

func vdotq_u32*(r: Uint32x4, a: Uint8x16, b: Uint8x16): Uint32x4 {.importc: "vdotq_u32".}

func vdot_s32*(r: Int32x2, a: Int8x8, b: Int8x8): Int32x2 {.importc: "vdot_s32".}

func vdotq_s32*(r: Int32x4, a: Int8x16, b: Int8x16): Int32x4 {.importc: "vdotq_s32".}

func vdot_lane_u32*(r: Uint32x2, a: Uint8x8, b: Uint8x8, index: int32): Uint32x2 {.importc: "vdot_lane_u32".}

func vdot_laneq_u32*(r: Uint32x2, a: Uint8x8, b: Uint8x16, index: int32): Uint32x2 {.importc: "vdot_laneq_u32".}

func vdotq_lane_u32*(r: Uint32x4, a: Uint8x16, b: Uint8x8, index: int32): Uint32x4 {.importc: "vdotq_lane_u32".}

func vdotq_laneq_u32*(r: Uint32x4, a: Uint8x16, b: Uint8x16, index: int32): Uint32x4 {.importc: "vdotq_laneq_u32".}

func vdot_lane_s32*(r: Int32x2, a: Int8x8, b: Int8x8, index: int32): Int32x2 {.importc: "vdot_lane_s32".}

func vdot_laneq_s32*(r: Int32x2, a: Int8x8, b: Int8x16, index: int32): Int32x2 {.importc: "vdot_laneq_s32".}

func vdotq_lane_s32*(r: Int32x4, a: Int8x16, b: Int8x8, index: int32): Int32x4 {.importc: "vdotq_lane_s32".}

func vdotq_laneq_s32*(r: Int32x4, a: Int8x16, b: Int8x16, index: int32): Int32x4 {.importc: "vdotq_laneq_s32".}

func vsm3ss1q_u32*(a: Uint32x4, b: Uint32x4, c: Uint32x4): Uint32x4 {.importc: "vsm3ss1q_u32".}

func vsm3tt1aq_u32*(a: Uint32x4, b: Uint32x4, c: Uint32x4, imm2: int32): Uint32x4 {.importc: "vsm3tt1aq_u32".}

func vsm3tt1bq_u32*(a: Uint32x4, b: Uint32x4, c: Uint32x4, imm2: int32): Uint32x4 {.importc: "vsm3tt1bq_u32".}

func vsm3tt2aq_u32*(a: Uint32x4, b: Uint32x4, c: Uint32x4, imm2: int32): Uint32x4 {.importc: "vsm3tt2aq_u32".}

func vsm3tt2bq_u32*(a: Uint32x4, b: Uint32x4, c: Uint32x4, imm2: int32): Uint32x4 {.importc: "vsm3tt2bq_u32".}

func vsm3partw1q_u32*(a: Uint32x4, b: Uint32x4, c: Uint32x4): Uint32x4 {.importc: "vsm3partw1q_u32".}

func vsm3partw2q_u32*(a: Uint32x4, b: Uint32x4, c: Uint32x4): Uint32x4 {.importc: "vsm3partw2q_u32".}

func vsm4eq_u32*(a: Uint32x4, b: Uint32x4): Uint32x4 {.importc: "vsm4eq_u32".}

func vsm4ekeyq_u32*(a: Uint32x4, b: Uint32x4): Uint32x4 {.importc: "vsm4ekeyq_u32".}

func vsha512hq_u64*(a: Uint64x2, b: Uint64x2, c: Uint64x2): Uint64x2 {.importc: "vsha512hq_u64".}

func vsha512h2q_u64*(a: Uint64x2, b: Uint64x2, c: Uint64x2): Uint64x2 {.importc: "vsha512h2q_u64".}

func vsha512su0q_u64*(a: Uint64x2, b: Uint64x2): Uint64x2 {.importc: "vsha512su0q_u64".}

func vsha512su1q_u64*(a: Uint64x2, b: Uint64x2, c: Uint64x2): Uint64x2 {.importc: "vsha512su1q_u64".}

func veor3q_u8*(a: Uint8x16, b: Uint8x16, c: Uint8x16): Uint8x16 {.importc: "veor3q_u8".}

func veor3q_u16*(a: Uint16x8, b: Uint16x8, c: Uint16x8): Uint16x8 {.importc: "veor3q_u16".}

func veor3q_u32*(a: Uint32x4, b: Uint32x4, c: Uint32x4): Uint32x4 {.importc: "veor3q_u32".}

func veor3q_u64*(a: Uint64x2, b: Uint64x2, c: Uint64x2): Uint64x2 {.importc: "veor3q_u64".}

func veor3q_s8*(a: Int8x16, b: Int8x16, c: Int8x16): Int8x16 {.importc: "veor3q_s8".}

func veor3q_s16*(a: Int16x8, b: Int16x8, c: Int16x8): Int16x8 {.importc: "veor3q_s16".}

func veor3q_s32*(a: Int32x4, b: Int32x4, c: Int32x4): Int32x4 {.importc: "veor3q_s32".}

func veor3q_s64*(a: Int64x2, b: Int64x2, c: Int64x2): Int64x2 {.importc: "veor3q_s64".}

func vrax1q_u64*(a: Uint64x2, b: Uint64x2): Uint64x2 {.importc: "vrax1q_u64".}

func vxarq_u64*(a: Uint64x2, b: Uint64x2, imm6: int32): Uint64x2 {.importc: "vxarq_u64".}

func vbcaxq_u8*(a: Uint8x16, b: Uint8x16, c: Uint8x16): Uint8x16 {.importc: "vbcaxq_u8".}

func vbcaxq_u16*(a: Uint16x8, b: Uint16x8, c: Uint16x8): Uint16x8 {.importc: "vbcaxq_u16".}

func vbcaxq_u32*(a: Uint32x4, b: Uint32x4, c: Uint32x4): Uint32x4 {.importc: "vbcaxq_u32".}

func vbcaxq_u64*(a: Uint64x2, b: Uint64x2, c: Uint64x2): Uint64x2 {.importc: "vbcaxq_u64".}

func vbcaxq_s8*(a: Int8x16, b: Int8x16, c: Int8x16): Int8x16 {.importc: "vbcaxq_s8".}

func vbcaxq_s16*(a: Int16x8, b: Int16x8, c: Int16x8): Int16x8 {.importc: "vbcaxq_s16".}

func vbcaxq_s32*(a: Int32x4, b: Int32x4, c: Int32x4): Int32x4 {.importc: "vbcaxq_s32".}

func vbcaxq_s64*(a: Int64x2, b: Int64x2, c: Int64x2): Int64x2 {.importc: "vbcaxq_s64".}

func vcadd_rot90_f16*(a: Float16x4, b: Float16x4): Float16x4 {.importc: "vcadd_rot90_f16".}

func vcaddq_rot90_f16*(a: Float16x8, b: Float16x8): Float16x8 {.importc: "vcaddq_rot90_f16".}

func vcadd_rot270_f16*(a: Float16x4, b: Float16x4): Float16x4 {.importc: "vcadd_rot270_f16".}

func vcaddq_rot270_f16*(a: Float16x8, b: Float16x8): Float16x8 {.importc: "vcaddq_rot270_f16".}

func vcmla_f16*(r: Float16x4, a: Float16x4, b: Float16x4): Float16x4 {.importc: "vcmla_f16".}

func vcmlaq_f16*(r: Float16x8, a: Float16x8, b: Float16x8): Float16x8 {.importc: "vcmlaq_f16".}

func vcmla_lane_f16*(r: Float16x4, a: Float16x4, b: Float16x4, index: int32): Float16x4 {.importc: "vcmla_lane_f16".}

func vcmla_laneq_f16*(r: Float16x4, a: Float16x4, b: Float16x8, index: int32): Float16x4 {.importc: "vcmla_laneq_f16".}

func vcmlaq_lane_f16*(r: Float16x8, a: Float16x8, b: Float16x4, index: int32): Float16x8 {.importc: "vcmlaq_lane_f16".}

func vcmlaq_rot90_lane_f16*(r: Float16x8, a: Float16x8, b: Float16x4, index: int32): Float16x8 {.importc: "vcmlaq_rot90_lane_f16".}

func vcmla_rot90_laneq_f16*(r: Float16x4, a: Float16x4, b: Float16x8, index: int32): Float16x4 {.importc: "vcmla_rot90_laneq_f16".}

func vcmla_rot90_lane_f16*(r: Float16x4, a: Float16x4, b: Float16x4, index: int32): Float16x4 {.importc: "vcmla_rot90_lane_f16".}

func vcmlaq_rot90_f16*(r: Float16x8, a: Float16x8, b: Float16x8): Float16x8 {.importc: "vcmlaq_rot90_f16".}

func vcmla_rot90_f16*(r: Float16x4, a: Float16x4, b: Float16x4): Float16x4 {.importc: "vcmla_rot90_f16".}

func vcmlaq_laneq_f16*(r: Float16x8, a: Float16x8, b: Float16x8, index: int32): Float16x8 {.importc: "vcmlaq_laneq_f16".}

func vcmla_rot180_laneq_f16*(r: Float16x4, a: Float16x4, b: Float16x8, index: int32): Float16x4 {.importc: "vcmla_rot180_laneq_f16".}

func vcmla_rot180_lane_f16*(r: Float16x4, a: Float16x4, b: Float16x4, index: int32): Float16x4 {.importc: "vcmla_rot180_lane_f16".}

func vcmlaq_rot180_f16*(r: Float16x8, a: Float16x8, b: Float16x8): Float16x8 {.importc: "vcmlaq_rot180_f16".}

func vcmla_rot180_f16*(r: Float16x4, a: Float16x4, b: Float16x4): Float16x4 {.importc: "vcmla_rot180_f16".}

func vcmlaq_rot90_laneq_f16*(r: Float16x8, a: Float16x8, b: Float16x8, index: int32): Float16x8 {.importc: "vcmlaq_rot90_laneq_f16".}

func vcmlaq_rot270_laneq_f16*(r: Float16x8, a: Float16x8, b: Float16x8, index: int32): Float16x8 {.importc: "vcmlaq_rot270_laneq_f16".}

func vcmlaq_rot270_lane_f16*(r: Float16x8, a: Float16x8, b: Float16x4, index: int32): Float16x8 {.importc: "vcmlaq_rot270_lane_f16".}

func vcmla_rot270_laneq_f16*(r: Float16x4, a: Float16x4, b: Float16x8, index: int32): Float16x4 {.importc: "vcmla_rot270_laneq_f16".}

func vcmlaq_rot270_f16*(r: Float16x8, a: Float16x8, b: Float16x8): Float16x8 {.importc: "vcmlaq_rot270_f16".}

func vcmla_rot270_f16*(r: Float16x4, a: Float16x4, b: Float16x4): Float16x4 {.importc: "vcmla_rot270_f16".}

func vcmlaq_rot180_laneq_f16*(r: Float16x8, a: Float16x8, b: Float16x8, index: int32): Float16x8 {.importc: "vcmlaq_rot180_laneq_f16".}

func vcmlaq_rot180_lane_f16*(r: Float16x8, a: Float16x8, b: Float16x4, index: int32): Float16x8 {.importc: "vcmlaq_rot180_lane_f16".}

func vcmla_rot270_lane_f16*(r: Float16x4, a: Float16x4, b: Float16x4, index: int32): Float16x4 {.importc: "vcmla_rot270_lane_f16".}

func vcadd_rot90_f32*(a: Float32x2, b: Float32x2): Float32x2 {.importc: "vcadd_rot90_f32".}

func vcaddq_rot90_f32*(a: Float32x4, b: Float32x4): Float32x4 {.importc: "vcaddq_rot90_f32".}

func vcaddq_rot90_f64*(a: Float64x2, b: Float64x2): Float64x2 {.importc: "vcaddq_rot90_f64".}

func vcadd_rot270_f32*(a: Float32x2, b: Float32x2): Float32x2 {.importc: "vcadd_rot270_f32".}

func vcaddq_rot270_f32*(a: Float32x4, b: Float32x4): Float32x4 {.importc: "vcaddq_rot270_f32".}

func vcaddq_rot270_f64*(a: Float64x2, b: Float64x2): Float64x2 {.importc: "vcaddq_rot270_f64".}

func vcmla_f32*(r: Float32x2, a: Float32x2, b: Float32x2): Float32x2 {.importc: "vcmla_f32".}

func vcmlaq_f32*(r: Float32x4, a: Float32x4, b: Float32x4): Float32x4 {.importc: "vcmlaq_f32".}

func vcmlaq_f64*(r: Float64x2, a: Float64x2, b: Float64x2): Float64x2 {.importc: "vcmlaq_f64".}

func vcmla_lane_f32*(r: Float32x2, a: Float32x2, b: Float32x2, index: int32): Float32x2 {.importc: "vcmla_lane_f32".}

func vcmla_laneq_f32*(r: Float32x2, a: Float32x2, b: Float32x4, index: int32): Float32x2 {.importc: "vcmla_laneq_f32".}

func vcmlaq_lane_f32*(r: Float32x4, a: Float32x4, b: Float32x2, index: int32): Float32x4 {.importc: "vcmlaq_lane_f32".}

func vcmlaq_laneq_f32*(r: Float32x4, a: Float32x4, b: Float32x4, index: int32): Float32x4 {.importc: "vcmlaq_laneq_f32".}

func vcmla_rot90_f32*(r: Float32x2, a: Float32x2, b: Float32x2): Float32x2 {.importc: "vcmla_rot90_f32".}

func vcmlaq_rot90_f32*(r: Float32x4, a: Float32x4, b: Float32x4): Float32x4 {.importc: "vcmlaq_rot90_f32".}

func vcmlaq_rot90_f64*(r: Float64x2, a: Float64x2, b: Float64x2): Float64x2 {.importc: "vcmlaq_rot90_f64".}

func vcmla_rot90_lane_f32*(r: Float32x2, a: Float32x2, b: Float32x2, index: int32): Float32x2 {.importc: "vcmla_rot90_lane_f32".}

func vcmla_rot90_laneq_f32*(r: Float32x2, a: Float32x2, b: Float32x4, index: int32): Float32x2 {.importc: "vcmla_rot90_laneq_f32".}

func vcmlaq_rot90_lane_f32*(r: Float32x4, a: Float32x4, b: Float32x2, index: int32): Float32x4 {.importc: "vcmlaq_rot90_lane_f32".}

func vcmlaq_rot90_laneq_f32*(r: Float32x4, a: Float32x4, b: Float32x4, index: int32): Float32x4 {.importc: "vcmlaq_rot90_laneq_f32".}

func vcmla_rot180_f32*(r: Float32x2, a: Float32x2, b: Float32x2): Float32x2 {.importc: "vcmla_rot180_f32".}

func vcmlaq_rot180_f32*(r: Float32x4, a: Float32x4, b: Float32x4): Float32x4 {.importc: "vcmlaq_rot180_f32".}

func vcmlaq_rot180_f64*(r: Float64x2, a: Float64x2, b: Float64x2): Float64x2 {.importc: "vcmlaq_rot180_f64".}

func vcmla_rot180_lane_f32*(r: Float32x2, a: Float32x2, b: Float32x2, index: int32): Float32x2 {.importc: "vcmla_rot180_lane_f32".}

func vcmla_rot180_laneq_f32*(r: Float32x2, a: Float32x2, b: Float32x4, index: int32): Float32x2 {.importc: "vcmla_rot180_laneq_f32".}

func vcmlaq_rot180_lane_f32*(r: Float32x4, a: Float32x4, b: Float32x2, index: int32): Float32x4 {.importc: "vcmlaq_rot180_lane_f32".}

func vcmlaq_rot180_laneq_f32*(r: Float32x4, a: Float32x4, b: Float32x4, index: int32): Float32x4 {.importc: "vcmlaq_rot180_laneq_f32".}

func vcmla_rot270_f32*(r: Float32x2, a: Float32x2, b: Float32x2): Float32x2 {.importc: "vcmla_rot270_f32".}

func vcmlaq_rot270_f32*(r: Float32x4, a: Float32x4, b: Float32x4): Float32x4 {.importc: "vcmlaq_rot270_f32".}

func vcmlaq_rot270_f64*(r: Float64x2, a: Float64x2, b: Float64x2): Float64x2 {.importc: "vcmlaq_rot270_f64".}

func vcmla_rot270_lane_f32*(r: Float32x2, a: Float32x2, b: Float32x2, index: int32): Float32x2 {.importc: "vcmla_rot270_lane_f32".}

func vcmla_rot270_laneq_f32*(r: Float32x2, a: Float32x2, b: Float32x4, index: int32): Float32x2 {.importc: "vcmla_rot270_laneq_f32".}

func vcmlaq_rot270_lane_f32*(r: Float32x4, a: Float32x4, b: Float32x2, index: int32): Float32x4 {.importc: "vcmlaq_rot270_lane_f32".}

func vcmlaq_rot270_laneq_f32*(r: Float32x4, a: Float32x4, b: Float32x4, index: int32): Float32x4 {.importc: "vcmlaq_rot270_laneq_f32".}

func vfmlal_low_f16*(r: Float32x2, a: Float16x4, b: Float16x4): Float32x2 {.importc: "vfmlal_low_f16".}

func vfmlsl_low_f16*(r: Float32x2, a: Float16x4, b: Float16x4): Float32x2 {.importc: "vfmlsl_low_f16".}

func vfmlalq_low_f16*(r: Float32x4, a: Float16x8, b: Float16x8): Float32x4 {.importc: "vfmlalq_low_f16".}

func vfmlslq_low_f16*(r: Float32x4, a: Float16x8, b: Float16x8): Float32x4 {.importc: "vfmlslq_low_f16".}

func vfmlal_high_f16*(r: Float32x2, a: Float16x4, b: Float16x4): Float32x2 {.importc: "vfmlal_high_f16".}

func vfmlsl_high_f16*(r: Float32x2, a: Float16x4, b: Float16x4): Float32x2 {.importc: "vfmlsl_high_f16".}

func vfmlalq_high_f16*(r: Float32x4, a: Float16x8, b: Float16x8): Float32x4 {.importc: "vfmlalq_high_f16".}

func vfmlslq_high_f16*(r: Float32x4, a: Float16x8, b: Float16x8): Float32x4 {.importc: "vfmlslq_high_f16".}

func vfmlal_lane_low_f16*(r: Float32x2, a: Float16x4, b: Float16x4, lane: int32): Float32x2 {.importc: "vfmlal_lane_low_f16".}

func vfmlsl_lane_low_f16*(r: Float32x2, a: Float16x4, b: Float16x4, lane: int32): Float32x2 {.importc: "vfmlsl_lane_low_f16".}

func vfmlal_laneq_low_f16*(r: Float32x2, a: Float16x4, b: Float16x8, lane: int32): Float32x2 {.importc: "vfmlal_laneq_low_f16".}

func vfmlsl_laneq_low_f16*(r: Float32x2, a: Float16x4, b: Float16x8, lane: int32): Float32x2 {.importc: "vfmlsl_laneq_low_f16".}

func vfmlalq_lane_low_f16*(r: Float32x4, a: Float16x8, b: Float16x4, lane: int32): Float32x4 {.importc: "vfmlalq_lane_low_f16".}

func vfmlslq_lane_low_f16*(r: Float32x4, a: Float16x8, b: Float16x4, lane: int32): Float32x4 {.importc: "vfmlslq_lane_low_f16".}

func vfmlalq_laneq_low_f16*(r: Float32x4, a: Float16x8, b: Float16x8, lane: int32): Float32x4 {.importc: "vfmlalq_laneq_low_f16".}

func vfmlslq_laneq_low_f16*(r: Float32x4, a: Float16x8, b: Float16x8, lane: int32): Float32x4 {.importc: "vfmlslq_laneq_low_f16".}

func vfmlal_lane_high_f16*(r: Float32x2, a: Float16x4, b: Float16x4, lane: int32): Float32x2 {.importc: "vfmlal_lane_high_f16".}

func vfmlsl_lane_high_f16*(r: Float32x2, a: Float16x4, b: Float16x4, lane: int32): Float32x2 {.importc: "vfmlsl_lane_high_f16".}

func vfmlal_laneq_high_f16*(r: Float32x2, a: Float16x4, b: Float16x8, lane: int32): Float32x2 {.importc: "vfmlal_laneq_high_f16".}

func vfmlsl_laneq_high_f16*(r: Float32x2, a: Float16x4, b: Float16x8, lane: int32): Float32x2 {.importc: "vfmlsl_laneq_high_f16".}

func vfmlalq_lane_high_f16*(r: Float32x4, a: Float16x8, b: Float16x4, lane: int32): Float32x4 {.importc: "vfmlalq_lane_high_f16".}

func vfmlslq_lane_high_f16*(r: Float32x4, a: Float16x8, b: Float16x4, lane: int32): Float32x4 {.importc: "vfmlslq_lane_high_f16".}

func vfmlalq_laneq_high_f16*(r: Float32x4, a: Float16x8, b: Float16x8, lane: int32): Float32x4 {.importc: "vfmlalq_laneq_high_f16".}

func vfmlslq_laneq_high_f16*(r: Float32x4, a: Float16x8, b: Float16x8, lane: int32): Float32x4 {.importc: "vfmlslq_laneq_high_f16".}

func vrnd32z_f32*(a: Float32x2): Float32x2 {.importc: "vrnd32z_f32".}

func vrnd32zq_f32*(a: Float32x4): Float32x4 {.importc: "vrnd32zq_f32".}

func vrnd32z_f64*(a: Float64x1): Float64x1 {.importc: "vrnd32z_f64".}

func vrnd32zq_f64*(a: Float64x2): Float64x2 {.importc: "vrnd32zq_f64".}

func vrnd32x_f32*(a: Float32x2): Float32x2 {.importc: "vrnd32x_f32".}

func vrnd32xq_f32*(a: Float32x4): Float32x4 {.importc: "vrnd32xq_f32".}

func vrnd32x_f64*(a: Float64x1): Float64x1 {.importc: "vrnd32x_f64".}

func vrnd32xq_f64*(a: Float64x2): Float64x2 {.importc: "vrnd32xq_f64".}

func vrnd64z_f32*(a: Float32x2): Float32x2 {.importc: "vrnd64z_f32".}

func vrnd64zq_f32*(a: Float32x4): Float32x4 {.importc: "vrnd64zq_f32".}

func vrnd64z_f64*(a: Float64x1): Float64x1 {.importc: "vrnd64z_f64".}

func vrnd64zq_f64*(a: Float64x2): Float64x2 {.importc: "vrnd64zq_f64".}

func vrnd64x_f32*(a: Float32x2): Float32x2 {.importc: "vrnd64x_f32".}

func vrnd64xq_f32*(a: Float32x4): Float32x4 {.importc: "vrnd64xq_f32".}

func vrnd64x_f64*(a: Float64x1): Float64x1 {.importc: "vrnd64x_f64".}

func vrnd64xq_f64*(a: Float64x2): Float64x2 {.importc: "vrnd64xq_f64".}

func vset_lane_bf16*(elem: bfloat16, vec: Bfloat16x4, index: int32): Bfloat16x4 {.importc: "vset_lane_bf16".}

func vsetq_lane_bf16*(elem: bfloat16, vec: Bfloat16x8, index: int32): Bfloat16x8 {.importc: "vsetq_lane_bf16".}

func vget_lane_bf16*(a: Bfloat16x4, b: int32): bfloat16 {.importc: "vget_lane_bf16".}

func vgetq_lane_bf16*(a: Bfloat16x8, b: int32): bfloat16 {.importc: "vgetq_lane_bf16".}

func vcreate_bf16*(a: uint64): Bfloat16x4 {.importc: "vcreate_bf16".}

func vcombine_bf16*(a: Bfloat16x4, b: Bfloat16x4): Bfloat16x8 {.importc: "vcombine_bf16".}

func vdup_n_bf16*(a: bfloat16): Bfloat16x4 {.importc: "vdup_n_bf16".}

func vdupq_n_bf16*(a: bfloat16): Bfloat16x8 {.importc: "vdupq_n_bf16".}

func vdup_lane_bf16*(a: Bfloat16x4, b: int32): Bfloat16x4 {.importc: "vdup_lane_bf16".}

func vdup_laneq_bf16*(a: Bfloat16x8, b: int32): Bfloat16x4 {.importc: "vdup_laneq_bf16".}

func vdupq_lane_bf16*(a: Bfloat16x4, b: int32): Bfloat16x8 {.importc: "vdupq_lane_bf16".}

func vdupq_laneq_bf16*(a: Bfloat16x8, b: int32): Bfloat16x8 {.importc: "vdupq_laneq_bf16".}

func vduph_lane_bf16*(a: Bfloat16x4, b: int32): bfloat16 {.importc: "vduph_lane_bf16".}

func vduph_laneq_bf16*(a: Bfloat16x8, b: int32): bfloat16 {.importc: "vduph_laneq_bf16".}

func vld1_bf16*(a: ptr bfloat16): Bfloat16x4 {.importc: "vld1_bf16".}

func vld1q_bf16*(a: ptr bfloat16): Bfloat16x8 {.importc: "vld1q_bf16".}

func vld1_bf16_x2*(a: ptr bfloat16): Bfloat16x4x2 {.importc: "vld1_bf16_x2".}

func vld1q_bf16_x2*(a: ptr bfloat16): Bfloat16x8x2 {.importc: "vld1q_bf16_x2".}

func vld1_bf16_x3*(a: ptr bfloat16): Bfloat16x4x3 {.importc: "vld1_bf16_x3".}

func vld1q_bf16_x3*(a: ptr bfloat16): Bfloat16x8x3 {.importc: "vld1q_bf16_x3".}

func vld1_bf16_x4*(a: ptr bfloat16): Bfloat16x4x4 {.importc: "vld1_bf16_x4".}

func vld1q_bf16_x4*(a: ptr bfloat16): Bfloat16x8x4 {.importc: "vld1q_bf16_x4".}

func vld1_lane_bf16*(src: ptr bfloat16, vec: Bfloat16x4, lane: int32): Bfloat16x4 {.importc: "vld1_lane_bf16".}

func vld1q_lane_bf16*(src: ptr bfloat16, vec: Bfloat16x8, lane: int32): Bfloat16x8 {.importc: "vld1q_lane_bf16".}

func vld1_dup_bf16*(a: ptr bfloat16): Bfloat16x4 {.importc: "vld1_dup_bf16".}

func vld1q_dup_bf16*(a: ptr bfloat16): Bfloat16x8 {.importc: "vld1q_dup_bf16".}

func vld2_bf16*(a: ptr bfloat16): Bfloat16x4x2 {.importc: "vld2_bf16".}

func vld2q_bf16*(a: ptr bfloat16): Bfloat16x8x2 {.importc: "vld2q_bf16".}

func vld2_dup_bf16*(a: ptr bfloat16): Bfloat16x4x2 {.importc: "vld2_dup_bf16".}

func vld2q_dup_bf16*(a: ptr bfloat16): Bfloat16x8x2 {.importc: "vld2q_dup_bf16".}

func vld3_bf16*(a: ptr bfloat16): Bfloat16x4x3 {.importc: "vld3_bf16".}

func vld3q_bf16*(a: ptr bfloat16): Bfloat16x8x3 {.importc: "vld3q_bf16".}

func vld3_dup_bf16*(a: ptr bfloat16): Bfloat16x4x3 {.importc: "vld3_dup_bf16".}

func vld3q_dup_bf16*(a: ptr bfloat16): Bfloat16x8x3 {.importc: "vld3q_dup_bf16".}

func vld4_bf16*(a: ptr bfloat16): Bfloat16x4x4 {.importc: "vld4_bf16".}

func vld4q_bf16*(a: ptr bfloat16): Bfloat16x8x4 {.importc: "vld4q_bf16".}

func vld4_dup_bf16*(a: ptr bfloat16): Bfloat16x4x4 {.importc: "vld4_dup_bf16".}

func vld4q_dup_bf16*(a: ptr bfloat16): Bfloat16x8x4 {.importc: "vld4q_dup_bf16".}

func vst1_bf16*(a: ptr bfloat16, b: Bfloat16x4): void {.importc: "vst1_bf16".}

func vst1_bf16_x2*(a: ptr bfloat16, val: Bfloat16x4x2): void {.importc: "vst1_bf16_x2".}

func vst1q_bf16_x2*(a: ptr bfloat16, val: Bfloat16x8x2): void {.importc: "vst1q_bf16_x2".}

func vst1_bf16_x3*(a: ptr bfloat16, val: Bfloat16x4x3): void {.importc: "vst1_bf16_x3".}

func vst1q_bf16_x3*(a: ptr bfloat16, val: Bfloat16x8x3): void {.importc: "vst1q_bf16_x3".}

func vst1_bf16_x4*(a: ptr bfloat16, val: Bfloat16x4x4): void {.importc: "vst1_bf16_x4".}

func vst1q_bf16_x4*(a: ptr bfloat16, val: Bfloat16x8x4): void {.importc: "vst1q_bf16_x4".}

func vst1q_bf16*(a: ptr bfloat16, b: Bfloat16x8): void {.importc: "vst1q_bf16".}

func vst1_lane_bf16*(a: ptr bfloat16, b: Bfloat16x4, lane: int32): void {.importc: "vst1_lane_bf16".}

func vst1q_lane_bf16*(a: ptr bfloat16, b: Bfloat16x8, lane: int32): void {.importc: "vst1q_lane_bf16".}

func vst2_bf16*(a: ptr bfloat16, val: Bfloat16x4x2): void {.importc: "vst2_bf16".}

func vst2q_bf16*(a: ptr bfloat16, val: Bfloat16x8x2): void {.importc: "vst2q_bf16".}

func vst3_bf16*(a: ptr bfloat16, val: Bfloat16x4x3): void {.importc: "vst3_bf16".}

func vst3q_bf16*(a: ptr bfloat16, val: Bfloat16x8x3): void {.importc: "vst3q_bf16".}

func vst4_bf16*(a: ptr bfloat16, val: Bfloat16x4x4): void {.importc: "vst4_bf16".}

func vst4q_bf16*(a: ptr bfloat16, val: Bfloat16x8x4): void {.importc: "vst4q_bf16".}

func vbfdot_f32*(r: Float32x2, a: Bfloat16x4, b: Bfloat16x4): Float32x2 {.importc: "vbfdot_f32".}

func vbfdotq_f32*(r: Float32x4, a: Bfloat16x8, b: Bfloat16x8): Float32x4 {.importc: "vbfdotq_f32".}

func vbfdot_lane_f32*(r: Float32x2, a: Bfloat16x4, b: Bfloat16x4, index: int32): Float32x2 {.importc: "vbfdot_lane_f32".}

func vbfdotq_lane_f32*(r: Float32x4, a: Bfloat16x8, b: Bfloat16x4, index: int32): Float32x4 {.importc: "vbfdotq_lane_f32".}

func vbfdot_laneq_f32*(r: Float32x2, a: Bfloat16x4, b: Bfloat16x8, index: int32): Float32x2 {.importc: "vbfdot_laneq_f32".}

func vbfdotq_laneq_f32*(r: Float32x4, a: Bfloat16x8, b: Bfloat16x8, index: int32): Float32x4 {.importc: "vbfdotq_laneq_f32".}

func vbfmmlaq_f32*(r: Float32x4, a: Bfloat16x8, b: Bfloat16x8): Float32x4 {.importc: "vbfmmlaq_f32".}

func vbfmlalbq_f32*(r: Float32x4, a: Bfloat16x8, b: Bfloat16x8): Float32x4 {.importc: "vbfmlalbq_f32".}

func vbfmlaltq_f32*(r: Float32x4, a: Bfloat16x8, b: Bfloat16x8): Float32x4 {.importc: "vbfmlaltq_f32".}

func vbfmlalbq_lane_f32*(r: Float32x4, a: Bfloat16x8, b: Bfloat16x4, index: int32): Float32x4 {.importc: "vbfmlalbq_lane_f32".}

func vbfmlaltq_lane_f32*(r: Float32x4, a: Bfloat16x8, b: Bfloat16x4, index: int32): Float32x4 {.importc: "vbfmlaltq_lane_f32".}

func vbfmlalbq_laneq_f32*(r: Float32x4, a: Bfloat16x8, b: Bfloat16x8, index: int32): Float32x4 {.importc: "vbfmlalbq_laneq_f32".}

func vbfmlaltq_laneq_f32*(r: Float32x4, a: Bfloat16x8, b: Bfloat16x8, index: int32): Float32x4 {.importc: "vbfmlaltq_laneq_f32".}

func vcvt_f32_bf16*(a: Bfloat16x4): Float32x4 {.importc: "vcvt_f32_bf16".}

func vcvtq_low_f32_bf16*(a: Bfloat16x8): Float32x4 {.importc: "vcvtq_low_f32_bf16".}

func vcvtq_high_f32_bf16*(a: Bfloat16x8): Float32x4 {.importc: "vcvtq_high_f32_bf16".}

func vcvt_bf16_f32*(a: Float32x4): Bfloat16x4 {.importc: "vcvt_bf16_f32".}

func vcvtq_low_bf16_f32*(a: Float32x4): Bfloat16x8 {.importc: "vcvtq_low_bf16_f32".}

func vcvtq_high_bf16_f32*(inactive: Bfloat16x8, a: Float32x4): Bfloat16x8 {.importc: "vcvtq_high_bf16_f32".}

func vcopy_lane_bf16*(a: Bfloat16x4, lane1: int32, b: Bfloat16x4, lane2: int32): Bfloat16x4 {.importc: "vcopy_lane_bf16".}

func vcopyq_lane_bf16*(a: Bfloat16x8, lane1: int32, b: Bfloat16x4, lane2: int32): Bfloat16x8 {.importc: "vcopyq_lane_bf16".}

func vcopy_laneq_bf16*(a: Bfloat16x4, lane1: int32, b: Bfloat16x8, lane2: int32): Bfloat16x4 {.importc: "vcopy_laneq_bf16".}

func vcopyq_laneq_bf16*(a: Bfloat16x8, lane1: int32, b: Bfloat16x8, lane2: int32): Bfloat16x8 {.importc: "vcopyq_laneq_bf16".}

func vld2_lane_bf16*(ptr: ptr bfloat16, b: Bfloat16x4x2, c: int32): Bfloat16x4x2 {.importc: "vld2_lane_bf16".}

func vld2q_lane_bf16*(ptr: ptr bfloat16, b: Bfloat16x8x2, c: int32): Bfloat16x8x2 {.importc: "vld2q_lane_bf16".}

func vld3_lane_bf16*(ptr: ptr bfloat16, b: Bfloat16x4x3, c: int32): Bfloat16x4x3 {.importc: "vld3_lane_bf16".}

func vld3q_lane_bf16*(ptr: ptr bfloat16, b: Bfloat16x8x3, c: int32): Bfloat16x8x3 {.importc: "vld3q_lane_bf16".}

func vld4_lane_bf16*(ptr: ptr bfloat16, b: Bfloat16x4x4, c: int32): Bfloat16x4x4 {.importc: "vld4_lane_bf16".}

func vld4q_lane_bf16*(ptr: ptr bfloat16, b: Bfloat16x8x4, c: int32): Bfloat16x8x4 {.importc: "vld4q_lane_bf16".}

func vst2_lane_bf16*(ptr: ptr bfloat16, val: Bfloat16x4x2, lane: int32): void {.importc: "vst2_lane_bf16".}

func vst2q_lane_bf16*(ptr: ptr bfloat16, val: Bfloat16x8x2, lane: int32): void {.importc: "vst2q_lane_bf16".}

func vst3_lane_bf16*(ptr: ptr bfloat16, val: Bfloat16x4x3, lane: int32): void {.importc: "vst3_lane_bf16".}

func vst3q_lane_bf16*(ptr: ptr bfloat16, val: Bfloat16x8x3, lane: int32): void {.importc: "vst3q_lane_bf16".}

func vst4_lane_bf16*(ptr: ptr bfloat16, val: Bfloat16x4x4, lane: int32): void {.importc: "vst4_lane_bf16".}

func vst4q_lane_bf16*(ptr: ptr bfloat16, val: Bfloat16x8x4, lane: int32): void {.importc: "vst4q_lane_bf16".}

func vusdot_s32*(r: Int32x2, a: Uint8x8, b: Int8x8): Int32x2 {.importc: "vusdot_s32".}

func vusdotq_s32*(r: Int32x4, a: Uint8x16, b: Int8x16): Int32x4 {.importc: "vusdotq_s32".}

func vusdot_lane_s32*(r: Int32x2, a: Uint8x8, b: Int8x8, index: int32): Int32x2 {.importc: "vusdot_lane_s32".}

func vusdot_laneq_s32*(r: Int32x2, a: Uint8x8, b: Int8x16, index: int32): Int32x2 {.importc: "vusdot_laneq_s32".}

func vusdotq_lane_s32*(r: Int32x4, a: Uint8x16, b: Int8x8, index: int32): Int32x4 {.importc: "vusdotq_lane_s32".}

func vusdotq_laneq_s32*(r: Int32x4, a: Uint8x16, b: Int8x16, index: int32): Int32x4 {.importc: "vusdotq_laneq_s32".}

func vsudot_lane_s32*(r: Int32x2, a: Int8x8, b: Uint8x8, index: int32): Int32x2 {.importc: "vsudot_lane_s32".}

func vsudot_laneq_s32*(r: Int32x2, a: Int8x8, b: Uint8x16, index: int32): Int32x2 {.importc: "vsudot_laneq_s32".}

func vsudotq_lane_s32*(r: Int32x4, a: Int8x16, b: Uint8x8, index: int32): Int32x4 {.importc: "vsudotq_lane_s32".}

func vsudotq_laneq_s32*(r: Int32x4, a: Int8x16, b: Uint8x16, index: int32): Int32x4 {.importc: "vsudotq_laneq_s32".}

func vmmlaq_s32*(r: Int32x4, a: Int8x16, b: Int8x16): Int32x4 {.importc: "vmmlaq_s32".}

func vmmlaq_u32*(r: Uint32x4, a: Uint8x16, b: Uint8x16): Uint32x4 {.importc: "vmmlaq_u32".}

func vusmmlaq_s32*(r: Int32x4, a: Uint8x16, b: Int8x16): Int32x4 {.importc: "vusmmlaq_s32".}
