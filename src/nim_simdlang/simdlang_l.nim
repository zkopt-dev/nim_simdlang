import ../../../Utility/src/Utility/codeutils/indexutils
import ../../../Utility/src/Utility/codeutils/bits
import ../../../Utility/src/Utility/codeutils/errorutils
import ../../../Utility/src/Utility/dataformat/dataformat
import ../../../Utility/src/Utility/codeutils/arraytype
import ../../../Utility/src/Utility/codeutils/autoopt
import ../../../Utility/src/Utility/codeutils/envconst
import std/[monotimes, times]
import std/bitops
import strutils
import simdExists
import sse
import sse2
import sse3
import sse41
import sse42
import ssse3
import avx
import avx2
import avx10
import avx512f
import neon
import lsx
import avx512vl
import lasx

func compileTimeParseInt(s: string): int =
  if s.len == 0: return 0
  for c in s:
    if c in {'0'..'9'}:
      result = result * 10 + (ord(c) - ord('0'))
    else:
      return 0

const
  Limit*: int = (when defined(amd64): 512 
                 elif defined(arm) or defined(aarch64) or 
                      defined(riscv32) or defined(riscv64) or
                      defined(mips) or defined(mipsel) or
                      defined(mips64) or defined(mips64el) or
                      defined(ppc) or defined(ppc64) or
                      defined(ppc64el): 128
                 elif defined(loongarch): 256) div 8
  SIMD_LEN_STR {.strdefine: "simdlen".} = "0"

  Expect*: int = block:
    let parsed = compileTimeParseInt(SIMD_LEN_STR)
    if parsed <= 0:
      Limit
    else:
      parsed

type
  vector[B: static int, T] = array[B div (sizeof(T) * 8), T]

  v128[T] = vector[128, T]
  v256[T] = vector[256, T]
  v512[T] = vector[512, T]

  # --- 128-bit Vectors ---
  f32v128* = v128[float32]
  f64v128* = v128[float64]
  i8v128* = v128[int8]
  i16v128* = v128[int16]
  i32v128* = v128[int32]
  i64v128* = v128[int64]
  u8v128* = v128[uint8]
  u16v128* = v128[uint16]
  u32v128* = v128[uint32]
  u64v128* = v128[uint64]

  # --- 256-bit Vectors ---
  f32v256* = v256[float32]
  f64v256* = v256[float64]
  i8v256* = v256[int8]
  i16v256* = v256[int16]
  i32v256* = v256[int32]
  i64v256* = v256[int64]
  u8v256* = v256[uint8]
  u16v256* = v256[uint16]
  u32v256* = v256[uint32]
  u64v256* = v256[uint64]

  # --- 512-bit Vectors ---
  f32v512* = v512[float32]
  f64v512* = v512[float64]
  i8v512* = v512[int8]
  i16v512* = v512[int16]
  i32v512* = v512[int32]
  i64v512* = v512[int64]
  u8v512* = v512[uint8]
  u16v512* = v512[uint16]
  u32v512* = v512[uint32]
  u64v512* = v512[uint64]

when defined(amd64):
  type
    f32r128* = distinct sse.M128
    f64r128* = distinct sse2.M128d
    i8r128* = distinct sse2.M128i
    i16r128* = distinct sse2.M128i
    i32r128* = distinct sse2.M128i
    i64r128* = distinct sse2.M128i
    u8r128* = distinct sse2.M128i
    u16r128* = distinct sse2.M128i
    u32r128* = distinct sse2.M128i
    u64r128* = distinct sse2.M128i

    f32r256* = distinct avx.M256
    f64r256* = distinct avx.M256d
    i8r256* = distinct avx.M256i
    i16r256* = distinct avx.M256i
    i32r256* = distinct avx.M256i
    i64r256* = distinct avx.M256i
    u8r256* = distinct avx.M256i
    u16r256* = distinct avx.M256i
    u32r256* = distinct avx.M256i
    u64r256* = distinct avx.M256i

    f32r512* = distinct avx512f.M512
    f64r512* = distinct avx512f.M512d
    i8r512* = distinct avx512f.M512i
    i16r512* = distinct avx512f.M512i
    i32r512* = distinct avx512f.M512i
    i64r512* = distinct avx512f.M512i
    u8r512* = distinct avx512f.M512i
    u16r512* = distinct avx512f.M512i
    u32r512* = distinct avx512f.M512i
    u64r512* = distinct avx512f.M512i
elif defined(aarch64):
  type
    f32r128* = distinct neon.Float32x4
    f64r128* = distinct neon.Float64x2
    i8r128* = distinct neon.Int8x16
    i16r128* = distinct neon.Int16x8
    i32r128* = distinct neon.Int32x4
    i64r128* = distinct neon.Int64x2
    u8r128* = distinct neon.Uint8x16
    u16r128* = distinct neon.Uint16x8
    u32r128* = distinct neon.Uint32x4
    u64r128* = distinct neon.Uint64x2

    f32r256* = distinct array[2, f32r128]
    f64r256* = distinct array[2, f64r128]
    i8r256* = distinct array[2, i8r128]
    i16r256* = distinct array[2, i16r128]
    i32r256* = distinct array[2, i32r128]
    i64r256* = distinct array[2, i64r128]
    u8r256* = distinct array[2, u8r128]
    u16r256* = distinct array[2, u16r128]
    u32r256* = distinct array[2, u32r128]
    u64r256* = distinct array[2, u64r128]

    f32r512* = distinct array[4, f32r128]
    f64r512* = distinct array[4, f64r128]
    i8r512* = distinct array[4, i8r128]
    i16r512* = distinct array[4, i16r128]
    i32r512* = distinct array[4, i32r128]
    i64r512* = distinct array[4, i64r128]
    u8r512* = distinct array[4, u8r128]
    u16r512* = distinct array[4, u16r128]
    u32r512* = distinct array[4, u32r128]
    u64r512* = distinct array[4, u64r128]
elif defined(loongarch):
  type
    f32r128* = distinct lsx.M128
    f64r128* = distinct lsx.M128d
    i8r128* = distinct lsx.M128i
    i16r128* = distinct lsx.M128i
    i32r128* = distinct lsx.M128i
    i64r128* = distinct lsx.M128i
    u8r128* = distinct lsx.M128i
    u16r128* = distinct lsx.M128i
    u32r128* = distinct lsx.M128i
    u64r128* = distinct lsx.M128i

    f32r256* = distinct lasx.M256
    f64r256* = distinct lasx.M256d
    i8r256* = distinct lasx.M256i
    i16r256* = distinct lasx.M256i
    i32r256* = distinct lasx.M256i
    i64r256* = distinct lasx.M256i
    u8r256* = distinct lasx.M256i
    u16r256* = distinct lasx.M256i
    u32r256* = distinct lasx.M256i
    u64r256* = distinct lasx.M256i

    f32r512* = distinct array[2, f32r256]
    f64r512* = distinct array[2, f64r256]
    i8r512* = distinct array[2, i8r256]
    i16r512* = distinct array[2, i16r256]
    i32r512* = distinct array[2, i32r256]
    i64r512* = distinct array[2, i64r256]
    u8r512* = distinct array[2, u8r256]
    u16r512* = distinct array[2, u16r256]
    u32r512* = distinct array[2, u32r256]
    u64r512* = distinct array[2, u64r256]

# +(128), -(128), *(128), div, mod, sqrt, abs, min, max, addSat, subSat
# and(128), or(128), not(128), xor(128), nand(128), nor(128), andnot(128), ornot(128)
# shl(128), shr(128), rotl(128), rotr(128)
# ==(128), !=(128), >=(128), <=(128), >(128), <(128)
# loadU(Unaligned), loadA(aligned), store, broadcast
# set1, setzero
# hadd, hsub, dotproduct(horizontal)
# shuffle(not now), permute(not now), unpackHi/Lo, blend
# convert, bitcast
# gather, scatter
# maskLoad, maskStore
# sar(not now), fmadd(not now)
# floor, ceil, round
# testZ, testC
# movemask
# clmul, pmull, popcnt

# ========================
# load / value
# ========================

template load*(a: f32v128): f32r128 = 
  cast[f32r128](a)

template load*(a: f64v128): f64r128 = 
  cast[f64r128](a)

template load*(a: i8v128): i8r128 = 
  cast[i8r128](a)

template load*(a: i16v128): i16r128 = 
  cast[i16r128](a)

template load*(a: i32v128): i32r128 = 
  cast[i32r128](a)

template load*(a: i64v128): i64r128 = 
  cast[i64r128](a)

template load*(a: u8v128): u8r128 = 
  cast[u8r128](a)

template load*(a: u16v128): u16r128 = 
  cast[u16r128](a)

template load*(a: u32v128): u32r128 = 
  cast[u32r128](a)

template load*(a: u64v128): u64r128 = 
  cast[u64r128](a)



template load*(a: f32v256): f32r256 =
  cast[f32r256](a)

template load*(a: f64v256): f64r256 =
  cast[f64r256](a)

template load*(a: i8v256): i8r256 =
  cast[i8r256](a)

template load*(a: i16v256): i16r256 =
  cast[i16r256](a)

template load*(a: i32v256): i32r256 =
  cast[i32r256](a)

template load*(a: i64v256): i64r256 =
  cast[i64r256](a)

template load*(a: u8v256): u8r256 =
  cast[u8r256](a)

template load*(a: u16v256): u16r256 =
  cast[u16r256](a)

template load*(a: u32v256): u32r256 =
  cast[u32r256](a)

template load*(a: u64v256): u64r256 =
  cast[u64r256](a)



template load*(a: f32v512): f32r512 =
  cast[f32r512](a)

template load*(a: f64v512): f64r512 =
  cast[f64r512](a)

template load*(a: i8v512): i8r512 =
  cast[i8r512](a)

template load*(a: i16v512): i16r512 =
  cast[i16r512](a)

template load*(a: i32v512): i32r512 =
  cast[i32r512](a)

template load*(a: i64v512): i64r512 =
  cast[i64r512](a)

template load*(a: u8v512): u8r512 =
  cast[u8r512](a)

template load*(a: u16v512): u16r512 =
  cast[u16r512](a)

template load*(a: u32v512): u32r512 =
  cast[u32r512](a)

template load*(a: u64v512): u64r512 =
  cast[u64r512](a)

# ========================
# store / value
# ========================

# ========================
# add / f32r128 / value
# ========================

func add_f32r128_fallback(a, b: f32r128): f32r128 =
  var ca = cast[f32v128](a)
  var cb = cast[f32v128](b)
  var output: f32v128
  unroll(i, 0, 3):
    output[i] = ca[i] + cb[i]
  return cast[f32r128](output)

func add_f32r128_sse(a, b: f32r128): f32r128 =
  return cast[f32r128](mm_add_ps(cast[sse.M128](a), cast[sse.M128](b)))

func add_f32r128_avx512(a, b: f32r128): f32r128 = 
  let mask: MMask8 = cast[MMask8](0x0F'u8)
  return cast[f32r128](mm_maskz_add_ps(mask, cast[sse.M128](a), cast[sse.M128](b)))

let x86_add_f32r128: proc (a, b: f32r128): f32r128 = 
  if avx512Exists(): add_f32r128_avx512
  elif sseExists(): add_f32r128_sse 
  else: add_f32r128_fallback 

func add_f32r128_neon(a, b: f32r128): f32r128 =
  return cast[f32r128](vaddq_f32(cast[Float32x4](a), cast[Float32x4](b)))

let arm_add_f32r128: proc (a, b: f32r128): f32r128 = if neonExists(): add_f32r128_neon else: add_f32r128_fallback

func add_f32r128_lsx(a, b: f32r128): f32r128 =
  return cast[f32r128](lsx_vfadd_s(cast[lsx.M128](a), cast[lsx.M128](b)))

let la_add_f32r128: proc (a, b: f32r128): f32r128 = if lsxExists(): add_f32r128_lsx else: add_f32r128_fallback

template `+`*(a, b: f32r128): f32r128 = 
  when defined(amd64):
    x86_add_f32r128(a, b)
  elif defined(arm64):
    arm_add_f32r128(a, b)
  elif defined(loongarch64):
    la_add_f32r128(a, b)

# ========================
# add / f64r128 / value
# ========================

func add_f64r128_fallback(a, b: f64r128): f64r128 =
  var ca = cast[f64v128](a)
  var cb = cast[f64v128](b)
  var output: f64v128
  unroll(i, 0, 1):
    output[i] = ca[i] + cb[i]
  return cast[f64r128](output)

func add_f64r128_avx512(a, b: f64r128): f64r128 =
  let mask = cast[MMask8](0x03'u8)
  return cast[f64r128](mm_maskz_add_pd(mask, cast[sse2.M128d](a), cast[sse2.M128d](b)))

func add_f64r128_sse(a, b: f64r128): f64r128 =
  return cast[f64r128](mm_add_pd(cast[sse2.M128d](a), cast[sse2.M128d](b)))

let x86_add_f64r128: proc (a, b: f64r128): f64r128 = 
  if avx512Exists(): add_f64r128_avx512
  elif sseExists(): add_f64r128_sse 
  else: add_f64r128_fallback 

func add_f64r128_neon(a, b: f64r128): f64r128 =
  return cast[f64r128](vaddq_f64(cast[Float64x2](a), cast[Float64x2](b)))

let arm_add_f64r128: proc (a, b: f64r128): f64r128 = if neonExists(): add_f64r128_neon else: add_f64r128_fallback

func add_f64r128_lsx(a, b: f64r128): f64r128 =
  return cast[f64r128](lsx_vfadd_d(cast[lsx.M128d](a), cast[lsx.M128d](b)))

let la_add_f64r128: proc (a, b: f64r128): f64r128 = if lsxExists(): add_f64r128_lsx else: add_f64r128_fallback

template `+`*(a, b: f64r128): f64r128 = 
  when defined(amd64):
    x86_add_f64r128(a, b)
  elif defined(arm64):
    arm_add_f64r128(a, b)
  elif defined(loongarch64):
    la_add_f64r128(a, b)

# ========================
# add / i8r128 / value
# ========================

func add_i8r128_fallback(a, b: i8r128): i8r128 =
  var ca = cast[i8v128](a)
  var cb = cast[i8v128](b)
  var output: i8v128
  unroll(i, 0, 15):
    output[i] = ca[i] + cb[i]
  return cast[i8r128](output)

func add_i8r128_sse(a, b: i8r128): i8r128 =
  return cast[i8r128](mm_add_epi8(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_add_i8r128: proc (a, b: i8r128): i8r128 = 
  if sseExists(): add_i8r128_sse 
  else: add_i8r128_fallback 

func add_i8r128_neon(a, b: i8r128): i8r128 =
  return cast[i8r128](vaddq_s8(cast[Int8x16](a), cast[Int8x16](b)))

let arm_add_i8r128: proc (a, b: i8r128): i8r128 = if neonExists(): add_i8r128_neon else: add_i8r128_fallback

func add_i8r128_lsx(a, b: i8r128): i8r128 =
  return cast[i8r128](lsx_vadd_b(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_add_i8r128: proc (a, b: i8r128): i8r128 = if lsxExists(): add_i8r128_lsx else: add_i8r128_fallback

template `+`*(a, b: i8r128): i8r128 = 
  when defined(amd64):
    x86_add_i8r128(a, b)
  elif defined(arm64):
    arm_add_i8r128(a, b)
  elif defined(loongarch64):
    la_add_i8r128(a, b)

# ========================
# add / i16r128 / value
# ========================

func add_i16r128_fallback(a, b: i16r128): i16r128 =
  var ca = cast[i16v128](a)
  var cb = cast[i16v128](b)
  var output: i16v128
  unroll(i, 0, 7):
    output[i] = ca[i] + cb[i]
  return cast[i16r128](output)

func add_i16r128_sse(a, b: i16r128): i16r128 =
  return cast[i16r128](mm_add_epi16(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_add_i16r128: proc (a, b: i16r128): i16r128 = 
  if sseExists(): add_i16r128_sse 
  else: add_i16r128_fallback 

func add_i16r128_neon(a, b: i16r128): i16r128 =
  return cast[i16r128](vaddq_s16(cast[Int16x8](a), cast[Int16x8](b)))

let arm_add_i16r128: proc (a, b: i16r128): i16r128 = if neonExists(): add_i16r128_neon else: add_i16r128_fallback

func add_i16r128_lsx(a, b: i16r128): i16r128 =
  return cast[i16r128](lsx_vadd_h(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_add_i16r128: proc (a, b: i16r128): i16r128 = if lsxExists(): add_i16r128_lsx else: add_i16r128_fallback

template `+`*(a, b: i16r128): i16r128 = 
  when defined(amd64):
    x86_add_i16r128(a, b)
  elif defined(arm64):
    arm_add_i16r128(a, b)
  elif defined(loongarch64):
    la_add_i16r128(a, b)

# ========================
# add / i32r128 / value
# ========================

func add_i32r128_fallback(a, b: i32r128): i32r128 =
  var ca = cast[i32v128](a)
  var cb = cast[i32v128](b)
  var output: i32v128
  unroll(i, 0, 3):
    output[i] = ca[i] + cb[i]
  return cast[i32r128](output)

func add_i32r128_sse(a, b: i32r128): i32r128 =
  return cast[i32r128](mm_add_epi32(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_add_i32r128: proc (a, b: i32r128): i32r128 = 
  if sseExists(): add_i32r128_sse 
  else: add_i32r128_fallback 

func add_i32r128_neon(a, b: i32r128): i32r128 =
  return cast[i32r128](vaddq_s32(cast[Int32x4](a), cast[Int32x4](b)))

let arm_add_i32r128: proc (a, b: i32r128): i32r128 = if neonExists(): add_i32r128_neon else: add_i32r128_fallback

func add_i32r128_lsx(a, b: i32r128): i32r128 =
  return cast[i32r128](lsx_vadd_w(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_add_i32r128: proc (a, b: i32r128): i32r128 = if lsxExists(): add_i32r128_lsx else: add_i32r128_fallback

template `+`*(a, b: i32r128): i32r128 = 
  when defined(amd64):
    x86_add_i32r128(a, b)
  elif defined(arm64):
    arm_add_i32r128(a, b)
  elif defined(loongarch64):
    la_add_i32r128(a, b)

# ========================
# add / i64r128 / value
# ========================

func add_i64r128_fallback(a, b: i64r128): i64r128 =
  var ca = cast[i64v128](a)
  var cb = cast[i64v128](b)
  var output: i64v128
  unroll(i, 0, 1):
    output[i] = ca[i] + cb[i]
  return cast[i64r128](output)

func add_i64r128_sse(a, b: i64r128): i64r128 =
  return cast[i64r128](mm_add_epi64(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_add_i64r128: proc (a, b: i64r128): i64r128 = 
  if sseExists(): add_i64r128_sse 
  else: add_i64r128_fallback 

func add_i64r128_neon(a, b: i64r128): i64r128 =
  return cast[i64r128](vaddq_s64(cast[Int64x2](a), cast[Int64x2](b)))

let arm_add_i64r128: proc (a, b: i64r128): i64r128 = if neonExists(): add_i64r128_neon else: add_i64r128_fallback

func add_i64r128_lsx(a, b: i64r128): i64r128 =
  return cast[i64r128](lsx_vadd_d(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_add_i64r128: proc (a, b: i64r128): i64r128 = if lsxExists(): add_i64r128_lsx else: add_i64r128_fallback

template `+`*(a, b: i64r128): i64r128 = 
  when defined(amd64):
    x86_add_i64r128(a, b)
  elif defined(arm64):
    arm_add_i64r128(a, b)
  elif defined(loongarch64):
    la_add_i64r128(a, b)

# ========================
# add / u8r128 / value
# ========================

func add_u8r128_fallback(a, b: u8r128): u8r128 =
  var ca = cast[u8v128](a)
  var cb = cast[u8v128](b)
  var output: u8v128
  unroll(i, 0, 15):
    output[i] = ca[i] + cb[i]
  return cast[u8r128](output)

func add_u8r128_sse(a, b: u8r128): u8r128 =
  return cast[u8r128](mm_add_epi8(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_add_u8r128: proc (a, b: u8r128): u8r128 = 
  if sseExists(): add_u8r128_sse 
  else: add_u8r128_fallback 

func add_u8r128_neon(a, b: u8r128): u8r128 =
  return cast[u8r128](vaddq_u8(cast[Uint8x16](a), cast[Uint8x16](b)))

let arm_add_u8r128: proc (a, b: u8r128): u8r128 = if neonExists(): add_u8r128_neon else: add_u8r128_fallback

func add_u8r128_lsx(a, b: u8r128): u8r128 =
  return cast[u8r128](lsx_vadd_b(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_add_u8r128: proc (a, b: u8r128): u8r128 = if lsxExists(): add_u8r128_lsx else: add_u8r128_fallback

template `+`*(a, b: u8r128): u8r128 = 
  when defined(amd64):
    x86_add_u8r128(a, b)
  elif defined(arm64):
    arm_add_u8r128(a, b)
  elif defined(loongarch64):
    la_add_u8r128(a, b)

# ========================
# add / u16r128 / value
# ========================

func add_u16r128_fallback(a, b: u16r128): u16r128 =
  var ca = cast[u16v128](a)
  var cb = cast[u16v128](b)
  var output: u16v128
  unroll(i, 0, 7):
    output[i] = ca[i] + cb[i]
  return cast[u16r128](output)

func add_u16r128_sse(a, b: u16r128): u16r128 =
  return cast[u16r128](mm_add_epi16(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_add_u16r128: proc (a, b: u16r128): u16r128 = 
  if sseExists(): add_u16r128_sse 
  else: add_u16r128_fallback 

func add_u16r128_neon(a, b: u16r128): u16r128 =
  return cast[u16r128](vaddq_u16(cast[Uint16x8](a), cast[Uint16x8](b)))

let arm_add_u16r128: proc (a, b: u16r128): u16r128 = if neonExists(): add_u16r128_neon else: add_u16r128_fallback

func add_u16r128_lsx(a, b: u16r128): u16r128 =
  return cast[u16r128](lsx_vadd_h(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_add_u16r128: proc (a, b: u16r128): u16r128 = if lsxExists(): add_u16r128_lsx else: add_u16r128_fallback

template `+`*(a, b: u16r128): u16r128 = 
  when defined(amd64):
    x86_add_u16r128(a, b)
  elif defined(arm64):
    arm_add_u16r128(a, b)
  elif defined(loongarch64):
    la_add_u16r128(a, b)

# ========================
# add / u32r128 / value
# ========================

func add_u32r128_fallback(a, b: u32r128): u32r128 =
  var ca = cast[u32v128](a)
  var cb = cast[u32v128](b)
  var output: u32v128
  unroll(i, 0, 3):
    output[i] = ca[i] + cb[i]
  return cast[u32r128](output)

func add_u32r128_sse(a, b: u32r128): u32r128 =
  return cast[u32r128](mm_add_epi32(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_add_u32r128: proc (a, b: u32r128): u32r128 = 
  if sseExists(): add_u32r128_sse 
  else: add_u32r128_fallback 

func add_u32r128_neon(a, b: u32r128): u32r128 =
  return cast[u32r128](vaddq_u32(cast[Uint32x4](a), cast[Uint32x4](b)))

let arm_add_u32r128: proc (a, b: u32r128): u32r128 = if neonExists(): add_u32r128_neon else: add_u32r128_fallback

func add_u32r128_lsx(a, b: u32r128): u32r128 =
  return cast[u32r128](lsx_vadd_w(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_add_u32r128: proc (a, b: u32r128): u32r128 = if lsxExists(): add_u32r128_lsx else: add_u32r128_fallback

template `+`*(a, b: u32r128): u32r128 = 
  when defined(amd64):
    x86_add_u32r128(a, b)
  elif defined(arm64):
    arm_add_u32r128(a, b)
  elif defined(loongarch64):
    la_add_u32r128(a, b)

# ========================
# add / u64r128 / value
# ========================

func add_u64r128_fallback(a, b: u64r128): u64r128 =
  var ca = cast[u64v128](a)
  var cb = cast[u64v128](b)
  var output: u64v128
  unroll(i, 0, 1):
    output[i] = ca[i] + cb[i]
  return cast[u64r128](output)

func add_u64r128_sse(a, b: u64r128): u64r128 =
  return cast[u64r128](mm_add_epi64(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_add_u64r128: proc (a, b: u64r128): u64r128 = 
  if sseExists(): add_u64r128_sse 
  else: add_u64r128_fallback 

func add_u64r128_neon(a, b: u64r128): u64r128 =
  return cast[u64r128](vaddq_u64(cast[Uint64x2](a), cast[Uint64x2](b)))

let arm_add_u64r128: proc (a, b: u64r128): u64r128 = if neonExists(): add_u64r128_neon else: add_u64r128_fallback

func add_u64r128_lsx(a, b: u64r128): u64r128 =
  return cast[u64r128](lsx_vadd_d(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_add_u64r128: proc (a, b: u64r128): u64r128 = if lsxExists(): add_u64r128_lsx else: add_u64r128_fallback

template `+`*(a, b: u64r128): u64r128 = 
  when defined(amd64):
    x86_add_u64r128(a, b)
  elif defined(arm64):
    arm_add_u64r128(a, b)
  elif defined(loongarch64):
    la_add_u64r128(a, b)

# ========================
# add / f32v128 / value
# ========================

func add_f32v128_fallback(a, b: f32v128): f32v128 =
  var output: f32v128
  unroll(i, 0, 3):
    output[i] = a[i] + b[i]
  return output

func add_f32v128_sse(a, b: f32v128): f32v128 =
  return cast[f32v128](mm_add_ps(cast[sse.M128](a), cast[sse.M128](b)))

func add_f32v128_avx512(a, b: f32v128): f32v128 = 
  let mask: MMask8 = cast[MMask8](0x0F'u8)
  return cast[f32v128](mm_maskz_add_ps(mask, cast[sse.M128](a), cast[sse.M128](b)))

let x86_add_f32v128: proc (a, b: f32v128): f32v128 = 
  if avx512Exists(): add_f32v128_avx512
  elif sseExists(): add_f32v128_sse 
  else: add_f32v128_fallback 

func add_f32v128_neon(a, b: f32v128): f32v128 =
  return cast[f32v128](vaddq_f32(cast[Float32x4](a), cast[Float32x4](b)))

let arm_add_f32v128: proc (a, b: f32v128): f32v128 = if neonExists(): add_f32v128_neon else: add_f32v128_fallback

func add_f32v128_lsx(a, b: f32v128): f32v128 =
  return cast[f32v128](lsx_vfadd_s(cast[lsx.M128](a), cast[lsx.M128](b)))

let la_add_f32v128: proc (a, b: f32v128): f32v128 = if lsxExists(): add_f32v128_lsx else: add_f32v128_fallback

template `+`*(a, b: f32v128): f32v128 = 
  when defined(amd64):
    x86_add_f32v128(a, b)
  elif defined(arm64):
    arm_add_f32v128(a, b)
  elif defined(loongarch64):
    la_add_f32v128(a, b)

# ========================
# add / f64v128 / value
# ========================

func add_f64v128_fallback(a, b: f64v128): f64v128 =
  var output: f64v128
  unroll(i, 0, 1):
    output[i] = a[i] + b[i]
  return output

func add_f64v128_avx512(a, b: f64v128): f64v128 =
  let mask = cast[MMask8](0x03'u8)
  return cast[f64v128](mm_maskz_add_pd(mask, cast[sse2.M128d](a), cast[sse2.M128d](b)))

func add_f64v128_sse(a, b: f64v128): f64v128 =
  return cast[f64v128](mm_add_pd(cast[sse2.M128d](a), cast[sse2.M128d](b)))

let x86_add_f64v128: proc (a, b: f64v128): f64v128 = 
  if avx512Exists(): add_f64v128_avx512
  elif sseExists(): add_f64v128_sse 
  else: add_f64v128_fallback 

func add_f64v128_neon(a, b: f64v128): f64v128 =
  return cast[f64v128](vaddq_f64(cast[Float64x2](a), cast[Float64x2](b)))

let arm_add_f64v128: proc (a, b: f64v128): f64v128 = if neonExists(): add_f64v128_neon else: add_f64v128_fallback

func add_f64v128_lsx(a, b: f64v128): f64v128 =
  return cast[f64v128](lsx_vfadd_d(cast[lsx.M128d](a), cast[lsx.M128d](b)))

let la_add_f64v128: proc (a, b: f64v128): f64v128 = if lsxExists(): add_f64v128_lsx else: add_f64v128_fallback

template `+`*(a, b: f64v128): f64v128 = 
  when defined(amd64):
    x86_add_f64v128(a, b)
  elif defined(arm64):
    arm_add_f64v128(a, b)
  elif defined(loongarch64):
    la_add_f64v128(a, b)

# ========================
# add / i8v128 / value
# ========================

func add_i8v128_fallback(a, b: i8v128): i8v128 =
  var output: i8v128
  unroll(i, 0, 15):
    output[i] = a[i] + b[i]
  return output

func add_i8v128_sse(a, b: i8v128): i8v128 =
  return cast[i8v128](mm_add_epi8(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_add_i8v128: proc (a, b: i8v128): i8v128 = 
  if sseExists(): add_i8v128_sse 
  else: add_i8v128_fallback 

func add_i8v128_neon(a, b: i8v128): i8v128 =
  return cast[i8v128](vaddq_s8(cast[Int8x16](a), cast[Int8x16](b)))

let arm_add_i8v128: proc (a, b: i8v128): i8v128 = if neonExists(): add_i8v128_neon else: add_i8v128_fallback

func add_i8v128_lsx(a, b: i8v128): i8v128 =
  return cast[i8v128](lsx_vadd_b(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_add_i8v128: proc (a, b: i8v128): i8v128 = if lsxExists(): add_i8v128_lsx else: add_i8v128_fallback

template `+`*(a, b: i8v128): i8v128 = 
  when defined(amd64):
    x86_add_i8v128(a, b)
  elif defined(arm64):
    arm_add_i8v128(a, b)
  elif defined(loongarch64):
    la_add_i8v128(a, b)

# ========================
# add / i16v128 / value
# ========================

func add_i16v128_fallback(a, b: i16v128): i16v128 =
  var output: i16v128
  unroll(i, 0, 7):
    output[i] = a[i] + b[i]
  return output

func add_i16v128_sse(a, b: i16v128): i16v128 =
  return cast[i16v128](mm_add_epi16(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_add_i16v128: proc (a, b: i16v128): i16v128 = 
  if sseExists(): add_i16v128_sse 
  else: add_i16v128_fallback 

func add_i16v128_neon(a, b: i16v128): i16v128 =
  return cast[i16v128](vaddq_s16(cast[Int16x8](a), cast[Int16x8](b)))

let arm_add_i16v128: proc (a, b: i16v128): i16v128 = if neonExists(): add_i16v128_neon else: add_i16v128_fallback

func add_i16v128_lsx(a, b: i16v128): i16v128 =
  return cast[i16v128](lsx_vadd_h(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_add_i16v128: proc (a, b: i16v128): i16v128 = if lsxExists(): add_i16v128_lsx else: add_i16v128_fallback

template `+`*(a, b: i16v128): i16v128 = 
  when defined(amd64):
    x86_add_i16v128(a, b)
  elif defined(arm64):
    arm_add_i16v128(a, b)
  elif defined(loongarch64):
    la_add_i16v128(a, b)

# ========================
# add / i32v128 / value
# ========================

func add_i32v128_fallback(a, b: i32v128): i32v128 =
  var output: i32v128
  unroll(i, 0, 3):
    output[i] = a[i] + b[i]
  return output

func add_i32v128_sse(a, b: i32v128): i32v128 =
  return cast[i32v128](mm_add_epi32(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_add_i32v128: proc (a, b: i32v128): i32v128 = 
  if sseExists(): add_i32v128_sse 
  else: add_i32v128_fallback 

func add_i32v128_neon(a, b: i32v128): i32v128 =
  return cast[i32v128](vaddq_s32(cast[Int32x4](a), cast[Int32x4](b)))

let arm_add_i32v128: proc (a, b: i32v128): i32v128 = if neonExists(): add_i32v128_neon else: add_i32v128_fallback

func add_i32v128_lsx(a, b: i32v128): i32v128 =
  return cast[i32v128](lsx_vadd_w(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_add_i32v128: proc (a, b: i32v128): i32v128 = if lsxExists(): add_i32v128_lsx else: add_i32v128_fallback

template `+`*(a, b: i32v128): i32v128 = 
  when defined(amd64):
    x86_add_i32v128(a, b)
  elif defined(arm64):
    arm_add_i32v128(a, b)
  elif defined(loongarch64):
    la_add_i32v128(a, b)

# ========================
# add / i64v128 / value
# ========================

func add_i64v128_fallback(a, b: i64v128): i64v128 =
  var output: i64v128
  unroll(i, 0, 1):
    output[i] = a[i] + b[i]
  return output

func add_i64v128_sse(a, b: i64v128): i64v128 =
  return cast[i64v128](mm_add_epi64(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_add_i64v128: proc (a, b: i64v128): i64v128 = 
  if sseExists(): add_i64v128_sse 
  else: add_i64v128_fallback 

func add_i64v128_neon(a, b: i64v128): i64v128 =
  return cast[i64v128](vaddq_s64(cast[Int64x2](a), cast[Int64x2](b)))

let arm_add_i64v128: proc (a, b: i64v128): i64v128 = if neonExists(): add_i64v128_neon else: add_i64v128_fallback

func add_i64v128_lsx(a, b: i64v128): i64v128 =
  return cast[i64v128](lsx_vadd_d(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_add_i64v128: proc (a, b: i64v128): i64v128 = if lsxExists(): add_i64v128_lsx else: add_i64v128_fallback

template `+`*(a, b: i64v128): i64v128 = 
  when defined(amd64):
    x86_add_i64v128(a, b)
  elif defined(arm64):
    arm_add_i64v128(a, b)
  elif defined(loongarch64):
    la_add_i64v128(a, b)

# ========================
# add / u8v128 / value
# ========================

func add_u8v128_fallback(a, b: u8v128): u8v128 =
  var output: u8v128
  unroll(i, 0, 15):
    output[i] = a[i] + b[i]
  return output

func add_u8v128_sse(a, b: u8v128): u8v128 =
  return cast[u8v128](mm_add_epi8(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_add_u8v128: proc (a, b: u8v128): u8v128 = 
  if sseExists(): add_u8v128_sse 
  else: add_u8v128_fallback 

func add_u8v128_neon(a, b: u8v128): u8v128 =
  return cast[u8v128](vaddq_u8(cast[Uint8x16](a), cast[Uint8x16](b)))

let arm_add_u8v128: proc (a, b: u8v128): u8v128 = if neonExists(): add_u8v128_neon else: add_u8v128_fallback

func add_u8v128_lsx(a, b: u8v128): u8v128 =
  return cast[u8v128](lsx_vadd_b(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_add_u8v128: proc (a, b: u8v128): u8v128 = if lsxExists(): add_u8v128_lsx else: add_u8v128_fallback

template `+`*(a, b: u8v128): u8v128 = 
  when defined(amd64):
    x86_add_u8v128(a, b)
  elif defined(arm64):
    arm_add_u8v128(a, b)
  elif defined(loongarch64):
    la_add_u8v128(a, b)

# ========================
# add / u16v128 / value
# ========================

func add_u16v128_fallback(a, b: u16v128): u16v128 =
  var output: u16v128
  unroll(i, 0, 7):
    output[i] = a[i] + b[i]
  return output

func add_u16v128_sse(a, b: u16v128): u16v128 =
  return cast[u16v128](mm_add_epi16(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_add_u16v128: proc (a, b: u16v128): u16v128 = 
  if sseExists(): add_u16v128_sse 
  else: add_u16v128_fallback 

func add_u16v128_neon(a, b: u16v128): u16v128 =
  return cast[u16v128](vaddq_u16(cast[Uint16x8](a), cast[Uint16x8](b)))

let arm_add_u16v128: proc (a, b: u16v128): u16v128 = if neonExists(): add_u16v128_neon else: add_u16v128_fallback

func add_u16v128_lsx(a, b: u16v128): u16v128 =
  return cast[u16v128](lsx_vadd_h(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_add_u16v128: proc (a, b: u16v128): u16v128 = if lsxExists(): add_u16v128_lsx else: add_u16v128_fallback

template `+`*(a, b: u16v128): u16v128 = 
  when defined(amd64):
    x86_add_u16v128(a, b)
  elif defined(arm64):
    arm_add_u16v128(a, b)
  elif defined(loongarch64):
    la_add_u16v128(a, b)

# ========================
# add / u32v128 / value
# ========================

func add_u32v128_fallback(a, b: u32v128): u32v128 =
  var output: u32v128
  unroll(i, 0, 3):
    output[i] = a[i] + b[i]
  return output

func add_u32v128_sse(a, b: u32v128): u32v128 =
  return cast[u32v128](mm_add_epi32(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_add_u32v128: proc (a, b: u32v128): u32v128 = 
  if sseExists(): add_u32v128_sse 
  else: add_u32v128_fallback 

func add_u32v128_neon(a, b: u32v128): u32v128 =
  return cast[u32v128](vaddq_u32(cast[Uint32x4](a), cast[Uint32x4](b)))

let arm_add_u32v128: proc (a, b: u32v128): u32v128 = if neonExists(): add_u32v128_neon else: add_u32v128_fallback

func add_u32v128_lsx(a, b: u32v128): u32v128 =
  return cast[u32v128](lsx_vadd_w(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_add_u32v128: proc (a, b: u32v128): u32v128 = if lsxExists(): add_u32v128_lsx else: add_u32v128_fallback

template `+`*(a, b: u32v128): u32v128 = 
  when defined(amd64):
    x86_add_u32v128(a, b)
  elif defined(arm64):
    arm_add_u32v128(a, b)
  elif defined(loongarch64):
    la_add_u32v128(a, b)

# ========================
# add / u64v128 / value
# ========================

func add_u64v128_fallback(a, b: u64v128): u64v128 =
  var output: u64v128
  unroll(i, 0, 1):
    output[i] = a[i] + b[i]
  return output

func add_u64v128_sse(a, b: u64v128): u64v128 =
  return cast[u64v128](mm_add_epi64(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_add_u64v128: proc (a, b: u64v128): u64v128 = 
  if sseExists(): add_u64v128_sse 
  else: add_u64v128_fallback 

func add_u64v128_neon(a, b: u64v128): u64v128 =
  return cast[u64v128](vaddq_u64(cast[Uint64x2](a), cast[Uint64x2](b)))

let arm_add_u64v128: proc (a, b: u64v128): u64v128 = if neonExists(): add_u64v128_neon else: add_u64v128_fallback

func add_u64v128_lsx(a, b: u64v128): u64v128 =
  return cast[u64v128](lsx_vadd_d(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_add_u64v128: proc (a, b: u64v128): u64v128 = if lsxExists(): add_u64v128_lsx else: add_u64v128_fallback

template `+`*(a, b: u64v128): u64v128 = 
  when defined(amd64):
    x86_add_u64v128(a, b)
  elif defined(arm64):
    arm_add_u64v128(a, b)
  elif defined(loongarch64):
    la_add_u64v128(a, b)

# ========================
# sub / f32r128 / value
# ========================

func sub_f32r128_fallback(a, b: f32r128): f32r128 =
  var ca = cast[f32v128](a)
  var cb = cast[f32v128](b)
  var output: f32v128
  unroll(i, 0, 3):
    output[i] = ca[i] - cb[i]
  return cast[f32r128](output)

func sub_f32r128_sse(a, b: f32r128): f32r128 =
  return cast[f32r128](mm_sub_ps(cast[sse.M128](a), cast[sse.M128](b)))

func sub_f32r128_avx512(a, b: f32r128): f32r128 = 
  let mask: MMask8 = cast[MMask8](0x0F'u8)
  return cast[f32r128](mm_maskz_sub_ps(mask, cast[sse.M128](a), cast[sse.M128](b)))

let x86_sub_f32r128: proc (a, b: f32r128): f32r128 = 
  if avx512Exists(): sub_f32r128_avx512
  elif sseExists(): sub_f32r128_sse 
  else: sub_f32r128_fallback 

func sub_f32r128_neon(a, b: f32r128): f32r128 =
  return cast[f32r128](vsubq_f32(cast[Float32x4](a), cast[Float32x4](b)))

let arm_sub_f32r128: proc (a, b: f32r128): f32r128 = if neonExists(): sub_f32r128_neon else: sub_f32r128_fallback

func sub_f32r128_lsx(a, b: f32r128): f32r128 =
  return cast[f32r128](lsx_vfsub_s(cast[lsx.M128](a), cast[lsx.M128](b)))

let la_sub_f32r128: proc (a, b: f32r128): f32r128 = if lsxExists(): sub_f32r128_lsx else: sub_f32r128_fallback

template `-`*(a, b: f32r128): f32r128 = 
  when defined(amd64):
    x86_sub_f32r128(a, b)
  elif defined(arm64):
    arm_sub_f32r128(a, b)
  elif defined(loongarch64):
    la_sub_f32r128(a, b)

# ========================
# sub / f64r128 / value
# ========================

func sub_f64r128_fallback(a, b: f64r128): f64r128 =
  var ca = cast[f64v128](a)
  var cb = cast[f64v128](b)
  var output: f64v128
  unroll(i, 0, 1):
    output[i] = ca[i] - cb[i]
  return cast[f64r128](output)

func sub_f64r128_avx512(a, b: f64r128): f64r128 =
  let mask = cast[MMask8](0x03'u8)
  return cast[f64r128](mm_maskz_sub_pd(mask, cast[sse2.M128d](a), cast[sse2.M128d](b)))

func sub_f64r128_sse(a, b: f64r128): f64r128 =
  return cast[f64r128](mm_sub_pd(cast[sse2.M128d](a), cast[sse2.M128d](b)))

let x86_sub_f64r128: proc (a, b: f64r128): f64r128 = 
  if avx512Exists(): sub_f64r128_avx512
  elif sseExists(): sub_f64r128_sse 
  else: sub_f64r128_fallback 

func sub_f64r128_neon(a, b: f64r128): f64r128 =
  return cast[f64r128](vsubq_f64(cast[Float64x2](a), cast[Float64x2](b)))

let arm_sub_f64r128: proc (a, b: f64r128): f64r128 = if neonExists(): sub_f64r128_neon else: sub_f64r128_fallback

func sub_f64r128_lsx(a, b: f64r128): f64r128 =
  return cast[f64r128](lsx_vfsub_d(cast[lsx.M128d](a), cast[lsx.M128d](b)))

let la_sub_f64r128: proc (a, b: f64r128): f64r128 = if lsxExists(): sub_f64r128_lsx else: sub_f64r128_fallback

template `-`*(a, b: f64r128): f64r128 = 
  when defined(amd64):
    x86_sub_f64r128(a, b)
  elif defined(arm64):
    arm_sub_f64r128(a, b)
  elif defined(loongarch64):
    la_sub_f64r128(a, b)

# ========================
# sub / i8r128 / value
# ========================

func sub_i8r128_fallback(a, b: i8r128): i8r128 =
  var ca = cast[i8v128](a)
  var cb = cast[i8v128](b)
  var output: i8v128
  unroll(i, 0, 15):
    output[i] = ca[i] - cb[i]
  return cast[i8r128](output)

func sub_i8r128_sse(a, b: i8r128): i8r128 =
  return cast[i8r128](mm_sub_epi8(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_sub_i8r128: proc (a, b: i8r128): i8r128 = 
  if sseExists(): sub_i8r128_sse 
  else: sub_i8r128_fallback 

func sub_i8r128_neon(a, b: i8r128): i8r128 =
  return cast[i8r128](vsubq_s8(cast[Int8x16](a), cast[Int8x16](b)))

let arm_sub_i8r128: proc (a, b: i8r128): i8r128 = if neonExists(): sub_i8r128_neon else: sub_i8r128_fallback

func sub_i8r128_lsx(a, b: i8r128): i8r128 =
  return cast[i8r128](lsx_vsub_b(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_sub_i8r128: proc (a, b: i8r128): i8r128 = if lsxExists(): sub_i8r128_lsx else: sub_i8r128_fallback

template `-`*(a, b: i8r128): i8r128 = 
  when defined(amd64):
    x86_sub_i8r128(a, b)
  elif defined(arm64):
    arm_sub_i8r128(a, b)
  elif defined(loongarch64):
    la_sub_i8r128(a, b)

# ========================
# sub / i16r128 / value
# ========================

func sub_i16r128_fallback(a, b: i16r128): i16r128 =
  var ca = cast[i16v128](a)
  var cb = cast[i16v128](b)
  var output: i16v128
  unroll(i, 0, 7):
    output[i] = ca[i] - cb[i]
  return cast[i16r128](output)

func sub_i16r128_sse(a, b: i16r128): i16r128 =
  return cast[i16r128](mm_sub_epi16(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_sub_i16r128: proc (a, b: i16r128): i16r128 = 
  if sseExists(): sub_i16r128_sse 
  else: sub_i16r128_fallback 

func sub_i16r128_neon(a, b: i16r128): i16r128 =
  return cast[i16r128](vsubq_s16(cast[Int16x8](a), cast[Int16x8](b)))

let arm_sub_i16r128: proc (a, b: i16r128): i16r128 = if neonExists(): sub_i16r128_neon else: sub_i16r128_fallback

func sub_i16r128_lsx(a, b: i16r128): i16r128 =
  return cast[i16r128](lsx_vsub_h(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_sub_i16r128: proc (a, b: i16r128): i16r128 = if lsxExists(): sub_i16r128_lsx else: sub_i16r128_fallback

template `-`*(a, b: i16r128): i16r128 = 
  when defined(amd64):
    x86_sub_i16r128(a, b)
  elif defined(arm64):
    arm_sub_i16r128(a, b)
  elif defined(loongarch64):
    la_sub_i16r128(a, b)

# ========================
# sub / i32r128 / value
# ========================

func sub_i32r128_fallback(a, b: i32r128): i32r128 =
  var ca = cast[i32v128](a)
  var cb = cast[i32v128](b)
  var output: i32v128
  unroll(i, 0, 3):
    output[i] = ca[i] - cb[i]
  return cast[i32r128](output)

func sub_i32r128_sse(a, b: i32r128): i32r128 =
  return cast[i32r128](mm_sub_epi32(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_sub_i32r128: proc (a, b: i32r128): i32r128 = 
  if sseExists(): sub_i32r128_sse 
  else: sub_i32r128_fallback 

func sub_i32r128_neon(a, b: i32r128): i32r128 =
  return cast[i32r128](vsubq_s32(cast[Int32x4](a), cast[Int32x4](b)))

let arm_sub_i32r128: proc (a, b: i32r128): i32r128 = if neonExists(): sub_i32r128_neon else: sub_i32r128_fallback

func sub_i32r128_lsx(a, b: i32r128): i32r128 =
  return cast[i32r128](lsx_vsub_w(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_sub_i32r128: proc (a, b: i32r128): i32r128 = if lsxExists(): sub_i32r128_lsx else: sub_i32r128_fallback

template `-`*(a, b: i32r128): i32r128 = 
  when defined(amd64):
    x86_sub_i32r128(a, b)
  elif defined(arm64):
    arm_sub_i32r128(a, b)
  elif defined(loongarch64):
    la_sub_i32r128(a, b)

# ========================
# sub / i64r128 / value
# ========================

func sub_i64r128_fallback(a, b: i64r128): i64r128 =
  var ca = cast[i64v128](a)
  var cb = cast[i64v128](b)
  var output: i64v128
  unroll(i, 0, 1):
    output[i] = ca[i] - cb[i]
  return cast[i64r128](output)

func sub_i64r128_sse(a, b: i64r128): i64r128 =
  return cast[i64r128](mm_sub_epi64(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_sub_i64r128: proc (a, b: i64r128): i64r128 = 
  if sseExists(): sub_i64r128_sse 
  else: sub_i64r128_fallback 

func sub_i64r128_neon(a, b: i64r128): i64r128 =
  return cast[i64r128](vsubq_s64(cast[Int64x2](a), cast[Int64x2](b)))

let arm_sub_i64r128: proc (a, b: i64r128): i64r128 = if neonExists(): sub_i64r128_neon else: sub_i64r128_fallback

func sub_i64r128_lsx(a, b: i64r128): i64r128 =
  return cast[i64r128](lsx_vsub_d(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_sub_i64r128: proc (a, b: i64r128): i64r128 = if lsxExists(): sub_i64r128_lsx else: sub_i64r128_fallback

template `-`*(a, b: i64r128): i64r128 = 
  when defined(amd64):
    x86_sub_i64r128(a, b)
  elif defined(arm64):
    arm_sub_i64r128(a, b)
  elif defined(loongarch64):
    la_sub_i64r128(a, b)

# ========================
# sub / u8r128 / value
# ========================

func sub_u8r128_fallback(a, b: u8r128): u8r128 =
  var ca = cast[u8v128](a)
  var cb = cast[u8v128](b)
  var output: u8v128
  unroll(i, 0, 15):
    output[i] = ca[i] - cb[i]
  return cast[u8r128](output)

func sub_u8r128_sse(a, b: u8r128): u8r128 =
  return cast[u8r128](mm_sub_epi8(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_sub_u8r128: proc (a, b: u8r128): u8r128 = 
  if sseExists(): sub_u8r128_sse 
  else: sub_u8r128_fallback 

func sub_u8r128_neon(a, b: u8r128): u8r128 =
  return cast[u8r128](vsubq_u8(cast[Uint8x16](a), cast[Uint8x16](b)))

let arm_sub_u8r128: proc (a, b: u8r128): u8r128 = if neonExists(): sub_u8r128_neon else: sub_u8r128_fallback

func sub_u8r128_lsx(a, b: u8r128): u8r128 =
  return cast[u8r128](lsx_vsub_b(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_sub_u8r128: proc (a, b: u8r128): u8r128 = if lsxExists(): sub_u8r128_lsx else: sub_u8r128_fallback

template `-`*(a, b: u8r128): u8r128 = 
  when defined(amd64):
    x86_sub_u8r128(a, b)
  elif defined(arm64):
    arm_sub_u8r128(a, b)
  elif defined(loongarch64):
    la_sub_u8r128(a, b)

# ========================
# sub / u16r128 / value
# ========================

func sub_u16r128_fallback(a, b: u16r128): u16r128 =
  var ca = cast[u16v128](a)
  var cb = cast[u16v128](b)
  var output: u16v128
  unroll(i, 0, 7):
    output[i] = ca[i] - cb[i]
  return cast[u16r128](output)

func sub_u16r128_sse(a, b: u16r128): u16r128 =
  return cast[u16r128](mm_sub_epi16(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_sub_u16r128: proc (a, b: u16r128): u16r128 = 
  if sseExists(): sub_u16r128_sse 
  else: sub_u16r128_fallback 

func sub_u16r128_neon(a, b: u16r128): u16r128 =
  return cast[u16r128](vsubq_u16(cast[Uint16x8](a), cast[Uint16x8](b)))

let arm_sub_u16r128: proc (a, b: u16r128): u16r128 = if neonExists(): sub_u16r128_neon else: sub_u16r128_fallback

func sub_u16r128_lsx(a, b: u16r128): u16r128 =
  return cast[u16r128](lsx_vsub_h(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_sub_u16r128: proc (a, b: u16r128): u16r128 = if lsxExists(): sub_u16r128_lsx else: sub_u16r128_fallback

template `-`*(a, b: u16r128): u16r128 = 
  when defined(amd64):
    x86_sub_u16r128(a, b)
  elif defined(arm64):
    arm_sub_u16r128(a, b)
  elif defined(loongarch64):
    la_sub_u16r128(a, b)

# ========================
# sub / u32r128 / value
# ========================

func sub_u32r128_fallback(a, b: u32r128): u32r128 =
  var ca = cast[u32v128](a)
  var cb = cast[u32v128](b)
  var output: u32v128
  unroll(i, 0, 3):
    output[i] = ca[i] - cb[i]
  return cast[u32r128](output)

func sub_u32r128_sse(a, b: u32r128): u32r128 =
  return cast[u32r128](mm_sub_epi32(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_sub_u32r128: proc (a, b: u32r128): u32r128 = 
  if sseExists(): sub_u32r128_sse 
  else: sub_u32r128_fallback 

func sub_u32r128_neon(a, b: u32r128): u32r128 =
  return cast[u32r128](vsubq_u32(cast[Uint32x4](a), cast[Uint32x4](b)))

let arm_sub_u32r128: proc (a, b: u32r128): u32r128 = if neonExists(): sub_u32r128_neon else: sub_u32r128_fallback

func sub_u32r128_lsx(a, b: u32r128): u32r128 =
  return cast[u32r128](lsx_vsub_w(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_sub_u32r128: proc (a, b: u32r128): u32r128 = if lsxExists(): sub_u32r128_lsx else: sub_u32r128_fallback

template `-`*(a, b: u32r128): u32r128 = 
  when defined(amd64):
    x86_sub_u32r128(a, b)
  elif defined(arm64):
    arm_sub_u32r128(a, b)
  elif defined(loongarch64):
    la_sub_u32r128(a, b)

# ========================
# sub / u64r128 / value
# ========================

func sub_u64r128_fallback(a, b: u64r128): u64r128 =
  var ca = cast[u64v128](a)
  var cb = cast[u64v128](b)
  var output: u64v128
  unroll(i, 0, 1):
    output[i] = ca[i] - cb[i]
  return cast[u64r128](output)

func sub_u64r128_sse(a, b: u64r128): u64r128 =
  return cast[u64r128](mm_sub_epi64(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_sub_u64r128: proc (a, b: u64r128): u64r128 = 
  if sseExists(): sub_u64r128_sse 
  else: sub_u64r128_fallback 

func sub_u64r128_neon(a, b: u64r128): u64r128 =
  return cast[u64r128](vsubq_u64(cast[Uint64x2](a), cast[Uint64x2](b)))

let arm_sub_u64r128: proc (a, b: u64r128): u64r128 = if neonExists(): sub_u64r128_neon else: sub_u64r128_fallback

func sub_u64r128_lsx(a, b: u64r128): u64r128 =
  return cast[u64r128](lsx_vsub_d(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_sub_u64r128: proc (a, b: u64r128): u64r128 = if lsxExists(): sub_u64r128_lsx else: sub_u64r128_fallback

template `-`*(a, b: u64r128): u64r128 = 
  when defined(amd64):
    x86_sub_u64r128(a, b)
  elif defined(arm64):
    arm_sub_u64r128(a, b)
  elif defined(loongarch64):
    la_sub_u64r128(a, b)

# ========================
# sub / f32v128 / value
# ========================

func sub_f32v128_fallback(a, b: f32v128): f32v128 =
  var output: f32v128
  unroll(i, 0, 3):
    output[i] = a[i] - b[i]
  return output

func sub_f32v128_sse(a, b: f32v128): f32v128 =
  return cast[f32v128](mm_sub_ps(cast[sse.M128](a), cast[sse.M128](b)))

func sub_f32v128_avx512(a, b: f32v128): f32v128 = 
  let mask: MMask8 = cast[MMask8](0x0F'u8)
  return cast[f32v128](mm_maskz_sub_ps(mask, cast[sse.M128](a), cast[sse.M128](b)))

let x86_sub_f32v128: proc (a, b: f32v128): f32v128 = 
  if avx512Exists(): sub_f32v128_avx512
  elif sseExists(): sub_f32v128_sse 
  else: sub_f32v128_fallback 

func sub_f32v128_neon(a, b: f32v128): f32v128 =
  return cast[f32v128](vsubq_f32(cast[Float32x4](a), cast[Float32x4](b)))

let arm_sub_f32v128: proc (a, b: f32v128): f32v128 = if neonExists(): sub_f32v128_neon else: sub_f32v128_fallback

func sub_f32v128_lsx(a, b: f32v128): f32v128 =
  return cast[f32v128](lsx_vfsub_s(cast[lsx.M128](a), cast[lsx.M128](b)))

let la_sub_f32v128: proc (a, b: f32v128): f32v128 = if lsxExists(): sub_f32v128_lsx else: sub_f32v128_fallback

template `-`*(a, b: f32v128): f32v128 = 
  when defined(amd64):
    x86_sub_f32v128(a, b)
  elif defined(arm64):
    arm_sub_f32v128(a, b)
  elif defined(loongarch64):
    la_sub_f32v128(a, b)

# ========================
# sub / f64v128 / value
# ========================

func sub_f64v128_fallback(a, b: f64v128): f64v128 =
  var output: f64v128
  unroll(i, 0, 1):
    output[i] = a[i] - b[i]
  return output

func sub_f64v128_avx512(a, b: f64v128): f64v128 =
  let mask = cast[MMask8](0x03'u8)
  return cast[f64v128](mm_maskz_sub_pd(mask, cast[sse2.M128d](a), cast[sse2.M128d](b)))

func sub_f64v128_sse(a, b: f64v128): f64v128 =
  return cast[f64v128](mm_sub_pd(cast[sse2.M128d](a), cast[sse2.M128d](b)))

let x86_sub_f64v128: proc (a, b: f64v128): f64v128 = 
  if avx512Exists(): sub_f64v128_avx512
  elif sseExists(): sub_f64v128_sse 
  else: sub_f64v128_fallback 

func sub_f64v128_neon(a, b: f64v128): f64v128 =
  return cast[f64v128](vsubq_f64(cast[Float64x2](a), cast[Float64x2](b)))

let arm_sub_f64v128: proc (a, b: f64v128): f64v128 = if neonExists(): sub_f64v128_neon else: sub_f64v128_fallback

func sub_f64v128_lsx(a, b: f64v128): f64v128 =
  return cast[f64v128](lsx_vfsub_d(cast[lsx.M128d](a), cast[lsx.M128d](b)))

let la_sub_f64v128: proc (a, b: f64v128): f64v128 = if lsxExists(): sub_f64v128_lsx else: sub_f64v128_fallback

template `-`*(a, b: f64v128): f64v128 = 
  when defined(amd64):
    x86_sub_f64v128(a, b)
  elif defined(arm64):
    arm_sub_f64v128(a, b)
  elif defined(loongarch64):
    la_sub_f64v128(a, b)

# ========================
# sub / i8v128 / value
# ========================

func sub_i8v128_fallback(a, b: i8v128): i8v128 =
  var output: i8v128
  unroll(i, 0, 15):
    output[i] = a[i] - b[i]
  return output

func sub_i8v128_sse(a, b: i8v128): i8v128 =
  return cast[i8v128](mm_sub_epi8(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_sub_i8v128: proc (a, b: i8v128): i8v128 = 
  if sseExists(): sub_i8v128_sse 
  else: sub_i8v128_fallback 

func sub_i8v128_neon(a, b: i8v128): i8v128 =
  return cast[i8v128](vsubq_s8(cast[Int8x16](a), cast[Int8x16](b)))

let arm_sub_i8v128: proc (a, b: i8v128): i8v128 = if neonExists(): sub_i8v128_neon else: sub_i8v128_fallback

func sub_i8v128_lsx(a, b: i8v128): i8v128 =
  return cast[i8v128](lsx_vsub_b(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_sub_i8v128: proc (a, b: i8v128): i8v128 = if lsxExists(): sub_i8v128_lsx else: sub_i8v128_fallback

template `-`*(a, b: i8v128): i8v128 = 
  when defined(amd64):
    x86_sub_i8v128(a, b)
  elif defined(arm64):
    arm_sub_i8v128(a, b)
  elif defined(loongarch64):
    la_sub_i8v128(a, b)

# ========================
# sub / i16v128 / value
# ========================

func sub_i16v128_fallback(a, b: i16v128): i16v128 =
  var output: i16v128
  unroll(i, 0, 7):
    output[i] = a[i] - b[i]
  return output

func sub_i16v128_sse(a, b: i16v128): i16v128 =
  return cast[i16v128](mm_sub_epi16(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_sub_i16v128: proc (a, b: i16v128): i16v128 = 
  if sseExists(): sub_i16v128_sse 
  else: sub_i16v128_fallback 

func sub_i16v128_neon(a, b: i16v128): i16v128 =
  return cast[i16v128](vsubq_s16(cast[Int16x8](a), cast[Int16x8](b)))

let arm_sub_i16v128: proc (a, b: i16v128): i16v128 = if neonExists(): sub_i16v128_neon else: sub_i16v128_fallback

func sub_i16v128_lsx(a, b: i16v128): i16v128 =
  return cast[i16v128](lsx_vsub_h(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_sub_i16v128: proc (a, b: i16v128): i16v128 = if lsxExists(): sub_i16v128_lsx else: sub_i16v128_fallback

template `-`*(a, b: i16v128): i16v128 = 
  when defined(amd64):
    x86_sub_i16v128(a, b)
  elif defined(arm64):
    arm_sub_i16v128(a, b)
  elif defined(loongarch64):
    la_sub_i16v128(a, b)

# ========================
# sub / i32v128 / value
# ========================

func sub_i32v128_fallback(a, b: i32v128): i32v128 =
  var output: i32v128
  unroll(i, 0, 3):
    output[i] = a[i] - b[i]
  return output

func sub_i32v128_sse(a, b: i32v128): i32v128 =
  return cast[i32v128](mm_sub_epi32(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_sub_i32v128: proc (a, b: i32v128): i32v128 = 
  if sseExists(): sub_i32v128_sse 
  else: sub_i32v128_fallback 

func sub_i32v128_neon(a, b: i32v128): i32v128 =
  return cast[i32v128](vsubq_s32(cast[Int32x4](a), cast[Int32x4](b)))

let arm_sub_i32v128: proc (a, b: i32v128): i32v128 = if neonExists(): sub_i32v128_neon else: sub_i32v128_fallback

func sub_i32v128_lsx(a, b: i32v128): i32v128 =
  return cast[i32v128](lsx_vsub_w(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_sub_i32v128: proc (a, b: i32v128): i32v128 = if lsxExists(): sub_i32v128_lsx else: sub_i32v128_fallback

template `-`*(a, b: i32v128): i32v128 = 
  when defined(amd64):
    x86_sub_i32v128(a, b)
  elif defined(arm64):
    arm_sub_i32v128(a, b)
  elif defined(loongarch64):
    la_sub_i32v128(a, b)

# ========================
# sub / i64v128 / value
# ========================

func sub_i64v128_fallback(a, b: i64v128): i64v128 =
  var output: i64v128
  unroll(i, 0, 1):
    output[i] = a[i] - b[i]
  return output

func sub_i64v128_sse(a, b: i64v128): i64v128 =
  return cast[i64v128](mm_sub_epi64(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_sub_i64v128: proc (a, b: i64v128): i64v128 = 
  if sseExists(): sub_i64v128_sse 
  else: sub_i64v128_fallback 

func sub_i64v128_neon(a, b: i64v128): i64v128 =
  return cast[i64v128](vsubq_s64(cast[Int64x2](a), cast[Int64x2](b)))

let arm_sub_i64v128: proc (a, b: i64v128): i64v128 = if neonExists(): sub_i64v128_neon else: sub_i64v128_fallback

func sub_i64v128_lsx(a, b: i64v128): i64v128 =
  return cast[i64v128](lsx_vsub_d(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_sub_i64v128: proc (a, b: i64v128): i64v128 = if lsxExists(): sub_i64v128_lsx else: sub_i64v128_fallback

template `-`*(a, b: i64v128): i64v128 = 
  when defined(amd64):
    x86_sub_i64v128(a, b)
  elif defined(arm64):
    arm_sub_i64v128(a, b)
  elif defined(loongarch64):
    la_sub_i64v128(a, b)

# ========================
# sub / u8v128 / value
# ========================

func sub_u8v128_fallback(a, b: u8v128): u8v128 =
  var output: u8v128
  unroll(i, 0, 15):
    output[i] = a[i] - b[i]
  return output

func sub_u8v128_sse(a, b: u8v128): u8v128 =
  return cast[u8v128](mm_sub_epi8(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_sub_u8v128: proc (a, b: u8v128): u8v128 = 
  if sseExists(): sub_u8v128_sse 
  else: sub_u8v128_fallback 

func sub_u8v128_neon(a, b: u8v128): u8v128 =
  return cast[u8v128](vsubq_u8(cast[Uint8x16](a), cast[Uint8x16](b)))

let arm_sub_u8v128: proc (a, b: u8v128): u8v128 = if neonExists(): sub_u8v128_neon else: sub_u8v128_fallback

func sub_u8v128_lsx(a, b: u8v128): u8v128 =
  return cast[u8v128](lsx_vsub_b(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_sub_u8v128: proc (a, b: u8v128): u8v128 = if lsxExists(): sub_u8v128_lsx else: sub_u8v128_fallback

template `-`*(a, b: u8v128): u8v128 = 
  when defined(amd64):
    x86_sub_u8v128(a, b)
  elif defined(arm64):
    arm_sub_u8v128(a, b)
  elif defined(loongarch64):
    la_sub_u8v128(a, b)

# ========================
# sub / u16v128 / value
# ========================

func sub_u16v128_fallback(a, b: u16v128): u16v128 =
  var output: u16v128
  unroll(i, 0, 7):
    output[i] = a[i] - b[i]
  return output

func sub_u16v128_sse(a, b: u16v128): u16v128 =
  return cast[u16v128](mm_sub_epi16(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_sub_u16v128: proc (a, b: u16v128): u16v128 = 
  if sseExists(): sub_u16v128_sse 
  else: sub_u16v128_fallback 

func sub_u16v128_neon(a, b: u16v128): u16v128 =
  return cast[u16v128](vsubq_u16(cast[Uint16x8](a), cast[Uint16x8](b)))

let arm_sub_u16v128: proc (a, b: u16v128): u16v128 = if neonExists(): sub_u16v128_neon else: sub_u16v128_fallback

func sub_u16v128_lsx(a, b: u16v128): u16v128 =
  return cast[u16v128](lsx_vsub_h(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_sub_u16v128: proc (a, b: u16v128): u16v128 = if lsxExists(): sub_u16v128_lsx else: sub_u16v128_fallback

template `-`*(a, b: u16v128): u16v128 = 
  when defined(amd64):
    x86_sub_u16v128(a, b)
  elif defined(arm64):
    arm_sub_u16v128(a, b)
  elif defined(loongarch64):
    la_sub_u16v128(a, b)

# ========================
# sub / u32v128 / value
# ========================

func sub_u32v128_fallback(a, b: u32v128): u32v128 =
  var output: u32v128
  unroll(i, 0, 3):
    output[i] = a[i] - b[i]
  return output

func sub_u32v128_sse(a, b: u32v128): u32v128 =
  return cast[u32v128](mm_sub_epi32(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_sub_u32v128: proc (a, b: u32v128): u32v128 = 
  if sseExists(): sub_u32v128_sse 
  else: sub_u32v128_fallback 

func sub_u32v128_neon(a, b: u32v128): u32v128 =
  return cast[u32v128](vsubq_u32(cast[Uint32x4](a), cast[Uint32x4](b)))

let arm_sub_u32v128: proc (a, b: u32v128): u32v128 = if neonExists(): sub_u32v128_neon else: sub_u32v128_fallback

func sub_u32v128_lsx(a, b: u32v128): u32v128 =
  return cast[u32v128](lsx_vsub_w(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_sub_u32v128: proc (a, b: u32v128): u32v128 = if lsxExists(): sub_u32v128_lsx else: sub_u32v128_fallback

template `-`*(a, b: u32v128): u32v128 = 
  when defined(amd64):
    x86_sub_u32v128(a, b)
  elif defined(arm64):
    arm_sub_u32v128(a, b)
  elif defined(loongarch64):
    la_sub_u32v128(a, b)

# ========================
# sub / u64v128 / value
# ========================

func sub_u64v128_fallback(a, b: u64v128): u64v128 =
  var output: u64v128
  unroll(i, 0, 1):
    output[i] = a[i] - b[i]
  return output

func sub_u64v128_sse(a, b: u64v128): u64v128 =
  return cast[u64v128](mm_sub_epi64(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_sub_u64v128: proc (a, b: u64v128): u64v128 = 
  if sseExists(): sub_u64v128_sse 
  else: sub_u64v128_fallback 

func sub_u64v128_neon(a, b: u64v128): u64v128 =
  return cast[u64v128](vsubq_u64(cast[Uint64x2](a), cast[Uint64x2](b)))

let arm_sub_u64v128: proc (a, b: u64v128): u64v128 = if neonExists(): sub_u64v128_neon else: sub_u64v128_fallback

func sub_u64v128_lsx(a, b: u64v128): u64v128 =
  return cast[u64v128](lsx_vsub_d(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_sub_u64v128: proc (a, b: u64v128): u64v128 = if lsxExists(): sub_u64v128_lsx else: sub_u64v128_fallback

template `-`*(a, b: u64v128): u64v128 = 
  when defined(amd64):
    x86_sub_u64v128(a, b)
  elif defined(arm64):
    arm_sub_u64v128(a, b)
  elif defined(loongarch64):
    la_sub_u64v128(a, b)

# ========================
# mul / f32r128 / value
# ========================

func mul_f32r128_fallback(a, b: f32r128): f32r128 =
  var ca = cast[f32v128](a)
  var cb = cast[f32v128](b)
  var output: f32v128
  unroll(i, 0, 3):
    output[i] = ca[i] * cb[i]
  return cast[f32r128](output)

func mul_f32r128_sse(a, b: f32r128): f32r128 =
  return cast[f32r128](mm_mul_ps(cast[sse.M128](a), cast[sse.M128](b)))

func mul_f32r128_avx512(a, b: f32r128): f32r128 = 
  let mask: MMask8 = cast[MMask8](0x0F'u8)
  return cast[f32r128](mm_maskz_mul_ps(mask, cast[sse.M128](a), cast[sse.M128](b)))

let x86_mul_f32r128: proc (a, b: f32r128): f32r128 = 
  if avx512Exists(): mul_f32r128_avx512
  elif sseExists(): mul_f32r128_sse 
  else: mul_f32r128_fallback 

func mul_f32r128_neon(a, b: f32r128): f32r128 =
  return cast[f32r128](vmulq_f32(cast[Float32x4](a), cast[Float32x4](b)))

let arm_mul_f32r128: proc (a, b: f32r128): f32r128 = if neonExists(): mul_f32r128_neon else: mul_f32r128_fallback

func mul_f32r128_lsx(a, b: f32r128): f32r128 =
  return cast[f32r128](lsx_vfmul_s(cast[lsx.M128](a), cast[lsx.M128](b)))

let la_mul_f32r128: proc (a, b: f32r128): f32r128 = if lsxExists(): mul_f32r128_lsx else: mul_f32r128_fallback

template `*`*(a, b: f32r128): f32r128 = 
  when defined(amd64):
    x86_mul_f32r128(a, b)
  elif defined(arm64):
    arm_mul_f32r128(a, b)
  elif defined(loongarch64):
    la_mul_f32r128(a, b)

# ========================
# mul / f64r128 / value
# ========================

func mul_f64r128_fallback(a, b: f64r128): f64r128 =
  var ca = cast[f64v128](a)
  var cb = cast[f64v128](b)
  var output: f64v128
  unroll(i, 0, 1):
    output[i] = ca[i] * cb[i]
  return cast[f64r128](output)

func mul_f64r128_sse(a, b: f64r128): f64r128 =
  return cast[f64r128](mm_mul_pd(cast[sse2.M128d](a), cast[sse2.M128d](b)))

func mul_f64r128_avx512(a, b: f64r128): f64r128 =
  let mask = cast[MMask8](0x03'u8)
  return cast[f64r128](mm_maskz_mul_pd(mask, cast[sse2.M128d](a), cast[sse2.M128d](b)))

let x86_mul_f64r128: proc (a, b: f64r128): f64r128 = 
  if avx512Exists(): mul_f64r128_avx512
  elif sseExists(): mul_f64r128_sse 
  else: mul_f64r128_fallback 

func mul_f64r128_neon(a, b: f64r128): f64r128 =
  return cast[f64r128](vmulq_f64(cast[Float64x2](a), cast[Float64x2](b)))

let arm_mul_f64r128: proc (a, b: f64r128): f64r128 = if neonExists(): mul_f64r128_neon else: mul_f64r128_fallback

func mul_f64r128_lsx(a, b: f64r128): f64r128 =
  return cast[f64r128](lsx_vfmul_d(cast[lsx.M128d](a), cast[lsx.M128d](b)))

let la_mul_f64r128: proc (a, b: f64r128): f64r128 = if lsxExists(): mul_f64r128_lsx else: mul_f64r128_fallback

template `*`*(a, b: f64r128): f64r128 = 
  when defined(amd64):
    x86_mul_f64r128(a, b)
  elif defined(arm64):
    arm_mul_f64r128(a, b)
  elif defined(loongarch64):
    la_mul_f64r128(a, b)

# ========================
# mul / i8r128 / value
# ========================

func mul_i8r128_fallback(a, b: i8r128): i8r128 =
  var ca = cast[i8v128](a)
  var cb = cast[i8v128](b)
  var output: i8v128
  unroll(i, 0, 15):
    output[i] = ca[i] * cb[i]
  return cast[i8r128](output)

let x86_mul_i8r128: proc (a, b: i8r128): i8r128 = 
  mul_i8r128_fallback 

func mul_i8r128_neon(a, b: i8r128): i8r128 =
  return cast[i8r128](vmulq_s8(cast[Int8x16](a), cast[Int8x16](b)))

let arm_mul_i8r128: proc (a, b: i8r128): i8r128 = if neonExists(): mul_i8r128_neon else: mul_i8r128_fallback

func mul_i8r128_lsx(a, b: i8r128): i8r128 =
  return cast[i8r128](lsx_vmul_b(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_mul_i8r128: proc (a, b: i8r128): i8r128 = if lsxExists(): mul_i8r128_lsx else: mul_i8r128_fallback

template `*`*(a, b: i8r128): i8r128 = 
  when defined(amd64):
    x86_mul_i8r128(a, b)
  elif defined(arm64):
    arm_mul_i8r128(a, b)
  elif defined(loongarch64):
    la_mul_i8r128(a, b)

# ========================
# mul / i16r128 / value
# ========================

func mul_i16r128_fallback(a, b: i16r128): i16r128 =
  var ca = cast[i16v128](a)
  var cb = cast[i16v128](b)
  var output: i16v128
  unroll(i, 0, 7):
    output[i] = ca[i] * cb[i]
  return cast[i16r128](output)

func mul_i16r128_sse(a, b: i16r128): i16r128 =
  return cast[i16r128](mm_mullo_epi16(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_mul_i16r128: proc (a, b: i16r128): i16r128 = 
  if sseExists(): mul_i16r128_sse 
  else: mul_i16r128_fallback 

func mul_i16r128_neon(a, b: i16r128): i16r128 =
  return cast[i16r128](vmulq_s16(cast[Int16x8](a), cast[Int16x8](b)))

let arm_mul_i16r128: proc (a, b: i16r128): i16r128 = if neonExists(): mul_i16r128_neon else: mul_i16r128_fallback

func mul_i16r128_lsx(a, b: i16r128): i16r128 =
  return cast[i16r128](lsx_vmul_h(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_mul_i16r128: proc (a, b: i16r128): i16r128 = if lsxExists(): mul_i16r128_lsx else: mul_i16r128_fallback

template `*`*(a, b: i16r128): i16r128 = 
  when defined(amd64):
    x86_mul_i16r128(a, b)
  elif defined(arm64):
    arm_mul_i16r128(a, b)
  elif defined(loongarch64):
    la_mul_i16r128(a, b)

# ========================
# mul / i32r128 / value
# ========================

func mul_i32r128_fallback(a, b: i32r128): i32r128 =
  var ca = cast[i32v128](a)
  var cb = cast[i32v128](b)
  var output: i32v128
  unroll(i, 0, 3):
    output[i] = ca[i] * cb[i]
  return cast[i32r128](output)

func mul_i32r128_sse41(a, b: i32r128): i32r128 =
  return cast[i32r128](mm_mullo_epi32(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_mul_i32r128: proc (a, b: i32r128): i32r128 = 
  if sseExists(): mul_i32r128_sse41
  else: mul_i32r128_fallback 

func mul_i32r128_neon(a, b: i32r128): i32r128 =
  return cast[i32r128](vmulq_s32(cast[Int32x4](a), cast[Int32x4](b)))

let arm_mul_i32r128: proc (a, b: i32r128): i32r128 = if neonExists(): mul_i32r128_neon else: mul_i32r128_fallback

func mul_i32r128_lsx(a, b: i32r128): i32r128 =
  return cast[i32r128](lsx_vmul_w(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_mul_i32r128: proc (a, b: i32r128): i32r128 = if lsxExists(): mul_i32r128_lsx else: mul_i32r128_fallback

template `*`*(a, b: i32r128): i32r128 = 
  when defined(amd64):
    x86_mul_i32r128(a, b)
  elif defined(arm64):
    arm_mul_i32r128(a, b)
  elif defined(loongarch64):
    la_mul_i32r128(a, b)

# ========================
# mul / i64r128 / value
# ========================

func mul_i64r128_fallback(a, b: i64r128): i64r128 =
  var ca = cast[i64v128](a)
  var cb = cast[i64v128](b)
  var output: i64v128
  unroll(i, 0, 1):
    output[i] = ca[i] * cb[i]
  return cast[i64r128](output)

let x86_mul_i64r128: proc (a, b: i64r128): i64r128 = mul_i64r128_fallback

let arm_mul_i64r128: proc (a, b: i64r128): i64r128 = mul_i64r128_fallback

func mul_i64r128_lsx(a, b: i64r128): i64r128 =
  return cast[i64r128](lsx_vmul_d(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_mul_i64r128: proc (a, b: i64r128): i64r128 = if lsxExists(): mul_i64r128_lsx else: mul_i64r128_fallback

template `*`*(a, b: i64r128): i64r128 = 
  when defined(amd64):
    x86_mul_i64r128(a, b)
  elif defined(arm64):
    arm_mul_i64r128(a, b)
  elif defined(loongarch64):
    la_mul_i64r128(a, b)

# ========================
# mul / u8r128 / value
# ========================

func mul_u8r128_fallback(a, b: u8r128): u8r128 =
  var ca = cast[u8v128](a)
  var cb = cast[u8v128](b)
  var output: u8v128
  unroll(i, 0, 15):
    output[i] = ca[i] * cb[i]
  return cast[u8r128](output)

let x86_mul_u8r128: proc (a, b: u8r128): u8r128 = 
  mul_u8r128_fallback

func mul_u8r128_neon(a, b: u8r128): u8r128 =
  return cast[u8r128](vmulq_u8(cast[Uint8x16](a), cast[Uint8x16](b)))

let arm_mul_u8r128: proc (a, b: u8r128): u8r128 = if neonExists(): mul_u8r128_neon else: mul_u8r128_fallback

func mul_u8r128_lsx(a, b: u8r128): u8r128 =
  return cast[u8r128](lsx_vmul_b(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_mul_u8r128: proc (a, b: u8r128): u8r128 = if lsxExists(): mul_u8r128_lsx else: mul_u8r128_fallback

template `*`*(a, b: u8r128): u8r128 = 
  when defined(amd64):
    x86_mul_u8r128(a, b)
  elif defined(arm64):
    arm_mul_u8r128(a, b)
  elif defined(loongarch64):
    la_mul_u8r128(a, b)

# ========================
# mul / u16r128 / value
# ========================

func mul_u16r128_fallback(a, b: u16r128): u16r128 =
  var ca = cast[u16v128](a)
  var cb = cast[u16v128](b)
  var output: u16v128
  unroll(i, 0, 7):
    output[i] = ca[i] * cb[i]
  return cast[u16r128](output)

func mul_u16r128_sse(a, b: u16r128): u16r128 =
  return cast[u16r128](mm_mullo_epi16(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_mul_u16r128: proc (a, b: u16r128): u16r128 = 
  if sseExists(): mul_u16r128_sse 
  else: mul_u16r128_fallback 

func mul_u16r128_neon(a, b: u16r128): u16r128 =
  return cast[u16r128](vmulq_u16(cast[Uint16x8](a), cast[Uint16x8](b)))

let arm_mul_u16r128: proc (a, b: u16r128): u16r128 = if neonExists(): mul_u16r128_neon else: mul_u16r128_fallback

func mul_u16r128_lsx(a, b: u16r128): u16r128 =
  return cast[u16r128](lsx_vmul_h(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_mul_u16r128: proc (a, b: u16r128): u16r128 = if lsxExists(): mul_u16r128_lsx else: mul_u16r128_fallback

template `*`*(a, b: u16r128): u16r128 = 
  when defined(amd64):
    x86_mul_u16r128(a, b)
  elif defined(arm64):
    arm_mul_u16r128(a, b)
  elif defined(loongarch64):
    la_mul_u16r128(a, b)

# ========================
# mul / u32r128 / value
# ========================

func mul_u32r128_fallback(a, b: u32r128): u32r128 =
  var ca = cast[u32v128](a)
  var cb = cast[u32v128](b)
  var output: u32v128
  unroll(i, 0, 3):
    output[i] = ca[i] * cb[i]
  return cast[u32r128](output)

func mul_u32r128_sse41(a, b: u32r128): u32r128 =
  return cast[u32r128](mm_mullo_epi32(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_mul_u32r128: proc (a, b: u32r128): u32r128 = 
  if sseExists(): mul_u32r128_sse41 
  else: mul_u32r128_fallback 

func mul_u32r128_neon(a, b: u32r128): u32r128 =
  return cast[u32r128](vmulq_u32(cast[Uint32x4](a), cast[Uint32x4](b)))

let arm_mul_u32r128: proc (a, b: u32r128): u32r128 = if neonExists(): mul_u32r128_neon else: mul_u32r128_fallback

func mul_u32r128_lsx(a, b: u32r128): u32r128 =
  return cast[u32r128](lsx_vmul_w(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_mul_u32r128: proc (a, b: u32r128): u32r128 = if lsxExists(): mul_u32r128_lsx else: mul_u32r128_fallback

template `*`*(a, b: u32r128): u32r128 = 
  when defined(amd64):
    x86_mul_u32r128(a, b)
  elif defined(arm64):
    arm_mul_u32r128(a, b)
  elif defined(loongarch64):
    la_mul_u32r128(a, b)

# ========================
# mul / u64r128 / values
# ========================

func mul_u64r128_fallback(a, b: u64r128): u64r128 =
  var ca = cast[u64v128](a)
  var cb = cast[u64v128](b)
  var output: u64v128
  unroll(i, 0, 1):
    output[i] = ca[i] * cb[i]
  return cast[u64r128](output)

let x86_mul_u64r128: proc (a, b: u64r128): u64r128 = mul_u64r128_fallback

let arm_mul_u64r128: proc (a, b: u64r128): u64r128 = mul_u64r128_fallback

func mul_u64r128_lsx(a, b: u64r128): u64r128 =
  return cast[u64r128](lsx_vmul_d(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_mul_u64r128: proc (a, b: u64r128): u64r128 = if lsxExists(): mul_u64r128_lsx else: mul_u64r128_fallback

template `*`*(a, b: u64r128): u64r128 = 
  when defined(amd64):
    x86_mul_u64r128(a, b)
  elif defined(arm64):
    arm_mul_u64r128(a, b)
  elif defined(loongarch64):
    la_mul_u64r128(a, b)

# ========================
# mul / f32v128 / value
# ========================

func mul_f32v128_fallback(a, b: f32v128): f32v128 =
  var output: f32v128
  unroll(i, 0, 3):
    output[i] = a[i] * b[i]
  return output

func mul_f32v128_sse(a, b: f32v128): f32v128 =
  return cast[f32v128](mm_mul_ps(cast[sse.M128](a), cast[sse.M128](b)))

func mul_f32v128_avx512(a, b: f32v128): f32v128 = 
  let mask: MMask8 = cast[MMask8](0x0F'u8)
  return cast[f32v128](mm_maskz_mul_ps(mask, cast[sse.M128](a), cast[sse.M128](b)))

let x86_mul_f32v128: proc (a, b: f32v128): f32v128 = 
  if avx512Exists(): mul_f32v128_avx512
  elif sseExists(): mul_f32v128_sse 
  else: mul_f32v128_fallback 

func mul_f32v128_neon(a, b: f32v128): f32v128 =
  return cast[f32v128](vmulq_f32(cast[Float32x4](a), cast[Float32x4](b)))

let arm_mul_f32v128: proc (a, b: f32v128): f32v128 = if neonExists(): mul_f32v128_neon else: mul_f32v128_fallback

func mul_f32v128_lsx(a, b: f32v128): f32v128 =
  return cast[f32v128](lsx_vfmul_s(cast[lsx.M128](a), cast[lsx.M128](b)))

let la_mul_f32v128: proc (a, b: f32v128): f32v128 = if lsxExists(): mul_f32v128_lsx else: mul_f32v128_fallback

template `*`*(a, b: f32v128): f32v128 = 
  when defined(amd64):
    x86_mul_f32v128(a, b)
  elif defined(arm64):
    arm_mul_f32v128(a, b)
  elif defined(loongarch64):
    la_mul_f32v128(a, b)

# ========================
# mul / f64v128 / value
# ========================

func mul_f64v128_fallback(a, b: f64v128): f64v128 =
  var output: f64v128
  unroll(i, 0, 1):
    output[i] = a[i] * b[i]
  return output

func mul_f64v128_sse(a, b: f64v128): f64v128 =
  return cast[f64v128](mm_mul_pd(cast[sse2.M128d](a), cast[sse2.M128d](b)))

func mul_f64v128_avx512(a, b: f64v128): f64v128 =
  let mask = cast[MMask8](0x03'u8)
  return cast[f64v128](mm_maskz_mul_pd(mask, cast[sse2.M128d](a), cast[sse2.M128d](b)))

let x86_mul_f64v128: proc (a, b: f64v128): f64v128 = 
  if avx512Exists(): mul_f64v128_avx512
  elif sseExists(): mul_f64v128_sse 
  else: mul_f64v128_fallback 

func mul_f64v128_neon(a, b: f64v128): f64v128 =
  return cast[f64v128](vmulq_f64(cast[Float64x2](a), cast[Float64x2](b)))

let arm_mul_f64v128: proc (a, b: f64v128): f64v128 = if neonExists(): mul_f64v128_neon else: mul_f64v128_fallback

func mul_f64v128_lsx(a, b: f64v128): f64v128 =
  return cast[f64v128](lsx_vfmul_d(cast[lsx.M128d](a), cast[lsx.M128d](b)))

let la_mul_f64v128: proc (a, b: f64v128): f64v128 = if lsxExists(): mul_f64v128_lsx else: mul_f64v128_fallback

template `*`*(a, b: f64v128): f64v128 = 
  when defined(amd64):
    x86_mul_f64v128(a, b)
  elif defined(arm64):
    arm_mul_f64v128(a, b)
  elif defined(loongarch64):
    la_mul_f64v128(a, b)

# ========================
# mul / i8v128 / value
# ========================

func mul_i8v128_fallback(a, b: i8v128): i8v128 =
  var output: i8v128
  unroll(i, 0, 15):
    output[i] = a[i] * b[i]
  return output

let x86_mul_i8v128: proc (a, b: i8v128): i8v128 = 
  mul_i8v128_fallback 

func mul_i8v128_neon(a, b: i8v128): i8v128 =
  return cast[i8v128](vmulq_s8(cast[Int8x16](a), cast[Int8x16](b)))

let arm_mul_i8v128: proc (a, b: i8v128): i8v128 = if neonExists(): mul_i8v128_neon else: mul_i8v128_fallback

func mul_i8v128_lsx(a, b: i8v128): i8v128 =
  return cast[i8v128](lsx_vmul_b(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_mul_i8v128: proc (a, b: i8v128): i8v128 = if lsxExists(): mul_i8v128_lsx else: mul_i8v128_fallback

template `*`*(a, b: i8v128): i8v128 = 
  when defined(amd64):
    x86_mul_i8v128(a, b)
  elif defined(arm64):
    arm_mul_i8v128(a, b)
  elif defined(loongarch64):
    la_mul_i8v128(a, b)

# ========================
# mul / i16v128 / value
# ========================

func mul_i16v128_fallback(a, b: i16v128): i16v128 =
  var output: i16v128
  unroll(i, 0, 7):
    output[i] = a[i] * b[i]
  return output

func mul_i16v128_sse(a, b: i16v128): i16v128 =
  return cast[i16v128](mm_mullo_epi16(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_mul_i16v128: proc (a, b: i16v128): i16v128 = 
  if sseExists(): mul_i16v128_sse 
  else: mul_i16v128_fallback 

func mul_i16v128_neon(a, b: i16v128): i16v128 =
  return cast[i16v128](vmulq_s16(cast[Int16x8](a), cast[Int16x8](b)))

let arm_mul_i16v128: proc (a, b: i16v128): i16v128 = if neonExists(): mul_i16v128_neon else: mul_i16v128_fallback

func mul_i16v128_lsx(a, b: i16v128): i16v128 =
  return cast[i16v128](lsx_vmul_h(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_mul_i16v128: proc (a, b: i16v128): i16v128 = if lsxExists(): mul_i16v128_lsx else: mul_i16v128_fallback

template `*`*(a, b: i16v128): i16v128 = 
  when defined(amd64):
    x86_mul_i16v128(a, b)
  elif defined(arm64):
    arm_mul_i16v128(a, b)
  elif defined(loongarch64):
    la_mul_i16v128(a, b)

# ========================
# mul / i32v128 / value
# ========================

func mul_i32v128_fallback(a, b: i32v128): i32v128 =
  var output: i32v128
  unroll(i, 0, 3):
    output[i] = a[i] * b[i]
  return output

func mul_i32v128_sse41(a, b: i32v128): i32v128 =
  return cast[i32v128](mm_mullo_epi32(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_mul_i32v128: proc (a, b: i32v128): i32v128 = 
  if sseExists(): mul_i32v128_sse41
  else: mul_i32v128_fallback 

func mul_i32v128_neon(a, b: i32v128): i32v128 =
  return cast[i32v128](vmulq_s32(cast[Int32x4](a), cast[Int32x4](b)))

let arm_mul_i32v128: proc (a, b: i32v128): i32v128 = if neonExists(): mul_i32v128_neon else: mul_i32v128_fallback

func mul_i32v128_lsx(a, b: i32v128): i32v128 =
  return cast[i32v128](lsx_vmul_w(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_mul_i32v128: proc (a, b: i32v128): i32v128 = if lsxExists(): mul_i32v128_lsx else: mul_i32v128_fallback

template `*`*(a, b: i32v128): i32v128 = 
  when defined(amd64):
    x86_mul_i32v128(a, b)
  elif defined(arm64):
    arm_mul_i32v128(a, b)
  elif defined(loongarch64):
    la_mul_i32v128(a, b)

# ========================
# mul / i64v128 / value
# ========================

func mul_i64v128_fallback(a, b: i64v128): i64v128 =
  var output: i64v128
  unroll(i, 0, 1):
    output[i] = a[i] * b[i]
  return output

let x86_mul_i64v128: proc (a, b: i64v128): i64v128 = mul_i64v128_fallback

let arm_mul_i64v128: proc (a, b: i64v128): i64v128 =  mul_i64v128_fallback

func mul_i64v128_lsx(a, b: i64v128): i64v128 =
  return cast[i64v128](lsx_vmul_d(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_mul_i64v128: proc (a, b: i64v128): i64v128 = if lsxExists(): mul_i64v128_lsx else: mul_i64v128_fallback

template `*`*(a, b: i64v128): i64v128 = 
  when defined(amd64):
    x86_mul_i64v128(a, b)
  elif defined(arm64):
    arm_mul_i64v128(a, b)
  elif defined(loongarch64):
    la_mul_i64v128(a, b)

# ========================
# mul / u8v128 / value
# ========================

func mul_u8v128_fallback(a, b: u8v128): u8v128 =
  var output: u8v128
  unroll(i, 0, 15):
    output[i] = a[i] * b[i]
  return output

let x86_mul_u8v128: proc (a, b: u8v128): u8v128 = 
  mul_u8v128_fallback

func mul_u8v128_neon(a, b: u8v128): u8v128 =
  return cast[u8v128](vmulq_u8(cast[Uint8x16](a), cast[Uint8x16](b)))

let arm_mul_u8v128: proc (a, b: u8v128): u8v128 = if neonExists(): mul_u8v128_neon else: mul_u8v128_fallback

func mul_u8v128_lsx(a, b: u8v128): u8v128 =
  return cast[u8v128](lsx_vmul_b(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_mul_u8v128: proc (a, b: u8v128): u8v128 = if lsxExists(): mul_u8v128_lsx else: mul_u8v128_fallback

template `*`*(a, b: u8v128): u8v128 = 
  when defined(amd64):
    x86_mul_u8v128(a, b)
  elif defined(arm64):
    arm_mul_u8v128(a, b)
  elif defined(loongarch64):
    la_mul_u8v128(a, b)

# ========================
# mul / u16v128 / value
# ========================

func mul_u16v128_fallback(a, b: u16v128): u16v128 =
  var output: u16v128
  unroll(i, 0, 7):
    output[i] = a[i] * b[i]
  return output

func mul_u16v128_sse(a, b: u16v128): u16v128 =
  return cast[u16v128](mm_mullo_epi16(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_mul_u16v128: proc (a, b: u16v128): u16v128 = 
  if sseExists(): mul_u16v128_sse 
  else: mul_u16v128_fallback 

func mul_u16v128_neon(a, b: u16v128): u16v128 =
  return cast[u16v128](vmulq_u16(cast[Uint16x8](a), cast[Uint16x8](b)))

let arm_mul_u16v128: proc (a, b: u16v128): u16v128 = if neonExists(): mul_u16v128_neon else: mul_u16v128_fallback

func mul_u16v128_lsx(a, b: u16v128): u16v128 =
  return cast[u16v128](lsx_vmul_h(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_mul_u16v128: proc (a, b: u16v128): u16v128 = if lsxExists(): mul_u16v128_lsx else: mul_u16v128_fallback

template `*`*(a, b: u16v128): u16v128 = 
  when defined(amd64):
    x86_mul_u16v128(a, b)
  elif defined(arm64):
    arm_mul_u16v128(a, b)
  elif defined(loongarch64):
    la_mul_u16v128(a, b)

# ========================
# mul / u32v128 / value
# ========================

func mul_u32v128_fallback(a, b: u32v128): u32v128 =
  var output: u32v128
  unroll(i, 0, 3):
    output[i] = a[i] * b[i]
  return output

func mul_u32v128_sse41(a, b: u32v128): u32v128 =
  return cast[u32v128](mm_mullo_epi32(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_mul_u32v128: proc (a, b: u32v128): u32v128 = 
  if sseExists(): mul_u32v128_sse41 
  else: mul_u32v128_fallback 

func mul_u32v128_neon(a, b: u32v128): u32v128 =
  return cast[u32v128](vmulq_u32(cast[Uint32x4](a), cast[Uint32x4](b)))

let arm_mul_u32v128: proc (a, b: u32v128): u32v128 = if neonExists(): mul_u32v128_neon else: mul_u32v128_fallback

func mul_u32v128_lsx(a, b: u32v128): u32v128 =
  return cast[u32v128](lsx_vmul_w(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_mul_u32v128: proc (a, b: u32v128): u32v128 = if lsxExists(): mul_u32v128_lsx else: mul_u32v128_fallback

template `*`*(a, b: u32v128): u32v128 = 
  when defined(amd64):
    x86_mul_u32v128(a, b)
  elif defined(arm64):
    arm_mul_u32v128(a, b)
  elif defined(loongarch64):
    la_mul_u32v128(a, b)

# ========================
# mul / u64v128 / value
# ========================

func mul_u64v128_fallback(a, b: u64v128): u64v128 =
  var output: u64v128
  unroll(i, 0, 1):
    output[i] = a[i] * b[i]
  return output

let x86_mul_u64v128: proc (a, b: u64v128): u64v128 = mul_u64v128_fallback

let arm_mul_u64v128: proc (a, b: u64v128): u64v128 = mul_u64v128_fallback

func mul_u64v128_lsx(a, b: u64v128): u64v128 =
  return cast[u64v128](lsx_vmul_d(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_mul_u64v128: proc (a, b: u64v128): u64v128 = if lsxExists(): mul_u64v128_lsx else: mul_u64v128_fallback

template `*`*(a, b: u64v128): u64v128 = 
  when defined(amd64):
    x86_mul_u64v128(a, b)
  elif defined(arm64):
    arm_mul_u64v128(a, b)
  elif defined(loongarch64):
    la_mul_u64v128(a, b)

# ========================
# and / f32r128 / value
# ========================

func and_f32r128_fallback(a, b: f32r128): f32r128 =
  var output: f32r128
  when CPUBits == 64:
    let p: ptr array[2, uint64] = cast[ptr array[2, uint64]](addr output)
    unroll(i, 0, 1):
      p[i] = cast[array[2, uint64]](a)[i] and cast[array[2, uint64]](b)[i]
  else:
    unroll(i, 0, 3):
      cast[f32v128](output)[i] = float32(cast[uint32](cast[f32v128](a)[i]) and cast[uint32](cast[f32v128](b)[i]))
  return output

func and_f32r128_sse(a, b: f32r128): f32r128 =
  return cast[f32r128](mm_and_ps(cast[sse.M128](a), cast[sse.M128](b)))

let x86_and_f32r128: proc (a, b: f32r128): f32r128 = 
  if sseExists(): and_f32r128_sse 
  else: and_f32r128_fallback 

func and_f32r128_neon(a, b: f32r128): f32r128 =
  return cast[f32r128](vandq_u32(cast[Uint32x4](a), cast[Uint32x4](b)))

let arm_and_f32r128: proc (a, b: f32r128): f32r128 = if neonExists(): and_f32r128_neon else: and_f32r128_fallback

func and_f32r128_lsx(a, b: f32r128): f32r128 =
  return cast[f32r128](lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_and_f32r128: proc (a, b: f32r128): f32r128 = if lsxExists(): and_f32r128_lsx else: and_f32r128_fallback

template `and`*(a, b: f32r128): f32r128 = 
  when defined(amd64): x86_and_f32r128(a, b)
  elif defined(arm64): arm_and_f32r128(a, b)
  elif defined(loongarch64): la_and_f32r128(a, b)

# ========================
# and / f64r128 / value
# ========================

func and_f64r128_fallback(a, b: f64r128): f64r128 =
  var output: f64r128
  when CPUBits == 64:
    let p: ptr array[2, float64] = cast[ptr array[2, float64]](addr output)
    unroll(i, 0, 1):
      p[i] = float64(cast[uint32](cast[f64v128](a)[i]) and cast[uint32](cast[f64v128](b)[i]))
  else:
    let p: ptr array[4, uint32] = cast[ptr array[4, uint32]](addr output)
    unroll(i, 0, 3):
      p[i] = cast[array[4, uint32]](a)[i] and cast[array[4, uint32]](b)[i]
  return output

func and_f64r128_sse(a, b: f64r128): f64r128 =
  return cast[f64r128](mm_and_pd(cast[sse2.M128d](a), cast[sse2.M128d](b)))

let x86_and_f64r128: proc (a, b: f64r128): f64r128 = 
  if sseExists(): and_f64r128_sse 
  else: and_f64r128_fallback 

func and_f64r128_neon(a, b: f64r128): f64r128 =
  return cast[f64r128](vandq_u64(cast[Uint64x2](a), cast[Uint64x2](b)))

let arm_and_f64r128: proc (a, b: f64r128): f64r128 = if neonExists(): and_f64r128_neon else: and_f64r128_fallback

func and_f64r128_lsx(a, b: f64r128): f64r128 =
  return cast[f64r128](lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_and_f64r128: proc (a, b: f64r128): f64r128 = if lsxExists(): and_f64r128_lsx else: and_f64r128_fallback

template `and`*(a, b: f64r128): f64r128 = 
  when defined(amd64): x86_and_f64r128(a, b)
  elif defined(arm64): arm_and_f64r128(a, b)
  elif defined(loongarch64): la_and_f64r128(a, b)

# ========================
# and / i8r128 / value
# ========================

func and_i8r128_fallback(a, b: i8r128): i8r128 = 
  var output: i8r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] and pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] and pB[i]
  return output

func and_i8r128_sse(a, b: i8r128): i8r128 = 
  return cast[i8r128](mm_and_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_and_i8r128: proc (a, b: i8r128): i8r128 = 
  if sseExists(): and_i8r128_sse 
  else: and_i8r128_fallback 

func and_i8r128_neon(a, b: i8r128): i8r128 =
  return cast[i8r128](vandq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b)))

let arm_and_i8r128: proc (a, b: i8r128): i8r128 = if neonExists(): and_i8r128_neon else: and_i8r128_fallback

func and_i8r128_lsx(a, b: i8r128): i8r128 =
  return cast[i8r128](lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_and_i8r128: proc (a, b: i8r128): i8r128 = if lsxExists(): and_i8r128_lsx else: and_i8r128_fallback

template `and`*(a, b: i8r128): i8r128 = 
  when defined(amd64) or defined(i386): x86_and_i8r128(a, b)
  elif defined(arm64): arm_and_i8r128(a, b)
  elif defined(loongarch64): la_and_i8r128(a, b)

# ========================
# and / i16r128 / value
# ========================

func and_i16r128_fallback(a, b: i16r128): i16r128 = 
  var output: i16r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] and pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] and pB[i]
  return output

func and_i16r128_sse(a, b: i16r128): i16r128 = 
  return cast[i16r128](mm_and_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_and_i16r128: proc (a, b: i16r128): i16r128 = 
  if sseExists(): and_i16r128_sse 
  else: and_i16r128_fallback 

func and_i16r128_neon(a, b: i16r128): i16r128 =
  return cast[i16r128](vandq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b)))

let arm_and_i16r128: proc (a, b: i16r128): i16r128 = if neonExists(): and_i16r128_neon else: and_i16r128_fallback

func and_i16r128_lsx(a, b: i16r128): i16r128 =
  return cast[i16r128](lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_and_i16r128: proc (a, b: i16r128): i16r128 = if lsxExists(): and_i16r128_lsx else: and_i16r128_fallback

template `and`*(a, b: i16r128): i16r128 = 
  when defined(amd64) or defined(i386): x86_and_i16r128(a, b)
  elif defined(arm64): arm_and_i16r128(a, b)
  elif defined(loongarch64): la_and_i16r128(a, b)

# ========================
# and / i32r128 / value
# ========================

func and_i32r128_fallback(a, b: i32r128): i32r128 = 
  var output: i32r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] and pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] and pB[i]
  return output

func and_i32r128_sse(a, b: i32r128): i32r128 = 
  return cast[i32r128](mm_and_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_and_i32r128: proc (a, b: i32r128): i32r128 = 
  if sseExists(): and_i32r128_sse 
  else: and_i32r128_fallback 

func and_i32r128_neon(a, b: i32r128): i32r128 =
  return cast[i32r128](vandq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b)))

let arm_and_i32r128: proc (a, b: i32r128): i32r128 = if neonExists(): and_i32r128_neon else: and_i32r128_fallback

func and_i32r128_lsx(a, b: i32r128): i32r128 =
  return cast[i32r128](lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_and_i32r128: proc (a, b: i32r128): i32r128 = if lsxExists(): and_i32r128_lsx else: and_i32r128_fallback

template `and`*(a, b: i32r128): i32r128 = 
  when defined(amd64) or defined(i386): x86_and_i32r128(a, b)
  elif defined(arm64): arm_and_i32r128(a, b)
  elif defined(loongarch64): la_and_i32r128(a, b)

# ========================
# and / i64r128 / value
# ========================

func and_i64r128_fallback(a, b: i64r128): i64r128 = 
  var output: i64r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] and pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] and pB[i]
  return output

func and_i64r128_sse(a, b: i64r128): i64r128 = 
  return cast[i64r128](mm_and_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_and_i64r128: proc (a, b: i64r128): i64r128 = 
  if sseExists(): and_i64r128_sse 
  else: and_i64r128_fallback 

func and_i64r128_neon(a, b: i64r128): i64r128 =
  return cast[i64r128](vandq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b)))

let arm_and_i64r128: proc (a, b: i64r128): i64r128 = if neonExists(): and_i64r128_neon else: and_i64r128_fallback

func and_i64r128_lsx(a, b: i64r128): i64r128 =
  return cast[i64r128](lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_and_i64r128: proc (a, b: i64r128): i64r128 = if lsxExists(): and_i64r128_lsx else: and_i64r128_fallback

template `and`*(a, b: i64r128): i64r128 = 
  when defined(amd64) or defined(i386): x86_and_i64r128(a, b)
  elif defined(arm64): arm_and_i64r128(a, b)
  elif defined(loongarch64): la_and_i64r128(a, b)

# ========================
# and / u8r128 / value
# ========================

func and_u8r128_fallback(a, b: u8r128): u8r128 = 
  var output: u8r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] and pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] and pB[i]
  return output

func and_u8r128_sse(a, b: u8r128): u8r128 = 
  return cast[u8r128](mm_and_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_and_u8r128: proc (a, b: u8r128): u8r128 = 
  if sseExists(): and_u8r128_sse 
  else: and_u8r128_fallback 

func and_u8r128_neon(a, b: u8r128): u8r128 =
  return cast[u8r128](vandq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b)))

let arm_and_u8r128: proc (a, b: u8r128): u8r128 = if neonExists(): and_u8r128_neon else: and_u8r128_fallback

func and_u8r128_lsx(a, b: u8r128): u8r128 =
  return cast[u8r128](lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_and_u8r128: proc (a, b: u8r128): u8r128 = if lsxExists(): and_u8r128_lsx else: and_u8r128_fallback

template `and`*(a, b: u8r128): u8r128 = 
  when defined(amd64) or defined(i386): x86_and_u8r128(a, b)
  elif defined(arm64): arm_and_u8r128(a, b)
  elif defined(loongarch64): la_and_u8r128(a, b)

# ========================
# and / u16r128 / value
# ========================

func and_u16r128_fallback(a, b: u16r128): u16r128 = 
  var output: u16r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] and pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] and pB[i]
  return output

func and_u16r128_sse(a, b: u16r128): u16r128 = 
  return cast[u16r128](mm_and_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_and_u16r128: proc (a, b: u16r128): u16r128 = 
  if sseExists(): and_u16r128_sse 
  else: and_u16r128_fallback 

func and_u16r128_neon(a, b: u16r128): u16r128 =
  return cast[u16r128](vandq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b)))

let arm_and_u16r128: proc (a, b: u16r128): u16r128 = if neonExists(): and_u16r128_neon else: and_u16r128_fallback

func and_u16r128_lsx(a, b: u16r128): u16r128 =
  return cast[u16r128](lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_and_u16r128: proc (a, b: u16r128): u16r128 = if lsxExists(): and_u16r128_lsx else: and_u16r128_fallback

template `and`*(a, b: u16r128): u16r128 = 
  when defined(amd64) or defined(i386): x86_and_u16r128(a, b)
  elif defined(arm64): arm_and_u16r128(a, b)
  elif defined(loongarch64): la_and_u16r128(a, b)

# ========================
# and / u32r128 / value
# ========================

func and_u32r128_fallback(a, b: u32r128): u32r128 = 
  var output: u32r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] and pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] and pB[i]
  return output

func and_u32r128_sse(a, b: u32r128): u32r128 = 
  return cast[u32r128](mm_and_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_and_u32r128: proc (a, b: u32r128): u32r128 = 
  if sseExists(): and_u32r128_sse 
  else: and_u32r128_fallback 

func and_u32r128_neon(a, b: u32r128): u32r128 =
  return cast[u32r128](vandq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b)))

let arm_and_u32r128: proc (a, b: u32r128): u32r128 = if neonExists(): and_u32r128_neon else: and_u32r128_fallback

func and_u32r128_lsx(a, b: u32r128): u32r128 =
  return cast[u32r128](lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_and_u32r128: proc (a, b: u32r128): u32r128 = if lsxExists(): and_u32r128_lsx else: and_u32r128_fallback

template `and`*(a, b: u32r128): u32r128 = 
  when defined(amd64) or defined(i386): x86_and_u32r128(a, b)
  elif defined(arm64): arm_and_u32r128(a, b)
  elif defined(loongarch64): la_and_u32r128(a, b)

# ========================
# and / u64r128 / value
# ========================

func and_u64r128_fallback(a, b: u64r128): u64r128 = 
  var output: u64r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] and pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] and pB[i]
  return output

func and_u64r128_sse(a, b: u64r128): u64r128 = 
  return cast[u64r128](mm_and_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_and_u64r128: proc (a, b: u64r128): u64r128 = 
  if sseExists(): and_u64r128_sse 
  else: and_u64r128_fallback 

func and_u64r128_neon(a, b: u64r128): u64r128 =
  return cast[u64r128](vandq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b)))

let arm_and_u64r128: proc (a, b: u64r128): u64r128 = if neonExists(): and_u64r128_neon else: and_u64r128_fallback

func and_u64r128_lsx(a, b: u64r128): u64r128 =
  return cast[u64r128](lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_and_u64r128: proc (a, b: u64r128): u64r128 = if lsxExists(): and_u64r128_lsx else: and_u64r128_fallback

template `and`*(a, b: u64r128): u64r128 = 
  when defined(amd64) or defined(i386): x86_and_u64r128(a, b)
  elif defined(arm64): arm_and_u64r128(a, b)
  elif defined(loongarch64): la_and_u64r128(a, b)

# ========================
# and / f32v128 / value
# ========================

func and_f32v128_fallback(a, b: f32v128): f32v128 =
  var output: f32v128
  when CPUBits == 64:
    let p: ptr array[2, uint64] = cast[ptr array[2, uint64]](addr output[0])
    unroll(i, 0, 1):
      p[i] = cast[array[2, uint64]](a)[i] and cast[array[2, uint64]](b)[i]
  else:
    unroll(i, 0, 3):
      output[i] = float32(cast[uint32](a) and cast[uint32](b))
  return output

func and_f32v128_sse(a, b: f32v128): f32v128 =
  return cast[f32v128](mm_and_ps(cast[sse.M128](a), cast[sse.M128](b)))

let x86_and_f32v128: proc (a, b: f32v128): f32v128 = 
  if sseExists(): and_f32v128_sse 
  else: and_f32v128_fallback 

func and_f32v128_neon(a, b: f32v128): f32v128 =
  return cast[f32v128](vandq_u32(cast[Uint32x4](a), cast[Uint32x4](b)))

let arm_and_f32v128: proc (a, b: f32v128): f32v128 = if neonExists(): and_f32v128_neon else: and_f32v128_fallback

func and_f32v128_lsx(a, b: f32v128): f32v128 =
  return cast[f32v128](lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_and_f32v128: proc (a, b: f32v128): f32v128 = if lsxExists(): and_f32v128_lsx else: and_f32v128_fallback

template `and`*(a, b: f32v128): f32v128 = 
  when defined(amd64): x86_and_f32v128(a, b)
  elif defined(arm64): arm_and_f32v128(a, b)
  elif defined(loongarch64): la_and_f32v128(a, b)

# ========================
# and / f64v128 / value
# ========================

func and_f64v128_fallback(a, b: f64v128): f64v128 =
  var output: f64v128
  when CPUBits == 64:
    unroll(i, 0, 1):
      output[i] = float64(cast[uint32](a[i]) and cast[uint32](b[i]))
  else:
    let p: ptr array[4, uint32] = cast[ptr array[4, uint32]](addr output[0])
    unroll(i, 0, 3):
      p[i] = cast[array[4, uint32]](a)[i] and cast[array[4, uint32]](b)[i]
  return output

func and_f64v128_sse(a, b: f64v128): f64v128 =
  return cast[f64v128](mm_and_pd(cast[sse2.M128d](a), cast[sse2.M128d](b)))

let x86_and_f64v128: proc (a, b: f64v128): f64v128 = 
  if sseExists(): and_f64v128_sse 
  else: and_f64v128_fallback 

func and_f64v128_neon(a, b: f64v128): f64v128 =
  return cast[f64v128](vandq_u64(cast[Uint64x2](a), cast[Uint64x2](b)))

let arm_and_f64v128: proc (a, b: f64v128): f64v128 = if neonExists(): and_f64v128_neon else: and_f64v128_fallback

func and_f64v128_lsx(a, b: f64v128): f64v128 =
  return cast[f64v128](lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_and_f64v128: proc (a, b: f64v128): f64v128 = if lsxExists(): and_f64v128_lsx else: and_f64v128_fallback

template `and`*(a, b: f64v128): f64v128 = 
  when defined(amd64): x86_and_f64v128(a, b)
  elif defined(arm64): arm_and_f64v128(a, b)
  elif defined(loongarch64): la_and_f64v128(a, b)

# ========================
# and / i8v128 / value
# ========================

func and_i8v128_fallback(a, b: i8v128): i8v128 = 
  var output: i8v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] and pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] and pB[i]
  return output

func and_i8v128_sse(a, b: i8v128): i8v128 = 
  return cast[i8v128](mm_and_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_and_i8v128: proc (a, b: i8v128): i8v128 = 
  if sseExists(): and_i8v128_sse 
  else: and_i8v128_fallback 

func and_i8v128_neon(a, b: i8v128): i8v128 =
  return cast[i8v128](vandq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b)))

let arm_and_i8v128: proc (a, b: i8v128): i8v128 = if neonExists(): and_i8v128_neon else: and_i8v128_fallback

func and_i8v128_lsx(a, b: i8v128): i8v128 =
  return cast[i8v128](lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_and_i8v128: proc (a, b: i8v128): i8v128 = if lsxExists(): and_i8v128_lsx else: and_i8v128_fallback

template `and`*(a, b: i8v128): i8v128 = 
  when defined(amd64) or defined(i386): x86_and_i8v128(a, b)
  elif defined(arm64): arm_and_i8v128(a, b)
  elif defined(loongarch64): la_and_i8v128(a, b)

# ========================
# and / i16v128 / value
# ========================

func and_i16v128_fallback(a, b: i16v128): i16v128 = 
  var output: i16v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] and pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] and pB[i]
  return output

func and_i16v128_sse(a, b: i16v128): i16v128 = 
  return cast[i16v128](mm_and_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_and_i16v128: proc (a, b: i16v128): i16v128 = 
  if sseExists(): and_i16v128_sse 
  else: and_i16v128_fallback 

func and_i16v128_neon(a, b: i16v128): i16v128 =
  return cast[i16v128](vandq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b)))

let arm_and_i16v128: proc (a, b: i16v128): i16v128 = if neonExists(): and_i16v128_neon else: and_i16v128_fallback

func and_i16v128_lsx(a, b: i16v128): i16v128 =
  return cast[i16v128](lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_and_i16v128: proc (a, b: i16v128): i16v128 = if lsxExists(): and_i16v128_lsx else: and_i16v128_fallback

template `and`*(a, b: i16v128): i16v128 = 
  when defined(amd64) or defined(i386): x86_and_i16v128(a, b)
  elif defined(arm64): arm_and_i16v128(a, b)
  elif defined(loongarch64): la_and_i16v128(a, b)

# ========================
# and / i32v128 / value
# ========================

func and_i32v128_fallback(a, b: i32v128): i32v128 = 
  var output: i32v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] and pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] and pB[i]
  return output

func and_i32v128_sse(a, b: i32v128): i32v128 = 
  return cast[i32v128](mm_and_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_and_i32v128: proc (a, b: i32v128): i32v128 = 
  if sseExists(): and_i32v128_sse 
  else: and_i32v128_fallback 

func and_i32v128_neon(a, b: i32v128): i32v128 =
  return cast[i32v128](vandq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b)))

let arm_and_i32v128: proc (a, b: i32v128): i32v128 = if neonExists(): and_i32v128_neon else: and_i32v128_fallback

func and_i32v128_lsx(a, b: i32v128): i32v128 =
  return cast[i32v128](lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_and_i32v128: proc (a, b: i32v128): i32v128 = if lsxExists(): and_i32v128_lsx else: and_i32v128_fallback

template `and`*(a, b: i32v128): i32v128 = 
  when defined(amd64) or defined(i386): x86_and_i32v128(a, b)
  elif defined(arm64): arm_and_i32v128(a, b)
  elif defined(loongarch64): la_and_i32v128(a, b)

# ========================
# and / i64v128 / value
# ========================

func and_i64v128_fallback(a, b: i64v128): i64v128 = 
  var output: i64v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] and pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] and pB[i]
  return output

func and_i64v128_sse(a, b: i64v128): i64v128 = 
  return cast[i64v128](mm_and_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_and_i64v128: proc (a, b: i64v128): i64v128 = 
  if sseExists(): and_i64v128_sse 
  else: and_i64v128_fallback 

func and_i64v128_neon(a, b: i64v128): i64v128 =
  return cast[i64v128](vandq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b)))

let arm_and_i64v128: proc (a, b: i64v128): i64v128 = if neonExists(): and_i64v128_neon else: and_i64v128_fallback

func and_i64v128_lsx(a, b: i64v128): i64v128 =
  return cast[i64v128](lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_and_i64v128: proc (a, b: i64v128): i64v128 = if lsxExists(): and_i64v128_lsx else: and_i64v128_fallback

template `and`*(a, b: i64v128): i64v128 = 
  when defined(amd64) or defined(i386): x86_and_i64v128(a, b)
  elif defined(arm64): arm_and_i64v128(a, b)
  elif defined(loongarch64): la_and_i64v128(a, b)

# ========================
# and / u8v128 / value
# ========================

func and_u8v128_fallback(a, b: u8v128): u8v128 = 
  var output: u8v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] and pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] and pB[i]
  return output

func and_u8v128_sse(a, b: u8v128): u8v128 = 
  return cast[u8v128](mm_and_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_and_u8v128: proc (a, b: u8v128): u8v128 = 
  if sseExists(): and_u8v128_sse 
  else: and_u8v128_fallback 

func and_u8v128_neon(a, b: u8v128): u8v128 =
  return cast[u8v128](vandq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b)))

let arm_and_u8v128: proc (a, b: u8v128): u8v128 = if neonExists(): and_u8v128_neon else: and_u8v128_fallback

func and_u8v128_lsx(a, b: u8v128): u8v128 =
  return cast[u8v128](lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_and_u8v128: proc (a, b: u8v128): u8v128 = if lsxExists(): and_u8v128_lsx else: and_u8v128_fallback

template `and`*(a, b: u8v128): u8v128 = 
  when defined(amd64) or defined(i386): x86_and_u8v128(a, b)
  elif defined(arm64): arm_and_u8v128(a, b)
  elif defined(loongarch64): la_and_u8v128(a, b)

# ========================
# and / u16v128 / value
# ========================

func and_u16v128_fallback(a, b: u16v128): u16v128 = 
  var output: u16v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] and pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] and pB[i]
  return output

func and_u16v128_sse(a, b: u16v128): u16v128 = 
  return cast[u16v128](mm_and_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_and_u16v128: proc (a, b: u16v128): u16v128 = 
  if sseExists(): and_u16v128_sse 
  else: and_u16v128_fallback 

func and_u16v128_neon(a, b: u16v128): u16v128 =
  return cast[u16v128](vandq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b)))

let arm_and_u16v128: proc (a, b: u16v128): u16v128 = if neonExists(): and_u16v128_neon else: and_u16v128_fallback

func and_u16v128_lsx(a, b: u16v128): u16v128 =
  return cast[u16v128](lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_and_u16v128: proc (a, b: u16v128): u16v128 = if lsxExists(): and_u16v128_lsx else: and_u16v128_fallback

template `and`*(a, b: u16v128): u16v128 = 
  when defined(amd64) or defined(i386): x86_and_u16v128(a, b)
  elif defined(arm64): arm_and_u16v128(a, b)
  elif defined(loongarch64): la_and_u16v128(a, b)

# ========================
# and / u32v128 / value
# ========================

func and_u32v128_fallback(a, b: u32v128): u32v128 = 
  var output: u32v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] and pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] and pB[i]
  return output

func and_u32v128_sse(a, b: u32v128): u32v128 = 
  return cast[u32v128](mm_and_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_and_u32v128: proc (a, b: u32v128): u32v128 = 
  if sseExists(): and_u32v128_sse 
  else: and_u32v128_fallback 

func and_u32v128_neon(a, b: u32v128): u32v128 =
  return cast[u32v128](vandq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b)))

let arm_and_u32v128: proc (a, b: u32v128): u32v128 = if neonExists(): and_u32v128_neon else: and_u32v128_fallback

func and_u32v128_lsx(a, b: u32v128): u32v128 =
  return cast[u32v128](lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_and_u32v128: proc (a, b: u32v128): u32v128 = if lsxExists(): and_u32v128_lsx else: and_u32v128_fallback

template `and`*(a, b: u32v128): u32v128 = 
  when defined(amd64) or defined(i386): x86_and_u32v128(a, b)
  elif defined(arm64): arm_and_u32v128(a, b)
  elif defined(loongarch64): la_and_u32v128(a, b)

# ========================
# and / u64v128 / value
# ========================

func and_u64v128_fallback(a, b: u64v128): u64v128 = 
  var output: u64v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] and pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] and pB[i]
  return output

func and_u64v128_sse(a, b: u64v128): u64v128 = 
  return cast[u64v128](mm_and_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_and_u64v128: proc (a, b: u64v128): u64v128 = 
  if sseExists(): and_u64v128_sse 
  else: and_u64v128_fallback 

func and_u64v128_neon(a, b: u64v128): u64v128 =
  return cast[u64v128](vandq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b)))

let arm_and_u64v128: proc (a, b: u64v128): u64v128 = if neonExists(): and_u64v128_neon else: and_u64v128_fallback

func and_u64v128_lsx(a, b: u64v128): u64v128 =
  return cast[u64v128](lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_and_u64v128: proc (a, b: u64v128): u64v128 = if lsxExists(): and_u64v128_lsx else: and_u64v128_fallback

template `and`*(a, b: u64v128): u64v128 = 
  when defined(amd64) or defined(i386): x86_and_u64v128(a, b)
  elif defined(arm64): arm_and_u64v128(a, b)
  elif defined(loongarch64): la_and_u64v128(a, b)

# ========================
# or / f32r128 / value
# ========================

func or_f32r128_fallback(a, b: f32r128): f32r128 =
  var output: f32r128
  when CPUBits == 64:
    let p: ptr array[2, uint64] = cast[ptr array[2, uint64]](addr output)
    unroll(i, 0, 1):
      p[i] = cast[array[2, uint64]](a)[i] or cast[array[2, uint64]](b)[i]
  else:
    unroll(i, 0, 3):
      cast[f32v128](output)[i] = float32(cast[uint32](cast[f32v128](a)[i]) or cast[uint32](cast[f32v128](b)[i]))
  return output

func or_f32r128_sse(a, b: f32r128): f32r128 =
  return cast[f32r128](mm_or_ps(cast[sse.M128](a), cast[sse.M128](b)))

let x86_or_f32r128: proc (a, b: f32r128): f32r128 = 
  if sseExists(): or_f32r128_sse 
  else: or_f32r128_fallback 

func or_f32r128_neon(a, b: f32r128): f32r128 =
  return cast[f32r128](vorrq_u32(cast[Uint32x4](a), cast[Uint32x4](b)))

let arm_or_f32r128: proc (a, b: f32r128): f32r128 = if neonExists(): or_f32r128_neon else: or_f32r128_fallback

func or_f32r128_lsx(a, b: f32r128): f32r128 =
  return cast[f32r128](lsx_vor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_or_f32r128: proc (a, b: f32r128): f32r128 = if lsxExists(): or_f32r128_lsx else: or_f32r128_fallback

template `or`*(a, b: f32r128): f32r128 = 
  when defined(amd64): x86_or_f32r128(a, b)
  elif defined(arm64): arm_or_f32r128(a, b)
  elif defined(loongarch64): la_or_f32r128(a, b)

# ========================
# or / f64r128 / value
# ========================

func or_f64r128_fallback(a, b: f64r128): f64r128 =
  var output: f64r128
  when CPUBits == 64:
    let p: ptr array[2, float64] = cast[ptr array[2, float64]](addr output)
    unroll(i, 0, 1):
      p[i] = float64(cast[uint32](cast[f64v128](a)[i]) or cast[uint32](cast[f64v128](b)[i]))
  else:
    let p: ptr array[4, uint32] = cast[ptr array[4, uint32]](addr output)
    unroll(i, 0, 3):
      p[i] = cast[array[4, uint32]](a)[i] or cast[array[4, uint32]](b)[i]
  return output

func or_f64r128_sse(a, b: f64r128): f64r128 =
  return cast[f64r128](mm_or_pd(cast[sse2.M128d](a), cast[sse2.M128d](b)))

let x86_or_f64r128: proc (a, b: f64r128): f64r128 = 
  if sseExists(): or_f64r128_sse 
  else: or_f64r128_fallback 

func or_f64r128_neon(a, b: f64r128): f64r128 =
  return cast[f64r128](vorrq_u64(cast[Uint64x2](a), cast[Uint64x2](b)))

let arm_or_f64r128: proc (a, b: f64r128): f64r128 = if neonExists(): or_f64r128_neon else: or_f64r128_fallback

func or_f64r128_lsx(a, b: f64r128): f64r128 =
  return cast[f64r128](lsx_vor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_or_f64r128: proc (a, b: f64r128): f64r128 = if lsxExists(): or_f64r128_lsx else: or_f64r128_fallback

template `or`*(a, b: f64r128): f64r128 = 
  when defined(amd64): x86_or_f64r128(a, b)
  elif defined(arm64): arm_or_f64r128(a, b)
  elif defined(loongarch64): la_or_f64r128(a, b)

# ========================
# or / i8r128 / value
# ========================

func or_i8r128_fallback(a, b: i8r128): i8r128 = 
  var output: i8r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] or pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] or pB[i]
  return output

func or_i8r128_sse(a, b: i8r128): i8r128 = 
  return cast[i8r128](mm_or_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_or_i8r128: proc (a, b: i8r128): i8r128 = 
  if sseExists(): or_i8r128_sse 
  else: or_i8r128_fallback 

func or_i8r128_neon(a, b: i8r128): i8r128 =
  return cast[i8r128](vorrq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b)))

let arm_or_i8r128: proc (a, b: i8r128): i8r128 = if neonExists(): or_i8r128_neon else: or_i8r128_fallback

func or_i8r128_lsx(a, b: i8r128): i8r128 =
  return cast[i8r128](lsx_vor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_or_i8r128: proc (a, b: i8r128): i8r128 = if lsxExists(): or_i8r128_lsx else: or_i8r128_fallback

template `or`*(a, b: i8r128): i8r128 = 
  when defined(amd64) or defined(i386): x86_or_i8r128(a, b)
  elif defined(arm64): arm_or_i8r128(a, b)
  elif defined(loongarch64): la_or_i8r128(a, b)

# ========================
# or / i16r128 / value
# ========================

func or_i16r128_fallback(a, b: i16r128): i16r128 = 
  var output: i16r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] or pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] or pB[i]
  return output

func or_i16r128_sse(a, b: i16r128): i16r128 = 
  return cast[i16r128](mm_or_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_or_i16r128: proc (a, b: i16r128): i16r128 = 
  if sseExists(): or_i16r128_sse 
  else: or_i16r128_fallback 

func or_i16r128_neon(a, b: i16r128): i16r128 =
  return cast[i16r128](vorrq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b)))

let arm_or_i16r128: proc (a, b: i16r128): i16r128 = if neonExists(): or_i16r128_neon else: or_i16r128_fallback

func or_i16r128_lsx(a, b: i16r128): i16r128 =
  return cast[i16r128](lsx_vor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_or_i16r128: proc (a, b: i16r128): i16r128 = if lsxExists(): or_i16r128_lsx else: or_i16r128_fallback

template `or`*(a, b: i16r128): i16r128 = 
  when defined(amd64) or defined(i386): x86_or_i16r128(a, b)
  elif defined(arm64): arm_or_i16r128(a, b)
  elif defined(loongarch64): la_or_i16r128(a, b)

# ========================
# or / i32r128 / value
# ========================

func or_i32r128_fallback(a, b: i32r128): i32r128 = 
  var output: i32r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] or pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] or pB[i]
  return output

func or_i32r128_sse(a, b: i32r128): i32r128 = 
  return cast[i32r128](mm_or_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_or_i32r128: proc (a, b: i32r128): i32r128 = 
  if sseExists(): or_i32r128_sse 
  else: or_i32r128_fallback 

func or_i32r128_neon(a, b: i32r128): i32r128 =
  return cast[i32r128](vorrq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b)))

let arm_or_i32r128: proc (a, b: i32r128): i32r128 = if neonExists(): or_i32r128_neon else: or_i32r128_fallback

func or_i32r128_lsx(a, b: i32r128): i32r128 =
  return cast[i32r128](lsx_vor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_or_i32r128: proc (a, b: i32r128): i32r128 = if lsxExists(): or_i32r128_lsx else: or_i32r128_fallback

template `or`*(a, b: i32r128): i32r128 = 
  when defined(amd64) or defined(i386): x86_or_i32r128(a, b)
  elif defined(arm64): arm_or_i32r128(a, b)
  elif defined(loongarch64): la_or_i32r128(a, b)

# ========================
# or / i64r128 / value
# ========================

func or_i64r128_fallback(a, b: i64r128): i64r128 = 
  var output: i64r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] or pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] or pB[i]
  return output

func or_i64r128_sse(a, b: i64r128): i64r128 = 
  return cast[i64r128](mm_or_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_or_i64r128: proc (a, b: i64r128): i64r128 = 
  if sseExists(): or_i64r128_sse 
  else: or_i64r128_fallback 

func or_i64r128_neon(a, b: i64r128): i64r128 =
  return cast[i64r128](vorrq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b)))

let arm_or_i64r128: proc (a, b: i64r128): i64r128 = if neonExists(): or_i64r128_neon else: or_i64r128_fallback

func or_i64r128_lsx(a, b: i64r128): i64r128 =
  return cast[i64r128](lsx_vor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_or_i64r128: proc (a, b: i64r128): i64r128 = if lsxExists(): or_i64r128_lsx else: or_i64r128_fallback

template `or`*(a, b: i64r128): i64r128 = 
  when defined(amd64) or defined(i386): x86_or_i64r128(a, b)
  elif defined(arm64): arm_or_i64r128(a, b)
  elif defined(loongarch64): la_or_i64r128(a, b)

# ========================
# or / u8r128 / value
# ========================

func or_u8r128_fallback(a, b: u8r128): u8r128 = 
  var output: u8r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] or pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] or pB[i]
  return output

func or_u8r128_sse(a, b: u8r128): u8r128 = 
  return cast[u8r128](mm_or_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_or_u8r128: proc (a, b: u8r128): u8r128 = 
  if sseExists(): or_u8r128_sse 
  else: or_u8r128_fallback 

func or_u8r128_neon(a, b: u8r128): u8r128 =
  return cast[u8r128](vorrq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b)))

let arm_or_u8r128: proc (a, b: u8r128): u8r128 = if neonExists(): or_u8r128_neon else: or_u8r128_fallback

func or_u8r128_lsx(a, b: u8r128): u8r128 =
  return cast[u8r128](lsx_vor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_or_u8r128: proc (a, b: u8r128): u8r128 = if lsxExists(): or_u8r128_lsx else: or_u8r128_fallback

template `or`*(a, b: u8r128): u8r128 = 
  when defined(amd64) or defined(i386): x86_or_u8r128(a, b)
  elif defined(arm64): arm_or_u8r128(a, b)
  elif defined(loongarch64): la_or_u8r128(a, b)

# ========================
# or / u16r128 / value
# ========================

func or_u16r128_fallback(a, b: u16r128): u16r128 = 
  var output: u16r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] or pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] or pB[i]
  return output

func or_u16r128_sse(a, b: u16r128): u16r128 = 
  return cast[u16r128](mm_or_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_or_u16r128: proc (a, b: u16r128): u16r128 = 
  if sseExists(): or_u16r128_sse 
  else: or_u16r128_fallback 

func or_u16r128_neon(a, b: u16r128): u16r128 =
  return cast[u16r128](vorrq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b)))

let arm_or_u16r128: proc (a, b: u16r128): u16r128 = if neonExists(): or_u16r128_neon else: or_u16r128_fallback

func or_u16r128_lsx(a, b: u16r128): u16r128 =
  return cast[u16r128](lsx_vor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_or_u16r128: proc (a, b: u16r128): u16r128 = if lsxExists(): or_u16r128_lsx else: or_u16r128_fallback

template `or`*(a, b: u16r128): u16r128 = 
  when defined(amd64) or defined(i386): x86_or_u16r128(a, b)
  elif defined(arm64): arm_or_u16r128(a, b)
  elif defined(loongarch64): la_or_u16r128(a, b)

# ========================
# or / u32r128 / value
# ========================

func or_u32r128_fallback(a, b: u32r128): u32r128 = 
  var output: u32r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] or pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] or pB[i]
  return output

func or_u32r128_sse(a, b: u32r128): u32r128 = 
  return cast[u32r128](mm_or_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_or_u32r128: proc (a, b: u32r128): u32r128 = 
  if sseExists(): or_u32r128_sse 
  else: or_u32r128_fallback 

func or_u32r128_neon(a, b: u32r128): u32r128 =
  return cast[u32r128](vorrq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b)))

let arm_or_u32r128: proc (a, b: u32r128): u32r128 = if neonExists(): or_u32r128_neon else: or_u32r128_fallback

func or_u32r128_lsx(a, b: u32r128): u32r128 =
  return cast[u32r128](lsx_vor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_or_u32r128: proc (a, b: u32r128): u32r128 = if lsxExists(): or_u32r128_lsx else: or_u32r128_fallback

template `or`*(a, b: u32r128): u32r128 = 
  when defined(amd64) or defined(i386): x86_or_u32r128(a, b)
  elif defined(arm64): arm_or_u32r128(a, b)
  elif defined(loongarch64): la_or_u32r128(a, b)

# ========================
# or / u64r128 / value
# ========================

func or_u64r128_fallback(a, b: u64r128): u64r128 = 
  var output: u64r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] or pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] or pB[i]
  return output

func or_u64r128_sse(a, b: u64r128): u64r128 = 
  return cast[u64r128](mm_or_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_or_u64r128: proc (a, b: u64r128): u64r128 = 
  if sseExists(): or_u64r128_sse 
  else: or_u64r128_fallback 

func or_u64r128_neon(a, b: u64r128): u64r128 =
  return cast[u64r128](vorrq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b)))

let arm_or_u64r128: proc (a, b: u64r128): u64r128 = if neonExists(): or_u64r128_neon else: or_u64r128_fallback

func or_u64r128_lsx(a, b: u64r128): u64r128 =
  return cast[u64r128](lsx_vor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_or_u64r128: proc (a, b: u64r128): u64r128 = if lsxExists(): or_u64r128_lsx else: or_u64r128_fallback

template `or`*(a, b: u64r128): u64r128 = 
  when defined(amd64) or defined(i386): x86_or_u64r128(a, b)
  elif defined(arm64): arm_or_u64r128(a, b)
  elif defined(loongarch64): la_or_u64r128(a, b)

# ========================
# or / f32v128 / value
# ========================

func or_f32v128_fallback(a, b: f32v128): f32v128 =
  var output: f32v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] or pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] or pB[i]
  return output

func or_f32v128_sse(a, b: f32v128): f32v128 =
  return cast[f32v128](mm_or_ps(cast[sse.M128](a), cast[sse.M128](b)))

let x86_or_f32v128: proc (a, b: f32v128): f32v128 = 
  if sseExists(): or_f32v128_sse 
  else: or_f32v128_fallback 

func or_f32v128_neon(a, b: f32v128): f32v128 =
  return cast[f32v128](vorrq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b)))

let arm_or_f32v128: proc (a, b: f32v128): f32v128 = if neonExists(): or_f32v128_neon else: or_f32v128_fallback

func or_f32v128_lsx(a, b: f32v128): f32v128 =
  return cast[f32v128](lsx_vor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_or_f32v128: proc (a, b: f32v128): f32v128 = if lsxExists(): or_f32v128_lsx else: or_f32v128_fallback

template `or`*(a, b: f32v128): f32v128 = 
  when defined(amd64) or defined(i386): x86_or_f32v128(a, b)
  elif defined(arm64): arm_or_f32v128(a, b)
  elif defined(loongarch64): la_or_f32v128(a, b)

# ========================
# or / f64v128 / value
# ========================

func or_f64v128_fallback(a, b: f64v128): f64v128 =
  var output: f64v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] or pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] or pB[i]
  return output

func or_f64v128_sse(a, b: f64v128): f64v128 =
  return cast[f64v128](mm_or_pd(cast[sse2.M128d](a), cast[sse2.M128d](b)))

let x86_or_f64v128: proc (a, b: f64v128): f64v128 = 
  if sseExists(): or_f64v128_sse 
  else: or_f64v128_fallback 

func or_f64v128_neon(a, b: f64v128): f64v128 =
  return cast[f64v128](vorrq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b)))

let arm_or_f64v128: proc (a, b: f64v128): f64v128 = if neonExists(): or_f64v128_neon else: or_f64v128_fallback

func or_f64v128_lsx(a, b: f64v128): f64v128 =
  return cast[f64v128](lsx_vor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_or_f64v128: proc (a, b: f64v128): f64v128 = if lsxExists(): or_f64v128_lsx else: or_f64v128_fallback

template `or`*(a, b: f64v128): f64v128 = 
  when defined(amd64) or defined(i386): x86_or_f64v128(a, b)
  elif defined(arm64): arm_or_f64v128(a, b)
  elif defined(loongarch64): la_or_f64v128(a, b)

# ========================
# or / i8v128 / value
# ========================

func or_i8v128_fallback(a, b: i8v128): i8v128 = 
  var output: i8v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] or pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] or pB[i]
  return output

func or_i8v128_sse(a, b: i8v128): i8v128 = 
  return cast[i8v128](mm_or_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_or_i8v128: proc (a, b: i8v128): i8v128 = 
  if sseExists(): or_i8v128_sse 
  else: or_i8v128_fallback 

func or_i8v128_neon(a, b: i8v128): i8v128 =
  return cast[i8v128](vorrq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b)))

let arm_or_i8v128: proc (a, b: i8v128): i8v128 = if neonExists(): or_i8v128_neon else: or_i8v128_fallback

func or_i8v128_lsx(a, b: i8v128): i8v128 =
  return cast[i8v128](lsx_vor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_or_i8v128: proc (a, b: i8v128): i8v128 = if lsxExists(): or_i8v128_lsx else: or_i8v128_fallback

template `or`*(a, b: i8v128): i8v128 = 
  when defined(amd64) or defined(i386): x86_or_i8v128(a, b)
  elif defined(arm64): arm_or_i8v128(a, b)
  elif defined(loongarch64): la_or_i8v128(a, b)

# ========================
# or / i16v128 / value
# ========================

func or_i16v128_fallback(a, b: i16v128): i16v128 = 
  var output: i16v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] or pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] or pB[i]
  return output

func or_i16v128_sse(a, b: i16v128): i16v128 = 
  return cast[i16v128](mm_or_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_or_i16v128: proc (a, b: i16v128): i16v128 = 
  if sseExists(): or_i16v128_sse 
  else: or_i16v128_fallback 

func or_i16v128_neon(a, b: i16v128): i16v128 =
  return cast[i16v128](vorrq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b)))

let arm_or_i16v128: proc (a, b: i16v128): i16v128 = if neonExists(): or_i16v128_neon else: or_i16v128_fallback

func or_i16v128_lsx(a, b: i16v128): i16v128 =
  return cast[i16v128](lsx_vor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_or_i16v128: proc (a, b: i16v128): i16v128 = if lsxExists(): or_i16v128_lsx else: or_i16v128_fallback

template `or`*(a, b: i16v128): i16v128 = 
  when defined(amd64) or defined(i386): x86_or_i16v128(a, b)
  elif defined(arm64): arm_or_i16v128(a, b)
  elif defined(loongarch64): la_or_i16v128(a, b)

# ========================
# or / i32v128 / value
# ========================

func or_i32v128_fallback(a, b: i32v128): i32v128 = 
  var output: i32v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] or pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] or pB[i]
  return output

func or_i32v128_sse(a, b: i32v128): i32v128 = 
  return cast[i32v128](mm_or_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_or_i32v128: proc (a, b: i32v128): i32v128 = 
  if sseExists(): or_i32v128_sse 
  else: or_i32v128_fallback 

func or_i32v128_neon(a, b: i32v128): i32v128 =
  return cast[i32v128](vorrq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b)))

let arm_or_i32v128: proc (a, b: i32v128): i32v128 = if neonExists(): or_i32v128_neon else: or_i32v128_fallback

func or_i32v128_lsx(a, b: i32v128): i32v128 =
  return cast[i32v128](lsx_vor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_or_i32v128: proc (a, b: i32v128): i32v128 = if lsxExists(): or_i32v128_lsx else: or_i32v128_fallback

template `or`*(a, b: i32v128): i32v128 = 
  when defined(amd64) or defined(i386): x86_or_i32v128(a, b)
  elif defined(arm64): arm_or_i32v128(a, b)
  elif defined(loongarch64): la_or_i32v128(a, b)

# ========================
# or / i64v128 / value
# ========================

func or_i64v128_fallback(a, b: i64v128): i64v128 = 
  var output: i64v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] or pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] or pB[i]
  return output

func or_i64v128_sse(a, b: i64v128): i64v128 = 
  return cast[i64v128](mm_or_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_or_i64v128: proc (a, b: i64v128): i64v128 = 
  if sseExists(): or_i64v128_sse 
  else: or_i64v128_fallback 

func or_i64v128_neon(a, b: i64v128): i64v128 =
  return cast[i64v128](vorrq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b)))

let arm_or_i64v128: proc (a, b: i64v128): i64v128 = if neonExists(): or_i64v128_neon else: or_i64v128_fallback

func or_i64v128_lsx(a, b: i64v128): i64v128 =
  return cast[i64v128](lsx_vor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_or_i64v128: proc (a, b: i64v128): i64v128 = if lsxExists(): or_i64v128_lsx else: or_i64v128_fallback

template `or`*(a, b: i64v128): i64v128 = 
  when defined(amd64) or defined(i386): x86_or_i64v128(a, b)
  elif defined(arm64): arm_or_i64v128(a, b)
  elif defined(loongarch64): la_or_i64v128(a, b)

# ========================
# or / u8v128 / value
# ========================

func or_u8v128_fallback(a, b: u8v128): u8v128 = 
  var output: u8v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] or pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] or pB[i]
  return output

func or_u8v128_sse(a, b: u8v128): u8v128 = 
  return cast[u8v128](mm_or_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_or_u8v128: proc (a, b: u8v128): u8v128 = 
  if sseExists(): or_u8v128_sse 
  else: or_u8v128_fallback 

func or_u8v128_neon(a, b: u8v128): u8v128 =
  return cast[u8v128](vorrq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b)))

let arm_or_u8v128: proc (a, b: u8v128): u8v128 = if neonExists(): or_u8v128_neon else: or_u8v128_fallback

func or_u8v128_lsx(a, b: u8v128): u8v128 =
  return cast[u8v128](lsx_vor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_or_u8v128: proc (a, b: u8v128): u8v128 = if lsxExists(): or_u8v128_lsx else: or_u8v128_fallback

template `or`*(a, b: u8v128): u8v128 = 
  when defined(amd64) or defined(i386): x86_or_u8v128(a, b)
  elif defined(arm64): arm_or_u8v128(a, b)
  elif defined(loongarch64): la_or_u8v128(a, b)

# ========================
# or / u16v128 / value
# ========================

func or_u16v128_fallback(a, b: u16v128): u16v128 = 
  var output: u16v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] or pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] or pB[i]
  return output

func or_u16v128_sse(a, b: u16v128): u16v128 = 
  return cast[u16v128](mm_or_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_or_u16v128: proc (a, b: u16v128): u16v128 = 
  if sseExists(): or_u16v128_sse 
  else: or_u16v128_fallback 

func or_u16v128_neon(a, b: u16v128): u16v128 =
  return cast[u16v128](vorrq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b)))

let arm_or_u16v128: proc (a, b: u16v128): u16v128 = if neonExists(): or_u16v128_neon else: or_u16v128_fallback

func or_u16v128_lsx(a, b: u16v128): u16v128 =
  return cast[u16v128](lsx_vor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_or_u16v128: proc (a, b: u16v128): u16v128 = if lsxExists(): or_u16v128_lsx else: or_u16v128_fallback

template `or`*(a, b: u16v128): u16v128 = 
  when defined(amd64) or defined(i386): x86_or_u16v128(a, b)
  elif defined(arm64): arm_or_u16v128(a, b)
  elif defined(loongarch64): la_or_u16v128(a, b)

# ========================
# or / u32v128 / value
# ========================

func or_u32v128_fallback(a, b: u32v128): u32v128 = 
  var output: u32v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] or pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] or pB[i]
  return output

func or_u32v128_sse(a, b: u32v128): u32v128 = 
  return cast[u32v128](mm_or_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_or_u32v128: proc (a, b: u32v128): u32v128 = 
  if sseExists(): or_u32v128_sse 
  else: or_u32v128_fallback 

func or_u32v128_neon(a, b: u32v128): u32v128 =
  return cast[u32v128](vorrq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b)))

let arm_or_u32v128: proc (a, b: u32v128): u32v128 = if neonExists(): or_u32v128_neon else: or_u32v128_fallback

func or_u32v128_lsx(a, b: u32v128): u32v128 =
  return cast[u32v128](lsx_vor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_or_u32v128: proc (a, b: u32v128): u32v128 = if lsxExists(): or_u32v128_lsx else: or_u32v128_fallback

template `or`*(a, b: u32v128): u32v128 = 
  when defined(amd64) or defined(i386): x86_or_u32v128(a, b)
  elif defined(arm64): arm_or_u32v128(a, b)
  elif defined(loongarch64): la_or_u32v128(a, b)

# ========================
# or / u64v128 / value
# ========================

func or_u64v128_fallback(a, b: u64v128): u64v128 = 
  var output: u64v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] or pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] or pB[i]
  return output

func or_u64v128_sse(a, b: u64v128): u64v128 = 
  return cast[u64v128](mm_or_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_or_u64v128: proc (a, b: u64v128): u64v128 = 
  if sseExists(): or_u64v128_sse 
  else: or_u64v128_fallback 

func or_u64v128_neon(a, b: u64v128): u64v128 =
  return cast[u64v128](vorrq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b)))

let arm_or_u64v128: proc (a, b: u64v128): u64v128 = if neonExists(): or_u64v128_neon else: or_u64v128_fallback

func or_u64v128_lsx(a, b: u64v128): u64v128 =
  return cast[u64v128](lsx_vor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_or_u64v128: proc (a, b: u64v128): u64v128 = if lsxExists(): or_u64v128_lsx else: or_u64v128_fallback

template `or`*(a, b: u64v128): u64v128 = 
  when defined(amd64) or defined(i386): x86_or_u64v128(a, b)
  elif defined(arm64): arm_or_u64v128(a, b)
  elif defined(loongarch64): la_or_u64v128(a, b)

# ========================
# xor / f32r128 / value
# ========================

func xor_f32r128_fallback(a, b: f32r128): f32r128 =
  var output: f32r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] xor pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] xor pB[i]
  return output

func xor_f32r128_sse(a, b: f32r128): f32r128 =
  return cast[f32r128](mm_xor_ps(cast[sse.M128](a), cast[sse.M128](b)))

let x86_xor_f32r128: proc (a, b: f32r128): f32r128 = 
  if sseExists(): xor_f32r128_sse 
  else: xor_f32r128_fallback 

func xor_f32r128_neon(a, b: f32r128): f32r128 =
  return cast[f32r128](veorq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b)))

let arm_xor_f32r128: proc (a, b: f32r128): f32r128 = if neonExists(): xor_f32r128_neon else: xor_f32r128_fallback

func xor_f32r128_lsx(a, b: f32r128): f32r128 =
  return cast[f32r128](lsx_vxor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_xor_f32r128: proc (a, b: f32r128): f32r128 = if lsxExists(): xor_f32r128_lsx else: xor_f32r128_fallback

template `xor`*(a, b: f32r128): f32r128 = 
  when defined(amd64) or defined(i386): x86_xor_f32r128(a, b)
  elif defined(arm64): arm_xor_f32r128(a, b)
  elif defined(loongarch64): la_xor_f32r128(a, b)

# ========================
# xor / f64r128 / value
# ========================

func xor_f64r128_fallback(a, b: f64r128): f64r128 =
  var output: f64r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] xor pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] xor pB[i]
  return output

func xor_f64r128_sse(a, b: f64r128): f64r128 =
  return cast[f64r128](mm_xor_pd(cast[sse2.M128d](a), cast[sse2.M128d](b)))

let x86_xor_f64r128: proc (a, b: f64r128): f64r128 = 
  if sseExists(): xor_f64r128_sse 
  else: xor_f64r128_fallback 

func xor_f64r128_neon(a, b: f64r128): f64r128 =
  return cast[f64r128](veorq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b)))

let arm_xor_f64r128: proc (a, b: f64r128): f64r128 = if neonExists(): xor_f64r128_neon else: xor_f64r128_fallback

func xor_f64r128_lsx(a, b: f64r128): f64r128 =
  return cast[f64r128](lsx_vxor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_xor_f64r128: proc (a, b: f64r128): f64r128 = if lsxExists(): xor_f64r128_lsx else: xor_f64r128_fallback

template `xor`*(a, b: f64r128): f64r128 = 
  when defined(amd64) or defined(i386): x86_xor_f64r128(a, b)
  elif defined(arm64): arm_xor_f64r128(a, b)
  elif defined(loongarch64): la_xor_f64r128(a, b)

# ========================
# xor / i8r128 / value
# ========================

func xor_i8r128_fallback(a, b: i8r128): i8r128 = 
  var output: i8r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] xor pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] xor pB[i]
  return output

func xor_i8r128_sse(a, b: i8r128): i8r128 = 
  return cast[i8r128](mm_xor_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_xor_i8r128: proc (a, b: i8r128): i8r128 = 
  if sseExists(): xor_i8r128_sse 
  else: xor_i8r128_fallback 

func xor_i8r128_neon(a, b: i8r128): i8r128 =
  return cast[i8r128](veorq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b)))

let arm_xor_i8r128: proc (a, b: i8r128): i8r128 = if neonExists(): xor_i8r128_neon else: xor_i8r128_fallback

func xor_i8r128_lsx(a, b: i8r128): i8r128 =
  return cast[i8r128](lsx_vxor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_xor_i8r128: proc (a, b: i8r128): i8r128 = if lsxExists(): xor_i8r128_lsx else: xor_i8r128_fallback

template `xor`*(a, b: i8r128): i8r128 = 
  when defined(amd64) or defined(i386): x86_xor_i8r128(a, b)
  elif defined(arm64): arm_xor_i8r128(a, b)
  elif defined(loongarch64): la_xor_i8r128(a, b)

# ========================
# xor / i16r128 / value
# ========================

func xor_i16r128_fallback(a, b: i16r128): i16r128 = 
  var output: i16r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] xor pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] xor pB[i]
  return output

func xor_i16r128_sse(a, b: i16r128): i16r128 = 
  return cast[i16r128](mm_xor_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_xor_i16r128: proc (a, b: i16r128): i16r128 = 
  if sseExists(): xor_i16r128_sse 
  else: xor_i16r128_fallback 

func xor_i16r128_neon(a, b: i16r128): i16r128 =
  return cast[i16r128](veorq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b)))

let arm_xor_i16r128: proc (a, b: i16r128): i16r128 = if neonExists(): xor_i16r128_neon else: xor_i16r128_fallback

func xor_i16r128_lsx(a, b: i16r128): i16r128 =
  return cast[i16r128](lsx_vxor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_xor_i16r128: proc (a, b: i16r128): i16r128 = if lsxExists(): xor_i16r128_lsx else: xor_i16r128_fallback

template `xor`*(a, b: i16r128): i16r128 = 
  when defined(amd64) or defined(i386): x86_xor_i16r128(a, b)
  elif defined(arm64): arm_xor_i16r128(a, b)
  elif defined(loongarch64): la_xor_i16r128(a, b)

# ========================
# xor / i32r128 / value
# ========================

func xor_i32r128_fallback(a, b: i32r128): i32r128 = 
  var output: i32r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] xor pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] xor pB[i]
  return output

func xor_i32r128_sse(a, b: i32r128): i32r128 = 
  return cast[i32r128](mm_xor_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_xor_i32r128: proc (a, b: i32r128): i32r128 = 
  if sseExists(): xor_i32r128_sse 
  else: xor_i32r128_fallback 

func xor_i32r128_neon(a, b: i32r128): i32r128 =
  return cast[i32r128](veorq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b)))

let arm_xor_i32r128: proc (a, b: i32r128): i32r128 = if neonExists(): xor_i32r128_neon else: xor_i32r128_fallback

func xor_i32r128_lsx(a, b: i32r128): i32r128 =
  return cast[i32r128](lsx_vxor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_xor_i32r128: proc (a, b: i32r128): i32r128 = if lsxExists(): xor_i32r128_lsx else: xor_i32r128_fallback

template `xor`*(a, b: i32r128): i32r128 = 
  when defined(amd64) or defined(i386): x86_xor_i32r128(a, b)
  elif defined(arm64): arm_xor_i32r128(a, b)
  elif defined(loongarch64): la_xor_i32r128(a, b)

# ========================
# xor / i64r128 / value
# ========================

func xor_i64r128_fallback(a, b: i64r128): i64r128 = 
  var output: i64r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] xor pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] xor pB[i]
  return output

func xor_i64r128_sse(a, b: i64r128): i64r128 = 
  return cast[i64r128](mm_xor_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_xor_i64r128: proc (a, b: i64r128): i64r128 = 
  if sseExists(): xor_i64r128_sse 
  else: xor_i64r128_fallback 

func xor_i64r128_neon(a, b: i64r128): i64r128 =
  return cast[i64r128](veorq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b)))

let arm_xor_i64r128: proc (a, b: i64r128): i64r128 = if neonExists(): xor_i64r128_neon else: xor_i64r128_fallback

func xor_i64r128_lsx(a, b: i64r128): i64r128 =
  return cast[i64r128](lsx_vxor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_xor_i64r128: proc (a, b: i64r128): i64r128 = if lsxExists(): xor_i64r128_lsx else: xor_i64r128_fallback

template `xor`*(a, b: i64r128): i64r128 = 
  when defined(amd64) or defined(i386): x86_xor_i64r128(a, b)
  elif defined(arm64): arm_xor_i64r128(a, b)
  elif defined(loongarch64): la_xor_i64r128(a, b)

# ========================
# xor / u8r128 / value
# ========================

func xor_u8r128_fallback(a, b: u8r128): u8r128 = 
  var output: u8r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] xor pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] xor pB[i]
  return output

func xor_u8r128_sse(a, b: u8r128): u8r128 = 
  return cast[u8r128](mm_xor_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_xor_u8r128: proc (a, b: u8r128): u8r128 = 
  if sseExists(): xor_u8r128_sse 
  else: xor_u8r128_fallback 

func xor_u8r128_neon(a, b: u8r128): u8r128 =
  return cast[u8r128](veorq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b)))

let arm_xor_u8r128: proc (a, b: u8r128): u8r128 = if neonExists(): xor_u8r128_neon else: xor_u8r128_fallback

func xor_u8r128_lsx(a, b: u8r128): u8r128 =
  return cast[u8r128](lsx_vxor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_xor_u8r128: proc (a, b: u8r128): u8r128 = if lsxExists(): xor_u8r128_lsx else: xor_u8r128_fallback

template `xor`*(a, b: u8r128): u8r128 = 
  when defined(amd64) or defined(i386): x86_xor_u8r128(a, b)
  elif defined(arm64): arm_xor_u8r128(a, b)
  elif defined(loongarch64): la_xor_u8r128(a, b)

# ========================
# xor / u16r128 / value
# ========================

func xor_u16r128_fallback(a, b: u16r128): u16r128 = 
  var output: u16r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] xor pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] xor pB[i]
  return output

func xor_u16r128_sse(a, b: u16r128): u16r128 = 
  return cast[u16r128](mm_xor_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_xor_u16r128: proc (a, b: u16r128): u16r128 = 
  if sseExists(): xor_u16r128_sse 
  else: xor_u16r128_fallback 

func xor_u16r128_neon(a, b: u16r128): u16r128 =
  return cast[u16r128](veorq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b)))

let arm_xor_u16r128: proc (a, b: u16r128): u16r128 = if neonExists(): xor_u16r128_neon else: xor_u16r128_fallback

func xor_u16r128_lsx(a, b: u16r128): u16r128 =
  return cast[u16r128](lsx_vxor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_xor_u16r128: proc (a, b: u16r128): u16r128 = if lsxExists(): xor_u16r128_lsx else: xor_u16r128_fallback

template `xor`*(a, b: u16r128): u16r128 = 
  when defined(amd64) or defined(i386): x86_xor_u16r128(a, b)
  elif defined(arm64): arm_xor_u16r128(a, b)
  elif defined(loongarch64): la_xor_u16r128(a, b)

# ========================
# xor / u32r128 / value
# ========================

func xor_u32r128_fallback(a, b: u32r128): u32r128 = 
  var output: u32r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] xor pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] xor pB[i]
  return output

func xor_u32r128_sse(a, b: u32r128): u32r128 = 
  return cast[u32r128](mm_xor_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_xor_u32r128: proc (a, b: u32r128): u32r128 = 
  if sseExists(): xor_u32r128_sse 
  else: xor_u32r128_fallback 

func xor_u32r128_neon(a, b: u32r128): u32r128 =
  return cast[u32r128](veorq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b)))

let arm_xor_u32r128: proc (a, b: u32r128): u32r128 = if neonExists(): xor_u32r128_neon else: xor_u32r128_fallback

func xor_u32r128_lsx(a, b: u32r128): u32r128 =
  return cast[u32r128](lsx_vxor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_xor_u32r128: proc (a, b: u32r128): u32r128 = if lsxExists(): xor_u32r128_lsx else: xor_u32r128_fallback

template `xor`*(a, b: u32r128): u32r128 = 
  when defined(amd64) or defined(i386): x86_xor_u32r128(a, b)
  elif defined(arm64): arm_xor_u32r128(a, b)
  elif defined(loongarch64): la_xor_u32r128(a, b)

# ========================
# xor / u64r128 / value
# ========================

func xor_u64r128_fallback(a, b: u64r128): u64r128 = 
  var output: u64r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] xor pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] xor pB[i]
  return output

func xor_u64r128_sse(a, b: u64r128): u64r128 = 
  return cast[u64r128](mm_xor_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_xor_u64r128: proc (a, b: u64r128): u64r128 = 
  if sseExists(): xor_u64r128_sse 
  else: xor_u64r128_fallback 

func xor_u64r128_neon(a, b: u64r128): u64r128 =
  return cast[u64r128](veorq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b)))

let arm_xor_u64r128: proc (a, b: u64r128): u64r128 = if neonExists(): xor_u64r128_neon else: xor_u64r128_fallback

func xor_u64r128_lsx(a, b: u64r128): u64r128 =
  return cast[u64r128](lsx_vxor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_xor_u64r128: proc (a, b: u64r128): u64r128 = if lsxExists(): xor_u64r128_lsx else: xor_u64r128_fallback

template `xor`*(a, b: u64r128): u64r128 = 
  when defined(amd64) or defined(i386): x86_xor_u64r128(a, b)
  elif defined(arm64): arm_xor_u64r128(a, b)
  elif defined(loongarch64): la_xor_u64r128(a, b)

# ========================
# xor / f32v128 / value
# ========================

func xor_f32v128_fallback(a, b: f32v128): f32v128 =
  var output: f32v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] xor pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] xor pB[i]
  return output

func xor_f32v128_sse(a, b: f32v128): f32v128 =
  return cast[f32v128](mm_xor_ps(cast[sse.M128](a), cast[sse.M128](b)))

let x86_xor_f32v128: proc (a, b: f32v128): f32v128 = 
  if sseExists(): xor_f32v128_sse 
  else: xor_f32v128_fallback 

func xor_f32v128_neon(a, b: f32v128): f32v128 =
  return cast[f32v128](veorq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b)))

let arm_xor_f32v128: proc (a, b: f32v128): f32v128 = if neonExists(): xor_f32v128_neon else: xor_f32v128_fallback

func xor_f32v128_lsx(a, b: f32v128): f32v128 =
  return cast[f32v128](lsx_vxor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_xor_f32v128: proc (a, b: f32v128): f32v128 = if lsxExists(): xor_f32v128_lsx else: xor_f32v128_fallback

template `xor`*(a, b: f32v128): f32v128 = 
  when defined(amd64) or defined(i386): x86_xor_f32v128(a, b)
  elif defined(arm64): arm_xor_f32v128(a, b)
  elif defined(loongarch64): la_xor_f32v128(a, b)

# ========================
# xor / f64v128 / value
# ========================

func xor_f64v128_fallback(a, b: f64v128): f64v128 =
  var output: f64v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] xor pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] xor pB[i]
  return output

func xor_f64v128_sse(a, b: f64v128): f64v128 =
  return cast[f64v128](mm_xor_pd(cast[sse2.M128d](a), cast[sse2.M128d](b)))

let x86_xor_f64v128: proc (a, b: f64v128): f64v128 = 
  if sseExists(): xor_f64v128_sse 
  else: xor_f64v128_fallback 

func xor_f64v128_neon(a, b: f64v128): f64v128 =
  return cast[f64v128](veorq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b)))

let arm_xor_f64v128: proc (a, b: f64v128): f64v128 = if neonExists(): xor_f64v128_neon else: xor_f64v128_fallback

func xor_f64v128_lsx(a, b: f64v128): f64v128 =
  return cast[f64v128](lsx_vxor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_xor_f64v128: proc (a, b: f64v128): f64v128 = if lsxExists(): xor_f64v128_lsx else: xor_f64v128_fallback

template `xor`*(a, b: f64v128): f64v128 = 
  when defined(amd64) or defined(i386): x86_xor_f64v128(a, b)
  elif defined(arm64): arm_xor_f64v128(a, b)
  elif defined(loongarch64): la_xor_f64v128(a, b)

# ========================
# xor / i8v128 / value
# ========================

func xor_i8v128_fallback(a, b: i8v128): i8v128 = 
  var output: i8v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] xor pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] xor pB[i]
  return output

func xor_i8v128_sse(a, b: i8v128): i8v128 = 
  return cast[i8v128](mm_xor_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_xor_i8v128: proc (a, b: i8v128): i8v128 = 
  if sseExists(): xor_i8v128_sse 
  else: xor_i8v128_fallback 

func xor_i8v128_neon(a, b: i8v128): i8v128 =
  return cast[i8v128](veorq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b)))

let arm_xor_i8v128: proc (a, b: i8v128): i8v128 = if neonExists(): xor_i8v128_neon else: xor_i8v128_fallback

func xor_i8v128_lsx(a, b: i8v128): i8v128 =
  return cast[i8v128](lsx_vxor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_xor_i8v128: proc (a, b: i8v128): i8v128 = if lsxExists(): xor_i8v128_lsx else: xor_i8v128_fallback

template `xor`*(a, b: i8v128): i8v128 = 
  when defined(amd64) or defined(i386): x86_xor_i8v128(a, b)
  elif defined(arm64): arm_xor_i8v128(a, b)
  elif defined(loongarch64): la_xor_i8v128(a, b)

# ========================
# xor / i16v128 / value
# ========================

func xor_i16v128_fallback(a, b: i16v128): i16v128 = 
  var output: i16v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] xor pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] xor pB[i]
  return output

func xor_i16v128_sse(a, b: i16v128): i16v128 = 
  return cast[i16v128](mm_xor_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_xor_i16v128: proc (a, b: i16v128): i16v128 = 
  if sseExists(): xor_i16v128_sse 
  else: xor_i16v128_fallback 

func xor_i16v128_neon(a, b: i16v128): i16v128 =
  return cast[i16v128](veorq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b)))

let arm_xor_i16v128: proc (a, b: i16v128): i16v128 = if neonExists(): xor_i16v128_neon else: xor_i16v128_fallback

func xor_i16v128_lsx(a, b: i16v128): i16v128 =
  return cast[i16v128](lsx_vxor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_xor_i16v128: proc (a, b: i16v128): i16v128 = if lsxExists(): xor_i16v128_lsx else: xor_i16v128_fallback

template `xor`*(a, b: i16v128): i16v128 = 
  when defined(amd64) or defined(i386): x86_xor_i16v128(a, b)
  elif defined(arm64): arm_xor_i16v128(a, b)
  elif defined(loongarch64): la_xor_i16v128(a, b)

# ========================
# xor / i32v128 / value
# ========================

func xor_i32v128_fallback(a, b: i32v128): i32v128 = 
  var output: i32v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] xor pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] xor pB[i]
  return output

func xor_i32v128_sse(a, b: i32v128): i32v128 = 
  return cast[i32v128](mm_xor_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_xor_i32v128: proc (a, b: i32v128): i32v128 = 
  if sseExists(): xor_i32v128_sse 
  else: xor_i32v128_fallback 

func xor_i32v128_neon(a, b: i32v128): i32v128 =
  return cast[i32v128](veorq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b)))

let arm_xor_i32v128: proc (a, b: i32v128): i32v128 = if neonExists(): xor_i32v128_neon else: xor_i32v128_fallback

func xor_i32v128_lsx(a, b: i32v128): i32v128 =
  return cast[i32v128](lsx_vxor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_xor_i32v128: proc (a, b: i32v128): i32v128 = if lsxExists(): xor_i32v128_lsx else: xor_i32v128_fallback

template `xor`*(a, b: i32v128): i32v128 = 
  when defined(amd64) or defined(i386): x86_xor_i32v128(a, b)
  elif defined(arm64): arm_xor_i32v128(a, b)
  elif defined(loongarch64): la_xor_i32v128(a, b)

# ========================
# xor / i64v128 / value
# ========================

func xor_i64v128_fallback(a, b: i64v128): i64v128 = 
  var output: i64v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] xor pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] xor pB[i]
  return output

func xor_i64v128_sse(a, b: i64v128): i64v128 = 
  return cast[i64v128](mm_xor_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_xor_i64v128: proc (a, b: i64v128): i64v128 = 
  if sseExists(): xor_i64v128_sse 
  else: xor_i64v128_fallback 

func xor_i64v128_neon(a, b: i64v128): i64v128 =
  return cast[i64v128](veorq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b)))

let arm_xor_i64v128: proc (a, b: i64v128): i64v128 = if neonExists(): xor_i64v128_neon else: xor_i64v128_fallback

func xor_i64v128_lsx(a, b: i64v128): i64v128 =
  return cast[i64v128](lsx_vxor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_xor_i64v128: proc (a, b: i64v128): i64v128 = if lsxExists(): xor_i64v128_lsx else: xor_i64v128_fallback

template `xor`*(a, b: i64v128): i64v128 = 
  when defined(amd64) or defined(i386): x86_xor_i64v128(a, b)
  elif defined(arm64): arm_xor_i64v128(a, b)
  elif defined(loongarch64): la_xor_i64v128(a, b)

# ========================
# xor / u8v128 / value
# ========================

func xor_u8v128_fallback(a, b: u8v128): u8v128 = 
  var output: u8v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] xor pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] xor pB[i]
  return output

func xor_u8v128_sse(a, b: u8v128): u8v128 = 
  return cast[u8v128](mm_xor_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_xor_u8v128: proc (a, b: u8v128): u8v128 = 
  if sseExists(): xor_u8v128_sse 
  else: xor_u8v128_fallback 

func xor_u8v128_neon(a, b: u8v128): u8v128 =
  return cast[u8v128](veorq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b)))

let arm_xor_u8v128: proc (a, b: u8v128): u8v128 = if neonExists(): xor_u8v128_neon else: xor_u8v128_fallback

func xor_u8v128_lsx(a, b: u8v128): u8v128 =
  return cast[u8v128](lsx_vxor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_xor_u8v128: proc (a, b: u8v128): u8v128 = if lsxExists(): xor_u8v128_lsx else: xor_u8v128_fallback

template `xor`*(a, b: u8v128): u8v128 = 
  when defined(amd64) or defined(i386): x86_xor_u8v128(a, b)
  elif defined(arm64): arm_xor_u8v128(a, b)
  elif defined(loongarch64): la_xor_u8v128(a, b)

# ========================
# xor / u16v128 / value
# ========================

func xor_u16v128_fallback(a, b: u16v128): u16v128 = 
  var output: u16v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] xor pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] xor pB[i]
  return output

func xor_u16v128_sse(a, b: u16v128): u16v128 = 
  return cast[u16v128](mm_xor_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_xor_u16v128: proc (a, b: u16v128): u16v128 = 
  if sseExists(): xor_u16v128_sse 
  else: xor_u16v128_fallback 

func xor_u16v128_neon(a, b: u16v128): u16v128 =
  return cast[u16v128](veorq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b)))

let arm_xor_u16v128: proc (a, b: u16v128): u16v128 = if neonExists(): xor_u16v128_neon else: xor_u16v128_fallback

func xor_u16v128_lsx(a, b: u16v128): u16v128 =
  return cast[u16v128](lsx_vxor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_xor_u16v128: proc (a, b: u16v128): u16v128 = if lsxExists(): xor_u16v128_lsx else: xor_u16v128_fallback

template `xor`*(a, b: u16v128): u16v128 = 
  when defined(amd64) or defined(i386): x86_xor_u16v128(a, b)
  elif defined(arm64): arm_xor_u16v128(a, b)
  elif defined(loongarch64): la_xor_u16v128(a, b)

# ========================
# xor / u32v128 / value
# ========================

func xor_u32v128_fallback(a, b: u32v128): u32v128 = 
  var output: u32v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] xor pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] xor pB[i]
  return output

func xor_u32v128_sse(a, b: u32v128): u32v128 = 
  return cast[u32v128](mm_xor_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_xor_u32v128: proc (a, b: u32v128): u32v128 = 
  if sseExists(): xor_u32v128_sse 
  else: xor_u32v128_fallback 

func xor_u32v128_neon(a, b: u32v128): u32v128 =
  return cast[u32v128](veorq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b)))

let arm_xor_u32v128: proc (a, b: u32v128): u32v128 = if neonExists(): xor_u32v128_neon else: xor_u32v128_fallback

func xor_u32v128_lsx(a, b: u32v128): u32v128 =
  return cast[u32v128](lsx_vxor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_xor_u32v128: proc (a, b: u32v128): u32v128 = if lsxExists(): xor_u32v128_lsx else: xor_u32v128_fallback

template `xor`*(a, b: u32v128): u32v128 = 
  when defined(amd64) or defined(i386): x86_xor_u32v128(a, b)
  elif defined(arm64): arm_xor_u32v128(a, b)
  elif defined(loongarch64): la_xor_u32v128(a, b)

# ========================
# xor / u64v128 / value
# ========================

func xor_u64v128_fallback(a, b: u64v128): u64v128 = 
  var output: u64v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = pA[i] xor pB[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = pA[i] xor pB[i]
  return output

func xor_u64v128_sse(a, b: u64v128): u64v128 = 
  return cast[u64v128](mm_xor_si128(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_xor_u64v128: proc (a, b: u64v128): u64v128 = 
  if sseExists(): xor_u64v128_sse 
  else: xor_u64v128_fallback 

func xor_u64v128_neon(a, b: u64v128): u64v128 =
  return cast[u64v128](veorq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b)))

let arm_xor_u64v128: proc (a, b: u64v128): u64v128 = if neonExists(): xor_u64v128_neon else: xor_u64v128_fallback

func xor_u64v128_lsx(a, b: u64v128): u64v128 =
  return cast[u64v128](lsx_vxor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_xor_u64v128: proc (a, b: u64v128): u64v128 = if lsxExists(): xor_u64v128_lsx else: xor_u64v128_fallback

template `xor`*(a, b: u64v128): u64v128 = 
  when defined(amd64) or defined(i386): x86_xor_u64v128(a, b)
  elif defined(arm64): arm_xor_u64v128(a, b)
  elif defined(loongarch64): la_xor_u64v128(a, b)

# ========================
# not / f32r128 / value
# ========================

func not_f32r128_fallback(a: f32r128): f32r128 =
  var output: f32r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    unroll(i, 0, 1):
      pOut[i] = not pA[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    unroll(i, 0, 3):
      pOut[i] = not pA[i]
  return output

func not_f32r128_sse(a: f32r128): f32r128 =
  let allOnes = mm_set1_epi32(-1)
  return cast[f32r128](mm_xor_ps(cast[sse.M128](a), cast[sse.M128](allOnes)))

let x86_not_f32r128: proc (a: f32r128): f32r128 = 
  if sseExists(): not_f32r128_sse 
  else: not_f32r128_fallback 

func not_f32r128_neon(a: f32r128): f32r128 =
  return cast[f32r128](vmvnq_u32(cast[neon.Uint32x4](a)))

let arm_not_f32r128: proc (a: f32r128): f32r128 = if neonExists(): not_f32r128_neon else: not_f32r128_fallback

func not_f32r128_lsx(a: f32r128): f32r128 =
  return cast[f32r128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](a)))

let la_not_f32r128: proc (a: f32r128): f32r128 = if lsxExists(): not_f32r128_lsx else: not_f32r128_fallback

template `not`*(a: f32r128): f32r128 = 
  when defined(amd64) or defined(i386): x86_not_f32r128(a)
  elif defined(arm64): arm_not_f32r128(a)
  elif defined(loongarch64): la_not_f32r128(a)

# ========================
# not / f64r128 / value
# ========================

func not_f64r128_fallback(a: f64r128): f64r128 =
  var output: f64r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    unroll(i, 0, 1):
      pOut[i] = not pA[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    unroll(i, 0, 3):
      pOut[i] = not pA[i]
  return output

func not_f64r128_sse(a: f64r128): f64r128 =
  let allOnes = mm_set1_epi32(-1)
  return cast[f64r128](mm_xor_pd(cast[sse2.M128d](a), cast[sse2.M128d](allOnes)))

let x86_not_f64r128: proc (a: f64r128): f64r128 = 
  if sseExists(): not_f64r128_sse 
  else: not_f64r128_fallback 

func not_f64r128_neon(a: f64r128): f64r128 =
  return cast[f64r128](vmvnq_u32(cast[neon.Uint32x4](a)))

let arm_not_f64r128: proc (a: f64r128): f64r128 = if neonExists(): not_f64r128_neon else: not_f64r128_fallback

func not_f64r128_lsx(a: f64r128): f64r128 =
  return cast[f64r128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](a)))

let la_not_f64r128: proc (a: f64r128): f64r128 = if lsxExists(): not_f64r128_lsx else: not_f64r128_fallback

template `not`*(a: f64r128): f64r128 = 
  when defined(amd64) or defined(i386): x86_not_f64r128(a)
  elif defined(arm64): arm_not_f64r128(a)
  elif defined(loongarch64): la_not_f64r128(a)

# ========================
# not / i8r128 / value
# ========================

func not_i8r128_fallback(a: i8r128): i8r128 = 
  var output: i8r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    unroll(i, 0, 1):
      pOut[i] = not pA[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    unroll(i, 0, 3):
      pOut[i] = not pA[i]
  return output

func not_i8r128_sse(a: i8r128): i8r128 = 
  let allOnes = mm_set1_epi32(-1)
  return cast[i8r128](mm_xor_si128(cast[sse2.M128i](a), cast[sse2.M128i](allOnes)))

let x86_not_i8r128: proc (a: i8r128): i8r128 = 
  if sseExists(): not_i8r128_sse 
  else: not_i8r128_fallback 

func not_i8r128_neon(a: i8r128): i8r128 =
  return cast[i8r128](vmvnq_u8(cast[neon.Uint8x16](a)))

let arm_not_i8r128: proc (a: i8r128): i8r128 = if neonExists(): not_i8r128_neon else: not_i8r128_fallback

func not_i8r128_lsx(a: i8r128): i8r128 =
  return cast[i8r128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](a)))

let la_not_i8r128: proc (a: i8r128): i8r128 = if lsxExists(): not_i8r128_lsx else: not_i8r128_fallback

template `not`*(a: i8r128): i8r128 = 
  when defined(amd64) or defined(i386): x86_not_i8r128(a)
  elif defined(arm64): arm_not_i8r128(a)
  elif defined(loongarch64): la_not_i8r128(a)

# ========================
# not / i16r128 / value
# ========================

func not_i16r128_fallback(a: i16r128): i16r128 = 
  var output: i16r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    unroll(i, 0, 1):
      pOut[i] = not pA[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    unroll(i, 0, 3):
      pOut[i] = not pA[i]
  return output

func not_i16r128_sse(a: i16r128): i16r128 = 
  let allOnes = mm_set1_epi32(-1)
  return cast[i16r128](mm_xor_si128(cast[sse2.M128i](a), cast[sse2.M128i](allOnes)))

let x86_not_i16r128: proc (a: i16r128): i16r128 = 
  if sseExists(): not_i16r128_sse 
  else: not_i16r128_fallback 

func not_i16r128_neon(a: i16r128): i16r128 =
  return cast[i16r128](vmvnq_u16(cast[neon.Uint16x8](a)))

let arm_not_i16r128: proc (a: i16r128): i16r128 = if neonExists(): not_i16r128_neon else: not_i16r128_fallback

func not_i16r128_lsx(a: i16r128): i16r128 =
  return cast[i16r128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](a)))

let la_not_i16r128: proc (a: i16r128): i16r128 = if lsxExists(): not_i16r128_lsx else: not_i16r128_fallback

template `not`*(a: i16r128): i16r128 = 
  when defined(amd64) or defined(i386): x86_not_i16r128(a)
  elif defined(arm64): arm_not_i16r128(a)
  elif defined(loongarch64): la_not_i16r128(a)

# ========================
# not / i32r128 / value
# ========================

func not_i32r128_fallback(a: i32r128): i32r128 = 
  var output: i32r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    unroll(i, 0, 1):
      pOut[i] = not pA[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    unroll(i, 0, 3):
      pOut[i] = not pA[i]
  return output

func not_i32r128_sse(a: i32r128): i32r128 = 
  let allOnes = mm_set1_epi32(-1)
  return cast[i32r128](mm_xor_si128(cast[sse2.M128i](a), cast[sse2.M128i](allOnes)))

let x86_not_i32r128: proc (a: i32r128): i32r128 = 
  if sseExists(): not_i32r128_sse 
  else: not_i32r128_fallback 

func not_i32r128_neon(a: i32r128): i32r128 =
  return cast[i32r128](vmvnq_u32(cast[neon.Uint32x4](a)))

let arm_not_i32r128: proc (a: i32r128): i32r128 = if neonExists(): not_i32r128_neon else: not_i32r128_fallback

func not_i32r128_lsx(a: i32r128): i32r128 =
  return cast[i32r128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](a)))

let la_not_i32r128: proc (a: i32r128): i32r128 = if lsxExists(): not_i32r128_lsx else: not_i32r128_fallback

template `not`*(a: i32r128): i32r128 = 
  when defined(amd64) or defined(i386): x86_not_i32r128(a)
  elif defined(arm64): arm_not_i32r128(a)
  elif defined(loongarch64): la_not_i32r128(a)

# ========================
# not / i64r128 / value
# ========================

func not_i64r128_fallback(a: i64r128): i64r128 = 
  var output: i64r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    unroll(i, 0, 1):
      pOut[i] = not pA[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    unroll(i, 0, 3):
      pOut[i] = not pA[i]
  return output

func not_i64r128_sse(a: i64r128): i64r128 = 
  let allOnes = mm_set1_epi32(-1)
  return cast[i64r128](mm_xor_si128(cast[sse2.M128i](a), cast[sse2.M128i](allOnes)))

let x86_not_i64r128: proc (a: i64r128): i64r128 = 
  if sseExists(): not_i64r128_sse 
  else: not_i64r128_fallback 

func not_i64r128_neon(a: i64r128): i64r128 =
  return cast[i64r128](vmvnq_u32(cast[neon.Uint32x4](a)))

let arm_not_i64r128: proc (a: i64r128): i64r128 = if neonExists(): not_i64r128_neon else: not_i64r128_fallback

func not_i64r128_lsx(a: i64r128): i64r128 =
  return cast[i64r128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](a)))

let la_not_i64r128: proc (a: i64r128): i64r128 = if lsxExists(): not_i64r128_lsx else: not_i64r128_fallback

template `not`*(a: i64r128): i64r128 = 
  when defined(amd64) or defined(i386): x86_not_i64r128(a)
  elif defined(arm64): arm_not_i64r128(a)
  elif defined(loongarch64): la_not_i64r128(a)

# ========================
# not / u8r128 / value
# ========================

func not_u8r128_fallback(a: u8r128): u8r128 = 
  var output: u8r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    unroll(i, 0, 1):
      pOut[i] = not pA[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    unroll(i, 0, 3):
      pOut[i] = not pA[i]
  return output

func not_u8r128_sse(a: u8r128): u8r128 = 
  let allOnes = mm_set1_epi32(-1)
  return cast[u8r128](mm_xor_si128(cast[sse2.M128i](a), cast[sse2.M128i](allOnes)))

let x86_not_u8r128: proc (a: u8r128): u8r128 = 
  if sseExists(): not_u8r128_sse 
  else: not_u8r128_fallback 

func not_u8r128_neon(a: u8r128): u8r128 =
  return cast[u8r128](vmvnq_u8(cast[neon.Uint8x16](a)))

let arm_not_u8r128: proc (a: u8r128): u8r128 = if neonExists(): not_u8r128_neon else: not_u8r128_fallback

func not_u8r128_lsx(a: u8r128): u8r128 =
  return cast[u8r128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](a)))

let la_not_u8r128: proc (a: u8r128): u8r128 = if lsxExists(): not_u8r128_lsx else: not_u8r128_fallback

template `not`*(a: u8r128): u8r128 = 
  when defined(amd64) or defined(i386): x86_not_u8r128(a)
  elif defined(arm64): arm_not_u8r128(a)
  elif defined(loongarch64): la_not_u8r128(a)

# ========================
# not / u16r128 / value
# ========================

func not_u16r128_fallback(a: u16r128): u16r128 = 
  var output: u16r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    unroll(i, 0, 1):
      pOut[i] = not pA[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    unroll(i, 0, 3):
      pOut[i] = not pA[i]
  return output

func not_u16r128_sse(a: u16r128): u16r128 = 
  let allOnes = mm_set1_epi32(-1)
  return cast[u16r128](mm_xor_si128(cast[sse2.M128i](a), cast[sse2.M128i](allOnes)))

let x86_not_u16r128: proc (a: u16r128): u16r128 = 
  if sseExists(): not_u16r128_sse 
  else: not_u16r128_fallback 

func not_u16r128_neon(a: u16r128): u16r128 =
  return cast[u16r128](vmvnq_u16(cast[neon.Uint16x8](a)))

let arm_not_u16r128: proc (a: u16r128): u16r128 = if neonExists(): not_u16r128_neon else: not_u16r128_fallback

func not_u16r128_lsx(a: u16r128): u16r128 =
  return cast[u16r128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](a)))

let la_not_u16r128: proc (a: u16r128): u16r128 = if lsxExists(): not_u16r128_lsx else: not_u16r128_fallback

template `not`*(a: u16r128): u16r128 = 
  when defined(amd64) or defined(i386): x86_not_u16r128(a)
  elif defined(arm64): arm_not_u16r128(a)
  elif defined(loongarch64): la_not_u16r128(a)

# ========================
# not / u32r128 / value
# ========================

func not_u32r128_fallback(a: u32r128): u32r128 = 
  var output: u32r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    unroll(i, 0, 1):
      pOut[i] = not pA[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    unroll(i, 0, 3):
      pOut[i] = not pA[i]
  return output

func not_u32r128_sse(a: u32r128): u32r128 = 
  let allOnes = mm_set1_epi32(-1)
  return cast[u32r128](mm_xor_si128(cast[sse2.M128i](a), cast[sse2.M128i](allOnes)))

let x86_not_u32r128: proc (a: u32r128): u32r128 = 
  if sseExists(): not_u32r128_sse 
  else: not_u32r128_fallback 

func not_u32r128_neon(a: u32r128): u32r128 =
  return cast[u32r128](vmvnq_u32(cast[neon.Uint32x4](a)))

let arm_not_u32r128: proc (a: u32r128): u32r128 = if neonExists(): not_u32r128_neon else: not_u32r128_fallback

func not_u32r128_lsx(a: u32r128): u32r128 =
  return cast[u32r128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](a)))

let la_not_u32r128: proc (a: u32r128): u32r128 = if lsxExists(): not_u32r128_lsx else: not_u32r128_fallback

template `not`*(a: u32r128): u32r128 = 
  when defined(amd64) or defined(i386): x86_not_u32r128(a)
  elif defined(arm64): arm_not_u32r128(a)
  elif defined(loongarch64): la_not_u32r128(a)

# ========================
# not / u64r128 / value
# ========================

func not_u64r128_fallback(a: u64r128): u64r128 = 
  var output: u64r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    unroll(i, 0, 1):
      pOut[i] = not pA[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    unroll(i, 0, 3):
      pOut[i] = not pA[i]
  return output

func not_u64r128_sse(a: u64r128): u64r128 = 
  let allOnes = mm_set1_epi32(-1)
  return cast[u64r128](mm_xor_si128(cast[sse2.M128i](a), cast[sse2.M128i](allOnes)))

let x86_not_u64r128: proc (a: u64r128): u64r128 = 
  if sseExists(): not_u64r128_sse 
  else: not_u64r128_fallback 

func not_u64r128_neon(a: u64r128): u64r128 =
  return cast[u64r128](vmvnq_u32(cast[neon.Uint32x4](a)))

let arm_not_u64r128: proc (a: u64r128): u64r128 = if neonExists(): not_u64r128_neon else: not_u64r128_fallback

func not_u64r128_lsx(a: u64r128): u64r128 =
  return cast[u64r128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](a)))

let la_not_u64r128: proc (a: u64r128): u64r128 = if lsxExists(): not_u64r128_lsx else: not_u64r128_fallback

template `not`*(a: u64r128): u64r128 = 
  when defined(amd64) or defined(i386): x86_not_u64r128(a)
  elif defined(arm64): arm_not_u64r128(a)
  elif defined(loongarch64): la_not_u64r128(a)

# ========================
# not / f32v128 / value
# ========================

func not_f32v128_fallback(a: f32v128): f32v128 =
  var output: f32v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    unroll(i, 0, 1):
      pOut[i] = not pA[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    unroll(i, 0, 3):
      pOut[i] = not pA[i]
  return output

func not_f32v128_sse(a: f32v128): f32v128 =
  let allOnes = mm_set1_epi32(-1)
  return cast[f32v128](mm_xor_ps(cast[sse.M128](a), cast[sse.M128](allOnes)))

let x86_not_f32v128: proc (a: f32v128): f32v128 = 
  if sseExists(): not_f32v128_sse 
  else: not_f32v128_fallback 

func not_f32v128_neon(a: f32v128): f32v128 =
  return cast[f32v128](vmvnq_u32(cast[neon.Uint32x4](a)))

let arm_not_f32v128: proc (a: f32v128): f32v128 = if neonExists(): not_f32v128_neon else: not_f32v128_fallback

func not_f32v128_lsx(a: f32v128): f32v128 =
  return cast[f32v128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](a))) # A NOR A == NOT A

let la_not_f32v128: proc (a: f32v128): f32v128 = if lsxExists(): not_f32v128_lsx else: not_f32v128_fallback

template `not`*(a: f32v128): f32v128 = 
  when defined(amd64) or defined(i386): x86_not_f32v128(a)
  elif defined(arm64): arm_not_f32v128(a)
  elif defined(loongarch64): la_not_f32v128(a)

# ========================
# not / f64v128 / value
# ========================

func not_f64v128_fallback(a: f64v128): f64v128 =
  var output: f64v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    unroll(i, 0, 1):
      pOut[i] = not pA[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    unroll(i, 0, 3):
      pOut[i] = not pA[i]
  return output

func not_f64v128_sse(a: f64v128): f64v128 =
  let allOnes = mm_set1_epi32(-1)
  return cast[f64v128](mm_xor_pd(cast[sse2.M128d](a), cast[sse2.M128d](allOnes)))

let x86_not_f64v128: proc (a: f64v128): f64v128 = 
  if sseExists(): not_f64v128_sse 
  else: not_f64v128_fallback 

func not_f64v128_neon(a: f64v128): f64v128 =
  return cast[f64v128](vmvnq_u32(cast[neon.Uint32x4](a)))

let arm_not_f64v128: proc (a: f64v128): f64v128 = if neonExists(): not_f64v128_neon else: not_f64v128_fallback

func not_f64v128_lsx(a: f64v128): f64v128 =
  return cast[f64v128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](a)))

let la_not_f64v128: proc (a: f64v128): f64v128 = if lsxExists(): not_f64v128_lsx else: not_f64v128_fallback

template `not`*(a: f64v128): f64v128 = 
  when defined(amd64) or defined(i386): x86_not_f64v128(a)
  elif defined(arm64): arm_not_f64v128(a)
  elif defined(loongarch64): la_not_f64v128(a)

# ========================
# not / i8v128 / value
# ========================

func not_i8v128_fallback(a: i8v128): i8v128 = 
  var output: i8v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    unroll(i, 0, 1):
      pOut[i] = not pA[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    unroll(i, 0, 3):
      pOut[i] = not pA[i]
  return output

func not_i8v128_sse(a: i8v128): i8v128 = 
  let allOnes = mm_set1_epi32(-1)
  return cast[i8v128](mm_xor_si128(cast[sse2.M128i](a), cast[sse2.M128i](allOnes)))

let x86_not_i8v128: proc (a: i8v128): i8v128 = 
  if sseExists(): not_i8v128_sse 
  else: not_i8v128_fallback 

func not_i8v128_neon(a: i8v128): i8v128 =
  return cast[i8v128](vmvnq_u8(cast[neon.Uint8x16](a)))

let arm_not_i8v128: proc (a: i8v128): i8v128 = if neonExists(): not_i8v128_neon else: not_i8v128_fallback

func not_i8v128_lsx(a: i8v128): i8v128 =
  return cast[i8v128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](a)))

let la_not_i8v128: proc (a: i8v128): i8v128 = if lsxExists(): not_i8v128_lsx else: not_i8v128_fallback

template `not`*(a: i8v128): i8v128 = 
  when defined(amd64) or defined(i386): x86_not_i8v128(a)
  elif defined(arm64): arm_not_i8v128(a)
  elif defined(loongarch64): la_not_i8v128(a)

# ========================
# not / i16v128 / value
# ========================

func not_i16v128_fallback(a: i16v128): i16v128 = 
  var output: i16v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    unroll(i, 0, 1):
      pOut[i] = not pA[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    unroll(i, 0, 3):
      pOut[i] = not pA[i]
  return output

func not_i16v128_sse(a: i16v128): i16v128 = 
  let allOnes = mm_set1_epi32(-1)
  return cast[i16v128](mm_xor_si128(cast[sse2.M128i](a), cast[sse2.M128i](allOnes)))

let x86_not_i16v128: proc (a: i16v128): i16v128 = 
  if sseExists(): not_i16v128_sse 
  else: not_i16v128_fallback 

func not_i16v128_neon(a: i16v128): i16v128 =
  return cast[i16v128](vmvnq_u16(cast[neon.Uint16x8](a)))

let arm_not_i16v128: proc (a: i16v128): i16v128 = if neonExists(): not_i16v128_neon else: not_i16v128_fallback

func not_i16v128_lsx(a: i16v128): i16v128 =
  return cast[i16v128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](a)))

let la_not_i16v128: proc (a: i16v128): i16v128 = if lsxExists(): not_i16v128_lsx else: not_i16v128_fallback

template `not`*(a: i16v128): i16v128 = 
  when defined(amd64) or defined(i386): x86_not_i16v128(a)
  elif defined(arm64): arm_not_i16v128(a)
  elif defined(loongarch64): la_not_i16v128(a)

# ========================
# not / i32v128 / value
# ========================

func not_i32v128_fallback(a: i32v128): i32v128 = 
  var output: i32v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    unroll(i, 0, 1):
      pOut[i] = not pA[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    unroll(i, 0, 3):
      pOut[i] = not pA[i]
  return output

func not_i32v128_sse(a: i32v128): i32v128 = 
  let allOnes = mm_set1_epi32(-1)
  return cast[i32v128](mm_xor_si128(cast[sse2.M128i](a), cast[sse2.M128i](allOnes)))

let x86_not_i32v128: proc (a: i32v128): i32v128 = 
  if sseExists(): not_i32v128_sse 
  else: not_i32v128_fallback 

func not_i32v128_neon(a: i32v128): i32v128 =
  return cast[i32v128](vmvnq_u32(cast[neon.Uint32x4](a)))

let arm_not_i32v128: proc (a: i32v128): i32v128 = if neonExists(): not_i32v128_neon else: not_i32v128_fallback

func not_i32v128_lsx(a: i32v128): i32v128 =
  return cast[i32v128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](a)))

let la_not_i32v128: proc (a: i32v128): i32v128 = if lsxExists(): not_i32v128_lsx else: not_i32v128_fallback

template `not`*(a: i32v128): i32v128 = 
  when defined(amd64) or defined(i386): x86_not_i32v128(a)
  elif defined(arm64): arm_not_i32v128(a)
  elif defined(loongarch64): la_not_i32v128(a)

# ========================
# not / i64v128 / value
# ========================

func not_i64v128_fallback(a: i64v128): i64v128 = 
  var output: i64v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    unroll(i, 0, 1):
      pOut[i] = not pA[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    unroll(i, 0, 3):
      pOut[i] = not pA[i]
  return output

func not_i64v128_sse(a: i64v128): i64v128 = 
  let allOnes = mm_set1_epi32(-1)
  return cast[i64v128](mm_xor_si128(cast[sse2.M128i](a), cast[sse2.M128i](allOnes)))

let x86_not_i64v128: proc (a: i64v128): i64v128 = 
  if sseExists(): not_i64v128_sse 
  else: not_i64v128_fallback 

func not_i64v128_neon(a: i64v128): i64v128 =
  return cast[i64v128](vmvnq_u32(cast[neon.Uint32x4](a)))

let arm_not_i64v128: proc (a: i64v128): i64v128 = if neonExists(): not_i64v128_neon else: not_i64v128_fallback

func not_i64v128_lsx(a: i64v128): i64v128 =
  return cast[i64v128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](a)))

let la_not_i64v128: proc (a: i64v128): i64v128 = if lsxExists(): not_i64v128_lsx else: not_i64v128_fallback

template `not`*(a: i64v128): i64v128 = 
  when defined(amd64) or defined(i386): x86_not_i64v128(a)
  elif defined(arm64): arm_not_i64v128(a)
  elif defined(loongarch64): la_not_i64v128(a)

# ========================
# not / u8v128 / value
# ========================

func not_u8v128_fallback(a: u8v128): u8v128 = 
  var output: u8v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    unroll(i, 0, 1):
      pOut[i] = not pA[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    unroll(i, 0, 3):
      pOut[i] = not pA[i]
  return output

func not_u8v128_sse(a: u8v128): u8v128 = 
  let allOnes = mm_set1_epi32(-1)
  return cast[u8v128](mm_xor_si128(cast[sse2.M128i](a), cast[sse2.M128i](allOnes)))

let x86_not_u8v128: proc (a: u8v128): u8v128 = 
  if sseExists(): not_u8v128_sse 
  else: not_u8v128_fallback 

func not_u8v128_neon(a: u8v128): u8v128 =
  return cast[u8v128](vmvnq_u8(cast[neon.Uint8x16](a)))

let arm_not_u8v128: proc (a: u8v128): u8v128 = if neonExists(): not_u8v128_neon else: not_u8v128_fallback

func not_u8v128_lsx(a: u8v128): u8v128 =
  return cast[u8v128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](a)))

let la_not_u8v128: proc (a: u8v128): u8v128 = if lsxExists(): not_u8v128_lsx else: not_u8v128_fallback

template `not`*(a: u8v128): u8v128 = 
  when defined(amd64) or defined(i386): x86_not_u8v128(a)
  elif defined(arm64): arm_not_u8v128(a)
  elif defined(loongarch64): la_not_u8v128(a)

# ========================
# not / u16v128 / value
# ========================

func not_u16v128_fallback(a: u16v128): u16v128 = 
  var output: u16v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    unroll(i, 0, 1):
      pOut[i] = not pA[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    unroll(i, 0, 3):
      pOut[i] = not pA[i]
  return output

func not_u16v128_sse(a: u16v128): u16v128 = 
  let allOnes = mm_set1_epi32(-1)
  return cast[u16v128](mm_xor_si128(cast[sse2.M128i](a), cast[sse2.M128i](allOnes)))

let x86_not_u16v128: proc (a: u16v128): u16v128 = 
  if sseExists(): not_u16v128_sse 
  else: not_u16v128_fallback 

func not_u16v128_neon(a: u16v128): u16v128 =
  return cast[u16v128](vmvnq_u16(cast[neon.Uint16x8](a)))

let arm_not_u16v128: proc (a: u16v128): u16v128 = if neonExists(): not_u16v128_neon else: not_u16v128_fallback

func not_u16v128_lsx(a: u16v128): u16v128 =
  return cast[u16v128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](a)))

let la_not_u16v128: proc (a: u16v128): u16v128 = if lsxExists(): not_u16v128_lsx else: not_u16v128_fallback

template `not`*(a: u16v128): u16v128 = 
  when defined(amd64) or defined(i386): x86_not_u16v128(a)
  elif defined(arm64): arm_not_u16v128(a)
  elif defined(loongarch64): la_not_u16v128(a)

# ========================
# not / u32v128 / value
# ========================

func not_u32v128_fallback(a: u32v128): u32v128 = 
  var output: u32v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    unroll(i, 0, 1):
      pOut[i] = not pA[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    unroll(i, 0, 3):
      pOut[i] = not pA[i]
  return output

func not_u32v128_sse(a: u32v128): u32v128 = 
  let allOnes = mm_set1_epi32(-1)
  return cast[u32v128](mm_xor_si128(cast[sse2.M128i](a), cast[sse2.M128i](allOnes)))

let x86_not_u32v128: proc (a: u32v128): u32v128 = 
  if sseExists(): not_u32v128_sse 
  else: not_u32v128_fallback 

func not_u32v128_neon(a: u32v128): u32v128 =
  return cast[u32v128](vmvnq_u32(cast[neon.Uint32x4](a)))

let arm_not_u32v128: proc (a: u32v128): u32v128 = if neonExists(): not_u32v128_neon else: not_u32v128_fallback

func not_u32v128_lsx(a: u32v128): u32v128 =
  return cast[u32v128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](a)))

let la_not_u32v128: proc (a: u32v128): u32v128 = if lsxExists(): not_u32v128_lsx else: not_u32v128_fallback

template `not`*(a: u32v128): u32v128 = 
  when defined(amd64) or defined(i386): x86_not_u32v128(a)
  elif defined(arm64): arm_not_u32v128(a)
  elif defined(loongarch64): la_not_u32v128(a)

# ========================
# not / u64v128 / value
# ========================

func not_u64v128_fallback(a: u64v128): u64v128 = 
  var output: u64v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    unroll(i, 0, 1):
      pOut[i] = not pA[i]
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    unroll(i, 0, 3):
      pOut[i] = not pA[i]
  return output

func not_u64v128_sse(a: u64v128): u64v128 = 
  let allOnes = mm_set1_epi32(-1)
  return cast[u64v128](mm_xor_si128(cast[sse2.M128i](a), cast[sse2.M128i](allOnes)))

let x86_not_u64v128: proc (a: u64v128): u64v128 = 
  if sseExists(): not_u64v128_sse 
  else: not_u64v128_fallback 

func not_u64v128_neon(a: u64v128): u64v128 =
  return cast[u64v128](vmvnq_u32(cast[neon.Uint32x4](a)))

let arm_not_u64v128: proc (a: u64v128): u64v128 = if neonExists(): not_u64v128_neon else: not_u64v128_fallback

func not_u64v128_lsx(a: u64v128): u64v128 =
  return cast[u64v128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](a)))

let la_not_u64v128: proc (a: u64v128): u64v128 = if lsxExists(): not_u64v128_lsx else: not_u64v128_fallback

template `not`*(a: u64v128): u64v128 = 
  when defined(amd64) or defined(i386): x86_not_u64v128(a)
  elif defined(arm64): arm_not_u64v128(a)
  elif defined(loongarch64): la_not_u64v128(a)


# ========================
# nand / f32r128 / value
# ========================

func nand_f32r128_fallback(a, b: f32r128): f32r128 =
  var output: f32r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] and pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] and pB[i])
  return output

func nand_f32r128_sse(a, b: f32r128): f32r128 =
  let allOnes = mm_set1_epi32(-1)
  let andRes = mm_and_ps(cast[sse.M128](a), cast[sse.M128](b))
  return cast[f32r128](mm_xor_ps(andRes, cast[sse.M128](allOnes)))

let x86_nand_f32r128: proc (a, b: f32r128): f32r128 = 
  if sseExists(): nand_f32r128_sse 
  else: nand_f32r128_fallback 

func nand_f32r128_neon(a, b: f32r128): f32r128 =
  let andRes = vandq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b))
  return cast[f32r128](vmvnq_u32(andRes))

let arm_nand_f32r128: proc (a, b: f32r128): f32r128 = if neonExists(): nand_f32r128_neon else: nand_f32r128_fallback

func nand_f32r128_lsx(a, b: f32r128): f32r128 =
  let andRes = lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b))
  return cast[f32r128](lsx_vnor_v(andRes, andRes))

let la_nand_f32r128: proc (a, b: f32r128): f32r128 = if lsxExists(): nand_f32r128_lsx else: nand_f32r128_fallback

template `nand`*(a, b: f32r128): f32r128 = 
  when defined(amd64) or defined(i386): x86_nand_f32r128(a, b)
  elif defined(arm64): arm_nand_f32r128(a, b)
  elif defined(loongarch64): la_nand_f32r128(a, b)

# ========================
# nand / f64r128 / value
# ========================

func nand_f64r128_fallback(a, b: f64r128): f64r128 =
  var output: f64r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] and pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] and pB[i])
  return output

func nand_f64r128_sse(a, b: f64r128): f64r128 =
  let allOnes = mm_set1_epi32(-1)
  let andRes = mm_and_pd(cast[sse2.M128d](a), cast[sse2.M128d](b))
  return cast[f64r128](mm_xor_pd(andRes, cast[sse2.M128d](allOnes)))

let x86_nand_f64r128: proc (a, b: f64r128): f64r128 = 
  if sseExists(): nand_f64r128_sse 
  else: nand_f64r128_fallback 

func nand_f64r128_neon(a, b: f64r128): f64r128 =
  let andRes = vandq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b))
  return cast[f64r128](vmvnq_u32(andRes))

let arm_nand_f64r128: proc (a, b: f64r128): f64r128 = if neonExists(): nand_f64r128_neon else: nand_f64r128_fallback

func nand_f64r128_lsx(a, b: f64r128): f64r128 =
  let andRes = lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b))
  return cast[f64r128](lsx_vnor_v(andRes, andRes))

let la_nand_f64r128: proc (a: f64r128, b: f64r128): f64r128 = if lsxExists(): nand_f64r128_lsx else: nand_f64r128_fallback

template `nand`*(a, b: f64r128): f64r128 = 
  when defined(amd64) or defined(i386): x86_nand_f64r128(a, b)
  elif defined(arm64): arm_nand_f64r128(a, b)
  elif defined(loongarch64): la_nand_f64r128(a, b)

# ========================
# nand / i8r128 / value
# ========================

func nand_i8r128_fallback(a, b: i8r128): i8r128 = 
  var output: i8r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] and pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] and pB[i])
  return output

func nand_i8r128_sse(a, b: i8r128): i8r128 = 
  let allOnes = mm_set1_epi32(-1)
  let andRes = mm_and_si128(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[i8r128](mm_xor_si128(andRes, cast[sse2.M128i](allOnes)))

let x86_nand_i8r128: proc (a, b: i8r128): i8r128 = 
  if sseExists(): nand_i8r128_sse 
  else: nand_i8r128_fallback 

func nand_i8r128_neon(a, b: i8r128): i8r128 =
  let andRes = vandq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b))
  return cast[i8r128](vmvnq_u8(andRes))

let arm_nand_i8r128: proc (a, b: i8r128): i8r128 = if neonExists(): nand_i8r128_neon else: nand_i8r128_fallback

func nand_i8r128_lsx(a, b: i8r128): i8r128 =
  let andRes = lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b))
  return cast[i8r128](lsx_vnor_v(andRes, andRes))

let la_nand_i8r128: proc (a, b: i8r128): i8r128 = if lsxExists(): nand_i8r128_lsx else: nand_i8r128_fallback

template `nand`*(a, b: i8r128): i8r128 = 
  when defined(amd64) or defined(i386): x86_nand_i8r128(a, b)
  elif defined(arm64): arm_nand_i8r128(a, b)
  elif defined(loongarch64): la_nand_i8r128(a, b)

# ========================
# nand / i16r128 / value
# ========================

func nand_i16r128_fallback(a, b: i16r128): i16r128 = 
  var output: i16r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] and pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] and pB[i])
  return output

func nand_i16r128_sse(a, b: i16r128): i16r128 = 
  let allOnes = mm_set1_epi32(-1)
  let andRes = mm_and_si128(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[i16r128](mm_xor_si128(andRes, cast[sse2.M128i](allOnes)))

let x86_nand_i16r128: proc (a, b: i16r128): i16r128 = 
  if sseExists(): nand_i16r128_sse 
  else: nand_i16r128_fallback 

func nand_i16r128_neon(a, b: i16r128): i16r128 =
  let andRes = vandq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b))
  return cast[i16r128](vmvnq_u16(andRes))

let arm_nand_i16r128: proc (a, b: i16r128): i16r128 = if neonExists(): nand_i16r128_neon else: nand_i16r128_fallback

func nand_i16r128_lsx(a, b: i16r128): i16r128 =
  let andRes = lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b))
  return cast[i16r128](lsx_vnor_v(andRes, andRes))

let la_nand_i16r128: proc (a, b: i16r128): i16r128 = if lsxExists(): nand_i16r128_lsx else: nand_i16r128_fallback

template `nand`*(a, b: i16r128): i16r128 = 
  when defined(amd64) or defined(i386): x86_nand_i16r128(a, b)
  elif defined(arm64): arm_nand_i16r128(a, b)
  elif defined(loongarch64): la_nand_i16r128(a, b)

# ========================
# nand / i32r128 / value
# ========================

func nand_i32r128_fallback(a, b: i32r128): i32r128 = 
  var output: i32r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] and pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] and pB[i])
  return output

func nand_i32r128_sse(a, b: i32r128): i32r128 = 
  let allOnes = mm_set1_epi32(-1)
  let andRes = mm_and_si128(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[i32r128](mm_xor_si128(andRes, cast[sse2.M128i](allOnes)))

let x86_nand_i32r128: proc (a, b: i32r128): i32r128 = 
  if sseExists(): nand_i32r128_sse 
  else: nand_i32r128_fallback 

func nand_i32r128_neon(a, b: i32r128): i32r128 =
  let andRes = vandq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b))
  return cast[i32r128](vmvnq_u32(andRes))

let arm_nand_i32r128: proc (a, b: i32r128): i32r128 = if neonExists(): nand_i32r128_neon else: nand_i32r128_fallback

func nand_i32r128_lsx(a, b: i32r128): i32r128 =
  let andRes = lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b))
  return cast[i32r128](lsx_vnor_v(andRes, andRes))

let la_nand_i32r128: proc (a, b: i32r128): i32r128 = if lsxExists(): nand_i32r128_lsx else: nand_i32r128_fallback

template `nand`*(a, b: i32r128): i32r128 = 
  when defined(amd64) or defined(i386): x86_nand_i32r128(a, b)
  elif defined(arm64): arm_nand_i32r128(a, b)
  elif defined(loongarch64): la_nand_i32r128(a, b)

# ========================
# nand / i64r128 / value
# ========================

func nand_i64r128_fallback(a, b: i64r128): i64r128 = 
  var output: i64r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] and pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] and pB[i])
  return output

func nand_i64r128_sse(a, b: i64r128): i64r128 = 
  let allOnes = mm_set1_epi32(-1)
  let andRes = mm_and_si128(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[i64r128](mm_xor_si128(andRes, cast[sse2.M128i](allOnes)))

let x86_nand_i64r128: proc (a, b: i64r128): i64r128 = 
  if sseExists(): nand_i64r128_sse 
  else: nand_i64r128_fallback 

func nand_i64r128_neon(a, b: i64r128): i64r128 =
  let andRes = vandq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b))
  return cast[i64r128](vmvnq_u32(cast[neon.Uint32x4](andRes)))

let arm_nand_i64r128: proc (a, b: i64r128): i64r128 = if neonExists(): nand_i64r128_neon else: nand_i64r128_fallback

func nand_i64r128_lsx(a, b: i64r128): i64r128 =
  let andRes = lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b))
  return cast[i64r128](lsx_vnor_v(andRes, andRes))

let la_nand_i64r128: proc (a, b: i64r128): i64r128 = if lsxExists(): nand_i64r128_lsx else: nand_i64r128_fallback

template `nand`*(a, b: i64r128): i64r128 = 
  when defined(amd64) or defined(i386): x86_nand_i64r128(a, b)
  elif defined(arm64): arm_nand_i64r128(a, b)
  elif defined(loongarch64): la_nand_i64r128(a, b)

# ========================
# nand / u8r128 / value
# ========================

func nand_u8r128_fallback(a, b: u8r128): u8r128 = 
  var output: u8r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] and pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] and pB[i])
  return output

func nand_u8r128_sse(a, b: u8r128): u8r128 = 
  let allOnes = mm_set1_epi32(-1)
  let andRes = mm_and_si128(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[u8r128](mm_xor_si128(andRes, cast[sse2.M128i](allOnes)))

let x86_nand_u8r128: proc (a, b: u8r128): u8r128 = 
  if sseExists(): nand_u8r128_sse 
  else: nand_u8r128_fallback 

func nand_u8r128_neon(a, b: u8r128): u8r128 =
  let andRes = vandq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b))
  return cast[u8r128](vmvnq_u8(andRes))

let arm_nand_u8r128: proc (a, b: u8r128): u8r128 = if neonExists(): nand_u8r128_neon else: nand_u8r128_fallback

func nand_u8r128_lsx(a, b: u8r128): u8r128 =
  let andRes = lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b))
  return cast[u8r128](lsx_vnor_v(andRes, andRes))

let la_nand_u8r128: proc (a, b: u8r128): u8r128 = if lsxExists(): nand_u8r128_lsx else: nand_u8r128_fallback

template `nand`*(a, b: u8r128): u8r128 = 
  when defined(amd64) or defined(i386): x86_nand_u8r128(a, b)
  elif defined(arm64): arm_nand_u8r128(a, b)
  elif defined(loongarch64): la_nand_u8r128(a, b)

# ========================
# nand / u16r128 / value
# ========================

func nand_u16r128_fallback(a, b: u16r128): u16r128 = 
  var output: u16r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] and pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] and pB[i])
  return output

func nand_u16r128_sse(a, b: u16r128): u16r128 = 
  let allOnes = mm_set1_epi32(-1)
  let andRes = mm_and_si128(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[u16r128](mm_xor_si128(andRes, cast[sse2.M128i](allOnes)))

let x86_nand_u16r128: proc (a, b: u16r128): u16r128 = 
  if sseExists(): nand_u16r128_sse 
  else: nand_u16r128_fallback 

func nand_u16r128_neon(a, b: u16r128): u16r128 =
  let andRes = vandq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b))
  return cast[u16r128](vmvnq_u16(andRes))

let arm_nand_u16r128: proc (a, b: u16r128): u16r128 = if neonExists(): nand_u16r128_neon else: nand_u16r128_fallback

func nand_u16r128_lsx(a, b: u16r128): u16r128 =
  let andRes = lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b))
  return cast[u16r128](lsx_vnor_v(andRes, andRes))

let la_nand_u16r128: proc (a, b: u16r128): u16r128 = if lsxExists(): nand_u16r128_lsx else: nand_u16r128_fallback

template `nand`*(a, b: u16r128): u16r128 = 
  when defined(amd64) or defined(i386): x86_nand_u16r128(a, b)
  elif defined(arm64): arm_nand_u16r128(a, b)
  elif defined(loongarch64): la_nand_u16r128(a, b)

# ========================
# nand / u32r128 / value
# ========================

func nand_u32r128_fallback(a, b: u32r128): u32r128 = 
  var output: u32r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] and pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] and pB[i])
  return output

func nand_u32r128_sse(a, b: u32r128): u32r128 = 
  let allOnes = mm_set1_epi32(-1)
  let andRes = mm_and_si128(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[u32r128](mm_xor_si128(andRes, cast[sse2.M128i](allOnes)))

let x86_nand_u32r128: proc (a, b: u32r128): u32r128 = 
  if sseExists(): nand_u32r128_sse 
  else: nand_u32r128_fallback 

func nand_u32r128_neon(a, b: u32r128): u32r128 =
  let andRes = vandq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b))
  return cast[u32r128](vmvnq_u32(andRes))

let arm_nand_u32r128: proc (a, b: u32r128): u32r128 = if neonExists(): nand_u32r128_neon else: nand_u32r128_fallback

func nand_u32r128_lsx(a, b: u32r128): u32r128 =
  let andRes = lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b))
  return cast[u32r128](lsx_vnor_v(andRes, andRes))

let la_nand_u32r128: proc (a, b: u32r128): u32r128 = if lsxExists(): nand_u32r128_lsx else: nand_u32r128_fallback

template `nand`*(a, b: u32r128): u32r128 = 
  when defined(amd64) or defined(i386): x86_nand_u32r128(a, b)
  elif defined(arm64): arm_nand_u32r128(a, b)
  elif defined(loongarch64): la_nand_u32r128(a, b)

# ========================
# nand / u64r128 / value
# ========================

func nand_u64r128_fallback(a, b: u64r128): u64r128 = 
  var output: u64r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] and pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] and pB[i])
  return output

func nand_u64r128_sse(a, b: u64r128): u64r128 = 
  let allOnes = mm_set1_epi32(-1)
  let andRes = mm_and_si128(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[u64r128](mm_xor_si128(andRes, cast[sse2.M128i](allOnes)))

let x86_nand_u64r128: proc (a, b: u64r128): u64r128 = 
  if sseExists(): nand_u64r128_sse 
  else: nand_u64r128_fallback 

func nand_u64r128_neon(a, b: u64r128): u64r128 =
  let andRes = vandq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b))
  return cast[u64r128](vmvnq_u32(cast[neon.Uint32x4](andRes)))

let arm_nand_u64r128: proc (a, b: u64r128): u64r128 = if neonExists(): nand_u64r128_neon else: nand_u64r128_fallback

func nand_u64r128_lsx(a, b: u64r128): u64r128 =
  let andRes = lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b))
  return cast[u64r128](lsx_vnor_v(andRes, andRes))

let la_nand_u64r128: proc (a, b: u64r128): u64r128 = if lsxExists(): nand_u64r128_lsx else: nand_u64r128_fallback

template `nand`*(a, b: u64r128): u64r128 = 
  when defined(amd64) or defined(i386): x86_nand_u64r128(a, b)
  elif defined(arm64): arm_nand_u64r128(a, b)
  elif defined(loongarch64): la_nand_u64r128(a, b)

# ========================
# nand / f32v128 / value
# ========================

func nand_f32v128_fallback(a, b: f32v128): f32v128 =
  var output: f32v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] and pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] and pB[i])
  return output

func nand_f32v128_sse(a, b: f32v128): f32v128 =
  let allOnes = mm_set1_epi32(-1)
  let andRes = mm_and_ps(cast[sse.M128](a), cast[sse.M128](b))
  return cast[f32v128](mm_xor_ps(andRes, cast[sse.M128](allOnes)))

let x86_nand_f32v128: proc (a, b: f32v128): f32v128 = 
  if sseExists(): nand_f32v128_sse 
  else: nand_f32v128_fallback 

func nand_f32v128_neon(a, b: f32v128): f32v128 =
  let andRes = vandq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b))
  return cast[f32v128](vmvnq_u32(andRes))

let arm_nand_f32v128: proc (a, b: f32v128): f32v128 = if neonExists(): nand_f32v128_neon else: nand_f32v128_fallback

func nand_f32v128_lsx(a, b: f32v128): f32v128 =
  let andRes = lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b))
  return cast[f32v128](lsx_vnor_v(andRes, andRes))

let la_nand_f32v128: proc (a, b: f32v128): f32v128 = if lsxExists(): nand_f32v128_lsx else: nand_f32v128_fallback

template `nand`*(a, b: f32v128): f32v128 = 
  when defined(amd64) or defined(i386): x86_nand_f32v128(a, b)
  elif defined(arm64): arm_nand_f32v128(a, b)
  elif defined(loongarch64): la_nand_f32v128(a, b)

# ========================
# nand / f64v128 / value
# ========================

func nand_f64v128_fallback(a, b: f64v128): f64v128 =
  var output: f64v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] and pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] and pB[i])
  return output

func nand_f64v128_sse(a, b: f64v128): f64v128 =
  let allOnes = mm_set1_epi32(-1)
  let andRes = mm_and_pd(cast[sse2.M128d](a), cast[sse2.M128d](b))
  return cast[f64v128](mm_xor_pd(andRes, cast[sse2.M128d](allOnes)))

let x86_nand_f64v128: proc (a, b: f64v128): f64v128 = 
  if sseExists(): nand_f64v128_sse 
  else: nand_f64v128_fallback 

func nand_f64v128_neon(a, b: f64v128): f64v128 =
  let andRes = vandq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b))
  return cast[f64v128](vmvnq_u32(andRes))

let arm_nand_f64v128: proc (a, b: f64v128): f64v128 = if neonExists(): nand_f64v128_neon else: nand_f64v128_fallback

func nand_f64v128_lsx(a, b: f64v128): f64v128 =
  let andRes = lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b))
  return cast[f64v128](lsx_vnor_v(andRes, andRes))

let la_nand_f64v128: proc (a: f64v128, b: f64v128): f64v128 = if lsxExists(): nand_f64v128_lsx else: nand_f64v128_fallback

template `nand`*(a, b: f64v128): f64v128 = 
  when defined(amd64) or defined(i386): x86_nand_f64v128(a, b)
  elif defined(arm64): arm_nand_f64v128(a, b)
  elif defined(loongarch64): la_nand_f64v128(a, b)

# ========================
# nand / i8v128 / value
# ========================

func nand_i8v128_fallback(a, b: i8v128): i8v128 = 
  var output: i8v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] and pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] and pB[i])
  return output

func nand_i8v128_sse(a, b: i8v128): i8v128 = 
  let allOnes = mm_set1_epi32(-1)
  let andRes = mm_and_si128(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[i8v128](mm_xor_si128(andRes, cast[sse2.M128i](allOnes)))

let x86_nand_i8v128: proc (a, b: i8v128): i8v128 = 
  if sseExists(): nand_i8v128_sse 
  else: nand_i8v128_fallback 

func nand_i8v128_neon(a, b: i8v128): i8v128 =
  let andRes = vandq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b))
  return cast[i8v128](vmvnq_u8(andRes))

let arm_nand_i8v128: proc (a, b: i8v128): i8v128 = if neonExists(): nand_i8v128_neon else: nand_i8v128_fallback

func nand_i8v128_lsx(a, b: i8v128): i8v128 =
  let andRes = lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b))
  return cast[i8v128](lsx_vnor_v(andRes, andRes))

let la_nand_i8v128: proc (a, b: i8v128): i8v128 = if lsxExists(): nand_i8v128_lsx else: nand_i8v128_fallback

template `nand`*(a, b: i8v128): i8v128 = 
  when defined(amd64) or defined(i386): x86_nand_i8v128(a, b)
  elif defined(arm64): arm_nand_i8v128(a, b)
  elif defined(loongarch64): la_nand_i8v128(a, b)

# ========================
# nand / i16v128 / value
# ========================

func nand_i16v128_fallback(a, b: i16v128): i16v128 = 
  var output: i16v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] and pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] and pB[i])
  return output

func nand_i16v128_sse(a, b: i16v128): i16v128 = 
  let allOnes = mm_set1_epi32(-1)
  let andRes = mm_and_si128(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[i16v128](mm_xor_si128(andRes, cast[sse2.M128i](allOnes)))

let x86_nand_i16v128: proc (a, b: i16v128): i16v128 = 
  if sseExists(): nand_i16v128_sse 
  else: nand_i16v128_fallback 

func nand_i16v128_neon(a, b: i16v128): i16v128 =
  let andRes = vandq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b))
  return cast[i16v128](vmvnq_u16(andRes))

let arm_nand_i16v128: proc (a, b: i16v128): i16v128 = if neonExists(): nand_i16v128_neon else: nand_i16v128_fallback

func nand_i16v128_lsx(a, b: i16v128): i16v128 =
  let andRes = lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b))
  return cast[i16v128](lsx_vnor_v(andRes, andRes))

let la_nand_i16v128: proc (a, b: i16v128): i16v128 = if lsxExists(): nand_i16v128_lsx else: nand_i16v128_fallback

template `nand`*(a, b: i16v128): i16v128 = 
  when defined(amd64) or defined(i386): x86_nand_i16v128(a, b)
  elif defined(arm64): arm_nand_i16v128(a, b)
  elif defined(loongarch64): la_nand_i16v128(a, b)

# ========================
# nand / i32v128 / value
# ========================

func nand_i32v128_fallback(a, b: i32v128): i32v128 = 
  var output: i32v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] and pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] and pB[i])
  return output

func nand_i32v128_sse(a, b: i32v128): i32v128 = 
  let allOnes = mm_set1_epi32(-1)
  let andRes = mm_and_si128(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[i32v128](mm_xor_si128(andRes, cast[sse2.M128i](allOnes)))

let x86_nand_i32v128: proc (a, b: i32v128): i32v128 = 
  if sseExists(): nand_i32v128_sse 
  else: nand_i32v128_fallback 

func nand_i32v128_neon(a, b: i32v128): i32v128 =
  let andRes = vandq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b))
  return cast[i32v128](vmvnq_u32(andRes))

let arm_nand_i32v128: proc (a, b: i32v128): i32v128 = if neonExists(): nand_i32v128_neon else: nand_i32v128_fallback

func nand_i32v128_lsx(a, b: i32v128): i32v128 =
  let andRes = lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b))
  return cast[i32v128](lsx_vnor_v(andRes, andRes))

let la_nand_i32v128: proc (a, b: i32v128): i32v128 = if lsxExists(): nand_i32v128_lsx else: nand_i32v128_fallback

template `nand`*(a, b: i32v128): i32v128 = 
  when defined(amd64) or defined(i386): x86_nand_i32v128(a, b)
  elif defined(arm64): arm_nand_i32v128(a, b)
  elif defined(loongarch64): la_nand_i32v128(a, b)

# ========================
# nand / i64v128 / value
# ========================

func nand_i64v128_fallback(a, b: i64v128): i64v128 = 
  var output: i64v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] and pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] and pB[i])
  return output

func nand_i64v128_sse(a, b: i64v128): i64v128 = 
  let allOnes = mm_set1_epi32(-1)
  let andRes = mm_and_si128(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[i64v128](mm_xor_si128(andRes, cast[sse2.M128i](allOnes)))

let x86_nand_i64v128: proc (a, b: i64v128): i64v128 = 
  if sseExists(): nand_i64v128_sse 
  else: nand_i64v128_fallback 

func nand_i64v128_neon(a, b: i64v128): i64v128 =
  let andRes = vandq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b))
  return cast[i64v128](vmvnq_u32(cast[neon.Uint32x4](andRes)))

let arm_nand_i64v128: proc (a, b: i64v128): i64v128 = if neonExists(): nand_i64v128_neon else: nand_i64v128_fallback

func nand_i64v128_lsx(a, b: i64v128): i64v128 =
  let andRes = lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b))
  return cast[i64v128](lsx_vnor_v(andRes, andRes))

let la_nand_i64v128: proc (a, b: i64v128): i64v128 = if lsxExists(): nand_i64v128_lsx else: nand_i64v128_fallback

template `nand`*(a, b: i64v128): i64v128 = 
  when defined(amd64) or defined(i386): x86_nand_i64v128(a, b)
  elif defined(arm64): arm_nand_i64v128(a, b)
  elif defined(loongarch64): la_nand_i64v128(a, b)

# ========================
# nand / u8v128 / value
# ========================

func nand_u8v128_fallback(a, b: u8v128): u8v128 = 
  var output: u8v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] and pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] and pB[i])
  return output

func nand_u8v128_sse(a, b: u8v128): u8v128 = 
  let allOnes = mm_set1_epi32(-1)
  let andRes = mm_and_si128(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[u8v128](mm_xor_si128(andRes, cast[sse2.M128i](allOnes)))

let x86_nand_u8v128: proc (a, b: u8v128): u8v128 = 
  if sseExists(): nand_u8v128_sse 
  else: nand_u8v128_fallback 

func nand_u8v128_neon(a, b: u8v128): u8v128 =
  let andRes = vandq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b))
  return cast[u8v128](vmvnq_u8(andRes))

let arm_nand_u8v128: proc (a, b: u8v128): u8v128 = if neonExists(): nand_u8v128_neon else: nand_u8v128_fallback

func nand_u8v128_lsx(a, b: u8v128): u8v128 =
  let andRes = lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b))
  return cast[u8v128](lsx_vnor_v(andRes, andRes))

let la_nand_u8v128: proc (a, b: u8v128): u8v128 = if lsxExists(): nand_u8v128_lsx else: nand_u8v128_fallback

template `nand`*(a, b: u8v128): u8v128 = 
  when defined(amd64) or defined(i386): x86_nand_u8v128(a, b)
  elif defined(arm64): arm_nand_u8v128(a, b)
  elif defined(loongarch64): la_nand_u8v128(a, b)

# ========================
# nand / u16v128 / value
# ========================

func nand_u16v128_fallback(a, b: u16v128): u16v128 = 
  var output: u16v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] and pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] and pB[i])
  return output

func nand_u16v128_sse(a, b: u16v128): u16v128 = 
  let allOnes = mm_set1_epi32(-1)
  let andRes = mm_and_si128(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[u16v128](mm_xor_si128(andRes, cast[sse2.M128i](allOnes)))

let x86_nand_u16v128: proc (a, b: u16v128): u16v128 = 
  if sseExists(): nand_u16v128_sse 
  else: nand_u16v128_fallback 

func nand_u16v128_neon(a, b: u16v128): u16v128 =
  let andRes = vandq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b))
  return cast[u16v128](vmvnq_u16(andRes))

let arm_nand_u16v128: proc (a, b: u16v128): u16v128 = if neonExists(): nand_u16v128_neon else: nand_u16v128_fallback

func nand_u16v128_lsx(a, b: u16v128): u16v128 =
  let andRes = lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b))
  return cast[u16v128](lsx_vnor_v(andRes, andRes))

let la_nand_u16v128: proc (a, b: u16v128): u16v128 = if lsxExists(): nand_u16v128_lsx else: nand_u16v128_fallback

template `nand`*(a, b: u16v128): u16v128 = 
  when defined(amd64) or defined(i386): x86_nand_u16v128(a, b)
  elif defined(arm64): arm_nand_u16v128(a, b)
  elif defined(loongarch64): la_nand_u16v128(a, b)

# ========================
# nand / u32v128 / value
# ========================

func nand_u32v128_fallback(a, b: u32v128): u32v128 = 
  var output: u32v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] and pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] and pB[i])
  return output

func nand_u32v128_sse(a, b: u32v128): u32v128 = 
  let allOnes = mm_set1_epi32(-1)
  let andRes = mm_and_si128(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[u32v128](mm_xor_si128(andRes, cast[sse2.M128i](allOnes)))

let x86_nand_u32v128: proc (a, b: u32v128): u32v128 = 
  if sseExists(): nand_u32v128_sse 
  else: nand_u32v128_fallback 

func nand_u32v128_neon(a, b: u32v128): u32v128 =
  let andRes = vandq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b))
  return cast[u32v128](vmvnq_u32(andRes))

let arm_nand_u32v128: proc (a, b: u32v128): u32v128 = if neonExists(): nand_u32v128_neon else: nand_u32v128_fallback

func nand_u32v128_lsx(a, b: u32v128): u32v128 =
  let andRes = lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b))
  return cast[u32v128](lsx_vnor_v(andRes, andRes))

let la_nand_u32v128: proc (a, b: u32v128): u32v128 = if lsxExists(): nand_u32v128_lsx else: nand_u32v128_fallback

template `nand`*(a, b: u32v128): u32v128 = 
  when defined(amd64) or defined(i386): x86_nand_u32v128(a, b)
  elif defined(arm64): arm_nand_u32v128(a, b)
  elif defined(loongarch64): la_nand_u32v128(a, b)

# ========================
# nand / u64v128 / value
# ========================

func nand_u64v128_fallback(a, b: u64v128): u64v128 = 
  var output: u64v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] and pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] and pB[i])
  return output

func nand_u64v128_sse(a, b: u64v128): u64v128 = 
  let allOnes = mm_set1_epi32(-1)
  let andRes = mm_and_si128(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[u64v128](mm_xor_si128(andRes, cast[sse2.M128i](allOnes)))

let x86_nand_u64v128: proc (a, b: u64v128): u64v128 = 
  if sseExists(): nand_u64v128_sse 
  else: nand_u64v128_fallback 

func nand_u64v128_neon(a, b: u64v128): u64v128 =
  let andRes = vandq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b))
  return cast[u64v128](vmvnq_u32(cast[neon.Uint32x4](andRes)))

let arm_nand_u64v128: proc (a, b: u64v128): u64v128 = if neonExists(): nand_u64v128_neon else: nand_u64v128_fallback

func nand_u64v128_lsx(a, b: u64v128): u64v128 =
  let andRes = lsx_vand_v(cast[lsx.M128i](a), cast[lsx.M128i](b))
  return cast[u64v128](lsx_vnor_v(andRes, andRes))

let la_nand_u64v128: proc (a, b: u64v128): u64v128 = if lsxExists(): nand_u64v128_lsx else: nand_u64v128_fallback

template `nand`*(a, b: u64v128): u64v128 = 
  when defined(amd64) or defined(i386): x86_nand_u64v128(a, b)
  elif defined(arm64): arm_nand_u64v128(a, b)
  elif defined(loongarch64): la_nand_u64v128(a, b)

# ========================
# nor / f32r128 / value
# ========================

func nor_f32r128_fallback(a, b: f32r128): f32r128 =
  var output: f32r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] or pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] or pB[i])
  return output

func nor_f32r128_sse(a, b: f32r128): f32r128 =
  let allOnes = mm_set1_epi32(-1)
  let orRes = mm_or_ps(cast[sse.M128](a), cast[sse.M128](b))
  return cast[f32r128](mm_xor_ps(orRes, cast[sse.M128](allOnes)))

let x86_nor_f32r128: proc (a, b: f32r128): f32r128 = 
  if sseExists(): nor_f32r128_sse 
  else: nor_f32r128_fallback 

func nor_f32r128_neon(a, b: f32r128): f32r128 =
  let orRes = vorrq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b))
  return cast[f32r128](vmvnq_u32(orRes))

let arm_nor_f32r128: proc (a, b: f32r128): f32r128 = if neonExists(): nor_f32r128_neon else: nor_f32r128_fallback

func nor_f32r128_lsx(a, b: f32r128): f32r128 =
  return cast[f32r128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_nor_f32r128: proc (a, b: f32r128): f32r128 = if lsxExists(): nor_f32r128_lsx else: nor_f32r128_fallback

template `nor`*(a, b: f32r128): f32r128 = 
  when defined(amd64) or defined(i386): x86_nor_f32r128(a, b)
  elif defined(arm64): arm_nor_f32r128(a, b)
  elif defined(loongarch64): la_nor_f32r128(a, b)

# ========================
# nor / f64r128 / value
# ========================

func nor_f64r128_fallback(a, b: f64r128): f64r128 =
  var output: f64r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] or pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] or pB[i])
  return output

func nor_f64r128_sse(a, b: f64r128): f64r128 =
  let allOnes = mm_set1_epi32(-1)
  let orRes = mm_or_pd(cast[sse2.M128d](a), cast[sse2.M128d](b))
  return cast[f64r128](mm_xor_pd(orRes, cast[sse2.M128d](allOnes)))

let x86_nor_f64r128: proc (a, b: f64r128): f64r128 = 
  if sseExists(): nor_f64r128_sse 
  else: nor_f64r128_fallback 

func nor_f64r128_neon(a, b: f64r128): f64r128 =
  let orRes = vorrq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b))
  return cast[f64r128](vmvnq_u32(orRes))

let arm_nor_f64r128: proc (a, b: f64r128): f64r128 = if neonExists(): nor_f64r128_neon else: nor_f64r128_fallback

func nor_f64r128_lsx(a, b: f64r128): f64r128 =
  return cast[f64r128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_nor_f64r128: proc (a, b: f64r128): f64r128 = if lsxExists(): nor_f64r128_lsx else: nor_f64r128_fallback

template `nor`*(a, b: f64r128): f64r128 = 
  when defined(amd64) or defined(i386): x86_nor_f64r128(a, b)
  elif defined(arm64): arm_nor_f64r128(a, b)
  elif defined(loongarch64): la_nor_f64r128(a, b)

# ========================
# nor / i8r128 / value
# ========================

func nor_i8r128_fallback(a, b: i8r128): i8r128 = 
  var output: i8r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] or pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] or pB[i])
  return output

func nor_i8r128_sse(a, b: i8r128): i8r128 = 
  let allOnes = mm_set1_epi32(-1)
  let orRes = mm_or_si128(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[i8r128](mm_xor_si128(orRes, cast[sse2.M128i](allOnes)))

let x86_nor_i8r128: proc (a, b: i8r128): i8r128 = 
  if sseExists(): nor_i8r128_sse 
  else: nor_i8r128_fallback 

func nor_i8r128_neon(a, b: i8r128): i8r128 =
  let orRes = vorrq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b))
  return cast[i8r128](vmvnq_u8(orRes))

let arm_nor_i8r128: proc (a, b: i8r128): i8r128 = if neonExists(): nor_i8r128_neon else: nor_i8r128_fallback

func nor_i8r128_lsx(a, b: i8r128): i8r128 =
  return cast[i8r128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_nor_i8r128: proc (a, b: i8r128): i8r128 = if lsxExists(): nor_i8r128_lsx else: nor_i8r128_fallback

template `nor`*(a, b: i8r128): i8r128 = 
  when defined(amd64) or defined(i386): x86_nor_i8r128(a, b)
  elif defined(arm64): arm_nor_i8r128(a, b)
  elif defined(loongarch64): la_nor_i8r128(a, b)

# ========================
# nor / i16r128 / value
# ========================

func nor_i16r128_fallback(a, b: i16r128): i16r128 = 
  var output: i16r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] or pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] or pB[i])
  return output

func nor_i16r128_sse(a, b: i16r128): i16r128 = 
  let allOnes = mm_set1_epi32(-1)
  let orRes = mm_or_si128(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[i16r128](mm_xor_si128(orRes, cast[sse2.M128i](allOnes)))

let x86_nor_i16r128: proc (a, b: i16r128): i16r128 = 
  if sseExists(): nor_i16r128_sse 
  else: nor_i16r128_fallback 

func nor_i16r128_neon(a, b: i16r128): i16r128 =
  let orRes = vorrq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b))
  return cast[i16r128](vmvnq_u16(orRes))

let arm_nor_i16r128: proc (a, b: i16r128): i16r128 = if neonExists(): nor_i16r128_neon else: nor_i16r128_fallback

func nor_i16r128_lsx(a, b: i16r128): i16r128 =
  return cast[i16r128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_nor_i16r128: proc (a, b: i16r128): i16r128 = if lsxExists(): nor_i16r128_lsx else: nor_i16r128_fallback

template `nor`*(a, b: i16r128): i16r128 = 
  when defined(amd64) or defined(i386): x86_nor_i16r128(a, b)
  elif defined(arm64): arm_nor_i16r128(a, b)
  elif defined(loongarch64): la_nor_i16r128(a, b)

# ========================
# nor / i32r128 / value
# ========================

func nor_i32r128_fallback(a, b: i32r128): i32r128 = 
  var output: i32r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] or pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] or pB[i])
  return output

func nor_i32r128_sse(a, b: i32r128): i32r128 = 
  let allOnes = mm_set1_epi32(-1)
  let orRes = mm_or_si128(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[i32r128](mm_xor_si128(orRes, cast[sse2.M128i](allOnes)))

let x86_nor_i32r128: proc (a, b: i32r128): i32r128 = 
  if sseExists(): nor_i32r128_sse 
  else: nor_i32r128_fallback 

func nor_i32r128_neon(a, b: i32r128): i32r128 =
  let orRes = vorrq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b))
  return cast[i32r128](vmvnq_u32(orRes))

let arm_nor_i32r128: proc (a, b: i32r128): i32r128 = if neonExists(): nor_i32r128_neon else: nor_i32r128_fallback

func nor_i32r128_lsx(a, b: i32r128): i32r128 =
  return cast[i32r128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_nor_i32r128: proc (a, b: i32r128): i32r128 = if lsxExists(): nor_i32r128_lsx else: nor_i32r128_fallback

template `nor`*(a, b: i32r128): i32r128 = 
  when defined(amd64) or defined(i386): x86_nor_i32r128(a, b)
  elif defined(arm64): arm_nor_i32r128(a, b)
  elif defined(loongarch64): la_nor_i32r128(a, b)

# ========================
# nor / i64r128 / value
# ========================

func nor_i64r128_fallback(a, b: i64r128): i64r128 = 
  var output: i64r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] or pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] or pB[i])
  return output

func nor_i64r128_sse(a, b: i64r128): i64r128 = 
  let allOnes = mm_set1_epi32(-1)
  let orRes = mm_or_si128(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[i64r128](mm_xor_si128(orRes, cast[sse2.M128i](allOnes)))

let x86_nor_i64r128: proc (a, b: i64r128): i64r128 = 
  if sseExists(): nor_i64r128_sse 
  else: nor_i64r128_fallback 

func nor_i64r128_neon(a, b: i64r128): i64r128 =
  let orRes = vorrq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b))
  return cast[i64r128](vmvnq_u32(cast[neon.Uint32x4](orRes)))

let arm_nor_i64r128: proc (a, b: i64r128): i64r128 = if neonExists(): nor_i64r128_neon else: nor_i64r128_fallback

func nor_i64r128_lsx(a, b: i64r128): i64r128 =
  return cast[i64r128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_nor_i64r128: proc (a, b: i64r128): i64r128 = if lsxExists(): nor_i64r128_lsx else: nor_i64r128_fallback

template `nor`*(a, b: i64r128): i64r128 = 
  when defined(amd64) or defined(i386): x86_nor_i64r128(a, b)
  elif defined(arm64): arm_nor_i64r128(a, b)
  elif defined(loongarch64): la_nor_i64r128(a, b)

# ========================
# nor / u8r128 / value
# ========================

func nor_u8r128_fallback(a, b: u8r128): u8r128 = 
  var output: u8r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] or pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] or pB[i])
  return output

func nor_u8r128_sse(a, b: u8r128): u8r128 = 
  let allOnes = mm_set1_epi32(-1)
  let orRes = mm_or_si128(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[u8r128](mm_xor_si128(orRes, cast[sse2.M128i](allOnes)))

let x86_nor_u8r128: proc (a, b: u8r128): u8r128 = 
  if sseExists(): nor_u8r128_sse 
  else: nor_u8r128_fallback 

func nor_u8r128_neon(a, b: u8r128): u8r128 =
  let orRes = vorrq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b))
  return cast[u8r128](vmvnq_u8(orRes))

let arm_nor_u8r128: proc (a, b: u8r128): u8r128 = if neonExists(): nor_u8r128_neon else: nor_u8r128_fallback

func nor_u8r128_lsx(a, b: u8r128): u8r128 =
  return cast[u8r128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_nor_u8r128: proc (a, b: u8r128): u8r128 = if lsxExists(): nor_u8r128_lsx else: nor_u8r128_fallback

template `nor`*(a, b: u8r128): u8r128 = 
  when defined(amd64) or defined(i386): x86_nor_u8r128(a, b)
  elif defined(arm64): arm_nor_u8r128(a, b)
  elif defined(loongarch64): la_nor_u8r128(a, b)

# ========================
# nor / u16r128 / value
# ========================

func nor_u16r128_fallback(a, b: u16r128): u16r128 = 
  var output: u16r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] or pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] or pB[i])
  return output

func nor_u16r128_sse(a, b: u16r128): u16r128 = 
  let allOnes = mm_set1_epi32(-1)
  let orRes = mm_or_si128(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[u16r128](mm_xor_si128(orRes, cast[sse2.M128i](allOnes)))

let x86_nor_u16r128: proc (a, b: u16r128): u16r128 = 
  if sseExists(): nor_u16r128_sse 
  else: nor_u16r128_fallback 

func nor_u16r128_neon(a, b: u16r128): u16r128 =
  let orRes = vorrq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b))
  return cast[u16r128](vmvnq_u16(orRes))

let arm_nor_u16r128: proc (a, b: u16r128): u16r128 = if neonExists(): nor_u16r128_neon else: nor_u16r128_fallback

func nor_u16r128_lsx(a, b: u16r128): u16r128 =
  return cast[u16r128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_nor_u16r128: proc (a, b: u16r128): u16r128 = if lsxExists(): nor_u16r128_lsx else: nor_u16r128_fallback

template `nor`*(a, b: u16r128): u16r128 = 
  when defined(amd64) or defined(i386): x86_nor_u16r128(a, b)
  elif defined(arm64): arm_nor_u16r128(a, b)
  elif defined(loongarch64): la_nor_u16r128(a, b)

# ========================
# nor / u32r128 / value
# ========================

func nor_u32r128_fallback(a, b: u32r128): u32r128 = 
  var output: u32r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] or pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] or pB[i])
  return output

func nor_u32r128_sse(a, b: u32r128): u32r128 = 
  let allOnes = mm_set1_epi32(-1)
  let orRes = mm_or_si128(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[u32r128](mm_xor_si128(orRes, cast[sse2.M128i](allOnes)))

let x86_nor_u32r128: proc (a, b: u32r128): u32r128 = 
  if sseExists(): nor_u32r128_sse 
  else: nor_u32r128_fallback 

func nor_u32r128_neon(a, b: u32r128): u32r128 =
  let orRes = vorrq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b))
  return cast[u32r128](vmvnq_u32(orRes))

let arm_nor_u32r128: proc (a, b: u32r128): u32r128 = if neonExists(): nor_u32r128_neon else: nor_u32r128_fallback

func nor_u32r128_lsx(a, b: u32r128): u32r128 =
  return cast[u32r128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_nor_u32r128: proc (a, b: u32r128): u32r128 = if lsxExists(): nor_u32r128_lsx else: nor_u32r128_fallback

template `nor`*(a, b: u32r128): u32r128 = 
  when defined(amd64) or defined(i386): x86_nor_u32r128(a, b)
  elif defined(arm64): arm_nor_u32r128(a, b)
  elif defined(loongarch64): la_nor_u32r128(a, b)

# ========================
# nor / u64r128 / value
# ========================

func nor_u64r128_fallback(a, b: u64r128): u64r128 = 
  var output: u64r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] or pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] or pB[i])
  return output

func nor_u64r128_sse(a, b: u64r128): u64r128 = 
  let allOnes = mm_set1_epi32(-1)
  let orRes = mm_or_si128(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[u64r128](mm_xor_si128(orRes, cast[sse2.M128i](allOnes)))

let x86_nor_u64r128: proc (a, b: u64r128): u64r128 = 
  if sseExists(): nor_u64r128_sse 
  else: nor_u64r128_fallback 

func nor_u64r128_neon(a, b: u64r128): u64r128 =
  let orRes = vorrq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b))
  return cast[u64r128](vmvnq_u32(cast[neon.Uint32x4](orRes)))

let arm_nor_u64r128: proc (a, b: u64r128): u64r128 = if neonExists(): nor_u64r128_neon else: nor_u64r128_fallback

func nor_u64r128_lsx(a, b: u64r128): u64r128 =
  return cast[u64r128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_nor_u64r128: proc (a, b: u64r128): u64r128 = if lsxExists(): nor_u64r128_lsx else: nor_u64r128_fallback

template `nor`*(a, b: u64r128): u64r128 = 
  when defined(amd64) or defined(i386): x86_nor_u64r128(a, b)
  elif defined(arm64): arm_nor_u64r128(a, b)
  elif defined(loongarch64): la_nor_u64r128(a, b)

# ========================
# nor / f32v128 / value
# ========================

func nor_f32v128_fallback(a, b: f32v128): f32v128 =
  var output: f32v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] or pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] or pB[i])
  return output

func nor_f32v128_sse(a, b: f32v128): f32v128 =
  let allOnes = mm_set1_epi32(-1)
  let orRes = mm_or_ps(cast[sse.M128](a), cast[sse.M128](b))
  return cast[f32v128](mm_xor_ps(orRes, cast[sse.M128](allOnes)))

let x86_nor_f32v128: proc (a, b: f32v128): f32v128 = 
  if sseExists(): nor_f32v128_sse 
  else: nor_f32v128_fallback 

func nor_f32v128_neon(a, b: f32v128): f32v128 =
  let orRes = vorrq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b))
  return cast[f32v128](vmvnq_u32(orRes))

let arm_nor_f32v128: proc (a, b: f32v128): f32v128 = if neonExists(): nor_f32v128_neon else: nor_f32v128_fallback

func nor_f32v128_lsx(a, b: f32v128): f32v128 =
  return cast[f32v128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_nor_f32v128: proc (a, b: f32v128): f32v128 = if lsxExists(): nor_f32v128_lsx else: nor_f32v128_fallback

template `nor`*(a, b: f32v128): f32v128 = 
  when defined(amd64) or defined(i386): x86_nor_f32v128(a, b)
  elif defined(arm64): arm_nor_f32v128(a, b)
  elif defined(loongarch64): la_nor_f32v128(a, b)

# ========================
# nor / f64v128 / value
# ========================

func nor_f64v128_fallback(a, b: f64v128): f64v128 =
  var output: f64v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] or pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] or pB[i])
  return output

func nor_f64v128_sse(a, b: f64v128): f64v128 =
  let allOnes = mm_set1_epi32(-1)
  let orRes = mm_or_pd(cast[sse2.M128d](a), cast[sse2.M128d](b))
  return cast[f64v128](mm_xor_pd(orRes, cast[sse2.M128d](allOnes)))

let x86_nor_f64v128: proc (a, b: f64v128): f64v128 = 
  if sseExists(): nor_f64v128_sse 
  else: nor_f64v128_fallback 

func nor_f64v128_neon(a, b: f64v128): f64v128 =
  let orRes = vorrq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b))
  return cast[f64v128](vmvnq_u32(orRes))

let arm_nor_f64v128: proc (a, b: f64v128): f64v128 = if neonExists(): nor_f64v128_neon else: nor_f64v128_fallback

func nor_f64v128_lsx(a, b: f64v128): f64v128 =
  return cast[f64v128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_nor_f64v128: proc (a, b: f64v128): f64v128 = if lsxExists(): nor_f64v128_lsx else: nor_f64v128_fallback

template `nor`*(a, b: f64v128): f64v128 = 
  when defined(amd64) or defined(i386): x86_nor_f64v128(a, b)
  elif defined(arm64): arm_nor_f64v128(a, b)
  elif defined(loongarch64): la_nor_f64v128(a, b)

# ========================
# nor / i8v128 / value
# ========================

func nor_i8v128_fallback(a, b: i8v128): i8v128 = 
  var output: i8v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] or pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] or pB[i])
  return output

func nor_i8v128_sse(a, b: i8v128): i8v128 = 
  let allOnes = mm_set1_epi32(-1)
  let orRes = mm_or_si128(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[i8v128](mm_xor_si128(orRes, cast[sse2.M128i](allOnes)))

let x86_nor_i8v128: proc (a, b: i8v128): i8v128 = 
  if sseExists(): nor_i8v128_sse 
  else: nor_i8v128_fallback 

func nor_i8v128_neon(a, b: i8v128): i8v128 =
  let orRes = vorrq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b))
  return cast[i8v128](vmvnq_u8(orRes))

let arm_nor_i8v128: proc (a, b: i8v128): i8v128 = if neonExists(): nor_i8v128_neon else: nor_i8v128_fallback

func nor_i8v128_lsx(a, b: i8v128): i8v128 =
  return cast[i8v128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_nor_i8v128: proc (a, b: i8v128): i8v128 = if lsxExists(): nor_i8v128_lsx else: nor_i8v128_fallback

template `nor`*(a, b: i8v128): i8v128 = 
  when defined(amd64) or defined(i386): x86_nor_i8v128(a, b)
  elif defined(arm64): arm_nor_i8v128(a, b)
  elif defined(loongarch64): la_nor_i8v128(a, b)

# ========================
# nor / i16v128 / value
# ========================

func nor_i16v128_fallback(a, b: i16v128): i16v128 = 
  var output: i16v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] or pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] or pB[i])
  return output

func nor_i16v128_sse(a, b: i16v128): i16v128 = 
  let allOnes = mm_set1_epi32(-1)
  let orRes = mm_or_si128(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[i16v128](mm_xor_si128(orRes, cast[sse2.M128i](allOnes)))

let x86_nor_i16v128: proc (a, b: i16v128): i16v128 = 
  if sseExists(): nor_i16v128_sse 
  else: nor_i16v128_fallback 

func nor_i16v128_neon(a, b: i16v128): i16v128 =
  let orRes = vorrq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b))
  return cast[i16v128](vmvnq_u16(orRes))

let arm_nor_i16v128: proc (a, b: i16v128): i16v128 = if neonExists(): nor_i16v128_neon else: nor_i16v128_fallback

func nor_i16v128_lsx(a, b: i16v128): i16v128 =
  return cast[i16v128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_nor_i16v128: proc (a, b: i16v128): i16v128 = if lsxExists(): nor_i16v128_lsx else: nor_i16v128_fallback

template `nor`*(a, b: i16v128): i16v128 = 
  when defined(amd64) or defined(i386): x86_nor_i16v128(a, b)
  elif defined(arm64): arm_nor_i16v128(a, b)
  elif defined(loongarch64): la_nor_i16v128(a, b)

# ========================
# nor / i32v128 / value
# ========================

func nor_i32v128_fallback(a, b: i32v128): i32v128 = 
  var output: i32v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] or pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] or pB[i])
  return output

func nor_i32v128_sse(a, b: i32v128): i32v128 = 
  let allOnes = mm_set1_epi32(-1)
  let orRes = mm_or_si128(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[i32v128](mm_xor_si128(orRes, cast[sse2.M128i](allOnes)))

let x86_nor_i32v128: proc (a, b: i32v128): i32v128 = 
  if sseExists(): nor_i32v128_sse 
  else: nor_i32v128_fallback 

func nor_i32v128_neon(a, b: i32v128): i32v128 =
  let orRes = vorrq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b))
  return cast[i32v128](vmvnq_u32(orRes))

let arm_nor_i32v128: proc (a, b: i32v128): i32v128 = if neonExists(): nor_i32v128_neon else: nor_i32v128_fallback

func nor_i32v128_lsx(a, b: i32v128): i32v128 =
  return cast[i32v128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_nor_i32v128: proc (a, b: i32v128): i32v128 = if lsxExists(): nor_i32v128_lsx else: nor_i32v128_fallback

template `nor`*(a, b: i32v128): i32v128 = 
  when defined(amd64) or defined(i386): x86_nor_i32v128(a, b)
  elif defined(arm64): arm_nor_i32v128(a, b)
  elif defined(loongarch64): la_nor_i32v128(a, b)

# ========================
# nor / i64v128 / value
# ========================

func nor_i64v128_fallback(a, b: i64v128): i64v128 = 
  var output: i64v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] or pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] or pB[i])
  return output

func nor_i64v128_sse(a, b: i64v128): i64v128 = 
  let allOnes = mm_set1_epi32(-1)
  let orRes = mm_or_si128(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[i64v128](mm_xor_si128(orRes, cast[sse2.M128i](allOnes)))

let x86_nor_i64v128: proc (a, b: i64v128): i64v128 = 
  if sseExists(): nor_i64v128_sse 
  else: nor_i64v128_fallback 

func nor_i64v128_neon(a, b: i64v128): i64v128 =
  let orRes = vorrq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b))
  return cast[i64v128](vmvnq_u32(cast[neon.Uint32x4](orRes)))

let arm_nor_i64v128: proc (a, b: i64v128): i64v128 = if neonExists(): nor_i64v128_neon else: nor_i64v128_fallback

func nor_i64v128_lsx(a, b: i64v128): i64v128 =
  return cast[i64v128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_nor_i64v128: proc (a, b: i64v128): i64v128 = if lsxExists(): nor_i64v128_lsx else: nor_i64v128_fallback

template `nor`*(a, b: i64v128): i64v128 = 
  when defined(amd64) or defined(i386): x86_nor_i64v128(a, b)
  elif defined(arm64): arm_nor_i64v128(a, b)
  elif defined(loongarch64): la_nor_i64v128(a, b)

# ========================
# nor / u8v128 / value
# ========================

func nor_u8v128_fallback(a, b: u8v128): u8v128 = 
  var output: u8v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] or pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] or pB[i])
  return output

func nor_u8v128_sse(a, b: u8v128): u8v128 = 
  let allOnes = mm_set1_epi32(-1)
  let orRes = mm_or_si128(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[u8v128](mm_xor_si128(orRes, cast[sse2.M128i](allOnes)))

let x86_nor_u8v128: proc (a, b: u8v128): u8v128 = 
  if sseExists(): nor_u8v128_sse 
  else: nor_u8v128_fallback 

func nor_u8v128_neon(a, b: u8v128): u8v128 =
  let orRes = vorrq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b))
  return cast[u8v128](vmvnq_u8(orRes))

let arm_nor_u8v128: proc (a, b: u8v128): u8v128 = if neonExists(): nor_u8v128_neon else: nor_u8v128_fallback

func nor_u8v128_lsx(a, b: u8v128): u8v128 =
  return cast[u8v128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_nor_u8v128: proc (a, b: u8v128): u8v128 = if lsxExists(): nor_u8v128_lsx else: nor_u8v128_fallback

template `nor`*(a, b: u8v128): u8v128 = 
  when defined(amd64) or defined(i386): x86_nor_u8v128(a, b)
  elif defined(arm64): arm_nor_u8v128(a, b)
  elif defined(loongarch64): la_nor_u8v128(a, b)

# ========================
# nor / u16v128 / value
# ========================

func nor_u16v128_fallback(a, b: u16v128): u16v128 = 
  var output: u16v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] or pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] or pB[i])
  return output

func nor_u16v128_sse(a, b: u16v128): u16v128 = 
  let allOnes = mm_set1_epi32(-1)
  let orRes = mm_or_si128(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[u16v128](mm_xor_si128(orRes, cast[sse2.M128i](allOnes)))

let x86_nor_u16v128: proc (a, b: u16v128): u16v128 = 
  if sseExists(): nor_u16v128_sse 
  else: nor_u16v128_fallback 

func nor_u16v128_neon(a, b: u16v128): u16v128 =
  let orRes = vorrq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b))
  return cast[u16v128](vmvnq_u16(orRes))

let arm_nor_u16v128: proc (a, b: u16v128): u16v128 = if neonExists(): nor_u16v128_neon else: nor_u16v128_fallback

func nor_u16v128_lsx(a, b: u16v128): u16v128 =
  return cast[u16v128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_nor_u16v128: proc (a, b: u16v128): u16v128 = if lsxExists(): nor_u16v128_lsx else: nor_u16v128_fallback

template `nor`*(a, b: u16v128): u16v128 = 
  when defined(amd64) or defined(i386): x86_nor_u16v128(a, b)
  elif defined(arm64): arm_nor_u16v128(a, b)
  elif defined(loongarch64): la_nor_u16v128(a, b)

# ========================
# nor / u32v128 / value
# ========================

func nor_u32v128_fallback(a, b: u32v128): u32v128 = 
  var output: u32v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] or pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] or pB[i])
  return output

func nor_u32v128_sse(a, b: u32v128): u32v128 = 
  let allOnes = mm_set1_epi32(-1)
  let orRes = mm_or_si128(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[u32v128](mm_xor_si128(orRes, cast[sse2.M128i](allOnes)))

let x86_nor_u32v128: proc (a, b: u32v128): u32v128 = 
  if sseExists(): nor_u32v128_sse 
  else: nor_u32v128_fallback 

func nor_u32v128_neon(a, b: u32v128): u32v128 =
  let orRes = vorrq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b))
  return cast[u32v128](vmvnq_u32(orRes))

let arm_nor_u32v128: proc (a, b: u32v128): u32v128 = if neonExists(): nor_u32v128_neon else: nor_u32v128_fallback

func nor_u32v128_lsx(a, b: u32v128): u32v128 =
  return cast[u32v128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_nor_u32v128: proc (a, b: u32v128): u32v128 = if lsxExists(): nor_u32v128_lsx else: nor_u32v128_fallback

template `nor`*(a, b: u32v128): u32v128 = 
  when defined(amd64) or defined(i386): x86_nor_u32v128(a, b)
  elif defined(arm64): arm_nor_u32v128(a, b)
  elif defined(loongarch64): la_nor_u32v128(a, b)

# ========================
# nor / u64v128 / value
# ========================

func nor_u64v128_fallback(a, b: u64v128): u64v128 = 
  var output: u64v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1):
      pOut[i] = not (pA[i] or pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3):
      pOut[i] = not (pA[i] or pB[i])
  return output

func nor_u64v128_sse(a, b: u64v128): u64v128 = 
  let allOnes = mm_set1_epi32(-1)
  let orRes = mm_or_si128(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[u64v128](mm_xor_si128(orRes, cast[sse2.M128i](allOnes)))

let x86_nor_u64v128: proc (a, b: u64v128): u64v128 = 
  if sseExists(): nor_u64v128_sse 
  else: nor_u64v128_fallback 

func nor_u64v128_neon(a, b: u64v128): u64v128 =
  let orRes = vorrq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b))
  return cast[u64v128](vmvnq_u32(cast[neon.Uint32x4](orRes)))

let arm_nor_u64v128: proc (a, b: u64v128): u64v128 = if neonExists(): nor_u64v128_neon else: nor_u64v128_fallback

func nor_u64v128_lsx(a, b: u64v128): u64v128 =
  return cast[u64v128](lsx_vnor_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_nor_u64v128: proc (a, b: u64v128): u64v128 = if lsxExists(): nor_u64v128_lsx else: nor_u64v128_fallback

template `nor`*(a, b: u64v128): u64v128 = 
  when defined(amd64) or defined(i386): x86_nor_u64v128(a, b)
  elif defined(arm64): arm_nor_u64v128(a, b)
  elif defined(loongarch64): la_nor_u64v128(a, b)

# ========================
# andnot / f32r128 / value
# ========================

func andnot_f32r128_fallback(a, b: f32r128): f32r128 =
  var output: f32r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] and (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] and (not pB[i])
  return output

func andnot_f32r128_sse(a, b: f32r128): f32r128 =
  return cast[f32r128](mm_andnot_ps(cast[sse.M128](b), cast[sse.M128](a)))

let x86_andnot_f32r128: proc(a, b: f32r128): f32r128 = if sseExists(): andnot_f32r128_sse else: andnot_f32r128_fallback

func andnot_f32r128_neon(a, b: f32r128): f32r128 =
  return cast[f32r128](vbicq_s32(cast[neon.Int32x4](a), cast[neon.Int32x4](b)))

let arm_andnot_f32r128: proc(a, b: f32r128): f32r128 = if neonExists(): andnot_f32r128_neon else: andnot_f32r128_fallback

func andnot_f32r128_lsx(a, b: f32r128): f32r128 =
  return cast[f32r128](lsx_vandn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_andnot_f32r128: proc(a, b: f32r128): f32r128 = if lsxExists(): andnot_f32r128_lsx else: andnot_f32r128_fallback

template `andnot`*(a, b: f32r128): f32r128 =
  when defined(amd64) or defined(i386): x86_andnot_f32r128(a, b)
  elif defined(arm64): arm_andnot_f32r128(a, b)
  elif defined(loongarch64): la_andnot_f32r128(a, b)

# ========================
# andnot / f64r128 / value
# ========================

func andnot_f64r128_fallback(a, b: f64r128): f64r128 =
  var output: f64r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] and (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] and (not pB[i])
  return output

func andnot_f64r128_sse(a, b: f64r128): f64r128 =
  return cast[f64r128](mm_andnot_pd(cast[sse2.M128d](b), cast[sse2.M128d](a)))

let x86_andnot_f64r128: proc(a, b: f64r128): f64r128 = if sseExists(): andnot_f64r128_sse else: andnot_f64r128_fallback

func andnot_f64r128_neon(a, b: f64r128): f64r128 =
  return cast[f64r128](vbicq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b)))

let arm_andnot_f64r128: proc(a, b: f64r128): f64r128 = if neonExists(): andnot_f64r128_neon else: andnot_f64r128_fallback

func andnot_f64r128_lsx(a, b: f64r128): f64r128 =
  return cast[f64r128](lsx_vandn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_andnot_f64r128: proc(a, b: f64r128): f64r128 = if lsxExists(): andnot_f64r128_lsx else: andnot_f64r128_fallback

template `andnot`*(a, b: f64r128): f64r128 =
  when defined(amd64) or defined(i386): x86_andnot_f64r128(a, b)
  elif defined(arm64): arm_andnot_f64r128(a, b)
  elif defined(loongarch64): la_andnot_f64r128(a, b)

# ========================
# andnot / i8r128 / value
# ========================

func andnot_i8r128_fallback(a, b: i8r128): i8r128 =
  var output: i8r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] and (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] and (not pB[i])
  return output

func andnot_i8r128_sse(a, b: i8r128): i8r128 =
  return cast[i8r128](mm_andnot_si128(cast[sse2.M128i](b), cast[sse2.M128i](a)))

let x86_andnot_i8r128: proc(a, b: i8r128): i8r128 = if sseExists(): andnot_i8r128_sse else: andnot_i8r128_fallback

func andnot_i8r128_neon(a, b: i8r128): i8r128 =
  return cast[i8r128](vbicq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b)))

let arm_andnot_i8r128: proc(a, b: i8r128): i8r128 = if neonExists(): andnot_i8r128_neon else: andnot_i8r128_fallback

func andnot_i8r128_lsx(a, b: i8r128): i8r128 =
  return cast[i8r128](lsx_vandn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_andnot_i8r128: proc(a, b: i8r128): i8r128 = if lsxExists(): andnot_i8r128_lsx else: andnot_i8r128_fallback

template `andnot`*(a, b: i8r128): i8r128 =
  when defined(amd64) or defined(i386): x86_andnot_i8r128(a, b)
  elif defined(arm64): arm_andnot_i8r128(a, b)
  elif defined(loongarch64): la_andnot_i8r128(a, b)

# ========================
# andnot / i16r128 / value
# ========================

func andnot_i16r128_fallback(a, b: i16r128): i16r128 =
  var output: i16r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] and (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] and (not pB[i])
  return output

func andnot_i16r128_sse(a, b: i16r128): i16r128 =
  return cast[i16r128](mm_andnot_si128(cast[sse2.M128i](b), cast[sse2.M128i](a)))

let x86_andnot_i16r128: proc(a, b: i16r128): i16r128 = if sseExists(): andnot_i16r128_sse else: andnot_i16r128_fallback

func andnot_i16r128_neon(a, b: i16r128): i16r128 =
  return cast[i16r128](vbicq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b)))

let arm_andnot_i16r128: proc(a, b: i16r128): i16r128 = if neonExists(): andnot_i16r128_neon else: andnot_i16r128_fallback

func andnot_i16r128_lsx(a, b: i16r128): i16r128 =
  return cast[i16r128](lsx_vandn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_andnot_i16r128: proc(a, b: i16r128): i16r128 = if lsxExists(): andnot_i16r128_lsx else: andnot_i16r128_fallback

template `andnot`*(a, b: i16r128): i16r128 =
  when defined(amd64) or defined(i386): x86_andnot_i16r128(a, b)
  elif defined(arm64): arm_andnot_i16r128(a, b)
  elif defined(loongarch64): la_andnot_i16r128(a, b)

# ========================
# andnot / i32r128 / value
# ========================

func andnot_i32r128_fallback(a, b: i32r128): i32r128 =
  var output: i32r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] and (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] and (not pB[i])
  return output

func andnot_i32r128_sse(a, b: i32r128): i32r128 =
  return cast[i32r128](mm_andnot_si128(cast[sse2.M128i](b), cast[sse2.M128i](a)))

let x86_andnot_i32r128: proc(a, b: i32r128): i32r128 = if sseExists(): andnot_i32r128_sse else: andnot_i32r128_fallback

func andnot_i32r128_neon(a, b: i32r128): i32r128 =
  return cast[i32r128](vbicq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b)))

let arm_andnot_i32r128: proc(a, b: i32r128): i32r128 = if neonExists(): andnot_i32r128_neon else: andnot_i32r128_fallback

func andnot_i32r128_lsx(a, b: i32r128): i32r128 =
  return cast[i32r128](lsx_vandn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_andnot_i32r128: proc(a, b: i32r128): i32r128 = if lsxExists(): andnot_i32r128_lsx else: andnot_i32r128_fallback

template `andnot`*(a, b: i32r128): i32r128 =
  when defined(amd64) or defined(i386): x86_andnot_i32r128(a, b)
  elif defined(arm64): arm_andnot_i32r128(a, b)
  elif defined(loongarch64): la_andnot_i32r128(a, b)

# ========================
# andnot / i64r128 / value
# ========================

func andnot_i64r128_fallback(a, b: i64r128): i64r128 =
  var output: i64r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] and (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] and (not pB[i])
  return output

func andnot_i64r128_sse(a, b: i64r128): i64r128 =
  return cast[i64r128](mm_andnot_si128(cast[sse2.M128i](b), cast[sse2.M128i](a)))

let x86_andnot_i64r128: proc(a, b: i64r128): i64r128 = if sseExists(): andnot_i64r128_sse else: andnot_i64r128_fallback

func andnot_i64r128_neon(a, b: i64r128): i64r128 =
  return cast[i64r128](vbicq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b)))

let arm_andnot_i64r128: proc(a, b: i64r128): i64r128 = if neonExists(): andnot_i64r128_neon else: andnot_i64r128_fallback

func andnot_i64r128_lsx(a, b: i64r128): i64r128 =
  return cast[i64r128](lsx_vandn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_andnot_i64r128: proc(a, b: i64r128): i64r128 = if lsxExists(): andnot_i64r128_lsx else: andnot_i64r128_fallback

template `andnot`*(a, b: i64r128): i64r128 =
  when defined(amd64) or defined(i386): x86_andnot_i64r128(a, b)
  elif defined(arm64): arm_andnot_i64r128(a, b)
  elif defined(loongarch64): la_andnot_i64r128(a, b)

# ========================
# andnot / u8r128 / value
# ========================

func andnot_u8r128_fallback(a, b: u8r128): u8r128 =
  var output: u8r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] and (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] and (not pB[i])
  return output

func andnot_u8r128_sse(a, b: u8r128): u8r128 =
  return cast[u8r128](mm_andnot_si128(cast[sse2.M128i](b), cast[sse2.M128i](a)))

let x86_andnot_u8r128: proc(a, b: u8r128): u8r128 = if sseExists(): andnot_u8r128_sse else: andnot_u8r128_fallback

func wins_andnot_u8r128_neon(a, b: u8r128): u8r128 =
  return cast[u8r128](vbicq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b)))

let arm_andnot_u8r128: proc(a, b: u8r128): u8r128 = if neonExists(): wins_andnot_u8r128_neon else: andnot_u8r128_fallback

func andnot_u8r128_lsx(a, b: u8r128): u8r128 =
  return cast[u8r128](lsx_vandn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_andnot_u8r128: proc(a, b: u8r128): u8r128 = if lsxExists(): andnot_u8r128_lsx else: andnot_u8r128_fallback

template `andnot`*(a, b: u8r128): u8r128 =
  when defined(amd64) or defined(i386): x86_andnot_u8r128(a, b)
  elif defined(arm64): arm_andnot_u8r128(a, b)
  elif defined(loongarch64): la_andnot_u8r128(a, b)

# ========================
# andnot / u16r128 / value
# ========================

func andnot_u16r128_fallback(a, b: u16r128): u16r128 =
  var output: u16r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] and (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] and (not pB[i])
  return output

func andnot_u16r128_sse(a, b: u16r128): u16r128 =
  return cast[u16r128](mm_andnot_si128(cast[sse2.M128i](b), cast[sse2.M128i](a)))

let x86_andnot_u16r128: proc(a, b: u16r128): u16r128 = if sseExists(): andnot_u16r128_sse else: andnot_u16r128_fallback

func andnot_u16r128_neon(a, b: u16r128): u16r128 =
  return cast[u16r128](vbicq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b)))

let arm_andnot_u16r128: proc(a, b: u16r128): u16r128 = if neonExists(): andnot_u16r128_neon else: andnot_u16r128_fallback

func andnot_u16r128_lsx(a, b: u16r128): u16r128 =
  return cast[u16r128](lsx_vandn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_andnot_u16r128: proc(a, b: u16r128): u16r128 = if lsxExists(): andnot_u16r128_lsx else: andnot_u16r128_fallback

template `andnot`*(a, b: u16r128): u16r128 =
  when defined(amd64) or defined(i386): x86_andnot_u16r128(a, b)
  elif defined(arm64): arm_andnot_u16r128(a, b)
  elif defined(loongarch64): la_andnot_u16r128(a, b)

# ========================
# andnot / u32r128 / value
# ========================

func andnot_u32r128_fallback(a, b: u32r128): u32r128 =
  var output: u32r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] and (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] and (not pB[i])
  return output

func andnot_u32r128_sse(a, b: u32r128): u32r128 =
  return cast[u32r128](mm_andnot_si128(cast[sse2.M128i](b), cast[sse2.M128i](a)))

let x86_andnot_u32r128: proc(a, b: u32r128): u32r128 = if sseExists(): andnot_u32r128_sse else: andnot_u32r128_fallback

func andnot_u32r128_neon(a, b: u32r128): u32r128 =
  return cast[u32r128](vbicq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b)))

let arm_andnot_u32r128: proc(a, b: u32r128): u32r128 = if neonExists(): andnot_u32r128_neon else: andnot_u32r128_fallback

func andnot_u32r128_lsx(a, b: u32r128): u32r128 =
  return cast[u32r128](lsx_vandn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_andnot_u32r128: proc(a, b: u32r128): u32r128 = if lsxExists(): andnot_u32r128_lsx else: andnot_u32r128_fallback

template `andnot`*(a, b: u32r128): u32r128 =
  when defined(amd64) or defined(i386): x86_andnot_u32r128(a, b)
  elif defined(arm64): arm_andnot_u32r128(a, b)
  elif defined(loongarch64): la_andnot_u32r128(a, b)

# ========================
# andnot / u64r128 / value
# ========================

func andnot_u64r128_fallback(a, b: u64r128): u64r128 =
  var output: u64r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] and (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] and (not pB[i])
  return output

func andnot_u64r128_sse(a, b: u64r128): u64r128 =
  return cast[u64r128](mm_andnot_si128(cast[sse2.M128i](b), cast[sse2.M128i](a)))

let x86_andnot_u64r128: proc(a, b: u64r128): u64r128 = if sseExists(): andnot_u64r128_sse else: andnot_u64r128_fallback

func andnot_u64r128_neon(a, b: u64r128): u64r128 =
  return cast[u64r128](vbicq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b)))

let arm_andnot_u64r128: proc(a, b: u64r128): u64r128 = if neonExists(): andnot_u64r128_neon else: andnot_u64r128_fallback

func andnot_u64r128_lsx(a, b: u64r128): u64r128 =
  return cast[u64r128](lsx_vandn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_andnot_u64r128: proc(a, b: u64r128): u64r128 = if lsxExists(): andnot_u64r128_lsx else: andnot_u64r128_fallback

template `andnot`*(a, b: u64r128): u64r128 =
  when defined(amd64) or defined(i386): x86_andnot_u64r128(a, b)
  elif defined(arm64): arm_andnot_u64r128(a, b)
  elif defined(loongarch64): la_andnot_u64r128(a, b)

# ========================
# andnot / f32v128 / value
# ========================

func andnot_f32v128_fallback(a, b: f32v128): f32v128 =
  var output: f32v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] and (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] and (not pB[i])
  return output

func andnot_f32v128_sse(a, b: f32v128): f32v128 =
  return cast[f32v128](mm_andnot_ps(cast[sse.M128](b), cast[sse.M128](a)))

let x86_andnot_f32v128: proc(a, b: f32v128): f32v128 = if sseExists(): andnot_f32v128_sse else: andnot_f32v128_fallback

func andnot_f32v128_neon(a, b: f32v128): f32v128 =
  return cast[f32v128](vbicq_s32(cast[neon.Int32x4](a), cast[neon.Int32x4](b)))

let arm_andnot_f32v128: proc(a, b: f32v128): f32v128 = if neonExists(): andnot_f32v128_neon else: andnot_f32v128_fallback

func andnot_f32v128_lsx(a, b: f32v128): f32v128 =
  return cast[f32v128](lsx_vandn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_andnot_f32v128: proc(a, b: f32v128): f32v128 = if lsxExists(): andnot_f32v128_lsx else: andnot_f32v128_fallback

template `andnot`*(a, b: f32v128): f32v128 =
  when defined(amd64) or defined(i386): x86_andnot_f32v128(a, b)
  elif defined(arm64): arm_andnot_f32v128(a, b)
  elif defined(loongarch64): la_andnot_f32v128(a, b)

# ========================
# andnot / f64v128 / value
# ========================

func andnot_f64v128_fallback(a, b: f64v128): f64v128 =
  var output: f64v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] and (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] and (not pB[i])
  return output

func andnot_f64v128_sse(a, b: f64v128): f64v128 =
  return cast[f64v128](mm_andnot_pd(cast[sse2.M128d](b), cast[sse2.M128d](a)))

let x86_andnot_f64v128: proc(a, b: f64v128): f64v128 = if sseExists(): andnot_f64v128_sse else: andnot_f64v128_fallback

func andnot_f64v128_neon(a, b: f64v128): f64v128 =
  return cast[f64v128](vbicq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b)))

let arm_andnot_f64v128: proc(a, b: f64v128): f64v128 = if neonExists(): andnot_f64v128_neon else: andnot_f64v128_fallback

func andnot_f64v128_lsx(a, b: f64v128): f64v128 =
  return cast[f64v128](lsx_vandn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_andnot_f64v128: proc(a, b: f64v128): f64v128 = if lsxExists(): andnot_f64v128_lsx else: andnot_f64v128_fallback

template `andnot`*(a, b: f64v128): f64v128 =
  when defined(amd64) or defined(i386): x86_andnot_f64v128(a, b)
  elif defined(arm64): arm_andnot_f64v128(a, b)
  elif defined(loongarch64): la_andnot_f64v128(a, b)

# ========================
# andnot / i8v128 / value
# ========================

func andnot_i8v128_fallback(a, b: i8v128): i8v128 =
  var output: i8v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] and (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] and (not pB[i])
  return output

func andnot_i8v128_sse(a, b: i8v128): i8v128 =
  return cast[i8v128](mm_andnot_si128(cast[sse2.M128i](b), cast[sse2.M128i](a)))

let x86_andnot_i8v128: proc(a, b: i8v128): i8v128 = if sseExists(): andnot_i8v128_sse else: andnot_i8v128_fallback

func andnot_i8v128_neon(a, b: i8v128): i8v128 =
  return cast[i8v128](vbicq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b)))

let arm_andnot_i8v128: proc(a, b: i8v128): i8v128 = if neonExists(): andnot_i8v128_neon else: andnot_i8v128_fallback

func andnot_i8v128_lsx(a, b: i8v128): i8v128 =
  return cast[i8v128](lsx_vandn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_andnot_i8v128: proc(a, b: i8v128): i8v128 = if lsxExists(): andnot_i8v128_lsx else: andnot_i8v128_fallback

template `andnot`*(a, b: i8v128): i8v128 =
  when defined(amd64) or defined(i386): x86_andnot_i8v128(a, b)
  elif defined(arm64): arm_andnot_i8v128(a, b)
  elif defined(loongarch64): la_andnot_i8v128(a, b)

# ========================
# andnot / i16v128 / value
# ========================

func andnot_i16v128_fallback(a, b: i16v128): i16v128 =
  var output: i16v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] and (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] and (not pB[i])
  return output

func andnot_i16v128_sse(a, b: i16v128): i16v128 =
  return cast[i16v128](mm_andnot_si128(cast[sse2.M128i](b), cast[sse2.M128i](a)))

let x86_andnot_i16v128: proc(a, b: i16v128): i16v128 = if sseExists(): andnot_i16v128_sse else: andnot_i16v128_fallback

func andnot_i16v128_neon(a, b: i16v128): i16v128 =
  return cast[i16v128](vbicq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b)))

let arm_andnot_i16v128: proc(a, b: i16v128): i16v128 = if neonExists(): andnot_i16v128_neon else: andnot_i16v128_fallback

func andnot_i16v128_lsx(a, b: i16v128): i16v128 =
  return cast[i16v128](lsx_vandn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_andnot_i16v128: proc(a, b: i16v128): i16v128 = if lsxExists(): andnot_i16v128_lsx else: andnot_i16v128_fallback

template `andnot`*(a, b: i16v128): i16v128 =
  when defined(amd64) or defined(i386): x86_andnot_i16v128(a, b)
  elif defined(arm64): arm_andnot_i16v128(a, b)
  elif defined(loongarch64): la_andnot_i16v128(a, b)

# ========================
# andnot / i32v128 / value
# ========================

func andnot_i32v128_fallback(a, b: i32v128): i32v128 =
  var output: i32v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] and (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] and (not pB[i])
  return output

func andnot_i32v128_sse(a, b: i32v128): i32v128 =
  return cast[i32v128](mm_andnot_si128(cast[sse2.M128i](b), cast[sse2.M128i](a)))

let x86_andnot_i32v128: proc(a, b: i32v128): i32v128 = if sseExists(): andnot_i32v128_sse else: andnot_i32v128_fallback

func andnot_i32v128_neon(a, b: i32v128): i32v128 =
  return cast[i32v128](vbicq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b)))

let arm_andnot_i32v128: proc(a, b: i32v128): i32v128 = if neonExists(): andnot_i32v128_neon else: andnot_i32v128_fallback

func andnot_i32v128_lsx(a, b: i32v128): i32v128 =
  return cast[i32v128](lsx_vandn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_andnot_i32v128: proc(a, b: i32v128): i32v128 = if lsxExists(): andnot_i32v128_lsx else: andnot_i32v128_fallback

template `andnot`*(a, b: i32v128): i32v128 =
  when defined(amd64) or defined(i386): x86_andnot_i32v128(a, b)
  elif defined(arm64): arm_andnot_i32v128(a, b)
  elif defined(loongarch64): la_andnot_i32v128(a, b)

# ========================
# andnot / i64v128 / value
# ========================

func andnot_i64v128_fallback(a, b: i64v128): i64v128 =
  var output: i64v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] and (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] and (not pB[i])
  return output

func andnot_i64v128_sse(a, b: i64v128): i64v128 =
  return cast[i64v128](mm_andnot_si128(cast[sse2.M128i](b), cast[sse2.M128i](a)))

let x86_andnot_i64v128: proc(a, b: i64v128): i64v128 = if sseExists(): andnot_i64v128_sse else: andnot_i64v128_fallback

func andnot_i64v128_neon(a, b: i64v128): i64v128 =
  return cast[i64v128](vbicq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b)))

let arm_andnot_i64v128: proc(a, b: i64v128): i64v128 = if neonExists(): andnot_i64v128_neon else: andnot_i64v128_fallback

func andnot_i64v128_lsx(a, b: i64v128): i64v128 =
  return cast[i64v128](lsx_vandn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_andnot_i64v128: proc(a, b: i64v128): i64v128 = if lsxExists(): andnot_i64v128_lsx else: andnot_i64v128_fallback

template `andnot`*(a, b: i64v128): i64v128 =
  when defined(amd64) or defined(i386): x86_andnot_i64v128(a, b)
  elif defined(arm64): arm_andnot_i64v128(a, b)
  elif defined(loongarch64): la_andnot_i64v128(a, b)

# ========================
# andnot / u8v128 / value
# ========================

func andnot_u8v128_fallback(a, b: u8v128): u8v128 =
  var output: u8v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] and (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] and (not pB[i])
  return output

func andnot_u8v128_sse(a, b: u8v128): u8v128 =
  return cast[u8v128](mm_andnot_si128(cast[sse2.M128i](b), cast[sse2.M128i](a)))

let x86_andnot_u8v128: proc(a, b: u8v128): u8v128 = if sseExists(): andnot_u8v128_sse else: andnot_u8v128_fallback

func wins_andnot_u8v128_neon(a, b: u8v128): u8v128 =
  return cast[u8v128](vbicq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b)))

let arm_andnot_u8v128: proc(a, b: u8v128): u8v128 = if neonExists(): wins_andnot_u8v128_neon else: andnot_u8v128_fallback

func andnot_u8v128_lsx(a, b: u8v128): u8v128 =
  return cast[u8v128](lsx_vandn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_andnot_u8v128: proc(a, b: u8v128): u8v128 = if lsxExists(): andnot_u8v128_lsx else: andnot_u8v128_fallback

template `andnot`*(a, b: u8v128): u8v128 =
  when defined(amd64) or defined(i386): x86_andnot_u8v128(a, b)
  elif defined(arm64): arm_andnot_u8v128(a, b)
  elif defined(loongarch64): la_andnot_u8v128(a, b)

# ========================
# andnot / u16v128 / value
# ========================

func andnot_u16v128_fallback(a, b: u16v128): u16v128 =
  var output: u16v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] and (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] and (not pB[i])
  return output

func andnot_u16v128_sse(a, b: u16v128): u16v128 =
  return cast[u16v128](mm_andnot_si128(cast[sse2.M128i](b), cast[sse2.M128i](a)))

let x86_andnot_u16v128: proc(a, b: u16v128): u16v128 = if sseExists(): andnot_u16v128_sse else: andnot_u16v128_fallback

func andnot_u16v128_neon(a, b: u16v128): u16v128 =
  return cast[u16v128](vbicq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b)))

let arm_andnot_u16v128: proc(a, b: u16v128): u16v128 = if neonExists(): andnot_u16v128_neon else: andnot_u16v128_fallback

func andnot_u16v128_lsx(a, b: u16v128): u16v128 =
  return cast[u16v128](lsx_vandn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_andnot_u16v128: proc(a, b: u16v128): u16v128 = if lsxExists(): andnot_u16v128_lsx else: andnot_u16v128_fallback

template `andnot`*(a, b: u16v128): u16v128 =
  when defined(amd64) or defined(i386): x86_andnot_u16v128(a, b)
  elif defined(arm64): arm_andnot_u16v128(a, b)
  elif defined(loongarch64): la_andnot_u16v128(a, b)

# ========================
# andnot / u32v128 / value
# ========================

func andnot_u32v128_fallback(a, b: u32v128): u32v128 =
  var output: u32v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] and (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] and (not pB[i])
  return output

func andnot_u32v128_sse(a, b: u32v128): u32v128 =
  return cast[u32v128](mm_andnot_si128(cast[sse2.M128i](b), cast[sse2.M128i](a)))

let x86_andnot_u32v128: proc(a, b: u32v128): u32v128 = if sseExists(): andnot_u32v128_sse else: andnot_u32v128_fallback

func andnot_u32v128_neon(a, b: u32v128): u32v128 =
  return cast[u32v128](vbicq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b)))

let arm_andnot_u32v128: proc(a, b: u32v128): u32v128 = if neonExists(): andnot_u32v128_neon else: andnot_u32v128_fallback

func andnot_u32v128_lsx(a, b: u32v128): u32v128 =
  return cast[u32v128](lsx_vandn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_andnot_u32v128: proc(a, b: u32v128): u32v128 = if lsxExists(): andnot_u32v128_lsx else: andnot_u32v128_fallback

template `andnot`*(a, b: u32v128): u32v128 =
  when defined(amd64) or defined(i386): x86_andnot_u32v128(a, b)
  elif defined(arm64): arm_andnot_u32v128(a, b)
  elif defined(loongarch64): la_andnot_u32v128(a, b)

# ========================
# andnot / u64v128 / value
# ========================

func andnot_u64v128_fallback(a, b: u64v128): u64v128 =
  var output: u64v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] and (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] and (not pB[i])
  return output

func andnot_u64v128_sse(a, b: u64v128): u64v128 =
  return cast[u64v128](mm_andnot_si128(cast[sse2.M128i](b), cast[sse2.M128i](a)))

let x86_andnot_u64v128: proc(a, b: u64v128): u64v128 = if sseExists(): andnot_u64v128_sse else: andnot_u64v128_fallback

func andnot_u64v128_neon(a, b: u64v128): u64v128 =
  return cast[u64v128](vbicq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b)))

let arm_andnot_u64v128: proc(a, b: u64v128): u64v128 = if neonExists(): andnot_u64v128_neon else: andnot_u64v128_fallback

func andnot_u64v128_lsx(a, b: u64v128): u64v128 =
  return cast[u64v128](lsx_vandn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_andnot_u64v128: proc(a, b: u64v128): u64v128 = if lsxExists(): andnot_u64v128_lsx else: andnot_u64v128_fallback

template `andnot`*(a, b: u64v128): u64v128 =
  when defined(amd64) or defined(i386): x86_andnot_u64v128(a, b)
  elif defined(arm64): arm_andnot_u64v128(a, b)
  elif defined(loongarch64): la_andnot_u64v128(a, b)

# ========================
# ornot / f32r128 / value
# ========================

func ornot_f32r128_fallback(a, b: f32r128): f32r128 =
  var output: f32r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] or (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] or (not pB[i])
  return output

func ornot_f32r128_sse(a, b: f32r128): f32r128 =
  let allOnes = mm_set1_epi32(-1)
  let notB = mm_xor_ps(cast[sse.M128](b), cast[sse.M128](allOnes))
  return cast[f32r128](mm_or_ps(cast[sse.M128](a), notB))

let x86_ornot_f32r128: proc(a, b: f32r128): f32r128 = if sseExists(): ornot_f32r128_sse else: ornot_f32r128_fallback

func ornot_f32r128_neon(a, b: f32r128): f32r128 =
  return cast[f32r128](vornq_s32(cast[neon.Int32x4](a), cast[neon.Int32x4](b)))

let arm_ornot_f32r128: proc(a, b: f32r128): f32r128 = if neonExists(): ornot_f32r128_neon else: ornot_f32r128_fallback

func ornot_f32r128_lsx(a, b: f32r128): f32r128 =
  return cast[f32r128](lsx_vorn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ornot_f32r128: proc(a, b: f32r128): f32r128 = if lsxExists(): ornot_f32r128_lsx else: ornot_f32r128_fallback

template `ornot`*(a, b: f32r128): f32r128 =
  when defined(amd64) or defined(i386): x86_ornot_f32r128(a, b)
  elif defined(arm64): arm_ornot_f32r128(a, b)
  elif defined(loongarch64): la_ornot_f32r128(a, b)

# ========================
# ornot / f64r128 / value
# ========================

func ornot_f64r128_fallback(a, b: f64r128): f64r128 =
  var output: f64r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] or (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] or (not pB[i])
  return output

func ornot_f64r128_sse(a, b: f64r128): f64r128 =
  let allOnes = mm_set1_epi32(-1)
  let notB = mm_xor_pd(cast[sse2.M128d](b), cast[sse2.M128d](allOnes))
  return cast[f64r128](mm_or_pd(cast[sse2.M128d](a), notB))

let x86_ornot_f64r128: proc(a, b: f64r128): f64r128 = if sseExists(): ornot_f64r128_sse else: ornot_f64r128_fallback

func ornot_f64r128_neon(a, b: f64r128): f64r128 =
  return cast[f64r128](vornq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b)))

let arm_ornot_f64r128: proc(a, b: f64r128): f64r128 = if neonExists(): ornot_f64r128_neon else: ornot_f64r128_fallback

func ornot_f64r128_lsx(a, b: f64r128): f64r128 =
  return cast[f64r128](lsx_vorn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ornot_f64r128: proc(a, b: f64r128): f64r128 = if lsxExists(): ornot_f64r128_lsx else: ornot_f64r128_fallback

template `ornot`*(a, b: f64r128): f64r128 =
  when defined(amd64) or defined(i386): x86_ornot_f64r128(a, b)
  elif defined(arm64): arm_ornot_f64r128(a, b)
  elif defined(loongarch64): la_ornot_f64r128(a, b)

# ========================
# ornot / i8r128 / value
# ========================

func ornot_i8r128_fallback(a, b: i8r128): i8r128 =
  var output: i8r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] or (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] or (not pB[i])
  return output

func ornot_i8r128_sse(a, b: i8r128): i8r128 =
  let allOnes = mm_set1_epi32(-1)
  let notB = mm_xor_si128(cast[sse2.M128i](b), cast[sse2.M128i](allOnes))
  return cast[i8r128](mm_or_si128(cast[sse2.M128i](a), notB))

let x86_ornot_i8r128: proc(a, b: i8r128): i8r128 = if sseExists(): ornot_i8r128_sse else: ornot_i8r128_fallback

func ornot_i8r128_neon(a, b: i8r128): i8r128 =
  return cast[i8r128](vornq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b)))

let arm_ornot_i8r128: proc(a, b: i8r128): i8r128 = if neonExists(): ornot_i8r128_neon else: ornot_i8r128_fallback

func ornot_i8r128_lsx(a, b: i8r128): i8r128 =
  return cast[i8r128](lsx_vorn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ornot_i8r128: proc(a, b: i8r128): i8r128 = if lsxExists(): ornot_i8r128_lsx else: ornot_i8r128_fallback

template `ornot`*(a, b: i8r128): i8r128 =
  when defined(amd64) or defined(i386): x86_ornot_i8r128(a, b)
  elif defined(arm64): arm_ornot_i8r128(a, b)
  elif defined(loongarch64): la_ornot_i8r128(a, b)

# ========================
# ornot / i16r128 / value
# ========================

func ornot_i16r128_fallback(a, b: i16r128): i16r128 =
  var output: i16r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] or (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] or (not pB[i])
  return output

func ornot_i16r128_sse(a, b: i16r128): i16r128 =
  let allOnes = mm_set1_epi32(-1)
  let notB = mm_xor_si128(cast[sse2.M128i](b), cast[sse2.M128i](allOnes))
  return cast[i16r128](mm_or_si128(cast[sse2.M128i](a), notB))

let x86_ornot_i16r128: proc(a, b: i16r128): i16r128 = if sseExists(): ornot_i16r128_sse else: ornot_i16r128_fallback

func ornot_i16r128_neon(a, b: i16r128): i16r128 =
  return cast[i16r128](vornq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b)))

let arm_ornot_i16r128: proc(a, b: i16r128): i16r128 = if neonExists(): ornot_i16r128_neon else: ornot_i16r128_fallback

func ornot_i16r128_lsx(a, b: i16r128): i16r128 =
  return cast[i16r128](lsx_vorn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ornot_i16r128: proc(a, b: i16r128): i16r128 = if lsxExists(): ornot_i16r128_lsx else: ornot_i16r128_fallback

template `ornot`*(a, b: i16r128): i16r128 =
  when defined(amd64) or defined(i386): x86_ornot_i16r128(a, b)
  elif defined(arm64): arm_ornot_i16r128(a, b)
  elif defined(loongarch64): la_ornot_i16r128(a, b)

# ========================
# ornot / i32r128 / value
# ========================

func ornot_i32r128_fallback(a, b: i32r128): i32r128 =
  var output: i32r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] or (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] or (not pB[i])
  return output

func ornot_i32r128_sse(a, b: i32r128): i32r128 =
  let allOnes = mm_set1_epi32(-1)
  let notB = mm_xor_si128(cast[sse2.M128i](b), cast[sse2.M128i](allOnes))
  return cast[i32r128](mm_or_si128(cast[sse2.M128i](a), notB))

let x86_ornot_i32r128: proc(a, b: i32r128): i32r128 = if sseExists(): ornot_i32r128_sse else: ornot_i32r128_fallback

func ornot_i32r128_neon(a, b: i32r128): i32r128 =
  return cast[i32r128](vornq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b)))

let arm_ornot_i32r128: proc(a, b: i32r128): i32r128 = if neonExists(): ornot_i32r128_neon else: ornot_i32r128_fallback

func ornot_i32r128_lsx(a, b: i32r128): i32r128 =
  return cast[i32r128](lsx_vorn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ornot_i32r128: proc(a, b: i32r128): i32r128 = if lsxExists(): ornot_i32r128_lsx else: ornot_i32r128_fallback

template `ornot`*(a, b: i32r128): i32r128 =
  when defined(amd64) or defined(i386): x86_ornot_i32r128(a, b)
  elif defined(arm64): arm_ornot_i32r128(a, b)
  elif defined(loongarch64): la_ornot_i32r128(a, b)

# ========================
# ornot / i64r128 / value
# ========================

func ornot_i64r128_fallback(a, b: i64r128): i64r128 =
  var output: i64r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] or (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] or (not pB[i])
  return output

func ornot_i64r128_sse(a, b: i64r128): i64r128 =
  let allOnes = mm_set1_epi32(-1)
  let notB = mm_xor_si128(cast[sse2.M128i](b), cast[sse2.M128i](allOnes))
  return cast[i64r128](mm_or_si128(cast[sse2.M128i](a), notB))

let x86_ornot_i64r128: proc(a, b: i64r128): i64r128 = if sseExists(): ornot_i64r128_sse else: ornot_i64r128_fallback

func ornot_i64r128_neon(a, b: i64r128): i64r128 =
  return cast[i64r128](vornq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b)))

let arm_ornot_i64r128: proc(a, b: i64r128): i64r128 = if neonExists(): ornot_i64r128_neon else: ornot_i64r128_fallback

func ornot_i64r128_lsx(a, b: i64r128): i64r128 =
  return cast[i64r128](lsx_vorn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ornot_i64r128: proc(a, b: i64r128): i64r128 = if lsxExists(): ornot_i64r128_lsx else: ornot_i64r128_fallback

template `ornot`*(a, b: i64r128): i64r128 =
  when defined(amd64) or defined(i386): x86_ornot_i64r128(a, b)
  elif defined(arm64): arm_ornot_i64r128(a, b)
  elif defined(loongarch64): la_ornot_i64r128(a, b)

# ========================
# ornot / u8r128 / value
# ========================

func ornot_u8r128_fallback(a, b: u8r128): u8r128 =
  var output: u8r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] or (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] or (not pB[i])
  return output

func ornot_u8r128_sse(a, b: u8r128): u8r128 =
  let allOnes = mm_set1_epi32(-1)
  let notB = mm_xor_si128(cast[sse2.M128i](b), cast[sse2.M128i](allOnes))
  return cast[u8r128](mm_or_si128(cast[sse2.M128i](a), notB))

let x86_ornot_u8r128: proc(a, b: u8r128): u8r128 = if sseExists(): ornot_u8r128_sse else: ornot_u8r128_fallback

func ornot_u8r128_neon(a, b: u8r128): u8r128 =
  return cast[u8r128](vornq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b)))

let arm_ornot_u8r128: proc(a, b: u8r128): u8r128 = if neonExists(): ornot_u8r128_neon else: ornot_u8r128_fallback

func ornot_u8r128_lsx(a, b: u8r128): u8r128 =
  return cast[u8r128](lsx_vorn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ornot_u8r128: proc(a, b: u8r128): u8r128 = if lsxExists(): ornot_u8r128_lsx else: ornot_u8r128_fallback

template `ornot`*(a, b: u8r128): u8r128 =
  when defined(amd64) or defined(i386): x86_ornot_u8r128(a, b)
  elif defined(arm64): arm_ornot_u8r128(a, b)
  elif defined(loongarch64): la_ornot_u8r128(a, b)

# ========================
# ornot / u16r128 / value
# ========================

func ornot_u16r128_fallback(a, b: u16r128): u16r128 =
  var output: u16r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] or (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] or (not pB[i])
  return output

func ornot_u16r128_sse(a, b: u16r128): u16r128 =
  let allOnes = mm_set1_epi32(-1)
  let notB = mm_xor_si128(cast[sse2.M128i](b), cast[sse2.M128i](allOnes))
  return cast[u16r128](mm_or_si128(cast[sse2.M128i](a), notB))

let x86_ornot_u16r128: proc(a, b: u16r128): u16r128 = if sseExists(): ornot_u16r128_sse else: ornot_u16r128_fallback

func ornot_u16r128_neon(a, b: u16r128): u16r128 =
  return cast[u16r128](vornq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b)))

let arm_ornot_u16r128: proc(a, b: u16r128): u16r128 = if neonExists(): ornot_u16r128_neon else: ornot_u16r128_fallback

func ornot_u16r128_lsx(a, b: u16r128): u16r128 =
  return cast[u16r128](lsx_vorn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ornot_u16r128: proc(a, b: u16r128): u16r128 = if lsxExists(): ornot_u16r128_lsx else: ornot_u16r128_fallback

template `ornot`*(a, b: u16r128): u16r128 =
  when defined(amd64) or defined(i386): x86_ornot_u16r128(a, b)
  elif defined(arm64): arm_ornot_u16r128(a, b)
  elif defined(loongarch64): la_ornot_u16r128(a, b)

# ========================
# ornot / u32r128 / value
# ========================

func ornot_u32r128_fallback(a, b: u32r128): u32r128 =
  var output: u32r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] or (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] or (not pB[i])
  return output

func ornot_u32r128_sse(a, b: u32r128): u32r128 =
  let allOnes = mm_set1_epi32(-1)
  let notB = mm_xor_si128(cast[sse2.M128i](b), cast[sse2.M128i](allOnes))
  return cast[u32r128](mm_or_si128(cast[sse2.M128i](a), notB))

let x86_ornot_u32r128: proc(a, b: u32r128): u32r128 = if sseExists(): ornot_u32r128_sse else: ornot_u32r128_fallback

func ornot_u32r128_neon(a, b: u32r128): u32r128 =
  return cast[u32r128](vornq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b)))

let arm_ornot_u32r128: proc(a, b: u32r128): u32r128 = if neonExists(): ornot_u32r128_neon else: ornot_u32r128_fallback

func ornot_u32r128_lsx(a, b: u32r128): u32r128 =
  return cast[u32r128](lsx_vorn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ornot_u32r128: proc(a, b: u32r128): u32r128 = if lsxExists(): ornot_u32r128_lsx else: ornot_u32r128_fallback

template `ornot`*(a, b: u32r128): u32r128 =
  when defined(amd64) or defined(i386): x86_ornot_u32r128(a, b)
  elif defined(arm64): arm_ornot_u32r128(a, b)
  elif defined(loongarch64): la_ornot_u32r128(a, b)

# ========================
# ornot / u64r128 / value
# ========================

func ornot_u64r128_fallback(a, b: u64r128): u64r128 =
  var output: u64r128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] or (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] or (not pB[i])
  return output

func ornot_u64r128_sse(a, b: u64r128): u64r128 =
  let allOnes = mm_set1_epi32(-1)
  let notB = mm_xor_si128(cast[sse2.M128i](b), cast[sse2.M128i](allOnes))
  return cast[u64r128](mm_or_si128(cast[sse2.M128i](a), notB))

let x86_ornot_u64r128: proc(a, b: u64r128): u64r128 = if sseExists(): ornot_u64r128_sse else: ornot_u64r128_fallback

func ornot_u64r128_neon(a, b: u64r128): u64r128 =
  return cast[u64r128](vornq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b)))

let arm_ornot_u64r128: proc(a, b: u64r128): u64r128 = if neonExists(): ornot_u64r128_neon else: ornot_u64r128_fallback

func ornot_u64r128_lsx(a, b: u64r128): u64r128 =
  return cast[u64r128](lsx_vorn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ornot_u64r128: proc(a, b: u64r128): u64r128 = if lsxExists(): ornot_u64r128_lsx else: ornot_u64r128_fallback

template `ornot`*(a, b: u64r128): u64r128 =
  when defined(amd64) or defined(i386): x86_ornot_u64r128(a, b)
  elif defined(arm64): arm_ornot_u64r128(a, b)
  elif defined(loongarch64): la_ornot_u64r128(a, b)

# ========================
# ornot / f32v128 / value
# ========================

func ornot_f32v128_fallback(a, b: f32v128): f32v128 =
  var output: f32v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] or (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] or (not pB[i])
  return output

func ornot_f32v128_sse(a, b: f32v128): f32v128 =
  let allOnes = mm_set1_epi32(-1)
  let notB = mm_xor_ps(cast[sse.M128](b), cast[sse.M128](allOnes))
  return cast[f32v128](mm_or_ps(cast[sse.M128](a), notB))

let x86_ornot_f32v128: proc(a, b: f32v128): f32v128 = if sseExists(): ornot_f32v128_sse else: ornot_f32v128_fallback

func ornot_f32v128_neon(a, b: f32v128): f32v128 =
  return cast[f32v128](vornq_s32(cast[neon.Int32x4](a), cast[neon.Int32x4](b)))

let arm_ornot_f32v128: proc(a, b: f32v128): f32v128 = if neonExists(): ornot_f32v128_neon else: ornot_f32v128_fallback

func ornot_f32v128_lsx(a, b: f32v128): f32v128 =
  return cast[f32v128](lsx_vorn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ornot_f32v128: proc(a, b: f32v128): f32v128 = if lsxExists(): ornot_f32v128_lsx else: ornot_f32v128_fallback

template `ornot`*(a, b: f32v128): f32v128 =
  when defined(amd64) or defined(i386): x86_ornot_f32v128(a, b)
  elif defined(arm64): arm_ornot_f32v128(a, b)
  elif defined(loongarch64): la_ornot_f32v128(a, b)

# ========================
# ornot / f64v128 / value
# ========================

func ornot_f64v128_fallback(a, b: f64v128): f64v128 =
  var output: f64v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] or (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] or (not pB[i])
  return output

func ornot_f64v128_sse(a, b: f64v128): f64v128 =
  let allOnes = mm_set1_epi32(-1)
  let notB = mm_xor_pd(cast[sse2.M128d](b), cast[sse2.M128d](allOnes))
  return cast[f64v128](mm_or_pd(cast[sse2.M128d](a), notB))

let x86_ornot_f64v128: proc(a, b: f64v128): f64v128 = if sseExists(): ornot_f64v128_sse else: ornot_f64v128_fallback

func ornot_f64v128_neon(a, b: f64v128): f64v128 =
  return cast[f64v128](vornq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b)))

let arm_ornot_f64v128: proc(a, b: f64v128): f64v128 = if neonExists(): ornot_f64v128_neon else: ornot_f64v128_fallback

func ornot_f64v128_lsx(a, b: f64v128): f64v128 =
  return cast[f64v128](lsx_vorn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ornot_f64v128: proc(a, b: f64v128): f64v128 = if lsxExists(): ornot_f64v128_lsx else: ornot_f64v128_fallback

template `ornot`*(a, b: f64v128): f64v128 =
  when defined(amd64) or defined(i386): x86_ornot_f64v128(a, b)
  elif defined(arm64): arm_ornot_f64v128(a, b)
  elif defined(loongarch64): la_ornot_f64v128(a, b)

# ========================
# ornot / i8v128 / value
# ========================

func ornot_i8v128_fallback(a, b: i8v128): i8v128 =
  var output: i8v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] or (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] or (not pB[i])
  return output

func ornot_i8v128_sse(a, b: i8v128): i8v128 =
  let allOnes = mm_set1_epi32(-1)
  let notB = mm_xor_si128(cast[sse2.M128i](b), cast[sse2.M128i](allOnes))
  return cast[i8v128](mm_or_si128(cast[sse2.M128i](a), notB))

let x86_ornot_i8v128: proc(a, b: i8v128): i8v128 = if sseExists(): ornot_i8v128_sse else: ornot_i8v128_fallback

func ornot_i8v128_neon(a, b: i8v128): i8v128 =
  return cast[i8v128](vornq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b)))

let arm_ornot_i8v128: proc(a, b: i8v128): i8v128 = if neonExists(): ornot_i8v128_neon else: ornot_i8v128_fallback

func ornot_i8v128_lsx(a, b: i8v128): i8v128 =
  return cast[i8v128](lsx_vorn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ornot_i8v128: proc(a, b: i8v128): i8v128 = if lsxExists(): ornot_i8v128_lsx else: ornot_i8v128_fallback

template `ornot`*(a, b: i8v128): i8v128 =
  when defined(amd64) or defined(i386): x86_ornot_i8v128(a, b)
  elif defined(arm64): arm_ornot_i8v128(a, b)
  elif defined(loongarch64): la_ornot_i8v128(a, b)

# ========================
# ornot / i16v128 / value
# ========================

func ornot_i16v128_fallback(a, b: i16v128): i16v128 =
  var output: i16v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] or (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] or (not pB[i])
  return output

func ornot_i16v128_sse(a, b: i16v128): i16v128 =
  let allOnes = mm_set1_epi32(-1)
  let notB = mm_xor_si128(cast[sse2.M128i](b), cast[sse2.M128i](allOnes))
  return cast[i16v128](mm_or_si128(cast[sse2.M128i](a), notB))

let x86_ornot_i16v128: proc(a, b: i16v128): i16v128 = if sseExists(): ornot_i16v128_sse else: ornot_i16v128_fallback

func ornot_i16v128_neon(a, b: i16v128): i16v128 =
  return cast[i16v128](vornq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b)))

let arm_ornot_i16v128: proc(a, b: i16v128): i16v128 = if neonExists(): ornot_i16v128_neon else: ornot_i16v128_fallback

func ornot_i16v128_lsx(a, b: i16v128): i16v128 =
  return cast[i16v128](lsx_vorn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ornot_i16v128: proc(a, b: i16v128): i16v128 = if lsxExists(): ornot_i16v128_lsx else: ornot_i16v128_fallback

template `ornot`*(a, b: i16v128): i16v128 =
  when defined(amd64) or defined(i386): x86_ornot_i16v128(a, b)
  elif defined(arm64): arm_ornot_i16v128(a, b)
  elif defined(loongarch64): la_ornot_i16v128(a, b)

# ========================
# ornot / i32v128 / value
# ========================

func ornot_i32v128_fallback(a, b: i32v128): i32v128 =
  var output: i32v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] or (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] or (not pB[i])
  return output

func ornot_i32v128_sse(a, b: i32v128): i32v128 =
  let allOnes = mm_set1_epi32(-1)
  let notB = mm_xor_si128(cast[sse2.M128i](b), cast[sse2.M128i](allOnes))
  return cast[i32v128](mm_or_si128(cast[sse2.M128i](a), notB))

let x86_ornot_i32v128: proc(a, b: i32v128): i32v128 = if sseExists(): ornot_i32v128_sse else: ornot_i32v128_fallback

func ornot_i32v128_neon(a, b: i32v128): i32v128 =
  return cast[i32v128](vornq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b)))

let arm_ornot_i32v128: proc(a, b: i32v128): i32v128 = if neonExists(): ornot_i32v128_neon else: ornot_i32v128_fallback

func ornot_i32v128_lsx(a, b: i32v128): i32v128 =
  return cast[i32v128](lsx_vorn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ornot_i32v128: proc(a, b: i32v128): i32v128 = if lsxExists(): ornot_i32v128_lsx else: ornot_i32v128_fallback

template `ornot`*(a, b: i32v128): i32v128 =
  when defined(amd64) or defined(i386): x86_ornot_i32v128(a, b)
  elif defined(arm64): arm_ornot_i32v128(a, b)
  elif defined(loongarch64): la_ornot_i32v128(a, b)

# ========================
# ornot / i64v128 / value
# ========================

func ornot_i64v128_fallback(a, b: i64v128): i64v128 =
  var output: i64v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] or (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] or (not pB[i])
  return output

func ornot_i64v128_sse(a, b: i64v128): i64v128 =
  let allOnes = mm_set1_epi32(-1)
  let notB = mm_xor_si128(cast[sse2.M128i](b), cast[sse2.M128i](allOnes))
  return cast[i64v128](mm_or_si128(cast[sse2.M128i](a), notB))

let x86_ornot_i64v128: proc(a, b: i64v128): i64v128 = if sseExists(): ornot_i64v128_sse else: ornot_i64v128_fallback

func ornot_i64v128_neon(a, b: i64v128): i64v128 =
  # NEON 64  ORN       u64   
  return cast[i64v128](vornq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b)))

let arm_ornot_i64v128: proc(a, b: i64v128): i64v128 = if neonExists(): ornot_i64v128_neon else: ornot_i64v128_fallback

func ornot_i64v128_lsx(a, b: i64v128): i64v128 =
  return cast[i64v128](lsx_vorn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ornot_i64v128: proc(a, b: i64v128): i64v128 = if lsxExists(): ornot_i64v128_lsx else: ornot_i64v128_fallback

template `ornot`*(a, b: i64v128): i64v128 =
  when defined(amd64) or defined(i386): x86_ornot_i64v128(a, b)
  elif defined(arm64): arm_ornot_i64v128(a, b)
  elif defined(loongarch64): la_ornot_i64v128(a, b)

# ========================
# ornot / u8v128 / value
# ========================

func ornot_u8v128_fallback(a, b: u8v128): u8v128 =
  var output: u8v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] or (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] or (not pB[i])
  return output

func ornot_u8v128_sse(a, b: u8v128): u8v128 =
  let allOnes = mm_set1_epi32(-1)
  let notB = mm_xor_si128(cast[sse2.M128i](b), cast[sse2.M128i](allOnes))
  return cast[u8v128](mm_or_si128(cast[sse2.M128i](a), notB))

let x86_ornot_u8v128: proc(a, b: u8v128): u8v128 = if sseExists(): ornot_u8v128_sse else: ornot_u8v128_fallback

func ornot_u8v128_neon(a, b: u8v128): u8v128 =
  return cast[u8v128](vornq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b)))

let arm_ornot_u8v128: proc(a, b: u8v128): u8v128 = if neonExists(): ornot_u8v128_neon else: ornot_u8v128_fallback

func ornot_u8v128_lsx(a, b: u8v128): u8v128 =
  return cast[u8v128](lsx_vorn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ornot_u8v128: proc(a, b: u8v128): u8v128 = if lsxExists(): ornot_u8v128_lsx else: ornot_u8v128_fallback

template `ornot`*(a, b: u8v128): u8v128 =
  when defined(amd64) or defined(i386): x86_ornot_u8v128(a, b)
  elif defined(arm64): arm_ornot_u8v128(a, b)
  elif defined(loongarch64): la_ornot_u8v128(a, b)

# ========================
# ornot / u16v128 / value
# ========================

func ornot_u16v128_fallback(a, b: u16v128): u16v128 =
  var output: u16v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] or (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] or (not pB[i])
  return output

func ornot_u16v128_sse(a, b: u16v128): u16v128 =
  let allOnes = mm_set1_epi32(-1)
  let notB = mm_xor_si128(cast[sse2.M128i](b), cast[sse2.M128i](allOnes))
  return cast[u16v128](mm_or_si128(cast[sse2.M128i](a), notB))

let x86_ornot_u16v128: proc(a, b: u16v128): u16v128 = if sseExists(): ornot_u16v128_sse else: ornot_u16v128_fallback

func ornot_u16v128_neon(a, b: u16v128): u16v128 =
  return cast[u16v128](vornq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b)))

let arm_ornot_u16v128: proc(a, b: u16v128): u16v128 = if neonExists(): ornot_u16v128_neon else: ornot_u16v128_fallback

func ornot_u16v128_lsx(a, b: u16v128): u16v128 =
  return cast[u16v128](lsx_vorn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ornot_u16v128: proc(a, b: u16v128): u16v128 = if lsxExists(): ornot_u16v128_lsx else: ornot_u16v128_fallback

template `ornot`*(a, b: u16v128): u16v128 =
  when defined(amd64) or defined(i386): x86_ornot_u16v128(a, b)
  elif defined(arm64): arm_ornot_u16v128(a, b)
  elif defined(loongarch64): la_ornot_u16v128(a, b)

# ========================
# ornot / u32v128 / value
# ========================

func ornot_u32v128_fallback(a, b: u32v128): u32v128 =
  var output: u32v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] or (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] or (not pB[i])
  return output

func ornot_u32v128_sse(a, b: u32v128): u32v128 =
  let allOnes = mm_set1_epi32(-1)
  let notB = mm_xor_si128(cast[sse2.M128i](b), cast[sse2.M128i](allOnes))
  return cast[u32v128](mm_or_si128(cast[sse2.M128i](a), notB))

let x86_ornot_u32v128: proc(a, b: u32v128): u32v128 = if sseExists(): ornot_u32v128_sse else: ornot_u32v128_fallback

func ornot_u32v128_neon(a, b: u32v128): u32v128 =
  return cast[u32v128](vornq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b)))

let arm_ornot_u32v128: proc(a, b: u32v128): u32v128 = if neonExists(): ornot_u32v128_neon else: ornot_u32v128_fallback

func ornot_u32v128_lsx(a, b: u32v128): u32v128 =
  return cast[u32v128](lsx_vorn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ornot_u32v128: proc(a, b: u32v128): u32v128 = if lsxExists(): ornot_u32v128_lsx else: ornot_u32v128_fallback

template `ornot`*(a, b: u32v128): u32v128 =
  when defined(amd64) or defined(i386): x86_ornot_u32v128(a, b)
  elif defined(arm64): arm_ornot_u32v128(a, b)
  elif defined(loongarch64): la_ornot_u32v128(a, b)

# ========================
# ornot / u64v128 / value
# ========================

func ornot_u64v128_fallback(a, b: u64v128): u64v128 =
  var output: u64v128
  when CPUBits == 64:
    let pOut = cast[ptr array[2, uint64]](addr output)
    let pA   = cast[ptr array[2, uint64]](addr a)
    let pB   = cast[ptr array[2, uint64]](addr b)
    unroll(i, 0, 1): pOut[i] = pA[i] or (not pB[i])
  else:
    let pOut = cast[ptr array[4, uint32]](addr output)
    let pA   = cast[ptr array[4, uint32]](addr a)
    let pB   = cast[ptr array[4, uint32]](addr b)
    unroll(i, 0, 3): pOut[i] = pA[i] or (not pB[i])
  return output

func ornot_u64v128_sse(a, b: u64v128): u64v128 =
  let allOnes = mm_set1_epi32(-1)
  let notB = mm_xor_si128(cast[sse2.M128i](b), cast[sse2.M128i](allOnes))
  return cast[u64v128](mm_or_si128(cast[sse2.M128i](a), notB))

let x86_ornot_u64v128: proc(a, b: u64v128): u64v128 = if sseExists(): ornot_u64v128_sse else: ornot_u64v128_fallback

func ornot_u64v128_neon(a, b: u64v128): u64v128 =
  return cast[u64v128](vornq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b)))

let arm_ornot_u64v128: proc(a, b: u64v128): u64v128 = if neonExists(): ornot_u64v128_neon else: ornot_u64v128_fallback

func ornot_u64v128_lsx(a, b: u64v128): u64v128 =
  return cast[u64v128](lsx_vorn_v(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ornot_u64v128: proc(a, b: u64v128): u64v128 = if lsxExists(): ornot_u64v128_lsx else: ornot_u64v128_fallback

template `ornot`*(a, b: u64v128): u64v128 =
  when defined(amd64) or defined(i386): x86_ornot_u64v128(a, b)
  elif defined(arm64): arm_ornot_u64v128(a, b)
  elif defined(loongarch64): la_ornot_u64v128(a, b)

# ========================
# shl / f32r128 / value
# ========================

func shl_f32r128_fallback(a: f32r128, count: int): f32r128 =
  var output: f32r128
  let pOut = cast[ptr array[4, int32]](addr output)
  let pA   = cast[ptr array[4, int32]](addr a)
  unroll(i, 0, 3): pOut[i] = pA[i] shl count
  return output

func shl_f32r128_sse(a: f32r128, count: int): f32r128 =
  return cast[f32r128](mm_slli_epi32(cast[sse2.M128i](a), count.int32))

let x86_shl_f32r128: proc(a: f32r128, count: int): f32r128 = if sseExists(): shl_f32r128_sse else: shl_f32r128_fallback

func shl_f32r128_neon(a: f32r128, count: int): f32r128 =
  return cast[f32r128](vshlq_n_s32(cast[neon.Int32x4](a), count.int32))

let arm_shl_f32r128: proc(a: f32r128, count: int): f32r128 = if neonExists(): shl_f32r128_neon else: shl_f32r128_fallback

func shl_f32r128_lsx(a: f32r128, count: int): f32r128 =
  return cast[f32r128](lsx_vslli_w(cast[lsx.M128i](a), count.int32))

let la_shl_f32r128: proc(a: f32r128, count: int): f32r128 = if lsxExists(): shl_f32r128_lsx else: shl_f32r128_fallback

template `shl`*(a: f32r128, count: int): f32r128 =
  when defined(amd64) or defined(i386): x86_shl_f32r128(a, count)
  elif defined(arm64): arm_shl_f32r128(a, count)
  elif defined(loongarch64): la_shl_f32r128(a, count)

# ========================
# shl / f64r128 / value
# ========================

func shl_f64r128_fallback(a: f64r128, count: int): f64r128 =
  var output: f64r128
  let pOut = cast[ptr array[2, int64]](addr output)
  let pA   = cast[ptr array[2, int64]](addr a)
  unroll(i, 0, 1): pOut[i] = pA[i] shl count
  return output

func shl_f64r128_sse(a: f64r128, count: int): f64r128 =
  return cast[f64r128](mm_slli_epi64(cast[sse2.M128i](a), count.int32))

let x86_shl_f64r128: proc(a: f64r128, count: int): f64r128 = if sseExists(): shl_f64r128_sse else: shl_f64r128_fallback

func shl_f64r128_neon(a: f64r128, count: int): f64r128 =
  return cast[f64r128](vshlq_n_s64(cast[neon.Int64x2](a), count.int32))

let arm_shl_f64r128: proc(a: f64r128, count: int): f64r128 = if neonExists(): shl_f64r128_neon else: shl_f64r128_fallback

func shl_f64r128_lsx(a: f64r128, count: int): f64r128 =
  return cast[f64r128](lsx_vslli_d(cast[lsx.M128i](a), count.int32))

let la_shl_f64r128: proc(a: f64r128, count: int): f64r128 = if lsxExists(): shl_f64r128_lsx else: shl_f64r128_fallback

template `shl`*(a: f64r128, count: int): f64r128 =
  when defined(amd64) or defined(i386): x86_shl_f64r128(a, count)
  elif defined(arm64): arm_shl_f64r128(a, count)
  elif defined(loongarch64): la_shl_f64r128(a, count)

# ========================
# shl / i8r128 / value
# ========================

func shl_i8r128_fallback(a: i8r128, count: int): i8r128 =
  var output: i8r128
  let pOut = cast[ptr array[16, int8]](addr output)
  let pA   = cast[ptr array[16, int8]](addr a)
  unroll(i, 0, 15): pOut[i] = pA[i] shl count
  return output

func shl_i8r128_sse(a: i8r128, count: int): i8r128 =
  let mCount = mm_cvtsi32_si128(count.int32)
  let lows = mm_sll_epi16(cast[sse2.M128i](a), mCount)
  let mask = mm_set1_epi8(cast[int8](0xFF shl count))
  return cast[i8r128](mm_and_si128(lows, mask))

let x86_shl_i8r128: proc(a: i8r128, count: int): i8r128 = if sseExists(): shl_i8r128_sse else: shl_i8r128_fallback

func shl_i8r128_neon(a: i8r128, count: int): i8r128 =
  return cast[i8r128](vshlq_n_s8(cast[neon.Int8x16](a), count.int32))

let arm_shl_i8r128: proc(a: i8r128, count: int): i8r128 = if neonExists(): shl_i8r128_neon else: shl_i8r128_fallback

func shl_i8r128_lsx(a: i8r128, count: int): i8r128 =
  return cast[i8r128](lsx_vslli_b(cast[lsx.M128i](a), count.int32))

let la_shl_i8r128: proc(a: i8r128, count: int): i8r128 = if lsxExists(): shl_i8r128_lsx else: shl_i8r128_fallback

template `shl`*(a: i8r128, count: int): i8r128 =
  when defined(amd64) or defined(i386): x86_shl_i8r128(a, count)
  elif defined(arm64): arm_shl_i8r128(a, count)
  elif defined(loongarch64): la_shl_i8r128(a, count)

# ========================
# shl / i16r128 / value
# ========================

func shl_i16r128_fallback(a: i16r128, count: int): i16r128 =
  var output: i16r128
  let pOut = cast[ptr array[8, int16]](addr output)
  let pA   = cast[ptr array[8, int16]](addr a)
  unroll(i, 0, 7): pOut[i] = pA[i] shl count
  return output

func shl_i16r128_sse(a: i16r128, count: int): i16r128 =
  return cast[i16r128](mm_slli_epi16(cast[sse2.M128i](a), count.int32))

let x86_shl_i16r128: proc(a: i16r128, count: int): i16r128 = if sseExists(): shl_i16r128_sse else: shl_i16r128_fallback

func shl_i16r128_neon(a: i16r128, count: int): i16r128 =
  return cast[i16r128](vshlq_n_s16(cast[neon.Int16x8](a), count.int32))

let arm_shl_i16r128: proc(a: i16r128, count: int): i16r128 = if neonExists(): shl_i16r128_neon else: shl_i16r128_fallback

func shl_i16r128_lsx(a: i16r128, count: int): i16r128 =
  return cast[i16r128](lsx_vslli_h(cast[lsx.M128i](a), count.int32))

let la_shl_i16r128: proc(a: i16r128, count: int): i16r128 = if lsxExists(): shl_i16r128_lsx else: shl_i16r128_fallback

template `shl`*(a: i16r128, count: int): i16r128 =
  when defined(amd64) or defined(i386): x86_shl_i16r128(a, count)
  elif defined(arm64): arm_shl_i16r128(a, count)
  elif defined(loongarch64): la_shl_i16r128(a, count)

# ========================
# shl / i32r128 / value
# ========================

func shl_i32r128_fallback(a: i32r128, count: int): i32r128 =
  var output: i32r128
  let pOut = cast[ptr array[4, int32]](addr output)
  let pA   = cast[ptr array[4, int32]](addr a)
  unroll(i, 0, 3): pOut[i] = pA[i] shl count
  return output

func shl_i32r128_sse(a: i32r128, count: int): i32r128 =
  return cast[i32r128](mm_slli_epi32(cast[sse2.M128i](a), count.int32))

let x86_shl_i32r128: proc(a: i32r128, count: int): i32r128 = if sseExists(): shl_i32r128_sse else: shl_i32r128_fallback

func shl_i32r128_neon(a: i32r128, count: int): i32r128 =
  return cast[i32r128](vshlq_n_s32(cast[neon.Int32x4](a), count.int32))

let arm_shl_i32r128: proc(a: i32r128, count: int): i32r128 = if neonExists(): shl_i32r128_neon else: shl_i32r128_fallback

func shl_i32r128_lsx(a: i32r128, count: int): i32r128 =
  return cast[i32r128](lsx_vslli_w(cast[lsx.M128i](a), count.int32))

let la_shl_i32r128: proc(a: i32r128, count: int): i32r128 = if lsxExists(): shl_i32r128_lsx else: shl_i32r128_fallback

template `shl`*(a: i32r128, count: int): i32r128 =
  when defined(amd64) or defined(i386): x86_shl_i32r128(a, count)
  elif defined(arm64): arm_shl_i32r128(a, count)
  elif defined(loongarch64): la_shl_i32r128(a, count)

# ========================
# shl / i64r128 / value
# ========================

func shl_i64r128_fallback(a: i64r128, count: int): i64r128 =
  var output: i64r128
  let pOut = cast[ptr array[2, int64]](addr output)
  let pA   = cast[ptr array[2, int64]](addr a)
  unroll(i, 0, 1): pOut[i] = pA[i] shl count
  return output

func shl_i64r128_sse(a: i64r128, count: int): i64r128 =
  return cast[i64r128](mm_slli_epi64(cast[sse2.M128i](a), count.int32))

let x86_shl_i64r128: proc(a: i64r128, count: int): i64r128 = if sseExists(): shl_i64r128_sse else: shl_i64r128_fallback

func shl_i64r128_neon(a: i64r128, count: int): i64r128 =
  return cast[i64r128](vshlq_n_s64(cast[neon.Int64x2](a), count.int32))

let arm_shl_i64r128: proc(a: i64r128, count: int): i64r128 = if neonExists(): shl_i64r128_neon else: shl_i64r128_fallback

func shl_i64r128_lsx(a: i64r128, count: int): i64r128 =
  return cast[i64r128](lsx_vslli_d(cast[lsx.M128i](a), count.int32))

let la_shl_i64r128: proc(a: i64r128, count: int): i64r128 = if lsxExists(): shl_i64r128_lsx else: shl_i64r128_fallback

template `shl`*(a: i64r128, count: int): i64r128 =
  when defined(amd64) or defined(i386): x86_shl_i64r128(a, count)
  elif defined(arm64): arm_shl_i64r128(a, count)
  elif defined(loongarch64): la_shl_i64r128(a, count)

# ========================
# shl / u8r128 / value
# ========================

func shl_u8r128_fallback(a: u8r128, count: int): u8r128 =
  var output: u8r128
  let pOut = cast[ptr array[16, uint8]](addr output)
  let pA   = cast[ptr array[16, uint8]](addr a)
  unroll(i, 0, 15): pOut[i] = pA[i] shl count
  return output

func shl_u8r128_sse(a: u8r128, count: int): u8r128 =
  let mCount = mm_cvtsi32_si128(count.int32)
  let lows = mm_sll_epi16(cast[sse2.M128i](a), mCount)
  let mask = mm_set1_epi8(cast[int8](0xFF shl count))
  return cast[u8r128](mm_and_si128(lows, mask))

let x86_shl_u8r128: proc(a: u8r128, count: int): u8r128 = if sseExists(): shl_u8r128_sse else: shl_u8r128_fallback

func shl_u8r128_neon(a: u8r128, count: int): u8r128 =
  return cast[u8r128](vshlq_n_u8(cast[neon.Uint8x16](a), count.int32))

let arm_shl_u8r128: proc(a: u8r128, count: int): u8r128 = if neonExists(): shl_u8r128_neon else: shl_u8r128_fallback

func shl_u8r128_lsx(a: u8r128, count: int): u8r128 =
  return cast[u8r128](lsx_vslli_b(cast[lsx.M128i](a), count.int32))

let la_shl_u8r128: proc(a: u8r128, count: int): u8r128 = if lsxExists(): shl_u8r128_lsx else: shl_u8r128_fallback

template `shl`*(a: u8r128, count: int): u8r128 =
  when defined(amd64) or defined(i386): x86_shl_u8r128(a, count)
  elif defined(arm64): arm_shl_u8r128(a, count)
  elif defined(loongarch64): la_shl_u8r128(a, count)

# ========================
# shl / u16r128 / value
# ========================

func shl_u16r128_fallback(a: u16r128, count: int): u16r128 =
  var output: u16r128
  let pOut = cast[ptr array[8, uint16]](addr output)
  let pA   = cast[ptr array[8, uint16]](addr a)
  unroll(i, 0, 7): pOut[i] = pA[i] shl count
  return output

func shl_u16r128_sse(a: u16r128, count: int): u16r128 =
  return cast[u16r128](mm_slli_epi16(cast[sse2.M128i](a), count.int32))

let x86_shl_u16r128: proc(a: u16r128, count: int): u16r128 = if sseExists(): shl_u16r128_sse else: shl_u16r128_fallback

func shl_u16r128_neon(a: u16r128, count: int): u16r128 =
  return cast[u16r128](vshlq_n_u16(cast[neon.Uint16x8](a), count.int32))

let arm_shl_u16r128: proc(a: u16r128, count: int): u16r128 = if neonExists(): shl_u16r128_neon else: shl_u16r128_fallback

func shl_u16r128_lsx(a: u16r128, count: int): u16r128 =
  return cast[u16r128](lsx_vslli_h(cast[lsx.M128i](a), count.int32))

let la_shl_u16r128: proc(a: u16r128, count: int): u16r128 = if lsxExists(): shl_u16r128_lsx else: shl_u16r128_fallback

template `shl`*(a: u16r128, count: int): u16r128 =
  when defined(amd64) or defined(i386): x86_shl_u16r128(a, count)
  elif defined(arm64): arm_shl_u16r128(a, count)
  elif defined(loongarch64): la_shl_u16r128(a, count)

# ========================
# shl / u32r128 / value
# ========================

func shl_u32r128_fallback(a: u32r128, count: int): u32r128 =
  var output: u32r128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, uint32]](addr a)
  unroll(i, 0, 3): pOut[i] = pA[i] shl count
  return output

func shl_u32r128_sse(a: u32r128, count: int): u32r128 =
  return cast[u32r128](mm_slli_epi32(cast[sse2.M128i](a), count.int32))

let x86_shl_u32r128: proc(a: u32r128, count: int): u32r128 = if sseExists(): shl_u32r128_sse else: shl_u32r128_fallback

func shl_u32r128_neon(a: u32r128, count: int): u32r128 =
  return cast[u32r128](vshlq_n_u32(cast[neon.Uint32x4](a), count.int32))

let arm_shl_u32r128: proc(a: u32r128, count: int): u32r128 = if neonExists(): shl_u32r128_neon else: shl_u32r128_fallback

func shl_u32r128_lsx(a: u32r128, count: int): u32r128 =
  return cast[u32r128](lsx_vslli_w(cast[lsx.M128i](a), count.int32))

let la_shl_u32r128: proc(a: u32r128, count: int): u32r128 = if lsxExists(): shl_u32r128_lsx else: shl_u32r128_fallback

template `shl`*(a: u32r128, count: int): u32r128 =
  when defined(amd64) or defined(i386): x86_shl_u32r128(a, count)
  elif defined(arm64): arm_shl_u32r128(a, count)
  elif defined(loongarch64): la_shl_u32r128(a, count)

# ========================
# shl / u64r128 / value
# ========================

func shl_u64r128_fallback(a: u64r128, count: int): u64r128 =
  var output: u64r128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, uint64]](addr a)
  unroll(i, 0, 1): pOut[i] = pA[i] shl count
  return output

func shl_u64r128_sse(a: u64r128, count: int): u64r128 =
  return cast[u64r128](mm_slli_epi64(cast[sse2.M128i](a), count.int32))

let x86_shl_u64r128: proc(a: u64r128, count: int): u64r128 = if sseExists(): shl_u64r128_sse else: shl_u64r128_fallback

func shl_u64r128_neon(a: u64r128, count: int): u64r128 =
  return cast[u64r128](vshlq_n_u64(cast[neon.Uint64x2](a), count.int32))

let arm_shl_u64r128: proc(a: u64r128, count: int): u64r128 = if neonExists(): shl_u64r128_neon else: shl_u64r128_fallback

func shl_u64r128_lsx(a: u64r128, count: int): u64r128 =
  return cast[u64r128](lsx_vslli_d(cast[lsx.M128i](a), count.int32))

let la_shl_u64r128: proc(a: u64r128, count: int): u64r128 = if lsxExists(): shl_u64r128_lsx else: shl_u64r128_fallback

template `shl`*(a: u64r128, count: int): u64r128 =
  when defined(amd64) or defined(i386): x86_shl_u64r128(a, count)
  elif defined(arm64): arm_shl_u64r128(a, count)
  elif defined(loongarch64): la_shl_u64r128(a, count)

# ========================
# shl / f32v128 / value
# ========================

func shl_f32v128_fallback(a: f32v128, count: int): f32v128 =
  var output: f32v128
  let pOut = cast[ptr array[4, int32]](addr output)
  let pA   = cast[ptr array[4, int32]](addr a)
  unroll(i, 0, 3): pOut[i] = pA[i] shl count
  return output

func shl_f32v128_sse(a: f32v128, count: int): f32v128 =
  return cast[f32v128](mm_slli_epi32(cast[sse2.M128i](a), count.int32))

let x86_shl_f32v128: proc(a: f32v128, count: int): f32v128 = if sseExists(): shl_f32v128_sse else: shl_f32v128_fallback

func shl_f32v128_neon(a: f32v128, count: int): f32v128 =
  return cast[f32v128](vshlq_n_s32(cast[neon.Int32x4](a), count.int32))

let arm_shl_f32v128: proc(a: f32v128, count: int): f32v128 = if neonExists(): shl_f32v128_neon else: shl_f32v128_fallback

func shl_f32v128_lsx(a: f32v128, count: int): f32v128 =
  return cast[f32v128](lsx_vslli_w(cast[lsx.M128i](a), count.int32))

let la_shl_f32v128: proc(a: f32v128, count: int): f32v128 = if lsxExists(): shl_f32v128_lsx else: shl_f32v128_fallback

template `shl`*(a: f32v128, count: int): f32v128 =
  when defined(amd64) or defined(i386): x86_shl_f32v128(a, count)
  elif defined(arm64): arm_shl_f32v128(a, count)
  elif defined(loongarch64): la_shl_f32v128(a, count)

# ========================
# shl / f64v128 / value
# ========================

func shl_f64v128_fallback(a: f64v128, count: int): f64v128 =
  var output: f64v128
  let pOut = cast[ptr array[2, int64]](addr output)
  let pA   = cast[ptr array[2, int64]](addr a)
  unroll(i, 0, 1): pOut[i] = pA[i] shl count
  return output

func shl_f64v128_sse(a: f64v128, count: int): f64v128 =
  return cast[f64v128](mm_slli_epi64(cast[sse2.M128i](a), count.int32))

let x86_shl_f64v128: proc(a: f64v128, count: int): f64v128 = if sseExists(): shl_f64v128_sse else: shl_f64v128_fallback

func shl_f64v128_neon(a: f64v128, count: int): f64v128 =
  return cast[f64v128](vshlq_n_s64(cast[neon.Int64x2](a), count.int32))

let arm_shl_f64v128: proc(a: f64v128, count: int): f64v128 = if neonExists(): shl_f64v128_neon else: shl_f64v128_fallback

func shl_f64v128_lsx(a: f64v128, count: int): f64v128 =
  return cast[f64v128](lsx_vslli_d(cast[lsx.M128i](a), count.int32))

let la_shl_f64v128: proc(a: f64v128, count: int): f64v128 = if lsxExists(): shl_f64v128_lsx else: shl_f64v128_fallback

template `shl`*(a: f64v128, count: int): f64v128 =
  when defined(amd64) or defined(i386): x86_shl_f64v128(a, count)
  elif defined(arm64): arm_shl_f64v128(a, count)
  elif defined(loongarch64): la_shl_f64v128(a, count)

# ========================
# shl / i8v128 / value
# ========================

func shl_i8v128_fallback(a: i8v128, count: int): i8v128 =
  var output: i8v128
  let pOut = cast[ptr array[16, int8]](addr output)
  let pA   = cast[ptr array[16, int8]](addr a)
  unroll(i, 0, 15): pOut[i] = pA[i] shl count
  return output

func shl_i8v128_sse(a: i8v128, count: int): i8v128 =
  let mCount = mm_cvtsi32_si128(count.int32)
  let lows = mm_sll_epi16(cast[sse2.M128i](a), mCount)
  let mask = mm_set1_epi8(cast[int8](0xFF shl count))
  return cast[i8v128](mm_and_si128(lows, mask))

let x86_shl_i8v128: proc(a: i8v128, count: int): i8v128 = if sseExists(): shl_i8v128_sse else: shl_i8v128_fallback

func shl_i8v128_neon(a: i8v128, count: int): i8v128 =
  return cast[i8v128](vshlq_n_s8(cast[neon.Int8x16](a), count.int32))

let arm_shl_i8v128: proc(a: i8v128, count: int): i8v128 = if neonExists(): shl_i8v128_neon else: shl_i8v128_fallback

func shl_i8v128_lsx(a: i8v128, count: int): i8v128 =
  return cast[i8v128](lsx_vslli_b(cast[lsx.M128i](a), count.int32))

let la_shl_i8v128: proc(a: i8v128, count: int): i8v128 = if lsxExists(): shl_i8v128_lsx else: shl_i8v128_fallback

template `shl`*(a: i8v128, count: int): i8v128 =
  when defined(amd64) or defined(i386): x86_shl_i8v128(a, count)
  elif defined(arm64): arm_shl_i8v128(a, count)
  elif defined(loongarch64): la_shl_i8v128(a, count)

# ========================
# shl / i16v128 / value
# ========================

func shl_i16v128_fallback(a: i16v128, count: int): i16v128 =
  var output: i16v128
  let pOut = cast[ptr array[8, int16]](addr output)
  let pA   = cast[ptr array[8, int16]](addr a)
  unroll(i, 0, 7): pOut[i] = pA[i] shl count
  return output

func shl_i16v128_sse(a: i16v128, count: int): i16v128 =
  return cast[i16v128](mm_slli_epi16(cast[sse2.M128i](a), count.int32))

let x86_shl_i16v128: proc(a: i16v128, count: int): i16v128 = if sseExists(): shl_i16v128_sse else: shl_i16v128_fallback

func shl_i16v128_neon(a: i16v128, count: int): i16v128 =
  return cast[i16v128](vshlq_n_s16(cast[neon.Int16x8](a), count.int32))

let arm_shl_i16v128: proc(a: i16v128, count: int): i16v128 = if neonExists(): shl_i16v128_neon else: shl_i16v128_fallback

func shl_i16v128_lsx(a: i16v128, count: int): i16v128 =
  return cast[i16v128](lsx_vslli_h(cast[lsx.M128i](a), count.int32))

let la_shl_i16v128: proc(a: i16v128, count: int): i16v128 = if lsxExists(): shl_i16v128_lsx else: shl_i16v128_fallback

template `shl`*(a: i16v128, count: int): i16v128 =
  when defined(amd64) or defined(i386): x86_shl_i16v128(a, count)
  elif defined(arm64): arm_shl_i16v128(a, count)
  elif defined(loongarch64): la_shl_i16v128(a, count)

# ========================
# shl / i32v128 / value
# ========================

func shl_i32v128_fallback(a: i32v128, count: int): i32v128 =
  var output: i32v128
  let pOut = cast[ptr array[4, int32]](addr output)
  let pA   = cast[ptr array[4, int32]](addr a)
  unroll(i, 0, 3): pOut[i] = pA[i] shl count
  return output

func shl_i32v128_sse(a: i32v128, count: int): i32v128 =
  return cast[i32v128](mm_slli_epi32(cast[sse2.M128i](a), count.int32))

let x86_shl_i32v128: proc(a: i32v128, count: int): i32v128 = if sseExists(): shl_i32v128_sse else: shl_i32v128_fallback

func shl_i32v128_neon(a: i32v128, count: int): i32v128 =
  return cast[i32v128](vshlq_n_s32(cast[neon.Int32x4](a), count.int32))

let arm_shl_i32v128: proc(a: i32v128, count: int): i32v128 = if neonExists(): shl_i32v128_neon else: shl_i32v128_fallback

func shl_i32v128_lsx(a: i32v128, count: int): i32v128 =
  return cast[i32v128](lsx_vslli_w(cast[lsx.M128i](a), count.int32))

let la_shl_i32v128: proc(a: i32v128, count: int): i32v128 = if lsxExists(): shl_i32v128_lsx else: shl_i32v128_fallback

template `shl`*(a: i32v128, count: int): i32v128 =
  when defined(amd64) or defined(i386): x86_shl_i32v128(a, count)
  elif defined(arm64): arm_shl_i32v128(a, count)
  elif defined(loongarch64): la_shl_i32v128(a, count)

# ========================
# shl / i64v128 / value
# ========================

func shl_i64v128_fallback(a: i64v128, count: int): i64v128 =
  var output: i64v128
  let pOut = cast[ptr array[2, int64]](addr output)
  let pA   = cast[ptr array[2, int64]](addr a)
  unroll(i, 0, 1): pOut[i] = pA[i] shl count
  return output

func shl_i64v128_sse(a: i64v128, count: int): i64v128 =
  return cast[i64v128](mm_slli_epi64(cast[sse2.M128i](a), count.int32))

let x86_shl_i64v128: proc(a: i64v128, count: int): i64v128 = if sseExists(): shl_i64v128_sse else: shl_i64v128_fallback

func shl_i64v128_neon(a: i64v128, count: int): i64v128 =
  return cast[i64v128](vshlq_n_s64(cast[neon.Int64x2](a), count.int32))

let arm_shl_i64v128: proc(a: i64v128, count: int): i64v128 = if neonExists(): shl_i64v128_neon else: shl_i64v128_fallback

func shl_i64v128_lsx(a: i64v128, count: int): i64v128 =
  return cast[i64v128](lsx_vslli_d(cast[lsx.M128i](a), count.int32))

let la_shl_i64v128: proc(a: i64v128, count: int): i64v128 = if lsxExists(): shl_i64v128_lsx else: shl_i64v128_fallback

template `shl`*(a: i64v128, count: int): i64v128 =
  when defined(amd64) or defined(i386): x86_shl_i64v128(a, count)
  elif defined(arm64): arm_shl_i64v128(a, count)
  elif defined(loongarch64): la_shl_i64v128(a, count)

# ========================
# shl / u8v128 / value
# ========================

func shl_u8v128_fallback(a: u8v128, count: int): u8v128 =
  var output: u8v128
  let pOut = cast[ptr array[16, uint8]](addr output)
  let pA   = cast[ptr array[16, uint8]](addr a)
  unroll(i, 0, 15): pOut[i] = pA[i] shl count
  return output

func shl_u8v128_sse(a: u8v128, count: int): u8v128 =
  let mCount = mm_cvtsi32_si128(count.int32)
  let lows = mm_sll_epi16(cast[sse2.M128i](a), mCount)
  let mask = mm_set1_epi8(cast[int8](0xFF shl count))
  return cast[u8v128](mm_and_si128(lows, mask))

let x86_shl_u8v128: proc(a: u8v128, count: int): u8v128 = if sseExists(): shl_u8v128_sse else: shl_u8v128_fallback

func shl_u8v128_neon(a: u8v128, count: int): u8v128 =
  return cast[u8v128](vshlq_n_u8(cast[neon.Uint8x16](a), count.int32))

let arm_shl_u8v128: proc(a: u8v128, count: int): u8v128 = if neonExists(): shl_u8v128_neon else: shl_u8v128_fallback

func shl_u8v128_lsx(a: u8v128, count: int): u8v128 =
  return cast[u8v128](lsx_vslli_b(cast[lsx.M128i](a), count.int32))

let la_shl_u8v128: proc(a: u8v128, count: int): u8v128 = if lsxExists(): shl_u8v128_lsx else: shl_u8v128_fallback

template `shl`*(a: u8v128, count: int): u8v128 =
  when defined(amd64) or defined(i386): x86_shl_u8v128(a, count)
  elif defined(arm64): arm_shl_u8v128(a, count)
  elif defined(loongarch64): la_shl_u8v128(a, count)

# ========================
# shl / u16v128 / value
# ========================

func shl_u16v128_fallback(a: u16v128, count: int): u16v128 =
  var output: u16v128
  let pOut = cast[ptr array[8, uint16]](addr output)
  let pA   = cast[ptr array[8, uint16]](addr a)
  unroll(i, 0, 7): pOut[i] = pA[i] shl count
  return output

func shl_u16v128_sse(a: u16v128, count: int): u16v128 =
  return cast[u16v128](mm_slli_epi16(cast[sse2.M128i](a), count.int32))

let x86_shl_u16v128: proc(a: u16v128, count: int): u16v128 = if sseExists(): shl_u16v128_sse else: shl_u16v128_fallback

func shl_u16v128_neon(a: u16v128, count: int): u16v128 =
  return cast[u16v128](vshlq_n_u16(cast[neon.Uint16x8](a), count.int32))

let arm_shl_u16v128: proc(a: u16v128, count: int): u16v128 = if neonExists(): shl_u16v128_neon else: shl_u16v128_fallback

func shl_u16v128_lsx(a: u16v128, count: int): u16v128 =
  return cast[u16v128](lsx_vslli_h(cast[lsx.M128i](a), count.int32))

let la_shl_u16v128: proc(a: u16v128, count: int): u16v128 = if lsxExists(): shl_u16v128_lsx else: shl_u16v128_fallback

template `shl`*(a: u16v128, count: int): u16v128 =
  when defined(amd64) or defined(i386): x86_shl_u16v128(a, count)
  elif defined(arm64): arm_shl_u16v128(a, count)
  elif defined(loongarch64): la_shl_u16v128(a, count)

# ========================
# shl / u32v128 / value
# ========================

func shl_u32v128_fallback(a: u32v128, count: int): u32v128 =
  var output: u32v128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, uint32]](addr a)
  unroll(i, 0, 3): pOut[i] = pA[i] shl count
  return output

func shl_u32v128_sse(a: u32v128, count: int): u32v128 =
  return cast[u32v128](mm_slli_epi32(cast[sse2.M128i](a), count.int32))

let x86_shl_u32v128: proc(a: u32v128, count: int): u32v128 = if sseExists(): shl_u32v128_sse else: shl_u32v128_fallback

func shl_u32v128_neon(a: u32v128, count: int): u32v128 =
  return cast[u32v128](vshlq_n_u32(cast[neon.Uint32x4](a), count.int32))

let arm_shl_u32v128: proc(a: u32v128, count: int): u32v128 = if neonExists(): shl_u32v128_neon else: shl_u32v128_fallback

func shl_u32v128_lsx(a: u32v128, count: int): u32v128 =
  return cast[u32v128](lsx_vslli_w(cast[lsx.M128i](a), count.int32))

let la_shl_u32v128: proc(a: u32v128, count: int): u32v128 = if lsxExists(): shl_u32v128_lsx else: shl_u32v128_fallback

template `shl`*(a: u32v128, count: int): u32v128 =
  when defined(amd64) or defined(i386): x86_shl_u32v128(a, count)
  elif defined(arm64): arm_shl_u32v128(a, count)
  elif defined(loongarch64): la_shl_u32v128(a, count)

# ========================
# shl / u64v128 / value
# ========================

func shl_u64v128_fallback(a: u64v128, count: int): u64v128 =
  var output: u64v128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, uint64]](addr a)
  unroll(i, 0, 1): pOut[i] = pA[i] shl count
  return output

func shl_u64v128_sse(a: u64v128, count: int): u64v128 =
  return cast[u64v128](mm_slli_epi64(cast[sse2.M128i](a), count.int32))

let x86_shl_u64v128: proc(a: u64v128, count: int): u64v128 = if sseExists(): shl_u64v128_sse else: shl_u64v128_fallback

func shl_u64v128_neon(a: u64v128, count: int): u64v128 =
  return cast[u64v128](vshlq_n_u64(cast[neon.Uint64x2](a), count.int32))

let arm_shl_u64v128: proc(a: u64v128, count: int): u64v128 = if neonExists(): shl_u64v128_neon else: shl_u64v128_fallback

func shl_u64v128_lsx(a: u64v128, count: int): u64v128 =
  return cast[u64v128](lsx_vslli_d(cast[lsx.M128i](a), count.int32))

let la_shl_u64v128: proc(a: u64v128, count: int): u64v128 = if lsxExists(): shl_u64v128_lsx else: shl_u64v128_fallback

template `shl`*(a: u64v128, count: int): u64v128 =
  when defined(amd64) or defined(i386): x86_shl_u64v128(a, count)
  elif defined(arm64): arm_shl_u64v128(a, count)
  elif defined(loongarch64): la_shl_u64v128(a, count)

# ========================
# shr / f32r128 / value
# ========================

func shr_f32r128_fallback(a: f32r128, count: int): f32r128 =
  var output: f32r128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, uint32]](addr a)
  unroll(i, 0, 3): pOut[i] = pA[i] shr count
  return output

func shr_f32r128_sse(a: f32r128, count: int): f32r128 =
  return cast[f32r128](mm_srli_epi32(cast[sse2.M128i](a), count.int32))

let x86_shr_f32r128: proc(a: f32r128, count: int): f32r128 = if sseExists(): shr_f32r128_sse else: shr_f32r128_fallback

func shr_f32r128_neon(a: f32r128, count: int): f32r128 =
  return cast[f32r128](vshlq_n_u32(cast[neon.Uint32x4](a), -count.int32))

let arm_shr_f32r128: proc(a: f32r128, count: int): f32r128 = if neonExists(): shr_f32r128_neon else: shr_f32r128_fallback

func shr_f32r128_lsx(a: f32r128, count: int): f32r128 =
  return cast[f32r128](lsx_vsrli_w(cast[lsx.M128i](a), count.int32))

let la_shr_f32r128: proc(a: f32r128, count: int): f32r128 = if lsxExists(): shr_f32r128_lsx else: shr_f32r128_fallback

template `shr`*(a: f32r128, count: int): f32r128 =
  when defined(amd64) or defined(i386): x86_shr_f32r128(a, count)
  elif defined(arm64): arm_shr_f32r128(a, count)
  elif defined(loongarch64): la_shr_f32r128(a, count)

# ========================
# shr / f64r128 / value
# ========================

func shr_f64r128_fallback(a: f64r128, count: int): f64r128 =
  var output: f64r128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, uint64]](addr a)
  unroll(i, 0, 1): pOut[i] = pA[i] shr count
  return output

func shr_f64r128_sse(a: f64r128, count: int): f64r128 =
  return cast[f64r128](mm_srli_epi64(cast[sse2.M128i](a), count.int32))

let x86_shr_f64r128: proc(a: f64r128, count: int): f64r128 = if sseExists(): shr_f64r128_sse else: shr_f64r128_fallback

func shr_f64r128_neon(a: f64r128, count: int): f64r128 =
  return cast[f64r128](vshlq_n_u64(cast[neon.Uint64x2](a), -count.int32))

let arm_shr_f64r128: proc(a: f64r128, count: int): f64r128 = if neonExists(): shr_f64r128_neon else: shr_f64r128_fallback

func shr_f64r128_lsx(a: f64r128, count: int): f64r128 =
  return cast[f64r128](lsx_vsrli_d(cast[lsx.M128i](a), count.int32))

let la_shr_f64r128: proc(a: f64r128, count: int): f64r128 = if lsxExists(): shr_f64r128_lsx else: shr_f64r128_fallback

template `shr`*(a: f64r128, count: int): f64r128 =
  when defined(amd64) or defined(i386): x86_shr_f64r128(a, count)
  elif defined(arm64): arm_shr_f64r128(a, count)
  elif defined(loongarch64): la_shr_f64r128(a, count)

# ========================
# shr / i8r128 / value
# ========================

func shr_i8r128_fallback(a: i8r128, count: int): i8r128 =
  var output: i8r128
  let pOut = cast[ptr array[16, int8]](addr output)
  let pA   = cast[ptr array[16, int8]](addr a)
  unroll(i, 0, 15): pOut[i] = pA[i] shr count
  return output

func shr_i8r128_sse(a: i8r128, count: int): i8r128 =
  let mCount = mm_cvtsi32_si128(count.int32)
  let extHigh = mm_sra_epi16(mm_slli_epi16(cast[sse2.M128i](a), 8), mCount)
  let extLow = mm_sra_epi16(cast[sse2.M128i](a), mCount)
  let maskHigh = mm_set1_epi16(cast[int16](0xFF00))
  let maskLow = mm_set1_epi16(cast[int16](0x00FF))
  return cast[i8r128](mm_or_si128(mm_and_si128(extHigh, maskHigh), mm_and_si128(extLow, maskLow)))

let x86_shr_i8r128: proc(a: i8r128, count: int): i8r128 = if sseExists(): shr_i8r128_sse else: shr_i8r128_fallback

func shr_i8r128_neon(a: i8r128, count: int): i8r128 =
  return cast[i8r128](vshlq_n_s8(cast[neon.Int8x16](a), -count.int32))

let arm_shr_i8r128: proc(a: i8r128, count: int): i8r128 = if neonExists(): shr_i8r128_neon else: shr_i8r128_fallback

func shr_i8r128_lsx(a: i8r128, count: int): i8r128 =
  return cast[i8r128](lsx_vsrai_b(cast[lsx.M128i](a), count.int32))

let la_shr_i8r128: proc(a: i8r128, count: int): i8r128 = if lsxExists(): shr_i8r128_lsx else: shr_i8r128_fallback

template `shr`*(a: i8r128, count: int): i8r128 =
  when defined(amd64) or defined(i386): x86_shr_i8r128(a, count)
  elif defined(arm64): arm_shr_i8r128(a, count)
  elif defined(loongarch64): la_shr_i8r128(a, count)

# ========================
# shr / i16r128 / value
# ========================

func shr_i16r128_fallback(a: i16r128, count: int): i16r128 =
  var output: i16r128
  let pOut = cast[ptr array[8, int16]](addr output)
  let pA   = cast[ptr array[8, int16]](addr a)
  unroll(i, 0, 7): pOut[i] = pA[i] shr count
  return output

func shr_i16r128_sse(a: i16r128, count: int): i16r128 =
  let mCount: sse2.M128i = mm_cvtsi32_si128(count.int32)
  return cast[i16r128](mm_sra_epi16(cast[sse2.M128i](a), mCount))

let x86_shr_i16r128: proc(a: i16r128, count: int): i16r128 = if sseExists(): shr_i16r128_sse else: shr_i16r128_fallback

func shr_i16r128_neon(a: i16r128, count: int): i16r128 =
  return cast[i16r128](vshlq_n_s16(cast[neon.Int16x8](a), -count.int32))

let arm_shr_i16r128: proc(a: i16r128, count: int): i16r128 = if neonExists(): shr_i16r128_neon else: shr_i16r128_fallback

func shr_i16r128_lsx(a: i16r128, count: int): i16r128 =
  return cast[i16r128](lsx_vsrai_h(cast[lsx.M128i](a), count.int32))

let la_shr_i16r128: proc(a: i16r128, count: int): i16r128 = if lsxExists(): shr_i16r128_lsx else: shr_i16r128_fallback

template `shr`*(a: i16r128, count: int): i16r128 =
  when defined(amd64) or defined(i386): x86_shr_i16r128(a, count)
  elif defined(arm64): arm_shr_i16r128(a, count)
  elif defined(loongarch64): la_shr_i16r128(a, count)

# ========================
# shr / i32r128 / value
# ========================

func shr_i32r128_fallback(a: i32r128, count: int): i32r128 =
  var output: i32r128
  let pOut = cast[ptr array[4, int32]](addr output)
  let pA   = cast[ptr array[4, int32]](addr a)
  unroll(i, 0, 3): pOut[i] = pA[i] shr count
  return output

func shr_i32r128_sse(a: i32r128, count: int): i32r128 =
  let mCount: sse2.M128i = mm_cvtsi32_si128(count.int32)
  return cast[i32r128](mm_sra_epi32(cast[sse2.M128i](a), mCount))

let x86_shr_i32r128: proc(a: i32r128, count: int): i32r128 = if sseExists(): shr_i32r128_sse else: shr_i32r128_fallback

func shr_i32r128_neon(a: i32r128, count: int): i32r128 =
  return cast[i32r128](vshlq_n_s32(cast[neon.Int32x4](a), -count.int32))

let arm_shr_i32r128: proc(a: i32r128, count: int): i32r128 = if neonExists(): shr_i32r128_neon else: shr_i32r128_fallback

func shr_i32r128_lsx(a: i32r128, count: int): i32r128 =
  return cast[i32r128](lsx_vsrai_w(cast[lsx.M128i](a), count.int32))

let la_shr_i32r128: proc(a: i32r128, count: int): i32r128 = if lsxExists(): shr_i32r128_lsx else: shr_i32r128_fallback

template `shr`*(a: i32r128, count: int): i32r128 =
  when defined(amd64) or defined(i386): x86_shr_i32r128(a, count)
  elif defined(arm64): arm_shr_i32r128(a, count)
  elif defined(loongarch64): la_shr_i32r128(a, count)

# ========================
# shr / i64r128 / value
# ========================

func shr_i64r128_fallback(a: i64r128, count: int): i64r128 =
  var output: i64r128
  let pOut = cast[ptr array[2, int64]](addr output)
  let pA   = cast[ptr array[2, int64]](addr a)
  unroll(i, 0, 1): pOut[i] = pA[i] shr count
  return output

let x86_shr_i64r128: proc(a: i64r128, count: int): i64r128 = shr_i64r128_fallback

func shr_i64r128_neon(a: i64r128, count: int): i64r128 =
  return cast[i64r128](vshlq_n_s64(cast[neon.Int64x2](a), -count.int32))

let arm_shr_i64r128: proc(a: i64r128, count: int): i64r128 = if neonExists(): shr_i64r128_neon else: shr_i64r128_fallback

func shr_i64r128_lsx(a: i64r128, count: int): i64r128 =
  return cast[i64r128](lsx_vsrai_d(cast[lsx.M128i](a), count.int32))

let la_shr_i64r128: proc(a: i64r128, count: int): i64r128 = if lsxExists(): shr_i64r128_lsx else: shr_i64r128_fallback

template `shr`*(a: i64r128, count: int): i64r128 =
  when defined(amd64) or defined(i386): x86_shr_i64r128(a, count)
  elif defined(arm64): arm_shr_i64r128(a, count)
  elif defined(loongarch64): la_shr_i64r128(a, count)

# ========================
# shr / u8r128 / value
# ========================

func shr_u8r128_fallback(a: u8r128, count: int): u8r128 =
  var output: u8r128
  let pOut = cast[ptr array[16, uint8]](addr output)
  let pA   = cast[ptr array[16, uint8]](addr a)
  unroll(i, 0, 15): pOut[i] = pA[i] shr count
  return output

func shr_u8r128_sse(a: u8r128, count: int): u8r128 =
  let lows = mm_srli_epi16(cast[sse2.M128i](a), count.int32)
  let mask = mm_set1_epi8(cast[int8](0xFF'u8 shr count))
  return cast[u8r128](mm_and_si128(lows, mask))

let x86_shr_u8r128: proc(a: u8r128, count: int): u8r128 = if sseExists(): shr_u8r128_sse else: shr_u8r128_fallback

func shr_u8r128_neon(a: u8r128, count: int): u8r128 =
  return cast[u8r128](vshlq_n_u8(cast[neon.Uint8x16](a), -count.int32))

let arm_shr_u8r128: proc(a: u8r128, count: int): u8r128 = if neonExists(): shr_u8r128_neon else: shr_u8r128_fallback

func shr_u8r128_lsx(a: u8r128, count: int): u8r128 =
  return cast[u8r128](lsx_vsrli_b(cast[lsx.M128i](a), count.int32))

let la_shr_u8r128: proc(a: u8r128, count: int): u8r128 = if lsxExists(): shr_u8r128_lsx else: shr_u8r128_fallback

template `shr`*(a: u8r128, count: int): u8r128 =
  when defined(amd64) or defined(i386): x86_shr_u8r128(a, count)
  elif defined(arm64): arm_shr_u8r128(a, count)
  elif defined(loongarch64): la_shr_u8r128(a, count)

# ========================
# shr / u16r128 / value
# ========================

func shr_u16r128_fallback(a: u16r128, count: int): u16r128 =
  var output: u16r128
  let pOut = cast[ptr array[8, uint16]](addr output)
  let pA   = cast[ptr array[8, uint16]](addr a)
  unroll(i, 0, 7): pOut[i] = pA[i] shr count
  return output

func shr_u16r128_sse(a: u16r128, count: int): u16r128 =
  return cast[u16r128](mm_srli_epi16(cast[sse2.M128i](a), count.int32))

let x86_shr_u16r128: proc(a: u16r128, count: int): u16r128 = if sseExists(): shr_u16r128_sse else: shr_u16r128_fallback

func shr_u16r128_neon(a: u16r128, count: int): u16r128 =
  return cast[u16r128](vshlq_n_u16(cast[neon.Uint16x8](a), -count.int32))

let arm_shr_u16r128: proc(a: u16r128, count: int): u16r128 = if neonExists(): shr_u16r128_neon else: shr_u16r128_fallback

func shr_u16r128_lsx(a: u16r128, count: int): u16r128 =
  return cast[u16r128](lsx_vsrli_h(cast[lsx.M128i](a), count.int32))

let la_shr_u16r128: proc(a: u16r128, count: int): u16r128 = if lsxExists(): shr_u16r128_lsx else: shr_u16r128_fallback

template `shr`*(a: u16r128, count: int): u16r128 =
  when defined(amd64) or defined(i386): x86_shr_u16r128(a, count)
  elif defined(arm64): arm_shr_u16r128(a, count)
  elif defined(loongarch64): la_shr_u16r128(a, count)

# ========================
# shr / u32r128 / value
# ========================

func shr_u32r128_fallback(a: u32r128, count: int): u32r128 =
  var output: u32r128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, uint32]](addr a)
  unroll(i, 0, 3): pOut[i] = pA[i] shr count
  return output

func shr_u32r128_sse(a: u32r128, count: int): u32r128 =
  return cast[u32r128](mm_srli_epi32(cast[sse2.M128i](a), count.int32))

let x86_shr_u32r128: proc(a: u32r128, count: int): u32r128 = if sseExists(): shr_u32r128_sse else: shr_u32r128_fallback

func shr_u32r128_neon(a: u32r128, count: int): u32r128 =
  return cast[u32r128](vshlq_n_u32(cast[neon.Uint32x4](a), -count.int32))

let arm_shr_u32r128: proc(a: u32r128, count: int): u32r128 = if neonExists(): shr_u32r128_neon else: shr_u32r128_fallback

func shr_u32r128_lsx(a: u32r128, count: int): u32r128 =
  return cast[u32r128](lsx_vsrli_w(cast[lsx.M128i](a), count.int32))

let la_shr_u32r128: proc(a: u32r128, count: int): u32r128 = if lsxExists(): shr_u32r128_lsx else: shr_u32r128_fallback

template `shr`*(a: u32r128, count: int): u32r128 =
  when defined(amd64) or defined(i386): x86_shr_u32r128(a, count)
  elif defined(arm64): arm_shr_u32r128(a, count)
  elif defined(loongarch64): la_shr_u32r128(a, count)

# ========================
# shr / u64r128 / value
# ========================

func shr_u64r128_fallback(a: u64r128, count: int): u64r128 =
  var output: u64r128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, uint64]](addr a)
  unroll(i, 0, 1): pOut[i] = pA[i] shr count
  return output

func shr_u64r128_sse(a: u64r128, count: int): u64r128 =
  return cast[u64r128](mm_srli_epi64(cast[sse2.M128i](a), count.int32))

let x86_shr_u64r128: proc(a: u64r128, count: int): u64r128 = if sseExists(): shr_u64r128_sse else: shr_u64r128_fallback

func shr_u64r128_neon(a: u64r128, count: int): u64r128 =
  return cast[u64r128](vshlq_n_u64(cast[neon.Uint64x2](a), -count.int32))

let arm_shr_u64r128: proc(a: u64r128, count: int): u64r128 = if neonExists(): shr_u64r128_neon else: shr_u64r128_fallback

func shr_u64r128_lsx(a: u64r128, count: int): u64r128 =
  return cast[u64r128](lsx_vsrli_d(cast[lsx.M128i](a), count.int32))

let la_shr_u64r128: proc(a: u64r128, count: int): u64r128 = if lsxExists(): shr_u64r128_lsx else: shr_u64r128_fallback

template `shr`*(a: u64r128, count: int): u64r128 =
  when defined(amd64) or defined(i386): x86_shr_u64r128(a, count)
  elif defined(arm64): arm_shr_u64r128(a, count)
  elif defined(loongarch64): la_shr_u64r128(a, count)

# ========================
# shr / f32v128 / value
# ========================

func shr_f32v128_fallback(a: f32v128, count: int): f32v128 =
  var output: f32v128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, uint32]](addr a)
  unroll(i, 0, 3): pOut[i] = pA[i] shr count
  return output

func shr_f32v128_sse(a: f32v128, count: int): f32v128 =
  return cast[f32v128](mm_srli_epi32(cast[sse2.M128i](a), count.int32))

let x86_shr_f32v128: proc(a: f32v128, count: int): f32v128 = if sseExists(): shr_f32v128_sse else: shr_f32v128_fallback

func shr_f32v128_neon(a: f32v128, count: int): f32v128 =
  return cast[f32v128](vshlq_n_u32(cast[neon.Uint32x4](a), -count.int32))

let arm_shr_f32v128: proc(a: f32v128, count: int): f32v128 = if neonExists(): shr_f32v128_neon else: shr_f32v128_fallback

func shr_f32v128_lsx(a: f32v128, count: int): f32v128 =
  return cast[f32v128](lsx_vsrli_w(cast[lsx.M128i](a), count.int32))

let la_shr_f32v128: proc(a: f32v128, count: int): f32v128 = if lsxExists(): shr_f32v128_lsx else: shr_f32v128_fallback

template `shr`*(a: f32v128, count: int): f32v128 =
  when defined(amd64) or defined(i386): x86_shr_f32v128(a, count)
  elif defined(arm64): arm_shr_f32v128(a, count)
  elif defined(loongarch64): la_shr_f32v128(a, count)

# ========================
# shr / f64v128 / value
# ========================

func shr_f64v128_fallback(a: f64v128, count: int): f64v128 =
  var output: f64v128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, uint64]](addr a)
  unroll(i, 0, 1): pOut[i] = pA[i] shr count
  return output

func shr_f64v128_sse(a: f64v128, count: int): f64v128 =
  return cast[f64v128](mm_srli_epi64(cast[sse2.M128i](a), count.int32))

let x86_shr_f64v128: proc(a: f64v128, count: int): f64v128 = if sseExists(): shr_f64v128_sse else: shr_f64v128_fallback

func shr_f64v128_neon(a: f64v128, count: int): f64v128 =
  return cast[f64v128](vshlq_n_u64(cast[neon.Uint64x2](a), -count.int32))

let arm_shr_f64v128: proc(a: f64v128, count: int): f64v128 = if neonExists(): shr_f64v128_neon else: shr_f64v128_fallback

func shr_f64v128_lsx(a: f64v128, count: int): f64v128 =
  return cast[f64v128](lsx_vsrli_d(cast[lsx.M128i](a), count.int32))

let la_shr_f64v128: proc(a: f64v128, count: int): f64v128 = if lsxExists(): shr_f64v128_lsx else: shr_f64v128_fallback

template `shr`*(a: f64v128, count: int): f64v128 =
  when defined(amd64) or defined(i386): x86_shr_f64v128(a, count)
  elif defined(arm64): arm_shr_f64v128(a, count)
  elif defined(loongarch): la_shr_f64v128(a, count)

# ========================
# shr / i8v128 / value
# ========================

func shr_i8v128_fallback(a: i8v128, count: int): i8v128 =
  var output: i8v128
  let pOut = cast[ptr array[16, int8]](addr output)
  let pA   = cast[ptr array[16, int8]](addr a)
  unroll(i, 0, 15): pOut[i] = pA[i] shr count
  return output

func shr_i8v128_sse(a: i8v128, count: int): i8v128 =
  let mCount = mm_cvtsi32_si128(count.int32)
  let extHigh = mm_sra_epi16(mm_slli_epi16(cast[sse2.M128i](a), 8), mCount)
  let extLow = mm_sra_epi16(cast[sse2.M128i](a), mCount)
  let maskHigh = mm_set1_epi16(cast[int16](0xFF00))
  let maskLow = mm_set1_epi16(cast[int16](0x00FF))
  return cast[i8v128](mm_or_si128(mm_and_si128(extHigh, maskHigh), mm_and_si128(extLow, maskLow)))

let x86_shr_i8v128: proc(a: i8v128, count: int): i8v128 = if sseExists(): shr_i8v128_sse else: shr_i8v128_fallback

func shr_i8v128_neon(a: i8v128, count: int): i8v128 =
  return cast[i8v128](vshlq_n_s8(cast[neon.Int8x16](a), -count.int32))

let arm_shr_i8v128: proc(a: i8v128, count: int): i8v128 = if neonExists(): shr_i8v128_neon else: shr_i8v128_fallback

func shr_i8v128_lsx(a: i8v128, count: int): i8v128 =
  return cast[i8v128](lsx_vsrai_b(cast[lsx.M128i](a), count.int32))

let la_shr_i8v128: proc(a: i8v128, count: int): i8v128 = if lsxExists(): shr_i8v128_lsx else: shr_i8v128_fallback

template `shr`*(a: i8v128, count: int): i8v128 =
  when defined(amd64) or defined(i386): x86_shr_i8v128(a, count)
  elif defined(arm64): arm_shr_i8v128(a, count)
  elif defined(loongarch64): la_shr_i8v128(a, count)

# ========================
# shr / i16v128 / value
# ========================

func shr_i16v128_fallback(a: i16v128, count: int): i16v128 =
  var output: i16v128
  let pOut = cast[ptr array[8, int16]](addr output)
  let pA   = cast[ptr array[8, int16]](addr a)
  unroll(i, 0, 7): pOut[i] = pA[i] shr count
  return output

func shr_i16v128_sse(a: i16v128, count: int): i16v128 =
  let mCount: sse2.M128i = mm_cvtsi32_si128(count.int32)
  return cast[i16v128](mm_sra_epi16(cast[sse2.M128i](a), mCount))

let x86_shr_i16v128: proc(a: i16v128, count: int): i16v128 = if sseExists(): shr_i16v128_sse else: shr_i16v128_fallback

func shr_i16v128_neon(a: i16v128, count: int): i16v128 =
  return cast[i16v128](vshlq_n_s16(cast[neon.Int16x8](a), -count.int32))

let arm_shr_i16v128: proc(a: i16v128, count: int): i16v128 = if neonExists(): shr_i16v128_neon else: shr_i16v128_fallback

func shr_i16v128_lsx(a: i16v128, count: int): i16v128 =
  return cast[i16v128](lsx_vsrai_h(cast[lsx.M128i](a), count.int32))

let la_shr_i16v128: proc(a: i16v128, count: int): i16v128 = if lsxExists(): shr_i16v128_lsx else: shr_i16v128_fallback

template `shr`*(a: i16v128, count: int): i16v128 =
  when defined(amd64) or defined(i386): x86_shr_i16v128(a, count)
  elif defined(arm64): arm_shr_i16v128(a, count)
  elif defined(loongarch64): la_shr_i16v128(a, count)

# ========================
# shr / i32v128 / value
# ========================

func shr_i32v128_fallback(a: i32v128, count: int): i32v128 =
  var output: i32v128
  let pOut = cast[ptr array[4, int32]](addr output)
  let pA   = cast[ptr array[4, int32]](addr a)
  unroll(i, 0, 3): pOut[i] = pA[i] shr count
  return output

func shr_i32v128_sse(a: i32v128, count: int): i32v128 =
  let mCount: sse2.M128i = mm_cvtsi32_si128(count.int32)
  return cast[i32v128](mm_sra_epi32(cast[sse2.M128i](a), mCount))

let x86_shr_i32v128: proc(a: i32v128, count: int): i32v128 = if sseExists(): shr_i32v128_sse else: shr_i32v128_fallback

func shr_i32v128_neon(a: i32v128, count: int): i32v128 =
  return cast[i32v128](vshlq_n_s32(cast[neon.Int32x4](a), -count.int32))

let arm_shr_i32v128: proc(a: i32v128, count: int): i32v128 = if neonExists(): shr_i32v128_neon else: shr_i32v128_fallback

func shr_i32v128_lsx(a: i32v128, count: int): i32v128 =
  return cast[i32v128](lsx_vsrai_w(cast[lsx.M128i](a), count.int32))

let la_shr_i32v128: proc(a: i32v128, count: int): i32v128 = if lsxExists(): shr_i32v128_lsx else: shr_i32v128_fallback

template `shr`*(a: i32v128, count: int): i32v128 =
  when defined(amd64) or defined(i386): x86_shr_i32v128(a, count)
  elif defined(arm64): arm_shr_i32v128(a, count)
  elif defined(loongarch64): la_shr_i32v128(a, count)

# ========================
# shr / i64v128 / value
# ========================

func shr_i64v128_fallback(a: i64v128, count: int): i64v128 =
  var output: i64v128
  let pOut = cast[ptr array[2, int64]](addr output)
  let pA   = cast[ptr array[2, int64]](addr a)
  unroll(i, 0, 1): pOut[i] = pA[i] shr count
  return output

let x86_shr_i64v128: proc(a: i64v128, count: int): i64v128 = shr_i64v128_fallback

func shr_i64v128_neon(a: i64v128, count: int): i64v128 =
  return cast[i64v128](vshlq_n_s64(cast[neon.Int64x2](a), -count.int32))

let arm_shr_i64v128: proc(a: i64v128, count: int): i64v128 = if neonExists(): shr_i64v128_neon else: shr_i64v128_fallback

func shr_i64v128_lsx(a: i64v128, count: int): i64v128 =
  return cast[i64v128](lsx_vsrai_d(cast[lsx.M128i](a), count.int32))

let la_shr_i64v128: proc(a: i64v128, count: int): i64v128 = if lsxExists(): shr_i64v128_lsx else: shr_i64v128_fallback

template `shr`*(a: i64v128, count: int): i64v128 =
  when defined(amd64) or defined(i386): x86_shr_i64v128(a, count)
  elif defined(arm64): arm_shr_i64v128(a, count)
  elif defined(loongarch64): la_shr_i64v128(a, count)

# ========================
# shr / u8v128 / value
# ========================

func shr_u8v128_fallback(a: u8v128, count: int): u8v128 =
  var output: u8v128
  let pOut = cast[ptr array[16, uint8]](addr output)
  let pA   = cast[ptr array[16, uint8]](addr a)
  unroll(i, 0, 15): pOut[i] = pA[i] shr count
  return output

func shr_u8v128_sse(a: u8v128, count: int): u8v128 =
  let lows = mm_srli_epi16(cast[sse2.M128i](a), count.int32)
  let mask = mm_set1_epi8(cast[int8](0xFF'u8 shr count))
  return cast[u8v128](mm_and_si128(lows, mask))

let x86_shr_u8v128: proc(a: u8v128, count: int): u8v128 = if sseExists(): shr_u8v128_sse else: shr_u8v128_fallback

func shr_u8v128_neon(a: u8v128, count: int): u8v128 =
  return cast[u8v128](vshlq_n_u8(cast[neon.Uint8x16](a), -count.int32))

let arm_shr_u8v128: proc(a: u8v128, count: int): u8v128 = if neonExists(): shr_u8v128_neon else: shr_u8v128_fallback

func shr_u8v128_lsx(a: u8v128, count: int): u8v128 =
  return cast[u8v128](lsx_vsrli_b(cast[lsx.M128i](a), count.int32))

let la_shr_u8v128: proc(a: u8v128, count: int): u8v128 = if lsxExists(): shr_u8v128_lsx else: shr_u8v128_fallback

template `shr`*(a: u8v128, count: int): u8v128 =
  when defined(amd64) or defined(i386): x86_shr_u8v128(a, count)
  elif defined(arm64): arm_shr_u8v128(a, count)
  elif defined(loongarch64): la_shr_u8v128(a, count)

# ========================
# shr / u16v128 / value
# ========================

func shr_u16v128_fallback(a: u16v128, count: int): u16v128 =
  var output: u16v128
  let pOut = cast[ptr array[8, uint16]](addr output)
  let pA   = cast[ptr array[8, uint16]](addr a)
  unroll(i, 0, 7): pOut[i] = pA[i] shr count
  return output

func shr_u16v128_sse(a: u16v128, count: int): u16v128 =
  return cast[u16v128](mm_srli_epi16(cast[sse2.M128i](a), count.int32))

let x86_shr_u16v128: proc(a: u16v128, count: int): u16v128 = if sseExists(): shr_u16v128_sse else: shr_u16v128_fallback

func shr_u16v128_neon(a: u16v128, count: int): u16v128 =
  return cast[u16v128](vshlq_n_u16(cast[neon.Uint16x8](a), -count.int32))

let arm_shr_u16v128: proc(a: u16v128, count: int): u16v128 = if neonExists(): shr_u16v128_neon else: shr_u16v128_fallback

func shr_u16v128_lsx(a: u16v128, count: int): u16v128 =
  return cast[u16v128](lsx_vsrli_h(cast[lsx.M128i](a), count.int32))

let la_shr_u16v128: proc(a: u16v128, count: int): u16v128 = if lsxExists(): shr_u16v128_lsx else: shr_u16v128_fallback

template `shr`*(a: u16v128, count: int): u16v128 =
  when defined(amd64) or defined(i386): x86_shr_u16v128(a, count)
  elif defined(arm64): arm_shr_u16v128(a, count)
  elif defined(loongarch64): la_shr_u16v128(a, count)

# ========================
# shr / u32v128 / value
# ========================

func shr_u32v128_fallback(a: u32v128, count: int): u32v128 =
  var output: u32v128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, uint32]](addr a)
  unroll(i, 0, 3): pOut[i] = pA[i] shr count
  return output

func shr_u32v128_sse(a: u32v128, count: int): u32v128 =
  return cast[u32v128](mm_srli_epi32(cast[sse2.M128i](a), count.int32))

let x86_shr_u32v128: proc(a: u32v128, count: int): u32v128 = if sseExists(): shr_u32v128_sse else: shr_u32v128_fallback

func shr_u32v128_neon(a: u32v128, count: int): u32v128 =
  return cast[u32v128](vshlq_n_u32(cast[neon.Uint32x4](a), -count.int32))

let arm_shr_u32v128: proc(a: u32v128, count: int): u32v128 = if neonExists(): shr_u32v128_neon else: shr_u32v128_fallback

func shr_u32v128_lsx(a: u32v128, count: int): u32v128 =
  return cast[u32v128](lsx_vsrli_w(cast[lsx.M128i](a), count.int32))

let la_shr_u32v128: proc(a: u32v128, count: int): u32v128 = if lsxExists(): shr_u32v128_lsx else: shr_u32v128_fallback

template `shr`*(a: u32v128, count: int): u32v128 =
  when defined(amd64) or defined(i386): x86_shr_u32v128(a, count)
  elif defined(arm64): arm_shr_u32v128(a, count)
  elif defined(loongarch64): la_shr_u32v128(a, count)

# ========================
# shr / u64v128 / value
# ========================

func shr_u64v128_fallback(a: u64v128, count: int): u64v128 =
  var output: u64v128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, uint64]](addr a)
  unroll(i, 0, 1): pOut[i] = pA[i] shr count
  return output

func shr_u64v128_sse(a: u64v128, count: int): u64v128 =
  return cast[u64v128](mm_srli_epi64(cast[sse2.M128i](a), count.int32))

let x86_shr_u64v128: proc(a: u64v128, count: int): u64v128 = if sseExists(): shr_u64v128_sse else: shr_u64v128_fallback

func shr_u64v128_neon(a: u64v128, count: int): u64v128 =
  return cast[u64v128](vshlq_n_u64(cast[neon.Uint64x2](a), -count.int32))

let arm_shr_u64v128: proc(a: u64v128, count: int): u64v128 = if neonExists(): shr_u64v128_neon else: shr_u64v128_fallback

func shr_u64v128_lsx(a: u64v128, count: int): u64v128 =
  return cast[u64v128](lsx_vsrli_d(cast[lsx.M128i](a), count.int32))

let la_shr_u64v128: proc(a: u64v128, count: int): u64v128 = if lsxExists(): shr_u64v128_lsx else: shr_u64v128_fallback

template `shr`*(a: u64v128, count: int): u64v128 =
  when defined(amd64) or defined(i386): x86_shr_u64v128(a, count)
  elif defined(arm64): arm_shr_u64v128(a, count)
  elif defined(loongarch64): la_shr_u64v128(a, count)

# ========================
# rotateLeftBits / f32r128
# ========================

func rotateLeftBits_f32r128_fallback(a: f32r128, count: int): f32r128 =
  var output: f32r128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, uint32]](addr a)
  let c = count and 31
  unroll(i, 0, 3): pOut[i] = rotateLeftBits(pA[i], c)
  return output

func rotateLeftBits_f32r128_sse(a: f32r128, count: int): f32r128 =
  when defined(vpermi22w) or neonExists(): return cast[f32r128](mm_rol_epi32(cast[sse2.M128i](a), count.int32))
  else:
    let c = count and 31
    if c == 0: return a
    return cast[f32r128](mm_or_si128(mm_slli_epi32(cast[sse2.M128i](a), c.int32), mm_srli_epi32(cast[sse2.M128i](a), (32 - c).int32)))

let x86_rotateLeftBits_f32r128: proc(a: f32r128, count: int): f32r128 = if sseExists(): rotateLeftBits_f32r128_sse else: rotateLeftBits_f32r128_fallback

func rotateLeftBits_f32r128_neon(a: f32r128, count: int): f32r128 =
  let c = count and 31
  if c == 0: return a
  return cast[f32r128](vorrq_u32(vshlq_n_u32(cast[neon.Uint32x4](a), c.int32), vshlq_n_u32(cast[neon.Uint32x4](a), -(32 - c).int32)))

let arm_rotateLeftBits_f32r128: proc(a: f32r128, count: int): f32r128 = if neonExists(): rotateLeftBits_f32r128_neon else: rotateLeftBits_f32r128_fallback

func rotateLeftBits_f32r128_lsx(a: f32r128, count: int): f32r128 =
  let c = count and 31
  if c == 0: return a
  return cast[f32r128](lsx_vrotri_w(cast[lsx.M128i](a), (32 - c).int32))

let la_rotateLeftBits_f32r128: proc(a: f32r128, count: int): f32r128 = if lsxExists(): rotateLeftBits_f32r128_lsx else: rotateLeftBits_f32r128_fallback

template `rotateLeftBits`*(a: f32r128, count: int): f32r128 =
  when defined(amd64) or defined(i386): x86_rotateLeftBits_f32r128(a, count)
  elif defined(arm64): arm_rotateLeftBits_f32r128(a, count)
  elif defined(loongarch64): la_rotateLeftBits_f32r128(a, count)

# ========================
# rotateLeftBits / f64r128
# ========================

func rotateLeftBits_f64r128_fallback(a: f64r128, count: int): f64r128 =
  var output: f64r128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, uint64]](addr a)
  let c = count and 63
  unroll(i, 0, 1): pOut[i] = rotateLeftBits(pA[i], c)
  return output

func rotateLeftBits_f64r128_sse(a: f64r128, count: int): f64r128 =
  when defined(vpermi22w): return cast[f64r128](mm_rol_epi64(cast[sse2.M128i](a), count.int32))
  else:
    let c = count and 63
    if c == 0: return a
    return cast[f64r128](mm_or_si128(mm_slli_epi64(cast[sse2.M128i](a), c.int32), mm_srli_epi64(cast[sse2.M128i](a), (64 - c).int32)))

let x86_rotateLeftBits_f64r128: proc(a: f64r128, count: int): f64r128 = if sseExists(): rotateLeftBits_f64r128_sse else: rotateLeftBits_f64r128_fallback

func rotateLeftBits_f64r128_neon(a: f64r128, count: int): f64r128 =
  let c = count and 63
  if c == 0: return a
  return cast[f64r128](vorrq_u32(cast[neon.Uint32x4](vshlq_n_u64(cast[neon.Uint64x2](a), c.int32)), cast[neon.Uint32x4](vshlq_n_u64(cast[neon.Uint64x2](a), -(64 - c).int32))))

let arm_rotateLeftBits_f64r128: proc(a: f64r128, count: int): f64r128 = if neonExists(): rotateLeftBits_f64r128_neon else: rotateLeftBits_f64r128_fallback

func rotateLeftBits_f64r128_lsx(a: f64r128, count: int): f64r128 =
  let c = count and 63
  if c == 0: return a
  return cast[f64r128](lsx_vrotri_d(cast[lsx.M128i](a), (64 - c).int32))

let la_rotateLeftBits_f64r128: proc(a: f64r128, count: int): f64r128 = if lsxExists(): rotateLeftBits_f64r128_lsx else: rotateLeftBits_f64r128_fallback

template `rotateLeftBits`*(a: f64r128, count: int): f64r128 =
  when defined(amd64) or defined(i386): x86_rotateLeftBits_f64r128(a, count)
  elif defined(arm64): arm_rotateLeftBits_f64r128(a, count)
  elif defined(loongarch64): la_rotateLeftBits_f64r128(a, count)

# ========================
# rotateLeftBits / i8r128
# ========================

func rotateLeftBits_i8r128_fallback(a: i8r128, count: int): i8r128 =
  var output: i8r128
  let pOut = cast[ptr array[16, uint8]](addr output)
  let pA   = cast[ptr array[16, uint8]](addr a)
  let c = count and 7
  unroll(i, 0, 15): pOut[i] = rotateLeftBits(pA[i], c)
  return cast[i8r128](output)

func rotateLeftBits_i8r128_sse(a: i8r128, count: int): i8r128 =
  let c = count and 7
  if c == 0: return a
  return cast[i8r128](mm_or_si128(mm_and_si128(mm_slli_epi16(cast[sse2.M128i](a), c.int32), mm_set1_epi8(cast[int8](0xFF'u8 shl c))), mm_and_si128(mm_srli_epi16(cast[sse2.M128i](a), (8 - c).int32), mm_set1_epi8(cast[int8](0xFF'u8 shr (8 - c))))))

let x86_rotateLeftBits_i8r128: proc(a: i8r128, count: int): i8r128 = if sseExists(): rotateLeftBits_i8r128_sse else: rotateLeftBits_i8r128_fallback

func rotateLeftBits_i8r128_neon(a: i8r128, count: int): i8r128 =
  let c = count and 7
  if c == 0: return a
  return cast[i8r128](vorrq_u8(vshlq_n_u8(cast[neon.Uint8x16](a), c.int32), vshlq_n_u8(cast[neon.Uint8x16](a), -(8 - c).int32)))

let arm_rotateLeftBits_i8r128: proc(a: i8r128, count: int): i8r128 = if neonExists(): rotateLeftBits_i8r128_neon else: rotateLeftBits_i8r128_fallback

func rotateLeftBits_i8r128_lsx(a: i8r128, count: int): i8r128 =
  let c = count and 7
  if c == 0: return a
  return cast[i8r128](lsx_vrotri_b(cast[lsx.M128i](a), (8 - c).int32))

let la_rotateLeftBits_i8r128: proc(a: i8r128, count: int): i8r128 = if lsxExists(): rotateLeftBits_i8r128_lsx else: rotateLeftBits_i8r128_fallback

template `rotateLeftBits`*(a: i8r128, count: int): i8r128 =
  when defined(amd64) or defined(i386): x86_rotateLeftBits_i8r128(a, count)
  elif defined(arm64): arm_rotateLeftBits_i8r128(a, count)
  elif defined(loongarch64): la_rotateLeftBits_i8r128(a, count)

# ========================
# rotateLeftBits / i16r128
# ========================

func rotateLeftBits_i16r128_fallback(a: i16r128, count: int): i16r128 =
  var output: i16r128
  let pOut = cast[ptr array[8, uint16]](addr output)
  let pA   = cast[ptr array[8, uint16]](addr a)
  let c = count and 15
  unroll(i, 0, 7): pOut[i] = rotateLeftBits(pA[i], c)
  return cast[i16r128](output)

func rotateLeftBits_i16r128_sse(a: i16r128, count: int): i16r128 =
  when defined(vpermi22w): return cast[i16r128](mm_rol_epi16(cast[sse2.M128i](a), count.int32))
  else:
    let c = count and 15
    if c == 0: return a
    return cast[i16r128](mm_or_si128(mm_slli_epi16(cast[sse2.M128i](a), c.int32), mm_srli_epi16(cast[sse2.M128i](a), (16 - c).int32)))

let x86_rotateLeftBits_i16r128: proc(a: i16r128, count: int): i16r128 = if sseExists(): rotateLeftBits_i16r128_sse else: rotateLeftBits_i16r128_fallback

func rotateLeftBits_i16r128_neon(a: i16r128, count: int): i16r128 =
  let c = count and 15
  if c == 0: return a
  return cast[i16r128](vorrq_u16(vshlq_n_u16(cast[neon.Uint16x8](a), c.int32), vshlq_n_u16(cast[neon.Uint16x8](a), -(16 - c).int32)))

let arm_rotateLeftBits_i16r128: proc(a: i16r128, count: int): i16r128 = if neonExists(): rotateLeftBits_i16r128_neon else: rotateLeftBits_i16r128_fallback

func rotateLeftBits_i16r128_lsx(a: i16r128, count: int): i16r128 =
  let c = count and 15
  if c == 0: return a
  return cast[i16r128](lsx_vrotri_h(cast[lsx.M128i](a), (16 - c).int32))

let la_rotateLeftBits_i16r128: proc(a: i16r128, count: int): i16r128 = if lsxExists(): rotateLeftBits_i16r128_lsx else: rotateLeftBits_i16r128_fallback

template `rotateLeftBits`*(a: i16r128, count: int): i16r128 =
  when defined(amd64) or defined(i386): x86_rotateLeftBits_i16r128(a, count)
  elif defined(arm64): arm_rotateLeftBits_i16r128(a, count)
  elif defined(loongarch64): la_rotateLeftBits_i16r128(a, count)

# ========================
# rotateLeftBits / i32r128
# ========================

func rotateLeftBits_i32r128_fallback(a: i32r128, count: int): i32r128 =
  var output: i32r128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, uint32]](addr a)
  let c = count and 31
  unroll(i, 0, 3): pOut[i] = rotateLeftBits(pA[i], c)
  return cast[i32r128](output)

func rotateLeftBits_i32r128_sse(a: i32r128, count: int): i32r128 =
  when defined(vpermi22w): return cast[i32r128](mm_rol_epi32(cast[sse2.M128i](a), count.int32))
  else:
    let c = count and 31
    if c == 0: return a
    return cast[i32r128](mm_or_si128(mm_slli_epi32(cast[sse2.M128i](a), c.int32), mm_srli_epi32(cast[sse2.M128i](a), (32 - c).int32)))

let x86_rotateLeftBits_i32r128: proc(a: i32r128, count: int): i32r128 = if sseExists(): rotateLeftBits_i32r128_sse else: rotateLeftBits_i32r128_fallback

func rotateLeftBits_i32r128_neon(a: i32r128, count: int): i32r128 =
  let c = count and 31
  if c == 0: return a
  return cast[i32r128](vorrq_u32(vshlq_n_u32(cast[neon.Uint32x4](a), c.int32), vshlq_n_u32(cast[neon.Uint32x4](a), -(32 - c).int32)))

let arm_rotateLeftBits_i32r128: proc(a: i32r128, count: int): i32r128 = if neonExists(): rotateLeftBits_i32r128_neon else: rotateLeftBits_i32r128_fallback

func rotateLeftBits_i32r128_lsx(a: i32r128, count: int): i32r128 =
  let c = count and 31
  if c == 0: return a
  return cast[i32r128](lsx_vrotri_w(cast[lsx.M128i](a), (32 - c).int32))

let la_rotateLeftBits_i32r128: proc(a: i32r128, count: int): i32r128 = if lsxExists(): rotateLeftBits_i32r128_lsx else: rotateLeftBits_i32r128_fallback

template `rotateLeftBits`*(a: i32r128, count: int): i32r128 =
  when defined(amd64) or defined(i386): x86_rotateLeftBits_i32r128(a, count)
  elif defined(arm64): arm_rotateLeftBits_i32r128(a, count)
  elif defined(loongarch64): la_rotateLeftBits_i32r128(a, count)

# ========================
# rotateLeftBits / i64r128
# ========================

func rotateLeftBits_i64r128_fallback(a: i64r128, count: int): i64r128 =
  var output: i64r128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, uint64]](addr a)
  let c = count and 63
  unroll(i, 0, 1): pOut[i] = rotateLeftBits(pA[i], c)
  return cast[i64r128](output)

func rotateLeftBits_i64r128_sse(a: i64r128, count: int): i64r128 =
  when defined(vpermi22w): return cast[i64r128](mm_rol_epi64(cast[sse2.M128i](a), count.int32))
  else:
    let c = count and 63
    if c == 0: return a
    return cast[i64r128](mm_or_si128(mm_slli_epi64(cast[sse2.M128i](a), c.int32), mm_srli_epi64(cast[sse2.M128i](a), (64 - c).int32)))

let x86_rotateLeftBits_i64r128: proc(a: i64r128, count: int): i64r128 = if sseExists(): rotateLeftBits_i64r128_sse else: rotateLeftBits_i64r128_fallback

func rotateLeftBits_i64r128_neon(a: i64r128, count: int): i64r128 =
  let c = count and 63
  if c == 0: return a
  return cast[i64r128](vorrq_u32(cast[neon.Uint32x4](vshlq_n_u64(cast[neon.Uint64x2](a), c.int32)), cast[neon.Uint32x4](vshlq_n_u64(cast[neon.Uint64x2](a), -(64 - c).int32))))

let arm_rotateLeftBits_i64r128: proc(a: i64r128, count: int): i64r128 = if neonExists(): rotateLeftBits_i64r128_neon else: rotateLeftBits_i64r128_fallback

func rotateLeftBits_i64r128_lsx(a: i64r128, count: int): i64r128 =
  let c = count and 63
  if c == 0: return a
  return cast[i64r128](lsx_vrotri_d(cast[lsx.M128i](a), (64 - c).int32))

let la_rotateLeftBits_i64r128: proc(a: i64r128, count: int): i64r128 = if lsxExists(): rotateLeftBits_i64r128_lsx else: rotateLeftBits_i64r128_fallback

template `rotateLeftBits`*(a: i64r128, count: int): i64r128 =
  when defined(amd64) or defined(i386): x86_rotateLeftBits_i64r128(a, count)
  elif defined(arm64): arm_rotateLeftBits_i64r128(a, count)
  elif defined(loongarch64): la_rotateLeftBits_i64r128(a, count)

# ========================
# rotateLeftBits / u8r128
# ========================

func rotateLeftBits_u8r128_fallback(a: u8r128, count: int): u8r128 =
  var output: u8r128
  let pOut = cast[ptr array[16, uint8]](addr output)
  let pA   = cast[ptr array[16, uint8]](addr a)
  let c = count and 7
  unroll(i, 0, 15): pOut[i] = rotateLeftBits(pA[i], c)
  return output

func rotateLeftBits_u8r128_sse(a: u8r128, count: int): u8r128 =
  let c = count and 7
  if c == 0: return a
  return cast[u8r128](mm_or_si128(mm_and_si128(mm_slli_epi16(cast[sse2.M128i](a), c.int32), mm_set1_epi8(cast[int8](0xFF'u8 shl c))), mm_and_si128(mm_srli_epi16(cast[sse2.M128i](a), (8 - c).int32), mm_set1_epi8(cast[int8](0xFF'u8 shr (8 - c))))))

let x86_rotateLeftBits_u8r128: proc(a: u8r128, count: int): u8r128 = if sseExists(): rotateLeftBits_u8r128_sse else: rotateLeftBits_u8r128_fallback

func rotateLeftBits_u8r128_neon(a: u8r128, count: int): u8r128 =
  let c = count and 7
  if c == 0: return a
  return cast[u8r128](vorrq_u8(vshlq_n_u8(cast[neon.Uint8x16](a), c.int32), vshlq_n_u8(cast[neon.Uint8x16](a), -(8 - c).int32)))

let arm_rotateLeftBits_u8r128: proc(a: u8r128, count: int): u8r128 = if neonExists(): rotateLeftBits_u8r128_neon else: rotateLeftBits_u8r128_fallback

func rotateLeftBits_u8r128_lsx(a: u8r128, count: int): u8r128 =
  let c = count and 7
  if c == 0: return a
  return cast[u8r128](lsx_vrotri_b(cast[lsx.M128i](a), (8 - c).int32))

let la_rotateLeftBits_u8r128: proc(a: u8r128, count: int): u8r128 = if lsxExists(): rotateLeftBits_u8r128_lsx else: rotateLeftBits_u8r128_fallback

template `rotateLeftBits`*(a: u8r128, count: int): u8r128 =
  when defined(amd64) or defined(i386): x86_rotateLeftBits_u8r128(a, count)
  elif defined(arm64): arm_rotateLeftBits_u8r128(a, count)
  elif defined(loongarch64): la_rotateLeftBits_u8r128(a, count)

# ========================
# rotateLeftBits / u16r128
# ========================

func rotateLeftBits_u16r128_fallback(a: u16r128, count: int): u16r128 =
  var output: u16r128
  let pOut = cast[ptr array[8, uint16]](addr output)
  let pA   = cast[ptr array[8, uint16]](addr a)
  let c = count and 15
  unroll(i, 0, 7): pOut[i] = rotateLeftBits(pA[i], c)
  return output

func rotateLeftBits_u16r128_sse(a: u16r128, count: int): u16r128 =
  when defined(vpermi22w): return cast[u16r128](mm_rol_epi16(cast[sse2.M128i](a), count.int32))
  else:
    let c = count and 15
    if c == 0: return a
    return cast[u16r128](mm_or_si128(mm_slli_epi16(cast[sse2.M128i](a), c.int32), mm_srli_epi16(cast[sse2.M128i](a), (16 - c).int32)))

let x86_rotateLeftBits_u16r128: proc(a: u16r128, count: int): u16r128 = if sseExists(): rotateLeftBits_u16r128_sse else: rotateLeftBits_u16r128_fallback

func rotateLeftBits_u16r128_neon(a: u16r128, count: int): u16r128 =
  let c = count and 15
  if c == 0: return a
  return cast[u16r128](vorrq_u16(vshlq_n_u16(cast[neon.Uint16x8](a), c.int32), vshlq_n_u16(cast[neon.Uint16x8](a), -(16 - c).int32)))

let arm_rotateLeftBits_u16r128: proc(a: u16r128, count: int): u16r128 = if neonExists(): rotateLeftBits_u16r128_neon else: rotateLeftBits_u16r128_fallback

func rotateLeftBits_u16r128_lsx(a: u16r128, count: int): u16r128 =
  let c = count and 15
  if c == 0: return a
  return cast[u16r128](lsx_vrotri_h(cast[lsx.M128i](a), (16 - c).int32))

let la_rotateLeftBits_u16r128: proc(a: u16r128, count: int): u16r128 = if lsxExists(): rotateLeftBits_u16r128_lsx else: rotateLeftBits_u16r128_fallback

template `rotateLeftBits`*(a: u16r128, count: int): u16r128 =
  when defined(amd64) or defined(i386): x86_rotateLeftBits_u16r128(a, count)
  elif defined(arm64): arm_rotateLeftBits_u16r128(a, count)
  elif defined(loongarch64): la_rotateLeftBits_u16r128(a, count)

# ========================
# rotateLeftBits / u32r128
# ========================

func rotateLeftBits_u32r128_fallback(a: u32r128, count: int): u32r128 =
  var output: u32r128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, uint32]](addr a)
  let c = count and 31
  unroll(i, 0, 3): pOut[i] = rotateLeftBits(pA[i], c)
  return output

func rotateLeftBits_u32r128_sse(a: u32r128, count: int): u32r128 =
  when defined(vpermi22w): return cast[u32r128](mm_rol_epi32(cast[sse2.M128i](a), count.int32))
  else:
    let c = count and 31
    if c == 0: return a
    return cast[u32r128](mm_or_si128(mm_slli_epi32(cast[sse2.M128i](a), c.int32), mm_srli_epi32(cast[sse2.M128i](a), (32 - c).int32)))

let x86_rotateLeftBits_u32r128: proc(a: u32r128, count: int): u32r128 = if sseExists(): rotateLeftBits_u32r128_sse else: rotateLeftBits_u32r128_fallback

func rotateLeftBits_u32r128_neon(a: u32r128, count: int): u32r128 =
  let c = count and 31
  if c == 0: return a
  return cast[u32r128](vorrq_u32(vshlq_n_u32(cast[neon.Uint32x4](a), c.int32), vshlq_n_u32(cast[neon.Uint32x4](a), -(32 - c).int32)))

let arm_rotateLeftBits_u32r128: proc(a: u32r128, count: int): u32r128 = if neonExists(): rotateLeftBits_u32r128_neon else: rotateLeftBits_u32r128_fallback

func rotateLeftBits_u32r128_lsx(a: u32r128, count: int): u32r128 =
  let c = count and 31
  if c == 0: return a
  return cast[u32r128](lsx_vrotri_w(cast[lsx.M128i](a), (32 - c).int32))

let la_rotateLeftBits_u32r128: proc(a: u32r128, count: int): u32r128 = if lsxExists(): rotateLeftBits_u32r128_lsx else: rotateLeftBits_u32r128_fallback

template `rotateLeftBits`*(a: u32r128, count: int): u32r128 =
  when defined(amd64) or defined(i386): x86_rotateLeftBits_u32r128(a, count)
  elif defined(arm64): arm_rotateLeftBits_u32r128(a, count)
  elif defined(loongarch64): la_rotateLeftBits_u32r128(a, count)

# ========================
# rotateLeftBits / u64r128
# ========================

func rotateLeftBits_u64r128_fallback(a: u64r128, count: int): u64r128 =
  var output: u64r128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, uint64]](addr a)
  let c = count and 63
  unroll(i, 0, 1): pOut[i] = rotateLeftBits(pA[i], c)
  return output

func rotateLeftBits_u64r128_sse(a: u64r128, count: int): u64r128 =
  when defined(vpermi22w): return cast[u64r128](mm_rol_epi64(cast[sse2.M128i](a), count.int32))
  else:
    let c = count and 63
    if c == 0: return a
    return cast[u64r128](mm_or_si128(mm_slli_epi64(cast[sse2.M128i](a), c.int32), mm_srli_epi64(cast[sse2.M128i](a), (64 - c).int32)))

let x86_rotateLeftBits_u64r128: proc(a: u64r128, count: int): u64r128 = if sseExists(): rotateLeftBits_u64r128_sse else: rotateLeftBits_u64r128_fallback

func rotateLeftBits_u64r128_neon(a: u64r128, count: int): u64r128 =
  let c = count and 63
  if c == 0: return a
  return cast[u64r128](vorrq_u32(cast[neon.Uint32x4](vshlq_n_u64(cast[neon.Uint64x2](a), c.int32)), cast[neon.Uint32x4](vshlq_n_u64(cast[neon.Uint64x2](a), -(64 - c).int32))))

let arm_rotateLeftBits_u64r128: proc(a: u64r128, count: int): u64r128 = if neonExists(): rotateLeftBits_u64r128_neon else: rotateLeftBits_u64r128_fallback

func rotateLeftBits_u64r128_lsx(a: u64r128, count: int): u64r128 =
  let c = count and 63
  if c == 0: return a
  return cast[u64r128](lsx_vrotri_d(cast[lsx.M128i](a), (64 - c).int32))

let la_rotateLeftBits_u64r128: proc(a: u64r128, count: int): u64r128 = if lsxExists(): rotateLeftBits_u64r128_lsx else: rotateLeftBits_u64r128_fallback

template `rotateLeftBits`*(a: u64r128, count: int): u64r128 =
  when defined(amd64) or defined(i386): x86_rotateLeftBits_u64r128(a, count)
  elif defined(arm64): arm_rotateLeftBits_u64r128(a, count)
  elif defined(loongarch64): la_rotateLeftBits_u64r128(a, count)

# ========================
# rotateLeftBits / f32v128
# ========================

func rotateLeftBits_f32v128_fallback(a: f32v128, count: int): f32v128 =
  var output: f32v128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, uint32]](addr a)
  let c = count and 31
  unroll(i, 0, 3): pOut[i] = rotateLeftBits(pA[i], c)
  return output

func rotateLeftBits_f32v128_sse(a: f32v128, count: int): f32v128 =
  when defined(vpermi22w) or neonExists(): return cast[f32v128](mm_rol_epi32(cast[sse2.M128i](a), count.int32))
  else:
    let c = count and 31
    if c == 0: return a
    return cast[f32v128](mm_or_si128(mm_slli_epi32(cast[sse2.M128i](a), c.int32), mm_srli_epi32(cast[sse2.M128i](a), (32 - c).int32)))

let x86_rotateLeftBits_f32v128: proc(a: f32v128, count: int): f32v128 = if sseExists(): rotateLeftBits_f32v128_sse else: rotateLeftBits_f32v128_fallback

func rotateLeftBits_f32v128_neon(a: f32v128, count: int): f32v128 =
  let c = count and 31
  if c == 0: return a
  return cast[f32v128](vorrq_u32(vshlq_n_u32(cast[neon.Uint32x4](a), c.int32), vshlq_n_u32(cast[neon.Uint32x4](a), -(32 - c).int32)))

let arm_rotateLeftBits_f32v128: proc(a: f32v128, count: int): f32v128 = if neonExists(): rotateLeftBits_f32v128_neon else: rotateLeftBits_f32v128_fallback

func rotateLeftBits_f32v128_lsx(a: f32v128, count: int): f32v128 =
  let c = count and 31
  if c == 0: return a
  return cast[f32v128](lsx_vrotri_w(cast[lsx.M128i](a), (32 - c).int32))

let la_rotateLeftBits_f32v128: proc(a: f32v128, count: int): f32v128 = if lsxExists(): rotateLeftBits_f32v128_lsx else: rotateLeftBits_f32v128_fallback

template `rotateLeftBits`*(a: f32v128, count: int): f32v128 =
  when defined(amd64) or defined(i386): x86_rotateLeftBits_f32v128(a, count)
  elif defined(arm64): arm_rotateLeftBits_f32v128(a, count)
  elif defined(loongarch64): la_rotateLeftBits_f32v128(a, count)

# ========================
# rotateLeftBits / f64v128
# ========================

func rotateLeftBits_f64v128_fallback(a: f64v128, count: int): f64v128 =
  var output: f64v128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, uint64]](addr a)
  let c = count and 63
  unroll(i, 0, 1): pOut[i] = rotateLeftBits(pA[i], c)
  return output

func rotateLeftBits_f64v128_sse(a: f64v128, count: int): f64v128 =
  when defined(vpermi22w): return cast[f64v128](mm_rol_epi64(cast[sse2.M128i](a), count.int32))
  else:
    let c = count and 63
    if c == 0: return a
    return cast[f64v128](mm_or_si128(mm_slli_epi64(cast[sse2.M128i](a), c.int32), mm_srli_epi64(cast[sse2.M128i](a), (64 - c).int32)))

let x86_rotateLeftBits_f64v128: proc(a: f64v128, count: int): f64v128 = if sseExists(): rotateLeftBits_f64v128_sse else: rotateLeftBits_f64v128_fallback

func rotateLeftBits_f64v128_neon(a: f64v128, count: int): f64v128 =
  let c = count and 63
  if c == 0: return a
  return cast[f64v128](vorrq_u32(cast[neon.Uint32x4](vshlq_n_u64(cast[neon.Uint64x2](a), c.int32)), cast[neon.Uint32x4](vshlq_n_u64(cast[neon.Uint64x2](a), -(64 - c).int32))))

let arm_rotateLeftBits_f64v128: proc(a: f64v128, count: int): f64v128 = if neonExists(): rotateLeftBits_f64v128_neon else: rotateLeftBits_f64v128_fallback

func rotateLeftBits_f64v128_lsx(a: f64v128, count: int): f64v128 =
  let c = count and 63
  if c == 0: return a
  return cast[f64v128](lsx_vrotri_d(cast[lsx.M128i](a), (64 - c).int32))


let la_rotateLeftBits_f64v128: proc(a: f64v128, count: int): f64v128 = if lsxExists(): rotateLeftBits_f64v128_lsx else: rotateLeftBits_f64v128_fallback

template `rotateLeftBits`*(a: f64v128, count: int): f64v128 =
  when defined(amd64) or defined(i386): x86_rotateLeftBits_f64v128(a, count)
  elif defined(arm64): arm_rotateLeftBits_f64v128(a, count)
  elif defined(loongarch64): la_rotateLeftBits_f64v128(a, count)

# ========================
# rotateLeftBits / i8v128
# ========================

func rotateLeftBits_i8v128_fallback(a: i8v128, count: int): i8v128 =
  var output: i8v128
  let pOut = cast[ptr array[16, uint8]](addr output)
  let pA   = cast[ptr array[16, uint8]](addr a)
  let c = count and 7
  unroll(i, 0, 15): pOut[i] = rotateLeftBits(pA[i], c)
  return cast[i8v128](output)

func rotateLeftBits_i8v128_sse(a: i8v128, count: int): i8v128 =
  let c = count and 7
  if c == 0: return a
  return cast[i8v128](mm_or_si128(mm_and_si128(mm_slli_epi16(cast[sse2.M128i](a), c.int32), mm_set1_epi8(cast[int8](0xFF'u8 shl c))), mm_and_si128(mm_srli_epi16(cast[sse2.M128i](a), (8 - c).int32), mm_set1_epi8(cast[int8](0xFF'u8 shr (8 - c))))))

let x86_rotateLeftBits_i8v128: proc(a: i8v128, count: int): i8v128 = if sseExists(): rotateLeftBits_i8v128_sse else: rotateLeftBits_i8v128_fallback

func rotateLeftBits_i8v128_neon(a: i8v128, count: int): i8v128 =
  let c = count and 7
  if c == 0: return a
  return cast[i8v128](vorrq_u8(vshlq_n_u8(cast[neon.Uint8x16](a), c.int32), vshlq_n_u8(cast[neon.Uint8x16](a), -(8 - c).int32)))

let arm_rotateLeftBits_i8v128: proc(a: i8v128, count: int): i8v128 = if neonExists(): rotateLeftBits_i8v128_neon else: rotateLeftBits_i8v128_fallback

func rotateLeftBits_i8v128_lsx(a: i8v128, count: int): i8v128 =
  let c = count and 7
  if c == 0: return a
  return cast[i8v128](lsx_vrotri_b(cast[lsx.M128i](a), (8 - c).int32))

let la_rotateLeftBits_i8v128: proc(a: i8v128, count: int): i8v128 = if lsxExists(): rotateLeftBits_i8v128_lsx else: rotateLeftBits_i8v128_fallback

template `rotateLeftBits`*(a: i8v128, count: int): i8v128 =
  when defined(amd64) or defined(i386): x86_rotateLeftBits_i8v128(a, count)
  elif defined(arm64): arm_rotateLeftBits_i8v128(a, count)
  elif defined(loongarch64): la_rotateLeftBits_i8v128(a, count)

# ========================
# rotateLeftBits / i16v128
# ========================

func rotateLeftBits_i16v128_fallback(a: i16v128, count: int): i16v128 =
  var output: i16v128
  let pOut = cast[ptr array[8, uint16]](addr output)
  let pA   = cast[ptr array[8, uint16]](addr a)
  let c = count and 15
  unroll(i, 0, 7): pOut[i] = rotateLeftBits(pA[i], c)
  return cast[i16v128](output)

func rotateLeftBits_i16v128_sse(a: i16v128, count: int): i16v128 =
  when defined(vpermi22w): return cast[i16v128](mm_rol_epi16(cast[sse2.M128i](a), count.int32))
  else:
    let c = count and 15
    if c == 0: return a
    return cast[i16v128](mm_or_si128(mm_slli_epi16(cast[sse2.M128i](a), c.int32), mm_srli_epi16(cast[sse2.M128i](a), (16 - c).int32)))

let x86_rotateLeftBits_i16v128: proc(a: i16v128, count: int): i16v128 = if sseExists(): rotateLeftBits_i16v128_sse else: rotateLeftBits_i16v128_fallback

func rotateLeftBits_i16v128_neon(a: i16v128, count: int): i16v128 =
  let c = count and 15
  if c == 0: return a
  return cast[i16v128](vorrq_u16(vshlq_n_u16(cast[neon.Uint16x8](a), c.int32), vshlq_n_u16(cast[neon.Uint16x8](a), -(16 - c).int32)))

let arm_rotateLeftBits_i16v128: proc(a: i16v128, count: int): i16v128 = if neonExists(): rotateLeftBits_i16v128_neon else: rotateLeftBits_i16v128_fallback

func rotateLeftBits_i16v128_lsx(a: i16v128, count: int): i16v128 =
  let c = count and 15
  if c == 0: return a
  return cast[i16v128](lsx_vrotri_h(cast[lsx.M128i](a), (16 - c).int32))

let la_rotateLeftBits_i16v128: proc(a: i16v128, count: int): i16v128 = if lsxExists(): rotateLeftBits_i16v128_lsx else: rotateLeftBits_i16v128_fallback

template `rotateLeftBits`*(a: i16v128, count: int): i16v128 =
  when defined(amd64) or defined(i386): x86_rotateLeftBits_i16v128(a, count)
  elif defined(arm64): arm_rotateLeftBits_i16v128(a, count)
  elif defined(loongarch64): la_rotateLeftBits_i16v128(a, count)

# ========================
# rotateLeftBits / i32v128
# ========================

func rotateLeftBits_i32v128_fallback(a: i32v128, count: int): i32v128 =
  var output: i32v128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, uint32]](addr a)
  let c = count and 31
  unroll(i, 0, 3): pOut[i] = rotateLeftBits(pA[i], c)
  return cast[i32v128](output)

func rotateLeftBits_i32v128_sse(a: i32v128, count: int): i32v128 =
  when defined(vpermi22w): return cast[i32v128](mm_rol_epi32(cast[sse2.M128i](a), count.int32))
  else:
    let c = count and 31
    if c == 0: return a
    return cast[i32v128](mm_or_si128(mm_slli_epi32(cast[sse2.M128i](a), c.int32), mm_srli_epi32(cast[sse2.M128i](a), (32 - c).int32)))

let x86_rotateLeftBits_i32v128: proc(a: i32v128, count: int): i32v128 = if sseExists(): rotateLeftBits_i32v128_sse else: rotateLeftBits_i32v128_fallback

func rotateLeftBits_i32v128_neon(a: i32v128, count: int): i32v128 =
  let c = count and 31
  if c == 0: return a
  return cast[i32v128](vorrq_u32(vshlq_n_u32(cast[neon.Uint32x4](a), c.int32), vshlq_n_u32(cast[neon.Uint32x4](a), -(32 - c).int32)))

let arm_rotateLeftBits_i32v128: proc(a: i32v128, count: int): i32v128 = if neonExists(): rotateLeftBits_i32v128_neon else: rotateLeftBits_i32v128_fallback

func rotateLeftBits_i32v128_lsx(a: i32v128, count: int): i32v128 =
  let c = count and 31
  if c == 0: return a
  return cast[i32v128](lsx_vrotri_w(cast[lsx.M128i](a), (32 - c).int32))

let la_rotateLeftBits_i32v128: proc(a: i32v128, count: int): i32v128 = if lsxExists(): rotateLeftBits_i32v128_lsx else: rotateLeftBits_i32v128_fallback

template `rotateLeftBits`*(a: i32v128, count: int): i32v128 =
  when defined(amd64) or defined(i386): x86_rotateLeftBits_i32v128(a, count)
  elif defined(arm64): arm_rotateLeftBits_i32v128(a, count)
  elif defined(loongarch64): la_rotateLeftBits_i32v128(a, count)

# ========================
# rotateLeftBits / i64v128
# ========================

func rotateLeftBits_i64v128_fallback(a: i64v128, count: int): i64v128 =
  var output: i64v128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, uint64]](addr a)
  let c = count and 63
  unroll(i, 0, 1): pOut[i] = rotateLeftBits(pA[i], c)
  return cast[i64v128](output)

func rotateLeftBits_i64v128_sse(a: i64v128, count: int): i64v128 =
  when defined(vpermi22w): return cast[i64v128](mm_rol_epi64(cast[sse2.M128i](a), count.int32))
  else:
    let c = count and 63
    if c == 0: return a
    return cast[i64v128](mm_or_si128(mm_slli_epi64(cast[sse2.M128i](a), c.int32), mm_srli_epi64(cast[sse2.M128i](a), (64 - c).int32)))

let x86_rotateLeftBits_i64v128: proc(a: i64v128, count: int): i64v128 = if sseExists(): rotateLeftBits_i64v128_sse else: rotateLeftBits_i64v128_fallback

func rotateLeftBits_i64v128_neon(a: i64v128, count: int): i64v128 =
  let c = count and 63
  if c == 0: return a
  return cast[i64v128](vorrq_u32(cast[neon.Uint32x4](vshlq_n_u64(cast[neon.Uint64x2](a), c.int32)), cast[neon.Uint32x4](vshlq_n_u64(cast[neon.Uint64x2](a), -(64 - c).int32))))

let arm_rotateLeftBits_i64v128: proc(a: i64v128, count: int): i64v128 = if neonExists(): rotateLeftBits_i64v128_neon else: rotateLeftBits_i64v128_fallback

func rotateLeftBits_i64v128_lsx(a: i64v128, count: int): i64v128 =
  let c = count and 63
  if c == 0: return a
  return cast[i64v128](lsx_vrotri_d(cast[lsx.M128i](a), (64 - c).int32))

let la_rotateLeftBits_i64v128: proc(a: i64v128, count: int): i64v128 = if lsxExists(): rotateLeftBits_i64v128_lsx else: rotateLeftBits_i64v128_fallback

template `rotateLeftBits`*(a: i64v128, count: int): i64v128 =
  when defined(amd64) or defined(i386): x86_rotateLeftBits_i64v128(a, count)
  elif defined(arm64): arm_rotateLeftBits_i64v128(a, count)
  elif defined(loongarch64): la_rotateLeftBits_i64v128(a, count)

# ========================
# rotateLeftBits / u8v128
# ========================

func rotateLeftBits_u8v128_fallback(a: u8v128, count: int): u8v128 =
  var output: u8v128
  let pOut = cast[ptr array[16, uint8]](addr output)
  let pA   = cast[ptr array[16, uint8]](addr a)
  let c = count and 7
  unroll(i, 0, 15): pOut[i] = rotateLeftBits(pA[i], c)
  return output

func rotateLeftBits_u8v128_sse(a: u8v128, count: int): u8v128 =
  let c = count and 7
  if c == 0: return a
  return cast[u8v128](mm_or_si128(mm_and_si128(mm_slli_epi16(cast[sse2.M128i](a), c.int32), mm_set1_epi8(cast[int8](0xFF'u8 shl c))), mm_and_si128(mm_srli_epi16(cast[sse2.M128i](a), (8 - c).int32), mm_set1_epi8(cast[int8](0xFF'u8 shr (8 - c))))))

let x86_rotateLeftBits_u8v128: proc(a: u8v128, count: int): u8v128 = if sseExists(): rotateLeftBits_u8v128_sse else: rotateLeftBits_u8v128_fallback

func rotateLeftBits_u8v128_neon(a: u8v128, count: int): u8v128 =
  let c = count and 7
  if c == 0: return a
  return cast[u8v128](vorrq_u8(vshlq_n_u8(cast[neon.Uint8x16](a), c.int32), vshlq_n_u8(cast[neon.Uint8x16](a), -(8 - c).int32)))

let arm_rotateLeftBits_u8v128: proc(a: u8v128, count: int): u8v128 = if neonExists(): rotateLeftBits_u8v128_neon else: rotateLeftBits_u8v128_fallback

func rotateLeftBits_u8v128_lsx(a: u8v128, count: int): u8v128 =
  let c = count and 7
  if c == 0: return a
  return cast[u8v128](lsx_vrotri_b(cast[lsx.M128i](a), (8 - c).int32))

let la_rotateLeftBits_u8v128: proc(a: u8v128, count: int): u8v128 = if lsxExists(): rotateLeftBits_u8v128_lsx else: rotateLeftBits_u8v128_fallback

template `rotateLeftBits`*(a: u8v128, count: int): u8v128 =
  when defined(amd64) or defined(i386): x86_rotateLeftBits_u8v128(a, count)
  elif defined(arm64): arm_rotateLeftBits_u8v128(a, count)
  elif defined(loongarch64): la_rotateLeftBits_u8v128(a, count)

# ========================
# rotateLeftBits / u16v128
# ========================

func rotateLeftBits_u16v128_fallback(a: u16v128, count: int): u16v128 =
  var output: u16v128
  let pOut = cast[ptr array[8, uint16]](addr output)
  let pA   = cast[ptr array[8, uint16]](addr a)
  let c = count and 15
  unroll(i, 0, 7): pOut[i] = rotateLeftBits(pA[i], c)
  return output

func rotateLeftBits_u16v128_sse(a: u16v128, count: int): u16v128 =
  when defined(vpermi22w): return cast[u16v128](mm_rol_epi16(cast[sse2.M128i](a), count.int32))
  else:
    let c = count and 15
    if c == 0: return a
    return cast[u16v128](mm_or_si128(mm_slli_epi16(cast[sse2.M128i](a), c.int32), mm_srli_epi16(cast[sse2.M128i](a), (16 - c).int32)))

let x86_rotateLeftBits_u16v128: proc(a: u16v128, count: int): u16v128 = if sseExists(): rotateLeftBits_u16v128_sse else: rotateLeftBits_u16v128_fallback

func rotateLeftBits_u16v128_neon(a: u16v128, count: int): u16v128 =
  let c = count and 15
  if c == 0: return a
  return cast[u16v128](vorrq_u16(vshlq_n_u16(cast[neon.Uint16x8](a), c.int32), vshlq_n_u16(cast[neon.Uint16x8](a), -(16 - c).int32)))

let arm_rotateLeftBits_u16v128: proc(a: u16v128, count: int): u16v128 = if neonExists(): rotateLeftBits_u16v128_neon else: rotateLeftBits_u16v128_fallback

func rotateLeftBits_u16v128_lsx(a: u16v128, count: int): u16v128 =
  let c = count and 15
  if c == 0: return a
  return cast[u16v128](lsx_vrotri_h(cast[lsx.M128i](a), (16 - c).int32))

let la_rotateLeftBits_u16v128: proc(a: u16v128, count: int): u16v128 = if lsxExists(): rotateLeftBits_u16v128_lsx else: rotateLeftBits_u16v128_fallback

template `rotateLeftBits`*(a: u16v128, count: int): u16v128 =
  when defined(amd64) or defined(i386): x86_rotateLeftBits_u16v128(a, count)
  elif defined(arm64): arm_rotateLeftBits_u16v128(a, count)
  elif defined(loongarch64): la_rotateLeftBits_u16v128(a, count)

# ========================
# rotateLeftBits / u32v128
# ========================

func rotateLeftBits_u32v128_fallback(a: u32v128, count: int): u32v128 =
  var output: u32v128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, uint32]](addr a)
  let c = count and 31
  unroll(i, 0, 3): pOut[i] = rotateLeftBits(pA[i], c)
  return output

func rotateLeftBits_u32v128_sse(a: u32v128, count: int): u32v128 =
  when defined(vpermi22w): return cast[u32v128](mm_rol_epi32(cast[sse2.M128i](a), count.int32))
  else:
    let c = count and 31
    if c == 0: return a
    return cast[u32v128](mm_or_si128(mm_slli_epi32(cast[sse2.M128i](a), c.int32), mm_srli_epi32(cast[sse2.M128i](a), (32 - c).int32)))

let x86_rotateLeftBits_u32v128: proc(a: u32v128, count: int): u32v128 = if sseExists(): rotateLeftBits_u32v128_sse else: rotateLeftBits_u32v128_fallback

func rotateLeftBits_u32v128_neon(a: u32v128, count: int): u32v128 =
  let c = count and 31
  if c == 0: return a
  return cast[u32v128](vorrq_u32(vshlq_n_u32(cast[neon.Uint32x4](a), c.int32), vshlq_n_u32(cast[neon.Uint32x4](a), -(32 - c).int32)))

let arm_rotateLeftBits_u32v128: proc(a: u32v128, count: int): u32v128 = if neonExists(): rotateLeftBits_u32v128_neon else: rotateLeftBits_u32v128_fallback

func rotateLeftBits_u32v128_lsx(a: u32v128, count: int): u32v128 =
  let c = count and 31
  if c == 0: return a
  return cast[u32v128](lsx_vrotri_w(cast[lsx.M128i](a), (32 - c).int32))

let la_rotateLeftBits_u32v128: proc(a: u32v128, count: int): u32v128 = if lsxExists(): rotateLeftBits_u32v128_lsx else: rotateLeftBits_u32v128_fallback

template `rotateLeftBits`*(a: u32v128, count: int): u32v128 =
  when defined(amd64) or defined(i386): x86_rotateLeftBits_u32v128(a, count)
  elif defined(arm64): arm_rotateLeftBits_u32v128(a, count)
  elif defined(loongarch64): la_rotateLeftBits_u32v128(a, count)

# ========================
# rotateLeftBits / u64v128
# ========================

func rotateLeftBits_u64v128_fallback(a: u64v128, count: int): u64v128 =
  var output: u64v128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, uint64]](addr a)
  let c = count and 63
  unroll(i, 0, 1): pOut[i] = rotateLeftBits(pA[i], c)
  return output

func rotateLeftBits_u64v128_sse(a: u64v128, count: int): u64v128 =
  when defined(vpermi22w): return cast[u64v128](mm_rol_epi64(cast[sse2.M128i](a), count.int32))
  else:
    let c = count and 63
    if c == 0: return a
    return cast[u64v128](mm_or_si128(mm_slli_epi64(cast[sse2.M128i](a), c.int32), mm_srli_epi64(cast[sse2.M128i](a), (64 - c).int32)))

let x86_rotateLeftBits_u64v128: proc(a: u64v128, count: int): u64v128 = if sseExists(): rotateLeftBits_u64v128_sse else: rotateLeftBits_u64v128_fallback

func rotateLeftBits_u64v128_neon(a: u64v128, count: int): u64v128 =
  let c = count and 63
  if c == 0: return a
  return cast[u64v128](vorrq_u32(cast[neon.Uint32x4](vshlq_n_u64(cast[neon.Uint64x2](a), c.int32)), cast[neon.Uint32x4](vshlq_n_u64(cast[neon.Uint64x2](a), -(64 - c).int32))))

let arm_rotateLeftBits_u64v128: proc(a: u64v128, count: int): u64v128 = if neonExists(): rotateLeftBits_u64v128_neon else: rotateLeftBits_u64v128_fallback

func rotateLeftBits_u64v128_lsx(a: u64v128, count: int): u64v128 =
  let c = count and 63
  if c == 0: return a
  return cast[u64v128](lsx_vrotri_d(cast[lsx.M128i](a), (64 - c).int32))

let la_rotateLeftBits_u64v128: proc(a: u64v128, count: int): u64v128 = if lsxExists(): rotateLeftBits_u64v128_lsx else: rotateLeftBits_u64v128_fallback

template `rotateLeftBits`*(a: u64v128, count: int): u64v128 =
  when defined(amd64) or defined(i386): x86_rotateLeftBits_u64v128(a, count)
  elif defined(arm64): arm_rotateLeftBits_u64v128(a, count)
  elif defined(loongarch64): la_rotateLeftBits_u64v128(a, count)

# ========================
# rotateRightBits / f32r128
# ========================

func rotateRightBits_f32r128_fallback(a: f32r128, count: int): f32r128 =
  var output: f32r128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, uint32]](addr a)
  let c = count and 31
  unroll(i, 0, 3): pOut[i] = rotateRightBits(pA[i], c)
  return output

func rotateRightBits_f32r128_sse(a: f32r128, count: int): f32r128 =
  let c = count and 31
  if c == 0: return a
  return cast[f32r128](mm_or_si128(mm_srli_epi32(cast[sse2.M128i](a), c.int32), mm_slli_epi32(cast[sse2.M128i](a), (32 - c).int32)))

let x86_rotateRightBits_f32r128: proc(a: f32r128, count: int): f32r128 = if sseExists(): rotateRightBits_f32r128_sse else: rotateRightBits_f32r128_fallback

func rotateRightBits_f32r128_neon(a: f32r128, count: int): f32r128 =
  let c = count and 31
  if c == 0: return a
  return cast[f32r128](vorrq_u32(vshlq_n_u32(cast[neon.Uint32x4](a), -c.int32), vshlq_n_u32(cast[neon.Uint32x4](a), (32 - c).int32)))

let arm_rotateRightBits_f32r128: proc(a: f32r128, count: int): f32r128 = if neonExists(): rotateRightBits_f32r128_neon else: rotateRightBits_f32r128_fallback

func rotateRightBits_f32r128_lsx(a: f32r128, count: int): f32r128 =
  return cast[f32r128](lsx_vrotri_w(cast[lsx.M128i](a), (count and 31).int32))

let la_rotateRightBits_f32r128: proc(a: f32r128, count: int): f32r128 = if lsxExists(): rotateRightBits_f32r128_lsx else: rotateRightBits_f32r128_fallback

template `rotateRightBits`*(a: f32r128, count: int): f32r128 =
  when defined(amd64) or defined(i386): x86_rotateRightBits_f32r128(a, count)
  elif defined(arm64): arm_rotateRightBits_f32r128(a, count)
  elif defined(loongarch64): la_rotateRightBits_f32r128(a, count)

# ========================
# rotateRightBits / f64r128
# ========================

func rotateRightBits_f64r128_fallback(a: f64r128, count: int): f64r128 =
  var output: f64r128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, uint64]](addr a)
  let c = count and 63
  unroll(i, 0, 1): pOut[i] = rotateRightBits(pA[i], c)
  return output

func rotateRightBits_f64r128_sse(a: f64r128, count: int): f64r128 =
  let c = count and 63
  if c == 0: return a
  return cast[f64r128](mm_or_si128(mm_srli_epi64(cast[sse2.M128i](a), c.int32), mm_slli_epi64(cast[sse2.M128i](a), (64 - c).int32)))

let x86_rotateRightBits_f64r128: proc(a: f64r128, count: int): f64r128 = if sseExists(): rotateRightBits_f64r128_sse else: rotateRightBits_f64r128_fallback

func rotateRightBits_f64r128_neon(a: f64r128, count: int): f64r128 =
  let c = count and 63
  if c == 0: return a
  return cast[f64r128](vorrq_u32(cast[neon.Uint32x4](vshlq_n_u64(cast[neon.Uint64x2](a), -c.int32)), cast[neon.Uint32x4](vshlq_n_u64(cast[neon.Uint64x2](a), (64 - c).int32))))

let arm_rotateRightBits_f64r128: proc(a: f64r128, count: int): f64r128 = if neonExists(): rotateRightBits_f64r128_neon else: rotateRightBits_f64r128_fallback

func rotateRightBits_f64r128_lsx(a: f64r128, count: int): f64r128 =
  return cast[f64r128](lsx_vrotri_d(cast[lsx.M128i](a), (count and 63).int32))

let la_rotateRightBits_f64r128: proc(a: f64r128, count: int): f64r128 = if lsxExists(): rotateRightBits_f64r128_lsx else: rotateRightBits_f64r128_fallback

template `rotateRightBits`*(a: f64r128, count: int): f64r128 =
  when defined(amd64) or defined(i386): x86_rotateRightBits_f64r128(a, count)
  elif defined(arm64): arm_rotateRightBits_f64r128(a, count)
  elif defined(loongarch64): la_rotateRightBits_f64r128(a, count)

# ========================
# rotateRightBits / i8r128
# ========================

func rotateRightBits_i8r128_fallback(a: i8r128, count: int): i8r128 =
  var output: i8r128
  let pOut = cast[ptr array[16, uint8]](addr output)
  let pA   = cast[ptr array[16, uint8]](addr a)
  let c = count and 7
  unroll(i, 0, 15): pOut[i] = rotateRightBits(pA[i], c)
  return cast[i8r128](output)

func rotateRightBits_i8r128_sse(a: i8r128, count: int): i8r128 =
  let c = count and 7
  if c == 0: return a
  return cast[i8r128](mm_or_si128(mm_and_si128(mm_srli_epi16(cast[sse2.M128i](a), c.int32), mm_set1_epi8(cast[int8](0xFF'u8 shr c))), mm_and_si128(mm_slli_epi16(cast[sse2.M128i](a), (8 - c).int32), mm_set1_epi8(cast[int8](0xFF'u8 shl (8 - c))))))

let x86_rotateRightBits_i8r128: proc(a: i8r128, count: int): i8r128 = if sseExists(): rotateRightBits_i8r128_sse else: rotateRightBits_i8r128_fallback

func rotateRightBits_i8r128_neon(a: i8r128, count: int): i8r128 =
  let c = count and 7
  if c == 0: return a
  return cast[i8r128](vorrq_u8(vshlq_n_u8(cast[neon.Uint8x16](a), -c.int32), vshlq_n_u8(cast[neon.Uint8x16](a), (8 - c).int32)))

let arm_rotateRightBits_i8r128: proc(a: i8r128, count: int): i8r128 = if neonExists(): rotateRightBits_i8r128_neon else: rotateRightBits_i8r128_fallback

func rotateRightBits_i8r128_lsx(a: i8r128, count: int): i8r128 =
  return cast[i8r128](lsx_vrotri_b(cast[lsx.M128i](a), (count and 7).int32))

let la_rotateRightBits_i8r128: proc(a: i8r128, count: int): i8r128 = if lsxExists(): rotateRightBits_i8r128_lsx else: rotateRightBits_i8r128_fallback

template `rotateRightBits`*(a: i8r128, count: int): i8r128 =
  when defined(amd64) or defined(i386): x86_rotateRightBits_i8r128(a, count)
  elif defined(arm64): arm_rotateRightBits_i8r128(a, count)
  elif defined(loongarch64): la_rotateRightBits_i8r128(a, count)

# ========================
# rotateRightBits / i16r128
# ========================

func rotateRightBits_i16r128_fallback(a: i16r128, count: int): i16r128 =
  var output: i16r128
  let pOut = cast[ptr array[8, uint16]](addr output)
  let pA   = cast[ptr array[8, uint16]](addr a)
  let c = count and 15
  unroll(i, 0, 7): pOut[i] = rotateRightBits(pA[i], c)
  return cast[i16r128](output)

func rotateRightBits_i16r128_sse(a: i16r128, count: int): i16r128 =
  let c = count and 15
  if c == 0: return a
  return cast[i16r128](mm_or_si128(mm_srli_epi16(cast[sse2.M128i](a), c.int32), mm_slli_epi16(cast[sse2.M128i](a), (16 - c).int32)))

let x86_rotateRightBits_i16r128: proc(a: i16r128, count: int): i16r128 = if sseExists(): rotateRightBits_i16r128_sse else: rotateRightBits_i16r128_fallback

func rotateRightBits_i16r128_neon(a: i16r128, count: int): i16r128 =
  let c = count and 15
  if c == 0: return a
  return cast[i16r128](vorrq_u16(vshlq_n_u16(cast[neon.Uint16x8](a), -c.int32), vshlq_n_u16(cast[neon.Uint16x8](a), (16 - c).int32)))

let arm_rotateRightBits_i16r128: proc(a: i16r128, count: int): i16r128 = if neonExists(): rotateRightBits_i16r128_neon else: rotateRightBits_i16r128_fallback

func rotateRightBits_i16r128_lsx(a: i16r128, count: int): i16r128 =
  return cast[i16r128](lsx_vrotri_h(cast[lsx.M128i](a), (count and 15).int32))

let la_rotateRightBits_i16r128: proc(a: i16r128, count: int): i16r128 = if lsxExists(): rotateRightBits_i16r128_lsx else: rotateRightBits_i16r128_fallback

template `rotateRightBits`*(a: i16r128, count: int): i16r128 =
  when defined(amd64) or defined(i386): x86_rotateRightBits_i16r128(a, count)
  elif defined(arm64): arm_rotateRightBits_i16r128(a, count)
  elif defined(loongarch64): la_rotateRightBits_i16r128(a, count)

# ========================
# rotateRightBits / i32r128
# ========================

func rotateRightBits_i32r128_fallback(a: i32r128, count: int): i32r128 =
  var output: i32r128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, uint32]](addr a)
  let c = count and 31
  unroll(i, 0, 3): pOut[i] = rotateRightBits(pA[i], c)
  return cast[i32r128](output)

func rotateRightBits_i32r128_sse(a: i32r128, count: int): i32r128 =
  let c = count and 31
  if c == 0: return a
  return cast[i32r128](mm_or_si128(mm_srli_epi32(cast[sse2.M128i](a), c.int32), mm_slli_epi32(cast[sse2.M128i](a), (32 - c).int32)))

let x86_rotateRightBits_i32r128: proc(a: i32r128, count: int): i32r128 = if sseExists(): rotateRightBits_i32r128_sse else: rotateRightBits_i32r128_fallback

func rotateRightBits_i32r128_neon(a: i32r128, count: int): i32r128 =
  let c = count and 31
  if c == 0: return a
  return cast[i32r128](vorrq_u32(vshlq_n_u32(cast[neon.Uint32x4](a), -c.int32), vshlq_n_u32(cast[neon.Uint32x4](a), (32 - c).int32)))

let arm_rotateRightBits_i32r128: proc(a: i32r128, count: int): i32r128 = if neonExists(): rotateRightBits_i32r128_neon else: rotateRightBits_i32r128_fallback

func rotateRightBits_i32r128_lsx(a: i32r128, count: int): i32r128 =
  return cast[i32r128](lsx_vrotri_w(cast[lsx.M128i](a), (count and 31).int32))

let la_rotateRightBits_i32r128: proc(a: i32r128, count: int): i32r128 = if lsxExists(): rotateRightBits_i32r128_lsx else: rotateRightBits_i32r128_fallback

template `rotateRightBits`*(a: i32r128, count: int): i32r128 =
  when defined(amd64) or defined(i386): x86_rotateRightBits_i32r128(a, count)
  elif defined(arm64): arm_rotateRightBits_i32r128(a, count)
  elif defined(loongarch64): la_rotateRightBits_i32r128(a, count)

# ========================
# rotateRightBits / i64r128
# ========================

func rotateRightBits_i64r128_fallback(a: i64r128, count: int): i64r128 =
  var output: i64r128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, uint64]](addr a)
  let c = count and 63
  unroll(i, 0, 1): pOut[i] = rotateRightBits(pA[i], c)
  return cast[i64r128](output)

func rotateRightBits_i64r128_sse(a: i64r128, count: int): i64r128 =
  let c = count and 63
  if c == 0: return a
  return cast[i64r128](mm_or_si128(mm_srli_epi64(cast[sse2.M128i](a), c.int32), mm_slli_epi64(cast[sse2.M128i](a), (64 - c).int32)))

let x86_rotateRightBits_i64r128: proc(a: i64r128, count: int): i64r128 = if sseExists(): rotateRightBits_i64r128_sse else: rotateRightBits_i64r128_fallback

func rotateRightBits_i64r128_neon(a: i64r128, count: int): i64r128 =
  let c = count and 63
  if c == 0: return a
  return cast[i64r128](vorrq_u32(cast[neon.Uint32x4](vshlq_n_u64(cast[neon.Uint64x2](a), -c.int32)), cast[neon.Uint32x4](vshlq_n_u64(cast[neon.Uint64x2](a), (64 - c).int32))))

let arm_rotateRightBits_i64r128: proc(a: i64r128, count: int): i64r128 = if neonExists(): rotateRightBits_i64r128_neon else: rotateRightBits_i64r128_fallback

func rotateRightBits_i64r128_lsx(a: i64r128, count: int): i64r128 =
  return cast[i64r128](lsx_vrotri_d(cast[lsx.M128i](a), (count and 63).int32))

let la_rotateRightBits_i64r128: proc(a: i64r128, count: int): i64r128 = if lsxExists(): rotateRightBits_i64r128_lsx else: rotateRightBits_i64r128_fallback

template `rotateRightBits`*(a: i64r128, count: int): i64r128 =
  when defined(amd64) or defined(i386): x86_rotateRightBits_i64r128(a, count)
  elif defined(arm64): arm_rotateRightBits_i64r128(a, count)
  elif defined(loongarch64): la_rotateRightBits_i64r128(a, count)

# ========================
# rotateRightBits / u8r128
# ========================

func rotateRightBits_u8r128_fallback(a: u8r128, count: int): u8r128 =
  var output: u8r128
  let pOut = cast[ptr array[16, uint8]](addr output)
  let pA   = cast[ptr array[16, uint8]](addr a)
  let c = count and 7
  unroll(i, 0, 15): pOut[i] = rotateRightBits(pA[i], c)
  return output

func rotateRightBits_u8r128_sse(a: u8r128, count: int): u8r128 =
  let c = count and 7
  if c == 0: return a
  return cast[u8r128](mm_or_si128(mm_and_si128(mm_srli_epi16(cast[sse2.M128i](a), c.int32), mm_set1_epi8(cast[int8](0xFF'u8 shr c))), mm_and_si128(mm_slli_epi16(cast[sse2.M128i](a), (8 - c).int32), mm_set1_epi8(cast[int8](0xFF'u8 shl (8 - c))))))

let x86_rotateRightBits_u8r128: proc(a: u8r128, count: int): u8r128 = if sseExists(): rotateRightBits_u8r128_sse else: rotateRightBits_u8r128_fallback

func rotateRightBits_u8r128_neon(a: u8r128, count: int): u8r128 =
  let c = count and 7
  if c == 0: return a
  return cast[u8r128](vorrq_u8(vshlq_n_u8(cast[neon.Uint8x16](a), -c.int32), vshlq_n_u8(cast[neon.Uint8x16](a), (8 - c).int32)))

let arm_rotateRightBits_u8r128: proc(a: u8r128, count: int): u8r128 = if neonExists(): rotateRightBits_u8r128_neon else: rotateRightBits_u8r128_fallback

func rotateRightBits_u8r128_lsx(a: u8r128, count: int): u8r128 =
  return cast[u8r128](lsx_vrotri_b(cast[lsx.M128i](a), (count and 7).int32))

let la_rotateRightBits_u8r128: proc(a: u8r128, count: int): u8r128 = if lsxExists(): rotateRightBits_u8r128_lsx else: rotateRightBits_u8r128_fallback

template `rotateRightBits`*(a: u8r128, count: int): u8r128 =
  when defined(amd64) or defined(i386): x86_rotateRightBits_u8r128(a, count)
  elif defined(arm64): arm_rotateRightBits_u8r128(a, count)
  elif defined(loongarch64): la_rotateRightBits_u8r128(a, count)

# ========================
# rotateRightBits / u16r128
# ========================

func rotateRightBits_u16r128_fallback(a: u16r128, count: int): u16r128 =
  var output: u16r128
  let pOut = cast[ptr array[8, uint16]](addr output)
  let pA   = cast[ptr array[8, uint16]](addr a)
  let c = count and 15
  unroll(i, 0, 7): pOut[i] = rotateRightBits(pA[i], c)
  return output

func rotateRightBits_u16r128_sse(a: u16r128, count: int): u16r128 =
  let c = count and 15
  if c == 0: return a
  return cast[u16r128](mm_or_si128(mm_srli_epi16(cast[sse2.M128i](a), c.int32), mm_slli_epi16(cast[sse2.M128i](a), (16 - c).int32)))

let x86_rotateRightBits_u16r128: proc(a: u16r128, count: int): u16r128 = if sseExists(): rotateRightBits_u16r128_sse else: rotateRightBits_u16r128_fallback

func rotateRightBits_u16r128_neon(a: u16r128, count: int): u16r128 =
  let c = count and 15
  if c == 0: return a
  return cast[u16r128](vorrq_u16(vshlq_n_u16(cast[neon.Uint16x8](a), -c.int32), vshlq_n_u16(cast[neon.Uint16x8](a), (16 - c).int32)))

let arm_rotateRightBits_u16r128: proc(a: u16r128, count: int): u16r128 = if neonExists(): rotateRightBits_u16r128_neon else: rotateRightBits_u16r128_fallback

func rotateRightBits_u16r128_lsx(a: u16r128, count: int): u16r128 =
  return cast[u16r128](lsx_vrotri_h(cast[lsx.M128i](a), (count and 15).int32))

let la_rotateRightBits_u16r128: proc(a: u16r128, count: int): u16r128 = if lsxExists(): rotateRightBits_u16r128_lsx else: rotateRightBits_u16r128_fallback

template `rotateRightBits`*(a: u16r128, count: int): u16r128 =
  when defined(amd64) or defined(i386): x86_rotateRightBits_u16r128(a, count)
  elif defined(arm64): arm_rotateRightBits_u16r128(a, count)
  elif defined(loongarch64): la_rotateRightBits_u16r128(a, count)

# ========================
# rotateRightBits / u32r128
# ========================

func rotateRightBits_u32r128_fallback(a: u32r128, count: int): u32r128 =
  var output: u32r128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, uint32]](addr a)
  let c = count and 31
  unroll(i, 0, 3): pOut[i] = rotateRightBits(pA[i], c)
  return output

func rotateRightBits_u32r128_sse(a: u32r128, count: int): u32r128 =
  let c = count and 31
  if c == 0: return a
  return cast[u32r128](mm_or_si128(mm_srli_epi32(cast[sse2.M128i](a), c.int32), mm_slli_epi32(cast[sse2.M128i](a), (32 - c).int32)))

let x86_rotateRightBits_u32r128: proc(a: u32r128, count: int): u32r128 = if sseExists(): rotateRightBits_u32r128_sse else: rotateRightBits_u32r128_fallback

func rotateRightBits_u32r128_neon(a: u32r128, count: int): u32r128 =
  let c = count and 31
  if c == 0: return a
  return cast[u32r128](vorrq_u32(vshlq_n_u32(cast[neon.Uint32x4](a), -c.int32), vshlq_n_u32(cast[neon.Uint32x4](a), (32 - c).int32)))

let arm_rotateRightBits_u32r128: proc(a: u32r128, count: int): u32r128 = if neonExists(): rotateRightBits_u32r128_neon else: rotateRightBits_u32r128_fallback

func rotateRightBits_u32r128_lsx(a: u32r128, count: int): u32r128 =
  return cast[u32r128](lsx_vrotri_w(cast[lsx.M128i](a), (count and 31).int32))

let la_rotateRightBits_u32r128: proc(a: u32r128, count: int): u32r128 = if lsxExists(): rotateRightBits_u32r128_lsx else: rotateRightBits_u32r128_fallback

template `rotateRightBits`*(a: u32r128, count: int): u32r128 =
  when defined(amd64) or defined(i386): x86_rotateRightBits_u32r128(a, count)
  elif defined(arm64): arm_rotateRightBits_u32r128(a, count)
  elif defined(loongarch64): la_rotateRightBits_u32r128(a, count)

# ========================
# rotateRightBits / u64r128
# ========================

func rotateRightBits_u64r128_fallback(a: u64r128, count: int): u64r128 =
  var output: u64r128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, uint64]](addr a)
  let c = count and 63
  unroll(i, 0, 1): pOut[i] = rotateRightBits(pA[i], c)
  return output

func rotateRightBits_u64r128_sse(a: u64r128, count: int): u64r128 =
  let c = count and 63
  if c == 0: return a
  return cast[u64r128](mm_or_si128(mm_srli_epi64(cast[sse2.M128i](a), c.int32), mm_slli_epi64(cast[sse2.M128i](a), (64 - c).int32)))

let x86_rotateRightBits_u64r128: proc(a: u64r128, count: int): u64r128 = if sseExists(): rotateRightBits_u64r128_sse else: rotateRightBits_u64r128_fallback

func rotateRightBits_u64r128_neon(a: u64r128, count: int): u64r128 =
  let c = count and 63
  if c == 0: return a
  return cast[u64r128](vorrq_u32(cast[neon.Uint32x4](vshlq_n_u64(cast[neon.Uint64x2](a), -c.int32)), cast[neon.Uint32x4](vshlq_n_u64(cast[neon.Uint64x2](a), (64 - c).int32))))

let arm_rotateRightBits_u64r128: proc(a: u64r128, count: int): u64r128 = if neonExists(): rotateRightBits_u64r128_neon else: rotateRightBits_u64r128_fallback

func rotateRightBits_u64r128_lsx(a: u64r128, count: int): u64r128 =
  return cast[u64r128](lsx_vrotri_d(cast[lsx.M128i](a), (count and 63).int32))

let la_rotateRightBits_u64r128: proc(a: u64r128, count: int): u64r128 = if lsxExists(): rotateRightBits_u64r128_lsx else: rotateRightBits_u64r128_fallback

template `rotateRightBits`*(a: u64r128, count: int): u64r128 =
  when defined(amd64) or defined(i386): x86_rotateRightBits_u64r128(a, count)
  elif defined(arm64): arm_rotateRightBits_u64r128(a, count)
  elif defined(loongarch64): la_rotateRightBits_u64r128(a, count)

# ========================
# rotateRightBits / f32v128
# ========================

func rotateRightBits_f32v128_fallback(a: f32v128, count: int): f32v128 =
  var output: f32v128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, uint32]](addr a)
  let c = count and 31
  unroll(i, 0, 3): pOut[i] = rotateRightBits(pA[i], c)
  return output

func rotateRightBits_f32v128_sse(a: f32v128, count: int): f32v128 =
  let c = count and 31
  if c == 0: return a
  return cast[f32v128](mm_or_si128(mm_srli_epi32(cast[sse2.M128i](a), c.int32), mm_slli_epi32(cast[sse2.M128i](a), (32 - c).int32)))

let x86_rotateRightBits_f32v128: proc(a: f32v128, count: int): f32v128 = if sseExists(): rotateRightBits_f32v128_sse else: rotateRightBits_f32v128_fallback

func rotateRightBits_f32v128_neon(a: f32v128, count: int): f32v128 =
  let c = count and 31
  if c == 0: return a
  return cast[f32v128](vorrq_u32(vshlq_n_u32(cast[neon.Uint32x4](a), -c.int32), vshlq_n_u32(cast[neon.Uint32x4](a), (32 - c).int32)))

let arm_rotateRightBits_f32v128: proc(a: f32v128, count: int): f32v128 = if neonExists(): rotateRightBits_f32v128_neon else: rotateRightBits_f32v128_fallback

func rotateRightBits_f32v128_lsx(a: f32v128, count: int): f32v128 =
  return cast[f32v128](lsx_vrotri_w(cast[lsx.M128i](a), (count and 31).int32))

let la_rotateRightBits_f32v128: proc(a: f32v128, count: int): f32v128 = if lsxExists(): rotateRightBits_f32v128_lsx else: rotateRightBits_f32v128_fallback

template `rotateRightBits`*(a: f32v128, count: int): f32v128 =
  when defined(amd64) or defined(i386): x86_rotateRightBits_f32v128(a, count)
  elif defined(arm64): arm_rotateRightBits_f32v128(a, count)
  elif defined(loongarch64): la_rotateRightBits_f32v128(a, count)

# ========================
# rotateRightBits / f64v128
# ========================

func rotateRightBits_f64v128_fallback(a: f64v128, count: int): f64v128 =
  var output: f64v128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, uint64]](addr a)
  let c = count and 63
  unroll(i, 0, 1): pOut[i] = rotateRightBits(pA[i], c)
  return output

func rotateRightBits_f64v128_sse(a: f64v128, count: int): f64v128 =
  let c = count and 63
  if c == 0: return a
  return cast[f64v128](mm_or_si128(mm_srli_epi64(cast[sse2.M128i](a), c.int32), mm_slli_epi64(cast[sse2.M128i](a), (64 - c).int32)))

let x86_rotateRightBits_f64v128: proc(a: f64v128, count: int): f64v128 = if sseExists(): rotateRightBits_f64v128_sse else: rotateRightBits_f64v128_fallback

func rotateRightBits_f64v128_neon(a: f64v128, count: int): f64v128 =
  let c = count and 63
  if c == 0: return a
  return cast[f64v128](vorrq_u32(cast[neon.Uint32x4](vshlq_n_u64(cast[neon.Uint64x2](a), -c.int32)), cast[neon.Uint32x4](vshlq_n_u64(cast[neon.Uint64x2](a), (64 - c).int32))))

let arm_rotateRightBits_f64v128: proc(a: f64v128, count: int): f64v128 = if neonExists(): rotateRightBits_f64v128_neon else: rotateRightBits_f64v128_fallback

func rotateRightBits_f64v128_lsx(a: f64v128, count: int): f64v128 =
  return cast[f64v128](lsx_vrotri_d(cast[lsx.M128i](a), (count and 63).int32))

let la_rotateRightBits_f64v128: proc(a: f64v128, count: int): f64v128 = if lsxExists(): rotateRightBits_f64v128_lsx else: rotateRightBits_f64v128_fallback

template `rotateRightBits`*(a: f64v128, count: int): f64v128 =
  when defined(amd64) or defined(i386): x86_rotateRightBits_f64v128(a, count)
  elif defined(arm64): arm_rotateRightBits_f64v128(a, count)
  elif defined(loongarch64): la_rotateRightBits_f64v128(a, count)

# ========================
# rotateRightBits / i8v128
# ========================

func rotateRightBits_i8v128_fallback(a: i8v128, count: int): i8v128 =
  var output: i8v128
  let pOut = cast[ptr array[16, uint8]](addr output)
  let pA   = cast[ptr array[16, uint8]](addr a)
  let c = count and 7
  unroll(i, 0, 15): pOut[i] = rotateRightBits(pA[i], c)
  return cast[i8v128](output)

func rotateRightBits_i8v128_sse(a: i8v128, count: int): i8v128 =
  let c = count and 7
  if c == 0: return a
  return cast[i8v128](mm_or_si128(mm_and_si128(mm_srli_epi16(cast[sse2.M128i](a), c.int32), mm_set1_epi8(cast[int8](0xFF'u8 shr c))), mm_and_si128(mm_slli_epi16(cast[sse2.M128i](a), (8 - c).int32), mm_set1_epi8(cast[int8](0xFF'u8 shl (8 - c))))))

let x86_rotateRightBits_i8v128: proc(a: i8v128, count: int): i8v128 = if sseExists(): rotateRightBits_i8v128_sse else: rotateRightBits_i8v128_fallback

func rotateRightBits_i8v128_neon(a: i8v128, count: int): i8v128 =
  let c = count and 7
  if c == 0: return a
  return cast[i8v128](vorrq_u8(vshlq_n_u8(cast[neon.Uint8x16](a), -c.int32), vshlq_n_u8(cast[neon.Uint8x16](a), (8 - c).int32)))

let arm_rotateRightBits_i8v128: proc(a: i8v128, count: int): i8v128 = if neonExists(): rotateRightBits_i8v128_neon else: rotateRightBits_i8v128_fallback

func rotateRightBits_i8v128_lsx(a: i8v128, count: int): i8v128 =
  return cast[i8v128](lsx_vrotri_b(cast[lsx.M128i](a), (count and 7).int32))

let la_rotateRightBits_i8v128: proc(a: i8v128, count: int): i8v128 = if lsxExists(): rotateRightBits_i8v128_lsx else: rotateRightBits_i8v128_fallback

template `rotateRightBits`*(a: i8v128, count: int): i8v128 =
  when defined(amd64) or defined(i386): x86_rotateRightBits_i8v128(a, count)
  elif defined(arm64): arm_rotateRightBits_i8v128(a, count)
  elif defined(loongarch64): la_rotateRightBits_i8v128(a, count)

# ========================
# rotateRightBits / i16v128
# ========================

func rotateRightBits_i16v128_fallback(a: i16v128, count: int): i16v128 =
  var output: i16v128
  let pOut = cast[ptr array[8, uint16]](addr output)
  let pA   = cast[ptr array[8, uint16]](addr a)
  let c = count and 15
  unroll(i, 0, 7): pOut[i] = rotateRightBits(pA[i], c)
  return cast[i16v128](output)

func rotateRightBits_i16v128_sse(a: i16v128, count: int): i16v128 =
  let c = count and 15
  if c == 0: return a
  return cast[i16v128](mm_or_si128(mm_srli_epi16(cast[sse2.M128i](a), c.int32), mm_slli_epi16(cast[sse2.M128i](a), (16 - c).int32)))

let x86_rotateRightBits_i16v128: proc(a: i16v128, count: int): i16v128 = if sseExists(): rotateRightBits_i16v128_sse else: rotateRightBits_i16v128_fallback

func rotateRightBits_i16v128_neon(a: i16v128, count: int): i16v128 =
  let c = count and 15
  if c == 0: return a
  return cast[i16v128](vorrq_u16(vshlq_n_u16(cast[neon.Uint16x8](a), -c.int32), vshlq_n_u16(cast[neon.Uint16x8](a), (16 - c).int32)))

let arm_rotateRightBits_i16v128: proc(a: i16v128, count: int): i16v128 = if neonExists(): rotateRightBits_i16v128_neon else: rotateRightBits_i16v128_fallback

func rotateRightBits_i16v128_lsx(a: i16v128, count: int): i16v128 =
  return cast[i16v128](lsx_vrotri_h(cast[lsx.M128i](a), (count and 15).int32))

let la_rotateRightBits_i16v128: proc(a: i16v128, count: int): i16v128 = if lsxExists(): rotateRightBits_i16v128_lsx else: rotateRightBits_i16v128_fallback

template `rotateRightBits`*(a: i16v128, count: int): i16v128 =
  when defined(amd64) or defined(i386): x86_rotateRightBits_i16v128(a, count)
  elif defined(arm64): arm_rotateRightBits_i16v128(a, count)
  elif defined(loongarch64): la_rotateRightBits_i16v128(a, count)

# ========================
# rotateRightBits / i32v128
# ========================

func rotateRightBits_i32v128_fallback(a: i32v128, count: int): i32v128 =
  var output: i32v128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, uint32]](addr a)
  let c = count and 31
  unroll(i, 0, 3): pOut[i] = rotateRightBits(pA[i], c)
  return cast[i32v128](output)

func rotateRightBits_i32v128_sse(a: i32v128, count: int): i32v128 =
  let c = count and 31
  if c == 0: return a
  return cast[i32v128](mm_or_si128(mm_srli_epi32(cast[sse2.M128i](a), c.int32), mm_slli_epi32(cast[sse2.M128i](a), (32 - c).int32)))

let x86_rotateRightBits_i32v128: proc(a: i32v128, count: int): i32v128 = if sseExists(): rotateRightBits_i32v128_sse else: rotateRightBits_i32v128_fallback

func rotateRightBits_i32v128_neon(a: i32v128, count: int): i32v128 =
  let c = count and 31
  if c == 0: return a
  return cast[i32v128](vorrq_u32(vshlq_n_u32(cast[neon.Uint32x4](a), -c.int32), vshlq_n_u32(cast[neon.Uint32x4](a), (32 - c).int32)))

let arm_rotateRightBits_i32v128: proc(a: i32v128, count: int): i32v128 = if neonExists(): rotateRightBits_i32v128_neon else: rotateRightBits_i32v128_fallback

func rotateRightBits_i32v128_lsx(a: i32v128, count: int): i32v128 =
  return cast[i32v128](lsx_vrotri_w(cast[lsx.M128i](a), (count and 31).int32))

let la_rotateRightBits_i32v128: proc(a: i32v128, count: int): i32v128 = if lsxExists(): rotateRightBits_i32v128_lsx else: rotateRightBits_i32v128_fallback

template `rotateRightBits`*(a: i32v128, count: int): i32v128 =
  when defined(amd64) or defined(i386): x86_rotateRightBits_i32v128(a, count)
  elif defined(arm64): arm_rotateRightBits_i32v128(a, count)
  elif defined(loongarch64): la_rotateRightBits_i32v128(a, count)

# ========================
# rotateRightBits / i64v128
# ========================

func rotateRightBits_i64v128_fallback(a: i64v128, count: int): i64v128 =
  var output: i64v128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, uint64]](addr a)
  let c = count and 63
  unroll(i, 0, 1): pOut[i] = rotateRightBits(pA[i], c)
  return cast[i64v128](output)

func rotateRightBits_i64v128_sse(a: i64v128, count: int): i64v128 =
  let c = count and 63
  if c == 0: return a
  return cast[i64v128](mm_or_si128(mm_srli_epi64(cast[sse2.M128i](a), c.int32), mm_slli_epi64(cast[sse2.M128i](a), (64 - c).int32)))

let x86_rotateRightBits_i64v128: proc(a: i64v128, count: int): i64v128 = if sseExists(): rotateRightBits_i64v128_sse else: rotateRightBits_i64v128_fallback

func rotateRightBits_i64v128_neon(a: i64v128, count: int): i64v128 =
  let c = count and 63
  if c == 0: return a
  return cast[i64v128](vorrq_u32(cast[neon.Uint32x4](vshlq_n_u64(cast[neon.Uint64x2](a), -c.int32)), cast[neon.Uint32x4](vshlq_n_u64(cast[neon.Uint64x2](a), (64 - c).int32))))

let arm_rotateRightBits_i64v128: proc(a: i64v128, count: int): i64v128 = if neonExists(): rotateRightBits_i64v128_neon else: rotateRightBits_i64v128_fallback

func rotateRightBits_i64v128_lsx(a: i64v128, count: int): i64v128 =
  return cast[i64v128](lsx_vrotri_d(cast[lsx.M128i](a), (count and 63).int32))

let la_rotateRightBits_i64v128: proc(a: i64v128, count: int): i64v128 = if lsxExists(): rotateRightBits_i64v128_lsx else: rotateRightBits_i64v128_fallback

template `rotateRightBits`*(a: i64v128, count: int): i64v128 =
  when defined(amd64) or defined(i386): x86_rotateRightBits_i64v128(a, count)
  elif defined(arm64): arm_rotateRightBits_i64v128(a, count)
  elif defined(loongarch64): la_rotateRightBits_i64v128(a, count)

# ========================
# rotateRightBits / u8v128
# ========================

func rotateRightBits_u8v128_fallback(a: u8v128, count: int): u8v128 =
  var output: u8v128
  let pOut = cast[ptr array[16, uint8]](addr output)
  let pA   = cast[ptr array[16, uint8]](addr a)
  let c = count and 7
  unroll(i, 0, 15): pOut[i] = rotateRightBits(pA[i], c)
  return output

func rotateRightBits_u8v128_sse(a: u8v128, count: int): u8v128 =
  let c = count and 7
  if c == 0: return a
  return cast[u8v128](mm_or_si128(mm_and_si128(mm_srli_epi16(cast[sse2.M128i](a), c.int32), mm_set1_epi8(cast[int8](0xFF'u8 shr c))), mm_and_si128(mm_slli_epi16(cast[sse2.M128i](a), (8 - c).int32), mm_set1_epi8(cast[int8](0xFF'u8 shl (8 - c))))))

let x86_rotateRightBits_u8v128: proc(a: u8v128, count: int): u8v128 = if sseExists(): rotateRightBits_u8v128_sse else: rotateRightBits_u8v128_fallback

func rotateRightBits_u8v128_neon(a: u8v128, count: int): u8v128 =
  let c = count and 7
  if c == 0: return a
  return cast[u8v128](vorrq_u8(vshlq_n_u8(cast[neon.Uint8x16](a), -c.int32), vshlq_n_u8(cast[neon.Uint8x16](a), (8 - c).int32)))

let arm_rotateRightBits_u8v128: proc(a: u8v128, count: int): u8v128 = if neonExists(): rotateRightBits_u8v128_neon else: rotateRightBits_u8v128_fallback

func rotateRightBits_u8v128_lsx(a: u8v128, count: int): u8v128 =
  return cast[u8v128](lsx_vrotri_b(cast[lsx.M128i](a), (count and 7).int32))

let la_rotateRightBits_u8v128: proc(a: u8v128, count: int): u8v128 = if lsxExists(): rotateRightBits_u8v128_lsx else: rotateRightBits_u8v128_fallback

template `rotateRightBits`*(a: u8v128, count: int): u8v128 =
  when defined(amd64) or defined(i386): x86_rotateRightBits_u8v128(a, count)
  elif defined(arm64): arm_rotateRightBits_u8v128(a, count)
  elif defined(loongarch64): la_rotateRightBits_u8v128(a, count)

# ========================
# rotateRightBits / u16v128
# ========================

func rotateRightBits_u16v128_fallback(a: u16v128, count: int): u16v128 =
  var output: u16v128
  let pOut = cast[ptr array[8, uint16]](addr output)
  let pA   = cast[ptr array[8, uint16]](addr a)
  let c = count and 15
  unroll(i, 0, 7): pOut[i] = rotateRightBits(pA[i], c)
  return output

func rotateRightBits_u16v128_sse(a: u16v128, count: int): u16v128 =
  let c = count and 15
  if c == 0: return a
  return cast[u16v128](mm_or_si128(mm_srli_epi16(cast[sse2.M128i](a), c.int32), mm_slli_epi16(cast[sse2.M128i](a), (16 - c).int32)))

let x86_rotateRightBits_u16v128: proc(a: u16v128, count: int): u16v128 = if sseExists(): rotateRightBits_u16v128_sse else: rotateRightBits_u16v128_fallback

func rotateRightBits_u16v128_neon(a: u16v128, count: int): u16v128 =
  let c = count and 15
  if c == 0: return a
  return cast[u16v128](vorrq_u16(vshlq_n_u16(cast[neon.Uint16x8](a), -c.int32), vshlq_n_u16(cast[neon.Uint16x8](a), (16 - c).int32)))

let arm_rotateRightBits_u16v128: proc(a: u16v128, count: int): u16v128 = if neonExists(): rotateRightBits_u16v128_neon else: rotateRightBits_u16v128_fallback

func rotateRightBits_u16v128_lsx(a: u16v128, count: int): u16v128 =
  return cast[u16v128](lsx_vrotri_h(cast[lsx.M128i](a), (count and 15).int32))

let la_rotateRightBits_u16v128: proc(a: u16v128, count: int): u16v128 = if lsxExists(): rotateRightBits_u16v128_lsx else: rotateRightBits_u16v128_fallback

template `rotateRightBits`*(a: u16v128, count: int): u16v128 =
  when defined(amd64) or defined(i386): x86_rotateRightBits_u16v128(a, count)
  elif defined(arm64): arm_rotateRightBits_u16v128(a, count)
  elif defined(loongarch64): la_rotateRightBits_u16v128(a, count)

# ========================
# rotateRightBits / u32v128
# ========================

func rotateRightBits_u32v128_fallback(a: u32v128, count: int): u32v128 =
  var output: u32v128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, uint32]](addr a)
  let c = count and 31
  unroll(i, 0, 3): pOut[i] = rotateRightBits(pA[i], c)
  return output

func rotateRightBits_u32v128_sse(a: u32v128, count: int): u32v128 =
  let c = count and 31
  if c == 0: return a
  return cast[u32v128](mm_or_si128(mm_srli_epi32(cast[sse2.M128i](a), c.int32), mm_slli_epi32(cast[sse2.M128i](a), (32 - c).int32)))

let x86_rotateRightBits_u32v128: proc(a: u32v128, count: int): u32v128 = if sseExists(): rotateRightBits_u32v128_sse else: rotateRightBits_u32v128_fallback

func rotateRightBits_u32v128_neon(a: u32v128, count: int): u32v128 =
  let c = count and 31
  if c == 0: return a
  return cast[u32v128](vorrq_u32(vshlq_n_u32(cast[neon.Uint32x4](a), -c.int32), vshlq_n_u32(cast[neon.Uint32x4](a), (32 - c).int32)))

let arm_rotateRightBits_u32v128: proc(a: u32v128, count: int): u32v128 = if neonExists(): rotateRightBits_u32v128_neon else: rotateRightBits_u32v128_fallback

func rotateRightBits_u32v128_lsx(a: u32v128, count: int): u32v128 =
  return cast[u32v128](lsx_vrotri_w(cast[lsx.M128i](a), (count and 31).int32))

let la_rotateRightBits_u32v128: proc(a: u32v128, count: int): u32v128 = if lsxExists(): rotateRightBits_u32v128_lsx else: rotateRightBits_u32v128_fallback

template `rotateRightBits`*(a: u32v128, count: int): u32v128 =
  when defined(amd64) or defined(i386): x86_rotateRightBits_u32v128(a, count)
  elif defined(arm64): arm_rotateRightBits_u32v128(a, count)
  elif defined(loongarch64): la_rotateRightBits_u32v128(a, count)

# ========================
# rotateRightBits / u64v128
# ========================

func rotateRightBits_u64v128_fallback(a: u64v128, count: int): u64v128 =
  var output: u64v128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, uint64]](addr a)
  let c = count and 63
  unroll(i, 0, 1): pOut[i] = rotateRightBits(pA[i], c)
  return output

func rotateRightBits_u64v128_sse(a: u64v128, count: int): u64v128 =
  let c = count and 63
  if c == 0: return a
  return cast[u64v128](mm_or_si128(mm_srli_epi64(cast[sse2.M128i](a), c.int32), mm_slli_epi64(cast[sse2.M128i](a), (64 - c).int32)))

let x86_rotateRightBits_u64v128: proc(a: u64v128, count: int): u64v128 = if sseExists(): rotateRightBits_u64v128_sse else: rotateRightBits_u64v128_fallback

func rotateRightBits_u64v128_neon(a: u64v128, count: int): u64v128 =
  let c = count and 63
  if c == 0: return a
  return cast[u64v128](vorrq_u32(cast[neon.Uint32x4](vshlq_n_u64(cast[neon.Uint64x2](a), -c.int32)), cast[neon.Uint32x4](vshlq_n_u64(cast[neon.Uint64x2](a), (64 - c).int32))))

let arm_rotateRightBits_u64v128: proc(a: u64v128, count: int): u64v128 = if neonExists(): rotateRightBits_u64v128_neon else: rotateRightBits_u64v128_fallback

func rotateRightBits_u64v128_lsx(a: u64v128, count: int): u64v128 =
  return cast[u64v128](lsx_vrotri_d(cast[lsx.M128i](a), (count and 63).int32))

let la_rotateRightBits_u64v128: proc(a: u64v128, count: int): u64v128 = if lsxExists(): rotateRightBits_u64v128_lsx else: rotateRightBits_u64v128_fallback

template `rotateRightBits`*(a: u64v128, count: int): u64v128 =
  when defined(amd64) or defined(i386): x86_rotateRightBits_u64v128(a, count)
  elif defined(arm64): arm_rotateRightBits_u64v128(a, count)
  elif defined(loongarch64): la_rotateRightBits_u64v128(a, count)

# ==========================================
# equ (==) / f32r128 -> u32r128
# ==========================================

func equ_f32r128_fallback(a, b: f32r128): u32r128 =
  var output: u32r128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, float32]](addr a)
  let pB   = cast[ptr array[4, float32]](addr b)
  unroll(i, 0, 3): 
    pOut[i] = if pA[i] == pB[i]: 0xFFFFFFFF'u32 else: 0'u32
  return output

func equ_f32r128_sse(a, b: f32r128): u32r128 =
  return cast[u32r128](mm_castps_si128(mm_cmpeq_ps(cast[sse.M128](a), cast[sse.M128](b))))

let x86_equ_f32r128: proc(a, b: f32r128): u32r128 = if sseExists(): equ_f32r128_sse else: equ_f32r128_fallback

func equ_f32r128_neon(a, b: f32r128): u32r128 =
  return cast[u32r128](vceqq_f32(cast[neon.Float32x4](a), cast[neon.Float32x4](b)))

let arm_equ_f32r128: proc(a, b: f32r128): u32r128 = if neonExists(): equ_f32r128_neon else: equ_f32r128_fallback

func equ_f32r128_lsx(a, b: f32r128): u32r128 =
  return cast[u32r128](lsx_vfcmp_ceq_s(cast[lsx.M128](a), cast[lsx.M128](b)))

let la_equ_f32r128: proc(a, b: f32r128): u32r128 = if lsxExists(): equ_f32r128_lsx else: equ_f32r128_fallback

template `==`*(a, b: f32r128): u32r128 =
  when defined(amd64) or defined(i386): x86_equ_f32r128(a, b)
  elif defined(arm64): arm_equ_f32r128(a, b)
  elif defined(loongarch64): la_equ_f32r128(a, b)


# ==========================================
# equ (==) / f64r128 -> u64r128
# ==========================================

func equ_f64r128_fallback(a, b: f64r128): u64r128 =
  var output: u64r128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, float64]](addr a)
  let pB   = cast[ptr array[2, float64]](addr b)
  unroll(i, 0, 1): 
    pOut[i] = if pA[i] == pB[i]: 0xFFFFFFFFFFFFFFFF'u64 else: 0'u64
  return output

func equ_f64r128_sse(a, b: f64r128): u64r128 =
  return cast[u64r128](mm_castpd_si128(mm_cmpeq_pd(cast[sse2.M128d](a), cast[sse2.M128d](b))))

let x86_equ_f64r128: proc(a, b: f64r128): u64r128 = if sseExists(): equ_f64r128_sse else: equ_f64r128_fallback

func equ_f64r128_neon(a, b: f64r128): u64r128 =
  return cast[u64r128](vceqq_f64(cast[neon.Float64x2](a), cast[neon.Float64x2](b)))

let arm_equ_f64r128: proc(a, b: f64r128): u64r128 = if neonExists(): equ_f64r128_neon else: equ_f64r128_fallback

func equ_f64r128_lsx(a, b: f64r128): u64r128 =
  return cast[u64r128](lsx_vfcmp_ceq_d(cast[lsx.M128d](a), cast[lsx.M128d](b)))

let la_equ_f64r128: proc(a, b: f64r128): u64r128 = if lsxExists(): equ_f64r128_lsx else: equ_f64r128_fallback

template `==`*(a, b: f64r128): u64r128 =
  when defined(amd64) or defined(i386): x86_equ_f64r128(a, b)
  elif defined(arm64): arm_equ_f64r128(a, b)
  elif defined(loongarch64): la_equ_f64r128(a, b)


# ==========================================
# equ (==) / i8r128 -> u8r128
# ==========================================

func equ_i8r128_fallback(a, b: i8r128): u8r128 =
  var output: u8r128
  let pOut = cast[ptr array[16, uint8]](addr output)
  let pA   = cast[ptr array[16, int8]](addr a)
  let pB   = cast[ptr array[16, int8]](addr b)
  unroll(i, 0, 15): 
    pOut[i] = if pA[i] == pB[i]: 0xFF'u8 else: 0'u8
  return output

func equ_i8r128_sse(a, b: i8r128): u8r128 =
  return cast[u8r128](mm_cmpeq_epi8(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_equ_i8r128: proc(a, b: i8r128): u8r128 = if sseExists(): equ_i8r128_sse else: equ_i8r128_fallback

func equ_i8r128_neon(a, b: i8r128): u8r128 =
  return cast[u8r128](vceqq_s8(cast[neon.Int8x16](a), cast[neon.Int8x16](b)))

let arm_equ_i8r128: proc(a, b: i8r128): u8r128 = if neonExists(): equ_i8r128_neon else: equ_i8r128_fallback

func equ_i8r128_lsx(a, b: i8r128): u8r128 =
  return cast[u8r128](lsx_vseq_b(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_equ_i8r128: proc(a, b: i8r128): u8r128 = if lsxExists(): equ_i8r128_lsx else: equ_i8r128_fallback

template `==`*(a, b: i8r128): u8r128 =
  when defined(amd64) or defined(i386): x86_equ_i8r128(a, b)
  elif defined(arm64): arm_equ_i8r128(a, b)
  elif defined(loongarch64): la_equ_i8r128(a, b)


# ==========================================
# equ (==) / i16r128 -> u16r128
# ==========================================

func equ_i16r128_fallback(a, b: i16r128): u16r128 =
  var output: u16r128
  let pOut = cast[ptr array[8, uint16]](addr output)
  let pA   = cast[ptr array[8, int16]](addr a)
  let pB   = cast[ptr array[8, int16]](addr b)
  unroll(i, 0, 7): 
    pOut[i] = if pA[i] == pB[i]: 0xFFFF'u16 else: 0'u16
  return output

func equ_i16r128_sse(a, b: i16r128): u16r128 =
  return cast[u16r128](mm_cmpeq_epi16(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_equ_i16r128: proc(a, b: i16r128): u16r128 = if sseExists(): equ_i16r128_sse else: equ_i16r128_fallback

func equ_i16r128_neon(a, b: i16r128): u16r128 =
  return cast[u16r128](vceqq_s16(cast[neon.Int16x8](a), cast[neon.Int16x8](b)))

let arm_equ_i16r128: proc(a, b: i16r128): u16r128 = if neonExists(): equ_i16r128_neon else: equ_i16r128_fallback

func equ_i16r128_lsx(a, b: i16r128): u16r128 =
  return cast[u16r128](lsx_vseq_h(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_equ_i16r128: proc(a, b: i16r128): u16r128 = if lsxExists(): equ_i16r128_lsx else: equ_i16r128_fallback

template `==`*(a, b: i16r128): u16r128 =
  when defined(amd64) or defined(i386): x86_equ_i16r128(a, b)
  elif defined(arm64): arm_equ_i16r128(a, b)
  elif defined(loongarch64): la_equ_i16r128(a, b)


# ==========================================
# equ (==) / i32r128 -> u32r128
# ==========================================

func equ_i32r128_fallback(a, b: i32r128): u32r128 =
  var output: u32r128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, int32]](addr a)
  let pB   = cast[ptr array[4, int32]](addr b)
  unroll(i, 0, 3): 
    pOut[i] = if pA[i] == pB[i]: 0xFFFFFFFF'u32 else: 0'u32
  return output

func equ_i32r128_sse(a, b: i32r128): u32r128 =
  return cast[u32r128](mm_cmpeq_epi32(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_equ_i32r128: proc(a, b: i32r128): u32r128 = if sseExists(): equ_i32r128_sse else: equ_i32r128_fallback

func equ_i32r128_neon(a, b: i32r128): u32r128 =
  return cast[u32r128](vceqq_s32(cast[neon.Int32x4](a), cast[neon.Int32x4](b)))

let arm_equ_i32r128: proc(a, b: i32r128): u32r128 = if neonExists(): equ_i32r128_neon else: equ_i32r128_fallback

func equ_i32r128_lsx(a, b: i32r128): u32r128 =
  return cast[u32r128](lsx_vseq_w(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_equ_i32r128: proc(a, b: i32r128): u32r128 = if lsxExists(): equ_i32r128_lsx else: equ_i32r128_fallback

template `==`*(a, b: i32r128): u32r128 =
  when defined(amd64) or defined(i386): x86_equ_i32r128(a, b)
  elif defined(arm64): arm_equ_i32r128(a, b)
  elif defined(loongarch64): la_equ_i32r128(a, b)


# ==========================================
# equ (==) / i64r128 -> u64r128
# ==========================================

func equ_i64r128_fallback(a, b: i64r128): u64r128 =
  var output: u64r128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, int64]](addr a)
  let pB   = cast[ptr array[2, int64]](addr b)
  unroll(i, 0, 1): 
    pOut[i] = if pA[i] == pB[i]: 0xFFFFFFFFFFFFFFFF'u64 else: 0'u64
  return output

func equ_i64r128_sse(a, b: i64r128): u64r128 =
  return cast[u64r128](mm_cmpeq_epi64(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_equ_i64r128: proc(a, b: i64r128): u64r128 = if sseExists(): equ_i64r128_sse else: equ_i64r128_fallback

func equ_i64r128_neon(a, b: i64r128): u64r128 =
  return cast[u64r128](vceqq_s64(cast[neon.Int64x2](a), cast[neon.Int64x2](b)))

let arm_equ_i64r128: proc(a, b: i64r128): u64r128 = if neonExists(): equ_i64r128_neon else: equ_i64r128_fallback

func equ_i64r128_lsx(a, b: i64r128): u64r128 =
  return cast[u64r128](lsx_vseq_d(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_equ_i64r128: proc(a, b: i64r128): u64r128 = if lsxExists(): equ_i64r128_lsx else: equ_i64r128_fallback

template `==`*(a, b: i64r128): u64r128 =
  when defined(amd64) or defined(i386): x86_equ_i64r128(a, b)
  elif defined(arm64): arm_equ_i64r128(a, b)
  elif defined(loongarch64): la_equ_i64r128(a, b)


# ==========================================
# equ (==) / u8r128 -> u8r128
# ==========================================

func equ_u8r128_fallback(a, b: u8r128): u8r128 =
  var output: u8r128
  let pOut = cast[ptr array[16, uint8]](addr output)
  let pA   = cast[ptr array[16, uint8]](addr a)
  let pB   = cast[ptr array[16, uint8]](addr b)
  unroll(i, 0, 15): 
    pOut[i] = if pA[i] == pB[i]: 0xFF'u8 else: 0'u8
  return output

func equ_u8r128_sse(a, b: u8r128): u8r128 =
  return cast[u8r128](mm_cmpeq_epi8(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_equ_u8r128: proc(a, b: u8r128): u8r128 = if sseExists(): equ_u8r128_sse else: equ_u8r128_fallback

func equ_u8r128_neon(a, b: u8r128): u8r128 =
  return cast[u8r128](vceqq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b)))

let arm_equ_u8r128: proc(a, b: u8r128): u8r128 = if neonExists(): equ_u8r128_neon else: equ_u8r128_fallback

func equ_u8r128_lsx(a, b: u8r128): u8r128 =
  return cast[u8r128](lsx_vseq_b(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_equ_u8r128: proc(a, b: u8r128): u8r128 = if lsxExists(): equ_u8r128_lsx else: equ_u8r128_fallback

template `==`*(a, b: u8r128): u8r128 =
  when defined(amd64) or defined(i386): x86_equ_u8r128(a, b)
  elif defined(arm64): arm_equ_u8r128(a, b)
  elif defined(loongarch64): la_equ_u8r128(a, b)


# ==========================================
# equ (==) / u16r128 -> u16r128
# ==========================================

func equ_u16r128_fallback(a, b: u16r128): u16r128 =
  var output: u16r128
  let pOut = cast[ptr array[8, uint16]](addr output)
  let pA   = cast[ptr array[8, uint16]](addr a)
  let pB   = cast[ptr array[8, uint16]](addr b)
  unroll(i, 0, 7): 
    pOut[i] = if pA[i] == pB[i]: 0xFFFF'u16 else: 0'u16
  return output

func equ_u16r128_sse(a, b: u16r128): u16r128 =
  return cast[u16r128](mm_cmpeq_epi16(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_equ_u16r128: proc(a, b: u16r128): u16r128 = if sseExists(): equ_u16r128_sse else: equ_u16r128_fallback

func equ_u16r128_neon(a, b: u16r128): u16r128 =
  return cast[u16r128](vceqq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b)))

let arm_equ_u16r128: proc(a, b: u16r128): u16r128 = if neonExists(): equ_u16r128_neon else: equ_u16r128_fallback

func equ_u16r128_lsx(a, b: u16r128): u16r128 =
  return cast[u16r128](lsx_vseq_h(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_equ_u16r128: proc(a, b: u16r128): u16r128 = if lsxExists(): equ_u16r128_lsx else: equ_u16r128_fallback

template `==`*(a, b: u16r128): u16r128 =
  when defined(amd64) or defined(i386): x86_equ_u16r128(a, b)
  elif defined(arm64): arm_equ_u16r128(a, b)
  elif defined(loongarch64): la_equ_u16r128(a, b)


# ==========================================
# equ (==) / u32r128 -> u32r128
# ==========================================

func equ_u32r128_fallback(a, b: u32r128): u32r128 =
  var output: u32r128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, uint32]](addr a)
  let pB   = cast[ptr array[4, uint32]](addr b)
  unroll(i, 0, 3): 
    pOut[i] = if pA[i] == pB[i]: 0xFFFFFFFF'u32 else: 0'u32
  return output

func equ_u32r128_sse(a, b: u32r128): u32r128 =
  return cast[u32r128](mm_cmpeq_epi32(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_equ_u32r128: proc(a, b: u32r128): u32r128 = if sseExists(): equ_u32r128_sse else: equ_u32r128_fallback

func equ_u32r128_neon(a, b: u32r128): u32r128 =
  return cast[u32r128](vceqq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b)))

let arm_equ_u32r128: proc(a, b: u32r128): u32r128 = if neonExists(): equ_u32r128_neon else: equ_u32r128_fallback

func equ_u32r128_lsx(a, b: u32r128): u32r128 =
  return cast[u32r128](lsx_vseq_w(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_equ_u32r128: proc(a, b: u32r128): u32r128 = if lsxExists(): equ_u32r128_lsx else: equ_u32r128_fallback

template `==`*(a, b: u32r128): u32r128 =
  when defined(amd64) or defined(i386): x86_equ_u32r128(a, b)
  elif defined(arm64): arm_equ_u32r128(a, b)
  elif defined(loongarch64): la_equ_u32r128(a, b)


# ==========================================
# equ (==) / u64r128 -> u64r128
# ==========================================

func equ_u64r128_fallback(a, b: u64r128): u64r128 =
  var output: u64r128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, uint64]](addr a)
  let pB   = cast[ptr array[2, uint64]](addr b)
  unroll(i, 0, 1): 
    pOut[i] = if pA[i] == pB[i]: 0xFFFFFFFFFFFFFFFF'u64 else: 0'u64
  return output

func equ_u64r128_sse(a, b: u64r128): u64r128 =
  return cast[u64r128](mm_cmpeq_epi64(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_equ_u64r128: proc(a, b: u64r128): u64r128 = if sseExists(): equ_u64r128_sse else: equ_u64r128_fallback

func equ_u64r128_neon(a, b: u64r128): u64r128 =
  return cast[u64r128](vceqq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b)))

let arm_equ_u64r128: proc(a, b: u64r128): u64r128 = if neonExists(): equ_u64r128_neon else: equ_u64r128_fallback

func equ_u64r128_lsx(a, b: u64r128): u64r128 =
  return cast[u64r128](lsx_vseq_d(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_equ_u64r128: proc(a, b: u64r128): u64r128 = if lsxExists(): equ_u64r128_lsx else: equ_u64r128_fallback

template `==`*(a, b: u64r128): u64r128 =
  when defined(amd64) or defined(i386): x86_equ_u64r128(a, b)
  elif defined(arm64): arm_equ_u64r128(a, b)
  elif defined(loongarch64): la_equ_u64r128(a, b)

# ==========================================
# equ (==) / f32v128 -> u32v128
# ==========================================

func equ_f32v128_fallback(a, b: f32v128): u32v128 =
  var output: u32v128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, float32]](addr a)
  let pB   = cast[ptr array[4, float32]](addr b)
  unroll(i, 0, 3): 
    pOut[i] = if pA[i] == pB[i]: 0xFFFFFFFF'u32 else: 0'u32
  return output

func equ_f32v128_sse(a, b: f32v128): u32v128 =
  return cast[u32v128](mm_castps_si128(mm_cmpeq_ps(cast[sse.M128](a), cast[sse.M128](b))))

let x86_equ_f32v128: proc(a, b: f32v128): u32v128 = if sseExists(): equ_f32v128_sse else: equ_f32v128_fallback

func equ_f32v128_neon(a, b: f32v128): u32v128 =
  return cast[u32v128](vceqq_f32(cast[neon.Float32x4](a), cast[neon.Float32x4](b)))

let arm_equ_f32v128: proc(a, b: f32v128): u32v128 = if neonExists(): equ_f32v128_neon else: equ_f32v128_fallback

func equ_f32v128_lsx(a, b: f32v128): u32v128 =
  return cast[u32v128](lsx_vfcmp_ceq_s(cast[lsx.M128](a), cast[lsx.M128](b)))

let la_equ_f32v128: proc(a, b: f32v128): u32v128 = if lsxExists(): equ_f32v128_lsx else: equ_f32v128_fallback

template `==`*(a, b: f32v128): u32v128 =
  when defined(amd64) or defined(i386): x86_equ_f32v128(a, b)
  elif defined(arm64): arm_equ_f32v128(a, b)
  elif defined(loongarch64): la_equ_f32v128(a, b)


# ==========================================
# equ (==) / f64v128 -> u64v128
# ==========================================

func equ_f64v128_fallback(a, b: f64v128): u64v128 =
  var output: u64v128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, float64]](addr a)
  let pB   = cast[ptr array[2, float64]](addr b)
  unroll(i, 0, 1): 
    pOut[i] = if pA[i] == pB[i]: 0xFFFFFFFFFFFFFFFF'u64 else: 0'u64
  return output

func equ_f64v128_sse(a, b: f64v128): u64v128 =
  return cast[u64v128](mm_castpd_si128(mm_cmpeq_pd(cast[sse2.M128d](a), cast[sse2.M128d](b))))

let x86_equ_f64v128: proc(a, b: f64v128): u64v128 = if sseExists(): equ_f64v128_sse else: equ_f64v128_fallback

func equ_f64v128_neon(a, b: f64v128): u64v128 =
  return cast[u64v128](vceqq_f64(cast[neon.Float64x2](a), cast[neon.Float64x2](b)))

let arm_equ_f64v128: proc(a, b: f64v128): u64v128 = if neonExists(): equ_f64v128_neon else: equ_f64v128_fallback

func equ_f64v128_lsx(a, b: f64v128): u64v128 =
  return cast[u64v128](lsx_vfcmp_ceq_d(cast[lsx.M128d](a), cast[lsx.M128d](b)))

let la_equ_f64v128: proc(a, b: f64v128): u64v128 = if lsxExists(): equ_f64v128_lsx else: equ_f64v128_fallback

template `==`*(a, b: f64v128): u64v128 =
  when defined(amd64) or defined(i386): x86_equ_f64v128(a, b)
  elif defined(arm64): arm_equ_f64v128(a, b)
  elif defined(loongarch64): la_equ_f64v128(a, b)


# ==========================================
# equ (==) / i8v128 -> u8v128
# ==========================================

func equ_i8v128_fallback(a, b: i8v128): u8v128 =
  var output: u8v128
  let pOut = cast[ptr array[16, uint8]](addr output)
  let pA   = cast[ptr array[16, int8]](addr a)
  let pB   = cast[ptr array[16, int8]](addr b)
  unroll(i, 0, 15): 
    pOut[i] = if pA[i] == pB[i]: 0xFF'u8 else: 0'u8
  return output

func equ_i8v128_sse(a, b: i8v128): u8v128 =
  return cast[u8v128](mm_cmpeq_epi8(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_equ_i8v128: proc(a, b: i8v128): u8v128 = if sseExists(): equ_i8v128_sse else: equ_i8v128_fallback

func equ_i8v128_neon(a, b: i8v128): u8v128 =
  return cast[u8v128](vceqq_s8(cast[neon.Int8x16](a), cast[neon.Int8x16](b)))

let arm_equ_i8v128: proc(a, b: i8v128): u8v128 = if neonExists(): equ_i8v128_neon else: equ_i8v128_fallback

func equ_i8v128_lsx(a, b: i8v128): u8v128 =
  return cast[u8v128](lsx_vseq_b(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_equ_i8v128: proc(a, b: i8v128): u8v128 = if lsxExists(): equ_i8v128_lsx else: equ_i8v128_fallback

template `==`*(a, b: i8v128): u8v128 =
  when defined(amd64) or defined(i386): x86_equ_i8v128(a, b)
  elif defined(arm64): arm_equ_i8v128(a, b)
  elif defined(loongarch64): la_equ_i8v128(a, b)


# ==========================================
# equ (==) / i16v128 -> u16v128
# ==========================================

func equ_i16v128_fallback(a, b: i16v128): u16v128 =
  var output: u16v128
  let pOut = cast[ptr array[8, uint16]](addr output)
  let pA   = cast[ptr array[8, int16]](addr a)
  let pB   = cast[ptr array[8, int16]](addr b)
  unroll(i, 0, 7): 
    pOut[i] = if pA[i] == pB[i]: 0xFFFF'u16 else: 0'u16
  return output

func equ_i16v128_sse(a, b: i16v128): u16v128 =
  return cast[u16v128](mm_cmpeq_epi16(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_equ_i16v128: proc(a, b: i16v128): u16v128 = if sseExists(): equ_i16v128_sse else: equ_i16v128_fallback

func equ_i16v128_neon(a, b: i16v128): u16v128 =
  return cast[u16v128](vceqq_s16(cast[neon.Int16x8](a), cast[neon.Int16x8](b)))

let arm_equ_i16v128: proc(a, b: i16v128): u16v128 = if neonExists(): equ_i16v128_neon else: equ_i16v128_fallback

func equ_i16v128_lsx(a, b: i16v128): u16v128 =
  return cast[u16v128](lsx_vseq_h(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_equ_i16v128: proc(a, b: i16v128): u16v128 = if lsxExists(): equ_i16v128_lsx else: equ_i16v128_fallback

template `==`*(a, b: i16v128): u16v128 =
  when defined(amd64) or defined(i386): x86_equ_i16v128(a, b)
  elif defined(arm64): arm_equ_i16v128(a, b)
  elif defined(loongarch64): la_equ_i16v128(a, b)


# ==========================================
# equ (==) / i32v128 -> u32v128
# ==========================================

func equ_i32v128_fallback(a, b: i32v128): u32v128 =
  var output: u32v128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, int32]](addr a)
  let pB   = cast[ptr array[4, int32]](addr b)
  unroll(i, 0, 3): 
    pOut[i] = if pA[i] == pB[i]: 0xFFFFFFFF'u32 else: 0'u32
  return output

func equ_i32v128_sse(a, b: i32v128): u32v128 =
  return cast[u32v128](mm_cmpeq_epi32(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_equ_i32v128: proc(a, b: i32v128): u32v128 = if sseExists(): equ_i32v128_sse else: equ_i32v128_fallback

func equ_i32v128_neon(a, b: i32v128): u32v128 =
  return cast[u32v128](vceqq_s32(cast[neon.Int32x4](a), cast[neon.Int32x4](b)))

let arm_equ_i32v128: proc(a, b: i32v128): u32v128 = if neonExists(): equ_i32v128_neon else: equ_i32v128_fallback

func equ_i32v128_lsx(a, b: i32v128): u32v128 =
  return cast[u32v128](lsx_vseq_w(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_equ_i32v128: proc(a, b: i32v128): u32v128 = if lsxExists(): equ_i32v128_lsx else: equ_i32v128_fallback

template `==`*(a, b: i32v128): u32v128 =
  when defined(amd64) or defined(i386): x86_equ_i32v128(a, b)
  elif defined(arm64): arm_equ_i32v128(a, b)
  elif defined(loongarch64): la_equ_i32v128(a, b)


# ==========================================
# equ (==) / i64v128 -> u64v128
# ==========================================

func equ_i64v128_fallback(a, b: i64v128): u64v128 =
  var output: u64v128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, int64]](addr a)
  let pB   = cast[ptr array[2, int64]](addr b)
  unroll(i, 0, 1): 
    pOut[i] = if pA[i] == pB[i]: 0xFFFFFFFFFFFFFFFF'u64 else: 0'u64
  return output

func equ_i64v128_sse(a, b: i64v128): u64v128 =
  return cast[u64v128](mm_cmpeq_epi64(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_equ_i64v128: proc(a, b: i64v128): u64v128 = if sseExists(): equ_i64v128_sse else: equ_i64v128_fallback

func equ_i64v128_neon(a, b: i64v128): u64v128 =
  return cast[u64v128](vceqq_s64(cast[neon.Int64x2](a), cast[neon.Int64x2](b)))

let arm_equ_i64v128: proc(a, b: i64v128): u64v128 = if neonExists(): equ_i64v128_neon else: equ_i64v128_fallback

func equ_i64v128_lsx(a, b: i64v128): u64v128 =
  return cast[u64v128](lsx_vseq_d(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_equ_i64v128: proc(a, b: i64v128): u64v128 = if lsxExists(): equ_i64v128_lsx else: equ_i64v128_fallback

template `==`*(a, b: i64v128): u64v128 =
  when defined(amd64) or defined(i386): x86_equ_i64v128(a, b)
  elif defined(arm64): arm_equ_i64v128(a, b)
  elif defined(loongarch64): la_equ_i64v128(a, b)


# ==========================================
# equ (==) / u8v128 -> u8v128
# ==========================================

func equ_u8v128_fallback(a, b: u8v128): u8v128 =
  var output: u8v128
  let pOut = cast[ptr array[16, uint8]](addr output)
  let pA   = cast[ptr array[16, uint8]](addr a)
  let pB   = cast[ptr array[16, uint8]](addr b)
  unroll(i, 0, 15): 
    pOut[i] = if pA[i] == pB[i]: 0xFF'u8 else: 0'u8
  return output

func equ_u8v128_sse(a, b: u8v128): u8v128 =
  return cast[u8v128](mm_cmpeq_epi8(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_equ_u8v128: proc(a, b: u8v128): u8v128 = if sseExists(): equ_u8v128_sse else: equ_u8v128_fallback

func equ_u8v128_neon(a, b: u8v128): u8v128 =
  return cast[u8v128](vceqq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b)))

let arm_equ_u8v128: proc(a, b: u8v128): u8v128 = if neonExists(): equ_u8v128_neon else: equ_u8v128_fallback

func equ_u8v128_lsx(a, b: u8v128): u8v128 =
  return cast[u8v128](lsx_vseq_b(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_equ_u8v128: proc(a, b: u8v128): u8v128 = if lsxExists(): equ_u8v128_lsx else: equ_u8v128_fallback

template `==`*(a, b: u8v128): u8v128 =
  when defined(amd64) or defined(i386): x86_equ_u8v128(a, b)
  elif defined(arm64): arm_equ_u8v128(a, b)
  elif defined(loongarch64): la_equ_u8v128(a, b)


# ==========================================
# equ (==) / u16v128 -> u16v128
# ==========================================

func equ_u16v128_fallback(a, b: u16v128): u16v128 =
  var output: u16v128
  let pOut = cast[ptr array[8, uint16]](addr output)
  let pA   = cast[ptr array[8, uint16]](addr a)
  let pB   = cast[ptr array[8, uint16]](addr b)
  unroll(i, 0, 7): 
    pOut[i] = if pA[i] == pB[i]: 0xFFFF'u16 else: 0'u16
  return output

func equ_u16v128_sse(a, b: u16v128): u16v128 =
  return cast[u16v128](mm_cmpeq_epi16(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_equ_u16v128: proc(a, b: u16v128): u16v128 = if sseExists(): equ_u16v128_sse else: equ_u16v128_fallback

func equ_u16v128_neon(a, b: u16v128): u16v128 =
  return cast[u16v128](vceqq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b)))

let arm_equ_u16v128: proc(a, b: u16v128): u16v128 = if neonExists(): equ_u16v128_neon else: equ_u16v128_fallback

func equ_u16v128_lsx(a, b: u16v128): u16v128 =
  return cast[u16v128](lsx_vseq_h(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_equ_u16v128: proc(a, b: u16v128): u16v128 = if lsxExists(): equ_u16v128_lsx else: equ_u16v128_fallback

template `==`*(a, b: u16v128): u16v128 =
  when defined(amd64) or defined(i386): x86_equ_u16v128(a, b)
  elif defined(arm64): arm_equ_u16v128(a, b)
  elif defined(loongarch64): la_equ_u16v128(a, b)


# ==========================================
# equ (==) / u32v128 -> u32v128
# ==========================================

func equ_u32v128_fallback(a, b: u32v128): u32v128 =
  var output: u32v128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, uint32]](addr a)
  let pB   = cast[ptr array[4, uint32]](addr b)
  unroll(i, 0, 3): 
    pOut[i] = if pA[i] == pB[i]: 0xFFFFFFFF'u32 else: 0'u32
  return output

func equ_u32v128_sse(a, b: u32v128): u32v128 =
  return cast[u32v128](mm_cmpeq_epi32(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_equ_u32v128: proc(a, b: u32v128): u32v128 = if sseExists(): equ_u32v128_sse else: equ_u32v128_fallback

func equ_u32v128_neon(a, b: u32v128): u32v128 =
  return cast[u32v128](vceqq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b)))

let arm_equ_u32v128: proc(a, b: u32v128): u32v128 = if neonExists(): equ_u32v128_neon else: equ_u32v128_fallback

func equ_u32v128_lsx(a, b: u32v128): u32v128 =
  return cast[u32v128](lsx_vseq_w(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_equ_u32v128: proc(a, b: u32v128): u32v128 = if lsxExists(): equ_u32v128_lsx else: equ_u32v128_fallback

template `==`*(a, b: u32v128): u32v128 =
  when defined(amd64) or defined(i386): x86_equ_u32v128(a, b)
  elif defined(arm64): arm_equ_u32v128(a, b)
  elif defined(loongarch64): la_equ_u32v128(a, b)


# ==========================================
# equ (==) / u64v128 -> u64v128
# ==========================================

func equ_u64v128_fallback(a, b: u64v128): u64v128 =
  var output: u64v128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, uint64]](addr a)
  let pB   = cast[ptr array[2, uint64]](addr b)
  unroll(i, 0, 1): 
    pOut[i] = if pA[i] == pB[i]: 0xFFFFFFFFFFFFFFFF'u64 else: 0'u64
  return output

func equ_u64v128_sse(a, b: u64v128): u64v128 =
  return cast[u64v128](mm_cmpeq_epi64(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_equ_u64v128: proc(a, b: u64v128): u64v128 = if sseExists(): equ_u64v128_sse else: equ_u64v128_fallback

func equ_u64v128_neon(a, b: u64v128): u64v128 =
  return cast[u64v128](vceqq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b)))

let arm_equ_u64v128: proc(a, b: u64v128): u64v128 = if neonExists(): equ_u64v128_neon else: equ_u64v128_fallback

func equ_u64v128_lsx(a, b: u64v128): u64v128 =
  return cast[u64v128](lsx_vseq_d(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_equ_u64v128: proc(a, b: u64v128): u64v128 = if lsxExists(): equ_u64v128_lsx else: equ_u64v128_fallback

template `==`*(a, b: u64v128): u64v128 =
  when defined(amd64) or defined(i386): x86_equ_u64v128(a, b)
  elif defined(arm64): arm_equ_u64v128(a, b)
  elif defined(loongarch64): la_equ_u64v128(a, b)

# ==========================================
# ncq (!=) / f32r128 -> u32r128
# ==========================================

func ncq_f32r128_fallback(a, b: f32r128): u32r128 =
  var output: u32r128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, float32]](addr a)
  let pB   = cast[ptr array[4, float32]](addr b)
  unroll(i, 0, 3): 
    pOut[i] = if pA[i] != pB[i]: 0xFFFFFFFF'u32 else: 0'u32
  return output

func ncq_f32r128_sse(a, b: f32r128): u32r128 =
  return cast[u32r128](mm_castps_si128(mm_cmpneq_ps(cast[sse.M128](a), cast[sse.M128](b))))

let x86_ncq_f32r128: proc(a, b: f32r128): u32r128 = if sseExists(): ncq_f32r128_sse else: ncq_f32r128_fallback

func ncq_f32r128_neon(a, b: f32r128): u32r128 =
  return cast[u32r128](vmvnq_u32(vceqq_f32(cast[neon.Float32x4](a), cast[neon.Float32x4](b))))

let arm_ncq_f32r128: proc(a, b: f32r128): u32r128 = if neonExists(): ncq_f32r128_neon else: ncq_f32r128_fallback

func ncq_f32r128_lsx(a, b: f32r128): u32r128 =
  return cast[u32r128](lsx_vfcmp_cne_s(cast[lsx.M128](a), cast[lsx.M128](b)))

let la_ncq_f32r128: proc(a, b: f32r128): u32r128 = if lsxExists(): ncq_f32r128_lsx else: ncq_f32r128_fallback

template `!=`*(a, b: f32r128): u32r128 =
  when defined(amd64) or defined(i386): x86_ncq_f32r128(a, b)
  elif defined(arm64): arm_ncq_f32r128(a, b)
  elif defined(loongarch64): la_ncq_f32r128(a, b)


# ==========================================
# ncq (!=) / f64r128 -> u64r128
# ==========================================

func ncq_f64r128_fallback(a, b: f64r128): u64r128 =
  var output: u64r128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, float64]](addr a)
  let pB   = cast[ptr array[2, float64]](addr b)
  unroll(i, 0, 1): 
    pOut[i] = if pA[i] != pB[i]: 0xFFFFFFFFFFFFFFFF'u64 else: 0'u64
  return output

func ncq_f64r128_sse(a, b: f64r128): u64r128 =
  return cast[u64r128](mm_castpd_si128(mm_cmpneq_pd(cast[sse2.M128d](a), cast[sse2.M128d](b))))

let x86_ncq_f64r128: proc(a, b: f64r128): u64r128 = if sseExists(): ncq_f64r128_sse else: ncq_f64r128_fallback

func ncq_f64r128_neon(a, b: f64r128): u64r128 =
  return cast[u64r128](vmvnq_u32(cast[neon.Uint32x4](vceqq_f64(cast[neon.Float64x2](a), cast[neon.Float64x2](b)))))

let arm_ncq_f64r128: proc(a, b: f64r128): u64r128 = if neonExists(): ncq_f64r128_neon else: ncq_f64r128_fallback

func ncq_f64r128_lsx(a, b: f64r128): u64r128 =
  return cast[u64r128](lsx_vfcmp_cne_d(cast[lsx.M128d](a), cast[lsx.M128d](b)))

let la_ncq_f64r128: proc(a, b: f64r128): u64r128 = if lsxExists(): ncq_f64r128_lsx else: ncq_f64r128_fallback

template `!=`*(a, b: f64r128): u64r128 =
  when defined(amd64) or defined(i386): x86_ncq_f64r128(a, b)
  elif defined(arm64): arm_ncq_f64r128(a, b)
  elif defined(loongarch64): la_ncq_f64r128(a, b)


# ==========================================
# ncq (!=) / i8r128 -> u8r128
# ==========================================

func ncq_i8r128_fallback(a, b: i8r128): u8r128 =
  var output: u8r128
  let pOut = cast[ptr array[16, uint8]](addr output)
  let pA   = cast[ptr array[16, int8]](addr a)
  let pB   = cast[ptr array[16, int8]](addr b)
  unroll(i, 0, 15): 
    pOut[i] = if pA[i] != pB[i]: 0xFF'u8 else: 0'u8
  return output

func ncq_i8r128_sse(a, b: i8r128): u8r128 =
  let eq = mm_cmpeq_epi8(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[u8r128](mm_andnot_si128(eq, mm_set1_epi8(cast[int8](0xFF'u8))))

let x86_ncq_i8r128: proc(a, b: i8r128): u8r128 = if sseExists(): ncq_i8r128_sse else: ncq_i8r128_fallback

func ncq_i8r128_neon(a, b: i8r128): u8r128 =
  return cast[u8r128](vmvnq_u8(vceqq_s8(cast[neon.Int8x16](a), cast[neon.Int8x16](b))))

let arm_ncq_i8r128: proc(a, b: i8r128): u8r128 = if neonExists(): ncq_i8r128_neon else: ncq_i8r128_fallback

func ncq_i8r128_lsx(a, b: i8r128): u8r128 =
  # LSX   !=   seq  vnor .
  let eq = lsx_vseq_b(cast[lsx.M128i](a), cast[lsx.M128i](b))
  return cast[u8r128](lsx_vnor_v(eq, eq))

let la_ncq_i8r128: proc(a, b: i8r128): u8r128 = if lsxExists(): ncq_i8r128_lsx else: ncq_i8r128_fallback

template `!=`*(a, b: i8r128): u8r128 =
  when defined(amd64) or defined(i386): x86_ncq_i8r128(a, b)
  elif defined(arm64): arm_ncq_i8r128(a, b)
  elif defined(loongarch64): la_ncq_i8r128(a, b)


# ==========================================
# ncq (!=) / i16r128 -> u16r128
# ==========================================

func ncq_i16r128_fallback(a, b: i16r128): u16r128 =
  var output: u16r128
  let pOut = cast[ptr array[8, uint16]](addr output)
  let pA   = cast[ptr array[8, int16]](addr a)
  let pB   = cast[ptr array[8, int16]](addr b)
  unroll(i, 0, 7): 
    pOut[i] = if pA[i] != pB[i]: 0xFFFF'u16 else: 0'u16
  return output

func ncq_i16r128_sse(a, b: i16r128): u16r128 =
  let eq = mm_cmpeq_epi16(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[u16r128](mm_andnot_si128(eq, mm_set1_epi16(cast[int16](0xFFFF'u16))))

let x86_ncq_i16r128: proc(a, b: i16r128): u16r128 = if sseExists(): ncq_i16r128_sse else: ncq_i16r128_fallback

func ncq_i16r128_neon(a, b: i16r128): u16r128 =
  return cast[u16r128](vmvnq_u16(vceqq_s16(cast[neon.Int16x8](a), cast[neon.Int16x8](b))))

let arm_ncq_i16r128: proc(a, b: i16r128): u16r128 = if neonExists(): ncq_i16r128_neon else: ncq_i16r128_fallback

func ncq_i16r128_lsx(a, b: i16r128): u16r128 =
  let eq = lsx_vseq_h(cast[lsx.M128i](a), cast[lsx.M128i](b))
  return cast[u16r128](lsx_vnor_v(eq, eq))

let la_ncq_i16r128: proc(a, b: i16r128): u16r128 = if lsxExists(): ncq_i16r128_lsx else: ncq_i16r128_fallback

template `!=`*(a, b: i16r128): u16r128 =
  when defined(amd64) or defined(i386): x86_ncq_i16r128(a, b)
  elif defined(arm64): arm_ncq_i16r128(a, b)
  elif defined(loongarch64): la_ncq_i16r128(a, b)


# ==========================================
# ncq (!=) / i32r128 -> u32r128
# ==========================================

func ncq_i32r128_fallback(a, b: i32r128): u32r128 =
  var output: u32r128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, int32]](addr a)
  let pB   = cast[ptr array[4, int32]](addr b)
  unroll(i, 0, 3): 
    pOut[i] = if pA[i] != pB[i]: 0xFFFFFFFF'u32 else: 0'u32
  return output

func ncq_i32r128_sse(a, b: i32r128): u32r128 =
  let eq = mm_cmpeq_epi32(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[u32r128](mm_andnot_si128(eq, mm_set1_epi32(cast[int32](0xFFFFFFFF'u32))))

let x86_ncq_i32r128: proc(a, b: i32r128): u32r128 = if sseExists(): ncq_i32r128_sse else: ncq_i32r128_fallback

func ncq_i32r128_neon(a, b: i32r128): u32r128 =
  return cast[u32r128](vmvnq_u32(vceqq_s32(cast[neon.Int32x4](a), cast[neon.Int32x4](b))))

let arm_ncq_i32r128: proc(a, b: i32r128): u32r128 = if neonExists(): ncq_i32r128_neon else: ncq_i32r128_fallback

func ncq_i32r128_lsx(a, b: i32r128): u32r128 =
  let eq = lsx_vseq_w(cast[lsx.M128i](a), cast[lsx.M128i](b))
  return cast[u32r128](lsx_vnor_v(eq, eq))

let la_ncq_i32r128: proc(a, b: i32r128): u32r128 = if lsxExists(): ncq_i32r128_lsx else: ncq_i32r128_fallback

template `!=`*(a, b: i32r128): u32r128 =
  when defined(amd64) or defined(i386): x86_ncq_i32r128(a, b)
  elif defined(arm64): arm_ncq_i32r128(a, b)
  elif defined(loongarch64): la_ncq_i32r128(a, b)


# ==========================================
# ncq (!=) / i64r128 -> u64r128
# ==========================================

func ncq_i64r128_fallback(a, b: i64r128): u64r128 =
  var output: u64r128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, int64]](addr a)
  let pB   = cast[ptr array[2, int64]](addr b)
  unroll(i, 0, 1): 
    pOut[i] = if pA[i] != pB[i]: 0xFFFFFFFFFFFFFFFF'u64 else: 0'u64
  return output

func ncq_i64r128_sse(a, b: i64r128): u64r128 =
  let eq = mm_cmpeq_epi64(cast[sse2.M128i](a), cast[sse2.M128i](b))
  let mask: M64 = cast[M64](0xFFFFFFFFFFFFFFFF'u64)
  return cast[u64r128](mm_andnot_si128(eq, mm_set1_epi64(mask)))

let x86_ncq_i64r128: proc(a, b: i64r128): u64r128 = if sseExists(): ncq_i64r128_sse else: ncq_i64r128_fallback

func ncq_i64r128_neon(a, b: i64r128): u64r128 =
  return cast[u64r128](vmvnq_u32(cast[neon.Uint32x4](vceqq_s64(cast[neon.Int64x2](a), cast[neon.Int64x2](b)))))

let arm_ncq_i64r128: proc(a, b: i64r128): u64r128 = if neonExists(): ncq_i64r128_neon else: ncq_i64r128_fallback

func ncq_i64r128_lsx(a, b: i64r128): u64r128 =
  let eq = lsx_vseq_d(cast[lsx.M128i](a), cast[lsx.M128i](b))
  return cast[u64r128](lsx_vnor_v(eq, eq))

let la_ncq_i64r128: proc(a, b: i64r128): u64r128 = if lsxExists(): ncq_i64r128_lsx else: ncq_i64r128_fallback

template `!=`*(a, b: i64r128): u64r128 =
  when defined(amd64) or defined(i386): x86_ncq_i64r128(a, b)
  elif defined(arm64): arm_ncq_i64r128(a, b)
  elif defined(loongarch64): la_ncq_i64r128(a, b)


# ==========================================
# ncq (!=) / u8r128 -> u8r128
# ==========================================

func ncq_u8r128_fallback(a, b: u8r128): u8r128 =
  var output: u8r128
  let pOut = cast[ptr array[16, uint8]](addr output)
  let pA   = cast[ptr array[16, uint8]](addr a)
  let pB   = cast[ptr array[16, uint8]](addr b)
  unroll(i, 0, 15): 
    pOut[i] = if pA[i] != pB[i]: 0xFF'u8 else: 0'u8
  return output

func ncq_u8r128_sse(a, b: u8r128): u8r128 =
  let eq = mm_cmpeq_epi8(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[u8r128](mm_andnot_si128(eq, mm_set1_epi8(cast[int8](0xFF'u8))))

let x86_ncq_u8r128: proc(a, b: u8r128): u8r128 = if sseExists(): ncq_u8r128_sse else: ncq_u8r128_fallback

func ncq_u8r128_neon(a, b: u8r128): u8r128 =
  return cast[u8r128](vmvnq_u8(vceqq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b))))

let arm_ncq_u8r128: proc(a, b: u8r128): u8r128 = if neonExists(): ncq_u8r128_neon else: ncq_u8r128_fallback

func ncq_u8r128_lsx(a, b: u8r128): u8r128 =
  let eq = lsx_vseq_b(cast[lsx.M128i](a), cast[lsx.M128i](b))
  return cast[u8r128](lsx_vnor_v(eq, eq))

let la_ncq_u8r128: proc(a, b: u8r128): u8r128 = if lsxExists(): ncq_u8r128_lsx else: ncq_u8r128_fallback

template `!=`*(a, b: u8r128): u8r128 =
  when defined(amd64) or defined(i386): x86_ncq_u8r128(a, b)
  elif defined(arm64): arm_ncq_u8r128(a, b)
  elif defined(loongarch64): la_ncq_u8r128(a, b)


# ==========================================
# ncq (!=) / u16r128 -> u16r128
# ==========================================

func ncq_u16r128_fallback(a, b: u16r128): u16r128 =
  var output: u16r128
  let pOut = cast[ptr array[8, uint16]](addr output)
  let pA   = cast[ptr array[8, uint16]](addr a)
  let pB   = cast[ptr array[8, uint16]](addr b)
  unroll(i, 0, 7): 
    pOut[i] = if pA[i] != pB[i]: 0xFFFF'u16 else: 0'u16
  return output

func ncq_u16r128_sse(a, b: u16r128): u16r128 =
  let eq = mm_cmpeq_epi16(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[u16r128](mm_andnot_si128(eq, mm_set1_epi16(cast[int16](0xFFFF'u16))))

let x86_ncq_u16r128: proc(a, b: u16r128): u16r128 = if sseExists(): ncq_u16r128_sse else: ncq_u16r128_fallback

func ncq_u16r128_neon(a, b: u16r128): u16r128 =
  return cast[u16r128](vmvnq_u16(vceqq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b))))

let arm_ncq_u16r128: proc(a, b: u16r128): u16r128 = if neonExists(): ncq_u16r128_neon else: ncq_u16r128_fallback

func ncq_u16r128_lsx(a, b: u16r128): u16r128 =
  let eq = lsx_vseq_h(cast[lsx.M128i](a), cast[lsx.M128i](b))
  return cast[u16r128](lsx_vnor_v(eq, eq))

let la_ncq_u16r128: proc(a, b: u16r128): u16r128 = if lsxExists(): ncq_u16r128_lsx else: ncq_u16r128_fallback

template `!=`*(a, b: u16r128): u16r128 =
  when defined(amd64) or defined(i386): x86_ncq_u16r128(a, b)
  elif defined(arm64): arm_ncq_u16r128(a, b)
  elif defined(loongarch64): la_ncq_u16r128(a, b)


# ==========================================
# ncq (!=) / u32r128 -> u32r128
# ==========================================

func ncq_u32r128_fallback(a, b: u32r128): u32r128 =
  var output: u32r128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, uint32]](addr a)
  let pB   = cast[ptr array[4, uint32]](addr b)
  unroll(i, 0, 3): 
    pOut[i] = if pA[i] != pB[i]: 0xFFFFFFFF'u32 else: 0'u32
  return output

func ncq_u32r128_sse(a, b: u32r128): u32r128 =
  let eq = mm_cmpeq_epi32(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[u32r128](mm_andnot_si128(eq, mm_set1_epi32(cast[int32](0xFFFFFFFF'u32))))

let x86_ncq_u32r128: proc(a, b: u32r128): u32r128 = if sseExists(): ncq_u32r128_sse else: ncq_u32r128_fallback

func ncq_u32r128_neon(a, b: u32r128): u32r128 =
  return cast[u32r128](vmvnq_u32(vceqq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b))))

let arm_ncq_u32r128: proc(a, b: u32r128): u32r128 = if neonExists(): ncq_u32r128_neon else: ncq_u32r128_fallback

func ncq_u32r128_lsx(a, b: u32r128): u32r128 =
  let eq = lsx_vseq_w(cast[lsx.M128i](a), cast[lsx.M128i](b))
  return cast[u32r128](lsx_vnor_v(eq, eq))

let la_ncq_u32r128: proc(a, b: u32r128): u32r128 = if lsxExists(): ncq_u32r128_lsx else: ncq_u32r128_fallback

template `!=`*(a, b: u32r128): u32r128 =
  when defined(amd64) or defined(i386): x86_ncq_u32r128(a, b)
  elif defined(arm64): arm_ncq_u32r128(a, b)
  elif defined(loongarch64): la_ncq_u32r128(a, b)


# ==========================================
# ncq (!=) / u64r128 -> u64r128
# ==========================================

func ncq_u64r128_fallback(a, b: u64r128): u64r128 =
  var output: u64r128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, uint64]](addr a)
  let pB   = cast[ptr array[2, uint64]](addr b)
  unroll(i, 0, 1): 
    pOut[i] = if pA[i] != pB[i]: 0xFFFFFFFFFFFFFFFF'u64 else: 0'u64
  return output

func ncq_u64r128_sse(a, b: u64r128): u64r128 =
  let eq = mm_cmpeq_epi64(cast[sse2.M128i](a), cast[sse2.M128i](b))
  let mask: M64 = cast[M64](0xFFFFFFFFFFFFFFFF'u64)
  return cast[u64r128](mm_andnot_si128(eq, mm_set1_epi64(mask)))

let x86_ncq_u64r128: proc(a, b: u64r128): u64r128 = if sseExists(): ncq_u64r128_sse else: ncq_u64r128_fallback

func ncq_u64r128_neon(a, b: u64r128): u64r128 =
  return cast[u64r128](vmvnq_u32(cast[neon.Uint32x4](vceqq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b)))))

let arm_ncq_u64r128: proc(a, b: u64r128): u64r128 = if neonExists(): ncq_u64r128_neon else: ncq_u64r128_fallback

func ncq_u64r128_lsx(a, b: u64r128): u64r128 =
  let eq = lsx_vseq_d(cast[lsx.M128i](a), cast[lsx.M128i](b))
  return cast[u64r128](lsx_vnor_v(eq, eq))

let la_ncq_u64r128: proc(a, b: u64r128): u64r128 = if lsxExists(): ncq_u64r128_lsx else: ncq_u64r128_fallback

template `!=`*(a, b: u64r128): u64r128 =
  when defined(amd64) or defined(i386): x86_ncq_u64r128(a, b)
  elif defined(arm64): arm_ncq_u64r128(a, b)
  elif defined(loongarch64): la_ncq_u64r128(a, b)

# ==========================================
# ncq (!=) / f32v128 -> u32v128
# ==========================================

func ncq_f32v128_fallback(a, b: f32v128): u32v128 =
  var output: u32v128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, float32]](addr a)
  let pB   = cast[ptr array[4, float32]](addr b)
  unroll(i, 0, 3): 
    pOut[i] = if pA[i] != pB[i]: 0xFFFFFFFF'u32 else: 0'u32
  return output

func ncq_f32v128_sse(a, b: f32v128): u32v128 =
  return cast[u32v128](mm_castps_si128(mm_cmpneq_ps(cast[sse.M128](a), cast[sse.M128](b))))

let x86_ncq_f32v128: proc(a, b: f32v128): u32v128 = if sseExists(): ncq_f32v128_sse else: ncq_f32v128_fallback

func ncq_f32v128_neon(a, b: f32v128): u32v128 =
  return cast[u32v128](vmvnq_u32(vceqq_f32(cast[neon.Float32x4](a), cast[neon.Float32x4](b))))

let arm_ncq_f32v128: proc(a, b: f32v128): u32v128 = if neonExists(): ncq_f32v128_neon else: ncq_f32v128_fallback

func ncq_f32v128_lsx(a, b: f32v128): u32v128 =
  return cast[u32v128](lsx_vfcmp_cne_s(cast[lsx.M128](a), cast[lsx.M128](b)))

let la_ncq_f32v128: proc(a, b: f32v128): u32v128 = if lsxExists(): ncq_f32v128_lsx else: ncq_f32v128_fallback

template `!=`*(a, b: f32v128): u32v128 =
  when defined(amd64) or defined(i386): x86_ncq_f32v128(a, b)
  elif defined(arm64): arm_ncq_f32v128(a, b)
  elif defined(loongarch64): la_ncq_f32v128(a, b)


# ==========================================
# ncq (!=) / f64v128 -> u64v128
# ==========================================

func ncq_f64v128_fallback(a, b: f64v128): u64v128 =
  var output: u64v128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, float64]](addr a)
  let pB   = cast[ptr array[2, float64]](addr b)
  unroll(i, 0, 1): 
    pOut[i] = if pA[i] != pB[i]: 0xFFFFFFFFFFFFFFFF'u64 else: 0'u64
  return output

func ncq_f64v128_sse(a, b: f64v128): u64v128 =
  return cast[u64v128](mm_castpd_si128(mm_cmpneq_pd(cast[sse2.M128d](a), cast[sse2.M128d](b))))

let x86_ncq_f64v128: proc(a, b: f64v128): u64v128 = if sseExists(): ncq_f64v128_sse else: ncq_f64v128_fallback

func ncq_f64v128_neon(a, b: f64v128): u64v128 =
  return cast[u64v128](vmvnq_u32(cast[neon.Uint32x4](vceqq_f64(cast[neon.Float64x2](a), cast[neon.Float64x2](b)))))

let arm_ncq_f64v128: proc(a, b: f64v128): u64v128 = if neonExists(): ncq_f64v128_neon else: ncq_f64v128_fallback

func ncq_f64v128_lsx(a, b: f64v128): u64v128 =
  return cast[u64v128](lsx_vfcmp_cne_d(cast[lsx.M128d](a), cast[lsx.M128d](b)))

let la_ncq_f64v128: proc(a, b: f64v128): u64v128 = if lsxExists(): ncq_f64v128_lsx else: ncq_f64v128_fallback

template `!=`*(a, b: f64v128): u64v128 =
  when defined(amd64) or defined(i386): x86_ncq_f64v128(a, b)
  elif defined(arm64): arm_ncq_f64v128(a, b)
  elif defined(loongarch64): la_ncq_f64v128(a, b)


# ==========================================
# ncq (!=) / i8v128 -> u8v128
# ==========================================

func ncq_i8v128_fallback(a, b: i8v128): u8v128 =
  var output: u8v128
  let pOut = cast[ptr array[16, uint8]](addr output)
  let pA   = cast[ptr array[16, int8]](addr a)
  let pB   = cast[ptr array[16, int8]](addr b)
  unroll(i, 0, 15): 
    pOut[i] = if pA[i] != pB[i]: 0xFF'u8 else: 0'u8
  return output

func ncq_i8v128_sse(a, b: i8v128): u8v128 =
  let eq = mm_cmpeq_epi8(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[u8v128](mm_andnot_si128(eq, mm_set1_epi8(cast[int8](0xFF'u8))))

let x86_ncq_i8v128: proc(a, b: i8v128): u8v128 = if sseExists(): ncq_i8v128_sse else: ncq_i8v128_fallback

func ncq_i8v128_neon(a, b: i8v128): u8v128 =
  return cast[u8v128](vmvnq_u8(vceqq_s8(cast[neon.Int8x16](a), cast[neon.Int8x16](b))))

let arm_ncq_i8v128: proc(a, b: i8v128): u8v128 = if neonExists(): ncq_i8v128_neon else: ncq_i8v128_fallback

func ncq_i8v128_lsx(a, b: i8v128): u8v128 =
  let eq = lsx_vseq_b(cast[lsx.M128i](a), cast[lsx.M128i](b))
  return cast[u8v128](lsx_vnor_v(eq, eq))

let la_ncq_i8v128: proc(a, b: i8v128): u8v128 = if lsxExists(): ncq_i8v128_lsx else: ncq_i8v128_fallback

template `!=`*(a, b: i8v128): u8v128 =
  when defined(amd64) or defined(i386): x86_ncq_i8v128(a, b)
  elif defined(arm64): arm_ncq_i8v128(a, b)
  elif defined(loongarch64): la_ncq_i8v128(a, b)


# ==========================================
# ncq (!=) / i16v128 -> u16v128
# ==========================================

func ncq_i16v128_fallback(a, b: i16v128): u16v128 =
  var output: u16v128
  let pOut = cast[ptr array[8, uint16]](addr output)
  let pA   = cast[ptr array[8, int16]](addr a)
  let pB   = cast[ptr array[8, int16]](addr b)
  unroll(i, 0, 7): 
    pOut[i] = if pA[i] != pB[i]: 0xFFFF'u16 else: 0'u16
  return output

func ncq_i16v128_sse(a, b: i16v128): u16v128 =
  let eq = mm_cmpeq_epi16(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[u16v128](mm_andnot_si128(eq, mm_set1_epi16(cast[int16](0xFFFF'u16))))

let x86_ncq_i16v128: proc(a, b: i16v128): u16v128 = if sseExists(): ncq_i16v128_sse else: ncq_i16v128_fallback

func ncq_i16v128_neon(a, b: i16v128): u16v128 =
  return cast[u16v128](vmvnq_u16(vceqq_s16(cast[neon.Int16x8](a), cast[neon.Int16x8](b))))

let arm_ncq_i16v128: proc(a, b: i16v128): u16v128 = if neonExists(): ncq_i16v128_neon else: ncq_i16v128_fallback

func ncq_i16v128_lsx(a, b: i16v128): u16v128 =
  let eq = lsx_vseq_h(cast[lsx.M128i](a), cast[lsx.M128i](b))
  return cast[u16v128](lsx_vnor_v(eq, eq))

let la_ncq_i16v128: proc(a, b: i16v128): u16v128 = if lsxExists(): ncq_i16v128_lsx else: ncq_i16v128_fallback

template `!=`*(a, b: i16v128): u16v128 =
  when defined(amd64) or defined(i386): x86_ncq_i16v128(a, b)
  elif defined(arm64): arm_ncq_i16v128(a, b)
  elif defined(loongarch64): la_ncq_i16v128(a, b)


# ==========================================
# ncq (!=) / i32v128 -> u32v128
# ==========================================

func ncq_i32v128_fallback(a, b: i32v128): u32v128 =
  var output: u32v128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, int32]](addr a)
  let pB   = cast[ptr array[4, int32]](addr b)
  unroll(i, 0, 3): 
    pOut[i] = if pA[i] != pB[i]: 0xFFFFFFFF'u32 else: 0'u32
  return output

func ncq_i32v128_sse(a, b: i32v128): u32v128 =
  let eq = mm_cmpeq_epi32(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[u32v128](mm_andnot_si128(eq, mm_set1_epi32(cast[int32](0xFFFFFFFF'u32))))

let x86_ncq_i32v128: proc(a, b: i32v128): u32v128 = if sseExists(): ncq_i32v128_sse else: ncq_i32v128_fallback

func ncq_i32v128_neon(a, b: i32v128): u32v128 =
  return cast[u32v128](vmvnq_u32(vceqq_s32(cast[neon.Int32x4](a), cast[neon.Int32x4](b))))

let arm_ncq_i32v128: proc(a, b: i32v128): u32v128 = if neonExists(): ncq_i32v128_neon else: ncq_i32v128_fallback

func ncq_i32v128_lsx(a, b: i32v128): u32v128 =
  let eq = lsx_vseq_w(cast[lsx.M128i](a), cast[lsx.M128i](b))
  return cast[u32v128](lsx_vnor_v(eq, eq))

let la_ncq_i32v128: proc(a, b: i32v128): u32v128 = if lsxExists(): ncq_i32v128_lsx else: ncq_i32v128_fallback

template `!=`*(a, b: i32v128): u32v128 =
  when defined(amd64) or defined(i386): x86_ncq_i32v128(a, b)
  elif defined(arm64): arm_ncq_i32v128(a, b)
  elif defined(loongarch64): la_ncq_i32v128(a, b)


# ==========================================
# ncq (!=) / i64v128 -> u64v128
# ==========================================

func ncq_i64v128_fallback(a, b: i64v128): u64v128 =
  var output: u64v128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, int64]](addr a)
  let pB   = cast[ptr array[2, int64]](addr b)
  unroll(i, 0, 1): 
    pOut[i] = if pA[i] != pB[i]: 0xFFFFFFFFFFFFFFFF'u64 else: 0'u64
  return output

func ncq_i64v128_sse(a, b: i64v128): u64v128 =
  let eq = mm_cmpeq_epi64(cast[sse2.M128i](a), cast[sse2.M128i](b))
  let mask: M64 = cast[M64](0xFFFFFFFFFFFFFFFF'u64)
  return cast[u64v128](mm_andnot_si128(eq, mm_set1_epi64(mask)))

let x86_ncq_i64v128: proc(a, b: i64v128): u64v128 = if sseExists(): ncq_i64v128_sse else: ncq_i64v128_fallback

func ncq_i64v128_neon(a, b: i64v128): u64v128 =
  return cast[u64v128](vmvnq_u32(cast[neon.Uint32x4](vceqq_s64(cast[neon.Int64x2](a), cast[neon.Int64x2](b)))))

let arm_ncq_i64v128: proc(a, b: i64v128): u64v128 = if neonExists(): ncq_i64v128_neon else: ncq_i64v128_fallback

func ncq_i64v128_lsx(a, b: i64v128): u64v128 =
  let eq = lsx_vseq_d(cast[lsx.M128i](a), cast[lsx.M128i](b))
  return cast[u64v128](lsx_vnor_v(eq, eq))

let la_ncq_i64v128: proc(a, b: i64v128): u64v128 = if lsxExists(): ncq_i64v128_lsx else: ncq_i64v128_fallback

template `!=`*(a, b: i64v128): u64v128 =
  when defined(amd64) or defined(i386): x86_ncq_i64v128(a, b)
  elif defined(arm64): arm_ncq_i64v128(a, b)
  elif defined(loongarch64): la_ncq_i64v128(a, b)


# ==========================================
# ncq (!=) / u8v128 -> u8v128
# ==========================================

func ncq_u8v128_fallback(a, b: u8v128): u8v128 =
  var output: u8v128
  let pOut = cast[ptr array[16, uint8]](addr output)
  let pA   = cast[ptr array[16, uint8]](addr a)
  let pB   = cast[ptr array[16, uint8]](addr b)
  unroll(i, 0, 15): 
    pOut[i] = if pA[i] != pB[i]: 0xFF'u8 else: 0'u8
  return output

func ncq_u8v128_sse(a, b: u8v128): u8v128 =
  let eq = mm_cmpeq_epi8(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[u8v128](mm_andnot_si128(eq, mm_set1_epi8(cast[int8](0xFF'u8))))

let x86_ncq_u8v128: proc(a, b: u8v128): u8v128 = if sseExists(): ncq_u8v128_sse else: ncq_u8v128_fallback

func ncq_u8v128_neon(a, b: u8v128): u8v128 =
  return cast[u8v128](vmvnq_u8(vceqq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b))))

let arm_ncq_u8v128: proc(a, b: u8v128): u8v128 = if neonExists(): ncq_u8v128_neon else: ncq_u8v128_fallback

func ncq_u8v128_lsx(a, b: u8v128): u8v128 =
  let eq = lsx_vseq_b(cast[lsx.M128i](a), cast[lsx.M128i](b))
  return cast[u8v128](lsx_vnor_v(eq, eq))

let la_ncq_u8v128: proc(a, b: u8v128): u8v128 = if lsxExists(): ncq_u8v128_lsx else: ncq_u8v128_fallback

template `!=`*(a, b: u8v128): u8v128 =
  when defined(amd64) or defined(i386): x86_ncq_u8v128(a, b)
  elif defined(arm64): arm_ncq_u8v128(a, b)
  elif defined(loongarch64): la_ncq_u8v128(a, b)


# ==========================================
# ncq (!=) / u16v128 -> u16v128
# ==========================================

func ncq_u16v128_fallback(a, b: u16v128): u16v128 =
  var output: u16v128
  let pOut = cast[ptr array[8, uint16]](addr output)
  let pA   = cast[ptr array[8, uint16]](addr a)
  let pB   = cast[ptr array[8, uint16]](addr b)
  unroll(i, 0, 7): 
    pOut[i] = if pA[i] != pB[i]: 0xFFFF'u16 else: 0'u16
  return output

func ncq_u16v128_sse(a, b: u16v128): u16v128 =
  let eq = mm_cmpeq_epi16(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[u16v128](mm_andnot_si128(eq, mm_set1_epi16(cast[int16](0xFFFF'u16))))

let x86_ncq_u16v128: proc(a, b: u16v128): u16v128 = if sseExists(): ncq_u16v128_sse else: ncq_u16v128_fallback

func ncq_u16v128_neon(a, b: u16v128): u16v128 =
  return cast[u16v128](vmvnq_u16(vceqq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b))))

let arm_ncq_u16v128: proc(a, b: u16v128): u16v128 = if neonExists(): ncq_u16v128_neon else: ncq_u16v128_fallback

func ncq_u16v128_lsx(a, b: u16v128): u16v128 =
  let eq = lsx_vseq_h(cast[lsx.M128i](a), cast[lsx.M128i](b))
  return cast[u16v128](lsx_vnor_v(eq, eq))

let la_ncq_u16v128: proc(a, b: u16v128): u16v128 = if lsxExists(): ncq_u16v128_lsx else: ncq_u16v128_fallback

template `!=`*(a, b: u16v128): u16v128 =
  when defined(amd64) or defined(i386): x86_ncq_u16v128(a, b)
  elif defined(arm64): arm_ncq_u16v128(a, b)
  elif defined(loongarch64): la_ncq_u16v128(a, b)


# ==========================================
# ncq (!=) / u32v128 -> u32v128
# ==========================================

func ncq_u32v128_fallback(a, b: u32v128): u32v128 =
  var output: u32v128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, uint32]](addr a)
  let pB   = cast[ptr array[4, uint32]](addr b)
  unroll(i, 0, 3): 
    pOut[i] = if pA[i] != pB[i]: 0xFFFFFFFF'u32 else: 0'u32
  return output

func ncq_u32v128_sse(a, b: u32v128): u32v128 =
  let eq = mm_cmpeq_epi32(cast[sse2.M128i](a), cast[sse2.M128i](b))
  return cast[u32v128](mm_andnot_si128(eq, mm_set1_epi32(cast[int32](0xFFFFFFFF'u32))))

let x86_ncq_u32v128: proc(a, b: u32v128): u32v128 = if sseExists(): ncq_u32v128_sse else: ncq_u32v128_fallback

func ncq_u32v128_neon(a, b: u32v128): u32v128 =
  return cast[u32v128](vmvnq_u32(vceqq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b))))

let arm_ncq_u32v128: proc(a, b: u32v128): u32v128 = if neonExists(): ncq_u32v128_neon else: ncq_u32v128_fallback

func ncq_u32v128_lsx(a, b: u32v128): u32v128 =
  let eq = lsx_vseq_w(cast[lsx.M128i](a), cast[lsx.M128i](b))
  return cast[u32v128](lsx_vnor_v(eq, eq))

let la_ncq_u32v128: proc(a, b: u32v128): u32v128 = if lsxExists(): ncq_u32v128_lsx else: ncq_u32v128_fallback

template `!=`*(a, b: u32v128): u32v128 =
  when defined(amd64) or defined(i386): x86_ncq_u32v128(a, b)
  elif defined(arm64): arm_ncq_u32v128(a, b)
  elif defined(loongarch64): la_ncq_u32v128(a, b)


# ==========================================
# ncq (!=) / u64v128 -> u64v128
# ==========================================

func ncq_u64v128_fallback(a, b: u64v128): u64v128 =
  var output: u64v128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, uint64]](addr a)
  let pB   = cast[ptr array[2, uint64]](addr b)
  unroll(i, 0, 1): 
    pOut[i] = if pA[i] != pB[i]: 0xFFFFFFFFFFFFFFFF'u64 else: 0'u64
  return output

func ncq_u64v128_sse(a, b: u64v128): u64v128 =
  let eq = mm_cmpeq_epi64(cast[sse2.M128i](a), cast[sse2.M128i](b))
  let mask: M64 = cast[M64](0xFFFFFFFFFFFFFFFF'u64)
  return cast[u64v128](mm_andnot_si128(eq, mm_set1_epi64(mask)))

let x86_ncq_u64v128: proc(a, b: u64v128): u64v128 = if sseExists(): ncq_u64v128_sse else: ncq_u64v128_fallback

func ncq_u64v128_neon(a, b: u64v128): u64v128 =
  return cast[u64v128](vmvnq_u32(cast[neon.Uint32x4](vceqq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b)))))

let arm_ncq_u64v128: proc(a, b: u64v128): u64v128 = if neonExists(): ncq_u64v128_neon else: ncq_u64v128_fallback

func ncq_u64v128_lsx(a, b: u64v128): u64v128 =
  let eq = lsx_vseq_d(cast[lsx.M128i](a), cast[lsx.M128i](b))
  return cast[u64v128](lsx_vnor_v(eq, eq))

let la_ncq_u64v128: proc(a, b: u64v128): u64v128 = if lsxExists(): ncq_u64v128_lsx else: ncq_u64v128_fallback

template `!=`*(a, b: u64v128): u64v128 =
  when defined(amd64) or defined(i386): x86_ncq_u64v128(a, b)
  elif defined(arm64): arm_ncq_u64v128(a, b)
  elif defined(loongarch64): la_ncq_u64v128(a, b)

# ==========================================
# ncl (<) / f32r128 -> u32r128
# ==========================================

func ncl_f32r128_fallback(a, b: f32r128): u32r128 =
  var output: u32r128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, float32]](addr a)
  let pB   = cast[ptr array[4, float32]](addr b)
  unroll(i, 0, 3): 
    pOut[i] = if pA[i] < pB[i]: 0xFFFFFFFF'u32 else: 0'u32
  return output

func ncl_f32r128_sse(a, b: f32r128): u32r128 =
  return cast[u32r128](mm_castps_si128(mm_cmplt_ps(cast[sse.M128](a), cast[sse.M128](b))))

let x86_ncl_f32r128: proc(a, b: f32r128): u32r128 = if sseExists(): ncl_f32r128_sse else: ncl_f32r128_fallback

func ncl_f32r128_neon(a, b: f32r128): u32r128 =
  return cast[u32r128](vcltq_f32(cast[neon.Float32x4](a), cast[neon.Float32x4](b)))

let arm_ncl_f32r128: proc(a, b: f32r128): u32r128 = if neonExists(): ncl_f32r128_neon else: ncl_f32r128_fallback

func ncl_f32r128_lsx(a, b: f32r128): u32r128 =
  return cast[u32r128](lsx_vfcmp_clt_s(cast[lsx.M128](a), cast[lsx.M128](b)))

let la_ncl_f32r128: proc(a, b: f32r128): u32r128 = if lsxExists(): ncl_f32r128_lsx else: ncl_f32r128_fallback

template `<`*(a, b: f32r128): u32r128 =
  when defined(amd64) or defined(i386): x86_ncl_f32r128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncl_f32r128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncl_f32r128(a, b)

# ==========================================
# ncl (<) / f64r128 -> u64r128
# ==========================================

func ncl_f64r128_fallback(a, b: f64r128): u64r128 =
  var output: u64r128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, float64]](addr a)
  let pB   = cast[ptr array[2, float64]](addr b)
  unroll(i, 0, 1): 
    pOut[i] = if pA[i] < pB[i]: 0xFFFFFFFFFFFFFFFF'u64 else: 0'u64
  return output

func ncl_f64r128_sse(a, b: f64r128): u64r128 =
  return cast[u64r128](mm_castpd_si128(mm_cmplt_pd(cast[sse2.M128d](a), cast[sse2.M128d](b))))

let x86_ncl_f64r128: proc(a, b: f64r128): u64r128 = if sseExists(): ncl_f64r128_sse else: ncl_f64r128_fallback

func ncl_f64r128_neon(a, b: f64r128): u64r128 =
  return cast[u64r128](vmvnq_u32(cast[neon.Uint32x4](vcleq_f64(cast[neon.Float64x2](b), cast[neon.Float64x2](a)))))

let arm_ncl_f64r128: proc(a, b: f64r128): u64r128 = if neonExists(): ncl_f64r128_neon else: ncl_f64r128_fallback

func ncl_f64r128_lsx(a, b: f64r128): u64r128 =
  return cast[u64r128](lsx_vfcmp_clt_d(cast[lsx.M128d](a), cast[lsx.M128d](b)))

let la_ncl_f64r128: proc(a, b: f64r128): u64r128 = if lsxExists(): ncl_f64r128_lsx else: ncl_f64r128_fallback

template `<`*(a, b: f64r128): u64r128 =
  when defined(amd64) or defined(i386): x86_ncl_f64r128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncl_f64r128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncl_f64r128(a, b)

# ==========================================
# ncl (<) / i8r128 -> u8r128
# ==========================================

func ncl_i8r128_fallback(a, b: i8r128): u8r128 =
  var output: u8r128
  let pOut = cast[ptr array[16, uint8]](addr output)
  let pA   = cast[ptr array[16, int8]](addr a)
  let pB   = cast[ptr array[16, int8]](addr b)
  unroll(i, 0, 15): 
    pOut[i] = if pA[i] < pB[i]: 0xFF'u8 else: 0'u8
  return output

func ncl_i8r128_sse(a, b: i8r128): u8r128 =
  # SSE cmplt     cmpgt(b, a) .
  return cast[u8r128](mm_cmpgt_epi8(cast[sse2.M128i](b), cast[sse2.M128i](a)))

let x86_ncl_i8r128: proc(a, b: i8r128): u8r128 = if sseExists(): ncl_i8r128_sse else: ncl_i8r128_fallback

func ncl_i8r128_neon(a, b: i8r128): u8r128 =
  return cast[u8r128](vcltq_s8(cast[neon.Int8x16](a), cast[neon.Int8x16](b)))

let arm_ncl_i8r128: proc(a, b: i8r128): u8r128 = if neonExists(): ncl_i8r128_neon else: ncl_i8r128_fallback

func ncl_i8r128_lsx(a, b: i8r128): u8r128 =
  return cast[u8r128](lsx_vslt_b(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ncl_i8r128: proc(a, b: i8r128): u8r128 = if lsxExists(): ncl_i8r128_lsx else: ncl_i8r128_fallback

template `<`*(a, b: i8r128): u8r128 =
  when defined(amd64) or defined(i386): x86_ncl_i8r128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncl_i8r128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncl_i8r128(a, b)

# ==========================================
# ncl (<) / i16r128 -> u16r128
# ==========================================

func ncl_i16r128_fallback(a, b: i16r128): u16r128 =
  var output: u16r128
  let pOut = cast[ptr array[8, uint16]](addr output)
  let pA   = cast[ptr array[8, int16]](addr a)
  let pB   = cast[ptr array[8, int16]](addr b)
  unroll(i, 0, 7): 
    pOut[i] = if pA[i] < pB[i]: 0xFFFF'u16 else: 0'u16
  return output

func ncl_i16r128_sse(a, b: i16r128): u16r128 =
  return cast[u16r128](mm_cmpgt_epi16(cast[sse2.M128i](b), cast[sse2.M128i](a)))

let x86_ncl_i16r128: proc(a, b: i16r128): u16r128 = if sseExists(): ncl_i16r128_sse else: ncl_i16r128_fallback

func ncl_i16r128_neon(a, b: i16r128): u16r128 =
  return cast[u16r128](vcltq_s16(cast[neon.Int16x8](a), cast[neon.Int16x8](b)))

let arm_ncl_i16r128: proc(a, b: i16r128): u16r128 = if neonExists(): ncl_i16r128_neon else: ncl_i16r128_fallback

func ncl_i16r128_lsx(a, b: i16r128): u16r128 =
  return cast[u16r128](lsx_vslt_h(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ncl_i16r128: proc(a, b: i16r128): u16r128 = if lsxExists(): ncl_i16r128_lsx else: ncl_i16r128_fallback

template `<`*(a, b: i16r128): u16r128 =
  when defined(amd64) or defined(i386): x86_ncl_i16r128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncl_i16r128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncl_i16r128(a, b)

# ==========================================
# ncl (<) / i32r128 -> u32r128
# ==========================================

func ncl_i32r128_fallback(a, b: i32r128): u32r128 =
  var output: u32r128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, int32]](addr a)
  let pB   = cast[ptr array[4, int32]](addr b)
  unroll(i, 0, 3): 
    pOut[i] = if pA[i] < pB[i]: 0xFFFFFFFF'u32 else: 0'u32
  return output

func ncl_i32r128_sse(a, b: i32r128): u32r128 =
  return cast[u32r128](mm_cmpgt_epi32(cast[sse2.M128i](b), cast[sse2.M128i](a)))

let x86_ncl_i32r128: proc(a, b: i32r128): u32r128 = if sseExists(): ncl_i32r128_sse else: ncl_i32r128_fallback

func ncl_i32r128_neon(a, b: i32r128): u32r128 =
  return cast[u32r128](vcltq_s32(cast[neon.Int32x4](a), cast[neon.Int32x4](b)))

let arm_ncl_i32r128: proc(a, b: i32r128): u32r128 = if neonExists(): ncl_i32r128_neon else: ncl_i32r128_fallback

func ncl_i32r128_lsx(a, b: i32r128): u32r128 =
  return cast[u32r128](lsx_vslt_w(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ncl_i32r128: proc(a, b: i32r128): u32r128 = if lsxExists(): ncl_i32r128_lsx else: ncl_i32r128_fallback

template `<`*(a, b: i32r128): u32r128 =
  when defined(amd64) or defined(i386): x86_ncl_i32r128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncl_i32r128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncl_i32r128(a, b)

# ==========================================
# ncl (<) / i64r128 -> u64r128
# ==========================================

func ncl_i64r128_fallback(a, b: i64r128): u64r128 =
  var output: u64r128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, int64]](addr a)
  let pB   = cast[ptr array[2, int64]](addr b)
  unroll(i, 0, 1): 
    pOut[i] = if pA[i] < pB[i]: 0xFFFFFFFFFFFFFFFF'u64 else: 0'u64
  return output

func ncl_i64r128_sse(a, b: i64r128): u64r128 =
  # SSE4.2   SSE2      cmpgt_epi64(b, a) .
  return cast[u64r128](mm_cmpgt_epi64(cast[sse2.M128i](b), cast[sse2.M128i](a)))

let x86_ncl_i64r128: proc(a, b: i64r128): u64r128 = if sseExists(): ncl_i64r128_sse else: ncl_i64r128_fallback

func ncl_i64r128_neon(a, b: i64r128): u64r128 =
  return cast[u64r128](vmvnq_u32(cast[neon.Uint32x4](vcleq_s64(cast[neon.Int64x2](b), cast[neon.Int64x2](a)))))

let arm_ncl_i64r128: proc(a, b: i64r128): u64r128 = if neonExists(): ncl_i64r128_neon else: ncl_i64r128_fallback

func ncl_i64r128_lsx(a, b: i64r128): u64r128 =
  return cast[u64r128](lsx_vslt_d(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ncl_i64r128: proc(a, b: i64r128): u64r128 = if lsxExists(): ncl_i64r128_lsx else: ncl_i64r128_fallback

template `<`*(a, b: i64r128): u64r128 =
  when defined(amd64) or defined(i386): x86_ncl_i64r128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncl_i64r128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncl_i64r128(a, b)

# ==========================================
# ncl (<) / u8r128 -> u8r128
# ==========================================

func ncl_u8r128_fallback(a, b: u8r128): u8r128 =
  var output: u8r128
  let pOut = cast[ptr array[16, uint8]](addr output)
  let pA   = cast[ptr array[16, uint8]](addr a)
  let pB   = cast[ptr array[16, uint8]](addr b)
  unroll(i, 0, 15): 
    pOut[i] = if pA[i] < pB[i]: 0xFF'u8 else: 0'u8
  return output

func ncl_u8r128_sse(a, b: u8r128): u8r128 =
  # SSE2       (0x80)       .
  let offset = mm_set1_epi8(cast[int8](0x80'u8))
  let va = mm_xor_si128(cast[sse2.M128i](a), offset)
  let vb = mm_xor_si128(cast[sse2.M128i](b), offset)
  return cast[u8r128](mm_cmpgt_epi8(vb, va))

let x86_ncl_u8r128: proc(a, b: u8r128): u8r128 = if sseExists(): ncl_u8r128_sse else: ncl_u8r128_fallback

func ncl_u8r128_neon(a, b: u8r128): u8r128 =
  return cast[u8r128](vcltq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b)))

let arm_ncl_u8r128: proc(a, b: u8r128): u8r128 = if neonExists(): ncl_u8r128_neon else: ncl_u8r128_fallback

func ncl_u8r128_lsx(a, b: u8r128): u8r128 =
  return cast[u8r128](lsx_vslt_bu(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ncl_u8r128: proc(a, b: u8r128): u8r128 = if lsxExists(): ncl_u8r128_lsx else: ncl_u8r128_fallback

template `<`*(a, b: u8r128): u8r128 =
  when defined(amd64) or defined(i386): x86_ncl_u8r128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncl_u8r128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncl_u8r128(a, b)

# ==========================================
# ncl (<) / u16r128 -> u16r128
# ==========================================

func ncl_u16r128_fallback(a, b: u16r128): u16r128 =
  var output: u16r128
  let pOut = cast[ptr array[8, uint16]](addr output)
  let pA   = cast[ptr array[8, uint16]](addr a)
  let pB   = cast[ptr array[8, uint16]](addr b)
  unroll(i, 0, 7): 
    pOut[i] = if pA[i] < pB[i]: 0xFFFF'u16 else: 0'u16
  return output

func ncl_u16r128_sse(a, b: u16r128): u16r128 =
  let offset = mm_set1_epi16(cast[int16](0x8000'u16))
  let va = mm_xor_si128(cast[sse2.M128i](a), offset)
  let vb = mm_xor_si128(cast[sse2.M128i](b), offset)
  return cast[u16r128](mm_cmpgt_epi16(vb, va))

let x86_ncl_u16r128: proc(a, b: u16r128): u16r128 = if sseExists(): ncl_u16r128_sse else: ncl_u16r128_fallback

func ncl_u16r128_neon(a, b: u16r128): u16r128 =
  return cast[u16r128](vcltq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b)))

let arm_ncl_u16r128: proc(a, b: u16r128): u16r128 = if neonExists(): ncl_u16r128_neon else: ncl_u16r128_fallback

func ncl_u16r128_lsx(a, b: u16r128): u16r128 =
  return cast[u16r128](lsx_vslt_hu(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ncl_u16r128: proc(a, b: u16r128): u16r128 = if lsxExists(): ncl_u16r128_lsx else: ncl_u16r128_fallback

template `<`*(a, b: u16r128): u16r128 =
  when defined(amd64) or defined(i386): x86_ncl_u16r128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncl_u16r128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncl_u16r128(a, b)

# ==========================================
# ncl (<) / u32r128 -> u32r128
# ==========================================

func ncl_u32r128_fallback(a, b: u32r128): u32r128 =
  var output: u32r128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, uint32]](addr a)
  let pB   = cast[ptr array[4, uint32]](addr b)
  unroll(i, 0, 3): 
    pOut[i] = if pA[i] < pB[i]: 0xFFFFFFFF'u32 else: 0'u32
  return output

func ncl_u32r128_sse(a, b: u32r128): u32r128 =
  let offset = mm_set1_epi32(cast[int32](0x80000000'u32))
  let va = mm_xor_si128(cast[sse2.M128i](a), offset)
  let vb = mm_xor_si128(cast[sse2.M128i](b), offset)
  return cast[u32r128](mm_cmpgt_epi32(vb, va))

let x86_ncl_u32r128: proc(a, b: u32r128): u32r128 = if sseExists(): ncl_u32r128_sse else: ncl_u32r128_fallback

func ncl_u32r128_neon(a, b: u32r128): u32r128 =
  return cast[u32r128](vcltq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b)))

let arm_ncl_u32r128: proc(a, b: u32r128): u32r128 = if neonExists(): ncl_u32r128_neon else: ncl_u32r128_fallback

func ncl_u32r128_lsx(a, b: u32r128): u32r128 =
  return cast[u32r128](lsx_vslt_wu(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ncl_u32r128: proc(a, b: u32r128): u32r128 = if lsxExists(): ncl_u32r128_lsx else: ncl_u32r128_fallback

template `<`*(a, b: u32r128): u32r128 =
  when defined(amd64) or defined(i386): x86_ncl_u32r128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncl_u32r128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncl_u32r128(a, b)

# ==========================================
# ncl (<) / u64r128 -> u64r128
# ==========================================

func ncl_u64r128_fallback(a, b: u64r128): u64r128 =
  var output: u64r128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, uint64]](addr a)
  let pB   = cast[ptr array[2, uint64]](addr b)
  unroll(i, 0, 1): 
    pOut[i] = if pA[i] < pB[i]: 0xFFFFFFFFFFFFFFFF'u64 else: 0'u64
  return output

func ncl_u64r128_sse(a, b: u64r128): u64r128 =
  let offset = mm_set1_epi64(cast[M64](0x8000000000000000'u64))
  let va = mm_xor_si128(cast[sse2.M128i](a), offset)
  let vb = mm_xor_si128(cast[sse2.M128i](b), offset)
  return cast[u64r128](mm_cmpgt_epi64(vb, va))

let x86_ncl_u64r128: proc(a, b: u64r128): u64r128 = if sseExists(): ncl_u64r128_sse else: ncl_u64r128_fallback

func ncl_u64r128_neon(a, b: u64r128): u64r128 =
  return cast[u64r128](vcltq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b)))

let arm_ncl_u64r128: proc(a, b: u64r128): u64r128 = if neonExists(): ncl_u64r128_neon else: ncl_u64r128_fallback

func ncl_u64r128_lsx(a, b: u64r128): u64r128 =
  return cast[u64r128](lsx_vslt_du(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ncl_u64r128: proc(a, b: u64r128): u64r128 = if lsxExists(): ncl_u64r128_lsx else: ncl_u64r128_fallback

template `<`*(a, b: u64r128): u64r128 =
  when defined(amd64) or defined(i386): x86_ncl_u64r128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncl_u64r128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncl_u64r128(a, b)

# ==========================================
# ncl (<) / f32v128 -> u32v128
# ==========================================

func ncl_f32v128_fallback(a, b: f32v128): u32v128 =
  var output: u32v128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, float32]](addr a)
  let pB   = cast[ptr array[4, float32]](addr b)
  unroll(i, 0, 3): 
    pOut[i] = if pA[i] < pB[i]: 0xFFFFFFFF'u32 else: 0'u32
  return output

func ncl_f32v128_sse(a, b: f32v128): u32v128 =
  return cast[u32v128](mm_castps_si128(mm_cmplt_ps(cast[sse.M128](a), cast[sse.M128](b))))

let x86_ncl_f32v128: proc(a, b: f32v128): u32v128 = if sseExists(): ncl_f32v128_sse else: ncl_f32v128_fallback

func ncl_f32v128_neon(a, b: f32v128): u32v128 =
  return cast[u32v128](vcltq_f32(cast[neon.Float32x4](a), cast[neon.Float32x4](b)))

let arm_ncl_f32v128: proc(a, b: f32v128): u32v128 = if neonExists(): ncl_f32v128_neon else: ncl_f32v128_fallback

func ncl_f32v128_lsx(a, b: f32v128): u32v128 =
  return cast[u32v128](lsx_vfcmp_clt_s(cast[lsx.M128](a), cast[lsx.M128](b)))

let la_ncl_f32v128: proc(a, b: f32v128): u32v128 = if lsxExists(): ncl_f32v128_lsx else: ncl_f32v128_fallback

template `<`*(a, b: f32v128): u32v128 =
  when defined(amd64) or defined(i386): x86_ncl_f32v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncl_f32v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncl_f32v128(a, b)

# ==========================================
# ncl (<) / f64v128 -> u64v128
# ==========================================

func ncl_f64v128_fallback(a, b: f64v128): u64v128 =
  var output: u64v128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, float64]](addr a)
  let pB   = cast[ptr array[2, float64]](addr b)
  unroll(i, 0, 1): 
    pOut[i] = if pA[i] < pB[i]: 0xFFFFFFFFFFFFFFFF'u64 else: 0'u64
  return output

func ncl_f64v128_sse(a, b: f64v128): u64v128 =
  return cast[u64v128](mm_castpd_si128(mm_cmplt_pd(cast[sse2.M128d](a), cast[sse2.M128d](b))))

let x86_ncl_f64v128: proc(a, b: f64v128): u64v128 = if sseExists(): ncl_f64v128_sse else: ncl_f64v128_fallback

func ncl_f64v128_neon(a, b: f64v128): u64v128 =
  return cast[u64v128](vmvnq_u32(cast[neon.Uint32x4](vcleq_f64(cast[neon.Float64x2](b), cast[neon.Float64x2](a)))))

let arm_ncl_f64v128: proc(a, b: f64v128): u64v128 = if neonExists(): ncl_f64v128_neon else: ncl_f64v128_fallback

func ncl_f64v128_lsx(a, b: f64v128): u64v128 =
  return cast[u64v128](lsx_vfcmp_clt_d(cast[lsx.M128d](a), cast[lsx.M128d](b)))

let la_ncl_f64v128: proc(a, b: f64v128): u64v128 = if lsxExists(): ncl_f64v128_lsx else: ncl_f64v128_fallback

template `<`*(a, b: f64v128): u64v128 =
  when defined(amd64) or defined(i386): x86_ncl_f64v128(a, b)
  elif Godined(arm64) or defined(aarch64): arm_ncl_f64v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncl_f64v128(a, b)

# ==========================================
# ncl (<) / i8v128 -> u8v128
# ==========================================

func ncl_i8v128_fallback(a, b: i8v128): u8v128 =
  var output: u8v128
  let pOut = cast[ptr array[16, uint8]](addr output)
  let pA   = cast[ptr array[16, int8]](addr a)
  let pB   = cast[ptr array[16, int8]](addr b)
  unroll(i, 0, 15): 
    pOut[i] = if pA[i] < pB[i]: 0xFF'u8 else: 0'u8
  return output

func ncl_i8v128_sse(a, b: i8v128): u8v128 =
  return cast[u8v128](mm_cmpgt_epi8(cast[sse2.M128i](b), cast[sse2.M128i](a)))

let x86_ncl_i8v128: proc(a, b: i8v128): u8v128 = if sseExists(): ncl_i8v128_sse else: ncl_i8v128_fallback

func ncl_i8v128_neon(a, b: i8v128): u8v128 =
  return cast[u8v128](vcltq_s8(cast[neon.Int8x16](a), cast[neon.Int8x16](b)))

let arm_ncl_i8v128: proc(a, b: i8v128): u8v128 = if neonExists(): ncl_i8v128_neon else: ncl_i8v128_fallback

func ncl_i8v128_lsx(a, b: i8v128): u8v128 =
  return cast[u8v128](lsx_vslt_b(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ncl_i8v128: proc(a, b: i8v128): u8v128 = if lsxExists(): ncl_i8v128_lsx else: ncl_i8v128_fallback

template `<`*(a, b: i8v128): u8v128 =
  when defined(amd64) or defined(i386): x86_ncl_i8v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncl_i8v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncl_i8v128(a, b)

# ==========================================
# ncl (<) / i16v128 -> u16v128
# ==========================================

func ncl_i16v128_fallback(a, b: i16v128): u16v128 =
  var output: u16v128
  let pOut = cast[ptr array[8, uint16]](addr output)
  let pA   = cast[ptr array[8, int16]](addr a)
  let pB   = cast[ptr array[8, int16]](addr b)
  unroll(i, 0, 7): 
    pOut[i] = if pA[i] < pB[i]: 0xFFFF'u16 else: 0'u16
  return output

func ncl_i16v128_sse(a, b: i16v128): u16v128 =
  return cast[u16v128](mm_cmpgt_epi16(cast[sse2.M128i](b), cast[sse2.M128i](a)))

let x86_ncl_i16v128: proc(a, b: i16v128): u16v128 = if sseExists(): ncl_i16v128_sse else: ncl_i16v128_fallback

func ncl_i16v128_neon(a, b: i16v128): u16v128 =
  return cast[u16v128](vcltq_s16(cast[neon.Int16x8](a), cast[neon.Int16x8](b)))

let arm_ncl_i16v128: proc(a, b: i16v128): u16v128 = if neonExists(): ncl_i16v128_neon else: ncl_i16v128_fallback

func ncl_i16v128_lsx(a, b: i16v128): u16v128 =
  return cast[u16v128](lsx_vslt_h(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ncl_i16v128: proc(a, b: i16v128): u16v128 = if lsxExists(): ncl_i16v128_lsx else: ncl_i16v128_fallback

template `<`*(a, b: i16v128): u16v128 =
  when defined(amd64) or defined(i386): x86_ncl_i16v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncl_i16v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncl_i16v128(a, b)

# ==========================================
# ncl (<) / i32v128 -> u32v128
# ==========================================

func ncl_i32v128_fallback(a, b: i32v128): u32v128 =
  var output: u32v128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, int32]](addr a)
  let pB   = cast[ptr array[4, int32]](addr b)
  unroll(i, 0, 3): 
    pOut[i] = if pA[i] < pB[i]: 0xFFFFFFFF'u32 else: 0'u32
  return output

func ncl_i32v128_sse(a, b: i32v128): u32v128 =
  return cast[u32v128](mm_cmpgt_epi32(cast[sse2.M128i](b), cast[sse2.M128i](a)))

let x86_ncl_i32v128: proc(a, b: i32v128): u32v128 = if sseExists(): ncl_i32v128_sse else: ncl_i32v128_fallback

func ncl_i32v128_neon(a, b: i32v128): u32v128 =
  return cast[u32v128](vcltq_s32(cast[neon.Int32x4](a), cast[neon.Int32x4](b)))

let arm_ncl_i32v128: proc(a, b: i32v128): u32v128 = if neonExists(): ncl_i32v128_neon else: ncl_i32v128_fallback

func ncl_i32v128_lsx(a, b: i32v128): u32v128 =
  return cast[u32v128](lsx_vslt_w(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ncl_i32v128: proc(a, b: i32v128): u32v128 = if lsxExists(): ncl_i32v128_lsx else: ncl_i32v128_fallback

template `<`*(a, b: i32v128): u32v128 =
  when defined(amd64) or defined(i386): x86_ncl_i32v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncl_i32v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncl_i32v128(a, b)

# ==========================================
# ncl (<) / i64v128 -> u64v128
# ==========================================

func ncl_i64v128_fallback(a, b: i64v128): u64v128 =
  var output: u64v128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, int64]](addr a)
  let pB   = cast[ptr array[2, int64]](addr b)
  unroll(i, 0, 1): 
    pOut[i] = if pA[i] < pB[i]: 0xFFFFFFFFFFFFFFFF'u64 else: 0'u64
  return output

func ncl_i64v128_sse(a, b: i64v128): u64v128 =
  return cast[u64v128](mm_cmpgt_epi64(cast[sse2.M128i](b), cast[sse2.M128i](a)))

let x86_ncl_i64v128: proc(a, b: i64v128): u64v128 = if sseExists(): ncl_i64v128_sse else: ncl_i64v128_fallback

func ncl_i64v128_neon(a, b: i64v128): u64v128 =
  return cast[u64v128](vmvnq_u32(cast[neon.Uint32x4](vcleq_s64(cast[neon.Int64x2](b), cast[neon.Int64x2](a)))))

let arm_ncl_i64v128: proc(a, b: i64v128): u64v128 = if neonExists(): ncl_i64v128_neon else: ncl_i64v128_fallback

func ncl_i64v128_lsx(a, b: i64v128): u64v128 =
  return cast[u64v128](lsx_vslt_d(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ncl_i64v128: proc(a, b: i64v128): u64v128 = if lsxExists(): ncl_i64v128_lsx else: ncl_i64v128_fallback

template `<`*(a, b: i64v128): u64v128 =
  when defined(amd64) or defined(i386): x86_ncl_i64v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncl_i64v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncl_i64v128(a, b)

# ==========================================
# ncl (<) / u8v128 -> u8v128
# ==========================================

func ncl_u8v128_fallback(a, b: u8v128): u8v128 =
  var output: u8v128
  let pOut = cast[ptr array[16, uint8]](addr output)
  let pA   = cast[ptr array[16, uint8]](addr a)
  let pB   = cast[ptr array[16, uint8]](addr b)
  unroll(i, 0, 15): 
    pOut[i] = if pA[i] < pB[i]: 0xFF'u8 else: 0'u8
  return output

func ncl_u8v128_sse(a, b: u8v128): u8v128 =
  let offset = mm_set1_epi8(cast[int8](0x80'u8))
  let va = mm_xor_si128(cast[sse2.M128i](a), offset)
  let vb = mm_xor_si128(cast[sse2.M128i](b), offset)
  return cast[u8v128](mm_cmpgt_epi8(vb, va))

let x86_ncl_u8v128: proc(a, b: u8v128): u8v128 = if sseExists(): ncl_u8v128_sse else: ncl_u8v128_fallback

func ncl_u8v128_neon(a, b: u8v128): u8v128 =
  return cast[u8v128](vcltq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b)))

let arm_ncl_u8v128: proc(a, b: u8v128): u8v128 = if neonExists(): ncl_u8v128_neon else: ncl_u8v128_fallback

func ncl_u8v128_lsx(a, b: u8v128): u8v128 =
  return cast[u8v128](lsx_vslt_bu(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ncl_u8v128: proc(a, b: u8v128): u8v128 = if lsxExists(): ncl_u8v128_lsx else: ncl_u8v128_fallback

template `<`*(a, b: u8v128): u8v128 =
  when defined(amd64) or defined(i386): x86_ncl_u8v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncl_u8v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncl_u8v128(a, b)

# ==========================================
# ncl (<) / u16v128 -> u16v128
# ==========================================

func ncl_u16v128_fallback(a, b: u16v128): u16v128 =
  var output: u16v128
  let pOut = cast[ptr array[8, uint16]](addr output)
  let pA   = cast[ptr array[8, uint16]](addr a)
  let pB   = cast[ptr array[8, uint16]](addr b)
  unroll(i, 0, 7): 
    pOut[i] = if pA[i] < pB[i]: 0xFFFF'u16 else: 0'u16
  return output

func ncl_u16v128_sse(a, b: u16v128): u16v128 =
  let offset = mm_set1_epi16(cast[int16](0x8000'u16))
  let va = mm_xor_si128(cast[sse2.M128i](a), offset)
  let vb = mm_xor_si128(cast[sse2.M128i](b), offset)
  return cast[u16v128](mm_cmpgt_epi16(vb, va))

let x86_ncl_u16v128: proc(a, b: u16v128): u16v128 = if sseExists(): ncl_u16v128_sse else: ncl_u16v128_fallback

func ncl_u16v128_neon(a, b: u16v128): u16v128 =
  return cast[u16v128](vcltq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b)))

let arm_ncl_u16v128: proc(a, b: u16v128): u16v128 = if neonExists(): ncl_u16v128_neon else: ncl_u16v128_fallback

func ncl_u16v128_lsx(a, b: u16v128): u16v128 =
  return cast[u16v128](lsx_vslt_hu(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ncl_u16v128: proc(a, b: u16v128): u16v128 = if lsxExists(): ncl_u16v128_lsx else: ncl_u16v128_fallback

template `<`*(a, b: u16v128): u16v128 =
  when defined(amd64) or defined(i386): x86_ncl_u16v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncl_u16v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncl_u16v128(a, b)

# ==========================================
# ncl (<) / u32v128 -> u32v128
# ==========================================

func ncl_u32v128_fallback(a, b: u32v128): u32v128 =
  var output: u32v128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, uint32]](addr a)
  let pB   = cast[ptr array[4, uint32]](addr b)
  unroll(i, 0, 3): 
    pOut[i] = if pA[i] < pB[i]: 0xFFFFFFFF'u32 else: 0'u32
  return output

func ncl_u32v128_sse(a, b: u32v128): u32v128 =
  let offset = mm_set1_epi32(cast[int32](0x80000000'u32))
  let va = mm_xor_si128(cast[sse2.M128i](a), offset)
  let vb = mm_xor_si128(cast[sse2.M128i](b), offset)
  return cast[u32v128](mm_cmpgt_epi32(vb, va))

let x86_ncl_u32v128: proc(a, b: u32v128): u32v128 = if sseExists(): ncl_u32v128_sse else: ncl_u32v128_fallback

func ncl_u32v128_neon(a, b: u32v128): u32v128 =
  return cast[u32v128](vcltq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b)))

let arm_ncl_u32v128: proc(a, b: u32v128): u32v128 = if neonExists(): ncl_u32v128_neon else: ncl_u32v128_fallback

func ncl_u32v128_lsx(a, b: u32v128): u32v128 =
  return cast[u32v128](lsx_vslt_wu(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ncl_u32v128: proc(a, b: u32v128): u32v128 = if lsxExists(): ncl_u32v128_lsx else: ncl_u32v128_fallback

template `<`*(a, b: u32v128): u32v128 =
  when defined(amd64) or defined(i386): x86_ncl_u32v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncl_u32v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncl_u32v128(a, b)

# ==========================================
# ncl (<) / u64v128 -> u64v128
# ==========================================

func ncl_u64v128_fallback(a, b: u64v128): u64v128 =
  var output: u64v128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, uint64]](addr a)
  let pB   = cast[ptr array[2, uint64]](addr b)
  unroll(i, 0, 1): 
    pOut[i] = if pA[i] < pB[i]: 0xFFFFFFFFFFFFFFFF'u64 else: 0'u64
  return output

func ncl_u64v128_sse(a, b: u64v128): u64v128 =
  let offset = mm_set1_epi64(cast[M64](0x8000000000000000'u64))
  let va = mm_xor_si128(cast[sse2.M128i](a), offset)
  let vb = mm_xor_si128(cast[sse2.M128i](b), offset)
  return cast[u64v128](mm_cmpgt_epi64(vb, va))

let x86_ncl_u64v128: proc(a, b: u64v128): u64v128 = if sseExists(): ncl_u64v128_sse else: ncl_u64v128_fallback

func ncl_u64v128_neon(a, b: u64v128): u64v128 =
  return cast[u64v128](vcltq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b)))

let arm_ncl_u64v128: proc(a, b: u64v128): u64v128 = if neonExists(): ncl_u64v128_neon else: ncl_u64v128_fallback

func ncl_u64v128_lsx(a, b: u64v128): u64v128 =
  return cast[u64v128](lsx_vslt_du(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ncl_u64v128: proc(a, b: u64v128): u64v128 = if lsxExists(): ncl_u64v128_lsx else: ncl_u64v128_fallback

template `<`*(a, b: u64v128): u64v128 =
  when defined(amd64) or defined(i386): x86_ncl_u64v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncl_u64v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncl_u64v128(a, b)

# ==========================================
# ncg (>) / f32r128 -> u32r128
# ==========================================

func ncg_f32r128_fallback(a, b: f32r128): u32r128 =
  var output: u32r128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, float32]](addr a)
  let pB   = cast[ptr array[4, float32]](addr b)
  unroll(i, 0, 3): 
    pOut[i] = if pA[i] > pB[i]: 0xFFFFFFFF'u32 else: 0'u32
  return output

func ncg_f32r128_sse(a, b: f32r128): u32r128 =
  return cast[u32r128](mm_castps_si128(mm_cmpgt_ps(cast[sse.M128](a), cast[sse.M128](b))))

let x86_ncg_f32r128: proc(a, b: f32r128): u32r128 = if sseExists(): ncg_f32r128_sse else: ncg_f32r128_fallback

func ncg_f32r128_neon(a, b: f32r128): u32r128 =
  return cast[u32r128](vcgtq_f32(cast[neon.Float32x4](a), cast[neon.Float32x4](b)))

let arm_ncg_f32r128: proc(a, b: f32r128): u32r128 = if neonExists(): ncg_f32r128_neon else: ncg_f32r128_fallback

func ncg_f32r128_lsx(a, b: f32r128): u32r128 =
  return cast[u32r128](lsx_vfcmp_clt_s(cast[lsx.M128](b), cast[lsx.M128](a)))

let la_ncg_f32r128: proc(a, b: f32r128): u32r128 = if lsxExists(): ncg_f32r128_lsx else: ncg_f32r128_fallback

template `>`*(a, b: f32r128): u32r128 =
  when defined(amd64) or defined(i386): x86_ncg_f32r128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncg_f32r128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncg_f32r128(a, b)

# ==========================================
# ncg (>) / f64r128 -> u64r128
# ==========================================

func ncg_f64r128_fallback(a, b: f64r128): u64r128 =
  var output: u64r128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, float64]](addr a)
  let pB   = cast[ptr array[2, float64]](addr b)
  unroll(i, 0, 1): 
    pOut[i] = if pA[i] > pB[i]: 0xFFFFFFFFFFFFFFFF'u64 else: 0'u64
  return output

func ncg_f64r128_sse(a, b: f64r128): u64r128 =
  return cast[u64r128](mm_castpd_si128(mm_cmpgt_pd(cast[sse2.M128d](a), cast[sse2.M128d](b))))

let x86_ncg_f64r128: proc(a, b: f64r128): u64r128 = if sseExists(): ncg_f64r128_sse else: ncg_f64r128_fallback

func ncg_f64r128_neon(a, b: f64r128): u64r128 =
  return cast[u64r128](vmvnq_u32(cast[neon.Uint32x4](vcleq_f64(cast[neon.Float64x2](a), cast[neon.Float64x2](b)))))

let arm_ncg_f64r128: proc(a, b: f64r128): u64r128 = if neonExists(): ncg_f64r128_neon else: ncg_f64r128_fallback

func ncg_f64r128_lsx(a, b: f64r128): u64r128 =
  return cast[u64r128](lsx_vfcmp_clt_d(cast[lsx.M128d](b), cast[lsx.M128d](a)))

let la_ncg_f64r128: proc(a, b: f64r128): u64r128 = if lsxExists(): ncg_f64r128_lsx else: ncg_f64r128_fallback

template `>`*(a, b: f64r128): u64r128 =
  when defined(amd64) or defined(i386): x86_ncg_f64r128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncg_f64r128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncg_f64r128(a, b)

# ==========================================
# ncg (>) / i8r128 -> u8r128
# ==========================================

func ncg_i8r128_fallback(a, b: i8r128): u8r128 =
  var output: u8r128
  let pOut = cast[ptr array[16, uint8]](addr output)
  let pA   = cast[ptr array[16, int8]](addr a)
  let pB   = cast[ptr array[16, int8]](addr b)
  unroll(i, 0, 15): 
    pOut[i] = if pA[i] > pB[i]: 0xFF'u8 else: 0'u8
  return output

func ncg_i8r128_sse(a, b: i8r128): u8r128 =
  return cast[u8r128](mm_cmpgt_epi8(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_ncg_i8r128: proc(a, b: i8r128): u8r128 = if sseExists(): ncg_i8r128_sse else: ncg_i8r128_fallback

func ncg_i8r128_neon(a, b: i8r128): u8r128 =
  return cast[u8r128](vcgtq_s8(cast[neon.Int8x16](a), cast[neon.Int8x16](b)))

let arm_ncg_i8r128: proc(a, b: i8r128): u8r128 = if neonExists(): ncg_i8r128_neon else: ncg_i8r128_fallback

func ncg_i8r128_lsx(a, b: i8r128): u8r128 =
  return cast[u8r128](lsx_vslt_b(cast[lsx.M128i](b), cast[lsx.M128i](a)))

let la_ncg_i8r128: proc(a, b: i8r128): u8r128 = if lsxExists(): ncg_i8r128_lsx else: ncg_i8r128_fallback

template `>`*(a, b: i8r128): u8r128 =
  when defined(amd64) or defined(i386): x86_ncg_i8r128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncg_i8r128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncg_i8r128(a, b)

# ==========================================
# ncg (>) / i16r128 -> u16r128
# ==========================================

func ncg_i16r128_fallback(a, b: i16r128): u16r128 =
  var output: u16r128
  let pOut = cast[ptr array[8, uint16]](addr output)
  let pA   = cast[ptr array[8, int16]](addr a)
  let pB   = cast[ptr array[8, int16]](addr b)
  unroll(i, 0, 7): 
    pOut[i] = if pA[i] > pB[i]: 0xFFFF'u16 else: 0'u16
  return output

func ncg_i16r128_sse(a, b: i16r128): u16r128 =
  return cast[u16r128](mm_cmpgt_epi16(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_ncg_i16r128: proc(a, b: i16r128): u16r128 = if sseExists(): ncg_i16r128_sse else: ncg_i16r128_fallback

func ncg_i16r128_neon(a, b: i16r128): u16r128 =
  return cast[u16r128](vcgtq_s16(cast[neon.Int16x8](a), cast[neon.Int16x8](b)))

let arm_ncg_i16r128: proc(a, b: i16r128): u16r128 = if neonExists(): ncg_i16r128_neon else: ncg_i16r128_fallback

func ncg_i16r128_lsx(a, b: i16r128): u16r128 =
  return cast[u16r128](lsx_vslt_h(cast[lsx.M128i](b), cast[lsx.M128i](a)))

let la_ncg_i16r128: proc(a, b: i16r128): u16r128 = if lsxExists(): ncg_i16r128_lsx else: ncg_i16r128_fallback

template `>`*(a, b: i16r128): u16r128 =
  when defined(amd64) or defined(i386): x86_ncg_i16r128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncg_i16r128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncg_i16r128(a, b)

# ==========================================
# ncg (>) / i32r128 -> u32r128
# ==========================================

func ncg_i32r128_fallback(a, b: i32r128): u32r128 =
  var output: u32r128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, int32]](addr a)
  let pB   = cast[ptr array[4, int32]](addr b)
  unroll(i, 0, 3): 
    pOut[i] = if pA[i] > pB[i]: 0xFFFFFFFF'u32 else: 0'u32
  return output

func ncg_i32r128_sse(a, b: i32r128): u32r128 =
  return cast[u32r128](mm_cmpgt_epi32(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_ncg_i32r128: proc(a, b: i32r128): u32r128 = if sseExists(): ncg_i32r128_sse else: ncg_i32r128_fallback

func ncg_i32r128_neon(a, b: i32r128): u32r128 =
  return cast[u32r128](vcgtq_s32(cast[neon.Int32x4](a), cast[neon.Int32x4](b)))

let arm_ncg_i32r128: proc(a, b: i32r128): u32r128 = if neonExists(): ncg_i32r128_neon else: ncg_i32r128_fallback

func ncg_i32r128_lsx(a, b: i32r128): u32r128 =
  return cast[u32r128](lsx_vslt_w(cast[lsx.M128i](b), cast[lsx.M128i](a)))

let la_ncg_i32r128: proc(a, b: i32r128): u32r128 = if lsxExists(): ncg_i32r128_lsx else: ncg_i32r128_fallback

template `>`*(a, b: i32r128): u32r128 =
  when defined(amd64) or defined(i386): x86_ncg_i32r128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncg_i32r128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncg_i32r128(a, b)

# ==========================================
# ncg (>) / i64r128 -> u64r128
# ==========================================

func ncg_i64r128_fallback(a, b: i64r128): u64r128 =
  var output: u64r128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, int64]](addr a)
  let pB   = cast[ptr array[2, int64]](addr b)
  unroll(i, 0, 1): 
    pOut[i] = if pA[i] > pB[i]: 0xFFFFFFFFFFFFFFFF'u64 else: 0'u64
  return output

func ncg_i64r128_sse(a, b: i64r128): u64r128 =
  return cast[u64r128](mm_cmpgt_epi64(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_ncg_i64r128: proc(a, b: i64r128): u64r128 = if sseExists(): ncg_i64r128_sse else: ncg_i64r128_fallback

func ncg_i64r128_neon(a, b: i64r128): u64r128 =
  return cast[u64r128](vmvnq_u32(cast[neon.Uint32x4](vcleq_s64(cast[neon.Int64x2](a), cast[neon.Int64x2](b)))))

let arm_ncg_i64r128: proc(a, b: i64r128): u64r128 = if neonExists(): ncg_i64r128_neon else: ncg_i64r128_fallback

func ncg_i64r128_lsx(a, b: i64r128): u64r128 =
  return cast[u64r128](lsx_vslt_d(cast[lsx.M128i](b), cast[lsx.M128i](a)))

let la_ncg_i64r128: proc(a, b: i64r128): u64r128 = if lsxExists(): ncg_i64r128_lsx else: ncg_i64r128_fallback

template `>`*(a, b: i64r128): u64r128 =
  when defined(amd64) or defined(i386): x86_ncg_i64r128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncg_i64r128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncg_i64r128(a, b)

# ==========================================
# ncg (>) / u8r128 -> u8r128
# ==========================================

func ncg_u8r128_fallback(a, b: u8r128): u8r128 =
  var output: u8r128
  let pOut = cast[ptr array[16, uint8]](addr output)
  let pA   = cast[ptr array[16, uint8]](addr a)
  let pB   = cast[ptr array[16, uint8]](addr b)
  unroll(i, 0, 15): 
    pOut[i] = if pA[i] > pB[i]: 0xFF'u8 else: 0'u8
  return output

func ncg_u8r128_sse(a, b: u8r128): u8r128 =
  let offset = mm_set1_epi8(cast[int8](0x80'u8))
  let va = mm_xor_si128(cast[sse2.M128i](a), offset)
  let vb = mm_xor_si128(cast[sse2.M128i](b), offset)
  return cast[u8r128](mm_cmpgt_epi8(va, vb))

let x86_ncg_u8r128: proc(a, b: u8r128): u8r128 = if sseExists(): ncg_u8r128_sse else: ncg_u8r128_fallback

func ncg_u8r128_neon(a, b: u8r128): u8r128 =
  return cast[u8r128](vcgtq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b)))

let arm_ncg_u8r128: proc(a, b: u8r128): u8r128 = if neonExists(): ncg_u8r128_neon else: ncg_u8r128_fallback

func ncg_u8r128_lsx(a, b: u8r128): u8r128 =
  return cast[u8r128](lsx_vslt_bu(cast[lsx.M128i](b), cast[lsx.M128i](a)))

let la_ncg_u8r128: proc(a, b: u8r128): u8r128 = if lsxExists(): ncg_u8r128_lsx else: ncg_u8r128_fallback

template `>`*(a, b: u8r128): u8r128 =
  when defined(amd64) or defined(i386): x86_ncg_u8r128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncg_u8r128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncg_u8r128(a, b)

# ==========================================
# ncg (>) / u16r128 -> u16r128
# ==========================================

func ncg_u16r128_fallback(a, b: u16r128): u16r128 =
  var output: u16r128
  let pOut = cast[ptr array[8, uint16]](addr output)
  let pA   = cast[ptr array[8, uint16]](addr a)
  let pB   = cast[ptr array[8, uint16]](addr b)
  unroll(i, 0, 7): 
    pOut[i] = if pA[i] > pB[i]: 0xFFFF'u16 else: 0'u16
  return output

func ncg_u16r128_sse(a, b: u16r128): u16r128 =
  let offset = mm_set1_epi16(cast[int16](0x8000'u16))
  let va = mm_xor_si128(cast[sse2.M128i](a), offset)
  let vb = mm_xor_si128(cast[sse2.M128i](b), offset)
  return cast[u16r128](mm_cmpgt_epi16(va, vb))

let x86_ncg_u16r128: proc(a, b: u16r128): u16r128 = if sseExists(): ncg_u16r128_sse else: ncg_u16r128_fallback

func ncg_u16r128_neon(a, b: u16r128): u16r128 =
  return cast[u16r128](vcgtq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b)))

let arm_ncg_u16r128: proc(a, b: u16r128): u16r128 = if neonExists(): ncg_u16r128_neon else: ncg_u16r128_fallback

func ncg_u16r128_lsx(a, b: u16r128): u16r128 =
  return cast[u16r128](lsx_vslt_hu(cast[lsx.M128i](b), cast[lsx.M128i](a)))

let la_ncg_u16r128: proc(a, b: u16r128): u16r128 = if lsxExists(): ncg_u16r128_lsx else: ncg_u16r128_fallback

template `>`*(a, b: u16r128): u16r128 =
  when defined(amd64) or defined(i386): x86_ncg_u16r128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncg_u16r128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncg_u16r128(a, b)

# ==========================================
# ncg (>) / u32r128 -> u32r128
# ==========================================

func ncg_u32r128_fallback(a, b: u32r128): u32r128 =
  var output: u32r128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, uint32]](addr a)
  let pB   = cast[ptr array[4, uint32]](addr b)
  unroll(i, 0, 3): 
    pOut[i] = if pA[i] > pB[i]: 0xFFFFFFFF'u32 else: 0'u32
  return output

func ncg_u32r128_sse(a, b: u32r128): u32r128 =
  let offset = mm_set1_epi32(cast[int32](0x80000000'u32))
  let va = mm_xor_si128(cast[sse2.M128i](a), offset)
  let vb = mm_xor_si128(cast[sse2.M128i](b), offset)
  return cast[u32r128](mm_cmpgt_epi32(va, vb))

let x86_ncg_u32r128: proc(a, b: u32r128): u32r128 = if sseExists(): ncg_u32r128_sse else: ncg_u32r128_fallback

func ncg_u32r128_neon(a, b: u32r128): u32r128 =
  return cast[u32r128](vcgtq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b)))

let arm_ncg_u32r128: proc(a, b: u32r128): u32r128 = if neonExists(): ncg_u32r128_neon else: ncg_u32r128_fallback

func ncg_u32r128_lsx(a, b: u32r128): u32r128 =
  return cast[u32r128](lsx_vslt_wu(cast[lsx.M128i](b), cast[lsx.M128i](a)))

let la_ncg_u32r128: proc(a, b: u32r128): u32r128 = if lsxExists(): ncg_u32r128_lsx else: ncg_u32r128_fallback

template `>`*(a, b: u32r128): u32r128 =
  when defined(amd64) or defined(i386): x86_ncg_u32r128(a, b)
  elif defined(arm64): arm_ncg_u32r128(a, b)
  elif defined(loongarch64): la_ncg_u32r128(a, b)

# ==========================================
# ncg (>) / u64r128 -> u64r128
# ==========================================

func ncg_u64r128_fallback(a, b: u64r128): u64r128 =
  var output: u64r128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, uint64]](addr a)
  let pB   = cast[ptr array[2, uint64]](addr b)
  unroll(i, 0, 1): 
    pOut[i] = if pA[i] > pB[i]: 0xFFFFFFFFFFFFFFFF'u64 else: 0'u64
  return output
  
when defined(amd64) or defined(i386):
  func ncg_u64r128_sse(a, b: u64r128): u64r128 =
    let offset = mm_set1_epi64(cast[M64](0x8000000000000000'u64))
    let va = mm_xor_si128(cast[sse2.M128i](a), offset)
    let vb = mm_xor_si128(cast[sse2.M128i](b), offset)
    return cast[u64r128](mm_cmpgt_epi64(va, vb))
  
  let x86_ncg_u64r128: proc(a, b: u64r128): u64r128 = if sseExists(): ncg_u64r128_sse else: ncg_u64r128_fallback

when defined(arm64):
  func ncg_u64r128_neon(a, b: u64r128): u64r128 =
    return cast[u64r128](vcgtq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b)))
  
  let arm_ncg_u64r128: proc(a, b: u64r128): u64r128 = if neonExists(): ncg_u64r128_neon else: ncg_u64r128_fallback

when defined(loongarch64):
  func ncg_u64r128_lsx(a, b: u64r128): u64r128 =
    return cast[u64r128](lsx_vslt_du(cast[lsx.M128i](b), cast[lsx.M128i](a)))
  
  let la_ncg_u64r128: proc(a, b: u64r128): u64r128 = if lsxExists(): ncg_u64r128_lsx else: ncg_u64r128_fallback

template `>`*(a, b: u64r128): u64r128 =
  when defined(amd64) or defined(i386): x86_ncg_u64r128(a, b)
  elif defined(arm64): arm_ncg_u64r128(a, b)
  elif defined(loongarch64): la_ncg_u64r128(a, b)

# ==========================================
# ncg (>) / f32v128 -> u32v128
# ==========================================

func ncg_f32v128_fallback(a, b: f32v128): u32v128 =
  var output: u32v128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, float32]](addr a)
  let pB   = cast[ptr array[4, float32]](addr b)
  unroll(i, 0, 3): 
    pOut[i] = if pA[i] > pB[i]: 0xFFFFFFFF'u32 else: 0'u32
  return output

func ncg_f32v128_sse(a, b: f32v128): u32v128 =
  return cast[u32v128](mm_castps_si128(mm_cmpgt_ps(cast[sse.M128](a), cast[sse.M128](b))))

let x86_ncg_f32v128: proc(a, b: f32v128): u32v128 = if sseExists(): ncg_f32v128_sse else: ncg_f32v128_fallback

func ncg_f32v128_neon(a, b: f32v128): u32v128 =
  return cast[u32v128](vcgtq_f32(cast[neon.Float32x4](a), cast[neon.Float32x4](b)))

let arm_ncg_f32v128: proc(a, b: f32v128): u32v128 = if neonExists(): ncg_f32v128_neon else: ncg_f32v128_fallback

func ncg_f32v128_lsx(a, b: f32v128): u32v128 =
  return cast[u32v128](lsx_vfcmp_clt_s(cast[lsx.M128](b), cast[lsx.M128](a)))

let la_ncg_f32v128: proc(a, b: f32v128): u32v128 = if lsxExists(): ncg_f32v128_lsx else: ncg_f32v128_fallback

template `>`*(a, b: f32v128): u32v128 =
  when defined(amd64) or defined(i386): x86_ncg_f32v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncg_f32v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncg_f32v128(a, b)

# ==========================================
# ncg (>) / f64v128 -> u64v128
# ==========================================

func ncg_f64v128_fallback(a, b: f64v128): u64v128 =
  var output: u64v128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, float64]](addr a)
  let pB   = cast[ptr array[2, float64]](addr b)
  unroll(i, 0, 1): 
    pOut[i] = if pA[i] > pB[i]: 0xFFFFFFFFFFFFFFFF'u64 else: 0'u64
  return output

func ncg_f64v128_sse(a, b: f64v128): u64v128 =
  return cast[u64v128](mm_castpd_si128(mm_cmpgt_pd(cast[sse2.M128d](a), cast[sse2.M128d](b))))

let x86_ncg_f64v128: proc(a, b: f64v128): u64v128 = if sseExists(): ncg_f64v128_sse else: ncg_f64v128_fallback

func ncg_f64v128_neon(a, b: f64v128): u64v128 =
  return cast[u64v128](vmvnq_u32(cast[neon.Uint32x4](vcleq_f64(cast[neon.Float64x2](a), cast[neon.Float64x2](b)))))

let arm_ncg_f64v128: proc(a, b: f64v128): u64v128 = if neonExists(): ncg_f64v128_neon else: ncg_f64v128_fallback

func ncg_f64v128_lsx(a, b: f64v128): u64v128 =
  return cast[u64v128](lsx_vfcmp_clt_d(cast[lsx.M128d](b), cast[lsx.M128d](a)))

let la_ncg_f64v128: proc(a, b: f64v128): u64v128 = if lsxExists(): ncg_f64v128_lsx else: ncg_f64v128_fallback

template `>`*(a, b: f64v128): u64v128 =
  when defined(amd64) or defined(i386): x86_ncg_f64v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncg_f64v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncg_f64v128(a, b)

# ==========================================
# ncg (>) / i8v128 -> u8v128
# ==========================================

func ncg_i8v128_fallback(a, b: i8v128): u8v128 =
  var output: u8v128
  let pOut = cast[ptr array[16, uint8]](addr output)
  let pA   = cast[ptr array[16, int8]](addr a)
  let pB   = cast[ptr array[16, int8]](addr b)
  unroll(i, 0, 15): 
    pOut[i] = if pA[i] > pB[i]: 0xFF'u8 else: 0'u8
  return output

func ncg_i8v128_sse(a, b: i8v128): u8v128 =
  return cast[u8v128](mm_cmpgt_epi8(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_ncg_i8v128: proc(a, b: i8v128): u8v128 = if sseExists(): ncg_i8v128_sse else: ncg_i8v128_fallback

func ncg_i8v128_neon(a, b: i8v128): u8v128 =
  return cast[u8v128](vcgtq_s8(cast[neon.Int8x16](a), cast[neon.Int8x16](b)))

let arm_ncg_i8v128: proc(a, b: i8v128): u8v128 = if neonExists(): ncg_i8v128_neon else: ncg_i8v128_fallback

func ncg_i8v128_lsx(a, b: i8v128): u8v128 =
  return cast[u8v128](lsx_vslt_b(cast[lsx.M128i](b), cast[lsx.M128i](a)))

let la_ncg_i8v128: proc(a, b: i8v128): u8v128 = if lsxExists(): ncg_i8v128_lsx else: ncg_i8v128_fallback

template `>`*(a, b: i8v128): u8v128 =
  when defined(amd64) or defined(i386): x86_ncg_i8v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncg_i8v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncg_i8v128(a, b)

# ==========================================
# ncg (>) / i16v128 -> u16v128
# ==========================================

func ncg_i16v128_fallback(a, b: i16v128): u16v128 =
  var output: u16v128
  let pOut = cast[ptr array[8, uint16]](addr output)
  let pA   = cast[ptr array[8, int16]](addr a)
  let pB   = cast[ptr array[8, int16]](addr b)
  unroll(i, 0, 7): 
    pOut[i] = if pA[i] > pB[i]: 0xFFFF'u16 else: 0'u16
  return output

func ncg_i16v128_sse(a, b: i16v128): u16v128 =
  return cast[u16v128](mm_cmpgt_epi16(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_ncg_i16v128: proc(a, b: i16v128): u16v128 = if sseExists(): ncg_i16v128_sse else: ncg_i16v128_fallback

func ncg_i16v128_neon(a, b: i16v128): u16v128 =
  return cast[u16v128](vcgtq_s16(cast[neon.Int16x8](a), cast[neon.Int16x8](b)))

let arm_ncg_i16v128: proc(a, b: i16v128): u16v128 = if neonExists(): ncg_i16v128_neon else: ncg_i16v128_fallback

func ncg_i16v128_lsx(a, b: i16v128): u16v128 =
  return cast[u16v128](lsx_vslt_h(cast[lsx.M128i](b), cast[lsx.M128i](a)))

let la_ncg_i16v128: proc(a, b: i16v128): u16v128 = if lsxExists(): ncg_i16v128_lsx else: ncg_i16v128_fallback

template `>`*(a, b: i16v128): u16v128 =
  when defined(amd64) or defined(i386): x86_ncg_i16v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncg_i16v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncg_i16v128(a, b)

# ==========================================
# ncg (>) / i32v128 -> u32v128
# ==========================================

func ncg_i32v128_fallback(a, b: i32v128): u32v128 =
  var output: u32v128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, int32]](addr a)
  let pB   = cast[ptr array[4, int32]](addr b)
  unroll(i, 0, 3): 
    pOut[i] = if pA[i] > pB[i]: 0xFFFFFFFF'u32 else: 0'u32
  return output

func ncg_i32v128_sse(a, b: i32v128): u32v128 =
  return cast[u32v128](mm_cmpgt_epi32(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_ncg_i32v128: proc(a, b: i32v128): u32v128 = if sseExists(): ncg_i32v128_sse else: ncg_i32v128_fallback

func ncg_i32v128_neon(a, b: i32v128): u32v128 =
  return cast[u32v128](vcgtq_s32(cast[neon.Int32x4](a), cast[neon.Int32x4](b)))

let arm_ncg_i32v128: proc(a, b: i32v128): u32v128 = if neonExists(): ncg_i32v128_neon else: ncg_i32v128_fallback

func ncg_i32v128_lsx(a, b: i32v128): u32v128 =
  return cast[u32v128](lsx_vslt_w(cast[lsx.M128i](b), cast[lsx.M128i](a)))

let la_ncg_i32v128: proc(a, b: i32v128): u32v128 = if lsxExists(): ncg_i32v128_lsx else: ncg_i32v128_fallback

template `>`*(a, b: i32v128): u32v128 =
  when defined(amd64) or defined(i386): x86_ncg_i32v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncg_i32v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncg_i32v128(a, b)

# ==========================================
# ncg (>) / i64v128 -> u64v128
# ==========================================

func ncg_i64v128_fallback(a, b: i64v128): u64v128 =
  var output: u64v128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, int64]](addr a)
  let pB   = cast[ptr array[2, int64]](addr b)
  unroll(i, 0, 1): 
    pOut[i] = if pA[i] > pB[i]: 0xFFFFFFFFFFFFFFFF'u64 else: 0'u64
  return output

func ncg_i64v128_sse(a, b: i64v128): u64v128 =
  return cast[u64v128](mm_cmpgt_epi64(cast[sse2.M128i](a), cast[sse2.M128i](b)))

let x86_ncg_i64v128: proc(a, b: i64v128): u64v128 = if sseExists(): ncg_i64v128_sse else: ncg_i64v128_fallback

func ncg_i64v128_neon(a, b: i64v128): u64v128 =
  return cast[u64v128](vmvnq_u32(cast[neon.Uint32x4](vcleq_s64(cast[neon.Int64x2](a), cast[neon.Int64x2](b)))))

let arm_ncg_i64v128: proc(a, b: i64v128): u64v128 = if neonExists(): ncg_i64v128_neon else: ncg_i64v128_fallback

func ncg_i64v128_lsx(a, b: i64v128): u64v128 =
  return cast[u64v128](lsx_vslt_d(cast[lsx.M128i](b), cast[lsx.M128i](a)))

let la_ncg_i64v128: proc(a, b: i64v128): u64v128 = if lsxExists(): ncg_i64v128_lsx else: ncg_i64v128_fallback

template `>`*(a, b: i64v128): u64v128 =
  when defined(amd64) or defined(i386): x86_ncg_i64v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncg_i64v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncg_i64v128(a, b)

# ==========================================
# ncg (>) / u8v128 -> u8v128
# ==========================================

func ncg_u8v128_fallback(a, b: u8v128): u8v128 =
  var output: u8v128
  let pOut = cast[ptr array[16, uint8]](addr output)
  let pA   = cast[ptr array[16, uint8]](addr a)
  let pB   = cast[ptr array[16, uint8]](addr b)
  unroll(i, 0, 15): 
    pOut[i] = if pA[i] > pB[i]: 0xFF'u8 else: 0'u8
  return output

func ncg_u8v128_sse(a, b: u8v128): u8v128 =
  let offset = mm_set1_epi8(cast[int8](0x80'u8))
  let va = mm_xor_si128(cast[sse2.M128i](a), offset)
  let vb = mm_xor_si128(cast[sse2.M128i](b), offset)
  return cast[u8v128](mm_cmpgt_epi8(va, vb))

let x86_ncg_u8v128: proc(a, b: u8v128): u8v128 = if sseExists(): ncg_u8v128_sse else: ncg_u8v128_fallback

func ncg_u8v128_neon(a, b: u8v128): u8v128 =
  return cast[u8v128](vcgtq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b)))

let arm_ncg_u8v128: proc(a, b: u8v128): u8v128 = if neonExists(): ncg_u8v128_neon else: ncg_u8v128_fallback

func ncg_u8v128_lsx(a, b: u8v128): u8v128 =
  return cast[u8v128](lsx_vslt_bu(cast[lsx.M128i](b), cast[lsx.M128i](a)))

let la_ncg_u8v128: proc(a, b: u8v128): u8v128 = if lsxExists(): ncg_u8v128_lsx else: ncg_u8v128_fallback

template `>`*(a, b: u8v128): u8v128 =
  when defined(amd64) or defined(i386): x86_ncg_u8v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncg_u8v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncg_u8v128(a, b)

# ==========================================
# ncg (>) / u16v128 -> u16v128
# ==========================================

func ncg_u16v128_fallback(a, b: u16v128): u16v128 =
  var output: u16v128
  let pOut = cast[ptr array[8, uint16]](addr output)
  let pA   = cast[ptr array[8, uint16]](addr a)
  let pB   = cast[ptr array[8, uint16]](addr b)
  unroll(i, 0, 7): 
    pOut[i] = if pA[i] > pB[i]: 0xFFFF'u16 else: 0'u16
  return output

func ncg_u16v128_sse(a, b: u16v128): u16v128 =
  let offset = mm_set1_epi16(cast[int16](0x8000'u16))
  let va = mm_xor_si128(cast[sse2.M128i](a), offset)
  let vb = mm_xor_si128(cast[sse2.M128i](b), offset)
  return cast[u16v128](mm_cmpgt_epi16(va, vb))

let x86_ncg_u16v128: proc(a, b: u16v128): u16v128 = if sseExists(): ncg_u16v128_sse else: ncg_u16v128_fallback

func ncg_u16v128_neon(a, b: u16v128): u16v128 =
  return cast[u16v128](vcgtq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b)))

let arm_ncg_u16v128: proc(a, b: u16v128): u16v128 = if neonExists(): ncg_u16v128_neon else: ncg_u16v128_fallback

func ncg_u16v128_lsx(a, b: u16v128): u16v128 =
  return cast[u16v128](lsx_vslt_hu(cast[lsx.M128i](b), cast[lsx.M128i](a)))

let la_ncg_u16v128: proc(a, b: u16v128): u16v128 = if lsxExists(): ncg_u16v128_lsx else: ncg_u16v128_fallback

template `>`*(a, b: u16v128): u16v128 =
  when defined(amd64) or defined(i386): x86_ncg_u16v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncg_u16v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncg_u16v128(a, b)

# ==========================================
# ncg (>) / u32v128 -> u32v128
# ==========================================

func ncg_u32v128_fallback(a, b: u32v128): u32v128 =
  var output: u32v128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, uint32]](addr a)
  let pB   = cast[ptr array[4, uint32]](addr b)
  unroll(i, 0, 3): 
    pOut[i] = if pA[i] > pB[i]: 0xFFFFFFFF'u32 else: 0'u32
  return output

func ncg_u32v128_sse(a, b: u32v128): u32v128 =
  let offset = mm_set1_epi32(cast[int32](0x80000000'u32))
  let va = mm_xor_si128(cast[sse2.M128i](a), offset)
  let vb = mm_xor_si128(cast[sse2.M128i](b), offset)
  return cast[u32v128](mm_cmpgt_epi32(va, vb))

let x86_ncg_u32v128: proc(a, b: u32v128): u32v128 = if sseExists(): ncg_u32v128_sse else: ncg_u32v128_fallback

func ncg_u32v128_neon(a, b: u32v128): u32v128 =
  return cast[u32v128](vcgtq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b)))

let arm_ncg_u32v128: proc(a, b: u32v128): u32v128 = if neonExists(): ncg_u32v128_neon else: ncg_u32v128_fallback

func ncg_u32v128_lsx(a, b: u32v128): u32v128 =
  return cast[u32v128](lsx_vslt_wu(cast[lsx.M128i](b), cast[lsx.M128i](a)))

let la_ncg_u32v128: proc(a, b: u32v128): u32v128 = if lsxExists(): ncg_u32v128_lsx else: ncg_u32v128_fallback

template `>`*(a, b: u32v128): u32v128 =
  when defined(amd64) or defined(i386): x86_ncg_u32v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncg_u32v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncg_u32v128(a, b)

# ==========================================
# ncg (>) / u64v128 -> u64v128
# ==========================================

func ncg_u64v128_fallback(a, b: u64v128): u64v128 =
  var output: u64v128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, uint64]](addr a)
  let pB   = cast[ptr array[2, uint64]](addr b)
  unroll(i, 0, 1): 
    pOut[i] = if pA[i] > pB[i]: 0xFFFFFFFFFFFFFFFF'u64 else: 0'u64
  return output

func ncg_u64v128_sse(a, b: u64v128): u64v128 =
  let offset = mm_set1_epi64(cast[M64](0x8000000000000000'u64))
  let va = mm_xor_si128(cast[sse2.M128i](a), offset)
  let vb = mm_xor_si128(cast[sse2.M128i](b), offset)
  return cast[u64v128](mm_cmpgt_epi64(va, vb))

let x86_ncg_u64v128: proc(a, b: u64v128): u64v128 = if sseExists(): ncg_u64v128_sse else: ncg_u64v128_fallback

func ncg_u64v128_neon(a, b: u64v128): u64v128 =
  return cast[u64v128](vcgtq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b)))

let arm_ncg_u64v128: proc(a, b: u64v128): u64v128 = if neonExists(): ncg_u64v128_neon else: ncg_u64v128_fallback

func ncg_u64v128_lsx(a, b: u64v128): u64v128 =
  return cast[u64v128](lsx_vslt_du(cast[lsx.M128i](b), cast[lsx.M128i](a)))

let la_ncg_u64v128: proc(a, b: u64v128): u64v128 = if lsxExists(): ncg_u64v128_lsx else: ncg_u64v128_fallback

template `>`*(a, b: u64v128): u64v128 =
  when defined(amd64) or defined(i386): x86_ncg_u64v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncg_u64v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncg_u64v128(a, b)

# ==========================================
# ncle (<=) / f32r128 -> u32r128
# ==========================================

func ncle_f32r128_fallback(a, b: f32r128): u32r128 =
  var output: u32r128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, float32]](addr a)
  let pB   = cast[ptr array[4, float32]](addr b)
  unroll(i, 0, 3): 
    pOut[i] = if pA[i] <= pB[i]: 0xFFFFFFFF'u32 else: 0'u32
  return output

func ncle_f32r128_sse(a, b: f32r128): u32r128 =
  return cast[u32r128](mm_castps_si128(mm_cmple_ps(cast[sse.M128](a), cast[sse.M128](b))))

let x86_ncle_f32r128: proc(a, b: f32r128): u32r128 = if sseExists(): ncle_f32r128_sse else: ncle_f32r128_fallback

func ncle_f32r128_neon(a, b: f32r128): u32r128 =
  return cast[u32r128](vcleq_f32(cast[neon.Float32x4](a), cast[neon.Float32x4](b)))

let arm_ncle_f32r128: proc(a, b: f32r128): u32r128 = if neonExists(): ncle_f32r128_neon else: ncle_f32r128_fallback

func ncle_f32r128_lsx(a, b: f32r128): u32r128 =
  return cast[u32r128](lsx_vfcmp_cle_s(cast[lsx.M128](a), cast[lsx.M128](b)))

let la_ncle_f32r128: proc(a, b: f32r128): u32r128 = if lsxExists(): ncle_f32r128_lsx else: ncle_f32r128_fallback

template `<=`*(a, b: f32r128): u32r128 =
  when defined(amd64) or defined(i386): x86_ncle_f32r128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncle_f32r128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncle_f32r128(a, b)

# ==========================================
# ncle (<=) / f64r128 -> u64r128
# ==========================================

func ncle_f64r128_fallback(a, b: f64r128): u64r128 =
  var output: u64r128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, float64]](addr a)
  let pB   = cast[ptr array[2, float64]](addr b)
  unroll(i, 0, 1): 
    pOut[i] = if pA[i] <= pB[i]: 0xFFFFFFFFFFFFFFFF'u64 else: 0'u64
  return output

func ncle_f64r128_sse(a, b: f64r128): u64r128 =
  return cast[u64r128](mm_castpd_si128(mm_cmple_pd(cast[sse2.M128d](a), cast[sse2.M128d](b))))

let x86_ncle_f64r128: proc(a, b: f64r128): u64r128 = if sseExists(): ncle_f64r128_sse else: ncle_f64r128_fallback

func ncle_f64r128_neon(a, b: f64r128): u64r128 =
  return cast[u64r128](vcleq_f64(cast[neon.Float64x2](a), cast[neon.Float64x2](b)))

let arm_ncle_f64r128: proc(a, b: f64r128): u64r128 = if neonExists(): ncle_f64r128_neon else: ncle_f64r128_fallback

func ncle_f64r128_lsx(a, b: f64r128): u64r128 =
  return cast[u64r128](lsx_vfcmp_cle_d(cast[lsx.M128d](a), cast[lsx.M128d](b)))

let la_ncle_f64r128: proc(a, b: f64r128): u64r128 = if lsxExists(): ncle_f64r128_lsx else: ncle_f64r128_fallback

template `<=`*(a, b: f64r128): u64r128 =
  when defined(amd64) or defined(i386): x86_ncle_f64r128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncle_f64r128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncle_f64r128(a, b)

# ==========================================
# ncle (<=) / i8r128 -> u8r128
# ==========================================

func ncle_i8r128_fallback(a, b: i8r128): u8r128 =
  var output: u8r128
  let pOut = cast[ptr array[16, uint8]](addr output)
  let pA   = cast[ptr array[16, int8]](addr a)
  let pB   = cast[ptr array[16, int8]](addr b)
  unroll(i, 0, 15): 
    pOut[i] = if pA[i] <= pB[i]: 0xFF'u8 else: 0'u8
  return output

func ncle_i8r128_sse(a, b: i8r128): u8r128 =
  # NOT (A > B)  
  let gt = mm_cmpgt_epi8(cast[sse2.M128i](a), cast[sse2.M128i](b))
  let all_ones = mm_set1_epi8(cast[int8](0xFF'u8))
  return cast[u8r128](mm_andnot_si128(gt, all_ones))

let x86_ncle_i8r128: proc(a, b: i8r128): u8r128 = if sseExists(): ncle_i8r128_sse else: ncle_i8r128_fallback

func ncle_i8r128_neon(a, b: i8r128): u8r128 =
  return cast[u8r128](vcleq_s8(cast[neon.Int8x16](a), cast[neon.Int8x16](b)))

let arm_ncle_i8r128: proc(a, b: i8r128): u8r128 = if neonExists(): ncle_i8r128_neon else: ncle_i8r128_fallback

func ncle_i8r128_lsx(a, b: i8r128): u8r128 =
  return cast[u8r128](lsx_vsle_b(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ncle_i8r128: proc(a, b: i8r128): u8r128 = if lsxExists(): ncle_i8r128_lsx else: ncle_i8r128_fallback

template `<=`*(a, b: i8r128): u8r128 =
  when defined(amd64) or defined(i386): x86_ncle_i8r128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncle_i8r128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncle_i8r128(a, b)

# ==========================================
# ncle (<=) / i16r128 -> u16r128
# ==========================================

func ncle_i16r128_fallback(a, b: i16r128): u16r128 =
  var output: u16r128
  let pOut = cast[ptr array[8, uint16]](addr output)
  let pA   = cast[ptr array[8, int16]](addr a)
  let pB   = cast[ptr array[8, int16]](addr b)
  unroll(i, 0, 7): 
    pOut[i] = if pA[i] <= pB[i]: 0xFFFF'u16 else: 0'u16
  return output

func ncle_i16r128_sse(a, b: i16r128): u16r128 =
  let gt = mm_cmpgt_epi16(cast[sse2.M128i](a), cast[sse2.M128i](b))
  let all_ones = mm_set1_epi16(cast[int16](0xFFFF'u16))
  return cast[u16r128](mm_andnot_si128(gt, all_ones))

let x86_ncle_i16r128: proc(a, b: i16r128): u16r128 = if sseExists(): ncle_i16r128_sse else: ncle_i16r128_fallback

func ncle_i16r128_neon(a, b: i16r128): u16r128 =
  return cast[u16r128](vcleq_s16(cast[neon.Int16x8](a), cast[neon.Int16x8](b)))

let arm_ncle_i16r128: proc(a, b: i16r128): u16r128 = if neonExists(): ncle_i16r128_neon else: ncle_i16r128_fallback

func ncle_i16r128_lsx(a, b: i16r128): u16r128 =
  return cast[u16r128](lsx_vsle_h(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ncle_i16r128: proc(a, b: i16r128): u16r128 = if lsxExists(): ncle_i16r128_lsx else: ncle_i16r128_fallback

template `<=`*(a, b: i16r128): u16r128 =
  when defined(amd64) or defined(i386): x86_ncle_i16r128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncle_i16r128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncle_i16r128(a, b)

# ==========================================
# ncle (<=) / i32r128 -> u32r128
# ==========================================

func ncle_i32r128_fallback(a, b: i32r128): u32r128 =
  var output: u32r128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, int32]](addr a)
  let pB   = cast[ptr array[4, int32]](addr b)
  unroll(i, 0, 3): 
    pOut[i] = if pA[i] <= pB[i]: 0xFFFFFFFF'u32 else: 0'u32
  return output

func ncle_i32r128_sse(a, b: i32r128): u32r128 =
  let gt = mm_cmpgt_epi32(cast[sse2.M128i](a), cast[sse2.M128i](b))
  let all_ones = mm_set1_epi32(cast[int32](0xFFFFFFFF'u32))
  return cast[u32r128](mm_andnot_si128(gt, all_ones))

let x86_ncle_i32r128: proc(a, b: i32r128): u32r128 = if sseExists(): ncle_i32r128_sse else: ncle_i32r128_fallback

func ncle_i32r128_neon(a, b: i32r128): u32r128 =
  return cast[u32r128](vcleq_s32(cast[neon.Int32x4](a), cast[neon.Int32x4](b)))

let arm_ncle_i32r128: proc(a, b: i32r128): u32r128 = if neonExists(): ncle_i32r128_neon else: ncle_i32r128_fallback

func ncle_i32r128_lsx(a, b: i32r128): u32r128 =
  return cast[u32r128](lsx_vsle_w(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ncle_i32r128: proc(a, b: i32r128): u32r128 = if lsxExists(): ncle_i32r128_lsx else: ncle_i32r128_fallback

template `<=`*(a, b: i32r128): u32r128 =
  when defined(amd64) or defined(i386): x86_ncle_i32r128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncle_i32r128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncle_i32r128(a, b)

# ==========================================
# ncle (<=) / i64r128 -> u64r128
# ==========================================

func ncle_i64r128_fallback(a, b: i64r128): u64r128 =
  var output: u64r128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, int64]](addr a)
  let pB   = cast[ptr array[2, int64]](addr b)
  unroll(i, 0, 1): 
    pOut[i] = if pA[i] <= pB[i]: 0xFFFFFFFFFFFFFFFF'u64 else: 0'u64
  return output

func ncle_i64r128_sse(a, b: i64r128): u64r128 =
  let gt = mm_cmpgt_epi64(cast[sse2.M128i](a), cast[sse2.M128i](b))
  let all_ones = mm_set1_epi32(cast[int32](0xFFFFFFFF'u32)) # epi64 NOT 
  return cast[u64r128](mm_andnot_si128(gt, all_ones))

let x86_ncle_i64r128: proc(a, b: i64r128): u64r128 = if sseExists(): ncle_i64r128_sse else: ncle_i64r128_fallback

func ncle_i64r128_neon(a, b: i64r128): u64r128 =
  return cast[u64r128](vcleq_s64(cast[neon.Int64x2](a), cast[neon.Int64x2](b)))

let arm_ncle_i64r128: proc(a, b: i64r128): u64r128 = if neonExists(): ncle_i64r128_neon else: ncle_i64r128_fallback

func ncle_i64r128_lsx(a, b: i64r128): u64r128 =
  return cast[u64r128](lsx_vsle_d(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ncle_i64r128: proc(a, b: i64r128): u64r128 = if lsxExists(): ncle_i64r128_lsx else: ncle_i64r128_fallback

template `<=`*(a, b: i64r128): u64r128 =
  when defined(amd64) or defined(i386): x86_ncle_i64r128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncle_i64r128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncle_i64r128(a, b)

# ==========================================
# ncle (<=) / u8r128 -> u8r128
# ==========================================

func ncle_u8r128_fallback(a, b: u8r128): u8r128 =
  var output: u8r128
  let pOut = cast[ptr array[16, uint8]](addr output)
  let pA   = cast[ptr array[16, uint8]](addr a)
  let pB   = cast[ptr array[16, uint8]](addr b)
  unroll(i, 0, 15): 
    pOut[i] = if pA[i] <= pB[i]: 0xFF'u8 else: 0'u8
  return output

func ncle_u8r128_sse(a, b: u8r128): u8r128 =
  let offset = mm_set1_epi8(cast[int8](0x80'u8))
  let va = mm_xor_si128(cast[sse2.M128i](a), offset)
  let vb = mm_xor_si128(cast[sse2.M128i](b), offset)
  let gt = mm_cmpgt_epi8(va, vb)
  let all_ones = mm_set1_epi8(cast[int8](0xFF'u8))
  return cast[u8r128](mm_andnot_si128(gt, all_ones))

let x86_ncle_u8r128: proc(a, b: u8r128): u8r128 = if sseExists(): ncle_u8r128_sse else: ncle_u8r128_fallback

func ncle_u8r128_neon(a, b: u8r128): u8r128 =
  return cast[u8r128](vcleq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b)))

let arm_ncle_u8r128: proc(a, b: u8r128): u8r128 = if neonExists(): ncle_u8r128_neon else: ncle_u8r128_fallback

func ncle_u8r128_lsx(a, b: u8r128): u8r128 =
  return cast[u8r128](lsx_vsle_bu(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ncle_u8r128: proc(a, b: u8r128): u8r128 = if lsxExists(): ncle_u8r128_lsx else: ncle_u8r128_fallback

template `<=`*(a, b: u8r128): u8r128 =
  when defined(amd64) or defined(i386): x86_ncle_u8r128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncle_u8r128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncle_u8r128(a, b)

# ==========================================
# ncle (<=) / u16r128 -> u16r128
# ==========================================

func ncle_u16r128_fallback(a, b: u16r128): u16r128 =
  var output: u16r128
  let pOut = cast[ptr array[8, uint16]](addr output)
  let pA   = cast[ptr array[8, uint16]](addr a)
  let pB   = cast[ptr array[8, uint16]](addr b)
  unroll(i, 0, 7): 
    pOut[i] = if pA[i] <= pB[i]: 0xFFFF'u16 else: 0'u16
  return output

func ncle_u16r128_sse(a, b: u16r128): u16r128 =
  let offset = mm_set1_epi16(cast[int16](0x8000'u16))
  let va = mm_xor_si128(cast[sse2.M128i](a), offset)
  let vb = mm_xor_si128(cast[sse2.M128i](b), offset)
  let gt = mm_cmpgt_epi16(va, vb)
  let all_ones = mm_set1_epi16(cast[int16](0xFFFF'u16))
  return cast[u16r128](mm_andnot_si128(gt, all_ones))

let x86_ncle_u16r128: proc(a, b: u16r128): u16r128 = if sseExists(): ncle_u16r128_sse else: ncle_u16r128_fallback

func ncle_u16r128_neon(a, b: u16r128): u16r128 =
  return cast[u16r128](vcleq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b)))

let arm_ncle_u16r128: proc(a, b: u16r128): u16r128 = if neonExists(): ncle_u16r128_neon else: ncle_u16r128_fallback

func ncle_u16r128_lsx(a, b: u16r128): u16r128 =
  return cast[u16r128](lsx_vsle_hu(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ncle_u16r128: proc(a, b: u16r128): u16r128 = if lsxExists(): ncle_u16r128_lsx else: ncle_u16r128_fallback

template `<=`*(a, b: u16r128): u16r128 =
  when defined(amd64) or defined(i386): x86_ncle_u16r128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncle_u16r128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncle_u16r128(a, b)

# ==========================================
# ncle (<=) / u32r128 -> u32r128
# ==========================================

func ncle_u32r128_fallback(a, b: u32r128): u32r128 =
  var output: u32r128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, uint32]](addr a)
  let pB   = cast[ptr array[4, uint32]](addr b)
  unroll(i, 0, 3): 
    pOut[i] = if pA[i] <= pB[i]: 0xFFFFFFFF'u32 else: 0'u32
  return output

func ncle_u32r128_sse(a, b: u32r128): u32r128 =
  let offset = mm_set1_epi32(cast[int32](0x80000000'u32))
  let va = mm_xor_si128(cast[sse2.M128i](a), offset)
  let vb = mm_xor_si128(cast[sse2.M128i](b), offset)
  let gt = mm_cmpgt_epi32(va, vb)
  let all_ones = mm_set1_epi32(cast[int32](0xFFFFFFFF'u32))
  return cast[u32r128](mm_andnot_si128(gt, all_ones))

let x86_ncle_u32r128: proc(a, b: u32r128): u32r128 = if sseExists(): ncle_u32r128_sse else: ncle_u32r128_fallback

func ncle_u32r128_neon(a, b: u32r128): u32r128 =
  return cast[u32r128](vcleq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b)))

let arm_ncle_u32r128: proc(a, b: u32r128): u32r128 = if neonExists(): ncle_u32r128_neon else: ncle_u32r128_fallback

func ncle_u32r128_lsx(a, b: u32r128): u32r128 =
  return cast[u32r128](lsx_vsle_wu(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ncle_u32r128: proc(a, b: u32r128): u32r128 = if lsxExists(): ncle_u32r128_lsx else: ncle_u32r128_fallback

template `<=`*(a, b: u32r128): u32r128 =
  when defined(amd64) or defined(i386): x86_ncle_u32r128(a, b)
  elif defined(arm64): arm_ncle_u32r128(a, b)
  elif defined(loongarch64): la_ncle_u32r128(a, b)

# ==========================================
# ncle (<=) / u64r128 -> u64r128
# ==========================================

func ncle_u64r128_fallback(a, b: u64r128): u64r128 =
  var output: u64r128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, uint64]](addr a)
  let pB   = cast[ptr array[2, uint64]](addr b)
  unroll(i, 0, 1): 
    pOut[i] = if pA[i] <= pB[i]: 0xFFFFFFFFFFFFFFFF'u64 else: 0'u64
  return output

func ncle_u64r128_sse(a, b: u64r128): u64r128 =
  let offset = mm_set1_epi64(cast[M64](0x8000000000000000'u64))
  let va = mm_xor_si128(cast[sse2.M128i](a), offset)
  let vb = mm_xor_si128(cast[sse2.M128i](b), offset)
  let gt = mm_cmpgt_epi64(va, vb)
  let all_ones = mm_set1_epi32(cast[int32](0xFFFFFFFF'u32))
  return cast[u64r128](mm_andnot_si128(gt, all_ones))
  
let x86_ncle_u64r128: proc(a, b: u64r128): u64r128 = if sseExists(): ncle_u64r128_sse else: ncle_u64r128_fallback

func ncle_u64r128_neon(a, b: u64r128): u64r128 =
  return cast[u64r128](vcleq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b)))
  
let arm_ncle_u64r128: proc(a, b: u64r128): u64r128 = if neonExists(): ncle_u64r128_neon else: ncle_u64r128_fallback

func ncle_u64r128_lsx(a, b: u64r128): u64r128 =
  return cast[u64r128](lsx_vsle_du(cast[lsx.M128i](a), cast[lsx.M128i](b)))
  
let la_ncle_u64r128: proc(a, b: u64r128): u64r128 = if lsxExists(): ncle_u64r128_lsx else: ncle_u64r128_fallback

template `<=`*(a, b: u64r128): u64r128 =
  when defined(amd64) or defined(i386): x86_ncle_u64r128(a, b)
  elif defined(arm64): arm_ncle_u64r128(a, b)
  elif defined(loongarch64): la_ncle_u64r128(a, b)

# ==========================================
# ncle (<=) / f32v128 -> u32v128
# ==========================================

func ncle_f32v128_fallback(a, b: f32v128): u32v128 =
  var output: u32v128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, float32]](addr a)
  let pB   = cast[ptr array[4, float32]](addr b)
  unroll(i, 0, 3): 
    pOut[i] = if pA[i] <= pB[i]: 0xFFFFFFFF'u32 else: 0'u32
  return output

func ncle_f32v128_sse(a, b: f32v128): u32v128 =
  return cast[u32v128](mm_castps_si128(mm_cmple_ps(cast[sse.M128](a), cast[sse.M128](b))))

let x86_ncle_f32v128: proc(a, b: f32v128): u32v128 = if sseExists(): ncle_f32v128_sse else: ncle_f32v128_fallback

func ncle_f32v128_neon(a, b: f32v128): u32v128 =
  return cast[u32v128](vcleq_f32(cast[neon.Float32x4](a), cast[neon.Float32x4](b)))

let arm_ncle_f32v128: proc(a, b: f32v128): u32v128 = if neonExists(): ncle_f32v128_neon else: ncle_f32v128_fallback

func ncle_f32v128_lsx(a, b: f32v128): u32v128 =
  return cast[u32v128](lsx_vfcmp_cle_s(cast[lsx.M128](a), cast[lsx.M128](b)))

let la_ncle_f32v128: proc(a, b: f32v128): u32v128 = if lsxExists(): ncle_f32v128_lsx else: ncle_f32v128_fallback

template `<=`*(a, b: f32v128): u32v128 =
  when defined(amd64) or defined(i386): x86_ncle_f32v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncle_f32v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncle_f32v128(a, b)

# ==========================================
# ncle (<=) / f64v128 -> u64v128
# ==========================================

func ncle_f64v128_fallback(a, b: f64v128): u64v128 =
  var output: u64v128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, float64]](addr a)
  let pB   = cast[ptr array[2, float64]](addr b)
  unroll(i, 0, 1): 
    pOut[i] = if pA[i] <= pB[i]: 0xFFFFFFFFFFFFFFFF'u64 else: 0'u64
  return output

func ncle_f64v128_sse(a, b: f64v128): u64v128 =
  return cast[u64v128](mm_castpd_si128(mm_cmple_pd(cast[sse2.M128d](a), cast[sse2.M128d](b))))

let x86_ncle_f64v128: proc(a, b: f64v128): u64v128 = if sseExists(): ncle_f64v128_sse else: ncle_f64v128_fallback

func ncle_f64v128_neon(a, b: f64v128): u64v128 =
  return cast[u64v128](vcleq_f64(cast[neon.Float64x2](a), cast[neon.Float64x2](b)))

let arm_ncle_f64v128: proc(a, b: f64v128): u64v128 = if neonExists(): ncle_f64v128_neon else: ncle_f64v128_fallback

func ncle_f64v128_lsx(a, b: f64v128): u64v128 =
  return cast[u64v128](lsx_vfcmp_cle_d(cast[lsx.M128d](a), cast[lsx.M128d](b)))

let la_ncle_f64v128: proc(a, b: f64v128): u64v128 = if lsxExists(): ncle_f64v128_lsx else: ncle_f64v128_fallback

template `<=`*(a, b: f64v128): u64v128 =
  when defined(amd64) or defined(i386): x86_ncle_f64v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncle_f64v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncle_f64v128(a, b)

# ==========================================
# ncle (<=) / i8v128 -> u8v128
# ==========================================

func ncle_i8v128_fallback(a, b: i8v128): u8v128 =
  var output: u8v128
  let pOut = cast[ptr array[16, uint8]](addr output)
  let pA   = cast[ptr array[16, int8]](addr a)
  let pB   = cast[ptr array[16, int8]](addr b)
  unroll(i, 0, 15): 
    pOut[i] = if pA[i] <= pB[i]: 0xFF'u8 else: 0'u8
  return output

func ncle_i8v128_sse(a, b: i8v128): u8v128 =
  let gt = mm_cmpgt_epi8(cast[sse2.M128i](a), cast[sse2.M128i](b))
  let all_ones = mm_set1_epi8(cast[int8](0xFF'u8))
  return cast[u8v128](mm_andnot_si128(gt, all_ones))

let x86_ncle_i8v128: proc(a, b: i8v128): u8v128 = if sseExists(): ncle_i8v128_sse else: ncle_i8v128_fallback

func ncle_i8v128_neon(a, b: i8v128): u8v128 =
  return cast[u8v128](vcleq_s8(cast[neon.Int8x16](a), cast[neon.Int8x16](b)))

let arm_ncle_i8v128: proc(a, b: i8v128): u8v128 = if neonExists(): ncle_i8v128_neon else: ncle_i8v128_fallback

func ncle_i8v128_lsx(a, b: i8v128): u8v128 =
  return cast[u8v128](lsx_vsle_b(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ncle_i8v128: proc(a, b: i8v128): u8v128 = if lsxExists(): ncle_i8v128_lsx else: ncle_i8v128_fallback

template `<=`*(a, b: i8v128): u8v128 =
  when defined(amd64) or defined(i386): x86_ncle_i8v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncle_i8v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncle_i8v128(a, b)

# ==========================================
# ncle (<=) / i16v128 -> u16v128
# ==========================================

func ncle_i16v128_fallback(a, b: i16v128): u16v128 =
  var output: u16v128
  let pOut = cast[ptr array[8, uint16]](addr output)
  let pA   = cast[ptr array[8, int16]](addr a)
  let pB   = cast[ptr array[8, int16]](addr b)
  unroll(i, 0, 7): 
    pOut[i] = if pA[i] <= pB[i]: 0xFFFF'u16 else: 0'u16
  return output

func ncle_i16v128_sse(a, b: i16v128): u16v128 =
  let gt = mm_cmpgt_epi16(cast[sse2.M128i](a), cast[sse2.M128i](b))
  let all_ones = mm_set1_epi16(cast[int16](0xFFFF'u16))
  return cast[u16v128](mm_andnot_si128(gt, all_ones))

let x86_ncle_i16v128: proc(a, b: i16v128): u16v128 = if sseExists(): ncle_i16v128_sse else: ncle_i16v128_fallback

func ncle_i16v128_neon(a, b: i16v128): u16v128 =
  return cast[u16v128](vcleq_s16(cast[neon.Int16x8](a), cast[neon.Int16x8](b)))

let arm_ncle_i16v128: proc(a, b: i16v128): u16v128 = if neonExists(): ncle_i16v128_neon else: ncle_i16v128_fallback

func ncle_i16v128_lsx(a, b: i16v128): u16v128 =
  return cast[u16v128](lsx_vsle_h(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ncle_i16v128: proc(a, b: i16v128): u16v128 = if lsxExists(): ncle_i16v128_lsx else: ncle_i16v128_fallback

template `<=`*(a, b: i16v128): u16v128 =
  when defined(amd64) or defined(i386): x86_ncle_i16v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncle_i16v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncle_i16v128(a, b)

# ==========================================
# ncle (<=) / i32v128 -> u32v128
# ==========================================

func ncle_i32v128_fallback(a, b: i32v128): u32v128 =
  var output: u32v128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, int32]](addr a)
  let pB   = cast[ptr array[4, int32]](addr b)
  unroll(i, 0, 3): 
    pOut[i] = if pA[i] <= pB[i]: 0xFFFFFFFF'u32 else: 0'u32
  return output

func ncle_i32v128_sse(a, b: i32v128): u32v128 =
  let gt = mm_cmpgt_epi32(cast[sse2.M128i](a), cast[sse2.M128i](b))
  let all_ones = mm_set1_epi32(cast[int32](0xFFFFFFFF'u32))
  return cast[u32v128](mm_andnot_si128(gt, all_ones))

let x86_ncle_i32v128: proc(a, b: i32v128): u32v128 = if sseExists(): ncle_i32v128_sse else: ncle_i32v128_fallback

func ncle_i32v128_neon(a, b: i32v128): u32v128 =
  return cast[u32v128](vcleq_s32(cast[neon.Int32x4](a), cast[neon.Int32x4](b)))

let arm_ncle_i32v128: proc(a, b: i32v128): u32v128 = if neonExists(): ncle_i32v128_neon else: ncle_i32v128_fallback

func ncle_i32v128_lsx(a, b: i32v128): u32v128 =
  return cast[u32v128](lsx_vsle_w(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ncle_i32v128: proc(a, b: i32v128): u32v128 = if lsxExists(): ncle_i32v128_lsx else: ncle_i32v128_fallback

template `<=`*(a, b: i32v128): u32v128 =
  when defined(amd64) or defined(i386): x86_ncle_i32v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncle_i32v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncle_i32v128(a, b)

# ==========================================
# ncle (<=) / i64v128 -> u64v128
# ==========================================

func ncle_i64v128_fallback(a, b: i64v128): u64v128 =
  var output: u64v128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, int64]](addr a)
  let pB   = cast[ptr array[2, int64]](addr b)
  unroll(i, 0, 1): 
    pOut[i] = if pA[i] <= pB[i]: 0xFFFFFFFFFFFFFFFF'u64 else: 0'u64
  return output

func ncle_i64v128_sse(a, b: i64v128): u64v128 =
  let gt = mm_cmpgt_epi64(cast[sse2.M128i](a), cast[sse2.M128i](b))
  let all_ones = mm_set1_epi32(cast[int32](0xFFFFFFFF'u32))
  return cast[u64v128](mm_andnot_si128(gt, all_ones))

let x86_ncle_i64v128: proc(a, b: i64v128): u64v128 = if sseExists(): ncle_i64v128_sse else: ncle_i64v128_fallback

func ncle_i64v128_neon(a, b: i64v128): u64v128 =
  return cast[u64v128](vcleq_s64(cast[neon.Int64x2](a), cast[neon.Int64x2](b)))

let arm_ncle_i64v128: proc(a, b: i64v128): u64v128 = if neonExists(): ncle_i64v128_neon else: ncle_i64v128_fallback

func ncle_i64v128_lsx(a, b: i64v128): u64v128 =
  return cast[u64v128](lsx_vsle_d(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ncle_i64v128: proc(a, b: i64v128): u64v128 = if lsxExists(): ncle_i64v128_lsx else: ncle_i64v128_fallback

template `<=`*(a, b: i64v128): u64v128 =
  when defined(amd64) or defined(i386): x86_ncle_i64v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncle_i64v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncle_i64v128(a, b)

# ==========================================
# ncle (<=) / u8v128 -> u8v128
# ==========================================

func ncle_u8v128_fallback(a, b: u8v128): u8v128 =
  var output: u8v128
  let pOut = cast[ptr array[16, uint8]](addr output)
  let pA   = cast[ptr array[16, uint8]](addr a)
  let pB   = cast[ptr array[16, uint8]](addr b)
  unroll(i, 0, 15): 
    pOut[i] = if pA[i] <= pB[i]: 0xFF'u8 else: 0'u8
  return output

func ncle_u8v128_sse(a, b: u8v128): u8v128 =
  let offset = mm_set1_epi8(cast[int8](0x80'u8))
  let va = mm_xor_si128(cast[sse2.M128i](a), offset)
  let vb = mm_xor_si128(cast[sse2.M128i](b), offset)
  let gt = mm_cmpgt_epi8(va, vb)
  let all_ones = mm_set1_epi8(cast[int8](0xFF'u8))
  return cast[u8v128](mm_andnot_si128(gt, all_ones))

let x86_ncle_u8v128: proc(a, b: u8v128): u8v128 = if sseExists(): ncle_u8v128_sse else: ncle_u8v128_fallback

func ncle_u8v128_neon(a, b: u8v128): u8v128 =
  return cast[u8v128](vcleq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b)))

let arm_ncle_u8v128: proc(a, b: u8v128): u8v128 = if neonExists(): ncle_u8v128_neon else: ncle_u8v128_fallback

func ncle_u8v128_lsx(a, b: u8v128): u8v128 =
  return cast[u8v128](lsx_vsle_bu(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ncle_u8v128: proc(a, b: u8v128): u8v128 = if lsxExists(): ncle_u8v128_lsx else: ncle_u8v128_fallback

template `<=`*(a, b: u8v128): u8v128 =
  when defined(amd64) or defined(i386): x86_ncle_u8v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncle_u8v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncle_u8v128(a, b)

# ==========================================
# ncle (<=) / u16v128 -> u16v128
# ==========================================

func ncle_u16v128_fallback(a, b: u16v128): u16v128 =
  var output: u16v128
  let pOut = cast[ptr array[8, uint16]](addr output)
  let pA   = cast[ptr array[8, uint16]](addr a)
  let pB   = cast[ptr array[8, uint16]](addr b)
  unroll(i, 0, 7): 
    pOut[i] = if pA[i] <= pB[i]: 0xFFFF'u16 else: 0'u16
  return output

func ncle_u16v128_sse(a, b: u16v128): u16v128 =
  let offset = mm_set1_epi16(cast[int16](0x8000'u16))
  let va = mm_xor_si128(cast[sse2.M128i](a), offset)
  let vb = mm_xor_si128(cast[sse2.M128i](b), offset)
  let gt = mm_cmpgt_epi16(va, vb)
  let all_ones = mm_set1_epi16(cast[int16](0xFFFF'u16))
  return cast[u16v128](mm_andnot_si128(gt, all_ones))

let x86_ncle_u16v128: proc(a, b: u16v128): u16v128 = if sseExists(): ncle_u16v128_sse else: ncle_u16v128_fallback

func ncle_u16v128_neon(a, b: u16v128): u16v128 =
  return cast[u16v128](vcleq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b)))

let arm_ncle_u16v128: proc(a, b: u16v128): u16v128 = if neonExists(): ncle_u16v128_neon else: ncle_u16v128_fallback

func ncle_u16v128_lsx(a, b: u16v128): u16v128 =
  return cast[u16v128](lsx_vsle_hu(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ncle_u16v128: proc(a, b: u16v128): u16v128 = if lsxExists(): ncle_u16v128_lsx else: ncle_u16v128_fallback

template `<=`*(a, b: u16v128): u16v128 =
  when defined(amd64) or defined(i386): x86_ncle_u16v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncle_u16v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncle_u16v128(a, b)

# ==========================================
# ncle (<=) / u32v128 -> u32v128
# ==========================================

func ncle_u32v128_fallback(a, b: u32v128): u32v128 =
  var output: u32v128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, uint32]](addr a)
  let pB   = cast[ptr array[4, uint32]](addr b)
  unroll(i, 0, 3): 
    pOut[i] = if pA[i] <= pB[i]: 0xFFFFFFFF'u32 else: 0'u32
  return output

func ncle_u32v128_sse(a, b: u32v128): u32v128 =
  let offset = mm_set1_epi32(cast[int32](0x80000000'u32))
  let va = mm_xor_si128(cast[sse2.M128i](a), offset)
  let vb = mm_xor_si128(cast[sse2.M128i](b), offset)
  let gt = mm_cmpgt_epi32(va, vb)
  let all_ones = mm_set1_epi32(cast[int32](0xFFFFFFFF'u32))
  return cast[u32v128](mm_andnot_si128(gt, all_ones))

let x86_ncle_u32v128: proc(a, b: u32v128): u32v128 = if sseExists(): ncle_u32v128_sse else: ncle_u32v128_fallback

func ncle_u32v128_neon(a, b: u32v128): u32v128 =
  return cast[u32v128](vcleq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b)))

let arm_ncle_u32v128: proc(a, b: u32v128): u32v128 = if neonExists(): ncle_u32v128_neon else: ncle_u32v128_fallback

func ncle_u32v128_lsx(a, b: u32v128): u32v128 =
  return cast[u32v128](lsx_vsle_wu(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ncle_u32v128: proc(a, b: u32v128): u32v128 = if lsxExists(): ncle_u32v128_lsx else: ncle_u32v128_fallback

template `<=`*(a, b: u32v128): u32v128 =
  when defined(amd64) or defined(i386): x86_ncle_u32v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncle_u32v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncle_u32v128(a, b)

# ==========================================
# ncle (<=) / u64v128 -> u64v128
# ==========================================

func ncle_u64v128_fallback(a, b: u64v128): u64v128 =
  var output: u64v128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, uint64]](addr a)
  let pB   = cast[ptr array[2, uint64]](addr b)
  unroll(i, 0, 1): 
    pOut[i] = if pA[i] <= pB[i]: 0xFFFFFFFFFFFFFFFF'u64 else: 0'u64
  return output

func ncle_u64v128_sse(a, b: u64v128): u64v128 =
  let offset = mm_set1_epi64(cast[M64](0x8000000000000000'u64))
  let va = mm_xor_si128(cast[sse2.M128i](a), offset)
  let vb = mm_xor_si128(cast[sse2.M128i](b), offset)
  let gt = mm_cmpgt_epi64(va, vb)
  let all_ones = mm_set1_epi32(cast[int32](0xFFFFFFFF'u32))
  return cast[u64v128](mm_andnot_si128(gt, all_ones))

let x86_ncle_u64v128: proc(a, b: u64v128): u64v128 = if sseExists(): ncle_u64v128_sse else: ncle_u64v128_fallback

func ncle_u64v128_neon(a, b: u64v128): u64v128 =
  return cast[u64v128](vcleq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b)))

let arm_ncle_u64v128: proc(a, b: u64v128): u64v128 = if neonExists(): ncle_u64v128_neon else: ncle_u64v128_fallback

func ncle_u64v128_lsx(a, b: u64v128): u64v128 =
  return cast[u64v128](lsx_vsle_du(cast[lsx.M128i](a), cast[lsx.M128i](b)))

let la_ncle_u64v128: proc(a, b: u64v128): u64v128 = if lsxExists(): ncle_u64v128_lsx else: ncle_u64v128_fallback

template `<=`*(a, b: u64v128): u64v128 =
  when defined(amd64) or defined(i386): x86_ncle_u64v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncle_u64v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncle_u64v128(a, b)

# ==========================================
# ncge (>=) / f32v128 -> u32v128
# ==========================================

func ncge_f32v128_fallback(a, b: f32v128): u32v128 =
  var output: u32v128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, float32]](addr a)
  let pB   = cast[ptr array[4, float32]](addr b)
  unroll(i, 0, 3): 
    pOut[i] = if pA[i] >= pB[i]: 0xFFFFFFFF'u32 else: 0'u32
  return output

func ncge_f32v128_sse(a, b: f32v128): u32v128 =
  return cast[u32v128](mm_castps_si128(mm_cmpge_ps(cast[sse.M128](a), cast[sse.M128](b))))

let x86_ncge_f32v128: proc(a, b: f32v128): u32v128 = if sseExists(): ncge_f32v128_sse else: ncge_f32v128_fallback

func ncge_f32v128_neon(a, b: f32v128): u32v128 =
  return cast[u32v128](vcgeq_f32(cast[neon.Float32x4](a), cast[neon.Float32x4](b)))

let arm_ncge_f32v128: proc(a, b: f32v128): u32v128 = if neonExists(): ncge_f32v128_neon else: ncge_f32v128_fallback

func ncge_f32v128_lsx(a, b: f32v128): u32v128 =
  # a >= b  <=>  b <= a
  return cast[u32v128](lsx_vfcmp_cle_s(cast[lsx.M128](b), cast[lsx.M128](a)))

let la_ncge_f32v128: proc(a, b: f32v128): u32v128 = if lsxExists(): ncge_f32v128_lsx else: ncge_f32v128_fallback

template `>=`*(a, b: f32v128): u32v128 =
  when defined(amd64) or defined(i386): x86_ncge_f32v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncge_f32v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncge_f32v128(a, b)

# ==========================================
# ncge (>=) / f64v128 -> u64v128
# ==========================================

func ncge_f64v128_fallback(a, b: f64v128): u64v128 =
  var output: u64v128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, float64]](addr a)
  let pB   = cast[ptr array[2, float64]](addr b)
  unroll(i, 0, 1): 
    pOut[i] = if pA[i] >= pB[i]: 0xFFFFFFFFFFFFFFFF'u64 else: 0'u64
  return output

func ncge_f64v128_sse(a, b: f64v128): u64v128 =
  return cast[u64v128](mm_castpd_si128(mm_cmpge_pd(cast[sse2.M128d](a), cast[sse2.M128d](b))))

let x86_ncge_f64v128: proc(a, b: f64v128): u64v128 = if sseExists(): ncge_f64v128_sse else: ncge_f64v128_fallback

func ncge_f64v128_neon(a, b: f64v128): u64v128 =
  return cast[u64v128](vcgeq_f64(cast[neon.Float64x2](a), cast[neon.Float64x2](b)))

let arm_ncge_f64v128: proc(a, b: f64v128): u64v128 = if neonExists(): ncge_f64v128_neon else: ncge_f64v128_fallback

func ncge_f64v128_lsx(a, b: f64v128): u64v128 =
  # a >= b  <=>  b <= a
  return cast[u64v128](lsx_vfcmp_cle_d(cast[lsx.M128d](b), cast[lsx.M128d](a)))

let la_ncge_f64v128: proc(a, b: f64v128): u64v128 = if lsxExists(): ncge_f64v128_lsx else: ncge_f64v128_fallback

template `>=`*(a, b: f64v128): u64v128 =
  when defined(amd64) or defined(i386): x86_ncge_f64v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncge_f64v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncge_f64v128(a, b)

# ==========================================
# ncge (>=) / i8v128 -> u8v128
# ==========================================

func ncge_i8v128_fallback(a, b: i8v128): u8v128 =
  var output: u8v128
  let pOut = cast[ptr array[16, uint8]](addr output)
  let pA   = cast[ptr array[16, int8]](addr a)
  let pB   = cast[ptr array[16, int8]](addr b)
  unroll(i, 0, 15): 
    pOut[i] = if pA[i] >= pB[i]: 0xFF'u8 else: 0'u8
  return output

func ncge_i8v128_sse(a, b: i8v128): u8v128 =
  # NOT (B > A)  
  let gt = mm_cmpgt_epi8(cast[sse2.M128i](b), cast[sse2.M128i](a))
  let all_ones = mm_set1_epi8(cast[int8](0xFF'u8))
  return cast[u8v128](mm_andnot_si128(gt, all_ones))

let x86_ncge_i8v128: proc(a, b: i8v128): u8v128 = if sseExists(): ncge_i8v128_sse else: ncge_i8v128_fallback

func ncge_i8v128_neon(a, b: i8v128): u8v128 =
  return cast[u8v128](vcgeq_s8(cast[neon.Int8x16](a), cast[neon.Int8x16](b)))

let arm_ncge_i8v128: proc(a, b: i8v128): u8v128 = if neonExists(): ncge_i8v128_neon else: ncge_i8v128_fallback

func ncge_i8v128_lsx(a, b: i8v128): u8v128 =
  # a >= b  <=>  b <= a
  return cast[u8v128](lsx_vsle_b(cast[lsx.M128i](b), cast[lsx.M128i](a)))

let la_ncge_i8v128: proc(a, b: i8v128): u8v128 = if lsxExists(): ncge_i8v128_lsx else: ncge_i8v128_fallback

template `>=`*(a, b: i8v128): u8v128 =
  when defined(amd64) or defined(i386): x86_ncge_i8v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncge_i8v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncge_i8v128(a, b)

# ==========================================
# ncge (>=) / i16v128 -> u16v128
# ==========================================

func ncge_i16v128_fallback(a, b: i16v128): u16v128 =
  var output: u16v128
  let pOut = cast[ptr array[8, uint16]](addr output)
  let pA   = cast[ptr array[8, int16]](addr a)
  let pB   = cast[ptr array[8, int16]](addr b)
  unroll(i, 0, 7): 
    pOut[i] = if pA[i] >= pB[i]: 0xFFFF'u16 else: 0'u16
  return output

func ncge_i16v128_sse(a, b: i16v128): u16v128 =
  let gt = mm_cmpgt_epi16(cast[sse2.M128i](b), cast[sse2.M128i](a))
  let all_ones = mm_set1_epi16(cast[int16](0xFFFF'u16))
  return cast[u16v128](mm_andnot_si128(gt, all_ones))

let x86_ncge_i16v128: proc(a, b: i16v128): u16v128 = if sseExists(): ncge_i16v128_sse else: ncge_i16v128_fallback

func ncge_i16v128_neon(a, b: i16v128): u16v128 =
  return cast[u16v128](vcgeq_s16(cast[neon.Int16x8](a), cast[neon.Int16x8](b)))

let arm_ncge_i16v128: proc(a, b: i16v128): u16v128 = if neonExists(): ncge_i16v128_neon else: ncge_i16v128_fallback

func ncge_i16v128_lsx(a, b: i16v128): u16v128 =
  return cast[u16v128](lsx_vsle_h(cast[lsx.M128i](b), cast[lsx.M128i](a)))

let la_ncge_i16v128: proc(a, b: i16v128): u16v128 = if lsxExists(): ncge_i16v128_lsx else: ncge_i16v128_fallback

template `>=`*(a, b: i16v128): u16v128 =
  when defined(amd64) or defined(i386): x86_ncge_i16v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncge_i16v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncge_i16v128(a, b)

# ==========================================
# ncge (>=) / i32v128 -> u32v128
# ==========================================

func ncge_i32v128_fallback(a, b: i32v128): u32v128 =
  var output: u32v128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, int32]](addr a)
  let pB   = cast[ptr array[4, int32]](addr b)
  unroll(i, 0, 3): 
    pOut[i] = if pA[i] >= pB[i]: 0xFFFFFFFF'u32 else: 0'u32
  return output

func ncge_i32v128_sse(a, b: i32v128): u32v128 =
  let gt = mm_cmpgt_epi32(cast[sse2.M128i](b), cast[sse2.M128i](a))
  let all_ones = mm_set1_epi32(cast[int32](0xFFFFFFFF'u32))
  return cast[u32v128](mm_andnot_si128(gt, all_ones))

let x86_ncge_i32v128: proc(a, b: i32v128): u32v128 = if sseExists(): ncge_i32v128_sse else: ncge_i32v128_fallback

func ncge_i32v128_neon(a, b: i32v128): u32v128 =
  return cast[u32v128](vcgeq_s32(cast[neon.Int32x4](a), cast[neon.Int32x4](b)))

let arm_ncge_i32v128: proc(a, b: i32v128): u32v128 = if neonExists(): ncge_i32v128_neon else: ncge_i32v128_fallback

func ncge_i32v128_lsx(a, b: i32v128): u32v128 =
  return cast[u32v128](lsx_vsle_w(cast[lsx.M128i](b), cast[lsx.M128i](a)))

let la_ncge_i32v128: proc(a, b: i32v128): u32v128 = if lsxExists(): ncge_i32v128_lsx else: ncge_i32v128_fallback

template `>=`*(a, b: i32v128): u32v128 =
  when defined(amd64) or defined(i386): x86_ncge_i32v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncge_i32v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncge_i32v128(a, b)

# ==========================================
# ncge (>=) / i64v128 -> u64v128
# ==========================================

func ncge_i64v128_fallback(a, b: i64v128): u64v128 =
  var output: u64v128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, int64]](addr a)
  let pB   = cast[ptr array[2, int64]](addr b)
  unroll(i, 0, 1): 
    pOut[i] = if pA[i] >= pB[i]: 0xFFFFFFFFFFFFFFFF'u64 else: 0'u64
  return output

func ncge_i64v128_sse(a, b: i64v128): u64v128 =
  let gt = mm_cmpgt_epi64(cast[sse2.M128i](b), cast[sse2.M128i](a))
  let all_ones = mm_set1_epi32(cast[int32](0xFFFFFFFF'u32))
  return cast[u64v128](mm_andnot_si128(gt, all_ones))

let x86_ncge_i64v128: proc(a, b: i64v128): u64v128 = if sseExists(): ncge_i64v128_sse else: ncge_i64v128_fallback

func ncge_i64v128_neon(a, b: i64v128): u64v128 =
  return cast[u64v128](vcgeq_s64(cast[neon.Int64x2](a), cast[neon.Int64x2](b)))

let arm_ncge_i64v128: proc(a, b: i64v128): u64v128 = if neonExists(): ncge_i64v128_neon else: ncge_i64v128_fallback

func ncge_i64v128_lsx(a, b: i64v128): u64v128 =
  return cast[u64v128](lsx_vsle_d(cast[lsx.M128i](b), cast[lsx.M128i](a)))

let la_ncge_i64v128: proc(a, b: i64v128): u64v128 = if lsxExists(): ncge_i64v128_lsx else: ncge_i64v128_fallback

template `>=`*(a, b: i64v128): u64v128 =
  when defined(amd64) or defined(i386): x86_ncge_i64v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncge_i64v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncge_i64v128(a, b)

# ==========================================
# ncge (>=) / u8v128 -> u8v128
# ==========================================

func ncge_u8v128_fallback(a, b: u8v128): u8v128 =
  var output: u8v128
  let pOut = cast[ptr array[16, uint8]](addr output)
  let pA   = cast[ptr array[16, uint8]](addr a)
  let pB   = cast[ptr array[16, uint8]](addr b)
  unroll(i, 0, 15): 
    pOut[i] = if pA[i] >= pB[i]: 0xFF'u8 else: 0'u8
  return output

func ncge_u8v128_sse(a, b: u8v128): u8v128 =
  let offset = mm_set1_epi8(cast[int8](0x80'u8))
  let va = mm_xor_si128(cast[sse2.M128i](a), offset)
  let vb = mm_xor_si128(cast[sse2.M128i](b), offset)
  let gt = mm_cmpgt_epi8(vb, va) # NOT (b > a)
  let all_ones = mm_set1_epi8(cast[int8](0xFF'u8))
  return cast[u8v128](mm_andnot_si128(gt, all_ones))

let x86_ncge_u8v128: proc(a, b: u8v128): u8v128 = if sseExists(): ncge_u8v128_sse else: ncge_u8v128_fallback

func ncge_u8v128_neon(a, b: u8v128): u8v128 =
  return cast[u8v128](vcgeq_u8(cast[neon.Uint8x16](a), cast[neon.Uint8x16](b)))

let arm_ncge_u8v128: proc(a, b: u8v128): u8v128 = if neonExists(): ncge_u8v128_neon else: ncge_u8v128_fallback

func ncge_u8v128_lsx(a, b: u8v128): u8v128 =
  return cast[u8v128](lsx_vsle_bu(cast[lsx.M128i](b), cast[lsx.M128i](a)))

let la_ncge_u8v128: proc(a, b: u8v128): u8v128 = if lsxExists(): ncge_u8v128_lsx else: ncge_u8v128_fallback

template `>=`*(a, b: u8v128): u8v128 =
  when defined(amd64) or defined(i386): x86_ncge_u8v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncge_u8v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncge_u8v128(a, b)

# ==========================================
# ncge (>=) / u16v128 -> u16v128
# ==========================================

func ncge_u16v128_fallback(a, b: u16v128): u16v128 =
  var output: u16v128
  let pOut = cast[ptr array[8, uint16]](addr output)
  let pA   = cast[ptr array[8, uint16]](addr a)
  let pB   = cast[ptr array[8, uint16]](addr b)
  unroll(i, 0, 7): 
    pOut[i] = if pA[i] >= pB[i]: 0xFFFF'u16 else: 0'u16
  return output

func ncge_u16v128_sse(a, b: u16v128): u16v128 =
  let offset = mm_set1_epi16(cast[int16](0x8000'u16))
  let va = mm_xor_si128(cast[sse2.M128i](a), offset)
  let vb = mm_xor_si128(cast[sse2.M128i](b), offset)
  let gt = mm_cmpgt_epi16(vb, va)
  let all_ones = mm_set1_epi16(cast[int16](0xFFFF'u16))
  return cast[u16v128](mm_andnot_si128(gt, all_ones))

let x86_ncge_u16v128: proc(a, b: u16v128): u16v128 = if sseExists(): ncge_u16v128_sse else: ncge_u16v128_fallback

func ncge_u16v128_neon(a, b: u16v128): u16v128 =
  return cast[u16v128](vcgeq_u16(cast[neon.Uint16x8](a), cast[neon.Uint16x8](b)))

let arm_ncge_u16v128: proc(a, b: u16v128): u16v128 = if neonExists(): ncge_u16v128_neon else: ncge_u16v128_fallback

func ncge_u16v128_lsx(a, b: u16v128): u16v128 =
  return cast[u16v128](lsx_vsle_hu(cast[lsx.M128i](b), cast[lsx.M128i](a)))

let la_ncge_u16v128: proc(a, b: u16v128): u16v128 = if lsxExists(): ncge_u16v128_lsx else: ncge_u16v128_fallback

template `>=`*(a, b: u16v128): u16v128 =
  when defined(amd64) or defined(i386): x86_ncge_u16v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncge_u16v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncge_u16v128(a, b)

# ==========================================
# ncge (>=) / u32v128 -> u32v128
# ==========================================

func ncge_u32v128_fallback(a, b: u32v128): u32v128 =
  var output: u32v128
  let pOut = cast[ptr array[4, uint32]](addr output)
  let pA   = cast[ptr array[4, uint32]](addr a)
  let pB   = cast[ptr array[4, uint32]](addr b)
  unroll(i, 0, 3): 
    pOut[i] = if pA[i] >= pB[i]: 0xFFFFFFFF'u32 else: 0'u32
  return output

func ncge_u32v128_sse(a, b: u32v128): u32v128 =
  let offset = mm_set1_epi32(cast[int32](0x80000000'u32))
  let va = mm_xor_si128(cast[sse2.M128i](a), offset)
  let vb = mm_xor_si128(cast[sse2.M128i](b), offset)
  let gt = mm_cmpgt_epi32(vb, va)
  let all_ones = mm_set1_epi32(cast[int32](0xFFFFFFFF'u32))
  return cast[u32v128](mm_andnot_si128(gt, all_ones))

let x86_ncge_u32v128: proc(a, b: u32v128): u32v128 = if sseExists(): ncge_u32v128_sse else: ncge_u32v128_fallback

func ncge_u32v128_neon(a, b: u32v128): u32v128 =
  return cast[u32v128](vcgeq_u32(cast[neon.Uint32x4](a), cast[neon.Uint32x4](b)))

let arm_ncge_u32v128: proc(a, b: u32v128): u32v128 = if neonExists(): ncge_u32v128_neon else: ncge_u32v128_fallback

func ncge_u32v128_lsx(a, b: u32v128): u32v128 =
  return cast[u32v128](lsx_vsle_wu(cast[lsx.M128i](b), cast[lsx.M128i](a)))

let la_ncge_u32v128: proc(a, b: u32v128): u32v128 = if lsxExists(): ncge_u32v128_lsx else: ncge_u32v128_fallback

template `>=`*(a, b: u32v128): u32v128 =
  when defined(amd64) or defined(i386): x86_ncge_u32v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncge_u32v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncge_u32v128(a, b)

# ==========================================
# ncge (>=) / u64v128 -> u64v128
# ==========================================

func ncge_u64v128_fallback(a, b: u64v128): u64v128 =
  var output: u64v128
  let pOut = cast[ptr array[2, uint64]](addr output)
  let pA   = cast[ptr array[2, uint64]](addr a)
  let pB   = cast[ptr array[2, uint64]](addr b)
  unroll(i, 0, 1): 
    pOut[i] = if pA[i] >= pB[i]: 0xFFFFFFFFFFFFFFFF'u64 else: 0'u64
  return output

func ncge_u64v128_sse(a, b: u64v128): u64v128 =
  let offset = mm_set1_epi64(cast[M64](0x8000000000000000'u64))
  let va = mm_xor_si128(cast[sse2.M128i](a), offset)
  let vb = mm_xor_si128(cast[sse2.M128i](b), offset)
  let gt = mm_cmpgt_epi64(vb, va)
  let all_ones = mm_set1_epi32(cast[int32](0xFFFFFFFF'u32))
  return cast[u64v128](mm_andnot_si128(gt, all_ones))

let x86_ncge_u64v128: proc(a, b: u64v128): u64v128 = if sseExists(): ncge_u64v128_sse else: ncge_u64v128_fallback

func ncge_u64v128_neon(a, b: u64v128): u64v128 =
  return cast[u64v128](vcgeq_u64(cast[neon.Uint64x2](a), cast[neon.Uint64x2](b)))

let arm_ncge_u64v128: proc(a, b: u64v128): u64v128 = if neonExists(): ncge_u64v128_neon else: ncge_u64v128_fallback

func ncge_u64v128_lsx(a, b: u64v128): u64v128 =
  return cast[u64v128](lsx_vsle_du(cast[lsx.M128i](b), cast[lsx.M128i](a)))

let la_ncge_u64v128: proc(a, b: u64v128): u64v128 = if lsxExists(): ncge_u64v128_lsx else: ncge_u64v128_fallback
  
template `>=`*(a, b: u64v128): u64v128 =
  when defined(amd64) or defined(i386): x86_ncge_u64v128(a, b)
  elif defined(arm64) or defined(aarch64): arm_ncge_u64v128(a, b)
  elif defined(loongarch64) or defined(loongarch): la_ncge_u64v128(a, b)