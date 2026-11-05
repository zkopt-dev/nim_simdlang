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
import avx512bw
import lasx
import macros
import math
import utils
import bitutils

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
  vector[B: static int, T] = array[B div sizeof(T), T]

  v128[T] = vector[16, T]
  v256[T] = vector[32, T]
  v512[T] = vector[64, T]

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

  register*[S: static int; T; V] = distinct V

when defined(amd64):
  type
    f32r128* = distinct register[16, float32, sse.M128]
    f64r128* = distinct register[16, float64, sse2.M128d]
    i8r128* = distinct register[16, int8, sse2.M128i]
    i16r128* = distinct register[16, int16, sse2.M128i]
    i32r128* = distinct register[16, int32, sse2.M128i]
    i64r128* = distinct register[16, int64, sse2.M128i]
    u8r128* = distinct register[16, uint8, sse2.M128i]
    u16r128* = distinct register[16, uint16, sse2.M128i]
    u32r128* = distinct register[16, uint32, sse2.M128i]
    u64r128* = distinct register[16, uint64, sse2.M128i]

    f32r256* = distinct register[32, float32, avx.M256]
    f64r256* = distinct register[32, float64, avx.M256d]
    i8r256* = distinct register[32, int8, avx.M256i]
    i16r256* = distinct register[32, int16, avx.M256i]
    i32r256* = distinct register[32, int32, avx.M256i]
    i64r256* = distinct register[32, int64, avx.M256i]
    u8r256* = distinct register[32, uint8, avx.M256i]
    u16r256* = distinct register[32, uint16, avx.M256i]
    u32r256* = distinct register[32, uint32, avx.M256i]
    u64r256* = distinct register[32, uint64, avx.M256i]

    f32r512* = distinct register[64, float32, avx512f.M512]
    f64r512* = distinct register[64, float64, avx512f.M512d]
    i8r512* = distinct register[64, int8, avx512f.M512i]
    i16r512* = distinct register[64, int16, avx512f.M512i]
    i32r512* = distinct register[64, int32, avx512f.M512i]
    i64r512* = distinct register[64, int64, avx512f.M512i]
    u8r512* = distinct register[64, uint8, avx512f.M512i]
    u16r512* = distinct register[64, uint16, avx512f.M512i]
    u32r512* = distinct register[64, uint32, avx512f.M512i]
    u64r512* = distinct register[64, uint64, avx512f.M512i]
elif defined(aarch64):
  type
    # 128-bit (Hardware Neon)
    f32r128* = distinct register[16, float32, neon.Float32x4]
    f64r128* = distinct register[16, float64, neon.Float64x2]
    i8r128*  = distinct register[16, int8,   neon.Int8x16]
    i16r128* = distinct register[16, int16,  neon.Int16x8]
    i32r128* = distinct register[16, int32,  neon.Int32x4]
    i64r128* = distinct register[16, int64,  neon.Int64x2]
    u8r128*  = distinct register[16, uint8,  neon.Uint8x16]
    u16r128* = distinct register[16, uint16, neon.Uint16x8]
    u32r128* = distinct register[16, uint32, neon.Uint32x4]
    u64r128* = distinct register[16, uint64, neon.Uint64x2]

    # 256-bit (Virtual: array of two 128-bit)
    f32r256* = distinct register[32, float32, array[2, Float32x4]]
    f64r256* = distinct register[32, float64, array[2, Float64x2]]
    i8r256*  = distinct register[32, int8,   array[2, Int8x16]]
    i16r256* = distinct register[32, int16,  array[2, Int16x8]]
    i32r256* = distinct register[32, int32,  array[2, Int32x4]]
    i64r256* = distinct register[32, int64,  array[2, Int64x2]]
    u8r256*  = distinct register[32, uint8,  array[2, Uint8x16]]
    u16r256* = distinct register[32, uint16, array[2, Uint16x8]]
    u32r256* = distinct register[32, uint32, array[2, Uint32x4]]
    u64r256* = distinct register[32, uint64, array[2, Uint64x2]]

    # 512-bit (Virtual: array of four 128-bit)
    f32r512* = distinct register[64, float32, array[4, Float32x4]]
    f64r512* = distinct register[64, float64, array[4, Float64x2]]
    i8r512*  = distinct register[64, int8,   array[4, Int8x16]]
    i16r512* = distinct register[64, int16,  array[4, Int16x8]]
    i32r512* = distinct register[64, int32,  array[4, Int32x4]]
    i64r512* = distinct register[64, int64,  array[4, Int64x2]]
    u8r512*  = distinct register[64, uint8,  array[4, Uint8x16]]
    u16r512* = distinct register[64, uint16, array[4, Uint16x8]]
    u32r512* = distinct register[64, uint32, array[4, Uint32x4]]
    u64r512* = distinct register[64, uint64, array[4, Uint64x2]]
elif defined(loongarch):
  type
    # 128-bit (Hardware LSX)
    f32r128* = distinct register[16, float32, lsx.M128]
    f64r128* = distinct register[16, float64, lsx.M128d]
    i8r128*  = distinct register[16, int8,   lsx.M128i]
    i16r128* = distinct register[16, int16,  lsx.M128i]
    i32r128* = distinct register[16, int32,  lsx.M128i]
    i64r128* = distinct register[16, int64,  lsx.M128i]
    u8r128*  = distinct register[16, uint8,  lsx.M128i]
    u16r128* = distinct register[16, uint16, lsx.M128i]
    u32r128* = distinct register[16, uint32, lsx.M128i]
    u64r128* = distinct register[16, uint64, lsx.M128i]

    # 256-bit (Hardware LASX)
    f32r256* = distinct register[32, float32, lasx.M256]
    f64r256* = distinct register[32, float64, lasx.M256d]
    i8r256*  = distinct register[32, int8,   lasx.M256i]
    i16r256* = distinct register[32, int16,  lasx.M256i]
    i32r256* = distinct register[32, int32,  lasx.M256i]
    i64r256* = distinct register[32, int64,  lasx.M256i]
    u8r256*  = distinct register[32, uint8,  lasx.M256i]
    u16r256* = distinct register[32, uint16, lasx.M256i]
    u32r256* = distinct register[32, uint32, lasx.M256i]
    u64r256* = distinct register[32, uint64, lasx.M256i]

    # 512-bit (Virtual: array of two 256-bit)
    f32r512* = distinct register[64, float32, array[2, lasx.M256]]
    f64r512* = distinct register[64, float64, array[2, lasx.M256d]]
    i8r512*  = distinct register[64, int8,   array[2, lasx.M256i]]
    i16r512* = distinct register[64, int16,  array[2, lasx.M256i]]
    i32r512* = distinct register[64, int32,  array[2, lasx.M256i]]
    i64r512* = distinct register[64, int64,  array[2, lasx.M256i]]
    u8r512*  = distinct register[64, uint8,  array[2, lasx.M256i]]
    u16r512* = distinct register[64, uint16, array[2, lasx.M256i]]
    u32r512* = distinct register[64, uint32, array[2, lasx.M256i]]
    u64r512* = distinct register[64, uint64, array[2, lasx.M256i]]

type
  r128* = concept x
    x is f32r128 or x is f64r128 or
    x is i8r128 or x is i16r128 or x is i32r128 or x is i64r128 or
    x is u8r128 or x is u16r128 or x is u32r128 or x is u64r128
  r256* = concept x
    x is f32r256 or x is f64r256 or
    x is i8r256 or x is i16r256 or x is i32r256 or x is i64r256 or
    x is u8r256 or x is u16r256 or x is u32r256 or x is u64r256
  r512* = concept x
    x is f32r512 or x is f64r512 or
    x is i8r512 or x is i16r512 or x is i32r512 or x is i64r512 or
    x is u8r512 or x is u16r512 or x is u32r512 or x is u64r512
  Register* = concept x
    x is r128 or x is r256 or x is r512

template unitLen*[R: register](input: R): static int =
  when R is (i8r512|u8r512):
    64
  elif R is (i16r512|u16r512|i8r256|u8r256):
    32
  elif R is (i32r512|u32r512|f32r512|i16r256|u16r256|i8r128|u8r128):
    16
  elif R is (i64r512|u64r512|f64r512|i32r256|u32r256|f32r256|i16r128|u16r128):
    8
  elif R is (i64r256|u64r256|f64r256|i32r128|u32r128|f32r128):
    4
  elif R is (i64r128|u64r128|f64r128):
    2

template castV*[R: register](input: R): vector =
  when R is f32r128: cast[f32v128](input)
  elif R is f64r128: cast[f64v128](input)
  elif R is i8r128:  cast[i8v128](input)
  elif R is i16r128: cast[i16v128](input)
  elif R is i32r128: cast[i32v128](input)
  elif R is i64r128: cast[i64v128](input)
  elif R is u8r128:  cast[u8v128](input)
  elif R is u16r128: cast[u16v128](input)
  elif R is u32r128: cast[u32v128](input)
  elif R is u64r128: cast[u64v128](input)

  elif R is f32r256: cast[f32v256](input)
  elif R is f64r256: cast[f64v256](input)
  elif R is i8r256:  cast[i8v256](input)
  elif R is i16r256: cast[i16v256](input)
  elif R is i32r256: cast[i32v256](input)
  elif R is i64r256: cast[i64v256](input)
  elif R is u8r256:  cast[u8v256](input)
  elif R is u16r256: cast[u16v256](input)
  elif R is u32r256: cast[u32v256](input)
  elif R is u64r256: cast[u64v256](input)

  elif R is f32r512: cast[f32v512](input)
  elif R is f64r512: cast[f64v512](input)
  elif R is i8r512:  cast[i8v512](input)
  elif R is i16r512: cast[i16v512](input)
  elif R is i32r512: cast[i32v512](input)
  elif R is i64r512: cast[i64v512](input)
  elif R is u8r512:  cast[u8v512](input)
  elif R is u16r512: cast[u16v512](input)
  elif R is u32r512: cast[u32v512](input)
  elif R is u64r512: cast[u64v512](input)
  else:
    {.error: "Unsupported register type passed to castV".}

template castVP*[R: register](input: R): ptr vector =
  when R is f32r128: cast[ptr f32v128](addr input)
  elif R is f64r128: cast[ptr f64v128](addr input)
  elif R is i8r128:  cast[ptr i8v128](addr input)
  elif R is i16r128: cast[ptr i16v128](addr input)
  elif R is i32r128: cast[ptr i32v128](addr input)
  elif R is i64r128: cast[ptr i64v128](addr input)
  elif R is u8r128:  cast[ptr u8v128](addr input)
  elif R is u16r128: cast[ptr u16v128](addr input)
  elif R is u32r128: cast[ptr u32v128](addr input)
  elif R is u64r128: cast[ptr u64v128](addr input)

  elif R is f32r256: cast[ptr f32v256](addr input)
  elif R is f64r256: cast[ptr f64v256](addr input)
  elif R is i8r256:  cast[ptr i8v256](addr input)
  elif R is i16r256: cast[ptr i16v256](addr input)
  elif R is i32r256: cast[ptr i32v256](addr input)
  elif R is i64r256: cast[ptr i64v256](addr input)
  elif R is u8r256:  cast[ptr u8v256](addr input)
  elif R is u16r256: cast[ptr u16v256](addr input)
  elif R is u32r256: cast[ptr u32v256](addr input)
  elif R is u64r256: cast[ptr u64v256](addr input)

  elif R is f32r512: cast[ptr f32v512](addr input)
  elif R is f64r512: cast[ptr f64v512](addr input)
  elif R is i8r512:  cast[ptr i8v512](addr input)
  elif R is i16r512: cast[ptr i16v512](addr input)
  elif R is i32r512: cast[ptr i32v512](addr input)
  elif R is i64r512: cast[ptr i64v512](addr input)
  elif R is u8r512:  cast[ptr u8v512](addr input)
  elif R is u16r512: cast[ptr u16v512](addr input)
  elif R is u32r512: cast[ptr u32v512](addr input)
  elif R is u64r512: cast[ptr u64v512](addr input)
  else:
    {.error: "Unsupported register type passed to castV".}

template getRawRegister*(R: typedesc): untyped =
  when defined(amd64):
    when R is f32r128: sse.M128
    elif R is f64r128: sse2.M128d
    elif R is i8r128 or R is u8r128 or
         R is i16r128 or R is u16r128 or
         R is i32r128 or R is u32r128 or
         R is i64r128 or R is u64r128: sse2.M128i
    elif R is f32r256: avx.M256
    elif R is f64r256: avx.M256d
    elif R is i8r256 or R is u8r256 or
         R is i16r256 or R is u16r256 or
         R is i32r256 or R is u32r256 or
         R is i64r256 or R is u64r256: avx.M256i
    elif R is f32r512: avx512f.M512
    elif R is f64r512: avx512f.M512d
    elif R is i8r512 or R is u8r512 or
         R is i16r512 or R is u16r512 or
         R is i32r512 or R is u32r512 or
         R is i64r512 or R is u64r512: avx512f.M512i
    else: {.error: "Unsupported register type for x86".}
  elif defined(aarch64):
    when R is f32r128: neon.Float32x4
    elif R is f64r128: neon.Float64x2
    elif R is i8r128: neon.Int8x16
    elif R is u8r128: neon.Uint8x16
    elif R is i16r128: neon.Int16x8
    elif R is u16r128: neon.Uint16x8
    elif R is i32r128: neon.Int32x4
    elif R is u32r128: neon.Uint32x4
    elif R is i64r128: neon.Int64x2
    elif R is u64r128: neon.Uint64x2
    elif R is f32r256: array[2, neon.Float32x4]
    elif R is f64r256: array[2, neon.Float64x2]
    elif R is i8r256: array[2, neon.Int8x16]
    elif R is u8r256: array[2, neon.Uint8x16]
    elif R is i16r256: array[2, neon.Int16x8]
    elif R is u16r256: array[2, neon.Uint16x8]
    elif R is i32r256: array[2, neon.Int32x4]
    elif R is u32r256: array[2, neon.Uint32x4]
    elif R is i64r256: array[2, neon.Int64x2]
    elif R is u64r256: array[2, neon.Uint64x2]
    elif R is f32r512: array[4, neon.Float32x4]
    elif R is f64r512: array[4, neon.Float64x2]
    elif R is i8r512: array[4, neon.Int8x16]
    elif R is u8r512: array[4, neon.Uint8x16]
    elif R is i16r512: array[4, neon.Int16x8]
    elif R is u16r512: array[4, neon.Uint16x8]
    elif R is i32r512: array[4, neon.Int32x4]
    elif R is u32r512: array[4, neon.Uint32x4]
    elif R is i64r512: array[4, neon.Int64x2]
    elif R is u64r512: array[4, neon.Uint64x2]
    else: {.error: "Unsupported register type for ARM".}
  elif defined(loongarch):
    when R is f32r128: lsx.M128
    elif R is f64r128: lsx.M128d
    elif R is i8r128 or R is u8r128 or
         R is i16r128 or R is u16r128 or
         R is i32r128 or R is u32r128 or
         R is i64r128 or R is u64r128: lsx.M128i
    elif R is f32r256: lasx.M256
    elif R is f64r512: lasx.M256d
    elif R is i8r256 or R is u8r256 or
         R is i16r256 or R is u16r256 or
         R is i32r256 or R is u32r256 or
         R is i64r256 or R is u64r256: lasx.M256i
    elif R is f32r512: array[2, lasx.M256]
    elif R is f64r512: array[2, lasx.M256d]
    elif R is i8r512 or R is u8r512 or
         R is i16r512 or R is u16r512 or
         R is i32r512 or R is u32r512
         R is i64r512 or R is u64r512: array[2, lasx.M256i]
    else: {.error: "Unsupported register type for LoongArch".}

template getLaneCount*(size: static int, T: untyped): static int =
  size div sizeof(T)

template getMaskValue*(size: static int, T: untyped): static int =
  const lane: int = getLaneCount(size, T)
  (1 shl lane - 1)

type
  Mask* = concept x
    x is MMask8 or x is MMask16 or x is MMask32 or x is MMask64

template getMaskType*(size: static int, T: untyped): Mask =
  const lane: int = getLaneCount(size, T)
  when lane <= 8:
    MMask8
  elif lane <= 16:
    MMask16
  elif lane <= 32:
    MMask32
  elif lane <= 64:
    MMask64
  else:
    {.error: "Unsupported lane count".}

template getMask*(size: static int, T: untyped): Mask =
  type MaskT = getMaskType(size, T)
  MaskT(getMaskValue(size, T))

func none(): void =
  discard

func error(): void =
  discard

import tables

template maskType*(T: typedesc): typedesc =
  when T is float32: uint32
  elif T is float64: uint64
  elif T is int8 or T is uint8: uint8
  elif T is int16 or T is uint16: uint16
  elif T is int32 or T is uint32: uint32
  elif T is int64 or T is uint64: uint64
  else: T

proc maskTypeName(dtype: string): string =
  case dtype
  of "float32": "uint32"
  of "float64": "uint64"
  of "int8", "uint8": "uint8"
  of "int16", "uint16": "uint16"
  of "int32", "uint32": "uint32"
  of "int64", "uint64": "uint64"
  else: dtype

proc maskShortName(dtype: string): string =
  case dtype
  of "float32", "int32", "uint32": "u32"
  of "float64", "int64", "uint64": "u64"
  of "int8", "uint8": "u8"
  of "int16", "uint16": "u16"
  else: dtype

# =============================================================================
# Compile-time registry
# =============================================================================

type
  DTypeExprTable = Table[string, NimNode]
  DTypeNodeTable = Table[string, NimNode]
  OpTable = object
    exprs: DTypeExprTable
    nodes: DTypeNodeTable
  SimdRegistry = Table[string, OpTable]

var simdRegistry {.compileTime.} = initTable[string, Table[string, Table[string, NimNode]]]()
var simdDTypeNodes {.compileTime.} = initTable[string, Table[string, Table[string, NimNode]]]()
var simdArity {.compileTime.} = initTable[string, int]()
var simdMaskOps {.compileTime.} = initTable[string, bool]()

# =============================================================================
# Basic AST / DSL helpers
# =============================================================================

proc keyStr(n: NimNode): string =
  case n.kind
  of nnkIdent, nnkSym: $n
  of nnkAccQuoted:
    if n.len == 1: keyStr(n[0]) else: repr(n)
  of nnkStrLit..nnkTripleStrLit: $n.strVal
  else: repr(n)

proc unwrapOne(n: NimNode): NimNode =
  if n.kind in {nnkStmtList, nnkStmtListExpr} and n.len == 1: n[0]
  else: n

iterator childrenOrSelf(n: NimNode): NimNode =
  if n.kind in {nnkStmtList, nnkStmtListExpr, nnkArgList, nnkBracket}:
    for child in n: yield child
  else: yield n

proc looksLikeMapping(n: NimNode): bool =
  case n.kind
  of nnkExprColonExpr, nnkAsgn:
    true
  of nnkCommand:
    n.len == 2
  of nnkCall:
    n.len == 2
  of nnkStmtList, nnkStmtListExpr, nnkArgList, nnkBracket:
    for child in n:
      if child.kind in {nnkExprColonExpr, nnkAsgn}: return true
      if child.kind == nnkCommand and child.len == 2: return true
      if child.kind == nnkCall and child.len == 2: return true
    false
  else:
    false

iterator pairsInBlock(n: NimNode): (NimNode, NimNode) =
  for x in childrenOrSelf(n):
    case x.kind
    of nnkExprColonExpr: yield (x[0], x[1])
    of nnkAsgn: yield (x[0], x[1])
    of nnkCommand:
      if x.len >= 2: yield (x[0], x[1])
    of nnkCall:
      if x.len == 2: yield (x[0], x[1])
    else: discard

proc storeExpr(arch, op, dtype: string, dtypeNode, expr: NimNode) =
  if not simdRegistry.hasKey(arch):
    simdRegistry[arch] = initTable[string, Table[string, NimNode]]()
    simdDTypeNodes[arch] = initTable[string, Table[string, NimNode]]()
  if not simdRegistry[arch].hasKey(op):
    simdRegistry[arch][op] = initTable[string, NimNode]()
    simdDTypeNodes[arch][op] = initTable[string, NimNode]()
  simdRegistry[arch][op][dtype] = copyNimTree(expr)
  simdDTypeNodes[arch][op][dtype] = copyNimTree(dtypeNode)

proc typeGenImpl(name, op, C, T: NimNode): NimNode =
  let a = ident("a")
  let b = ident("b")
  result = newProc(
    name,
    [T, newIdentDefs(a, C), newIdentDefs(b, C)],
    newStmtList(
      newNimNode(nnkReturnStmt).add(
        newCall(op,
          newNimNode(nnkCast).add(T, a),
          newNimNode(nnkCast).add(T, b)
        )
      )
    )
  )

proc maskGenImpl(name, op, C1, C2, T1, T2: NimNode): NimNode =
  let a = ident("a")
  let b = ident("b")
  let maskParam = ident("mask")
  let realMask = ident("realMask")
  result = newProc(
    name,
    [C2, newIdentDefs(a, C1), newIdentDefs(b, C1), newIdentDefs(maskParam, ident("Mask"))],
    newStmtList(
      newConstStmt(realMask, newCall(ident("getMask"), newCall(ident("sizeof"), C2), T2)),
      newNimNode(nnkReturnStmt).add(
        newCall(op, realMask,
          newNimNode(nnkCast).add(C2, a),
          newNimNode(nnkCast).add(C2, b)
        )
      )
    )
  )

proc typeOneGenImpl(name, op, C, T: NimNode): NimNode =
  let a = ident("a")
  result = newProc(
    name,
    [T, newIdentDefs(a, C)],
    newStmtList(
      newNimNode(nnkReturnStmt).add(
        newCall(op,
          newNimNode(nnkCast).add(T, a)
        )
      )
    )
  )

proc maskOneGenImpl(name, op, C1, C2, T1, T2: NimNode): NimNode =
  let a = ident("a")
  let maskParam = ident("mask")
  let realMask = ident("realMask")
  result = newProc(
    name,
    [C2, newIdentDefs(a, C1), newIdentDefs(maskParam, ident("Mask"))],
    newStmtList(
      newConstStmt(realMask, newCall(ident("getMask"), newCall(ident("sizeof"), C2), T2)),
      newNimNode(nnkReturnStmt).add(
        newCall(op, realMask,
          newNimNode(nnkCast).add(C2, a)
        )
      )
    )
  )

proc opOneGenImpl(name, T, code: NimNode): NimNode =
  let a = ident("a")
  result = newProc(
    name,
    [T, newIdentDefs(a, T)],
    newStmtList(code)
  )

proc opTwoGenImpl(name, T, code: NimNode): NimNode =
  let a = ident("a")
  let b = ident("b")
  result = newProc(
    name,
    [T, newIdentDefs(a, T), newIdentDefs(b, T)],
    newStmtList(code)
  )

proc opTwoDiffGenImpl(name, T1, T2, T3, code: NimNode): NimNode =
  let a = ident("a")
  let b = ident("b")
  result = newProc(
    name,
    [T3, newIdentDefs(a, T1), newIdentDefs(b, T2)],
    newStmtList(code)
  )

proc opLoadGenImpl(name, S, T, code: NimNode): NimNode =
  let a = ident("a")
  result = newProc(
    name,
    [T, newIdentDefs(a, S)],
    newStmtList(code)
  )

# =============================================================================
# Input macro
# =============================================================================

macro simdInput*(arch: static string, body: untyped): untyped =
  result = newStmtList()

  for opNode, opValueRaw in pairsInBlock(body):
    let op = keyStr(opNode)

    if not simdArity.hasKey(op):
      simdArity[op] = 2

    let opValue = unwrapOne(opValueRaw)

    if looksLikeMapping(opValue):
      for typeNode, exprNode in pairsInBlock(opValue):
        let dtype = keyStr(typeNode)
        var expr = unwrapOne(exprNode)

        if expr.kind == nnkIdent and $expr == "error":
          storeExpr(arch, op, dtype, typeNode, ident("error"))
          continue

        if expr.kind == nnkCall:
          let callee = expr[0]
          if callee.kind == nnkIdent:
            let calleeName = $callee
            if calleeName == "typeGen":
              let expanded = typeGenImpl(expr[1], expr[2], expr[3], expr[4])
              result.add(expanded)
              expr = expr[1]
            elif calleeName == "maskGen":
              let expanded = maskGenImpl(expr[1], expr[2], expr[3], expr[4], expr[5], expr[6])
              result.add(expanded)
              expr = expr[1]
            elif calleeName == "opTwoGen":
              let expanded = opTwoGenImpl(expr[1], expr[2], expr[3])
              result.add(expanded)
              expr = expr[1]
            elif calleeName == "opTwoDiffGen":
              let expanded = opTwoDiffGenImpl(expr[1], expr[2], expr[3], expr[4], expr[5])
              result.add(expanded)
              expr = expr[1]
            elif calleeName == "opOneGen":
              error("opOneGen is not allowed in simdInput (binary). Use simdUnaryInput instead.", expr)

        storeExpr(arch, op, dtype, typeNode, expr)
    else:
      storeExpr(arch, op, "all", ident("all"), opValue)

macro simdUnaryInput*(arch: static string, body: untyped): untyped =
  result = newStmtList()

  for opNode, opValueRaw in pairsInBlock(body):
    let op = keyStr(opNode)
    let opValue = unwrapOne(opValueRaw)

    if not simdArity.hasKey(op):
      simdArity[op] = 1

    if looksLikeMapping(opValue):
      for typeNode, exprNode in pairsInBlock(opValue):
        let dtype = keyStr(typeNode)
        var expr = unwrapOne(exprNode)

        if expr.kind == nnkIdent and $expr == "error":
          storeExpr(arch, op, dtype, typeNode, ident("error"))
          continue

        if expr.kind == nnkCall:
          let callee = expr[0]
          if callee.kind == nnkIdent:
            let calleeName = $callee
            if calleeName == "typeOneGen":
              let expanded = typeOneGenImpl(expr[1], expr[2], expr[3], expr[4])
              result.add(expanded)
              expr = expr[1]
            elif calleeName == "maskOneGen":
              let expanded = maskOneGenImpl(expr[1], expr[2], expr[3], expr[4], expr[5], expr[6])
              result.add(expanded)
              expr = expr[1]
            elif calleeName == "opOneGen":
              let expanded = opOneGenImpl(expr[1], expr[2], expr[3])
              result.add(expanded)
              expr = expr[1]
            elif calleeName == "opTwoGen":
              error("opTwoGen is not allowed in simdUnaryInput (unary). Use simdInput instead.", expr)
            elif calleeName == "opTwoDiffGen":
              error("opTwoDiffGen is not allowed in simdUnaryInput (unary). Use simdInput instead.", expr)

        storeExpr(arch, op, dtype, typeNode, expr)
    else:
      storeExpr(arch, op, "all", ident("all"), opValue)

macro simdMaskInput*(arch: static string, body: untyped): untyped =
  result = newStmtList()

  for opNode, opValueRaw in pairsInBlock(body):
    let op = keyStr(opNode)

    if not simdArity.hasKey(op):
      simdArity[op] = 2

    simdMaskOps[op] = true

    let opValue = unwrapOne(opValueRaw)

    if looksLikeMapping(opValue):
      for typeNode, exprNode in pairsInBlock(opValue):
        let dtype = keyStr(typeNode)
        var expr = unwrapOne(exprNode)

        if expr.kind == nnkIdent and $expr == "error":
          storeExpr(arch, op, dtype, typeNode, ident("error"))
          continue

        if expr.kind == nnkCall:
          let callee = expr[0]
          if callee.kind == nnkIdent:
            let calleeName = $callee
            if calleeName == "typeGen":
              let expanded = typeGenImpl(expr[1], expr[2], expr[3], expr[4])
              result.add(expanded)
              expr = expr[1]
            elif calleeName == "maskGen":
              let expanded = maskGenImpl(expr[1], expr[2], expr[3], expr[4], expr[5], expr[6])
              result.add(expanded)
              expr = expr[1]
            elif calleeName == "opTwoGen":
              let expanded = opTwoGenImpl(expr[1], expr[2], expr[3])
              result.add(expanded)
              expr = expr[1]
            elif calleeName == "opTwoDiffGen":
              let expanded = opTwoDiffGenImpl(expr[1], expr[2], expr[3], expr[4], expr[5])
              result.add(expanded)
              expr = expr[1]
            elif calleeName == "opOneGen":
              error("opOneGen is not allowed in simdMaskInput (binary). Use simdUnaryInput instead.", expr)

        storeExpr(arch, op, dtype, typeNode, expr)
    else:
      storeExpr(arch, op, "all", ident("all"), opValue)

macro simdLoadInput*(arch: static string, body: untyped): untyped =
  result = newStmtList()
  for opNode, opValueRaw in pairsInBlock(body):
    let op = keyStr(opNode)
    if not simdArity.hasKey(op):
      simdArity[op] = 0

    let opValue = unwrapOne(opValueRaw)

    if looksLikeMapping(opValue):
      for typeNode, exprNode in pairsInBlock(opValue):
        let dtype = keyStr(typeNode)
        var expr = unwrapOne(exprNode)

        if expr.kind == nnkIdent and $expr == "error":
          storeExpr(arch, op, dtype, typeNode, ident("error"))
          continue

        if expr.kind == nnkCall:
          let callee = expr[0]
          if callee.kind == nnkIdent:
            let calleeName = $callee
            if calleeName == "opLoadGen":
              let expanded = opLoadGenImpl(expr[1], expr[2], expr[3], expr[4])
              result.add(expanded)
              expr = expr[1]
            elif calleeName in ["typeGen", "maskGen", "opTwoGen", "opTwoDiffGen",
                                "typeOneGen", "maskOneGen", "opOneGen"]:
              error(calleeName & " is not allowed in simdLoadInput. Use opLoadGen instead.", expr)

        storeExpr(arch, op, dtype, typeNode, expr)
    else:
      storeExpr(arch, op, "all", ident("all"), opValue)

# =============================================================================
# Target detection
# =============================================================================

type
  TargetArch = enum
    taX86,
    taArm,
    taLoongArch,
    taAltivec,
    taUnknown

const currentSimdTarget: TargetArch =
  when defined(simdTargetX86):
    taX86
  elif defined(simdTargetArm):
    taArm
  elif defined(simdTargetLoongArch):
    taLoongArch
  elif defined(simdTargetAltivec):
    taAltivec
  elif defined(amd64) or defined(i386):
    taX86
  elif defined(arm) or defined(arm64):
    taArm
  elif defined(loongarch64):
    taLoongArch
  elif defined(powerpc) or defined(powerpc64) or defined(powerpc64el):
    taAltivec
  else:
    taUnknown

# =============================================================================
# Code generation helpers
# =============================================================================

const basicSimdTypes = [
  "float32",
  "float64",
  "int8",
  "int16",
  "int32",
  "int64",
  "uint8",
  "uint16",
  "uint32",
  "uint64"
]

proc isNoneNode(n: NimNode): bool =
  n.kind == nnkIdent and $n == "none"

# =============================================================================
# Lookup helpers
# =============================================================================

proc getExpr(arch, op, dtype: string): NimNode =
  if simdRegistry.hasKey(arch):
    let opTbl = simdRegistry[arch]
    if opTbl.hasKey(op):
      let dTbl = opTbl[op]
      if dTbl.hasKey(dtype): return dTbl[dtype]
      if dTbl.hasKey("all"): return dTbl["all"]
  return ident("none")

proc getDTypeNode(arch, op, dtype: string): NimNode =
  if simdDTypeNodes.hasKey(arch):
    let opTbl = simdDTypeNodes[arch]
    if opTbl.hasKey(op):
      let dTbl = opTbl[op]
      if dTbl.hasKey(dtype): return dTbl[dtype]
      if dTbl.hasKey("all"): return ident(dtype)
  return ident(dtype)

proc hasStr(s: seq[string], v: string): bool =
  for x in s:
    if x == v:
      return true
  false

proc addStrUnique(s: var seq[string], v: string) =
  if not hasStr(s, v):
    s.add(v)

type
  Combo = tuple[op, dtype: string]

proc hasCombo(s: seq[Combo], op, dtype: string): bool =
  for c in s:
    if c.op == op and c.dtype == dtype:
      return true
  false

proc addComboUnique(s: var seq[Combo], op, dtype: string) =
  if not hasCombo(s, op, dtype):
    s.add((op, dtype))

# =============================================================================
# X86 emitter
# =============================================================================

proc emitBinaryX86(op, T, sse, avx, avx512, mask128, mask256, fb: NimNode): NimNode =
  let opName = repr(op)
  let typeName = repr(T)
  let short = case typeName
    of "float32": "f32"
    of "float64": "f64"
    of "int8": "i8"
    of "int16": "i16"
    of "int32": "i32"
    of "int64": "i64"
    of "uint8": "u8"
    of "uint16": "u16"
    of "uint32": "u32"
    of "uint64": "u64"
    else: typeName

  let r128 = ident(short & "r128")
  let r256 = ident(short & "r256")
  let r512 = ident(short & "r512")

  let op_r128_sse = ident(opName & "_r128_sse")
  let op_r128_avx512 = ident(opName & "_r128_avx512")
  let op_r256_sse = ident(opName & "_r256_sse")
  let op_r256_avx = ident(opName & "_r256_avx")
  let op_r256_avx512 = ident(opName & "_r256_avx512")
  let op_r512_sse = ident(opName & "_r512_sse")
  let op_r512_avx = ident(opName & "_r512_avx")
  let op_r512_avx512 = ident(opName & "_r512_avx512")

  let op_x86_128 = ident(opName & short & "_x86_128")
  let op_x86_256 = ident(opName & short & "_x86_256")
  let op_x86_512 = ident(opName & short & "_x86_512")

  let hasSSE = not (sse.kind == nnkIdent and $sse == "none")
  let hasAVX = not (avx.kind == nnkIdent and $avx == "none")
  let hasAVX512 = not (avx512.kind == nnkIdent and $avx512 == "none")
  let hasMask128 = not (mask128.kind == nnkIdent and $mask128 == "none")
  let hasMask256 = not (mask256.kind == nnkIdent and $mask256 == "none")

  result = quote do:
    type
      Raw128 = getRawRegister(`r128`)
      Raw256 = getRawRegister(`r256`)
      Raw512 = getRawRegister(`r512`)

    when `hasSSE`:
      func `op_r128_sse`(a, b: register[16, `T`, Raw128]): register[16, `T`, Raw128] =
        return cast[register[16, `T`, Raw128]](
          `sse`(cast[Raw128](a), cast[Raw128](b))
        )
#[
    func `op_r128_avx512`(a, b: register[16, `T`, Raw128]): register[16, `T`, Raw128] =
      const mask = getMask(16, `T`)
      return cast[register[16, `T`, Raw128]](
        `mask128`(mask, cast[Raw128](a), cast[Raw128](b))
      )
]#
    when `hasSSE`:
      func `op_r256_sse`(a, b: register[32, `T`, Raw256]): register[32, `T`, Raw256] =
        var outVal: register[32, `T`, Raw256]
        let pOut = cast[ptr array[2, Raw128]](addr outVal)
        let pA = cast[ptr array[2, Raw128]](addr a)
        let pB = cast[ptr array[2, Raw128]](addr b)
        pOut[0] = `sse`(pA[0], pB[0])
        pOut[1] = `sse`(pA[1], pB[1])
        return outVal

    when `hasAVX`:
      func `op_r256_avx`(a, b: register[32, `T`, Raw256]): register[32, `T`, Raw256] =
        return cast[register[32, `T`, Raw256]](
          `avx`(cast[Raw256](a), cast[Raw256](b))
        )
#[
    func `op_r256_avx512`(a, b: register[32, `T`, Raw256]): register[32, `T`, Raw256] =
      const mask = getMask(32, `T`)
      return cast[register[32, `T`, Raw256]](
        `mask256`(mask, cast[Raw256](a), cast[Raw256](b))
      )
]#
    when `hasSSE`:
      func `op_r512_sse`(a, b: register[64, `T`, Raw512]): register[64, `T`, Raw512] =
        var outVal: register[64, `T`, Raw512]
        let pOut = cast[ptr array[4, Raw128]](addr outVal)
        let pA = cast[ptr array[4, Raw128]](addr a)
        let pB = cast[ptr array[4, Raw128]](addr b)
        pOut[0] = `sse`(pA[0], pB[0])
        pOut[1] = `sse`(pA[1], pB[1])
        pOut[2] = `sse`(pA[2], pB[2])
        pOut[3] = `sse`(pA[3], pB[3])
        return outVal

    when `hasAVX`:
      func `op_r512_avx`(a, b: register[64, `T`, Raw512]): register[64, `T`, Raw512] =
        var outVal: register[64, `T`, Raw512]
        let pOut = cast[ptr array[2, Raw256]](addr outVal)
        let pA = cast[ptr array[2, Raw256]](addr a)
        let pB = cast[ptr array[2, Raw256]](addr b)
        pOut[0] = `avx`(pA[0], pB[0])
        pOut[1] = `avx`(pA[1], pB[1])
        return outVal

    when `hasAVX512`:
      func `op_r512_avx512`(a, b: register[64, `T`, Raw512]): register[64, `T`, Raw512] =
        return cast[register[64, `T`, Raw512]](
          `avx512`(cast[Raw512](a), cast[Raw512](b))
        )

    let `op_x86_128`: proc (a, b: register[16, `T`, Raw128]): register[16, `T`, Raw128] =
      #if AVX512 and `hasMask128`: `op_r128_avx512`
      when `hasSSE`:
        if SSE: `op_r128_sse`
        else: `fb`[16, `T`, Raw128]
      else:
        `fb`[16, `T`, Raw128]

    let `op_x86_256`: proc (a, b: register[32, `T`, Raw256]): register[32, `T`, Raw256] =
      when `hasAVX` and `hasSSE`:
        if AVX: `op_r256_avx`
        elif `hasSSE` and SSE: `op_r256_sse`
        else: `fb`[32, `T`, Raw256]
      elif `hasAVX`:
        if AVX: `op_r256_avx`
        else: `fb`[32, `T`, Raw256]
      elif `hasSSE`:
        if SSE: `op_r256_sse`
        else: `fb`[32, `T`, Raw256]
      else:
        `fb`[32, `T`, Raw256]

    let `op_x86_512`: proc (a, b: register[64, `T`, Raw512]): register[64, `T`, Raw512] =
      when `hasAVX512` and `hasAVX` and `hasSSE`:
        if AVX512: `op_r512_avx512`
        elif `hasAVX` and AVX: `op_r512_avx`
        elif `hasSSE` and SSE: `op_r512_sse`
        else: `fb`[64, `T`, Raw512]
      elif `hasAVX512` and `hasAVX`:
        if AVX512: `op_r512_avx512`
        elif `hasAVX` and AVX: `op_r512_avx`
        else: `fb`[64, `T`, Raw512]
      elif `hasAVX512`:
        if AVX512: `op_r512_avx512`
        else: `fb`[64, `T`, Raw512]
      elif `hasAVX` and `hasSSE`:
        if AVX: `op_r512_avx`
        elif SSE: `op_r512_sse`
        else: `fb`[64, `T`, Raw512]
      elif `hasAVX`:
        if AVX: `op_r512_avx`
        else: `fb`[64, `T`, Raw512]
      elif `hasSSE`:
        if SSE: `op_r512_sse`
        else: `fb`[64, `T`, Raw512]
      else:
        `fb`[64, `T`, Raw512]

    template `op`*(a, b: `r128`): `r128` =
      when defined(useSSE):
        cast[`r128`](`op_r128_sse`(cast[register[16, `T`, Raw128]](a), cast[register[16, `T`, Raw128]](b)))
      else:
        cast[`r128`](`op_x86_128`(cast[register[16, `T`, Raw128]](a), cast[register[16, `T`, Raw128]](b)))

    template `op`*(a, b: `r256`): `r256` =
      when defined(useAVX):
        cast[`r256`](`op_r256_avx`(cast[register[32, `T`, Raw256]](a), cast[register[32, `T`, Raw256]](b)))
      elif defined(useSSE):
        cast[`r256`](`op_r256_sse`(cast[register[32, `T`, Raw256]](a), cast[register[32, `T`, Raw256]](b)))
      else:
        cast[`r256`](`op_x86_256`(cast[register[32, `T`, Raw256]](a), cast[register[32, `T`, Raw256]](b)))

    template `op`*(a, b: `r512`): `r512` =
      when defined(useAVX512):
        cast[`r512`](`op_r512_avx512`(cast[register[64, `T`, Raw512]](a), cast[register[64, `T`, Raw512]](b)))
      elif defined(useAVX):
        cast[`r512`](`op_r512_avx`(cast[register[64, `T`, Raw512]](a), cast[register[64, `T`, Raw512]](b)))
      elif defined(useSSE):
        cast[`r512`](`op_r512_sse`(cast[register[64, `T`, Raw512]](a), cast[register[64, `T`, Raw512]](b)))
      else:
        cast[`r512`](`op_x86_512`(cast[register[64, `T`, Raw512]](a), cast[register[64, `T`, Raw512]](b)))

# =============================================================================
# ARM / NEON emitter
# =============================================================================

proc emitBinaryArm(op, dtype, neon, fb: NimNode): NimNode =
  let opName = repr(op)
  let T = dtype
  let typeName = repr(dtype)
  let short = case typeName
    of "float32": "f32"
    of "float64": "f64"
    of "int8": "i8"
    of "int16": "i16"
    of "int32": "i32"
    of "int64": "i64"
    of "uint8": "u8"
    of "uint16": "u16"
    of "uint32": "u32"
    of "uint64": "u64"
    else: typeName

  let r128 = ident(short & "r128")
  let r256 = ident(short & "r256")
  let r512 = ident(short & "r512")

  let op_r128_neon = ident(opName & "_r128_neon")
  let op_r256_neon = ident(opName & "_r256_neon")
  let op_r512_neon = ident(opName & "_r512_neon")

  let op_arm_128 = ident(opName & "_arm_128")
  let op_arm_256 = ident(opName & "_arm_256")
  let op_arm_512 = ident(opName & "_arm_512")

  let hasNEON = not (neon.kind == nnkIdent and $neon == "none")

  result = quote do:
    type
      Raw128 = getRawRegister(`r128`)
      Raw256 = getRawRegister(`r256`)
      Raw512 = getRawRegister(`r512`)

    when `hasNEON`:
      func `op_r128_neon`(a, b: register[16, `T`, Raw128]): register[16, `T`, Raw128] =
        return cast[register[16, `T`, Raw128]](
          `neon`(cast[Raw128](a), cast[Raw128](b))
        )

      func `op_r256_neon`(a, b: register[32, `T`, Raw256]): register[32, `T`, Raw256] =
        var outVal: register[32, `T`, Raw256]
        let pOut = cast[ptr array[2, Raw128]](addr outVal)
        let pA = cast[ptr array[2, Raw128]](addr a)
        let pB = cast[ptr array[2, Raw128]](addr b)
        pOut[0] = `neon`(pA[0], pB[0])
        pOut[1] = `neon`(pA[1], pB[1])
        return outVal

      func `op_r512_neon`(a, b: register[64, `T`, Raw512]): register[64, `T`, Raw512] =
        var outVal: register[64, `T`, Raw512]
        let pOut = cast[ptr array[4, Raw128]](addr outVal)
        let pA = cast[ptr array[4, Raw128]](addr a)
        let pB = cast[ptr array[4, Raw128]](addr b)
        pOut[0] = `neon`(pA[0], pB[0])
        pOut[1] = `neon`(pA[1], pB[1])
        pOut[2] = `neon`(pA[2], pB[2])
        pOut[3] = `neon`(pA[3], pB[3])
        return outVal

    let `op_arm_128`: proc (a, b: register[16, `T`, Raw128]): register[16, `T`, Raw128] =
      when hasNEON:
        if NEON: `op_r128_neon`
        else: `fb`[16, `T`, Raw128]
      else: `fb`[16, `T`, Raw128]

    let `op_arm_256`: proc (a, b: register[32, `T`, Raw256]): register[32, `T`, Raw256] =
      when `hasNEON`:
        if NEON: `op_r256_neon`
        else: `fb`[32, `T`, Raw256]
      else: `fb`[32, `T`, Raw256]

    let `op_arm_512`: proc (a, b: register[64, `T`, Raw512]): register[64, `T`, Raw512] =
      when hasNEON:
        if NEON: `op_r512_neon`
        else: `fb`[64, `T`, Raw512]
      else: `fb`[64, `T`, Raw512]

    template `opName`*(a, b: `r128`): `r128` =
      when defined(useNEON):
        cast[`r128`](`op_r128_neon`(cast[register[16, `T`, Raw128]](a), cast[register[16, `T`, Raw128]](b)))
      else:
        cast[`r128`](`op_arm_128`(cast[register[16, `T`, Raw128]](a), cast[register[16, `T`, Raw128]](b)))

    template `opName`*(a, b: `r256`): `r256` =
      when defined(useNEON):
        cast[`r256`](`op_r256_neon`(cast[register[32, `T`, Raw256]](a), cast[register[32, `T`, Raw256]](b)))
      else:
        cast[`r256`](`op_arm_256`(cast[register[32, `T`, Raw256]](a), cast[register[32, `T`, Raw256]](b)))

    template `opName`*(a, b: `r512`): `r512` =
      when defined(useNEON):
        cast[`r512`](`op_r512_neon`(cast[register[64, `T`, Raw512]](a), cast[register[64, `T`, Raw512]](b)))
      else:
        cast[`r512`](`op_arm_512`(cast[register[64, `T`, Raw512]](a), cast[register[64, `T`, Raw512]](b)))

# =============================================================================
# ARM / NEON Variable Shift Emitter
# =============================================================================

proc emitBinaryArmShift(op, dtype, neonInst, fb: NimNode): NimNode =
  let opName = repr(op)
  let T = dtype
  let typeName = repr(dtype)
  let short = case typeName
    of "int8": "i8"
    of "int16": "i16"
    of "int32": "i32"
    of "int64": "i64"
    of "uint8": "u8"
    of "uint16": "u16"
    of "uint32": "u32"
    of "uint64": "u64"
    else: typeName

  let shiftTypeName = case typeName
    of "uint8": "int8"
    of "uint16": "int16"
    of "uint32": "int32"
    of "uint64": "int64"
    else: typeName

  let r128 = ident(short & "r128")
  let r256 = ident(short & "r256")
  let r512 = ident(short & "r512")

  let shiftShort = case shiftTypeName
    of "int8": "i8"
    of "int16": "i16"
    of "int32": "i32"
    of "int64": "i64"
    else: short

  let shiftR128 = ident(shiftShort & "r128")
  let shiftR256 = ident(shiftShort & "r256")
  let shiftR512 = ident(shiftShort & "r512")

  let op_r128_neon = ident(opName & "_r128_neon")
  let op_r256_neon = ident(opName & "_r256_neon")
  let op_r512_neon = ident(opName & "_r512_neon")

  let op_arm_128 = ident(opName & "_arm_128")
  let op_arm_256 = ident(opName & "_arm_256")
  let op_arm_512 = ident(opName & "_arm_512")

  let hasNEON = not (neonInst.kind == nnkIdent and $neonInst == "none")

  result = quote do:
    type
      RawData128 = getRawRegister(`r128`)
      RawShift128 = getRawRegister(`shiftR128`)
      RawData256 = getRawRegister(`r256`)
      RawShift256 = getRawRegister(`shiftR256`)
      RawData512 = getRawRegister(`r512`)
      RawShift512 = getRawRegister(`shiftR512`)

    when `hasNEON`:
      func `op_r128_neon`(a: register[16, `T`, RawData128],
                          b: register[16, `T`, RawShift128]): register[16, `T`, RawData128] =
        return cast[register[16, `T`, RawData128]](
          `neonInst`(cast[RawData128](a), cast[RawShift128](b))
        )

      func `op_r256_neon`(a: register[32, `T`, RawData256],
                          b: register[32, `T`, RawShift256]): register[32, `T`, RawData256] =
        var outVal: register[32, `T`, RawData256]
        let pOut = cast[ptr array[2, RawData128]](addr outVal)
        let pA = cast[ptr array[2, RawData128]](addr a)
        let pB = cast[ptr array[2, RawShift128]](addr b)
        pOut[0] = `neonInst`(pA[0], pB[0])
        pOut[1] = `neonInst`(pA[1], pB[1])
        return outVal

      func `op_r512_neon`(a: register[64, `T`, RawData512],
                          b: register[64, `T`, RawShift512]): register[64, `T`, RawData512] =
        var outVal: register[64, `T`, RawData512]
        let pOut = cast[ptr array[4, RawData128]](addr outVal)
        let pA = cast[ptr array[4, RawData128]](addr a)
        let pB = cast[ptr array[4, RawShift128]](addr b)
        pOut[0] = `neonInst`(pA[0], pB[0])
        pOut[1] = `neonInst`(pA[1], pB[1])
        pOut[2] = `neonInst`(pA[2], pB[2])
        pOut[3] = `neonInst`(pA[3], pB[3])
        return outVal

    let `op_arm_128`: proc (a: register[16, `T`, RawData128],
                            b: register[16, `T`, RawShift128]): register[16, `T`, RawData128] =
      when `hasNEON`:
        if NEON: `op_r128_neon`
        else: `fb`[16, `T`, RawData128]
      else: `fb`[16, `T`, RawData128]

    let `op_arm_256`: proc (a: register[32, `T`, RawData256],
                            b: register[32, `T`, RawShift256]): register[32, `T`, RawData256] =
      when `hasNEON`:
        if NEON: `op_r256_neon`
        else: `fb`[32, `T`, RawData256]
      else: `fb`[32, `T`, RawData256]

    let `op_arm_512`: proc (a: register[64, `T`, RawData512],
                            b: register[64, `T`, RawShift512]): register[64, `T`, RawData512] =
      when `hasNEON`:
        if NEON: `op_r512_neon`
        else: `fb`[64, `T`, RawData512]
      else: `fb`[64, `T`, RawData512]

    template `opName`*(a: `r128`, b: `shiftR128`): `r128` =
      when defined(useNEON):
        cast[`r128`](`op_r128_neon`(
          cast[register[16, `T`, RawData128]](a),
          cast[register[16, `T`, RawShift128]](b)))
      else:
        cast[`r128`](`op_arm_128`(
          cast[register[16, `T`, RawData128]](a),
          cast[register[16, `T`, RawShift128]](b)))

    template `opName`*(a: `r256`, b: `shiftR256`): `r256` =
      when defined(useNEON):
        cast[`r256`](`op_r256_neon`(
          cast[register[32, `T`, RawData256]](a),
          cast[register[32, `T`, RawShift256]](b)))
      else:
        cast[`r256`](`op_arm_256`(
          cast[register[32, `T`, RawData256]](a),
          cast[register[32, `T`, RawShift256]](b)))

    template `opName`*(a: `r512`, b: `shiftR512`): `r512` =
      when defined(useNEON):
        cast[`r512`](`op_r512_neon`(
          cast[register[64, `T`, RawData512]](a),
          cast[register[64, `T`, RawShift512]](b)))
      else:
        cast[`r512`](`op_arm_512`(
          cast[register[64, `T`, RawData512]](a),
          cast[register[64, `T`, RawShift512]](b)))

# =============================================================================
# LoongArch emitter
# =============================================================================

proc emitBinaryLoongArch(op, dtype, lsx, lasx, fb: NimNode): NimNode =
  let opName = ident(op.strVal)
  let T = ident(dtype.strVal)
  let short = case dtype.strVal
    of "float32": "f32"
    of "float64": "f64"
    of "int8": "i8"
    of "int16": "i16"
    of "int32": "i32"
    of "int64": "i64"
    of "uint8": "u8"
    of "uint16": "u16"
    of "uint32": "u32"
    of "uint64": "u64"
    else: dtype.strVal

  let r128 = ident(short & "r128")
  let r256 = ident(short & "r256")
  let r512 = ident(short & "r512")

  let op_r128_lsx = ident(op.strVal & "_r128_lsx")
  let op_r256_lsx = ident(op.strVal & "_r256_lsx")
  let op_r256_lasx = ident(op.strVal & "_r256_lasx")
  let op_r512_lsx = ident(op.strVal & "_r512_lsx")
  let op_r512_lasx = ident(op.strVal & "_r512_lasx")

  let op_la_128 = ident(op.strVal & "_la_128")
  let op_la_256 = ident(op.strVal & "_la_256")
  let op_la_512 = ident(op.strVal & "_la_512")

  let hasLSX = not (lsx.kind == nnkIdent and $lsx == "none")
  let hasLASX = not (lasx.kind == nnkIdent and $lasx == "none")

  result = quote do:
    type
      Raw128 = getRawRegister(`r128`)
      Raw256 = getRawRegister(`r256`)
      Raw512 = getRawRegister(`r512`)

    when `hasLSX`:
      func `op_r128_lsx`(a, b: register[16, `T`, Raw128]): register[16, `T`, Raw128] =
        return cast[register[16, `T`, Raw128]](
          `lsx`(cast[Raw128](a), cast[Raw128](b))
        )

      func `op_r256_lsx`(a, b: register[32, `T`, Raw256]): register[32, `T`, Raw256] =
        var outVal: register[32, `T`, Raw256]
        let pOut = cast[ptr array[2, Raw128]](addr outVal)
        let pA = cast[ptr array[2, Raw128]](addr a)
        let pB = cast[ptr array[2, Raw128]](addr b)
        pOut[0] = `lsx`(pA[0], pB[0])
        pOut[1] = `lsx`(pA[1], pB[1])
        return outVal

      func `op_r512_lsx`(a, b: register[64, `T`, Raw512]): register[64, `T`, Raw512] =
        var outVal: register[64, `T`, Raw512]
        let pOut = cast[ptr array[4, Raw128]](addr outVal)
        let pA = cast[ptr array[4, Raw128]](addr a)
        let pB = cast[ptr array[4, Raw128]](addr b)
        pOut[0] = `lsx`(pA[0], pB[0])
        pOut[1] = `lsx`(pA[1], pB[1])
        pOut[2] = `lsx`(pA[2], pB[2])
        pOut[3] = `lsx`(pA[3], pB[3])
        return outVal

     when `hasLASX`:
      func `op_r256_lasx`(a, b: register[32, `T`, Raw256]): register[32, `T`, Raw256] =
        return cast[register[32, `T`, Raw256]](
          `lasx`(cast[Raw256](a), cast[Raw256](b))
        )

      func `op_r512_lasx`(a, b: register[64, `T`, Raw512]): register[64, `T`, Raw512] =
        var outVal: register[64, `T`, Raw512]
        let pOut = cast[ptr array[2, Raw256]](addr outVal)
        let pA = cast[ptr array[2, Raw256]](addr a)
        let pB = cast[ptr array[2, Raw256]](addr b)
        pOut[0] = `lasx`(pA[0], pB[0])
        pOut[1] = `lasx`(pA[1], pB[1])
        return outVal

    let `op_la_128`: proc (a, b: register[16, `T`, Raw128]): register[16, `T`, Raw128] =
      when `hasLSX`:
        if LSX: `op_r128_lsx`
        else: `fb`[16, `T`, Raw128]
      else: `fb`[16, `T`, Raw128]

    let `op_la_256`: proc (a, b: register[32, `T`, Raw256]): register[32, `T`, Raw256] =
      when `hasLASX` and `hasLSX`:
        if LASX: `op_r256_lasx`
        elif LSX: `op_r256_lsx`
        else: `fb`[32, `T`, Raw256]
      elif `hasLASX`:
        if LASX: `op_r256_lasx`
        else: `fb`[32, `T`, Raw256]
      elif `hasLSX`:
        if LSX: `op_r256_lsx`
        else: `fb`[32, `T`, Raw256]
      else: `fb`[32, `T`, Raw256]

    let `op_la_512`: proc (a, b: register[64, `T`, Raw512]): register[64, `T`, Raw512] =
      when `hasLASX` and `hasLSX`:
        if LASX: `op_r512_lasx`
        elif LSX: `op_r512_lsx`
        else: `fb`[64, `T`, Raw256]
      elif `hasLASX`:
        if LASX: `op_r512_lasx`
        else: `fb`[64, `T`, Raw256]
      elif `hasLSX`:
        if LSX: `op_r512_lsx`
        else: `fb`[64, `T`, Raw256]
      else: `fb`[64, `T`, Raw256]

    template `opName`*(a, b: `r128`): `r128` =
      when defined(useLSX):
        cast[`r128`](`op_r128_lsx`(cast[register[16, `T`, Raw128]](a), cast[register[16, `T`, Raw128]](b)))
      else:
        cast[`r128`](`op_la_128`(cast[register[16, `T`, Raw128]](a), cast[register[16, `T`, Raw128]](b)))

    template `opName`*(a, b: `r256`): `r256` =
      when defined(useLASX):
        cast[`r256`](`op_r256_lasx`(cast[register[32, `T`, Raw256]](a), cast[register[32, `T`, Raw256]](b)))
      elif defined(useLSX):
        cast[`r256`](`op_r256_lsx`(cast[register[32, `T`, Raw256]](a), cast[register[32, `T`, Raw256]](b)))
      else:
        cast[`r256`](`op_la_256`(cast[register[32, `T`, Raw256]](a), cast[register[32, `T`, Raw256]](b)))

    template `opName`*(a, b: `r512`): `r512` =
      when defined(useLASX):
        cast[`r512`](`op_r512_lasx`(cast[register[64, `T`, Raw512]](a), cast[register[64, `T`, Raw512]](b)))
      elif defined(useLSX):
        cast[`r512`](`op_r512_lsx`(cast[register[64, `T`, Raw512]](a), cast[register[64, `T`, Raw512]](b)))
      else:
        cast[`r512`](`op_la_512`(cast[register[64, `T`, Raw512]](a), cast[register[64, `T`, Raw512]](b)))

# =============================================================================
# Altivec emitter
# =============================================================================

proc emitBinaryPPC(op, dtype, altivec, fb: NimNode): NimNode =
  let opName = ident(op.strVal)
  let T = ident(dtype.strVal)
  let short = case dtype.strVal
    of "float32": "f32"
    of "float64": "f64"
    of "int8": "i8"
    of "int16": "i16"
    of "int32": "i32"
    of "int64": "i64"
    of "uint8": "u8"
    of "uint16": "u16"
    of "uint32": "u32"
    of "uint64": "u64"
    else: dtype.strVal

  let r128 = ident(short & "r128")
  let r256 = ident(short & "r256")
  let r512 = ident(short & "r512")

  let op_r128_altivec = ident(op.strVal & "_r128_altivec")
  let op_r256_altivec = ident(op.strVal & "_r256_altivec")
  let op_r512_altivec = ident(op.strVal & "_r512_altivec")

  let op_ppc_128 = ident(op.strVal & "_altivec_128")
  let op_ppc_256 = ident(op.strVal & "_altivec_256")
  let op_ppc_512 = ident(op.strVal & "_altivec_512")

  let hasAltivec = not (altivec.kind == nnkIdent and $altivec == "none")

  result = quote do:
    type
      Raw128 = getRawRegister(`r128`)
      Raw256 = getRawRegister(`r256`)
      Raw512 = getRawRegister(`r512`)

    when `hasAltivec`:
      func `op_r128_altivec`(a, b: register[16, `T`, Raw128]): register[16, `T`, Raw128] =
        return cast[register[16, `T`, Raw128]](
          `altivec`(cast[Raw128](a), cast[Raw128](b))
        )

      func `op_r256_altivec`(a, b: register[32, `T`, Raw256]): register[32, `T`, Raw256] =
        var outVal: register[32, `T`, Raw256]
        let pOut = cast[ptr array[2, Raw128]](addr outVal)
        let pA = cast[ptr array[2, Raw128]](addr a)
        let pB = cast[ptr array[2, Raw128]](addr b)
        pOut[0] = `altivec`(pA[0], pB[0])
        pOut[1] = `altivec`(pA[1], pB[1])
        return outVal

      func `op_r512_altivec`(a, b: register[64, `T`, Raw512]): register[64, `T`, Raw512] =
        var outVal: register[64, `T`, Raw512]
        let pOut = cast[ptr array[4, Raw128]](addr outVal)
        let pA = cast[ptr array[4, Raw128]](addr a)
        let pB = cast[ptr array[4, Raw128]](addr b)
        pOut[0] = `altivec`(pA[0], pB[0])
        pOut[1] = `altivec`(pA[1], pB[1])
        pOut[2] = `altivec`(pA[2], pB[2])
        pOut[3] = `altivec`(pA[3], pB[3])
        return outVal

    let `op_ppc_128`: proc (a, b: register[16, `T`, Raw128]): register[16, `T`, Raw128] =
      when `hasAltivec`:
        if ALTIVEC: `op_r128_altivec`
        else: `fb`[16, `T`, Raw128]
      else: `fb`[16, `T`, Raw128]

    let `op_ppc_256`: proc (a, b: register[32, `T`, Raw256]): register[32, `T`, Raw256] =
      when `hasAltivec`:
        if ALTIVEC: `op_r256_altivec`
        else: `fb`[32, `T`, Raw256]
      else: `fb`[32, `T`, Raw256]

    let `op_ppc_512`: proc (a, b: register[64, `T`, Raw512]): register[64, `T`, Raw512] =
      when `hasAltivec`:
        if ALTIVEC: `op_r512_altivec`
        else: `fb`[64, `T`, Raw512]
      else: `fb`[64, `T`, Raw512]

    template `opName`*(a, b: `r128`): `r128` =
      when defined(useAltivec):
        cast[`r128`](`op_r128_altivec`(cast[register[16, `T`, Raw128]](a), cast[register[16, `T`, Raw128]](b)))
      else:
        cast[`r128`](`op_ppc_128`(cast[register[16, `T`, Raw128]](a), cast[register[16, `T`, Raw128]](b)))

    template `opName`*(a, b: `r256`): `r256` =
      when defined(useAltivec):
        cast[`r256`](`op_r256_altivec`(cast[register[32, `T`, Raw256]](a), cast[register[32, `T`, Raw256]](b)))
      else:
        cast[`r256`](`op_ppc_256`(cast[register[32, `T`, Raw256]](a), cast[register[32, `T`, Raw256]](b)))

    template `opName`*(a, b: `r512`): `r512` =
      when defined(useAltivec):
        cast[`r512`](`op_r512_altivec`(cast[register[64, `T`, Raw512]](a), cast[register[64, `T`, Raw512]](b)))
      else:
        cast[`r512`](`op_ppc_512`(cast[register[64, `T`, Raw512]](a), cast[register[64, `T`, Raw512]](b)))

# =============================================================================
# Unary X86 emitter
# =============================================================================

proc emitUnaryX86(op, T, sse, avx, avx512, fb: NimNode): NimNode =
  let opName = repr(op)
  let typeName = repr(T)
  let short = case typeName
    of "float32": "f32"
    of "float64": "f64"
    of "int8": "i8"
    of "int16": "i16"
    of "int32": "i32"
    of "int64": "i64"
    of "uint8": "u8"
    of "uint16": "u16"
    of "uint32": "u32"
    of "uint64": "u64"
    else: typeName

  let r128 = ident(short & "r128")
  let r256 = ident(short & "r256")
  let r512 = ident(short & "r512")

  let op_r128_sse = ident(opName & "_r128_sse")
  let op_r256_sse = ident(opName & "_r256_sse")
  let op_r256_avx = ident(opName & "_r256_avx")
  let op_r512_sse = ident(opName & "_r512_sse")
  let op_r512_avx = ident(opName & "_r512_avx")
  let op_r512_avx512 = ident(opName & "_r512_avx512")

  let op_x86_128 = ident(opName & short & "_x86_128")
  let op_x86_256 = ident(opName & short & "_x86_256")
  let op_x86_512 = ident(opName & short & "_x86_512")

  let hasSSE = not (sse.kind == nnkIdent and $sse == "none")
  let hasAVX = not (avx.kind == nnkIdent and $avx == "none")
  let hasAVX512 = not (avx512.kind == nnkIdent and $avx512 == "none")

  result = quote do:
    type
      Raw128 = getRawRegister(`r128`)
      Raw256 = getRawRegister(`r256`)
      Raw512 = getRawRegister(`r512`)

    when `hasSSE`:
      func `op_r128_sse`(a: register[16, `T`, Raw128]): register[16, `T`, Raw128] =
        return cast[register[16, `T`, Raw128]](
          `sse`(cast[Raw128](a))
        )

      func `op_r256_sse`(a: register[32, `T`, Raw256]): register[32, `T`, Raw256] =
        var outVal: register[32, `T`, Raw256]
        let pOut = cast[ptr array[2, Raw128]](addr outVal)
        let pA = cast[ptr array[2, Raw128]](addr a)
        pOut[0] = `sse`(pA[0])
        pOut[1] = `sse`(pA[1])
        return outVal

      func `op_r512_sse`(a: register[64, `T`, Raw512]): register[64, `T`, Raw512] =
        var outVal: register[64, `T`, Raw512]
        let pOut = cast[ptr array[4, Raw128]](addr outVal)
        let pA = cast[ptr array[4, Raw128]](addr a)
        pOut[0] = `sse`(pA[0])
        pOut[1] = `sse`(pA[1])
        pOut[2] = `sse`(pA[2])
        pOut[3] = `sse`(pA[3])
        return outVal

    when `hasAVX`:
      func `op_r256_avx`(a: register[32, `T`, Raw256]): register[32, `T`, Raw256] =
        return cast[register[32, `T`, Raw256]](
          `avx`(cast[Raw256](a))
        )

      func `op_r512_avx`(a: register[64, `T`, Raw512]): register[64, `T`, Raw512] =
        var outVal: register[64, `T`, Raw512]
        let pOut = cast[ptr array[2, Raw256]](addr outVal)
        let pA = cast[ptr array[2, Raw256]](addr a)
        pOut[0] = `avx`(pA[0])
        pOut[1] = `avx`(pA[1])
        return outVal

    when `hasAVX512`:
      func `op_r512_avx512`(a: register[64, `T`, Raw512]): register[64, `T`, Raw512] =
        return cast[register[64, `T`, Raw512]](
          `avx512`(cast[Raw512](a))
        )

    let `op_x86_128`: proc (a: register[16, `T`, Raw128]): register[16, `T`, Raw128] =
      when `hasSSE`:
        if SSE: `op_r128_sse`
        else: `fb`[16, `T`, Raw128]
      else:
        `fb`[16, `T`, Raw128]

    let `op_x86_256`: proc (a: register[32, `T`, Raw256]): register[32, `T`, Raw256] =
      when `hasAVX` and `hasSSE`:
        if AVX: `op_r256_avx`
        elif SSE: `op_r256_sse`
        else: `fb`[32, `T`, Raw256]
      elif `hasAVX`:
        if AVX: `op_r256_avx`
        else: `fb`[32, `T`, Raw256]
      elif `hasSSE`:
        if SSE: `op_r256_sse`
        else: `fb`[32, `T`, Raw256]
      else:
        `fb`[32, `T`, Raw256]

    let `op_x86_512`: proc (a: register[64, `T`, Raw512]): register[64, `T`, Raw512] =
      when `hasAVX512` and `hasAVX` and `hasSSE`:
        if AVX512: `op_r512_avx512`
        elif AVX: `op_r512_avx`
        elif SSE: `op_r512_sse`
        else: `fb`[64, `T`, Raw512]
      elif `hasAVX512` and `hasAVX`:
        if AVX512: `op_r512_avx512`
        elif AVX: `op_r512_avx`
        else: `fb`[64, `T`, Raw512]
      elif `hasAVX512`:
        if AVX512: `op_r512_avx512`
        else: `fb`[64, `T`, Raw512]
      elif `hasAVX` and `hasSSE`:
        if AVX: `op_r512_avx`
        elif SSE: `op_r512_sse`
        else: `fb`[64, `T`, Raw512]
      elif `hasAVX`:
        if AVX: `op_r512_avx`
        else: `fb`[64, `T`, Raw512]
      elif `hasSSE`:
        if SSE: `op_r512_sse`
        else: `fb`[64, `T`, Raw512]
      else:
        `fb`[64, `T`, Raw512]

    template `op`*(a: `r128`): `r128` =
      when defined(useSSE) and `hasSSE`:
        cast[`r128`](`op_r128_sse`(cast[register[16, `T`, Raw128]](a)))
      else:
        cast[`r128`](`op_x86_128`(cast[register[16, `T`, Raw128]](a)))

    template `op`*(a: `r256`): `r256` =
      when defined(useAVX) and `hasAVX`:
        cast[`r256`](`op_r256_avx`(cast[register[32, `T`, Raw256]](a)))
      elif defined(useSSE) and `hasSSE`:
        cast[`r256`](`op_r256_sse`(cast[register[32, `T`, Raw256]](a)))
      else:
        cast[`r256`](`op_x86_256`(cast[register[32, `T`, Raw256]](a)))

    template `op`*(a: `r512`): `r512` =
      when defined(useAVX512) and `hasAVX512`:
        cast[`r512`](`op_r512_avx512`(cast[register[64, `T`, Raw512]](a)))
      elif defined(useAVX) and `hasAVX`:
        cast[`r512`](`op_r512_avx`(cast[register[64, `T`, Raw512]](a)))
      elif defined(useSSE) and `hasSSE`:
        cast[`r512`](`op_r512_sse`(cast[register[64, `T`, Raw512]](a)))
      else:
        cast[`r512`](`op_x86_512`(cast[register[64, `T`, Raw512]](a)))

# =============================================================================
# Unary ARM / NEON emitter
# =============================================================================

proc emitUnaryArm(op, dtype, neon, fb: NimNode): NimNode =
  let opName = repr(op)
  let T = dtype
  let typeName = repr(dtype)
  let short = case typeName
    of "float32": "f32"
    of "float64": "f64"
    of "int8": "i8"
    of "int16": "i16"
    of "int32": "i32"
    of "int64": "i64"
    of "uint8": "u8"
    of "uint16": "u16"
    of "uint32": "u32"
    of "uint64": "u64"
    else: typeName

  let r128 = ident(short & "r128")
  let r256 = ident(short & "r256")
  let r512 = ident(short & "r512")

  let op_r128_neon = ident(opName & "_r128_neon")
  let op_r256_neon = ident(opName & "_r256_neon")
  let op_r512_neon = ident(opName & "_r512_neon")

  let op_arm_128 = ident(opName & "_arm_128")
  let op_arm_256 = ident(opName & "_arm_256")
  let op_arm_512 = ident(opName & "_arm_512")

  let hasNEON = not (neon.kind == nnkIdent and $neon == "none")

  result = quote do:
    type
      Raw128 = getRawRegister(`r128`)
      Raw256 = getRawRegister(`r256`)
      Raw512 = getRawRegister(`r512`)

    when `hasNEON`:
      func `op_r128_neon`(a: register[16, `T`, Raw128]): register[16, `T`, Raw128] =
        return cast[register[16, `T`, Raw128]](
          `neon`(cast[Raw128](a))
        )

      func `op_r256_neon`(a: register[32, `T`, Raw256]): register[32, `T`, Raw256] =
        var outVal: register[32, `T`, Raw256]
        let pOut = cast[ptr array[2, Raw128]](addr outVal)
        let pA = cast[ptr array[2, Raw128]](addr a)
        pOut[0] = `neon`(pA[0])
        pOut[1] = `neon`(pA[1])
        return outVal

      func `op_r512_neon`(a: register[64, `T`, Raw512]): register[64, `T`, Raw512] =
        var outVal: register[64, `T`, Raw512]
        let pOut = cast[ptr array[4, Raw128]](addr outVal)
        let pA = cast[ptr array[4, Raw128]](addr a)
        pOut[0] = `neon`(pA[0])
        pOut[1] = `neon`(pA[1])
        pOut[2] = `neon`(pA[2])
        pOut[3] = `neon`(pA[3])
        return outVal

    let `op_arm_128`: proc (a: register[16, `T`, Raw128]): register[16, `T`, Raw128] =
      when `hasNEON`:
        if NEON: `op_r128_neon`
        else: `fb`[16, `T`, Raw128]
      else:
        `fb`[16, `T`, Raw128]

    let `op_arm_256`: proc (a: register[32, `T`, Raw256]): register[32, `T`, Raw256] =
      when `hasNEON`:
        if NEON: `op_r256_neon`
        else: `fb`[32, `T`, Raw256]
      else:
        `fb`[32, `T`, Raw256]

    let `op_arm_512`: proc (a: register[64, `T`, Raw512]): register[64, `T`, Raw512] =
      when `hasNEON`:
        if NEON: `op_r512_neon`
        else: `fb`[64, `T`, Raw512]
      else:
        `fb`[64, `T`, Raw512]

    template `opName`*(a: `r128`): `r128` =
      when defined(useNEON) and `hasNEON`:
        cast[`r128`](`op_r128_neon`(cast[register[16, `T`, Raw128]](a)))
      else:
        cast[`r128`](`op_arm_128`(cast[register[16, `T`, Raw128]](a)))

    template `opName`*(a: `r256`): `r256` =
      when defined(useNEON) and `hasNEON`:
        cast[`r256`](`op_r256_neon`(cast[register[32, `T`, Raw256]](a)))
      else:
        cast[`r256`](`op_arm_256`(cast[register[32, `T`, Raw256]](a)))

    template `opName`*(a: `r512`): `r512` =
      when defined(useNEON) and `hasNEON`:
        cast[`r512`](`op_r512_neon`(cast[register[64, `T`, Raw512]](a)))
      else:
        cast[`r512`](`op_arm_512`(cast[register[64, `T`, Raw512]](a)))

# =============================================================================
# Unary LoongArch emitter
# =============================================================================

proc emitUnaryLoongArch(op, dtype, lsx, lasx, fb: NimNode): NimNode =
  let opName = ident(op.strVal)
  let T = ident(dtype.strVal)
  let short = case dtype.strVal
    of "float32": "f32"
    of "float64": "f64"
    of "int8": "i8"
    of "int16": "i16"
    of "int32": "i32"
    of "int64": "i64"
    of "uint8": "u8"
    of "uint16": "u16"
    of "uint32": "u32"
    of "uint64": "u64"
    else: dtype.strVal

  let r128 = ident(short & "r128")
  let r256 = ident(short & "r256")
  let r512 = ident(short & "r512")

  let op_r128_lsx = ident(op.strVal & "_r128_lsx")
  let op_r256_lsx = ident(op.strVal & "_r256_lsx")
  let op_r256_lasx = ident(op.strVal & "_r256_lasx")
  let op_r512_lsx = ident(op.strVal & "_r512_lsx")
  let op_r512_lasx = ident(op.strVal & "_r512_lasx")

  let op_la_128 = ident(op.strVal & "_la_128")
  let op_la_256 = ident(op.strVal & "_la_256")
  let op_la_512 = ident(op.strVal & "_la_512")

  let hasLSX = not (lsx.kind == nnkIdent and $lsx == "none")
  let hasLASX = not (lasx.kind == nnkIdent and $lasx == "none")

  result = quote do:
    type
      Raw128 = getRawRegister(`r128`)
      Raw256 = getRawRegister(`r256`)
      Raw512 = getRawRegister(`r512`)

    when `hasLSX`:
      func `op_r128_lsx`(a: register[16, `T`, Raw128]): register[16, `T`, Raw128] =
        return cast[register[16, `T`, Raw128]](
          `lsx`(cast[Raw128](a))
        )

      func `op_r256_lsx`(a: register[32, `T`, Raw256]): register[32, `T`, Raw256] =
        var outVal: register[32, `T`, Raw256]
        let pOut = cast[ptr array[2, Raw128]](addr outVal)
        let pA = cast[ptr array[2, Raw128]](addr a)
        pOut[0] = `lsx`(pA[0])
        pOut[1] = `lsx`(pA[1])
        return outVal

      func `op_r512_lsx`(a: register[64, `T`, Raw512]): register[64, `T`, Raw512] =
        var outVal: register[64, `T`, Raw512]
        let pOut = cast[ptr array[4, Raw128]](addr outVal)
        let pA = cast[ptr array[4, Raw128]](addr a)
        pOut[0] = `lsx`(pA[0])
        pOut[1] = `lsx`(pA[1])
        pOut[2] = `lsx`(pA[2])
        pOut[3] = `lsx`(pA[3])
        return outVal

    when `hasLASX`:
      func `op_r256_lasx`(a: register[32, `T`, Raw256]): register[32, `T`, Raw256] =
        return cast[register[32, `T`, Raw256]](
          `lasx`(cast[Raw256](a))
        )

      func `op_r512_lasx`(a: register[64, `T`, Raw512]): register[64, `T`, Raw512] =
        var outVal: register[64, `T`, Raw512]
        let pOut = cast[ptr array[2, Raw256]](addr outVal)
        let pA = cast[ptr array[2, Raw256]](addr a)
        pOut[0] = `lasx`(pA[0])
        pOut[1] = `lasx`(pA[1])
        return outVal

    let `op_la_128`: proc (a: register[16, `T`, Raw128]): register[16, `T`, Raw128] =
      when `hasLSX`:
        if LSX: `op_r128_lsx`
        else: `fb`[16, `T`, Raw128]
      else:
        `fb`[16, `T`, Raw128]

    let `op_la_256`: proc (a: register[32, `T`, Raw256]): register[32, `T`, Raw256] =
      when `hasLASX` and `hasLSX`:
        if LASX: `op_r256_lasx`
        elif LSX: `op_r256_lsx`
        else: `fb`[32, `T`, Raw256]
      elif `hasLASX`:
        if LASX: `op_r256_lasx`
        else: `fb`[32, `T`, Raw256]
      elif `hasLSX`:
        if LSX: `op_r256_lsx`
        else: `fb`[32, `T`, Raw256]
      else:
        `fb`[32, `T`, Raw256]

    let `op_la_512`: proc (a: register[64, `T`, Raw512]): register[64, `T`, Raw512] =
      when `hasLASX` and `hasLSX`:
        if LASX: `op_r512_lasx`
        elif LSX: `op_r512_lsx`
        else: `fb`[64, `T`, Raw512]
      elif `hasLASX`:
        if LASX: `op_r512_lasx`
        else: `fb`[64, `T`, Raw512]
      elif `hasLSX`:
        if LSX: `op_r512_lsx`
        else: `fb`[64, `T`, Raw512]
      else:
        `fb`[64, `T`, Raw512]

    template `opName`*(a: `r128`): `r128` =
      when defined(useLSX) and `hasLSX`:
        cast[`r128`](`op_r128_lsx`(cast[register[16, `T`, Raw128]](a)))
      else:
        cast[`r128`](`op_la_128`(cast[register[16, `T`, Raw128]](a)))

    template `opName`*(a: `r256`): `r256` =
      when defined(useLASX) and `hasLASX`:
        cast[`r256`](`op_r256_lasx`(cast[register[32, `T`, Raw256]](a)))
      elif defined(useLSX) and `hasLSX`:
        cast[`r256`](`op_r256_lsx`(cast[register[32, `T`, Raw256]](a)))
      else:
        cast[`r256`](`op_la_256`(cast[register[32, `T`, Raw256]](a)))

    template `opName`*(a: `r512`): `r512` =
      when defined(useLASX) and `hasLASX`:
        cast[`r512`](`op_r512_lasx`(cast[register[64, `T`, Raw512]](a)))
      elif defined(useLSX) and `hasLSX`:
        cast[`r512`](`op_r512_lsx`(cast[register[64, `T`, Raw512]](a)))
      else:
        cast[`r512`](`op_la_512`(cast[register[64, `T`, Raw512]](a)))

# =============================================================================
# Unary Altivec emitter
# =============================================================================

proc emitUnaryPPC(op, dtype, altivec, fb: NimNode): NimNode =
  let opName = ident(op.strVal)
  let T = ident(dtype.strVal)
  let short = case dtype.strVal
    of "float32": "f32"
    of "float64": "f64"
    of "int8": "i8"
    of "int16": "i16"
    of "int32": "i32"
    of "int64": "i64"
    of "uint8": "u8"
    of "uint16": "u16"
    of "uint32": "u32"
    of "uint64": "u64"
    else: dtype.strVal

  let r128 = ident(short & "r128")
  let r256 = ident(short & "r256")
  let r512 = ident(short & "r512")

  let op_r128_altivec = ident(op.strVal & "_r128_altivec")
  let op_r256_altivec = ident(op.strVal & "_r256_altivec")
  let op_r512_altivec = ident(op.strVal & "_r512_altivec")

  let op_ppc_128 = ident(op.strVal & "_altivec_128")
  let op_ppc_256 = ident(op.strVal & "_altivec_256")
  let op_ppc_512 = ident(op.strVal & "_altivec_512")

  let hasAltivec = not (altivec.kind == nnkIdent and $altivec == "none")

  result = quote do:
    type
      Raw128 = getRawRegister(`r128`)
      Raw256 = getRawRegister(`r256`)
      Raw512 = getRawRegister(`r512`)

    when `hasAltivec`:
      func `op_r128_altivec`(a: register[16, `T`, Raw128]): register[16, `T`, Raw128] =
        return cast[register[16, `T`, Raw128]](
          `altivec`(cast[Raw128](a))
        )

      func `op_r256_altivec`(a: register[32, `T`, Raw256]): register[32, `T`, Raw256] =
        var outVal: register[32, `T`, Raw256]
        let pOut = cast[ptr array[2, Raw128]](addr outVal)
        let pA = cast[ptr array[2, Raw128]](addr a)
        pOut[0] = `altivec`(pA[0])
        pOut[1] = `altivec`(pA[1])
        return outVal

      func `op_r512_altivec`(a: register[64, `T`, Raw512]): register[64, `T`, Raw512] =
        var outVal: register[64, `T`, Raw512]
        let pOut = cast[ptr array[4, Raw128]](addr outVal)
        let pA = cast[ptr array[4, Raw128]](addr a)
        pOut[0] = `altivec`(pA[0])
        pOut[1] = `altivec`(pA[1])
        pOut[2] = `altivec`(pA[2])
        pOut[3] = `altivec`(pA[3])
        return outVal

    let `op_ppc_128`: proc (a: register[16, `T`, Raw128]): register[16, `T`, Raw128] =
      when `hasAltivec`:
        if ALTIVEC: `op_r128_altivec`
        else: `fb`[16, `T`, Raw128]
      else:
        `fb`[16, `T`, Raw128]

    let `op_ppc_256`: proc (a: register[32, `T`, Raw256]): register[32, `T`, Raw256] =
      when `hasAltivec`:
        if ALTIVEC: `op_r256_altivec`
        else: `fb`[32, `T`, Raw256]
      else:
        `fb`[32, `T`, Raw256]

    let `op_ppc_512`: proc (a: register[64, `T`, Raw512]): register[64, `T`, Raw512] =
      when `hasAltivec`:
        if ALTIVEC: `op_r512_altivec`
        else: `fb`[64, `T`, Raw512]
      else:
        `fb`[64, `T`, Raw512]

    template `opName`*(a: `r128`): `r128` =
      when defined(useAltivec) and `hasAltivec`:
        cast[`r128`](`op_r128_altivec`(cast[register[16, `T`, Raw128]](a)))
      else:
        cast[`r128`](`op_ppc_128`(cast[register[16, `T`, Raw128]](a)))

    template `opName`*(a: `r256`): `r256` =
      when defined(useAltivec) and `hasAltivec`:
        cast[`r256`](`op_r256_altivec`(cast[register[32, `T`, Raw256]](a)))
      else:
        cast[`r256`](`op_ppc_256`(cast[register[32, `T`, Raw256]](a)))

    template `opName`*(a: `r512`): `r512` =
      when defined(useAltivec) and `hasAltivec`:
        cast[`r512`](`op_r512_altivec`(cast[register[64, `T`, Raw512]](a)))
      else:
        cast[`r512`](`op_ppc_512`(cast[register[64, `T`, Raw512]](a)))

proc emitBinaryMaskX86(op, dtype: string, sse, avx, avx512, mask128, mask256, fb: NimNode): NimNode =
  let opName = ident(op)
  let T = ident(dtype)
  let MaskT = ident(maskTypeName(dtype))

  let short = case dtype
    of "float32": "f32"
    of "float64": "f64"
    of "int8": "i8"
    of "int16": "i16"
    of "int32": "i32"
    of "int64": "i64"
    of "uint8": "u8"
    of "uint16": "u16"
    of "uint32": "u32"
    of "uint64": "u64"
    else: dtype

  let maskShort = maskShortName(dtype)

  let r128 = ident(short & "r128")
  let r256 = ident(short & "r256")
  let r512 = ident(short & "r512")

  let mr128 = ident(maskShort & "r128")
  let mr256 = ident(maskShort & "r256")
  let mr512 = ident(maskShort & "r512")

  let op_r128_sse = ident(op & "_mask_r128_sse")
  let op_r256_sse = ident(op & "_mask_r256_sse")
  let op_r256_avx = ident(op & "_mask_r256_avx")
  let op_r512_sse = ident(op & "_mask_r512_sse")
  let op_r512_avx = ident(op & "_mask_r512_avx")
  let op_r512_avx512 = ident(op & "_mask_r512_avx512")

  let op_x86_mask_128 = ident(op & "_mask_x86_128_" & short)
  let op_x86_mask_256 = ident(op & "_mask_x86_256_" & short)
  let op_x86_mask_512 = ident(op & "_mask_x86_512_" & short)

  let hasSSE = not (sse.kind == nnkIdent and $sse == "none")
  let hasAVX = not (avx.kind == nnkIdent and $avx == "none")
  let hasAVX512 = not (avx512.kind == nnkIdent and $avx512 == "none")

  result = quote do:
    type
      Raw128 = getRawRegister(`r128`)
      Raw256 = getRawRegister(`r256`)
      Raw512 = getRawRegister(`r512`)

    when `hasSSE`:
      func `op_r128_sse`(a, b: register[16, `T`, Raw128]): register[16, `MaskT`, Raw128] =
        return cast[register[16, `MaskT`, Raw128]](
          `sse`(cast[Raw128](a), cast[Raw128](b))
        )

      func `op_r256_sse`(a, b: register[32, `T`, Raw256]): register[32, `MaskT`, Raw256] =
        var outVal: register[32, `MaskT`, Raw256]
        let pOut = cast[ptr array[2, Raw128]](addr outVal)
        let pA = cast[ptr array[2, Raw128]](addr a)
        let pB = cast[ptr array[2, Raw128]](addr b)
        pOut[0] = `sse`(pA[0], pB[0])
        pOut[1] = `sse`(pA[1], pB[1])
        return outVal

      func `op_r512_sse`(a, b: register[64, `T`, Raw512]): register[64, `MaskT`, Raw512] =
        var outVal: register[64, `MaskT`, Raw512]
        let pOut = cast[ptr array[4, Raw128]](addr outVal)
        let pA = cast[ptr array[4, Raw128]](addr a)
        let pB = cast[ptr array[4, Raw128]](addr b)
        pOut[0] = `sse`(pA[0], pB[0])
        pOut[1] = `sse`(pA[1], pB[1])
        pOut[2] = `sse`(pA[2], pB[2])
        pOut[3] = `sse`(pA[3], pB[3])
        return outVal

    when `hasAVX`:
      func `op_r256_avx`(a, b: register[32, `T`, Raw256]): register[32, `MaskT`, Raw256] =
        return cast[register[32, `MaskT`, Raw256]](
          `avx`(cast[Raw256](a), cast[Raw256](b))
        )

      func `op_r512_avx`(a, b: register[64, `T`, Raw512]): register[64, `MaskT`, Raw512] =
        var outVal: register[64, `MaskT`, Raw512]
        let pOut = cast[ptr array[2, Raw256]](addr outVal)
        let pA = cast[ptr array[2, Raw256]](addr a)
        let pB = cast[ptr array[2, Raw256]](addr b)
        pOut[0] = `avx`(pA[0], pB[0])
        pOut[1] = `avx`(pA[1], pB[1])
        return outVal

    when `hasAVX512`:
      func `op_r512_avx512`(a, b: register[64, `T`, Raw512]): register[64, `MaskT`, Raw512] =
        return cast[register[64, `MaskT`, Raw512]](
          `avx512`(cast[Raw512](a), cast[Raw512](b))
        )

    let `op_x86_mask_128`: proc (
      a, b: register[16, `T`, Raw128]
    ): register[16, `MaskT`, Raw128] =
      when `hasSSE`:
        if SSE: `op_r128_sse`
        else: `fb`[16, `T`, Raw128]
      else:
        `fb`[16, `T`, Raw128]

    let `op_x86_mask_256`: proc (
      a, b: register[32, `T`, Raw256]
    ): register[32, `MaskT`, Raw256] =
      when `hasAVX` and `hasSSE`:
        if AVX: `op_r256_avx`
        elif SSE: `op_r256_sse`
        else: `fb`[32, `T`, Raw256]
      elif `hasAVX`:
        if AVX: `op_r256_avx`
        else: `fb`[32, `T`, Raw256]
      elif `hasSSE`:
        if SSE: `op_r256_sse`
        else: `fb`[32, `T`, Raw256]
      else:
        `fb`[32, `T`, Raw256]

    let `op_x86_mask_512`: proc (
      a, b: register[64, `T`, Raw512]
    ): register[64, `MaskT`, Raw512] =
      when `hasAVX512` and `hasAVX` and `hasSSE`:
        if AVX512: `op_r512_avx512`
        elif AVX: `op_r512_avx`
        elif SSE: `op_r512_sse`
        else: `fb`[64, `T`, Raw512]
      elif `hasAVX512` and `hasAVX`:
        if AVX512: `op_r512_avx512`
        elif AVX: `op_r512_avx`
        else: `fb`[64, `T`, Raw512]
      elif `hasAVX512`:
        if AVX512: `op_r512_avx512`
        else: `fb`[64, `T`, Raw512]
      elif `hasAVX` and `hasSSE`:
        if AVX: `op_r512_avx`
        elif SSE: `op_r512_sse`
        else: `fb`[64, `T`, Raw512]
      elif `hasAVX`:
        if AVX: `op_r512_avx`
        else: `fb`[64, `T`, Raw512]
      elif `hasSSE`:
        if SSE: `op_r512_sse`
        else: `fb`[64, `T`, Raw512]
      else:
        `fb`[64, `T`, Raw512]

    template `opName`*(a, b: `r128`): `mr128` =
      when defined(useSSE) and `hasSSE`:
        cast[`mr128`](
          `op_r128_sse`(
            cast[register[16, `T`, Raw128]](a),
            cast[register[16, `T`, Raw128]](b)
          )
        )
      else:
        cast[`mr128`](
          `op_x86_mask_128`(
            cast[register[16, `T`, Raw128]](a),
            cast[register[16, `T`, Raw128]](b)
          )
        )

    template `opName`*(a, b: `r256`): `mr256` =
      when defined(useAVX) and `hasAVX`:
        cast[`mr256`](
          `op_r256_avx`(
            cast[register[32, `T`, Raw256]](a),
            cast[register[32, `T`, Raw256]](b)
          )
        )
      elif defined(useSSE) and `hasSSE`:
        cast[`mr256`](
          `op_r256_sse`(
            cast[register[32, `T`, Raw256]](a),
            cast[register[32, `T`, Raw256]](b)
          )
        )
      else:
        cast[`mr256`](
          `op_x86_mask_256`(
            cast[register[32, `T`, Raw256]](a),
            cast[register[32, `T`, Raw256]](b)
          )
        )

    template `opName`*(a, b: `r512`): `mr512` =
      when defined(useAVX512) and `hasAVX512`:
        cast[`mr512`](
          `op_r512_avx512`(
            cast[register[64, `T`, Raw512]](a),
            cast[register[64, `T`, Raw512]](b)
          )
        )
      elif defined(useAVX) and `hasAVX`:
        cast[`mr512`](
          `op_r512_avx`(
            cast[register[64, `T`, Raw512]](a),
            cast[register[64, `T`, Raw512]](b)
          )
        )
      elif defined(useSSE) and `hasSSE`:
        cast[`mr512`](
          `op_r512_sse`(
            cast[register[64, `T`, Raw512]](a),
            cast[register[64, `T`, Raw512]](b)
          )
        )
      else:
        cast[`mr512`](
          `op_x86_mask_512`(
            cast[register[64, `T`, Raw512]](a),
            cast[register[64, `T`, Raw512]](b)
          )
        )

proc emitBinaryMaskArm(op, dtype: string, neon, fb: NimNode): NimNode =
  let opName = ident(op)
  let T = ident(dtype)
  let MaskT = ident(maskTypeName(dtype))

  let short = case dtype
    of "float32": "f32"
    of "float64": "f64"
    of "int8": "i8"
    of "int16": "i16"
    of "int32": "i32"
    of "int64": "i64"
    of "uint8": "u8"
    of "uint16": "u16"
    of "uint32": "u32"
    of "uint64": "u64"
    else: dtype

  let maskShort = maskShortName(dtype)

  let r128 = ident(short & "r128")
  let r256 = ident(short & "r256")
  let r512 = ident(short & "r512")

  let mr128 = ident(maskShort & "r128")
  let mr256 = ident(maskShort & "r256")
  let mr512 = ident(maskShort & "r512")

  let op_r128_neon = ident(op & "_mask_r128_neon")
  let op_r256_neon = ident(op & "_mask_r256_neon")
  let op_r512_neon = ident(op & "_mask_r512_neon")

  let op_arm_mask_128 = ident(op & "_mask_arm_128_" & short)
  let op_arm_mask_256 = ident(op & "_mask_arm_256_" & short)
  let op_arm_mask_512 = ident(op & "_mask_arm_512_" & short)

  let hasNEON = not (neon.kind == nnkIdent and $neon == "none")

  result = quote do:
    type
      Raw128 = getRawRegister(`r128`)
      Raw256 = getRawRegister(`r256`)
      Raw512 = getRawRegister(`r512`)

    when `hasNEON`:
      func `op_r128_neon`(a, b: register[16, `T`, Raw128]): register[16, `MaskT`, Raw128] =
        return cast[register[16, `MaskT`, Raw128]](
          `neon`(cast[Raw128](a), cast[Raw128](b))
        )

      func `op_r256_neon`(a, b: register[32, `T`, Raw256]): register[32, `MaskT`, Raw256] =
        var outVal: register[32, `MaskT`, Raw256]
        let pOut = cast[ptr array[2, Raw128]](addr outVal)
        let pA = cast[ptr array[2, Raw128]](addr a)
        let pB = cast[ptr array[2, Raw128]](addr b)
        pOut[0] = `neon`(pA[0], pB[0])
        pOut[1] = `neon`(pA[1], pB[1])
        return outVal

      func `op_r512_neon`(a, b: register[64, `T`, Raw512]): register[64, `MaskT`, Raw512] =
        var outVal: register[64, `MaskT`, Raw512]
        let pOut = cast[ptr array[4, Raw128]](addr outVal)
        let pA = cast[ptr array[4, Raw128]](addr a)
        let pB = cast[ptr array[4, Raw128]](addr b)
        pOut[0] = `neon`(pA[0], pB[0])
        pOut[1] = `neon`(pA[1], pB[1])
        pOut[2] = `neon`(pA[2], pB[2])
        pOut[3] = `neon`(pA[3], pB[3])
        return outVal

    let `op_arm_mask_128`: proc (
      a, b: register[16, `T`, Raw128]
    ): register[16, `MaskT`, Raw128] =
      when `hasNEON`:
        if NEON: `op_r128_neon`
        else: `fb`[16, `T`, Raw128]
      else:
        `fb`[16, `T`, Raw128]

    let `op_arm_mask_256`: proc (
      a, b: register[32, `T`, Raw256]
    ): register[32, `MaskT`, Raw256] =
      when `hasNEON`:
        if NEON: `op_r256_neon`
        else: `fb`[32, `T`, Raw256]
      else:
        `fb`[32, `T`, Raw256]

    let `op_arm_mask_512`: proc (
      a, b: register[64, `T`, Raw512]
    ): register[64, `MaskT`, Raw512] =
      when `hasNEON`:
        if NEON: `op_r512_neon`
        else: `fb`[64, `T`, Raw512]
      else:
        `fb`[64, `T`, Raw512]

    template `opName`*(a, b: `r128`): `mr128` =
      when defined(useNEON) and `hasNEON`:
        cast[`mr128`](
          `op_r128_neon`(
            cast[register[16, `T`, Raw128]](a),
            cast[register[16, `T`, Raw128]](b)
          )
        )
      else:
        cast[`mr128`](
          `op_arm_mask_128`(
            cast[register[16, `T`, Raw128]](a),
            cast[register[16, `T`, Raw128]](b)
          )
        )

    template `opName`*(a, b: `r256`): `mr256` =
      when defined(useNEON) and `hasNEON`:
        cast[`mr256`](
          `op_r256_neon`(
            cast[register[32, `T`, Raw256]](a),
            cast[register[32, `T`, Raw256]](b)
          )
        )
      else:
        cast[`mr256`](
          `op_arm_mask_256`(
            cast[register[32, `T`, Raw256]](a),
            cast[register[32, `T`, Raw256]](b)
          )
        )

    template `opName`*(a, b: `r512`): `mr512` =
      when defined(useNEON) and `hasNEON`:
        cast[`mr512`](
          `op_r512_neon`(
            cast[register[64, `T`, Raw512]](a),
            cast[register[64, `T`, Raw512]](b)
          )
        )
      else:
        cast[`mr512`](
          `op_arm_mask_512`(
            cast[register[64, `T`, Raw512]](a),
            cast[register[64, `T`, Raw512]](b)
          )
        )

proc emitBinaryMaskLoongArch(op, dtype: string, lsx, lasx, fb: NimNode): NimNode =
  let opName = ident(op)
  let T = ident(dtype)
  let MaskT = ident(maskTypeName(dtype))

  let short = case dtype
    of "float32": "f32"
    of "float64": "f64"
    of "int8": "i8"
    of "int16": "i16"
    of "int32": "i32"
    of "int64": "i64"
    of "uint8": "u8"
    of "uint16": "u16"
    of "uint32": "u32"
    of "uint64": "u64"
    else: dtype

  let maskShort = maskShortName(dtype)

  let r128 = ident(short & "r128")
  let r256 = ident(short & "r256")
  let r512 = ident(short & "r512")

  let mr128 = ident(maskShort & "r128")
  let mr256 = ident(maskShort & "r256")
  let mr512 = ident(maskShort & "r512")

  let op_r128_lsx = ident(op & "_mask_r128_lsx")
  let op_r256_lsx = ident(op & "_mask_r256_lsx")
  let op_r256_lasx = ident(op & "_mask_r256_lasx")
  let op_r512_lsx = ident(op & "_mask_r512_lsx")
  let op_r512_lasx = ident(op & "_mask_r512_lasx")

  let op_la_mask_128 = ident(op & "_mask_la_128_" & short)
  let op_la_mask_256 = ident(op & "_mask_la_256_" & short)
  let op_la_mask_512 = ident(op & "_mask_la_512_" & short)

  let hasLSX = not (lsx.kind == nnkIdent and $lsx == "none")
  let hasLASX = not (lasx.kind == nnkIdent and $lasx == "none")

  result = quote do:
    type
      Raw128 = getRawRegister(`r128`)
      Raw256 = getRawRegister(`r256`)
      Raw512 = getRawRegister(`r512`)

    when `hasLSX`:
      func `op_r128_lsx`(a, b: register[16, `T`, Raw128]): register[16, `MaskT`, Raw128] =
        return cast[register[16, `MaskT`, Raw128]](
          `lsx`(cast[Raw128](a), cast[Raw128](b))
        )

      func `op_r256_lsx`(a, b: register[32, `T`, Raw256]): register[32, `MaskT`, Raw256] =
        var outVal: register[32, `MaskT`, Raw256]
        let pOut = cast[ptr array[2, Raw128]](addr outVal)
        let pA = cast[ptr array[2, Raw128]](addr a)
        let pB = cast[ptr array[2, Raw128]](addr b)
        pOut[0] = `lsx`(pA[0], pB[0])
        pOut[1] = `lsx`(pA[1], pB[1])
        return outVal

      func `op_r512_lsx`(a, b: register[64, `T`, Raw512]): register[64, `MaskT`, Raw512] =
        var outVal: register[64, `MaskT`, Raw512]
        let pOut = cast[ptr array[4, Raw128]](addr outVal)
        let pA = cast[ptr array[4, Raw128]](addr a)
        let pB = cast[ptr array[4, Raw128]](addr b)
        pOut[0] = `lsx`(pA[0], pB[0])
        pOut[1] = `lsx`(pA[1], pB[1])
        pOut[2] = `lsx`(pA[2], pB[2])
        pOut[3] = `lsx`(pA[3], pB[3])
        return outVal

    when `hasLASX`:
      func `op_r256_lasx`(a, b: register[32, `T`, Raw256]): register[32, `MaskT`, Raw256] =
        return cast[register[32, `MaskT`, Raw256]](
          `lasx`(cast[Raw256](a), cast[Raw256](b))
        )

      func `op_r512_lasx`(a, b: register[64, `T`, Raw512]): register[64, `MaskT`, Raw512] =
        var outVal: register[64, `MaskT`, Raw512]
        let pOut = cast[ptr array[2, Raw256]](addr outVal)
        let pA = cast[ptr array[2, Raw256]](addr a)
        let pB = cast[ptr array[2, Raw256]](addr b)
        pOut[0] = `lasx`(pA[0], pB[0])
        pOut[1] = `lasx`(pA[1], pB[1])
        return outVal

    let `op_la_mask_128`: proc (
      a, b: register[16, `T`, Raw128]
    ): register[16, `MaskT`, Raw128] =
      when `hasLSX`:
        if LSX: `op_r128_lsx`
        else: `fb`[16, `T`, Raw128]
      else:
        `fb`[16, `T`, Raw128]

    let `op_la_mask_256`: proc (
      a, b: register[32, `T`, Raw256]
    ): register[32, `MaskT`, Raw256] =
      when `hasLASX` and `hasLSX`:
        if LASX: `op_r256_lasx`
        elif LSX: `op_r256_lsx`
        else: `fb`[32, `T`, Raw256]
      elif `hasLASX`:
        if LASX: `op_r256_lasx`
        else: `fb`[32, `T`, Raw256]
      elif `hasLSX`:
        if LSX: `op_r256_lsx`
        else: `fb`[32, `T`, Raw256]
      else:
        `fb`[32, `T`, Raw256]

    let `op_la_mask_512`: proc (
      a, b: register[64, `T`, Raw512]
    ): register[64, `MaskT`, Raw512] =
      when `hasLASX` and `hasLSX`:
        if LASX: `op_r512_lasx`
        elif LSX: `op_r512_lsx`
        else: `fb`[64, `T`, Raw512]
      elif `hasLASX`:
        if LASX: `op_r512_lasx`
        else: `fb`[64, `T`, Raw512]
      elif `hasLSX`:
        if LSX: `op_r512_lsx`
        else: `fb`[64, `T`, Raw512]
      else:
        `fb`[64, `T`, Raw512]

    template `opName`*(a, b: `r128`): `mr128` =
      when defined(useLSX) and `hasLSX`:
        cast[`mr128`](
          `op_r128_lsx`(
            cast[register[16, `T`, Raw128]](a),
            cast[register[16, `T`, Raw128]](b)
          )
        )
      else:
        cast[`mr128`](
          `op_la_mask_128`(
            cast[register[16, `T`, Raw128]](a),
            cast[register[16, `T`, Raw128]](b)
          )
        )

    template `opName`*(a, b: `r256`): `mr256` =
      when defined(useLASX) and `hasLASX`:
        cast[`mr256`](
          `op_r256_lasx`(
            cast[register[32, `T`, Raw256]](a),
            cast[register[32, `T`, Raw256]](b)
          )
        )
      elif defined(useLSX) and `hasLSX`:
        cast[`mr256`](
          `op_r256_lsx`(
            cast[register[32, `T`, Raw256]](a),
            cast[register[32, `T`, Raw256]](b)
          )
        )
      else:
        cast[`mr256`](
          `op_la_mask_256`(
            cast[register[32, `T`, Raw256]](a),
            cast[register[32, `T`, Raw256]](b)
          )
        )

    template `opName`*(a, b: `r512`): `mr512` =
      when defined(useLASX) and `hasLASX`:
        cast[`mr512`](
          `op_r512_lasx`(
            cast[register[64, `T`, Raw512]](a),
            cast[register[64, `T`, Raw512]](b)
          )
        )
      elif defined(useLSX) and `hasLSX`:
        cast[`mr512`](
          `op_r512_lsx`(
            cast[register[64, `T`, Raw512]](a),
            cast[register[64, `T`, Raw512]](b)
          )
        )
      else:
        cast[`mr512`](
          `op_la_mask_512`(
            cast[register[64, `T`, Raw512]](a),
            cast[register[64, `T`, Raw512]](b)
          )
        )

proc emitBinaryMaskPPC(op, dtype: string, altivec, fb: NimNode): NimNode =
  let opName = ident(op)
  let T = ident(dtype)
  let MaskT = ident(maskTypeName(dtype))

  let short = case dtype
    of "float32": "f32"
    of "float64": "f64"
    of "int8": "i8"
    of "int16": "i16"
    of "int32": "i32"
    of "int64": "i64"
    of "uint8": "u8"
    of "uint16": "u16"
    of "uint32": "u32"
    of "uint64": "u64"
    else: dtype

  let maskShort = maskShortName(dtype)

  let r128 = ident(short & "r128")
  let r256 = ident(short & "r256")
  let r512 = ident(short & "r512")

  let mr128 = ident(maskShort & "r128")
  let mr256 = ident(maskShort & "r256")
  let mr512 = ident(maskShort & "r512")

  let op_r128_altivec = ident(op & "_mask_r128_altivec")
  let op_r256_altivec = ident(op & "_mask_r256_altivec")
  let op_r512_altivec = ident(op & "_mask_r512_altivec")

  let op_ppc_mask_128 = ident(op & "_mask_altivec_128_" & short)
  let op_ppc_mask_256 = ident(op & "_mask_altivec_256_" & short)
  let op_ppc_mask_512 = ident(op & "_mask_altivec_512_" & short)

  let hasAltivec = not (altivec.kind == nnkIdent and $altivec == "none")

  result = quote do:
    type
      Raw128 = getRawRegister(`r128`)
      Raw256 = getRawRegister(`r256`)
      Raw512 = getRawRegister(`r512`)

    when `hasAltivec`:
      func `op_r128_altivec`(a, b: register[16, `T`, Raw128]): register[16, `MaskT`, Raw128] =
        return cast[register[16, `MaskT`, Raw128]](
          `altivec`(cast[Raw128](a), cast[Raw128](b))
        )

      func `op_r256_altivec`(a, b: register[32, `T`, Raw256]): register[32, `MaskT`, Raw256] =
        var outVal: register[32, `MaskT`, Raw256]
        let pOut = cast[ptr array[2, Raw128]](addr outVal)
        let pA = cast[ptr array[2, Raw128]](addr a)
        let pB = cast[ptr array[2, Raw128]](addr b)
        pOut[0] = `altivec`(pA[0], pB[0])
        pOut[1] = `altivec`(pA[1], pB[1])
        return outVal

      func `op_r512_altivec`(a, b: register[64, `T`, Raw512]): register[64, `MaskT`, Raw512] =
        var outVal: register[64, `MaskT`, Raw512]
        let pOut = cast[ptr array[4, Raw128]](addr outVal)
        let pA = cast[ptr array[4, Raw128]](addr a)
        let pB = cast[ptr array[4, Raw128]](addr b)
        pOut[0] = `altivec`(pA[0], pB[0])
        pOut[1] = `altivec`(pA[1], pB[1])
        pOut[2] = `altivec`(pA[2], pB[2])
        pOut[3] = `altivec`(pA[3], pB[3])
        return outVal

    let `op_ppc_mask_128`: proc (
      a, b: register[16, `T`, Raw128]
    ): register[16, `MaskT`, Raw128] =
      when `hasAltivec`:
        if ALTIVEC: `op_r128_altivec`
        else: `fb`[16, `T`, Raw128]
      else:
        `fb`[16, `T`, Raw128]

    let `op_ppc_mask_256`: proc (
      a, b: register[32, `T`, Raw256]
    ): register[32, `MaskT`, Raw256] =
      when `hasAltivec`:
        if ALTIVEC: `op_r256_altivec`
        else: `fb`[32, `T`, Raw256]
      else:
        `fb`[32, `T`, Raw256]

    let `op_ppc_mask_512`: proc (
      a, b: register[64, `T`, Raw512]
    ): register[64, `MaskT`, Raw512] =
      when `hasAltivec`:
        if ALTIVEC: `op_r512_altivec`
        else: `fb`[64, `T`, Raw512]
      else:
        `fb`[64, `T`, Raw512]

    template `opName`*(a, b: `r128`): `mr128` =
      when defined(useAltivec) and `hasAltivec`:
        cast[`mr128`](
          `op_r128_altivec`(
            cast[register[16, `T`, Raw128]](a),
            cast[register[16, `T`, Raw128]](b)
          )
        )
      else:
        cast[`mr128`](
          `op_ppc_mask_128`(
            cast[register[16, `T`, Raw128]](a),
            cast[register[16, `T`, Raw128]](b)
          )
        )

    template `opName`*(a, b: `r256`): `mr256` =
      when defined(useAltivec) and `hasAltivec`:
        cast[`mr256`](
          `op_r256_altivec`(
            cast[register[32, `T`, Raw256]](a),
            cast[register[32, `T`, Raw256]](b)
          )
        )
      else:
        cast[`mr256`](
          `op_ppc_mask_256`(
            cast[register[32, `T`, Raw256]](a),
            cast[register[32, `T`, Raw256]](b)
          )
        )

    template `opName`*(a, b: `r512`): `mr512` =
      when defined(useAltivec) and `hasAltivec`:
        cast[`mr512`](
          `op_r512_altivec`(
            cast[register[64, `T`, Raw512]](a),
            cast[register[64, `T`, Raw512]](b)
          )
        )
      else:
        cast[`mr512`](
          `op_ppc_mask_512`(
            cast[register[64, `T`, Raw512]](a),H
            cast[register[64, `T`, Raw512]](b)
          )
        )

proc emitLoadX86(op, T, sse, avx, avx512, fb: NimNode): NimNode =
  let opName = repr(op)
  let typeName = repr(T)
  let short = case typeName
    of "float32": "f32"
    of "float64": "f64"
    of "int8": "i8"
    of "int16": "i16"
    of "int32": "i32"
    of "int64": "i64"
    of "uint8": "u8"
    of "uint16": "u16"
    of "uint32": "u32"
    of "uint64": "u64"
    else: typeName

  let r128 = ident(short & "r128")
  let r256 = ident(short & "r256")
  let r512 = ident(short & "r512")

  let op_r128_sse = ident(opName & "_r128_sse")
  let op_r256_sse = ident(opName & "_r256_sse")
  let op_r256_avx = ident(opName & "_r256_avx")
  let op_r512_sse = ident(opName & "_r512_sse")
  let op_r512_avx = ident(opName & "_r512_avx")
  let op_r512_avx512 = ident(opName & "_r512_avx512")

  let op_x86_128 = ident(opName & short & "_x86_128")
  let op_x86_256 = ident(opName & short & "_x86_256")
  let op_x86_512 = ident(opName & short & "_x86_512")

  let hasSSE = not (sse.kind == nnkIdent and $sse == "none")
  let hasAVX = not (avx.kind == nnkIdent and $avx == "none")
  let hasAVX512 = not (avx512.kind == nnkIdent and $avx512 == "none")

  result = quote do:
    type
      Raw128 = getRawRegister(`r128`)
      Raw256 = getRawRegister(`r256`)
      Raw512 = getRawRegister(`r512`)

    when `hasSSE`:
      func `op_r128_sse`(a: ptr `T`): register[16, `T`, Raw128] =
        return cast[register[16, `T`, Raw128]](
          `sse`(cast[ptr Raw128](a))
        )

    when `hasSSE`:
      func `op_r256_sse`(a: ptr `T`): register[32, `T`, Raw256] =
        var outVal: register[32, `T`, Raw256]
        let pOut = cast[ptr array[2, Raw128]](addr outVal)
        let pIn = cast[ptr array[2, Raw128]](a)
        pOut[0] = `sse`(pIn[0])
        pOut[1] = `sse`(pIn[1])
        return outVal

    when `hasAVX`:
      func `op_r256_avx`(a: ptr `T`): register[32, `T`, Raw256] =
        return cast[register[32, `T`, Raw256]](
          `avx`(cast[ptr Raw256](a))
        )

    when `hasSSE`:
      func `op_r512_sse`(a: ptr `T`): register[64, `T`, Raw512] =
        var outVal: register[64, `T`, Raw512]
        let pOut = cast[ptr array[4, Raw128]](addr outVal)
        let pIn = cast[ptr array[4, Raw128]](a)
        pOut[0] = `sse`(pIn[0])
        pOut[1] = `sse`(pIn[1])
        pOut[2] = `sse`(pIn[2])
        pOut[3] = `sse`(pIn[3])
        return outVal

    when `hasAVX`:
      func `op_r512_avx`(a: ptr `T`): register[64, `T`, Raw512] =
        var outVal: register[64, `T`, Raw512]
        let pOut = cast[ptr array[2, Raw256]](addr outVal)
        let pIn = cast[ptr array[2, Raw256]](a)
        pOut[0] = `avx`(pIn[0])
        pOut[1] = `avx`(pIn[1])
        return outVal

    when `hasAVX512`:
      func `op_r512_avx512`(a: ptr `T`): register[64, `T`, Raw512] =
        return cast[register[64, `T`, Raw512]](
          `avx512`(cast[ptr Raw512](a))
        )

    let `op_x86_128`: proc (a: ptr `T`): register[16, `T`, Raw128] =
      when `hasSSE`:
        if SSE: `op_r128_sse`
        else: `fb`[16, `T`, Raw128]
      else:
        `fb`[16, `T`, Raw128]

    let `op_x86_256`: proc (a: ptr `T`): register[32, `T`, Raw256] =
      when `hasAVX` and `hasSSE`:
        if AVX: `op_r256_avx`
        elif `hasSSE` and SSE: `op_r256_sse`
        else: `fb`[32, `T`, Raw256]
      elif `hasAVX`:
        if AVX: `op_r256_avx`
        else: `fb`[32, `T`, Raw256]
      elif `hasSSE`:
        if SSE: `op_r256_sse`
        else: `fb`[32, `T`, Raw256]
      else:
        `fb`[32, `T`, Raw256]

    let `op_x86_512`: proc (a: ptr `T`): register[64, `T`, Raw512] =
      when `hasAVX512` and `hasAVX` and `hasSSE`:
        if AVX512: `op_r512_avx512`
        elif `hasAVX` and AVX: `op_r512_avx`
        elif `hasSSE` and SSE: `op_r512_sse`
        else: `fb`[64, `T`, Raw512]
      elif `hasAVX512` and `hasAVX`:
        if AVX512: `op_r512_avx512`
        elif `hasAVX` and AVX: `op_r512_avx`
        else: `fb`[64, `T`, Raw512]
      elif `hasAVX512`:
        if AVX512: `op_r512_avx512`
        else: `fb`[64, `T`, Raw512]
      elif `hasAVX` and `hasSSE`:
        if AVX: `op_r512_avx`
        elif SSE: `op_r512_sse`
        else: `fb`[64, `T`, Raw512]
      elif `hasAVX`:
        if AVX: `op_r512_avx`
        else: `fb`[64, `T`, Raw512]
      elif `hasSSE`:
        if SSE: `op_r512_sse`
        else: `fb`[64, `T`, Raw512]
      else:
        `fb`[64, `T`, Raw512]

    template `op`*(a: ptr `T`): `r128` =
      when defined(useSSE):
        cast[`r128`](`op_r128_sse`(a))
      else:
        cast[`r128`](`op_x86_128`(a))

    template `op`*(a: ptr `T`): `r256` =
      when defined(useAVX):
        cast[`r256`](`op_r256_avx`(a))
      elif defined(useSSE):
        cast[`r256`](`op_r256_sse`(a))
      else:
        cast[`r256`](`op_x86_256`(a))

    template `op`*(a: ptr `T`): `r512` =
      when defined(useAVX512):
        cast[`r512`](`op_r512_avx512`(a))
      elif defined(useAVX):
        cast[`r512`](`op_r512_avx`(a))
      elif defined(useSSE):
        cast[`r512`](`op_r512_sse`(a))
      else:
        cast[`r512`](`op_x86_512`(a))

proc emitLoadArm(op, dtype, neon, fb: NimNode): NimNode =
  let opName = repr(op)
  let T = dtype
  let typeName = repr(dtype)
  let short = case typeName
    of "float32": "f32"
    of "float64": "f64"
    of "int8": "i8"
    of "int16": "i16"
    of "int32": "i32"
    of "int64": "i64"
    of "uint8": "u8"
    of "uint16": "u16"
    of "uint32": "u32"
    of "uint64": "u64"
    else: typeName

  let r128 = ident(short & "r128")
  let r256 = ident(short & "r256")
  let r512 = ident(short & "r512")

  let op_r128_neon = ident(opName & "_r128_neon")
  let op_r256_neon = ident(opName & "_r256_neon")
  let op_r512_neon = ident(opName & "_r512_neon")

  let op_arm_128 = ident(opName & "_arm_128")
  let op_arm_256 = ident(opName & "_arm_256")
  let op_arm_512 = ident(opName & "_arm_512")

  let hasNEON = not (neon.kind == nnkIdent and $neon == "none")

  result = quote do:
    type
      Raw128 = getRawRegister(`r128`)
      Raw256 = getRawRegister(`r256`)
      Raw512 = getRawRegister(`r512`)

    when `hasNEON`:
      func `op_r128_neon`(a: ptr `T`): register[16, `T`, Raw128] =
        return cast[register[16, `T`, Raw128]](
          `neon`(cast[ptr Raw128](a))
        )

      func `op_r256_neon`(a: ptr `T`): register[32, `T`, Raw256] =
        var outVal: register[32, `T`, Raw256]
        let pOut = cast[ptr array[2, Raw128]](addr outVal)
        let pIn = cast[ptr array[2, Raw128]](a)
        pOut[0] = `neon`(pIn[0])
        pOut[1] = `neon`(pIn[1])
        return outVal

      func `op_r512_neon`(a: ptr `T`): register[64, `T`, Raw512] =
        var outVal: register[64, `T`, Raw512]
        let pOut = cast[ptr array[4, Raw128]](addr outVal)
        let pIn = cast[ptr array[4, Raw128]](a)
        pOut[0] = `neon`(pIn[0])
        pOut[1] = `neon`(pIn[1])
        pOut[2] = `neon`(pIn[2])
        pOut[3] = `neon`(pIn[3])
        return outVal

    let `op_arm_128`: proc (a: ptr `T`): register[16, `T`, Raw128] =
      when `hasNEON`:
        if NEON: `op_r128_neon`
        else: `fb`[16, `T`, Raw128]
      else: `fb`[16, `T`, Raw128]

    let `op_arm_256`: proc (a: ptr `T`): register[32, `T`, Raw256] =
      when `hasNEON`:
        if NEON: `op_r256_neon`
        else: `fb`[32, `T`, Raw256]
      else: `fb`[32, `T`, Raw256]

    let `op_arm_512`: proc (a: ptr `T`): register[64, `T`, Raw512] =
      when `hasNEON`:
        if NEON: `op_r512_neon`
        else: `fb`[64, `T`, Raw512]
      else: `fb`[64, `T`, Raw512]

    template `opName`*(a: ptr `T`): `r128` =
      when defined(useNEON):
        cast[`r128`](`op_r128_neon`(a))
      else:
        cast[`r128`](`op_arm_128`(a))

    template `opName`*(a: ptr `T`): `r256` =
      when defined(useNEON):
        cast[`r256`](`op_r256_neon`(a))
      else:
        cast[`r256`](`op_arm_256`(a))

    template `opName`*(a: ptr `T`): `r512` =
      when defined(useNEON):
        cast[`r512`](`op_r512_neon`(a))
      else:
        cast[`r512`](`op_arm_512`(a))

proc emitLoadLA(op, dtype, lsx, lasx, fb: NimNode): NimNode =
  let opName = ident(op.strVal)
  let T = ident(dtype.strVal)
  let short = case dtype.strVal
    of "float32": "f32"
    of "float64": "f64"
    of "int8": "i8"
    of "int16": "i16"
    of "int32": "i32"
    of "int64": "i64"
    of "uint8": "u8"
    of "uint16": "u16"
    of "uint32": "u32"
    of "uint64": "u64"
    else: dtype.strVal

  let r128 = ident(short & "r128")
  let r256 = ident(short & "r256")
  let r512 = ident(short & "r512")

  let op_r128_lsx = ident(op.strVal & "_r128_lsx")
  let op_r256_lsx = ident(op.strVal & "_r256_lsx")
  let op_r256_lasx = ident(op.strVal & "_r256_lasx")
  let op_r512_lsx = ident(op.strVal & "_r512_lsx")
  let op_r512_lasx = ident(op.strVal & "_r512_lasx")

  let op_la_128 = ident(op.strVal & "_la_128")
  let op_la_256 = ident(op.strVal & "_la_256")
  let op_la_512 = ident(op.strVal & "_la_512")

  let hasLSX = not (lsx.kind == nnkIdent and $lsx == "none")
  let hasLASX = not (lasx.kind == nnkIdent and $lasx == "none")

  result = quote do:
    type
      Raw128 = getRawRegister(`r128`)
      Raw256 = getRawRegister(`r256`)
      Raw512 = getRawRegister(`r512`)

    when `hasLSX`:
      func `op_r128_lsx`(a: ptr `T`): register[16, `T`, Raw128] =
        return cast[register[16, `T`, Raw128]](
          `lsx`(cast[ptr Raw128](a))
        )

      func `op_r256_lsx`(a: ptr `T`): register[32, `T`, Raw256] =
        var outVal: register[32, `T`, Raw256]
        let pOut = cast[ptr array[2, Raw128]](addr outVal)
        let pIn = cast[ptr array[2, Raw128]](a)
        pOut[0] = `lsx`(pIn[0])
        pOut[1] = `lsx`(pIn[1])
        return outVal

      func `op_r512_lsx`(a: ptr `T`): register[64, `T`, Raw512] =
        var outVal: register[64, `T`, Raw512]
        let pOut = cast[ptr array[4, Raw128]](addr outVal)
        let pIn = cast[ptr array[4, Raw128]](a)
        pOut[0] = `lsx`(pIn[0])
        pOut[1] = `lsx`(pIn[1])
        pOut[2] = `lsx`(pIn[2])
        pOut[3] = `lsx`(pIn[3])
        return outVal

    when `hasLASX`:
      func `op_r256_lasx`(a: ptr `T`): register[32, `T`, Raw256] =
        return cast[register[32, `T`, Raw256]](
          `lasx`(cast[ptr Raw256](a))
        )

      func `op_r512_lasx`(a: ptr `T`): register[64, `T`, Raw512] =
        var outVal: register[64, `T`, Raw512]
        let pOut = cast[ptr array[2, Raw256]](addr outVal)
        let pIn = cast[ptr array[2, Raw256]](a)
        pOut[0] = `lasx`(pIn[0])
        pOut[1] = `lasx`(pIn[1])
        return outVal

    let `op_la_128`: proc (a: ptr `T`): register[16, `T`, Raw128] =
      when `hasLSX`:
        if LSX: `op_r128_lsx`
        else: `fb`[16, `T`, Raw128]
      else: `fb`[16, `T`, Raw128]

    let `op_la_256`: proc (a: ptr `T`): register[32, `T`, Raw256] =
      when `hasLASX` and `hasLSX`:
        if LASX: `op_r256_lasx`
        elif LSX: `op_r256_lsx`
        else: `fb`[32, `T`, Raw256]
      elif `hasLASX`:
        if LASX: `op_r256_lasx`
        else: `fb`[32, `T`, Raw256]
      elif `hasLSX`:
        if LSX: `op_r256_lsx`
        else: `fb`[32, `T`, Raw256]
      else: `fb`[32, `T`, Raw256]

    let `op_la_512`: proc (a: ptr `T`): register[64, `T`, Raw512] =
      when `hasLASX` and `hasLSX`:
        if LASX: `op_r512_lasx`
        elif LSX: `op_r512_lsx`
        else: `fb`[64, `T`, Raw512]
      elif `hasLASX`:
        if LASX: `op_r512_lasx`
        else: `fb`[64, `T`, Raw512]
      elif `hasLSX`:
        if LSX: `op_r512_lsx`
        else: `fb`[64, `T`, Raw512]
      else: `fb`[64, `T`, Raw512]

    template `opName`*(a: ptr `T`): `r128` =
      when defined(useLSX):
        cast[`r128`](`op_r128_lsx`(a))
      else:
        cast[`r128`](`op_la_128`(a))

    template `opName`*(a: ptr `T`): `r256` =
      when defined(useLASX):
        cast[`r256`](`op_r256_lasx`(a))
      elif defined(useLSX):
        cast[`r256`](`op_r256_lsx`(a))
      else:
        cast[`r256`](`op_la_256`(a))

    template `opName`*(a: ptr `T`): `r512` =
      when defined(useLASX):
        cast[`r512`](`op_r512_lasx`(a))
      elif defined(useLSX):
        cast[`r512`](`op_r512_lsx`(a))
      else:
        cast[`r512`](`op_la_512`(a))

proc emitLoadPPC(op, dtype, altivec, fb: NimNode): NimNode =
  let opName = ident(op.strVal)
  let T = ident(dtype.strVal)
  let short = case dtype.strVal
    of "float32": "f32"
    of "float64": "f64"
    of "int8": "i8"
    of "int16": "i16"
    of "int32": "i32"
    of "int64": "i64"
    of "uint8": "u8"
    of "uint16": "u16"
    of "uint32": "u32"
    of "uint64": "u64"
    else: dtype.strVal

  let r128 = ident(short & "r128")
  let r256 = ident(short & "r256")
  let r512 = ident(short & "r512")

  let op_r128_altivec = ident(op.strVal & "_r128_altivec")
  let op_r256_altivec = ident(op.strVal & "_r256_altivec")
  let op_r512_altivec = ident(op.strVal & "_r512_altivec")

  let op_ppc_128 = ident(op.strVal & "_altivec_128")
  let op_ppc_256 = ident(op.strVal & "_altivec_256")
  let op_ppc_512 = ident(op.strVal & "_altivec_512")

  let hasAltivec = not (altivec.kind == nnkIdent and $altivec == "none")

  result = quote do:
    type
      Raw128 = getRawRegister(`r128`)
      Raw256 = getRawRegister(`r256`)
      Raw512 = getRawRegister(`r512`)

    when `hasAltivec`:
      func `op_r128_altivec`(a: ptr `T`): register[16, `T`, Raw128] =
        return cast[register[16, `T`, Raw128]](
          `altivec`(cast[ptr Raw128](a))
        )

      func `op_r256_altivec`(a: ptr `T`): register[32, `T`, Raw256] =
        var outVal: register[32, `T`, Raw256]
        let pOut = cast[ptr array[2, Raw128]](addr outVal)
        let pIn = cast[ptr array[2, Raw128]](a)
        pOut[0] = `altivec`(pIn[0])
        pOut[1] = `altivec`(pIn[1])
        return outVal

      func `op_r512_altivec`(a: ptr `T`): register[64, `T`, Raw512] =
        var outVal: register[64, `T`, Raw512]
        let pOut = cast[ptr array[4, Raw128]](addr outVal)
        let pIn = cast[ptr array[4, Raw128]](a)
        pOut[0] = `altivec`(pIn[0])
        pOut[1] = `altivec`(pIn[1])
        pOut[2] = `altivec`(pIn[2])
        pOut[3] = `altivec`(pIn[3])
        return outVal

    let `op_ppc_128`: proc (a: ptr `T`): register[16, `T`, Raw128] =
      when `hasAltivec`:
        if ALTIVEC: `op_r128_altivec`
        else: `fb`[16, `T`, Raw128]
      else: `fb`[16, `T`, Raw128]

    let `op_ppc_256`: proc (a: ptr `T`): register[32, `T`, Raw256] =
      when `hasAltivec`:
        if ALTIVEC: `op_r256_altivec`
        else: `fb`[32, `T`, Raw256]
      else: `fb`[32, `T`, Raw256]

    let `op_ppc_512`: proc (a: ptr `T`): register[64, `T`, Raw512] =
      when `hasAltivec`:
        if ALTIVEC: `op_r512_altivec`
        else: `fb`[64, `T`, Raw512]
      else: `fb`[64, `T`, Raw512]

    template `opName`*(a: ptr `T`): `r128` =
      when defined(useAltivec):
        cast[`r128`](`op_r128_altivec`(a))
      else:
        cast[`r128`](`op_ppc_128`(a))

    template `opName`*(a: ptr `T`): `r256` =
      when defined(useAltivec):
        cast[`r256`](`op_r256_altivec`(a))
      else:
        cast[`r256`](`op_ppc_256`(a))

    template `opName`*(a: ptr `T`): `r512` =
      when defined(useAltivec):
        cast[`r512`](`op_r512_altivec`(a))
      else:
        cast[`r512`](`op_ppc_512`(a))

proc emitDiffX86(op, T1, T2, T3, sse, avx, avx512, fb: NimNode): NimNode =
  let opName = repr(op)
  let typeName1 = repr(T1)
  let typeName2 = repr(T2)
  let typeName3 = repr(T3)

  template shortTypeMap(typeName: string): string =
    let short = case typeName
    of "float32": "f32"
    of "float64": "f64"
    of "int8": "i8"
    of "int16": "i16"
    of "int32": "i32"
    of "int64": "i64"
    of "uint8": "u8"
    of "uint16": "u16"
    of "uint32": "u32"
    of "uint64": "u64"
    else: typeName
    short

  let short1 = shortTypeMap(typeName1)
  let short2 = shortTypeMap(typeName2)
  let short3 = shortTypeMap(typeName3)

  let r128_1 = ident(short1 & "r128")
  let r256_1 = ident(short1 & "r256")
  let r512_1 = ident(short1 & "r512")

  let r128_2 = ident(short2 & "r128")
  let r256_2 = ident(short2 & "r256")
  let r512_2 = ident(short2 & "r512")

  let r128_3 = ident(short3 & "r128")
  let r256_3 = ident(short3 & "r256")
  let r512_3 = ident(short3 & "r512")

  let op_r128_sse = ident(opName & "_r128_sse")
  let op_r256_sse = ident(opName & "_r256_sse")
  let op_r256_avx = ident(opName & "_r256_avx")
  let op_r512_sse = ident(opName & "_r512_sse")
  let op_r512_avx = ident(opName & "_r512_avx")
  let op_r512_avx512 = ident(opName & "_r512_avx512")

  let op_x86_128 = ident(opName & short & "_x86_128")
  let op_x86_256 = ident(opName & short & "_x86_256")
  let op_x86_512 = ident(opName & short & "_x86_512")

  let hasSSE = not (sse.kind == nnkIdent and $sse == "none")
  let hasAVX = not (avx.kind == nnkIdent and $avx == "none")
  let hasAVX512 = not (avx512.kind == nnkIdent and $avx512 == "none")

  result = quote do:
    type
      Raw128_1 = getRawRegister(`r128_1`)
      Raw256_1 = getRawRegister(`r256_1`)
      Raw512_1 = getRawRegister(`r512_1`)

      Raw128_2 = getRawRegister(`r128_2`)
      Raw256_2 = getRawRegister(`r256_2`)
      Raw512_2 = getRawRegister(`r512_2`)

      Raw128_3 = getRawRegister(`r128_3`)
      Raw256_3 = getRawRegister(`r256_3`)
      Raw512_3 = getRawRegister(`r512_3`)

    when `hasSSE`:
      func `op_r128_sse`(a: register[16, `T1`, Raw128_1], b: register[16, `T2`, Raw128_2]): register[16, `T3`, Raw128_3] =
        return cast[register[16, `T3`, Raw128_3]](
          `sse`(cast[Raw128_1](a), cast[Raw128_2](b))
        )

    when `hasSSE`:
      func `op_r256_sse`(a: ptr `T`): register[32, `T`, Raw256] =
        var outVal: register[32, `T`, Raw256]
        let pOut = cast[ptr array[2, Raw128]](addr outVal)
        let pIn = cast[ptr array[2, Raw128]](a)
        pOut[0] = `sse`(pIn[0])
        pOut[1] = `sse`(pIn[1])
        return outVal

    when `hasAVX`:
      func `op_r256_avx`(a: ptr `T`): register[32, `T`, Raw256] =
        return cast[register[32, `T`, Raw256]](
          `avx`(cast[ptr Raw256](a))
        )

    when `hasSSE`:
      func `op_r512_sse`(a: ptr `T`): register[64, `T`, Raw512] =
        var outVal: register[64, `T`, Raw512]
        let pOut = cast[ptr array[4, Raw128]](addr outVal)
        let pIn = cast[ptr array[4, Raw128]](a)
        pOut[0] = `sse`(pIn[0])
        pOut[1] = `sse`(pIn[1])
        pOut[2] = `sse`(pIn[2])
        pOut[3] = `sse`(pIn[3])
        return outVal

    when `hasAVX`:
      func `op_r512_avx`(a: ptr `T`): register[64, `T`, Raw512] =
        var outVal: register[64, `T`, Raw512]
        let pOut = cast[ptr array[2, Raw256]](addr outVal)
        let pIn = cast[ptr array[2, Raw256]](a)
        pOut[0] = `avx`(pIn[0])
        pOut[1] = `avx`(pIn[1])
        return outVal

    when `hasAVX512`:
      func `op_r512_avx512`(a: ptr `T`): register[64, `T`, Raw512] =
        return cast[register[64, `T`, Raw512]](
          `avx512`(cast[ptr Raw512](a))
        )

    let `op_x86_128`: proc (a: ptr `T`): register[16, `T`, Raw128] =
      when `hasSSE`:
        if SSE: `op_r128_sse`
        else: `fb`[16, `T`, Raw128]
      else:
        `fb`[16, `T`, Raw128]

    let `op_x86_256`: proc (a: ptr `T`): register[32, `T`, Raw256] =
      when `hasAVX` and `hasSSE`:
        if AVX: `op_r256_avx`
        elif `hasSSE` and SSE: `op_r256_sse`
        else: `fb`[32, `T`, Raw256]
      elif `hasAVX`:
        if AVX: `op_r256_avx`
        else: `fb`[32, `T`, Raw256]
      elif `hasSSE`:
        if SSE: `op_r256_sse`
        else: `fb`[32, `T`, Raw256]
      else:
        `fb`[32, `T`, Raw256]

    let `op_x86_512`: proc (a: ptr `T`): register[64, `T`, Raw512] =
      when `hasAVX512` and `hasAVX` and `hasSSE`:
        if AVX512: `op_r512_avx512`
        elif `hasAVX` and AVX: `op_r512_avx`
        elif `hasSSE` and SSE: `op_r512_sse`
        else: `fb`[64, `T`, Raw512]
      elif `hasAVX512` and `hasAVX`:
        if AVX512: `op_r512_avx512`
        elif `hasAVX` and AVX: `op_r512_avx`
        else: `fb`[64, `T`, Raw512]
      elif `hasAVX512`:
        if AVX512: `op_r512_avx512`
        else: `fb`[64, `T`, Raw512]
      elif `hasAVX` and `hasSSE`:
        if AVX: `op_r512_avx`
        elif SSE: `op_r512_sse`
        else: `fb`[64, `T`, Raw512]
      elif `hasAVX`:
        if AVX: `op_r512_avx`
        else: `fb`[64, `T`, Raw512]
      elif `hasSSE`:
        if SSE: `op_r512_sse`
        else: `fb`[64, `T`, Raw512]
      else:
        `fb`[64, `T`, Raw512]

    template `op`*(a: ptr `T`): `r128` =
      when defined(useSSE):
        cast[`r128`](`op_r128_sse`(a))
      else:
        cast[`r128`](`op_x86_128`(a))

    template `op`*(a: ptr `T`): `r256` =
      when defined(useAVX):
        cast[`r256`](`op_r256_avx`(a))
      elif defined(useSSE):
        cast[`r256`](`op_r256_sse`(a))
      else:
        cast[`r256`](`op_x86_256`(a))

    template `op`*(a: ptr `T`): `r512` =
      when defined(useAVX512):
        cast[`r512`](`op_r512_avx512`(a))
      elif defined(useAVX):
        cast[`r512`](`op_r512_avx`(a))
      elif defined(useSSE):
        cast[`r512`](`op_r512_sse`(a))
      else:
        cast[`r512`](`op_x86_512`(a))

# =============================================================================
# Final generation macro
# =============================================================================

macro generateSimdCode*(): untyped =
  if currentSimdTarget == taUnknown:
    error("Unsupported SIMD target. Use -d:simdTargetX86 / -d:simdTargetArm / -d:simdTargetLoongArch / -d:simdTargetAltivec")

  var combos: seq[Combo] = @[]
  var opsWithAll: seq[string] = @[]

  for _, opTbl in simdRegistry:
    for op, dTbl in opTbl:
      for dtype, _ in dTbl:
        if dtype == "all":
          opsWithAll.addStrUnique(op)
        else:
          combos.addComboUnique(op, dtype)

  for op in opsWithAll:
    for dtype in basicSimdTypes:
      combos.addComboUnique(op, dtype)

  result = newStmtList()

  for combo in combos:
    let op: string = combo.op
    let dtype: string = combo.dtype
    let fb = getExpr("fallback", op, dtype)

    if fb.kind == nnkIdent and $fb == "error":
      let short = case dtype
        of "float32": "f32"
        of "float64": "f64"
        of "int8": "i8"
        of "int16": "i16"
        of "int32": "i32"
        of "int64": "i64"
        of "uint8": "u8"
        of "uint16": "u16"
        of "uint32": "u32"
        of "uint64": "u64"
        else: dtype

      let r128 = ident(short & "r128")
      let r256 = ident(short & "r256")
      let r512 = ident(short & "r512")
      let opIdent = ident(op)
      let T_node = ident(dtype)

      if isMask:
        let maskShort = maskShortName(dtype)
        let mr128 = ident(maskShort & "r128")
        let mr256 = ident(maskShort & "r256")
        let mr512 = ident(maskShort & "r512")
        result.add quote do:
          template `opIdent`*(a, b: `r128`): `mr128` {.error: "Unsupported Operator".} = discard
          template `opIdent`*(a, b: `r256`): `mr256` {.error: "Unsupported Operator".} = discard
          template `opIdent`*(a, b: `r512`): `mr512` {.error: "Unsupported Operator".} = discard
      elif arity == 1:
        result.add quote do:
          template `opIdent`*(a: `r128`): `r128` {.error: "Unsupported Operator".} = discard
          template `opIdent`*(a: `r256`): `r256` {.error: "Unsupported Operator".} = discard
          template `opIdent`*(a: `r512`): `r512` {.error: "Unsupported Operator".} = discard
      elif arity == 0:
        result.add quote do:
          template `opIdent`*(a: ptr `T_node`): `r128` {.error: "Unsupported Operator".} = discard
          template `opIdent`*(a: ptr `T_node`): `r256` {.error: "Unsupported Operator".} = discard
          template `opIdent`*(a: ptr `T_node`): `r512` {.error: "Unsupported Operator".} = discard
      else:
        result.add quote do:
          template `opIdent`*(a, b: `r128`): `r128` {.error: "Unsupported Operator".} = discard
          template `opIdent`*(a, b: `r256`): `r256` {.error: "Unsupported Operator".} = discard
          template `opIdent`*(a, b: `r512`): `r512` {.error: "Unsupported Operator".} = discard
      continue

    if isNoneNode(fb):
      error("fallback is required for SIMD op `" & op & "` / " & dtype)

    let arity = simdArity.getOrDefault(op, 2)
    let isMask = simdMaskOps.hasKey(op)
    let isLoad = op in ["loadU", "loadA"]

    if isMask and arity != 2:
      error("simdMaskInput currently supports only binary operations: `" & op & "`")

    case currentSimdTarget
    of taX86:
      let sse = getExpr("sse", op, dtype)
      let avx = getExpr("avx", op, dtype)
      let avx512 = getExpr("avx512", op, dtype)

      if isLoad:
        result.add emitLoadX86(ident(op), getDTypeNode("sse", op, dtype), sse, avx, avx512, fb)
      elif isMask:
        let mask128 = getExpr("mask128", op, dtype)
        let mask256 = getExpr("mask256", op, dtype)
        result.add emitBinaryMaskX86(op, dtype, sse, avx, avx512, mask128, mask256, fb)
      else:
        let T_node = getDTypeNode("sse", op, dtype)
        if arity == 1:
          result.add emitUnaryX86(ident(op), T_node, sse, avx, avx512, fb)
        else:
          let mask128 = getExpr("mask128", op, dtype)
          let mask256 = getExpr("mask256", op, dtype)
          result.add emitBinaryX86(ident(op), T_node, sse, avx, avx512, mask128, mask256, fb)

    of taArm:
      let neon = getExpr("neon", op, dtype)

      if isLoad:
        result.add emitLoadArm(ident(op), getDTypeNode("neon", op, dtype), neon, fb)
      elif isMask:
        result.add emitBinaryMaskArm(op, dtype, neon, fb)
      else:
        let T_node = getDTypeNode("neon", op, dtype)
        if arity == 1:
          result.add emitUnaryArm(ident(op), T_node, neon, fb)
        elif op in ["shl", "shr"]:
          result.add emitBinaryArmShift(ident(op), T_node, neon, fb)
        else:
          result.add emitBinaryArm(ident(op), T_node, neon, fb)

    of taLoongArch:
      let lsx = getExpr("lsx", op, dtype)
      let lasx = getExpr("lasx", op, dtype)

      if isLoad:
        result.add emitLoadLoongArch(ident(op), getDTypeNode("lsx", op, dtype), lsx, lasx, fb)
      elif isMask:
        result.add emitBinaryMaskLoongArch(op, dtype, lsx, lasx, fb)
      else:
        let T_node = getDTypeNode("lsx", op, dtype)
        if arity == 1:
          result.add emitUnaryLoongArch(ident(op), T_node, lsx, lasx, fb)
        else:
          result.add emitBinaryLoongArch(ident(op), T_node, lsx, lasx, fb)

    of taAltivec:
      let altivec = getExpr("altivec", op, dtype)

      if isLoad:
        result.add emitLoadPPC(ident(op), getDTypeNode("altivec", op, dtype), altivec, fb)
      elif isMask:
        result.add emitBinaryMaskPPC(op, dtype, altivec, fb)
      else:
        let T_node = getDTypeNode("altivec", op, dtype)
        if arity == 1:
          result.add emitUnaryPPC(ident(op), T_node, altivec, fb)
        else:
          result.add emitBinaryPPC(ident(op), T_node, altivec, fb)

    of taUnknown:
      error("unreachable")

proc typeGen(name, op, C, T: NimNode): NimNode =
  let a = ident("a")
  let b = ident("b")
  result = newProc(
    name = name,
    params = [T, newIdentDefs(a, C), newIdentDefs(b, C)],
    body = newStmtList(
      newNimNode(nnkReturnStmt).add(
        newCall(op,
          newNimNode(nnkCast).add(T, a),
          newNimNode(nnkCast).add(T, b)
        )
      )
    )
  )

proc maskGen(name, op, C1, C2, T1, T2: NimNode): NimNode =
  let a = ident("a")
  let b = ident("b")
  let mask = ident("mask")
  let realMask = ident("realMask")
  result = newProc(
    name = name,
    params = [C2, newIdentDefs(a, C1), newIdentDefs(b, C1), newIdentDefs(mask, ident("Mask"))],
    body = newStmtList(
      newConstStmt(realMask, newCall(ident("getMask"), newCall(ident("sizeof"), C2), T2)),
      newNimNode(nnkReturnStmt).add(
        newCall(op, realMask,
          newNimNode(nnkCast).add(C2, a),
          newNimNode(nnkCast).add(C2, b)
        )
      )
    )
  )

proc typeOneGen(name, op, C, T: NimNode): NimNode =
  let a = ident("a")
  result = newProc(
    name = name,
    params = [T, newIdentDefs(a, C)],
    body = newStmtList(
      newNimNode(nnkReturnStmt).add(
        newCall(op,
          newNimNode(nnkCast).add(T, a)
        )
      )
    )
  )

proc maskOneGen(name, op, C1, C2, T1, T2: NimNode): NimNode =
  let a = ident("a")
  let mask = ident("mask")
  let realMask = ident("realMask")
  result = newProc(
    name = name,
    params = [C2, newIdentDefs(a, C1), newIdentDefs(mask, ident("Mask"))],
    body = newStmtList(
      newConstStmt(realMask, newCall(ident("getMask"), newCall(ident("sizeof"), C2), T2)),
      newNimNode(nnkReturnStmt).add(
        newCall(op, realMask,
          newNimNode(nnkCast).add(C2, a)
        )
      )
    )
  )

macro opOneGen(op, T, code: untyped): untyped =
  result = quote do:
    func `op`(a: `T`): `T` =
      `code`

macro opTwoGen(op, T, code: untyped): untyped =
  result = quote do:
    func `op`(a, b: `T`): `T` =
      `code`

macro opTwoDiffGen(op, T1, T2, T3, code: untyped): untyped =
  result = quote do:
    func `op`(a: `T1`, b: `T2`): `T3` =
      `code`

macro opLoadGen(op, S, T, code: untyped): untyped =
  result = quoted do:
    func `op`(a: `S`): `T` =
      `code`

#[
template typeGen(name, op, C, T: untyped): NimNode =
  var output: NimNode = quote do:
    func `name`(a, b: `C`): `T` =
      return `op`(cast[`T`](a), cast[`T`](b))
  output

template maskGen(name, op, C1, C2, T1, T2: untyped): NimNode =
  type Mask = getMaskType(sizeof(C1), T1)

  var output: NimNode = quote do:
    func `name`(a, b: `C1`, mask: `Mask`): `C2` =
      const realMask = getMask(sizeof(`C2`), `T2`)
      return `op`(realMask, cast[`C2`](a), cast[`C2`](b))
  output
]#

func add_generic_fallback[S: static int; T; V](a, b: register[S, T, V]): register[S, T, V] =
  var output: register[S, T, V]
  const unitLen: int = S div sizeof(T)
  let pOutput: ptr array[unitLen, T] = cast[ptr array[unitLen, T]](addr output)
  let pA: ptr array[unitLen, T] = cast[ptr array[unitLen, T]](addr a)
  let pB: ptr array[unitLen, T] = cast[ptr array[unitLen, T]](addr b)

  unroll(i, 0, unitLen - 1):
    pOutput[i] = pA[i] + pB[i]

  output

func sub_generic_fallback[S: static int; T; V](a, b: register[S, T, V]): register[S, T, V] =
  var output: register[S, T, V]
  const unitLen: int = S div sizeof(T)
  let pOutput: ptr array[unitLen, T] = cast[ptr array[unitLen, T]](addr output)
  let pA: ptr array[unitLen, T] = cast[ptr array[unitLen, T]](addr a)
  let pB: ptr array[unitLen, T] = cast[ptr array[unitLen, T]](addr b)

  unroll(i, 0, unitLen - 1):
    pOutput[i] = pA[i] - pB[i]

  output

func mul_generic_fallback[S: static int; T; V](a, b: register[S, T, V]): register[S, T, V] =
  var output: register[S, T, V]
  const unitLen: int = S div sizeof(T)
  let pOutput: ptr array[unitLen, T] = cast[ptr array[unitLen, T]](addr output)
  let pA: ptr array[unitLen, T] = cast[ptr array[unitLen, T]](addr a)
  let pB: ptr array[unitLen, T] = cast[ptr array[unitLen, T]](addr b)

  unroll(i, 0, unitLen - 1):
    pOutput[i] = pA[i] * pB[i]

  output

func and_generic_fallback[S: static int; T; V](a, b: register[S, T, V]): register[S, T, V] =
  var output: register[S, T, V]
  const unitLen: int = S div CPUBytes
  let pOutput: ptr array[unitLen, UINT] = cast[ptr array[unitLen, UINT]](addr output)
  let pA: ptr array[unitLen, UINT] = cast[ptr array[unitLen, UINT]](addr a)
  let pB: ptr array[unitLen, UINT] = cast[ptr array[unitLen, UINT]](addr b)

  unroll(i, 0, unitLen - 1):
    pOutput[i] = pA[i] and pB[i]

  output

func or_generic_fallback[S: static int; T; V](a, b: register[S, T, V]): register[S, T, V] =
  var output: register[S, T, V]
  const unitLen: int = S div CPUBytes
  let pOutput: ptr array[unitLen, UINT] = cast[ptr array[unitLen, UINT]](addr output)
  let pA: ptr array[unitLen, UINT] = cast[ptr array[unitLen, UINT]](addr a)
  let pB: ptr array[unitLen, UINT] = cast[ptr array[unitLen, UINT]](addr b)

  unroll(i, 0, unitLen - 1):
    pOutput[i] = pA[i] or pB[i]

  output

func xor_generic_fallback[S: static int; T; V](a, b: register[S, T, V]): register[S, T, V] =
  var output: register[S, T, V]
  const unitLen: int = S div CPUBytes
  let pOutput: ptr array[unitLen, UINT] = cast[ptr array[unitLen, UINT]](addr output)
  let pA: ptr array[unitLen, UINT] = cast[ptr array[unitLen, UINT]](addr a)
  let pB: ptr array[unitLen, UINT] = cast[ptr array[unitLen, UINT]](addr b)

  unroll(i, 0, unitLen - 1):
    pOutput[i] = pA[i] xor pB[i]

  output

func not_generic_fallback[S: static int; T; V](a: register[S, T, V]): register[S, T, V] =
  var output: register[S, T, V]
  const unitLen: int = S div CPUBytes
  let pOutput: ptr array[unitLen, UINT] = cast[ptr array[unitLen, UINT]](addr output)
  let pA: ptr array[unitLen, UINT] = cast[ptr array[unitLen, UINT]](addr a)

  unroll(i, 0, unitLen - 1):
    pOutput[i] = not pA[i]

  output

func nand_generic_fallback[S: static int; T; V](a, b: register[S, T, V]): register[S, T, V] =
  var output: register[S, T, V]
  const unitLen: int = S div CPUBytes
  let pOutput: ptr array[unitLen, UINT] = cast[ptr array[unitLen, UINT]](addr output)
  let pA: ptr array[unitLen, UINT] = cast[ptr array[unitLen, UINT]](addr a)
  let pB: ptr array[unitLen, UINT] = cast[ptr array[unitLen, UINT]](addr b)

  unroll(i, 0, unitLen - 1):
    pOutput[i] = not (pA[i] and pB[i])

  output

func nor_generic_fallback[S: static int; T; V](a, b: register[S, T, V]): register[S, T, V] =
  var output: register[S, T, V]
  const unitLen: int = S div CPUBytes
  let pOutput: ptr array[unitLen, UINT] = cast[ptr array[unitLen, UINT]](addr output)
  let pA: ptr array[unitLen, UINT] = cast[ptr array[unitLen, UINT]](addr a)
  let pB: ptr array[unitLen, UINT] = cast[ptr array[unitLen, UINT]](addr b)

  unroll(i, 0, unitLen - 1):
    pOutput[i] = not (pA[i] or pB[i])

  output

func nxor_generic_fallback[S: static int; T; V](a, b: register[S, T, V]): register[S, T, V] =
  var output: register[S, T, V]
  const unitLen: int = S div CPUBytes
  let pOutput: ptr array[unitLen, UINT] = cast[ptr array[unitLen, UINT]](addr output)
  let pA: ptr array[unitLen, UINT] = cast[ptr array[unitLen, UINT]](addr a)
  let pB: ptr array[unitLen, UINT] = cast[ptr array[unitLen, UINT]](addr b)

  unroll(i, 0, unitLen - 1):
    pOutput[i] = not (pA[i] xor pB[i])

  output

func andnot_generic_fallback[S: static int; T; V](a, b: register[S, T, V]): register[S, T, V] =
  var output: register[S, T, V]
  const unitLen: int = S div CPUBytes
  let pOutput: ptr array[unitLen, UINT] = cast[ptr array[unitLen, UINT]](addr output)
  let pA: ptr array[unitLen, UINT] = cast[ptr array[unitLen, UINT]](addr a)
  let pB: ptr array[unitLen, UINT] = cast[ptr array[unitLen, UINT]](addr b)

  unroll(i, 0, unitLen - 1):
    pOutput[i] = (not pA[i]) and pB[i]

  output

func ornot_generic_fallback[S: static int; T; V](a, b: register[S, T, V]): register[S, T, V] =
  var output: register[S, T, V]
  const unitLen: int = S div CPUBytes
  let pOutput: ptr array[unitLen, UINT] = cast[ptr array[unitLen, UINT]](addr output)
  let pA: ptr array[unitLen, UINT] = cast[ptr array[unitLen, UINT]](addr a)
  let pB: ptr array[unitLen, UINT] = cast[ptr array[unitLen, UINT]](addr b)

  unroll(i, 0, unitLen - 1):
    pOutput[i] = (not pA[i]) or  pB[i]

  output

func shl_generic_fallback[S: static int; T1, T2; V](a: register[S, T1, V], b: register[S, T2, V]): register[S, T1, V] =
  var output: register[S, T1, V]
  const unitLen: int = S div sizeof(T1)
  static doAssert sizeof(T1) == sizeof(T2)
  let pOutput: ptr array[unitLen, T1] = cast[ptr array[unitLen, T1]](addr output)
  let pA: ptr array[unitLen, T1] = cast[ptr array[unitLen, T1]](addr a)
  let pB: ptr array[unitLen, T2] = cast[ptr array[unitLen, T2]](addr b)

  unroll(i, 0, unitLen - 1):
    pOutput[i] = pA[i] shl pB[i]

  output

func shr_generic_fallback[S: static int; T1, T2; V](a: register[S, T1, V], b: register[S, T2, V]): register[S, T1, V] =
  var output: register[S, T1, V]
  const unitLen: int = S div sizeof(T1)
  static doAssert sizeof(T1) == sizeof(T2)
  let pOutput: ptr array[unitLen, T1] = cast[ptr array[unitLen, T1]](addr output)
  let pA: ptr array[unitLen, T1] = cast[ptr array[unitLen, T1]](addr a)
  let pB: ptr array[unitLen, T2] = cast[ptr array[unitLen, T2]](addr b)

  unroll(i, 0, unitLen - 1):
    pOutput[i] = pA[i] shr pB[i]

  output

func abs_generic_fallback[S: static int; T; V](a: register[S, T, V]): register[S, T, V] =
  var output: register[S, T, V]
  const unitLen: int = S div sizeof(T)
  let pOutput: ptr array[unitLen, T] = cast[ptr array[unitLen, T]](addr output)
  let pA: ptr array[unitLen, T] = cast[ptr array[unitLen, T]](addr a)

  unroll(i, 0, unitLen - 1):
    when T is UnsignInteger:
      pOutput[i] = pA[i]
    else:
      pOutput[i] = abs(pA[i])

  output

# fallback
simdInput("fallback"):
  `+`:
    all: add_generic_fallback
  `-`:
    all: sub_generic_fallback
  `*`:
    all: mul_generic_fallback
  `and`:
    all: and_generic_fallback
  `or`:
    all: or_generic_fallback
  `xor`:
    all: xor_generic_fallback
  `not`:
    all: not_generic_fallback
  `nand`:
    all: nand_generic_fallback
  `nor`:
    all: nor_generic_fallback
  `nxor`:
    all: nxor_generic_fallback
  `andnot`:
    all: andnot_generic_fallback
  `ornot`:
    all: ornot_generic_fallback
  `shl`:
    all: shl_generic_fallback
  `shr`:
    all: shr_generic_fallback
  `abs`:
    all: abs_generic_fallaback

macro nandX86Gen(set_inst, and_inst, xor_inst, T: untyped): untyped =
  result = quote do:
    let allOnes = `set_inst`(-1)
    let andRes = `and_inst`(cast[`T`](a), cast[`T`](b))
    return `xor_inst`(andRes, cast[`T`](allOnes))

macro norX86Gen(set_inst, or_inst, xor_inst, T: untyped): untyped =
  result = quote do:
    let allOnes = `set_inst`(-1)
    let orRes = `or_inst`(cast[`T`](a), cast[`T`](b))
    return `xor_inst`(orRes, cast[`T`](allOnes))

macro nxorX86Gen(set_inst, xor_inst, T: untyped): untyped =
  result = quote do:
    let allOnes = `set_inst`(-1)
    let xorRes = `xor_inst`(cast[`T`](a), cast[`T`](b))
    return `xor_inst`(xorRes, cast[`T`](allOnes))

macro andnotX86Gen(andnot_inst: untyped): untyped =
  result = quote do:
    return `andnot_inst`(b, a)

macro ornotX86Gen(set_inst, or_inst, xor_inst, T: untyped): untyped =
  result = quote do:
    let allOnes = `set_inst`(-1)
    let notRes = `xor_inst`(cast[`T`](b), cast[`T`](allOnes))
    return `or_inst`(cast[`T`](a), notRes)

macro shlX86Gen(unpacklo_inst, unpackhi_inst, sll_inst, and_inst, set1_inst, pack_inst, T: untyped): untyped =
  result = quote do:
    let zero = `set1_inst`(0)
    let lo = `unpacklo_inst`(cast[`T`](a), zero)
    let hi = `unpackhi_inst`(cast[`T`](a), zero)
    let mask = `set1_inst`(0xFF'i32 shl b)
    let loShifted = `and_inst`(`sll_inst`(lo, b), mask)
    let hiShifted = `and_inst`(`sll_inst`(hi, b), mask)
    return `pack_inst`(loShifted, hiShifted)

macro shrX86Gen(unpacklo_inst, unpackhi_inst, srl_inst, and_inst, set1_inst, pack_inst, T: untyped): untyped =
  result = quote do:
    let zero = `set1_inst`(0)
    let lo = `unpacklo_inst`(cast[`T`](a), zero)
    let hi = `unpackhi_inst`(cast[`T`](a), zero)
    let mask = `set1_inst`(0xFF'i32 shl b)
    let loShifted = `and_inst`(`srl_inst`(lo, b), mask)
    let hiShifted = `and_inst`(`srl_inst`(hi, b), mask)
    return `pack_inst`(loShifted, hiShifted)

macro absFloatX86Gen(set_sign_inst, signVal, andnot_inst, T: untyped): untyped =
  result = quote do:
    let signMask = `set_sign_inst`(`signVal`)
    return `andnot_inst`(signMask, cast[`T`](a))

macro absIntX86Gen(setzero_inst, cmpgt_inst, xor_inst, sub_inst, T: untyped): untyped =
  result = quote do:
    let x = cast[`T`](a)
    let zero = `setzero_inst`()
    let mask = `cmpgt_inst`(zero, x)
    let y = `xor_inst`(x, mask)
    return `sub_inst`(y, mask)

macro absInt64X86Gen(srli64_inst, setzero_inst, sub_inst, xor_inst, T: untyped): untyped =
  let zero = `setzero_inst`()
  let diff = `sub_inst`(cast[`T`](a), zero)
  let sign = `srli64_inst`(diff, 63)
  let mask = `sub_inst`(zero, sign)
  let y = `xor-inst`(x, mask)
  return `sub_inst`(y, mask)

macro absUintX86Gen(): untyped =
  result = quote do:
    return a

macro notX86Gen(xor_inst, set_inst, T: untyped): untyped =
  result = quote do:
    let allOnes = `set_inst`(-1)
    return `xor_inst`(cast[`T`](a), cast[`T`](allOnes))

macro cmpltIntX86Gen(sub_inst, xor_inst, and_inst, srai_inst: untyped, shift: static int, T: untyped): untyped =
  result = quote do:
    let va = cast[`T`](a)
    let vb = cast[`T`](b)

    let d = `sub_inst`(va, vb)

    let sign_bit = `srli_inst`(d, `shift`)

    let a_xor_b = `xor_inst`(va, vb)
    let a_xor_d = `xor_inst`(va, d)
    let ov_raw = `and_inst`(a_xor_b, a_xor_d)
    let ov_bit = `srli_inst`(ov_raw, `shift`)

    let lt_bit = `xor_inst`(sign_bit, ov_bit)

    let zero = `xor_inst`(va, va)

    return `sub_inst`(zero, lt_bit)

macro cmpgtIntX86Gen(sub_inst, xor_inst, and_inst, srli_inst: untyped, shift: static int, T: untyped): untyped =
  result = quote do:
    let va = cast[`T`](a)
    let vb = cast[`T`](b)

    let d = `sub_inst`(vb, va)

    let sign_bit = `srli_inst`(d, `shift`)

    let b_xor_a = `xor_inst`(vb, va)
    let b_xor_d = `xor_inst`(vb, d)
    let ov_raw = `and_inst`(b_xor_a, b_xor_d)
    let ov_bit = `srli_inst`(ov_raw, `shift`)

    let gt_bit = `xor_inst`(sign_bit, ov_bit)

    let zero = `xor_inst`(va, va)

    return `sub_inst`(zero, gt_bit)

macro cmpltSubUintX86Gen(sub_inst, xor_inst, and_inst, or_inst, srai_inst, set_allones_inst: untyped, shift: static int, T: untyped): untyped =
  result = quote do:
    let va = cast[`T`](a)
    let vb = cast[`T`](b)

    let d = `sub_inst`(va, vb)

    let allOnes = `set_allones_inst`(-1)

    let not_a = `xor_inst`(va, allOnes)
    let term1 = `and_inst`(not_a, vb)

    let a_xor_b = `xor_inst`(va, vb)
    let not_axb = `xor_inst`(a_xor_b, allOnes)
    let term2 = `and_inst`(not_axb, d)

    let borrow_raw = `or_inst`(term1, term2)
    let borrow_bit = `srli_inst`(borrow_raw, `shift`)

    let zero = `xor_inst`(va, va)

    return `sub_inst`(zero, borrow_bit)

macro cmpgtSubUintX86Gen(sub_inst, xor_inst, and_inst, or_inst, srli_inst, set_allones_inst: untyped, shift: static int, T: untyped): untyped =
  result = quote do:
    let va = cast[`T`](a)
    let vb = cast[`T`](b)

    let d = `sub_inst`(vb, va)

    let allOnes = `set_allones_inst`(-1)

    let not_b = `xor_inst`(vb, allOnes)
    let term1 = `and_inst`(not_b, va)

    let b_xor_a = `xor_inst`(vb, va)
    let not_bxa = `xor_inst`(b_xor_a, allOnes)
    let term2 = `and_inst`(not_bxa, d)

    let borrow_raw = `or_inst`(term1, term2)
    let borrow_bit = `srli_inst`(borrow_raw, `shift`)

    let zero = `xor_inst`(va, va)

    return `sub_inst`(zero, borrow_bit)

macro cmpltUintX86Gen(cmplt_inst, xor_inst, set_bias_inst, bias_val, T: untyped): untyped =
  result = quote do:
    let va = cast[`T`](a)
    let vb = cast[`T`](b)
    let bias = `set_bias_inst`(`bias_val`)
    let xa = `xor_inst`(va, bias)
    let xb = `xor_inst`(vb, bias)
    return `cmplt_inst`(xa, xb)

macro cmpgtUintX86Gen(cmpgt_inst, xor_inst, set_bias_inst, bias_val, T: untyped): untyped =
  result = quote do:
    let va = cast[`T`](a)
    let vb = cast[`T`](b)
    let bias = `set_bias_inst`(`bias_val`)
    let xa = `xor_inst`(va, bias)
    let xb = `xor_inst`(vb, bias)
    return `cmpgt_inst`(xa, xb)

macro cmpeqX86Gen(sub_inst, cmpeq_inst, setzero_inst, T: untyped): untyped =
  result = quote do:
    let d = `sub_inst`(cast[`T`](a), cast[`T`](b))
    let zero = `setzero_inst`()
    return `cmpeq_inst`(d, zero)

macro cmpleSubIntX86Gen(sub_inst, xor_inst, and_inst, srli_inst, set_allones_inst: untyped, shift: static int, T: untyped): untyped =
  result = quote do:
    let va = cast[`T`](a)
    let vb = cast[`T`](b)
    let d = `sub_inst`(vb, va)
    let sign_bit = `srli_inst`(d, `shift`)
    let b_xor_a = `xor_inst`(vb, va)
    let b_xor_d = `xor_inst`(vb, d)
    let ov_raw = `and_inst`(b_xor_a, b_xor_d)
    let ov_bit = `srli_inst`(ov_raw, `shift`)
    let lt_bit = `xor_inst`(sign_bit, ov_bit)
    let zero = `xor_inst`(va, va)
    let gt_mask = `sub_inst`(zero, lt_bit)
    let allOnes = `set_allones_inst`(-1)
    return `xor_inst`(gt_mask, allOnes)

macro cmpgeSubIntX86Gen(sub_inst, xor_inst, and_inst, srli_inst, set_allones_inst: untyped, shift: static int, T: untyped): untyped =
  result = quote do:
    let va = cast[`T`](a)
    let vb = cast[`T`](b)
    let d = `sub_inst`(va, vb)
    let sign_bit = `srli_inst`(d, `shift`)
    let a_xor_b = `xor_inst`(va, vb)
    let a_xor_d = `xor_inst`(va, d)
    let ov_raw = `and_inst`(a_xor_b, a_xor_d)
    let ov_bit = `srli_inst`(ov_raw, `shift`)
    let lt_bit = `xor_inst`(sign_bit, ov_bit)
    let zero = `xor_inst`(va, va)
    let lt_mask = `sub_inst`(zero, lt_bit)
    let allOnes = `set_allones_inst`(-1)
    return `xor_inst`(lt_mask, allOnes)

macro cmpleSubUintX86Gen(sub_inst, xor_inst, and_inst, or_inst, srli_inst, set_allones_inst: untyped, shift: static int, T: untyped): untyped =
  result = quote do:
    let va = cast[`T`](a)
    let vb = cast[`T`](b)
    let d = `sub_inst`(vb, va)
    let allOnes = `set_allones_inst`(-1)
    let not_b = `xor_inst`(vb, allOnes)
    let term1 = `and_inst`(not_b, va)
    let b_xor_a = `xor_inst`(vb, va)
    let not_bxa = `xor_inst`(b_xor_a, allOnes)
    let term2 = `and_inst`(not_bxa, d)
    let borrow_raw = `or_inst`(term1, term2)
    let borrow_bit = `srli_inst`(borrow_raw, `shift`)
    let zero = `xor_inst`(va, va)
    let gt_mask = `sub_inst`(zero, borrow_bit)
    return `xor_inst`(gt_mask, allOnes)

macro cmpgeSubUintX86Gen(sub_inst, xor_inst, and_inst, or_inst, srli_inst, set_allones_inst: untyped, shift: static int, T: untyped): untyped =
  result = quote do:
    let va = cast[`T`](a)
    let vb = cast[`T`](b)
    let d = `sub_inst`(va, vb)
    let allOnes = `set_allones_inst`(-1)
    let not_a = `xor_inst`(va, allOnes)
    let term1 = `and_inst`(not_a, vb)
    let a_xor_b = `xor_inst`(va, vb)
    let not_axb = `xor_inst`(a_xor_b, allOnes)
    let term2 = `and_inst`(not_axb, d)
    let borrow_raw = `or_inst`(term1, term2)
    let borrow_bit = `srli_inst`(borrow_raw, `shift`)
    let zero = `xor_inst`(va, va)
    let lt_mask = `sub_inst`(zero, borrow_bit)
    return `xor_inst`(lt_mask, allOnes)

macro cmpleIntX86Gen(cmpgt_inst, xor_inst, set_allones_inst, T: untyped): untyped =
  result = quote do:
    let mask = `cmpgt_inst`(cast[`T`](a), cast[`T`](b))
    let allOnes = `set_allones_inst`(-1)
    return `xor_inst`(mask, allOnes)

macro cmpgeIntX86Gen(cmplt_inst, xor_inst, set_allones_inst, T: untyped): untyped =
  result = quote do:
    let mask = `cmplt_inst`(cast[`T`](a), cast[`T`](b))
    let allOnes = `set_allones_inst`(-1)
    return `xor_inst`(mask, allOnes)

macro cmpleUintX86Gen(cmpgt_inst, xor_inst, set_bias_inst, bias_val, set_allones_inst, T: untyped): untyped =
  result = quote do:
    let va = cast[`T`](a)
    let vb = cast[`T`](b)
    let bias = `set_bias_inst`(`bias_val`)
    let xa = `xor_inst`(va, bias)
    let xb = `xor_inst`(vb, bias)
    let mask = `cmpgt_inst`(xa, xb)
    let allOnes = `set_allones_inst`(-1)
    return `xor_inst`(mask, allOnes)

macro cmpgeUintX86Gen(cmplt_inst, xor_inst, set_bias_inst, bias_val, set_allones_inst, T: untyped): untyped =
  result = quote do:
    let va = cast[`T`](a)
    let vb = cast[`T`](b)
    let bias = `set_bias_inst`(`bias_val`)
    let xa = `xor_inst`(va, bias)
    let xb = `xor_inst`(vb, bias)
    let mask = `cmplt_inst`(xa, xb)
    let allOnes = `set_allones_inst`(-1)
    return `xor_inst`(mask, allOnes)

macro cmpneqSubX86Gen(sub_inst, cmpeq_inst, xor_inst, set_allones_inst, T: untyped): untyped =
  result = quote do:
    let d = `sub_inst`(cast[`T`](a), cast[`T`](b))
    let zero = `xor_inst`(d, d)
    let eq_mask = `cmpeq_inst`(d, zero)
    let allOnes = `set_allones_inst`(-1)
    return `xor_inst`(eq_mask, allOnes)

# x86: SSE
simdInput("sse"):
  `+`:
    float32: mm_add_ps
    float64: mm_add_pd
    int8: mm_add_epi8
    int16: mm_add_epi16
    int32: mm_add_epi32
    int64: mm_add_epi64
    uint8: mm_add_epi8
    uint16: mm_add_epi16
    uint32: mm_add_epi32
    uint64: mm_add_epi64
  `-`:
    float32: mm_sub_ps
    float64: mm_sub_pd
    int8: mm_sub_epi8
    int16: mm_sub_epi16
    int32: mm_sub_epi32
    int64: mm_sub_epi64
    uint8: mm_sub_epi8
    uint16: mm_sub_epi16
    uint32: mm_sub_epi32
    uint64: mm_sub_epi64
  `*`:
    float32: mm_mul_ps
    float64: mm_mul_pd
    int8: none
    int16: mm_mullo_epi16
    int32: mm_mullo_epi32
    int64: none
    uint8: none
    uint16: mm_mullo_epi16
    uint32: mm_mullo_epi32
    uint64: none
  `and`:
    float32: mm_and_ps
    float64: mm_and_pd
    int8: mm_and_si128
    int16: mm_and_si128
    int32: mm_and_si128
    int64: mm_and_si128
    uint8: mm_and_si128
    uint16: mm_and_si128
    uint32: mm_and_si128
    uint64: mm_and_si128
  `or`:
    float32: mm_or_ps
    float64: mm_or_pd
    int8: mm_or_si128
    int16: mm_or_si128
    int32: mm_or_si128
    int64: mm_or_si128
    uint8: mm_or_si128
    uint16: mm_or_si128
    uint32: mm_or_si128
    uint64: mm_or_si128
  `xor`:
    float32: mm_xor_ps
    float64: mm_xor_pd
    int8: mm_xor_si128
    int16: mm_xor_si128
    int32: mm_xor_si128
    int64: mm_xor_si128
    uint8: mm_xor_si128
    uint16: mm_xor_si128
    uint32: mm_xor_si128
    uint64: mm_xor_si128
  `nand`:
    float32: opTwoGen(nand_sse_f32, sse.M128, nandX86Gen(mm_set1_epi32, mm_and_ps, mm_xor_ps, sse.M128))
    float64: opTwoGen(nand_sse_f64, sse2.M128d, nandX86Gen(mm_set1_epi32, mm_and_pd, mm_xor_pd, sse2.M128d))
    int8: opTwoGen(nand_sse_i8, sse2.M128i, nandX86Gen(mm_set1_epi32, mm_and_si128, mm_xor_si128, sse2.M128i))
    int16: opTwoGen(nand_sse_i16, sse2.M128i, nandX86Gen(mm_set1_epi32, mm_and_si128, mm_xor_si128, sse2.M128i))
    int32: opTwoGen(nand_sse_i32, sse2.M128i, nandX86Gen(mm_set1_epi32, mm_and_si128, mm_xor_si128, sse2.M128i))
    int64: opTwoGen(nand_sse_i64, sse2.M128i, nandX86Gen(mm_set1_epi32, mm_and_si128, mm_xor_si128, sse2.M128i))
    uint8: opTwoGen(nand_sse_u8, sse2.M128i, nandX86Gen(mm_set1_epi32, mm_and_si128, mm_xor_si128, sse2.M128i))
    uint16: opTwoGen(nand_sse_u16, sse2.M128i, nandX86Gen(mm_set1_epi32, mm_and_si128, mm_xor_si128, sse2.M128i))
    uint32: opTwoGen(nand_sse_u32, sse2.M128i, nandX86Gen(mm_set1_epi32, mm_and_si128, mm_xor_si128, sse2.M128i))
    uint64: opTwoGen(nand_sse_u64, sse2.M128i, nandX86Gen(mm_set1_epi32, mm_and_si128, mm_xor_si128, sse2.M128i))
  `nor`:
    float32: opTwoGen(nor_sse_f32, sse.M128, norX86Gen(mm_set1_epi32, mm_or_ps, mm_xor_ps, sse.M128))
    float64: opTwoGen(nor_sse_f64, sse2.M128d, norX86Gen(mm_set1_epi32, mm_or_pd, mm_xor_pd, sse2.M128d))
    int8: opTwoGen(nor_sse_i8, sse2.M128i, norX86Gen(mm_set1_epi32, mm_or_si128, mm_xor_si128, sse2.M128i))
    int16: opTwoGen(nor_sse_i16, sse2.M128i, norX86Gen(mm_set1_epi32, mm_or_si128, mm_xor_si128, sse2.M128i))
    int32: opTwoGen(nor_sse_i32, sse2.M128i, norX86Gen(mm_set1_epi32, mm_or_si128, mm_xor_si128, sse2.M128i))
    int64: opTwoGen(nor_sse_i64, sse2.M128i, norX86Gen(mm_set1_epi32, mm_or_si128, mm_xor_si128, sse2.M128i))
    uint8: opTwoGen(nor_sse_u8, sse2.M128i, norX86Gen(mm_set1_epi32, mm_or_si128, mm_xor_si128, sse2.M128i))
    uint16: opTwoGen(nor_sse_u16, sse2.M128i, norX86Gen(mm_set1_epi32, mm_or_si128, mm_xor_si128, sse2.M128i))
    uint32: opTwoGen(nor_sse_u32, sse2.M128i, norX86Gen(mm_set1_epi32, mm_or_si128, mm_xor_si128, sse2.M128i))
    uint64: opTwoGen(nor_sse_u64, sse2.M128i, norX86Gen(mm_set1_epi32, mm_or_si128, mm_xor_si128, sse2.M128i))
  `nxor`:
    float32: opTwoGen(nxor_sse_f32, sse.M128, nxorX86Gen(mm_set1_epi32, mm_xor_ps, sse.M128))
    float64: opTwoGen(nxor_sse_f64, sse2.M128d, nxorX86Gen(mm_set1_epi32, mm_xor_pd, sse2.M128d))
    int8: opTwoGen(nxor_sse_i8, sse2.M128i, nxorX86Gen(mm_set1_epi32, mm_xor_si128, sse2.M128i))
    int16: opTwoGen(nxor_sse_i16, sse2.M128i, nxorX86Gen(mm_set1_epi32, mm_xor_si128, sse2.M128i))
    int32: opTwoGen(nxor_sse_i32, sse2.M128i, nxorX86Gen(mm_set1_epi32, mm_xor_si128, sse2.M128i))
    int64: opTwoGen(nxor_sse_i64, sse2.M128i, nxorX86Gen(mm_set1_epi32, mm_xor_si128, sse2.M128i))
    uint8: opTwoGen(nxor_sse_u8, sse2.M128i, nxorX86Gen(mm_set1_epi32, mm_xor_si128, sse2.M128i))
    uint16: opTwoGen(nxor_sse_u16, sse2.M128i, nxorX86Gen(mm_set1_epi32, mm_xor_si128, sse2.M128i))
    uint32: opTwoGen(nxor_sse_u32, sse2.M128i, nxorX86Gen(mm_set1_epi32, mm_xor_si128, sse2.M128i))
    uint64: opTwoGen(nxor_sse_u64, sse2.M128i, nxorX86Gen(mm_set1_epi32, mm_xor_si128, sse2.M128i))
  `andnot`:
    float32: opTwoGen(andnot_sse_f32, sse.M128, andnotX86Gen(mm_andnot_ps))
    float64: opTwoGen(andnot_sse_f64, sse2.M128d, andnotX86Gen(mm_andnot_pd))
    int8: opTwoGen(andnot_sse_i8, sse2.M128i, andnotX86Gen(mm_andnot_si128))
    int16: opTwoGen(andnot_sse_i16, sse2.M128i, andnotX86Gen(mm_andnot_si128))
    int32: opTwoGen(andnot_sse_i32, sse2.M128i, andnotX86Gen(mm_andnot_si128))
    int64: opTwoGen(andnot_sse_i64, sse2.M128i, andnotX86Gen(mm_andnot_si128))
    uint8: opTwoGen(andnot_sse_u8, sse2.M128i, andnotX86Gen(mm_andnot_si128))
    uint16: opTwoGen(andnot_sse_u16, sse2.M128i, andnotX86Gen(mm_andnot_si128))
    uint32: opTwoGen(andnot_sse_u32, sse2.M128i, andnotX86Gen(mm_andnot_si128))
    uint64: opTwoGen(andnot_sse_u64, sse2.M128i, andnotX86Gen(mm_andnot_si128))
  `ornot`:
    float32: opTwoGen(ornot_sse_f32, sse.M128, ornotX86Gen(mm_set1_epi32, mm_or_ps, mm_xor_ps, sse.M128))
    float64: opTwoGen(ornot_sse_f64, sse2.M128d, ornotX86Gen(mm_set1_epi32, mm_or_pd, mm_xor_pd, sse2.M128d))
    int8: opTwoGen(ornot_sse_i8, sse2.M128i, ornotX86Gen(mm_set1_epi32, mm_or_si128, mm_xor_si128, sse2.M128i))
    int16: opTwoGen(ornot_sse_i16, sse2.M128i, ornotX86Gen(mm_set1_epi32, mm_or_si128, mm_xor_si128, sse2.M128i))
    int32: opTwoGen(ornot_sse_i32, sse2.M128i, ornotX86Gen(mm_set1_epi32, mm_or_si128, mm_xor_si128, sse2.M128i))
    int64: opTwoGen(ornot_sse_i64, sse2.M128i, ornotX86Gen(mm_set1_epi32, mm_or_si128, mm_xor_si128, sse2.M128i))
    uint8: opTwoGen(ornot_sse_u8, sse2.M128i, ornotX86Gen(mm_set1_epi32, mm_or_si128, mm_xor_si128, sse2.M128i))
    uint16: opTwoGen(ornot_sse_u16, sse2.M128i, ornotX86Gen(mm_set1_epi32, mm_or_si128, mm_xor_si128, sse2.M128i))
    uint32: opTwoGen(ornot_sse_u32, sse2.M128i, ornotX86Gen(mm_set1_epi32, mm_or_si128, mm_xor_si128, sse2.M128i))
    uint64: opTwoGen(ornot_sse_u64, sse2.M128i, ornotX86Gen(mm_set1_epi32, mm_or_si128, mm_xor_si128, sse2.M128i))
  `shl`:
    float32: typeGen(shl_sse_f32, mm_sll_epi32, sse.M128, sse2.M128i)
    float64: typeGen(shl_sse_f64, mm_sll_epi64, sse2.M128d, sse2.M128i)
    int8: opTwoGen(shl_sse_i8, sse2.M128i, shlX86Gen(mm_unpacklo_epi8, mm_unpackhi_epi8, mm_sll_epi16, mm_and_si128, mm_set1_epi16, mm_packus_epi16, sse2.M128i))
    int16: mm_sll_epi16
    int32: mm_sll_epi32
    int64: mm_sll_epi64
    uint8: opTwoGen(shl_sse_u8, sse2.M128i, shlX86Gen(mm_unpacklo_epi8, mm_unpackhi_epi8, mm_sll_epi16, mm_and_si128, mm_set1_epi16, mm_packus_epi16, sse2.M128i))
    uint16: mm_sll_epi16
    uint32: mm_sll_epi32
    uint64: mm_sll_epi64
  `shr`:
    float32: typeGen(shr_sse_f32, mm_srl_epi32, sse.M128, sse2.M128i)
    float64: typeGen(shr_sse_f64, mm_srl_epi64, sse2.M128d, sse2.M128i)
    int8: opTwoGen(shr_sse_i8, sse2.M128i, shrX86Gen(mm_unpacklo_epi8, mm_unpackhi_epi8, mm_sra_epi16, mm_and_si128, mm_set1_epi16, mm_packus_epi16, sse2.M128i))
    int16: mm_sra_epi16
    int32: mm_sra_epi32
    int64: none
    uint8: opTwoGen(shr_sse_u8, sse2.M128i, shrX86Gen(mm_unpacklo_epi8, mm_unpackhi_epi8, mm_srl_epi16, mm_and_si128, mm_set1_epi16, mm_packus_epi16, sse2.M128i))
    uint16: mm_srl_epi16
    uint32: mm_srl_epi32
    uint64: mm_srl_epi64
  `min`:
    float32: mm_min_ps
    float64: mm_min_pd
    int8: mm_min_epi8
    int16: mm_min_epi16
    int32: mm_min_epi32
    int64: none
    uint8: mm_min_epu8
    uint16: mm_min_epu16
    uint32: mm_min_epu32
    uint64: none
  `max`:
    float32: mm_max_ps
    float64: mm_max_pd
    int8: mm_max_epi8
    int16: mm_max_epi16
    int32: mm_max_epi32
    int64: none
    uint8: mm_max_epu8
    uint16: mm_max_epu16
    uint32: mm_max_epu32
    uint64: none

simdUnaryInput("sse"):
  `not`:
    float32: opOneGen(not_sse_f32, sse.M128, notX86Gen(mm_xor_ps, mm_set1_epi32, sse.M128))
    float64: opOneGen(not_sse_f64, sse2.M128d, notX86Gen(mm_xor_pd, mm_set1_epi32, sse2.M128d))
    int8: opOneGen(not_sse_i8, sse2.M128i, notX86Gen(mm_xor_si128, mm_set1_epi8, sse2.M128i))
    int16: opOneGen(not_sse_i16, sse2.M128i, notX86Gen(mm_xor_si128, mm_set1_epi16, sse2.M128i))
    int32: opOneGen(not_sse_i32, sse2.M128i, notX86Gen(mm_xor_si128, mm_set1_epi32, sse2.M128i))
    int64: opOneGen(not_sse_i64, sse2.M128i, notX86Gen(mm_xor_si128, mm_set1_epi64x, sse2.M128i))
    uint8: opOneGen(not_sse_u8, sse2.M128i, notX86Gen(mm_xor_si128, mm_set1_epi8, sse2.M128i))
    uint16: opOneGen(not_sse_u16, sse2.M128i, notX86Gen(mm_xor_si128, mm_set1_epi16, sse2.M128i))
    uint32: opOneGen(not_sse_u32, sse2.M128i, notX86Gen(mm_xor_si128, mm_set1_epi32, sse2.M128i))
    uint64: opOneGen(not_sse_u64, sse2.M128i, notX86Gen(mm_xor_si128, mm_set1_epi64x, sse2.M128i))
  `abs`:
    float32: opOneGen(abs_sse_f32, sse.M128, absFloatX86Gen(mm_set1_ps, (-0.0'f32), mm_andnot_ps, sse.M128))
    float64: opOneGen(abs_sse_f64, sse2.M128d, absFloatX86Gen(mm_set1_pd, (-0.0'f64), mm_andnot_pd, sse2.M128d))
    int8: opOneGen(abs_sse_i8, sse2.M128i, absIntX86Gen(mm_setzero_si128, mm_cmpgt_epi8, mm_xor_si128, mm_sub_epi8, sse2.M128i))
    int16: opOneGen(abs_sse_i16, sse2.M128i, absIntX86Gen(mm_setzero_si128, mm_cmpgt_epi16, mm_xor_si128, mm_sub_epi16, sse2.M128i))
    int32: opOneGen(abs_sse_i32, sse2.M128i, absIntX86Gen(mm_setzero_si128, mm_cmpgt_epi32, mm_xor_si128, mm_sub_epi32, sse2.M128i))
    int64: opOneGen(abs_sse_i64, sse2.M128i, absInt64X86Gen(mm_srli_epi64, mm_setzero_si128, mm_sub_epi64, mm_xor_si128, sse2.M128i))
    uint8: opOneGen(abs_sse_u8, sse2.M128i, absUintX86Gen())
    uint16: opOneGen(abs_sse_u16, sse2.M128i, absUintX86Gen())
    uint32: opOneGen(abs_sse_u32, sse2.M128i, absUintX86Gen())
    uint64: opOneGen(abs_sse_u64, sse2.M128i, absUintX86Gen())
  `sqrt`:
    float32: mm_sqrt_ps
    float64: mm_sqrt_pd
    int8: error
    int16: error
    int32: error
    int64: error
    uint8: error
    uint16: error
    uint32: error
    uint64: error

simdMaskInput("sse"):
  `==`:
    float32: mm_cmpeq_ps
    float64: mm_cmpeq_pd
    int8: mm_cmpeq_epi8
    int16: mm_cmpeq_epi16
    int32: mm_cmpeq_epi32
    int64: opTwoGen(cmpeq_sse_i64, sse2.M128i, cmpeqSubX86Gen(mm_sub_epi64, mm_cmpeq_epi32, mm_setzero_si128, sse2.M128i))
    uint8: mm_cmpeq_epi8
    uint16: mm_cmpeq_epi16
    uint32: mm_cmpeq_epi32
    uint64: opTwoGen(cmpeq_sse_u64, sse2.M128i, cmpeqSubX86Gen(mm_sub_epi64, mm_cmpeq_epi32, mm_setzero_si128, sse2.M128i))
  `!=`:
    float32: mm_cmpneq_ps
    float64: mm_cmpneq_pd
    int8: opTwoGen(cmpneq_sse_i8, sse2.M128i, cmpneqSubX86Gen(mm_sub_epi8, mm_cmpeq_epi8, mm_xor_si128, mm_set1_epi8, sse2.M128i))
    int16: opTwoGen(cmpneq_sse_i16, sse2.M128i, cmpneqSubX86Gen(mm_sub_epi16, mm_cmpeq_epi16, mm_xor_si128, mm_set1_epi16, sse2.M128i))
    int32: opTwoGen(cmpneq_sse_i32, sse2.M128i, cmpneqSubX86Gen(mm_sub_epi32, mm_cmpeq_epi32, mm_xor_si128, mm_set1_epi32, sse2.M128i))
    int64: opTwoGen(cmpneq_sse_i64, sse2.M128i, cmpneqSubX86Gen(mm_sub_epi64, mm_cmpeq_epi32, mm_xor_si128, mm_set1_epi32, sse2.M128i))
    uint8: opTwoGen(cmpneq_sse_u8, sse2.M128i, cmpneqSubX86Gen(mm_sub_epi8, mm_cmpeq_epi8, mm_xor_si128, mm_set1_epi8, sse2.M128i))
    uint16: opTwoGen(cmpneq_sse_u16, sse2.M128i, cmpneqSubX86Gen(mm_sub_epi16, mm_cmpeq_epi16, mm_xor_si128, mm_set1_epi16, sse2.M128i))
    uint32: opTwoGen(cmpneq_sse_u32, sse2.M128i, cmpneqSubX86Gen(mm_sub_epi32, mm_cmpeq_epi32, mm_xor_si128, mm_set1_epi32, sse2.M128i))
    uint64: opTwoGen(cmpneq_sse_u64, sse2.M128i, cmpneqSubX86Gen(mm_sub_epi64, mm_cmpeq_epi32, mm_xor_si128, mm_set1_epi64x, sse2.M128i))
  `<`:
    float32: mm_cmplt_ps
    float64: mm_cmplt_pd
    int8: mm_cmplt_epi8
    int16: mm_cmplt_epi16
    int32: mm_cmplt_epi32
    int64: opTwoGen(cmplt_sse_i64, sse2.M128i, cmpltIntX86Gen(mm_sub_epi64, mm_xor_si128, mm_and_si128, mm_srli_epi64, 63, sse2.M128i))
    uint8: opTwoGen(cmplt_sse_u8, sse2.M128i, cmpltUintX86Gen(mm_cmplt_epi8, mm_xor_si128, mm_set1_epi8, cast[int8](0x80'u8), sse2.M128i))
    uint16: opTwoGen(cmplt_sse_u16, sse2.M128i, cmpltUintX86Gen(mm_cmplt_epi16, mm_xor_si128, mm_set1_epi16, cast[int16](0x8000'u16), sse2.M128i))
    uint32: opTwoGen(cmplt_sse_u32, sse2.M128i, cmpltUintX86Gen(mm_cmplt_epi32, mm_xor_si128, mm_set1_epi32, cast[int32](0x80000000'u32), sse2.M128i))
    uint64: opTwoGen(cmplt_sse_u64, sse2.M128i, cmpltSubUintX86Gen(mm_sub_epi64, mm_xor_si128, mm_and_si128, mm_or_si128, mm_srli_epi64, mm_set1_epi64x, 63, sse2.M128i))
  `>`:
    float32: mm_cmpgt_ps
    float64: mm_cmpgt_pd
    int8: mm_cmpgt_epi8
    int16: mm_cmpgt_epi16
    int32: mm_cmpgt_epi32
    int64: opTwoGen(cmpgt_sse_i64, sse2.M128i, cmpgtIntX86Gen(mm_sub_epi64, mm_xor_si128, mm_and_si128, mm_srli_epi64, 63, sse2.M128i))
    uint8: opTwoGen(cmpgt_sse_u8, sse2.M128i, cmpgtUintX86Gen(mm_cmpgt_epi8, mm_xor_si128, mm_set1_epi8, cast[int8](0x80'u8), sse2.M128i))
    uint16: opTwoGen(cmpgt_sse_u16, sse2.M128i, cmpgtUintX86Gen(mm_cmpgt_epi16, mm_xor_si128, mm_set1_epi16, cast[int16](0x8000'u16), sse2.M128i))
    uint32: opTwoGen(cmpgt_sse_u32, sse2.M128i, cmpgtUintX86Gen(mm_cmpgt_epi32, mm_xor_si128, mm_set1_epi32, cast[int32](0x80000000'u32), sse2.M128i))
    uint64: opTwoGen(cmpgt_sse_u64, sse2.M128i, cmpgtSubUintX86Gen(mm_sub_epi64, mm_xor_si128, mm_and_si128, mm_or_si128, mm_srli_epi64, mm_set1_epi64x, 63, sse2.M128i))
  `<=`:
    float32: mm_cmple_ps
    float64: mm_cmple_pd
    int8: opTwoGen(cmple_sse_i8, sse2.M128i, cmpleIntX86Gen(mm_cmpgt_epi8, mm_xor_si128, mm_set1_epi8, sse2.M128i))
    int16: opTwoGen(cmple_sse_i16, sse2.M128i, cmpleIntX86Gen(mm_cmpgt_epi16, mm_xor_si128, mm_set1_epi16, sse2.M128i))
    int32: opTwoGen(cmple_sse_i32, sse2.M128i, cmpleIntX86Gen(mm_cmpgt_epi32, mm_xor_si128, mm_set1_epi32, sse2.M128i))
    int64: opTwoGen(cmple_sse_i64, sse2.M128i, cmpleSubIntX86Gen(mm_sub_epi64, mm_xor_si128, mm_and_si128, mm_srli_epi64, mm_set1_epi64x, 63, sse2.M128i))
    uint8: opTwoGen(cmple_sse_u8, sse2.M128i, cmpleUintX86Gen(mm_cmpgt_epi8, mm_xor_si128, mm_set1_epi8, cast[int8](0x80'u8), mm_set1_epi8, sse2.M128i))
    uint16: opTwoGen(cmple_sse_u16, sse2.M128i, cmpleUintX86Gen(mm_cmpgt_epi16, mm_xor_si128, mm_set1_epi16, cast[int16](0x8000'u16), mm_set1_epi16, sse2.M128i))
    uint32: opTwoGen(cmple_sse_u32, sse2.M128i, cmpleUintX86Gen(mm_cmpgt_epi32, mm_xor_si128, mm_set1_epi32, cast[int32](0x80000000'u32), mm_set1_epi32, sse2.M128i))
    uint64: opTwoGen(cmple_sse_u64, sse2.M128i, cmpleSubUintX86Gen(mm_sub_epi64, mm_xor_si128, mm_and_si128, mm_or_si128, mm_srli_epi64, mm_set1_epi64x, 63, sse2.M128i))
  `>=`:
    float32: mm_cmpge_ps
    float64: mm_cmpge_pd
    int8: opTwoGen(cmpge_sse_i8, sse2.M128i, cmpgeIntX86Gen(mm_cmplt_epi8, mm_xor_si128, mm_set1_epi8, sse2.M128i))
    int16: opTwoGen(cmpge_sse_i16, sse2.M128i, cmpgeIntX86Gen(mm_cmplt_epi16, mm_xor_si128, mm_set1_epi16, sse2.M128i))
    int32: opTwoGen(cmpge_sse_i32, sse2.M128i, cmpgeIntX86Gen(mm_cmplt_epi32, mm_xor_si128, mm_set1_epi32, sse2.M128i))
    int64: opTwoGen(cmpge_sse_i64, sse2.M128i, cmpgeSubIntX86Gen(mm_sub_epi64, mm_xor_si128, mm_and_si128, mm_srli_epi64, mm_set1_epi64x, 63, sse2.M128i))
    uint8: opTwoGen(cmpge_sse_u8, sse2.M128i, cmpgeUintX86Gen(mm_cmplt_epi8, mm_xor_si128, mm_set1_epi8, cast[int8](0x80'u8), mm_set1_epi8, sse2.M128i))
    uint16: opTwoGen(cmpge_sse_u16, sse2.M128i, cmpgeUintX86Gen(mm_cmplt_epi16, mm_xor_si128, mm_set1_epi16, cast[int16](0x8000'u16), mm_set1_epi16, sse2.M128i))
    uint32: opTwoGen(cmpge_sse_u32, sse2.M128i, cmpgeUintX86Gen(mm_cmplt_epi32, mm_xor_si128, mm_set1_epi32, cast[int32](0x80000000'u32), mm_set1_epi32, sse2.M128i))
    uint64: opTwoGen(cmpge_sse_u64, sse2.M128i, cmpgeSubUintX86Gen(mm_sub_epi64, mm_xor_si128, mm_and_si128, mm_or_si128, mm_srli_epi64, mm_set1_epi64x, 63, sse2.M128i))

macro iloadX86Gen(load_inst, T: untyped): untyped =
  result = quote do:
    `load_inst`(cast[ptr `T`](a))

macro iLoad1BHX86Gen(cvt_inst, unpacklos_inst, unpacklob_inst, shuffle_inst: untyped): untyped =
  result = quote do:
    let v = `cvt_inst`(cast[ptr int32](a)[])
    let w1 = `unpacklos_inst`(v, v)
    let w2 = `unpacklob_inst`(w1, w1)
    return `shuffle_inst`(w2, 0)

macro iLoad1WX86Gen(cvt_inst, shuffle_inst: untyped): untyped =
  result = quote do:
    let v = `cvt_inst`(cast[ptr int32](a)[])
    return `shuffle_inst`(v, 0)

macro iLoad1DX86Gen(loadl_inst, unpacklo_inst, T: untyped): untyped =
  result = quote do:
    let q = `loadl_inst`(cast[ptr `T`](a))
    return mm_unpacklo_epi64(q, q)

macro iLoad1CVTX86Gen(broadcast_inst, cvt_inst: untyped): untyped =
  result = quote do:
    return `broadcast_inst`(`cvt_inst`(cast[ptr int32](a)[]))

macro iLoad1LoadX86Gen(broadcast_inst, load_inst: untyped): untyped =
  result = quote do:
    return `broadcast_inst`(`load_inst`(cast[ptr sse2.M128i](a)))

macro fLoad1LoadX86Gen(broadcast_inst, load_inst: untyped): untyped =
  result = quote do:
    return `broadcast_inst`(`load_inst`(a))

simdLoadInput("sse"):
  loadU:
    float32: mm_loadu_ps
    float64: mm_loadu_pd
    int8: opLoadGen(loadU_sse_i8, ptr int8, M128i, iLoadX86Gen(mm_loadu_si128, M128i))
    int16: opLoadGen(loadU_sse_i16, ptr int16, M128i, iLoadX86Gen(mm_loadu_si128, M128i))
    int32: opLoadGen(loadU_sse_i32, ptr int32, M128i, iLoadX86Gen(mm_loadu_si128, M128i))
    int64: opLoadGen(loadU_sse_i64, ptr int64, M128i, iLoadX86Gen(mm_loadu_si128, M128i))
    uint8: opLoadGen(loadU_sse_u8, ptr uint8, M128i, iLoadX86Gen(mm_loadu_si128, M128i))
    uint16: opLoadGen(loadU_sse_u16, ptr uint16, M128i, iLoadX86Gen(mm_loadu_si128, M128i))
    uint32: opLoadGen(loadU_sse_u32, ptr uint32, M128i, iLoadX86Gen(mm_loadu_si128, M128i))
    uint64: opLoadGen(loadU_sse_u64, ptr uint64, M128i, iLoadX86Gen(mm_loadu_si128, M128i))
  loadA:
    float32: mm_load_ps
    float64: mm_load_pd
    int8: opLoadGen(loadA_sse_i8, ptr int8, M128i, iLoadX86Gen(mm_load_si128, M128i))
    int16: opLoadGen(loadA_sse_i16, ptr int16, M128i, iLoadX86Gen(mm_load_si128, M128i))
    int32: opLoadGen(loadA_sse_i32, ptr int32, M128i, iLoadX86Gen(mm_load_si128, M128i))
    int64: opLoadGen(loadA_sse_i64, ptr int64, M128i, iLoadX86Gen(mm_load_si128, M128i))
    uint8: opLoadGen(loadA_sse_u8, ptr uint8, M128i, iLoadX86Gen(mm_load_si128, M128i))
    uint16: opLoadGen(loadA_sse_u16, ptr uint16, M128i, iLoadX86Gen(mm_load_si128, M128i))
    uint32: opLoadGen(loadA_sse_u32, ptr uint32, M128i, iLoadX86Gen(mm_load_si128, M128i))
    uint64: opLoadGen(loadA_sse_u64, ptr uint64, M128i, iLoadX86Gen(mm_load_si128, M128i))
  load1:
    float32: mm_load1_ps
    float64: mm_load1_pd
    int8: opLoadGen(load1_sse_i8, ptr int8, sse2.M128i, iLoad1BHX86Gen(mm_cvtsi32_si128, mm_unpacklo_epi8, mm_unpacklo_epi16, mm_shuffle_epi32))
    int16: opLoadGen(load1_sse_i16, ptr int16, sse2.M128i, iLoad1BHX86Gen(mm_cvtsi32_si128, mm_unpacklo_epi16, mm_unpacklo_epi32, mm_shuffle_epi32))
    int32: opLoadGen(load1_sse_i32, ptr int32, sse2.M128i, iLoad1WX86Gen(mm_cvtsi32_si128, mm_shuffle_epi32))
    int64: opLoadGen(load1_sse_i64, ptr int64, sse2.M128i, iLoad1DX86Gen(mm_loadl_epi64, mm_unpacklo_epi64, sse2.M128i))
    uint8: opLoadGen(load1_sse_u8, ptr uint8, sse2.M128i, iLoad1BHX86Gen(mm_cvtsi32_si128, mm_unpacklo_epi8, mm_unpacklo_epi16, mm_shuffle_epi32))
    uint16: opLoadGen(load1_sse_u16, ptr uint16, sse2.M128i, iLoad1BHX86Gen(mm_cvtsi32_si128, mm_unpacklo_epi16, mm_unpacklo_epi32, mm_shuffle_epi32))
    uint32: opLoadGen(load1_sse_u32, ptr uint32, sse2.M128i, iLoad1WX86Gen(mm_cvtsi32_si128, mm_shuffle_epi32))
    uint64: opLoadGen(load1_sse_u64, ptr uint64, sse2.M128i, iLoad1DX86Gen(mm_loadl_epi64, mm_unpacklo_epi64, sse2.M128i))

# x86: AVX
simdInput("avx"):
  `+`:
    float32: mm256_add_ps
    float64: mm256_add_pd
    int8: mm256_add_epi8
    int16: mm256_add_epi16
    int32: mm256_add_epi32
    int64: mm256_add_epi64
    uint8: mm256_add_epi8
    uint16: mm256_add_epi16
    uint32: mm256_add_epi32
    uint64: mm256_add_epi64
  `-`:
    float32: mm256_sub_ps
    float64: mm256_sub_pd
    int8: mm256_sub_epi8
    int16: mm256_sub_epi16
    int32: mm256_sub_epi32
    int64: mm256_sub_epi64
    uint8: mm256_sub_epi8
    uint16: mm256_sub_epi16
    uint32: mm256_sub_epi32
    uint64: mm256_sub_epi64
  `*`:
    float32: mm256_mul_ps
    float64: mm256_mul_pd
    int8: none
    int16: mm256_mullo_epi16
    int32: mm256_mullo_epi32
    int64: none
    uint8: none
    uint16: mm256_mullo_epi16
    uint32: mm256_mullo_epi32
    uint64: none
  `and`:
    float32: mm256_and_ps
    float64: mm256_and_pd
    int8: mm256_and_si256
    int16: mm256_and_si256
    int32: mm256_and_si256
    int64: mm256_and_si256
    uint8: mm256_and_si256
    uint16: mm256_and_si256
    uint32: mm256_and_si256
    uint64: mm256_and_si256
  `or`:
    float32: mm256_or_ps
    float64: mm256_or_pd
    int8: mm256_or_si256
    int16: mm256_or_si256
    int32: mm256_or_si256
    int64: mm256_or_si256
    uint8: mm256_or_si256
    uint16: mm256_or_si256
    uint32: mm256_or_si256
    uint64: mm256_or_si256
  `xor`:
    float32: mm256_xor_ps
    float64: mm256_xor_pd
    int8: mm256_xor_si256
    int16: mm256_xor_si256
    int32: mm256_xor_si256
    int64: mm256_xor_si256
    uint8: mm256_xor_si256
    uint16: mm256_xor_si256
    uint32: mm256_xor_si256
    uint64: mm256_xor_si256
  `nand`:
    float32: opTwoGen(nand_avx_f32, avx.M256, nandX86Gen(mm256_set1_epi32, mm256_and_ps, mm256_xor_ps, avx.M256))
    float64: opTwoGen(nand_avx_f64, avx.M256d, nandX86Gen(mm256_set1_epi32, mm256_and_pd, mm256_xor_pd, avx.M256d))
    int8: opTwoGen(nand_avx_i8, avx.M256i, nandX86Gen(mm256_set1_epi32, mm256_and_si256, mm256_xor_si256, avx.M256i))
    int16: opTwoGen(nand_avx_i16, avx.M256i, nandX86Gen(mm256_set1_epi32, mm256_and_si256, mm256_xor_si256, avx.M256i))
    int32: opTwoGen(nand_avx_i32, avx.M256i, nandX86Gen(mm256_set1_epi32, mm256_and_si256, mm256_xor_si256, avx.M256i))
    int64: opTwoGen(nand_avx_i64, avx.M256i, nandX86Gen(mm256_set1_epi32, mm256_and_si256, mm256_xor_si256, avx.M256i))
    uint8: opTwoGen(nand_avx_u8, avx.M256i, nandX86Gen(mm256_set1_epi32, mm256_and_si256, mm256_xor_si256, avx.M256i))
    uint16: opTwoGen(nand_avx_u16, avx.M256i, nandX86Gen(mm256_set1_epi32, mm256_and_si256, mm256_xor_si256, avx.M256i))
    uint32: opTwoGen(nand_avx_u32, avx.M256i, nandX86Gen(mm256_set1_epi32, mm256_and_si256, mm256_xor_si256, avx.M256i))
    uint64: opTwoGen(nand_avx_u64, avx.M256i, nandX86Gen(mm256_set1_epi32, mm256_and_si256, mm256_xor_si256, avx.M256i))
  `nor`:
    float32: opTwoGen(nor_avx_f32, avx.M256, norX86Gen(mm256_set1_epi32, mm256_or_ps, mm256_xor_ps, avx.M256))
    float64: opTwoGen(nor_avx_f64, avx.M256d, norX86Gen(mm256_set1_epi32, mm256_or_pd, mm256_xor_pd, avx.M256d))
    int8: opTwoGen(nor_avx_i8, avx.M256i, norX86Gen(mm256_set1_epi32, mm256_or_si256, mm256_xor_si256, avx.M256i))
    int16: opTwoGen(nor_avx_i16, avx.M256i, norX86Gen(mm256_set1_epi32, mm256_or_si256, mm256_xor_si256, avx.M256i))
    int32: opTwoGen(nor_avx_i32, avx.M256i, norX86Gen(mm256_set1_epi32, mm256_or_si256, mm256_xor_si256, avx.M256i))
    int64: opTwoGen(nor_avx_i64, avx.M256i, norX86Gen(mm256_set1_epi32, mm256_or_si256, mm256_xor_si256, avx.M256i))
    uint8: opTwoGen(nor_avx_u8, avx.M256i, norX86Gen(mm256_set1_epi32, mm256_or_si256, mm256_xor_si256, avx.M256i))
    uint16: opTwoGen(nor_avx_u16, avx.M256i, norX86Gen(mm256_set1_epi32, mm256_or_si256, mm256_xor_si256, avx.M256i))
    uint32: opTwoGen(nor_avx_u32, avx.M256i, norX86Gen(mm256_set1_epi32, mm256_or_si256, mm256_xor_si256, avx.M256i))
    uint64: opTwoGen(nor_avx_u64, avx.M256i, norX86Gen(mm256_set1_epi32, mm256_or_si256, mm256_xor_si256, avx.M256i))
  `nxor`:
    float32: opTwoGen(nxor_avx_f32, avx.M256, nxorX86Gen(mm256_set1_epi32, mm256_xor_ps, avx.M256))
    float64: opTwoGen(nxor_avx_f64, avx.M256d, nxorX86Gen(mm256_set1_epi32, mm256_xor_pd, avx.M256d))
    int8: opTwoGen(nxor_avx_i8, avx.M256i, nxorX86Gen(mm256_set1_epi32, mm256_xor_si256, avx.M256i))
    int16: opTwoGen(nxor_avx_i16, avx.M256i, nxorX86Gen(mm256_set1_epi32, mm256_xor_si256, avx.M256i))
    int32: opTwoGen(nxor_avx_i32, avx.M256i, nxorX86Gen(mm256_set1_epi32, mm256_xor_si256, avx.M256i))
    int64: opTwoGen(nxor_avx_i64, avx.M256i, nxorX86Gen(mm256_set1_epi32, mm256_xor_si256, avx.M256i))
    uint8: opTwoGen(nxor_avx_u8, avx.M256i, nxorX86Gen(mm256_set1_epi32, mm256_xor_si256, avx.M256i))
    uint16: opTwoGen(nxor_avx_u16, avx.M256i, nxorX86Gen(mm256_set1_epi32, mm256_xor_si256, avx.M256i))
    uint32: opTwoGen(nxor_avx_u32, avx.M256i, nxorX86Gen(mm256_set1_epi32, mm256_xor_si256, avx.M256i))
    uint64: opTwoGen(nxor_avx_u64, avx.M256i, nxorX86Gen(mm256_set1_epi32, mm256_xor_si256, avx.M256i))
  `andnot`:
    float32: mm256_andnot_ps
    float64: mm256_andnot_pd
    int8: mm256_andnot_si256
    int16: mm256_andnot_si256
    int32: mm256_andnot_si256
    int64: mm256_andnot_si256
    uint8: mm256_andnot_si256
    uint16: mm256_andnot_si256
    uint32: mm256_andnot_si256
    uint64: mm256_andnot_si256
  `ornot`:
    float32: opTwoGen(ornot_avx_f32, avx.M256, ornotX86Gen(mm256_set1_epi32, mm256_or_ps, mm256_xor_ps, avx.M256))
    float64: opTwoGen(ornot_avx_f64, avx.M256d, ornotX86Gen(mm256_set1_epi32, mm256_or_pd, mm256_xor_pd, avx.M256d))
    int8: opTwoGen(ornot_avx_i8, avx2.M256i, ornotX86Gen(mm256_set1_epi32, mm256_or_si256, mm256_xor_si256, avx2.M256i))
    int16: opTwoGen(ornot_avx_i16, avx2.M256i, ornotX86Gen(mm256_set1_epi32, mm256_or_si256, mm256_xor_si256, avx2.M256i))
    int32: opTwoGen(ornot_avx_i32, avx2.M256i, ornotX86Gen(mm256_set1_epi32, mm256_or_si256, mm256_xor_si256, avx2.M256i))
    int64: opTwoGen(ornot_avx_i64, avx2.M256i, ornotX86Gen(mm256_set1_epi32, mm256_or_si256, mm256_xor_si256, avx2.M256i))
    uint8: opTwoGen(ornot_avx_u8, avx2.M256i, ornotX86Gen(mm256_set1_epi32, mm256_or_si256, mm256_xor_si256, avx2.M256i))
    uint16: opTwoGen(ornot_avx_u16, avx2.M256i, ornotX86Gen(mm256_set1_epi32, mm256_or_si256, mm256_xor_si256, avx2.M256i))
    uint32: opTwoGen(ornot_avx_u32, avx2.M256i, ornotX86Gen(mm256_set1_epi32, mm256_or_si256, mm256_xor_si256, avx2.M256i))
    uint64: opTwoGen(ornot_avx_u64, avx2.M256i, ornotX86Gen(mm256_set1_epi32, mm256_or_si256, mm256_xor_si256, avx2.M256i))
  `shl`:
    float32: typeGen(shl_avx_f32, mm256_sll_epi32, avx.M256, avx.M256i)
    float64: typeGen(shl_avx_f64, mm256_sll_epi64, avx.M256d, avx.M256i)
    int8: opTwoGen(shl_avx_i8, avx.M256i, shlX86Gen(mm256_unpacklo_epi8, mm256_unpackhi_epi8, mm256_sll_epi16, mm256_and_si256, mm256_set1_epi16, mm256_packus_epi16, avx.M256i))
    int16: mm256_sll_epi16
    int32: mm256_sll_epi32
    int64: mm256_sll_epi64
    uint8: opTwoGen(shl_avx_u8, avx.M256i, shlX86Gen(mm256_unpacklo_epi8, mm256_unpackhi_epi8, mm256_sll_epi16, mm256_and_si256, mm256_set1_epi16, mm256_packus_epi16, avx.M256i))
    uint16: mm256_sll_epi16
    uint32: mm256_sll_epi32
    uint64: mm256_sll_epi64
  `shr`:
    float32: typeGen(shr_avx_f32, mm256_srl_epi32, avx.M256, avx.M256i)
    float64: typeGen(shr_avx_f64, mm256_srl_epi64, avx.M256d, avx.M256i)
    int8: opTwoGen(shr_avx_i8, avx.M256i, shrX86Gen(mm256_unpacklo_epi8, mm256_unpackhi_epi8, mm256_sra_epi16, mm256_and_si256, mm256_set1_epi16, mm256_packus_epi16, avx.M256i))
    int16: mm256_sra_epi16
    int32: mm256_sra_epi32
    int64: none
    uint8: opTwoGen(shr_avx_u8, avx.M256i, shrX86Gen(mm256_unpacklo_epi8, mm256_unpackhi_epi8, mm256_srl_epi16, mm256_and_si256, mm256_set1_epi16, mm256_packus_epi16, avx.M256i))
    uint16: mm256_srl_epi16
    uint32: mm256_srl_epi32
    uint64: mm256_srl_epi64
  `min`:
    float32: mm256_min_ps
    float64: mm256_min_pd
    int8: mm256_min_epi8
    int16: mm256_min_epi16
    int32: mm256_min_epi32
    int64: none
    uint8: mm256_min_epu8
    uint16: mm256_min_epu16
    uint32: mm256_min_epu32
    uint64: none
  `max`:
    float32: mm256_max_ps
    float64: mm256_max_pd
    int8: mm256_max_epi8
    int16: mm256_max_epi16
    int32: mm256_max_epi32
    int64: none
    uint8: mm256_max_epu8
    uint16: mm256_max_epu16
    uint32: mm256_max_epu32
    uint64: none

simdUnaryInput("avx"):
  `not`:
    float32: opOneGen(not_avx_f32, avx.M256, notX86Gen(mm256_xor_ps, mm256_set1_epi32, avx.M256))
    float64: opOneGen(not_avx_f64, avx.M256d, notX86Gen(mm256_xor_pd, mm256_set1_epi32, avx.M256d))
    int8: opOneGen(not_avx_i8, avx.M256i, notX86Gen(mm256_xor_si256, mm256_set1_epi8, avx.M256i))
    int16: opOneGen(not_avx_i16, avx.M256i, notX86Gen(mm256_xor_si256, mm256_set1_epi16, avx.M256i))
    int32: opOneGen(not_avx_i32, avx.M256i, notX86Gen(mm256_xor_si256, mm256_set1_epi32, avx.M256i))
    int64: opOneGen(not_avx_i64, avx.M256i, notX86Gen(mm256_xor_si256, mm256_set1_epi64x, avx.M256i))
    uint8: opOneGen(not_avx_u8, avx.M256i, notX86Gen(mm256_xor_si256, mm256_set1_epi8, avx.M256i))
    uint16: opOneGen(not_avx_u16, avx.M256i, notX86Gen(mm256_xor_si256, mm256_set1_epi16, avx.M256i))
    uint32: opOneGen(not_avx_u32, avx.M256i, notX86Gen(mm256_xor_si256, mm256_set1_epi32, avx.M256i))
    uint64: opOneGen(not_avx_u64, avx.M256i, notX86Gen(mm256_xor_si256, mm256_set1_epi64x, avx.M256i))
  `abs`:
    float32: opOneGen(abs_avx_f32, avx.M256, absFloatX86Gen(mm256_set1_ps, (-0.0'f32), mm256_andnot_ps, avx.M256))
    float64: opOneGen(abs_avx_f64, avx.M256d, absFloatX86Gen(mm256_set1_pd, (-0.0'f64), mm256_andnot_pd, avx.M256d))
    int8: mm256_abs_epi8
    int16: mm256_abs_epi16
    int32: mm256_abs_epi32
    int64: opOneGen(abs_avx_i64, avx.M256i, absInt64X86Gen(mm256_srli_epi64, mm256_setzero_si256, mm256_sub_epi64, mm256_xor_si256, avx.M256i))
    uint8: opOneGen(abs_avx_u8, avx.M256i, absUintX86Gen())
    uint16: opOneGen(abs_avx_u16, avx.M256i, absUintX86Gen())
    uint32: opOneGen(abs_avx_u32, avx.M256i, absUintX86Gen())
    uint64: opOneGen(abs_avx_u64, avx.M256i, absUintX86Gen())
  `sqrt`:
    float32: mm256_sqrt_ps
    float64: mm256_sqrt_pd
    int8: none
    int16: none
    int32: none
    int64: none
    uint8: none
    uint16: none
    uint32: none
    uint64: error

macro cmpltIntAvx2Gen(cmpgt_inst, T: untyped): untyped =
  result = quote do:
    return `cmpgt_inst`(cast[`T`](b), cast[`T`](a))

macro cmpFloatAvxGen(cmp_inst, imm8: static int32, T: untyped): untyped =
  result = quote do:
    return `cmp_inst`(cast[`T`](a), cast[`T`](b), `imm8`)

simdMaskInput("avx"):
  `==`:
    float32: opTwoGen(cmpeq_avx_f32, avx.M256, cmpFloatAvxGen(mm256_cmp_ps, 0, avx.M256))
    float64: opTwoGen(cmpeq_avx_f64, avx.M256d, cmpFloatAvxGen(mm256_cmp_pd, 0, avx.M256d))
    int8: opTwoGen(cmpeq_avx_i8, avx.M256i, cmpeqSubX86Gen(mm256_sub_epi8, mm256_cmpeq_epi8, mm256_setzero_si256, avx.M256i))
    int16: opTwoGen(cmpeq_avx_i16, avx.M256i, cmpeqSubX86Gen(mm256_sub_epi16, mm256_cmpeq_epi16, mm256_setzero_si256, avx.M256i))
    int32: opTwoGen(cmpeq_avx_i32, avx.M256i, cmpeqSubX86Gen(mm256_sub_epi32, mm256_cmpeq_epi32, mm256_setzero_si256, avx.M256i))
    int64: opTwoGen(cmpeq_avx_i64, avx.M256i, cmpeqSubX86Gen(mm256_sub_epi64, mm256_cmpeq_epi32, mm256_setzero_si256, avx.M256i))
    uint8: opTwoGen(cmpeq_avx_u8, avx.M256i, cmpeqSubX86Gen(mm256_sub_epi8, mm256_cmpeq_epi8, mm256_setzero_si256, avx.M256i))
    uint16: opTwoGen(cmpeq_avx_u16, avx.M256i, cmpeqSubX86Gen(mm256_sub_epi16, mm256_cmpeq_epi16, mm256_setzero_si256, avx.M256i))
    uint32: opTwoGen(cmpeq_avx_u32, avx.M256i, cmpeqSubX86Gen(mm256_sub_epi32, mm256_cmpeq_epi32, mm256_setzero_si256, avx.M256i))
    uint64: opTwoGen(cmpeq_avx_u64, avx.M256i, cmpeqSubX86Gen(mm256_sub_epi64, mm256_cmpeq_epi32, mm256_setzero_si256, avx.M256i))
  `!=`:
    float32: opTwoGen(cmpneq_avx_f32, avx.M256, cmpFloatAvxGen(mm256_cmp_ps, 12, avx.M256))
    float64: opTwoGen(cmpneq_avx_f64, avx.M256d, cmpFloatAvxGen(mm256_cmp_pd, 12, avx.M256d))
    int8: opTwoGen(cmpneq_avx_i8, avx.M256i, cmpneqSubX86Gen(mm256_sub_epi8, mm256_cmpeq_epi8, mm256_xor_si256, mm256_set1_epi8, avx.M256i))
    int16: opTwoGen(cmpneq_avx_i16, avx.M256i, cmpneqSubX86Gen(mm256_sub_epi16, mm256_cmpeq_epi16, mm256_xor_si256, mm256_set1_epi16, avx.M256i))
    int32: opTwoGen(cmpneq_avx_i32, avx.M256i, cmpneqSubX86Gen(mm256_sub_epi32, mm256_cmpeq_epi32, mm256_xor_si256, mm256_set1_epi32, avx.M256i))
    int64: opTwoGen(cmpneq_avx_i64, avx.M256i, cmpneqSubX86Gen(mm256_sub_epi64, mm256_cmpeq_epi32, mm256_xor_si256, mm256_set1_epi32, avx.M256i))
    uint8: opTwoGen(cmpneq_avx_u8, avx.M256i, cmpneqSubX86Gen(mm256_sub_epi8, mm256_cmpeq_epi8, mm256_xor_si256, mm256_set1_epi8, avx.M256i))
    uint16: opTwoGen(cmpneq_avx_u16, avx.M256i, cmpneqSubX86Gen(mm256_sub_epi16, mm256_cmpeq_epi16, mm256_xor_si256, mm256_set1_epi16, avx.M256i))
    uint32: opTwoGen(cmpneq_avx_u32, avx.M256i, cmpneqSubX86Gen(mm256_sub_epi32, mm256_cmpeq_epi32, mm256_xor_si256, mm256_set1_epi32, avx.M256i))
    uint64: opTwoGen(cmpneq_avx_u64, avx.M256i, cmpneqSubX86Gen(mm256_sub_epi64, mm256_cmpeq_epi32, mm256_xor_si256, mm256_set1_epi32, avx.M256i))
  `<`:
    float32: opTwoGen(cmplt_avx_f32, avx.M256, cmpFloatAvxGen(mm256_cmp_ps, 1, avx.M256))
    float64: opTwoGen(cmplt_avx_f64, avx.M256d, cmpFloatAvxGen(mm256_cmp_pd, 1, avx.M256d))
    int8: opTwoGen(cmplt_avx_i8, avx.M256i, cmpltIntAvx2Gen(mm256_cmpgt_epi8, avx.M256i))
    int16: opTwoGen(cmplt_avx_i16, avx.M256i, cmpltIntAvx2Gen(mm256_cmpgt_epi16, avx.M256i))
    int32: opTwoGen(cmplt_avx_i32, avx.M256i, cmpltIntAvx2Gen(mm256_cmpgt_epi32, avx.M256i))
    int64: opTwoGen(cmplt_avx_i64, avx.M256i, cmpltIntX86Gen(mm256_sub_epi64, mm256_xor_si256, mm256_and_si256, mm256_srli_epi64, 63, avx.M256i))
    uint8: opTwoGen(cmplt_avx_u8, avx.M256i, cmpltUintAvx2Gen(mm256_cmpgt_epi8, mm256_xor_si256, mm256_set1_epi8, cast[int8](0x80'u8), avx.M256i))
    uint16: opTwoGen(cmplt_avx_u16, avx.M256i, cmpltUintAvx2Gen(mm256_cmpgt_epi16, mm256_xor_si256, mm256_set1_epi16, cast[int16](0x8000'u16), avx.M256i))
    uint32: opTwoGen(cmplt_avx_u32, avx.M256i, cmpltUintAvx2Gen(mm256_cmpgt_epi32, mm256_xor_si256, mm256_set1_epi32, cast[int32](0x80000000'u32), avx.M256i))
    uint64: opTwoGen(cmplt_avx_u64, avx.M256i, cmpltSubUintX86Gen(mm256_sub_epi64, mm256_xor_si256, mm256_and_si256, mm256_or_si256, mm256_srli_epi64, mm256_set1_epi64x, 63, avx.M256i))
  `>`:
    float32: opTwoGen(cmpgt_avx_f32, avx.M256, cmpFloatAvxGen(mm256_cmp_ps, 6, avx.M256))
    float64: opTwoGen(cmpgt_avx_f64, avx.M256d, cmpFloatAvxGen(mm256_cmp_pd, 6, avx.M256d))
    int8: mm256_cmpgt_epi8
    int16: mm256_cmpgt_epi16
    int32: mm256_cmpgt_epi32
    int64: opTwoGen(cmpgt_avx_i64, avx.M256i, cmpgtIntX86Gen(mm256_sub_epi64, mm256_xor_si256, mm256_and_si256, mm256_srli_epi64, 63, avx.M256i))
    uint8: opTwoGen(cmpgt_avx_u8, avx.M256i, cmpgtUintAvx2Gen(mm256_cmpgt_epi8, mm256_xor_si256, mm256_set1_epi8, cast[int8](0x80'u8), avx.M256i))
    uint16: opTwoGen(cmpgt_avx_u16, avx.M256i, cmpgtUintAvx2Gen(mm256_cmpgt_epi16, mm256_xor_si256, mm256_set1_epi16, cast[int16](0x8000'u16), avx.M256i))
    uint32: opTwoGen(cmpgt_avx_u32, avx.M256i, cmpgtUintAvx2Gen(mm256_cmpgt_epi32, mm256_xor_si256, mm256_set1_epi32, cast[int32](0x80000000'u32), avx.M256i))
    uint64: opTwoGen(cmpgt_avx_u64, avx.M256i, cmpgtSubUintX86Gen(mm256_sub_epi64, mm256_xor_si256, mm256_and_si256, mm256_or_si256, mm256_srli_epi64, mm256_set1_epi64x, 63, avx.M256i))
  `<=`:
    float32: opTwoGen(cmple_avx_f32, avx.M256, cmpFloatAvxGen(mm256_cmp_ps, 2, avx.M256))
    float64: opTwoGen(cmple_avx_f64, avx.M256d, cmpFloatAvxGen(mm256_cmp_pd, 2, avx.M256d))
    int8: opTwoGen(cmple_avx_i8, avx.M256i, cmpleIntX86Gen(mm256_cmpgt_epi8, mm256_xor_si256, mm256_set1_epi8, avx.M256i))
    int16: opTwoGen(cmple_avx_i16, avx.M256i, cmpleIntX86Gen(mm256_cmpgt_epi16, mm256_xor_si256, mm256_set1_epi16, avx.M256i))
    int32: opTwoGen(cmple_avx_i32, avx.M256i, cmpleIntX86Gen(mm256_cmpgt_epi32, mm256_xor_si256, mm256_set1_epi32, avx.M256i))
    int64: opTwoGen(cmple_avx_i64, avx.M256i, cmpleSubIntX86Gen(mm256_sub_epi64, mm256_xor_si256, mm256_and_si256, mm256_srli_epi64, mm256_set1_epi64x, 63, avx.M256i))
    uint8: opTwoGen(cmple_avx_u8, avx.M256i, cmpleUintAvx2Gen(mm256_cmpgt_epi8, mm256_xor_si256, mm256_set1_epi8, cast[int8](0x80'u8), mm256_set1_epi8, avx.M256i))
    uint16: opTwoGen(cmple_avx_u16, avx.M256i, cmpleUintAvx2Gen(mm256_cmpgt_epi16, mm256_xor_si256, mm256_set1_epi16, cast[int16](0x8000'u16), mm256_set1_epi16, avx.M256i))
    uint32: opTwoGen(cmple_avx_u32, avx.M256i, cmpleUintAvx2Gen(mm256_cmpgt_epi32, mm256_xor_si256, mm256_set1_epi32, cast[int32](0x80000000'u32), mm256_set1_epi32, avx.M256i))
    uint64: opTwoGen(cmple_avx_u64, avx.M256i, cmpleSubUintX86Gen(mm256_sub_epi64, mm256_xor_si256, mm256_and_si256, mm256_or_si256, mm256_srli_epi64, mm256_set1_epi64x, 63, avx.M256i))
  `>=`:
    float32: opTwoGen(cmpge_avx_f32, avx.M256, cmpFloatAvxGen(mm256_cmp_ps, 5, avx.M256))
    float64: opTwoGen(cmpge_avx_f64, avx.M256d, cmpFloatAvxGen(mm256_cmp_pd, 5, avx.M256d))
    int8: opTwoGen(cmpge_avx_i8, avx.M256i, cmpgeIntX86Gen(mm256_cmpgt_epi8, mm256_xor_si256, mm256_set1_epi8, avx.M256i))
    int16: opTwoGen(cmpge_avx_i16, avx.M256i, cmpgeIntX86Gen(mm256_cmpgt_epi16, mm256_xor_si256, mm256_set1_epi16, avx.M256i))
    int32: opTwoGen(cmpge_avx_i32, avx.M256i, cmpgeIntX86Gen(mm256_cmpgt_epi32, mm256_xor_si256, mm256_set1_epi32, avx.M256i))
    int64: opTwoGen(cmpge_avx_i64, avx.M256i, cmpgeSubIntX86Gen(mm256_sub_epi64, mm256_xor_si256, mm256_and_si256, mm256_srli_epi64, mm256_set1_epi64x, 63, avx.M256i))
    uint8: opTwoGen(cmpge_avx_u8, avx.M256i, cmpgeUintAvx2Gen(mm256_cmpgt_epi8, mm256_xor_si256, mm256_set1_epi8, cast[int8](0x80'u8), mm256_set1_epi8, avx.M256i))
    uint16: opTwoGen(cmpge_avx_u16, avx.M256i, cmpgeUintAvx2Gen(mm256_cmpgt_epi16, mm256_xor_si256, mm256_set1_epi16, cast[int16](0x8000'u16), mm256_set1_epi16, avx.M256i))
    uint32: opTwoGen(cmpge_avx_u32, avx.M256i, cmpgeUintAvx2Gen(mm256_cmpgt_epi32, mm256_xor_si256, mm256_set1_epi32, cast[int32](0x80000000'u32), mm256_set1_epi32, avx.M256i))
    uint64: opTwoGen(cmpge_avx_u64, avx.M256i, cmpgeSubUintX86Gen(mm256_sub_epi64, mm256_xor_si256, mm256_and_si256, mm256_or_si256, mm256_srli_epi64, mm256_set1_epi64x, 63, avx.M256i))

simdLoadInput("avx"):
  loadU:
    float32: mm256_loadu_ps
    float64: mm256_loadu_pd
    int8: opLoadGen(loadU_avx_i8, ptr int8, avx.M256i, iLoadX86Gen(mm256_loadu_si256, avx.M256i))
    int16: opLoadGen(loadU_avx_i16, ptr int16, avx.M256i, iLoadX86Gen(mm256_loadu_si256, avx.M256i))
    int32: opLoadGen(loadU_avx_i32, ptr int32, avx.M256i, iLoadX86Gen(mm256_loadu_si256, avx.M256i))
    int64: opLoadGen(loadU_avx_i64, ptr int64, avx.M256i, iLoadX86Gen(mm256_loadu_si256, avx.M256i))
    uint8: opLoadGen(loadU_avx_u8, ptr uint8, avx.M256i, iLoadX86Gen(mm256_loadu_si256, avx.M256i))
    uint16: opLoadGen(loadU_avx_u16, ptr uint16, avx.M256i, iLoadX86Gen(mm256_loadu_si256, avx.M256i))
    uint32: opLoadGen(loadU_avx_u32, ptr uint32, avx.M256i, iLoadX86Gen(mm256_loadu_si256, avx.M256i))
    uint64: opLoadGen(loadU_avx_u64, ptr uint64, avx.M256i, iLoadX86Gen(mm256_loadu_si256, avx.M256i))
  loadA:
    float32: mm256_load_ps
    float64: mm256_load_pd
    int8: opLoadGen(loadA_avx_i8, ptr int8, avx.M256i, iLoadX86Gen(mm256_load_si256, avx.M256i))
    int16: opLoadGen(loadA_avx_i16, ptr int16, avx.M256i, iLoadX86Gen(mm256_load_si256, avx.M256i))
    int32: opLoadGen(loadA_avx_i32, ptr int32, avx.M256i, iLoadX86Gen(mm256_load_si256, avx.M256i))
    int64: opLoadGen(loadA_avx_i64, ptr int64, avx.M256i, iLoadX86Gen(mm256_load_si256, avx.M256i))
    uint8: opLoadGen(loadA_avx_u8, ptr uint8, avx.M256i, iLoadX86Gen(mm256_load_si256, avx.M256i))
    uint16: opLoadGen(loadA_avx_u16, ptr uint16, avx.M256i, iLoadX86Gen(mm256_load_si256, avx.M256i))
    uint32: opLoadGen(loadA_avx_u32, ptr uint32, avx.M256i, iLoadX86Gen(mm256_load_si256, avx.M256i))
    uint64: opLoadGen(loadA_avx_u64, ptr uint64, avx.M256i, iLoadX86Gen(mm256_load_si256, avx.M256i))
  load1:
    float32: mm256_broadcast_ss
    float64: mm256_broadcast_sd
    int8: opLoadGen(load1_avx_i8, ptr int8, avx.M256i, iLoad1CVTX86Gen(mm256_broadcastb_epi8, mm_cvtsi32_si128))
    int16: opLoadGen(load1_avx_i16, ptr int16, avx.M256i, iLoad1CVTX86Gen(mm256_broadcastw_epi16, mm_cvtsi32_si128))
    int32: opLoadGen(load1_avx_i32, ptr int32, avx.M256i, iLoad1CVTX86Gen(mm256_broadcastd_epi32, mm_cvtsi32_si128))
    int64: opLoadGen(load1_avx_i64, ptr int64, avx.M256i, iLoad1LoadX86Gen(mm256_broadcastq_epi64, mm_loadl_epi64))
    uint8: opLoadGen(load1_avx_u8, ptr uint8, avx.M256i, iLoad1CVTX86Gen(mm256_broadcastb_epi8, mm_cvtsi32_si128))
    uint16: opLoadGen(load1_avx_u16, ptr uint16, avx.M256i, iLoad1CVTX86Gen(mm256_broadcastw_epi16, mm_cvtsi32_si128))
    uint32: opLoadGen(load1_avx_u32, ptr uint32, avx.M256i, iLoad1CVTX86Gen(mm256_broadcastd_epi32, mm_cvtsi32_si128))
    uint64: opLoadGen(load1_avx_u64, ptr uint64, avx.M256i, iLoad1LoadX86Gen(mm256_broadcastq_epi64, mm_loadl_epi64))

# x86: AVX-512
simdInput("avx512"):
  `+`:
    float32: mm512_add_ps
    float64: mm512_add_pd
    int8: mm512_add_epi8
    int16: mm512_add_epi16
    int32: mm512_add_epi32
    int64: mm512_add_epi64
    uint8: mm512_add_epi8
    uint16: mm512_add_epi16
    uint32: mm512_add_epi32
    uint64: mm512_add_epi64
  `-`:
    float32: mm512_sub_ps
    float64: mm512_sub_pd
    int8: mm512_sub_epi8
    int16: mm512_sub_epi16
    int32: mm512_sub_epi32
    int64: mm512_sub_epi64
    uint8: mm512_sub_epi8
    uint16: mm512_sub_epi16
    uint32: mm512_sub_epi32
    uint64: mm512_sub_epi64
  `*`:
    float32: mm512_mul_ps
    float64: mm512_mul_pd
    int8: none
    int16: mm512_mullo_epi16
    int32: mm512_mullo_epi32
    int64: none
    uint8: none
    uint16: mm512_mullo_epi16
    uint32: mm512_mullo_epi32
    uint64: none
  `and`:
    float32: typeGen(and_avx512_f32, mm512_and_si512, avx512f.M512, avx512f.M512i)
    float64: typeGen(and_avx512_f64, mm512_and_si512, avx512f.M512d, avx512f.M512i)
    int8: mm512_and_si512
    int16: mm512_and_si512
    int32: mm512_and_si512
    int64: mm512_and_si512
    uint8: mm512_and_si512
    uint16: mm512_and_si512
    uint32: mm512_and_si512
    uint64: mm512_and_si512
  `or`:
    float32: typeGen(or_avx512_f32, mm512_or_si512, avx512f.M512, avx512f.M512i)
    float64: typeGen(or_avx512_f64, mm512_or_si512, avx512f.M512d, avx512f.M512i)
    int8: mm512_or_si512
    int16: mm512_or_si512
    int32: mm512_or_si512
    int64: mm512_or_si512
    uint8: mm512_or_si512
    uint16: mm512_or_si512
    uint32: mm512_or_si512
    uint64: mm512_or_si512
  `xor`:
    float32: typeGen(xor_avx512_f32, mm512_xor_si512, avx512f.M512, avx512f.M512i)
    float64: typeGen(xor_avx512_f64, mm512_xor_si512, avx512f.M512d, avx512f.M512i)
    int8: mm512_xor_si512
    int16: mm512_xor_si512
    int32: mm512_xor_si512
    int64: mm512_xor_si512
    uint8: mm512_xor_si512
    uint16: mm512_xor_si512
    uint32: mm512_xor_si512
    uint64: mm512_xor_si512
  `nand`:
    float32: opTwoGen(nand_avx512_f32, avx512f.M512, nandX86Gen(mm512_set1_epi32, mm512_and_ps, mm512_xor_ps, avx512f.M512))
    float64: opTwoGen(nand_avx512_f64, avx512f.M512d, nandX86Gen(mm512_set1_epi32, mm512_and_pd, mm512_xor_pd, avx512f.M512d))
    int8: opTwoGen(nand_avx512_i8, avx512f.M512i, nandX86Gen(mm512_set1_epi32, mm512_and_si512, mm512_xor_si512, avx512f.M512i))
    int16: opTwoGen(nand_avx512_i16, avx512f.M512i, nandX86Gen(mm512_set1_epi32, mm512_and_si512, mm512_xor_si512, avx512f.M512i))
    int32: opTwoGen(nand_avx512_i32, avx512f.M512i, nandX86Gen(mm512_set1_epi32, mm512_and_si512, mm512_xor_si512, avx512f.M512i))
    int64: opTwoGen(nand_avx512_i64, avx512f.M512i, nandX86Gen(mm512_set1_epi32, mm512_and_si512, mm512_xor_si512, avx512f.M512i))
    uint8: opTwoGen(nand_avx512_u8, avx512f.M512i, nandX86Gen(mm512_set1_epi32, mm512_and_si512, mm512_xor_si512, avx512f.M512i))
    uint16: opTwoGen(nand_avx512_u16, avx512f.M512i, nandX86Gen(mm512_set1_epi32, mm512_and_si512, mm512_xor_si512, avx512f.M512i))
    uint32: opTwoGen(nand_avx512_u32, avx512f.M512i, nandX86Gen(mm512_set1_epi32, mm512_and_si512, mm512_xor_si512, avx512f.M512i))
    uint64: opTwoGen(nand_avx512_u64, avx512f.M512i, nandX86Gen(mm512_set1_epi32, mm512_and_si512, mm512_xor_si512, avx512f.M512i))
  `nor`:
    float32: opTwoGen(nor_avx512_f32, avx512f.M512, norX86Gen(mm512_set_epi32, mm512_or_ps, mm512_xor_ps, avx512f.M512))
    float64: opTwoGen(nor_avx512_f64, avx512f.M512d, norX86Gen(mm512_set_epi32, mm512_or_pd, mm512_xor_pd, avx512f.M512d))
    int8: opTwoGen(nor_avx512_i8, avx512f.M512i, norX86Gen(mm512_set_epi32, mm512_or_si512, mm512_xor_si512, avx512f.M512i))
    int16: opTwoGen(nor_avx512_i16, avx512f.M512i, norX86Gen(mm512_set_epi32, mm512_or_si512, mm512_xor_si512, avx512f.M512i))
    int32: opTwoGen(nor_avx512_i32, avx512f.M512i, norX86Gen(mm512_set_epi32, mm512_or_si512, mm512_xor_si512, avx512f.M512i))
    int64: opTwoGen(nor_avx512_i64, avx512f.M512i, norX86Gen(mm512_set_epi32, mm512_or_si512, mm512_xor_si512, avx512f.M512i))
    uint8: opTwoGen(nor_avx512_u8, avx512f.M512i, norX86Gen(mm512_set_epi32, mm512_or_si512, mm512_xor_si512, avx512f.M512i))
    uint16: opTwoGen(nor_avx512_u16, avx512f.M512i, norX86Gen(mm512_set_epi32, mm512_or_si512, mm512_xor_si512, avx512f.M512i))
    uint32: opTwoGen(nor_avx512_u32, avx512f.M512i, norX86Gen(mm512_set_epi32, mm512_or_si512, mm512_xor_si512, avx512f.M512i))
    uint64: opTwoGen(nor_avx512_u64, avx512f.M512i, norX86Gen(mm512_set_epi32, mm512_or_si512, mm512_xor_si512, avx512f.M512i))
  `nxor`:
    float32: opTwoGen(nxor_avx512_f32, avx512f.M512, nxorX86Gen(mm512_set1_epi32, mm512_xor_ps, avx512f.M512))
    float64: opTwoGen(nxor_avx512_f64, avx512f.M512d, nxorX86Gen(mm512_set1_epi32, mm512_xor_pd, avx512f.M512d))
    int8: opTwoGen(nxor_avx512_i8, avx512f.M512i, nxorX86Gen(mm512_set1_epi32, mm512_xor_si512, avx512f.M512i))
    int16: opTwoGen(nxor_avx512_i16, avx512f.M512i, nxorX86Gen(mm512_set1_epi32, mm512_xor_si512, avx512f.M512i))
    int32: opTwoGen(nxor_avx512_i32, avx512f.M512i, nxorX86Gen(mm512_set1_epi32, mm512_xor_si512, avx512f.M512i))
    int64: opTwoGen(nxor_avx512_i64, avx512f.M512i, nxorX86Gen(mm512_set1_epi32, mm512_xor_si512, avx512f.M512i))
    uint8: opTwoGen(nxor_avx512_u8, avx512f.M512i, nxorX86Gen(mm512_set1_epi32, mm512_xor_si512, avx512f.M512i))
    uint16: opTwoGen(nxor_avx512_u16, avx512f.M512i, nxorX86Gen(mm512_set1_epi32, mm512_xor_si512, avx512f.M512i))
    uint32: opTwoGen(nxor_avx512_u32, avx512f.M512i, nxorX86Gen(mm512_set1_epi32, mm512_xor_si512, avx512f.M512i))
    uint64: opTwoGen(nxor_avx512_u64, avx512f.M512i, nxorX86Gen(mm512_set1_epi32, mm512_xor_si512, avx512f.M512i))
  `andnot`:
    float32: mm512_andnot_ps
    float64: mm512_andnot_pd
    int8: mm512_andnot_si512
    int16: mm512_andnot_si512
    int32: mm512_andnot_si512
    int64: mm512_andnot_si512
    uint8: mm512_andnot_si512
    uint16: mm512_andnot_si512
    uint32: mm512_andnot_si512
    uint64: mm512_andnot_si512
  `ornot`:
    float32: opTwoGen(ornot_avx512_f32, avx512f.M512, ornotX86Gen(mm512_set1_epi32, mm512_or_ps, mm512_xor_ps, avx512f.M512))
    float64: opTwoGen(ornot_avx512_f64, avx512f.M512d, ornotX86Gen(mm512_set1_epi32, mm512_or_pd, mm512_xor_pd, avx512f.M512d))
    int8: opTwoGen(ornot_avx512_i8, avx512f.M512i, ornotX86Gen(mm512_set1_epi32, mm512_or_si512, mm512_xor_si512, avx512f.M512i))
    int16: opTwoGen(ornot_avx512_i16, avx512f.M512i, ornotX86Gen(mm512_set1_epi32, mm512_or_si512, mm512_xor_si512, avx512f.M512i))
    int32: opTwoGen(ornot_avx512_i32, avx512f.M512i, ornotX86Gen(mm512_set1_epi32, mm512_or_si512, mm512_xor_si512, avx512f.M512i))
    int64: opTwoGen(ornot_avx512_i64, avx512f.M512i, ornotX86Gen(mm512_set1_epi32, mm512_or_si512, mm512_xor_si512, avx512f.M512i))
    uint8: opTwoGen(ornot_avx512_u8, avx512f.M512i, ornotX86Gen(mm512_set1_epi32, mm512_or_si512, mm512_xor_si512, avx512f.M512i))
    uint16: opTwoGen(ornot_avx512_u16, avx512f.M512i, ornotX86Gen(mm512_set1_epi32, mm512_or_si512, mm512_xor_si512, avx512f.M512i))
    uint32: opTwoGen(ornot_avx512_u32, avx512f.M512i, ornotX86Gen(mm512_set1_epi32, mm512_or_si512, mm512_xor_si512, avx512f.M512i))
    uint64: opTwoGen(ornot_avx512_u64, avx512f.M512i, ornotX86Gen(mm512_set1_epi32, mm512_or_si512, mm512_xor_si512, avx512f.M512i))
  `shl`:
    float32: typeGen(shl_avx512_f32, mm512_sll_epi32, avx512f.M512, avx512f.M512i)
    float64: typeGen(shl_avx512_f64, mm512_sll_epi64, avx512f.M512d, avx512f.M512i)
    int8: opTwoGen(shl_avx512_i8, avx512f.M512i, shlX86Gen(mm512_unpacklo_epi8, mm512_unpackhi_epi8, mm512_sll_epi16, mm512_and_si512, mm512_set1_epi16, mm512_packus_epi16, avx512f.M512i))
    int16: mm512_sll_epi16
    int32: mm512_sll_epi32
    int64: mm512_sll_epi64
    uint8: opTwoGen(shl_avx512_u8, avx512f.M512i, shlX86Gen(mm512_unpacklo_epi8, mm512_unpackhi_epi8, mm512_sll_epi16, mm512_and_si512, mm512_set1_epi16, mm512_packus_epi16, avx512f.M512i))
    uint16: mm512_sll_epi16
    uint32: mm512_sll_epi32
    uint64: mm512_sll_epi64
  `shr`:
    float32: typeGen(shr_avx512_f32, mm512_srl_epi32, avx512f.M512, avx512f.M512i)
    float64: typeGen(shr_avx512_f64, mm512_srl_epi64, avx512f.M512d, avx512f.M512i)
    int8: opTwoGen(shr_avx512_i8, avx512f.M512i, shrX86Gen(mm512_unpacklo_epi8, mm512_unpackhi_epi8, mm512_sra_epi16, mm512_and_si512, mm512_set1_epi16, mm512_packus_epi16, avx512f.M512i))
    uint8: opTwoGen(shr_avx512_u8, avx512f.M512i, shrX86Gen(mm512_unpacklo_epi8, mm512_unpackhi_epi8, mm512_srl_epi16, mm512_and_si512, mm512_set1_epi16, mm512_packus_epi16, avx512f.M512i))
    int16: mm512_sra_epi16
    uint16: mm512_srl_epi16
    int32: mm512_sra_epi32
    uint32: mm512_srl_epi32
    int64: mm512_sra_epi64
    uint64: mm512_srl_epi64
  `min`:
    float32: mm512_min_ps
    float64: mm512_min_pd
    int8: mm512_min_epi8
    int16: mm512_min_epi16
    int32: mm512_min_epi32
    int64: mm512_min_epi64
    uint8: mm512_min_epu8
    uint16: mm512_min_epu16
    uint32: mm512_min_epu32
    uint64: mm512_min_epu64
  `max`:
    float32: mm512_max_ps
    float64: mm512_max_pd
    int8: mm512_max_epi8
    int16: mm512_max_epi16
    int32: mm512_max_epi32
    int64: mm512_max_epi64
    uint8: mm512_max_epu8
    uint16: mm512_max_epu16
    uint32: mm512_max_epu32
    uint64: mm512_max_epu64

simdUnaryInput("avx512"):
  `not`:
    float32: opOneGen(not_avx512_f32, avx512f.M512, notX86Gen(mm512_xor_ps, mm512_set1_epi32, avx512f.M512))
    float64: opOneGen(not_avx512_f64, avx512f.M512d, notX86Gen(mm512_xor_pd, mm512_set1_epi32, avx512f.M512d))
    int8: opOneGen(not_avx512_i8, avx512f.M512i, notX86Gen(mm512_xor_si512, mm512_set1_epi8, avx512f.M512i))
    int16: opOneGen(not_avx512_i16, avx512f.M512i, notX86Gen(mm512_xor_si512, mm512_set1_epi16, avx512f.M512i))
    int32: opOneGen(not_avx512_i32, avx512f.M512i, notX86Gen(mm512_xor_si512, mm512_set1_epi32, avx512f.M512i))
    int64: opOneGen(not_avx512_i64, avx512f.M512i, notX86Gen(mm512_xor_si512, mm512_set1_epi64, avx512f.M512i))
    uint8: opOneGen(not_avx512_u8, avx512f.M512i, notX86Gen(mm512_xor_si512, mm512_set1_epi8, avx512f.M512i))
    uint16: opOneGen(not_avx512_u16, avx512f.M512i, notX86Gen(mm512_xor_si512, mm512_set1_epi16, avx512f.M512i))
    uint32: opOneGen(not_avx512_u32, avx512f.M512i, notX86Gen(mm512_xor_si512, mm512_set1_epi32, avx512f.M512i))
    uint64: opOneGen(not_avx512_u64, avx512f.M512i, notX86Gen(mm512_xor_si512, mm512_set1_epi64, avx512f.M512i))
  `abs`:
    float32: opOneGen(abs_avx512_f32, avx512f.M512, absFloatX86Gen(mm512_set1_ps, (-0.0'f32), mm512_andnot_ps, avx512f.M512))
    float64: opOneGen(abs_avx512_f64, avx512f.M512d, absFloatX86Gen(mm512_set1_pd, (-0.0'f64), mm512_andnot_pd, avx512f.M512d))
    int8: mm512_abs_epi8
    int16: mm512_abs_epi16
    int32: mm512_abs_epi32
    int64: mm512_abs_epi64
    uint8: opOneGen(abs_avx512_u8, avx512f.M512i, absUintX86Gen())
    uint16: opOneGen(abs_avx512_u16, avx512f.M512i, absUintX86Gen())
    uint32: opOneGen(abs_avx512_u32, avx512f.M512i, absUintX86Gen())
    uint64: opOneGen(abs_avx512_u64, avx512f.M512i, absUintX86Gen())
  `sqrt`:
    float32: mm512_sqrt_ps
    float64: mm512_sqrt_pd
    int8: none
    int16: none
    int32: none
    int64: none
    uint8: none
    uint16: none
    uint32: none
    uint64: none

macro cmpltInt512Gen(vpcmp_inst, vmovdqu_inst, T: untyped): untyped =
  result = quote do:
    let kmask = `vpcmp_inst`(cast[`T`](a), cast[`T`](b), 1)  # _MM_CMPINT_LT
    return kmaskToVecMask512Gen(`vmovdqu_inst`, `T`)(kmask)

macro cmpgtInt512Gen(vpcmp_inst, vmovdqu_inst, T: untyped): untyped =
  result = quote do:
    let kmask = `vpcmp_inst`(cast[`T`](a), cast[`T`](b), 6)  # _MM_CMPINT_GT
    return kmaskToVecMask512Gen(`vmovdqu_inst`, `T`)(kmask)

macro cmpeqInt512Gen(vpcmp_inst, vmovdqu_inst, T: untyped): untyped =
  result = quote do:
    let kmask = `vpcmp_inst`(cast[`T`](a), cast[`T`](b), 0)  # _MM_CMPINT_EQ
    return kmaskToVecMask512Gen(`vmovdqu_inst`, `T`)(kmask)

macro cmpneqInt512Gen(vpcmp_inst, vmovdqu_inst, T: untyped): untyped =
  result = quote do:
    let kmask = `vpcmp_inst`(cast[`T`](a), cast[`T`](b), 4)  # _MM_CMPINT_NE
    return kmaskToVecMask512Gen(`vmovdqu_inst`, `T`)(kmask)

macro cmpleInt512Gen(vpcmp_inst, vmovdqu_inst, T: untyped): untyped =
  result = quote do:
    let kmask = `vpcmp_inst`(cast[`T`](a), cast[`T`](b), 2)  # _MM_CMPINT_LE
    return kmaskToVecMask512Gen(`vmovdqu_inst`, `T`)(kmask)

macro cmpgeInt512Gen(vpcmp_inst, vmovdqu_inst, T: untyped): untyped =
  result = quote do:
    let kmask = `vpcmp_inst`(cast[`T`](a), cast[`T`](b), 5)  # _MM_CMPINT_GE
    return kmaskToVecMask512Gen(`vmovdqu_inst`, `T`)(kmask)

# Unsigned variants
macro cmpltUint512Gen(vpcmpu_inst, vmovdqu_inst, T: untyped): untyped =
  result = quote do:
    let kmask = `vpcmpu_inst`(cast[`T`](a), cast[`T`](b), 1)
    return kmaskToVecMask512Gen(`vmovdqu_inst`, `T`)(kmask)

macro cmpgtUint512Gen(vpcmpu_inst, vmovdqu_inst, T: untyped): untyped =
  result = quote do:
    let kmask = `vpcmpu_inst`(cast[`T`](a), cast[`T`](b), 6)
    return kmaskToVecMask512Gen(`vmovdqu_inst`, `T`)(kmask)

macro cmpeqUint512Gen(vpcmpu_inst, vmovdqu_inst, T: untyped): untyped =
  result = quote do:
    let kmask = `vpcmpu_inst`(cast[`T`](a), cast[`T`](b), 0)
    return kmaskToVecMask512Gen(`vmovdqu_inst`, `T`)(kmask)

macro cmpneqUint512Gen(vpcmpu_inst, vmovdqu_inst, T: untyped): untyped =
  result = quote do:
    let kmask = `vpcmpu_inst`(cast[`T`](a), cast[`T`](b), 4)
    return kmaskToVecMask512Gen(`vmovdqu_inst`, `T`)(kmask)

macro cmpleUint512Gen(vpcmpu_inst, vmovdqu_inst, T: untyped): untyped =
  result = quote do:
    let kmask = `vpcmpu_inst`(cast[`T`](a), cast[`T`](b), 2)
    return kmaskToVecMask512Gen(`vmovdqu_inst`, `T`)(kmask)

macro cmpgeUint512Gen(vpcmpu_inst, vmovdqu_inst, T: untyped): untyped =
  result = quote do:
    let kmask = `vpcmpu_inst`(cast[`T`](a), cast[`T`](b), 5)
    return kmaskToVecMask512Gen(`vmovdqu_inst`, `T`)(kmask)

macro cmpFloat512Gen(vcmpp_inst, vmovdqu_int_inst, cast_inst, imm8: static int, T: untyped): untyped =
  result = quote do:
    let kmask = `vcmpp_inst`(cast[`T`](a), cast[`T`](b), `imm8`)
    let vec_int = `vmovdqu_int_inst`(kmask)
    return `cast_inst`(vec_int)

simdMaskInput("avx512"):
  `==`:
    float32: opTwoGen(cmpeq_avx512_f32, avx512f.M512, cmpFloat512Gen(mm512_cmp_ps_mask, mm512_movm_epi32, mm512_castsi512_ps, 0, avx512f.M512))
    float64: opTwoGen(cmpeq_avx512_f64, avx512f.M512d, cmpFloat512Gen(mm512_cmp_pd_mask, mm512_movm_epi64, mm512_castsi512_pd, 0, avx512f.M512d))
    int8: opTwoGen(cmpeq_avx512_i8, avx512f.M512i, cmpeqInt512Gen(mm512_cmp_epi8_mask, mm512_movm_epi8, avx512f.M512i))
    int16: opTwoGen(cmpeq_avx512_i16, avx512f.M512i, cmpeqInt512Gen(mm512_cmp_epi16_mask, mm512_movm_epi16, avx512f.M512i))
    int32: opTwoGen(cmpeq_avx512_i32, avx512f.M512i, cmpeqInt512Gen(mm512_cmp_epi32_mask, mm512_movm_epi32, avx512f.M512i))
    int64: opTwoGen(cmpeq_avx512_i64, avx512f.M512i, cmpeqInt512Gen(mm512_cmp_epi64_mask, mm512_movm_epi64, avx512f.M512i))
    uint8: opTwoGen(cmpeq_avx512_u8, avx512f.M512i, cmpeqUint512Gen(mm512_cmp_epu8_mask, mm512_movm_epi8, avx512f.M512i))
    uint16: opTwoGen(cmpeq_avx512_u16, avx512f.M512i, cmpeqUint512Gen(mm512_cmp_epu16_mask, mm512_movm_epi16, avx512f.M512i))
    uint32: opTwoGen(cmpeq_avx512_u32, avx512f.M512i, cmpeqUint512Gen(mm512_cmp_epu32_mask, mm512_movm_epi32, avx512f.M512i))
    uint64: opTwoGen(cmpeq_avx512_u64, avx512f.M512i, cmpeqUint512Gen(mm512_cmp_epu64_mask, mm512_movm_epi64, avx512f.M512i))
  `!=`:
    float32: opTwoGen(cmpneq_avx512_f32, avx512f.M512, cmpFloat512Gen(mm512_cmp_ps_mask, mm512_movm_epi32, mm512_castsi512_ps, 12, avx512f.M512))
    float64: opTwoGen(cmpneq_avx512_f64, avx512f.M512d, cmpFloat512Gen(mm512_cmp_pd_mask, mm512_movm_epi64, mm512_castsi512_pd, 12, avx512f.M512d))
    int8: opTwoGen(cmpneq_avx512_i8, avx512f.M512i, cmpneqInt512Gen(mm512_cmp_epi8_mask, mm512_movm_epi8, avx512f.M512i))
    int16: opTwoGen(cmpneq_avx512_i16, avx512f.M512i, cmpneqInt512Gen(mm512_cmp_epi16_mask, mm512_movm_epi16, avx512f.M512i))
    int32: opTwoGen(cmpneq_avx512_i32, avx512f.M512i, cmpneqInt512Gen(mm512_cmp_epi32_mask, mm512_movm_epi32, avx512f.M512i))
    int64: opTwoGen(cmpneq_avx512_i64, avx512f.M512i, cmpneqInt512Gen(mm512_cmp_epi64_mask, mm512_movm_epi64, avx512f.M512i))
    uint8: opTwoGen(cmpneq_avx512_u8, avx512f.M512i, cmpneqUint512Gen(mm512_cmp_epu8_mask, mm512_movm_epi8, avx512f.M512i))
    uint16: opTwoGen(cmpneq_avx512_u16, avx512f.M512i, cmpneqUint512Gen(mm512_cmp_epu16_mask, mm512_movm_epi16, avx512f.M512i))
    uint32: opTwoGen(cmpneq_avx512_u32, avx512f.M512i, cmpneqUint512Gen(mm512_cmp_epu32_mask, mm512_movm_epi32, avx512f.M512i))
    uint64: opTwoGen(cmpneq_avx512_u64, avx512f.M512i, cmpneqUint512Gen(mm512_cmp_epu64_mask, mm512_movm_epi64, avx512f.M512i))
  `<`:
    float32: opTwoGen(cmplt_avx512_f32, avx512f.M512, cmpFloat512Gen(mm512_cmp_ps_mask, mm512_movm_epi32, mm512_castsi512_ps, 1, avx512f.M512))
    float64: opTwoGen(cmplt_avx512_f64, avx512f.M512d, cmpFloat512Gen(mm512_cmp_pd_mask, mm512_movm_epi64, mm512_castsi512_pd, 1, avx512f.M512d))
    int8: opTwoGen(cmplt_avx512_i8, avx512f.M512i, cmpltInt512Gen(mm512_cmp_epi8_mask, mm512_movm_epi8, avx512f.M512i))
    int16: opTwoGen(cmplt_avx512_i16, avx512f.M512i, cmpltInt512Gen(mm512_cmp_epi16_mask, mm512_movm_epi16, avx512f.M512i))
    int32: opTwoGen(cmplt_avx512_i32, avx512f.M512i, cmpltInt512Gen(mm512_cmp_epi32_mask, mm512_movm_epi32, avx512f.M512i))
    int64: opTwoGen(cmplt_avx512_i64, avx512f.M512i, cmpltInt512Gen(mm512_cmp_epi64_mask, mm512_movm_epi64, avx512f.M512i))
    uint8: opTwoGen(cmplt_avx512_u8, avx512f.M512i, cmpltUint512Gen(mm512_cmp_epu8_mask, mm512_movm_epi8, avx512f.M512i))
    uint16: opTwoGen(cmplt_avx512_u16, avx512f.M512i, cmpltUint512Gen(mm512_cmp_epu16_mask, mm512_movm_epi16, avx512f.M512i))
    uint32: opTwoGen(cmplt_avx512_u32, avx512f.M512i, cmpltUint512Gen(mm512_cmp_epu32_mask, mm512_movm_epi32, avx512f.M512i))
    uint64: opTwoGen(cmplt_avx512_u64, avx512f.M512i, cmpltUint512Gen(mm512_cmp_epu64_mask, mm512_movm_epi64, avx512f.M512i))
  `>`:
    float32: opTwoGen(cmpgt_avx512_f32, avx512f.M512, cmpFloat512Gen(mm512_cmp_ps_mask, mm512_movm_epi32, mm512_castsi512_ps, 6, avx512f.M512))
    float64: opTwoGen(cmpgt_avx512_f64, avx512f.M512d, cmpFloat512Gen(mm512_cmp_pd_mask, mm512_movm_epi64, mm512_castsi512_pd, 6, avx512f.M512d))
    int8: opTwoGen(cmpgt_avx512_i8, avx512f.M512i, cmpgtInt512Gen(mm512_cmp_epi8_mask, mm512_movm_epi8, avx512f.M512i))
    int16: opTwoGen(cmpgt_avx512_i16, avx512f.M512i, cmpgtInt512Gen(mm512_cmp_epi16_mask, mm512_movm_epi16, avx512f.M512i))
    int32: opTwoGen(cmpgt_avx512_i32, avx512f.M512i, cmpgtInt512Gen(mm512_cmp_epi32_mask, mm512_movm_epi32, avx512f.M512i))
    int64: opTwoGen(cmpgt_avx512_i64, avx512f.M512i, cmpgtInt512Gen(mm512_cmp_epi64_mask, mm512_movm_epi64, avx512f.M512i))
    uint8: opTwoGen(cmpgt_avx512_u8, avx512f.M512i, cmpgtUint512Gen(mm512_cmp_epu8_mask, mm512_movm_epi8, avx512f.M512i))
    uint16: opTwoGen(cmpgt_avx512_u16, avx512f.M512i, cmpgtUint512Gen(mm512_cmp_epu16_mask, mm512_movm_epi16, avx512f.M512i))
    uint32: opTwoGen(cmpgt_avx512_u32, avx512f.M512i, cmpgtUint512Gen(mm512_cmp_epu32_mask, mm512_movm_epi32, avx512f.M512i))
    uint64: opTwoGen(cmpgt_avx512_u64, avx512f.M512i, cmpgtUint512Gen(mm512_cmp_epu64_mask, mm512_movm_epi64, avx512f.M512i))
  `>=`:
    float32: opTwoGen(cmpge_avx512_f32, avx512f.M512, cmpFloat512Gen(mm512_cmp_ps_mask, mm512_movm_epi32, mm512_castsi512_ps, 5, avx512f.M512))
    float64: opTwoGen(cmpge_avx512_f64, avx512f.M512d, cmpFloat512Gen(mm512_cmp_pd_mask, mm512_movm_epi64, mm512_castsi512_pd, 5, avx512f.M512d))
    int8: opTwoGen(cmpge_avx512_i8, avx512f.M512i, cmpgeInt512Gen(mm512_cmp_epi8_mask, mm512_movm_epi8, avx512f.M512i))
    int16: opTwoGen(cmpge_avx512_i16, avx512f.M512i, cmpgeInt512Gen(mm512_cmp_epi16_mask, mm512_movm_epi16, avx512f.M512i))
    int32: opTwoGen(cmpge_avx512_i32, avx512f.M512i, cmpgeInt512Gen(mm512_cmp_epi32_mask, mm512_movm_epi32, avx512f.M512i))
    int64: opTwoGen(cmpge_avx512_i64, avx512f.M512i, cmpgeInt512Gen(mm512_cmp_epi64_mask, mm512_movm_epi64, avx512f.M512i))
    uint8: opTwoGen(cmpge_avx512_u8, avx512f.M512i, cmpgeUint512Gen(mm512_cmp_epu8_mask, mm512_movm_epi8, avx512f.M512i))
    uint16: opTwoGen(cmpge_avx512_u16, avx512f.M512i, cmpgeUint512Gen(mm512_cmp_epu16_mask, mm512_movm_epi16, avx512f.M512i))
    uint32: opTwoGen(cmpge_avx512_u32, avx512f.M512i, cmpgeUint512Gen(mm512_cmp_epu32_mask, mm512_movm_epi32, avx512f.M512i))
    uint64: opTwoGen(cmpge_avx512_u64, avx512f.M512i, cmpgeUint512Gen(mm512_cmp_epu64_mask, mm512_movm_epi64, avx512f.M512i))
  `<=`:
    float32: opTwoGen(cmple_avx512_f32, avx512f.M512, cmpFloat512Gen(mm512_cmp_ps_mask, mm512_movm_epi32, mm512_castsi512_ps, 2, avx512f.M512))
    float64: opTwoGen(cmple_avx512_f64, avx512f.M512d, cmpFloat512Gen(mm512_cmp_pd_mask, mm512_movm_epi64, mm512_castsi512_pd, 2, avx512f.M512d))
    int8: opTwoGen(cmple_avx512_i8, avx512f.M512i, cmpleInt512Gen(mm512_cmp_epi8_mask, mm512_movm_epi8, avx512f.M512i))
    int16: opTwoGen(cmple_avx512_i16, avx512f.M512i, cmpleInt512Gen(mm512_cmp_epi16_mask, mm512_movm_epi16, avx512f.M512i))
    int32: opTwoGen(cmple_avx512_i32, avx512f.M512i, cmpleInt512Gen(mm512_cmp_epi32_mask, mm512_movm_epi32, avx512f.M512i))
    int64: opTwoGen(cmple_avx512_i64, avx512f.M512i, cmpleInt512Gen(mm512_cmp_epi64_mask, mm512_movm_epi64, avx512f.M512i))
    uint8: opTwoGen(cmple_avx512_u8, avx512f.M512i, cmpleUint512Gen(mm512_cmp_epu8_mask, mm512_movm_epi8, avx512f.M512i))
    uint16: opTwoGen(cmple_avx512_u16, avx512f.M512i, cmpleUint512Gen(mm512_cmp_epu16_mask, mm512_movm_epi16, avx512f.M512i))
    uint32: opTwoGen(cmple_avx512_u32, avx512f.M512i, cmpleUint512Gen(mm512_cmp_epu32_mask, mm512_movm_epi32, avx512f.M512i))
    uint64: opTwoGen(cmple_avx512_u64, avx512f.M512i, cmpleUint512Gen(mm512_cmp_epu64_mask, mm512_movm_epi64, avx512f.M512i))

simdLoadInput("avx512"):
  loadU:
    float32: mm512_loadu_ps
    float64: mm512_loadu_pd
    int8: opLoadGen(loadU_avx512_i8, ptr int8, avx512f.M512i, iLoadX86Gen(mm512_loadu_si512, avx512f.M512i))
    int16: opLoadGen(loadU_avx512_i16, ptr int16, avx512f.M512i, iLoadX86Gen(mm512_loadu_si512, avx512f.M512i))
    int32: opLoadGen(loadU_avx512_i32, ptr int32, avx512f.M512i, iLoadX86Gen(mm512_loadu_si512, avx512f.M512i))
    int64: opLoadGen(loadU_avx512_i64, ptr int64, avx512f.M512i, iLoadX86Gen(mm512_loadu_si512, avx512f.M512i))
    uint8: opLoadGen(loadU_avx512_u8, ptr uint8, avx512f.M512i, iLoadX86Gen(mm512_loadu_si512, avx512f.M512i))
    uint16: opLoadGen(loadU_avx512_u16, ptr uint16, avx512f.M512i, iLoadX86Gen(mm512_loadu_si512, avx512f.M512i))
    uint32: opLoadGen(loadU_avx512_u32, ptr uint32, avx512f.M512i, iLoadX86Gen(mm512_loadu_si512, avx512f.M512i))
    uint64: opLoadGen(loadU_avx512_u64, ptr uint64, avx512f.M512i, iLoadX86Gen(mm512_loadu_si512, avx512f.M512i))
  loadA:
    float32: mm512_load_ps
    float64: mm512_load_pd
    int8: opLoadGen(loadA_avx512_i8, ptr int8, avx512f.M512i, iLoadX86Gen(mm512_load_si512, avx512f.M512i))
    int16: opLoadGen(loadA_avx512_i16, ptr int16, avx512f.M512i, iLoadX86Gen(mm512_load_si512, avx512f.M512i))
    int32: opLoadGen(loadA_avx512_i32, ptr int32, avx512f.M512i, iLoadX86Gen(mm512_load_si512, avx512f.M512i))
    int64: opLoadGen(loadA_avx512_i64, ptr int64, avx512f.M512i, iLoadX86Gen(mm512_load_si512, avx512f.M512i))
    uint8: opLoadGen(loadA_avx512_u8, ptr uint8, avx512f.M512i, iLoadX86Gen(mm512_load_si512, avx512f.M512i))
    uint16: opLoadGen(loadA_avx512_u16, ptr uint16, avx512f.M512i, iLoadX86Gen(mm512_load_si512, avx512f.M512i))
    uint32: opLoadGen(loadA_avx512_u32, ptr uint32, avx512f.M512i, iLoadX86Gen(mm512_load_si512, avx512f.M512i))
    uint64: opLoadGen(loadA_avx512_u64, ptr uint64, avx512f.M512i, iLoadX86Gen(mm512_load_si512, avx512f.M512i))
  load1:
    float32: opLoadGen(load1_avx512_f32, ptr float32, avx512f.M512, fLoad1LoadX86Gen(mm512_broadcastss_ps, mm_load_ss))
    float64: opLoadGen(load1_avx512_f64, ptr float64, avx512f.M512d, fLoad1LoadX86Gen(mm512_broadcastsd_pd, mm_load_sd))
    int8: opLoadGen(load1_avx512_i8, ptr int8, avx512f.M512i, iLoad1LoadX86Gen(mm512_broadcastb_epi8, mm_loadu_si128))
    int16: opLoadGen(load1_avx512_i16, ptr int16, avx512f.M512i, iLoad1LoadX86Gen(mm512_broadcastw_epi16, mm_loadu_si128))
    int32: opLoadGen(load1_avx512_i32, ptr int32, avx512f.M512i, iLoad1LoadX86Gen(mm512_broadcastd_epi32, mm_loadu_si128))
    int64: opLoadGen(load1_avx512_i64, ptr int64, avx512f.M512i, iLoad1LoadX86Gen(mm512_broadcastq_epi64, mm_loadu_si128))
    uint8: opLoadGen(load1_avx512_u8, ptr uint8, avx512f.M512i, iLoad1LoadX86Gen(mm512_broadcastb_epi8, mm_loadu_si128))
    uint16: opLoadGen(load1_avx512_u16, ptr uint16, avx512f.M512i, iLoad1LoadX86Gen(mm512_broadcastw_epi16, mm_loadu_si128))
    uint32: opLoadGen(load1_avx512_u32, ptr uint32, avx512f.M512i, iLoad1LoadX86Gen(mm512_broadcastd_epi32, mm_loadu_si128))
    uint64: opLoadGen(load1_avx512_u64, ptr uint64, avx512f.M512i, iLoad1LoadX86Gen(mm512_broadcastq_epi64, mm_loadu_si128))
#[
# x86: AVX-512 128-bit mask
simdInput("mask128"):
  `+`:
    float32: mm_maskz_add_ps
    float64: mm_maskz_add_pd
    int8: none
    int16: none
    int32: mm_maskz_add_epi32
    int64: mm_maskz_add_epi64
    uint8: none
    uint16: none
    uint32: mm_maskz_add_epi32
    uint64: mm_maskz_add_epi64
  `-`:
    float32: mm_maskz_sub_ps
    float64: mm_maskz_sub_pd
    int8: none
    int16: none
    int32: mm_maskz_sub_epi32
    int64: mm_maskz_sub_epi64
    uint8: none
    uint16: none
    uint32: mm_maskz_sub_epi32
    uint64: mm_maskz_sub_epi64
  `and`:
    float32: maskGen(and_mask128_f32, mm_maskz_and_epi32, sse.M128, sse2.M128i, float32, uint32)
    float64: maskGen(and_mask128_f64, mm_maskz_and_epi64, sse2.M128d, sse2.M128i, float64, uint64)
    int8: maskGen(and_mask128_i8, mm_maskz_and_epi64, sse2.M128i, sse2.M128i, int8, uint64)
    int16: maskGen(and_mask128_i16, mm_maskz_and_epi64, sse2.M128i, sse2.M128i, int16, uint64)
    int32: mm_maskz_and_epi32
    int64: mm_maskz_and_epi64
    uint8: maskGen(and_mask128_u8, mm_maskz_and_epi64, sse2.M128i, sse2.M128i, uint8, uint64)
    uint16: maskGen(and_mask128_u16, mm_maskz_and_epi64, sse2.M128i, sse2.M128i, uint16, uint64)
    uint32: mm_maskz_and_epi32
    uint64: mm_maskz_and_epi64
  `or`:
    float32: maskGen(or_mask128_f32, mm_maskz_or_epi32, sse.M128, sse2.M128i, float32, uint32)
    float64: maskGen(or_mask128_f64, mm_maskz_or_epi64, sse2.M128d, sse2.M128i, float64, uint64)
    int8: maskGen(or_mask128_i8, mm_maskz_or_epi64, sse2.M128i, sse2.M128i, int8, uint64)
    int16: maskGen(or_mask128_i16, mm_maskz_or_epi64, sse2.M128i, sse2.M128i, int16, uint64)
    int32: mm_maskz_or_epi32
    int64: mm_maskz_or_epi64
    uint8: maskGen(or_mask128_u8, mm_maskz_or_epi64, sse2.M128i, sse2.M128i, uint8, uint64)
    uint16: maskGen(or_mask128_u16, mm_maskz_or_epi64, sse2.M128i, sse2.M128i, uint16, uint64)
    uint32: mm_maskz_or_epi32
    uint64: mm_maskz_or_epi32
  `xor`:
    float32: maskGen(xor_mask128_f32, mm_maskz_xor_epi32, sse.M128, sse2.M128i, float32, uint32)
    float64: maskGen(xor_mask128_f64, mm_maskz_xor_epi64, sse.M128d, sse2.M128i, float64, uint64)
    int8: maskGen(xor_mask128_i8, mm_maskz_xor_epi64, sse2.M128i, sse2.M128i, int8, uint64)
    int16: maskGen(xor_mask128_i16, mm_maskz_xor_epi64, sse2.M128i, sse2.M128i, int16, uint64)
    int32: mm_maskz_xor_epi32
    int64: mm_maskz_xor_epi64
    uint8: maskGen(xor_mask128_u8, mm_maskz_xor_epi64, sse2.M128i, sse2.M128i, uint8, uint64)
    uint16: maskGen(xor_mask128_u16, mm_maskz_xor_epi64, sse2.M128i, sse2.M128i, uint16, uint64)
    uint32: mm_maskz_xor_epi32
    uint64: mm_maskz_xor_epi64

# x86: AVX-512 256-bit mask
simdInput("mask256"):
  `+`:
    float32: mm256_maskz_add_ps
    float64: mm256_maskz_add_pd
    int8: none
    int16: none
    int32: mm256_maskz_add_epi32
    int64: mm256_maskz_add_epi64
    uint8: none
    uint16: none
    uint32: mm256_maskz_add_epi32
    uint64: mm256_maskz_add_epi64
  `-`:
    float32: mm256_maskz_sub_ps
    float64: mm256_maskz_sub_pd
    int8: none
    int16: none
    int32: mm256_maskz_sub_epi32
    int64: mm256_maskz_sub_epi64
    uint8: none
    uint16: none
    uint32: mm256_maskz_sub_epi32
    uint64: mm256_maskz_sub_epi64
  `and`:
    float32: maskGen(and_mask256_f32, mm256_maskz_and_epi32, avx.M256, avx.M256i, float32, uint32)
    float64: maskGen(and_mask256_f64, mm256_maskz_and_epi64, avx.M256, avx.M256i, float64, uint64)
    int8: maskGen(and_mask256_i8, mm256_maskz_and_epi64, avx.M256i, avx.M256i, int8, uint64)
    int16: maskGen(and_mask256_i16, mm256_maskz_and_epi64, avx.M256i, avx.M256i, int16, uint64)
    int32: mm256_maskz_and_epi32
    int64: mm256_maskz_and_epi64
    uint8: maskGen(and_mask256_u8, mm256_maskz_and_epi64, avx.M256i, avx.M256i, uint8, uint64)
    uint16: maskGen(and_mask256_u16, mm256_maskz_and_epi64, avx.M256i, avx.M256i, uint16, uint64)
    uint32: mm256_maskz_and_epi32
    uint64: mm256_maskz_and_epi64
  `or`:
    float32: maskGen(or_mask256_f32, mm256_maskz_or_epi32, avx.M256i, avx.M256i, float32, uint32)
    float64: maskGen(or_mask256_f64, mm256_maskz_or_epi64, avx.M256, avx.M256i, float64, uint64)
    int8: maskGen(or_mask256_i8, mm256_maskz_or_epi64, avx.M256i, avx.M256i, int8, uint64)
    int16: maskGen(or_mask256_i16, mm256_maskz_or_epi64, avx.M256i, avx.M256i, int16, uint64)
    int32: mm256_maskz_or_epi32
    int64: mm256_maskz_or_epi64
    uint8: maskGen(or_mask256_u8, mm256_maskz_or_epi64, avx.M256i, avx.M256i, uint8, uint64)
    uint16: maskGen(or_mask256_u16, mm256_maskz_or_epi64, avx.M256i, avx.M256i, uint16, uint64)
    uint32: mm256_maskz_or_epi32
    uint64: mm256_maskz_or_epi32
  `xor`:
    float32: maskGen(xor_mask256_f32, mm256_maskz_xor_epi32, avx.M256, avx.M256i, float32, uint32)
    float64: maskGen(xor_mask256_f64, mm256_maskz_xor_epi64, avx.M256, avx.M256i, float64, uint64)
    int8: maskGen(xor_mask256_i8, mm256_maskz_xor_epi64, avx.M256i, avx.M256i, int8, uint64)
    int16: maskGen(xor_mask256_i16, mm256_maskz_xor_epi64, avx.M256i, avx.M256i, int16, uint64)
    int32: mm256_maskz_xor_epi32
    int64: mm256_maskz_xor_epi64
    uint8: maskGen(xor_mask256_u8, mm256_maskz_xor_epi64, avx.M256i, avx.M256i, uint8, uint64)
    uint16: maskGen(xor_mask256_u16, mm256_maskz_xor_epi64, avx.M256i, avx.M256i, uint16, uint64)
    uint32: mm256_maskz_xor_epi32
    uint64: mm256_maskz_xor_epi64
]#
macro nandArmGen(and_inst, not_inst, T: untyped): untyped =
  result = quote do:
    let andRes = `and_inst`(cast[`T`](a), cast[`T`](b))
    return `not_inst`(andRes)

macro norArmGen(or_inst, not_inst, T: untyped): untyped =
  result = quote do:
    let orRes = `or_inst`(cast[`T`](a), cast[`T`](b))
    return `not_inst`(orRes)

macro norArmGen(xor_inst, not_inst, T: untyped): untyped =
  result = quote do:
    let xorRes = `xor_inst`(cast[`T`](a), cast[`T`](b))
    return `not_inst`(xorRes)

macro andnotArmGen(and_inst, not_inst, T: untyped): untyped =
  result = quote do:
    let notRes = `not_inst`(cast[`T`](b))
    return `and_inst(a, notRes)

macro ornotArmGen(or_inst, not_inst, T: untyped): untyped =
  result = quote do:
    let notRes = `not_inst`(cast[`T`](b))
    return `or_inst`(a, notRes)

macro shlArmGen(shl_inst, T: untyped): untyped =
  result = quote do:
    return `shl_inst`(cast[`T`](a), b)

macro shrArmGen(shl_inst, neg_inst, T: untyped): untyped =
  result = quote do:
    let negRes = `neg_inst`(b)
    return `shl_inst`(cast[`T`](a), negRes)

macro absUintArmGen(): untyped =
  result = quote do:
    return a

macro cmpneqNeonGen(vceq_inst, vnot_inst, T: untyped): untyped =
  result = quote do:
    let eq_mask = `vceq_inst`(cast[`T`](a), cast[`T`](b))
    return `vnot_inst`(eq_mask)

# ARM / NEON
simdInput("neon"):
  `+`:
    float32: vaddq_f32
    float64: vaddq_f64
    int8: vaddq_s8
    int16: vaddq_s16
    int32: vaddq_s32
    int64: vaddq_s64
    uint8: vaddq_u8
    uint16: vaddq_u16
    uint32: vaddq_u32
    uint64: vaddq_u64
  `-`:
    float32: vsubq_f32
    float64: vsubq_f64
    int8: vsubq_s8
    int16: vsubq_s16
    int32: vsubq_s32
    int64: vsubq_s64
    uint8: vsubq_u8
    uint16: vsubq_u16
    uint32: vsubq_u32
    uint64: vsubq_u64
  `*`:
    float32: vmulq_f32
    float64: vmulq_f64
    int8: vmulq_s8
    int16: vmulq_s16
    int32: vmulq_s32
    int64: none
    uint8: vmulq_u8
    uint16: vmulq_u16
    uint32: vmulq_u32
    uint64: none
  `and`:
    float32: typeGen(and_neon_f32, vandq_u32, neon.Float32x4, neon.Uint32x4)
    float64: typeGen(and_neon_f64, vandq_u64, neon.Float64x2, neon.Uint64x2)
    int8: vandq_s8
    int16: vandq_s16
    int32: vandq_s32
    int64: vandq_s64
    uint8: vandq_u8
    uint16: vandq_u16
    uint32: vandq_u32
    uint64: vandq_u64
  `or`:
    float32: typeGen(or_neon_f32, vorrq_u32, neon.Float32x4, neon.Uint32x4)
    float64: typeGen(or_neon_f64, vorrq_u32, neon.Float32x4, neon.Uint32x4)
    int8: vorrq_s8
    int16: vorrq_s16
    int32: vorrq_s32
    int64: vorrq_s64
    uint8: vorrq_u8
    uint16: vorrq_u16
    uint32: vorrq_u32
    uint64: vorrq_u64
  `xor`:
    float32: typeGen(xor_neon_f32, veorq_u32, neon.Float32x4, neon.Uint32x4)
    float64: typeGen(xor_neon_f64, veorq_u64, neon.Float64x2, neon.Uint64x2)
    int8: veorq_s8
    int16: veorq_s16
    int32: veorq_s32
    int64: veorq_s64
    uint8: veorq_u8
    uint16: veorq_u16
    uint32: veorq_u32
    uint64: veorq_u64
  `nand`:
    float32: opTwoGen(nand_neon_f32, neon.Float32x4, nandArmGen(vandq_u32, vmvnq_u32, neon.Uint32x4))
    float64: opTwoGen(nand_neon_f64, neon.Float64x2, nandArmGen(vandq_u32, vmvnq_u32, neon.Uint32x4))
    int8: opTwoGen(nand_neon_i8, neon.Int8x16, nandArmGen(vandq_u32, vmvnq_u32, neon.Uint32x4))
    int16: opTwoGen(nand_neon_i16, neon.Int16x8, nandArmGen(vandq_u32, vmvnq_u32, neon.Uint32x4))
    int32: opTwoGen(nand_neon_i32, neon.Int32x4, nandArmGen(vandq_u32, vmvnq_u32, neon.Uint32x4))
    int64: opTwoGen(nand_neon_i64, neon.Int64x2, nandArmGen(vandq_u32, vmvnq_u32, neon.Uint32x4))
    uint8: opTwoGen(nand_neon_u8, neon.Uint8x16, nandArmGen(vandq_u32, vmvnq_u32, neon.Uint32x4))
    uint16: opTwoGen(nand_neon_u16, neon.Uint16x8, nandArmGen(vandq_u32, vmvnq_u32, neon.Uint32x4))
    uint32: opTwoGen(nand_neon_u32, neon.Uint32x4, nandArmGen(vandq_u32, vmvnq_u32, neon.Uint32x4))
    uint64: opTwoGen(nand_neon_u64, neon.Uint64x2, nandArmGen(vandq_u32, vmvnq_u32, neon.Uint32x4))
  `nor`:
    float32: opTwoGen(nor_neon_f32, neon.Float32x4, norArmGen(vorrq_u32, vmvnq_u32, neon.Uint32x4))
    float64: opTwoGen(nor_neon_f64, neon.Float64x2, norArmGen(vorrq_u32, vmvnq_u32, neon.Uint32x4))
    int8: opTwoGen(nor_neon_i8, neon.Int8x16, norArmGen(vorrq_u32, vmvnq_u32, neon.Uint32x4))
    int16: opTwoGen(nor_neon_i16, neon.Int16x8, norArmGen(vorrq_u32, vmvnq_u32, neon.Uint32x4))
    int32: opTwoGen(nor_neon_i32, neon.Int32x4, norArmGen(vorrq_u32, vmvnq_u32, neon.Uint32x4))
    int64: opTwoGen(nor_neon_i64, neon.Int64x2, norArmGen(vorrq_u32, vmvnq_u32, neon.Uint32x4))
    uint8: opTwoGen(nor_neon_u8, neon.Uint8x16, norArmGen(vorrq_u32, vmvnq_u32, neon.Uint32x4))
    uint16: opTwoGen(nor_neon_u16, neon.Uint16x8, norArmGen(vorrq_u32, vmvnq_u32, neon.Uint32x4))
    uint32: opTwoGen(nor_neon_u32, neon.Uint32x4, norArmGen(vorrq_u32, vmvnq_u32, neon.Uint32x4))
    uint64: opTwoGen(nor_neon_u64, neon.Uint64x2, norArmGen(vorrq_u32, vmvnq_u32, neon.Uint32x4))
  `nxor`:
    float32: opTwoGen(nxor_neon_f32, neon.Float32x4, norArmGen(veorq_u32, vmvnq_u32, neon.Uint32x4))
    float64: opTwoGen(nxor_neon_f64, neon.Float64x2, norArmGen(veorq_u32, vmvnq_u32, neon.Uint32x4))
    int8: opTwoGen(nxor_neon_i8, neon.Int8x16, norArmGen(veorq_u32, vmvnq_u32, neon.Uint32x4))
    int16: opTwoGen(nxor_neon_i16, neon.Int16x8, norArmGen(veorq_u32, vmvnq_u32, neon.Uint32x4))
    int32: opTwoGen(nxor_neon_i32, neon.Int32x4, norArmGen(veorq_u32, vmvnq_u32, neon.Uint32x4))
    int64: opTwoGen(nxor_neon_i64, neon.Int64x2, norArmGen(veorq_u32, vmvnq_u32, neon.Uint32x4))
    uint8: opTwoGen(nxor_neon_u8, neon.Uint8x16, norArmGen(veorq_u32, vmvnq_u32, neon.Uint32x4))
    uint16: opTwoGen(nxor_neon_u16, neon.Uint16x8, norArmGen(veorq_u32, vmvnq_u32, neon.Uint32x4))
    uint32: opTwoGen(nxor_neon_u32, neon.Uint32x4, norArmGen(veorq_u32, vmvnq_u32, neon.Uint32x4))
    uint64: opTwoGen(nxor_neon_u64, neon.Uint64x2, norArmGen(veorq_u32, vmvnq_u32, neon.Uint32x4))
  `andnot`:
    float32: opTwoGen(andnot_neon_f32, neon.Float32x4, andnotArmGen(vandq_f32, vmvnq_f32, neon.Float32x4))
    float64: opTwoGen(andnot_neon_f64, neon.Float64x2, andnotArmGen(vandq_f64, vmvnq_f64, neon.Float64x2))
    int8: opTwoGen(andnot_neon_i8, neon.Int8x16, andnotArmGen(vandq_s8, vmvnq_s8, neon.Int8x16))
    int16: opTwoGen(andnot_neon_i16, neon.Int16x8, andnotArmGen(vandq_s16, vmvnq_s16, neon.Int16x8))
    int32: opTwoGen(andnot_neon_i32, neon.Int32x4, andnotArmGen(vandq_s32, vmvnq_s32, neon.Int32x4))
    int64: opTwoGen(andnot_neon_i64, neon.Int64x2, andnotArmGen(vandq_s64, vmvnq_s64, neon.Int64x2))
    uint8: opTwoGen(andnot_neon_u8, neon.Uint8x16, andnotArmGen(vandq_u8, vmvnq_u8, neon.Uint8x16))
    uint16: opTwoGen(andnot_neon_u16, neon.Uint16x8, andnotArmGen(vandq_u16, vmvnq_u16, neon.Uint16x8))
    uint32: opTwoGen(andnot_neon_u32, neon.Uint32x4, andnotArmGen(vandq_u32, vmvnq_u32, neon.Uint32x4))
    uint64: opTwoGen(andnot_neon_u64, neon.Uint64x2, andnotArmGen(vandq_u64, vmvnq_u64, neon.Uint64x2))
  `ornot`:
    float32: opTwoGen(ornot_neon_f32, neon.Float32x4, ornotArmGen(vorrq_f32, vmvnq_f32, neon.Float32x4))
    float64: opTwoGen(ornot_neon_f64, neon.Float64x2, ornotArmGen(vorrq_f64, vmvnq_f64, neon.Float64x2))
    int8: opTwoGen(ornot_neon_i8, neon.Int8x16, ornotArmGen(vorrq_s8, vmvnq_s8, neon.Int8x16))
    int16: opTwoGen(ornot_neon_i16, neon.Int16x8, ornotArmGen(vorrq_s16, vmvnq_s16, neon.Int16x8))
    int32: opTwoGen(ornot_neon_i32, neon.Int32x4, ornotArmGen(vorrq_s32, vmvnq_s32, neon.Int32x4))
    int64: opTwoGen(ornot_neon_i64, neon.Int64x2, ornotArmGen(vorrq_s64, vmvnq_s64, neon.Int64x2))
    uint8: opTwoGen(ornot_neon_u8, neon.Uint8x16, ornotArmGen(vorrq_u8, vmvnq_u8, neon.Uint8x16))
    uint16: opTwoGen(ornot_neon_u16, neon.Uint16x8, ornotArmGen(vorrq_u16, vmvnq_u16, neon.Uint16x8))
    uint32: opTwoGen(ornot_neon_u32, neon.Uint32x4, ornotArmGen(vorrq_u32, vmvnq_u32, neon.Uint32x4))
    uint64: opTwoGen(ornot_neon_u64, neon.Uint64x2, ornotArmGen(vorrq_u64, vmvnq_u64, neon.Uint64x2))
  `shl`:
    float32: opTwoDiffGen(shl_neon_f32, neon.Float32x4, neon.Int32x4, neon.Float32x4, shlArmGen(vshlq_u8, neon.Uint32x4))
    float64: opTwoDiffGen(shl_neon_f64, neon.Float64x2, neon.Int64x2, neon.Float64x2, shlArmGen(vshlq_u8, neon.Uint64x2))
    int8: vshlq_s8
    int16: vshlq_s16
    int32: vshlq_s32
    int64: vshlq_s64
    uint8: opTwoDiffGen(shl_neon_u8, neon.Uint8x16, neon.Int8x16, neon.Uint8x16, shlArmGen(vshlq_u8, neon.Uint8x16))
    uint16: opTwoDiffGen(shl_neon_u16, neon.Uint16x8, neon.Int16x8, neon.Uint16x8, shlArmGen(vshlq_u8, neon.Uint16x8))
    uint32: opTwoDiffGen(shl_neon_u32, neon.Uint32x4, neon.Int32x4, neon.Uint32x4, shlArmGen(vshlq_u8, neon.Uint32x4))
    uint64: opTwoDiffGen(shl_neon_u64, neon.Uint64x2, neon.Int64x2, neon.Uint64x2, shlArmGen(vshlq_u8, neon.Uint64x2))
  `shr`:
    float32: opTwoDiffGen(shr_neon_f32, neon.Float32x4, neon.Int32x4, neon.Float32x4, shrArmGen(vshlq_u32, vnegq_s32, neon.Uint32x4))
    float64: opTwoDiffGen(shr_neon_f64, neon.Float64x2, neon.Int64x2, neon.Float64x2, shrArmGen(vshlq_u64, vnegq_s64, neon.Uint64x2))
    int8: opTwoGen(shr_neon_i8, neon.Int8x16, shrArmGen(vshlq_s8, vnegq_s8, neon.Int8x16))
    int16: opTwoGen(shr_neon_i16, neon.Int16x8, shrArmGen(vshlq_s16, vnegq_s16, neon.Int16x8))
    int32: opTwoGen(shr_neon_i32, neon.Int32x4, shrArmGen(vshlq_s32, vnegq_s32, neon.Int32x4))
    int64: opTwoGen(shr_neon_i64, neon.Int64x2, shrArmGen(vshlq_s64, vnegq_s64, neon.Int64x2))
    uint8: opTwoDiffGen(shr_neon_u8, neon.Uint8x16, neon.Int8x16, neon.Uint8x16, shrArmGen(vshlq_u8, vnegq_s8, neon.Uint8x16))
    uint16: opTwoDiffGen(shr_neon_u16, neon.Uint16x8, neon.Int16x8, neon.Uint16x8, shrArmGen(vshlq_u16, vnegq_s16, neon.Uint16x8))
    uint32: opTwoDiffGen(shr_neon_u32, neon.Uint32x4, neon.Int32x4, neon.Uint32x4, shrArmGen(vshlq_u32, vnegq_s32, neon.Uint32x4))
    uint64: opTwoDiffGen(shr_neon_u64, neon.Uint64x2, neon.Int64x2, neon.Uint64x2, shrArmGen(vshlq_u64, vnegq_s64, neon.Uint64x2))
  `min`:
    float32: vminq_f32
    float64: vminq_f64
    int8: vminq_s8
    int16: vminq_s16
    int32: vminq_s32
    int64: none
    uint8: vminq_u8
    uint16: vminq_u16
    uint32: vminq_u32
    uint64: none
  `max`:
    float32: vmaxq_f32
    float64: vmaxq_f64
    int8: vmaxq_s8
    int16: vmaxq_s16
    int32: vmaxq_s32
    int64: none
    uint8: vmaxq_u8
    uint16: vmaxq_u16
    uint32: vmaxq_u32
    uint64: none

simdUnaryInput("neon"):
  `not`:
    float32: typeGen(not_neon_f32, vmvnq_u32, neon.Float32x4, neon.Uint32x4)
    float64: typeGen(not_neon_f64, vmvnq_u64, neon.Float64x2, neon.Uint64x2)
    int8: vmvnq_s8
    int16: vmvnq_s16
    int32: vmvnq_s32
    int64: vmvnq_s64
    uint8: vmvnq_u8
    uint16: vmvnq_u16
    uint32: vmvnq_u32
    uint64: vmvnq_u64
  `abs`:
    float32: vabsq_f32
    float64: vabsq_f64
    int8: vabsq_s8
    int16: vabsq_s16
    int32: vabsq_s32
    int64: vabsq_s64
    uint8: opOneGen(abs_neon_u8, neon.Uint8x16, absUintArmGen())
    uint16: opOneGen(abs_neon_u16, neon.Uint16x8, absUintArmGen())
    uint32: opOneGen(abs_neon_u32, neon.Uint32x4, absUintArmGen())
    uint64: opOneGen(abs_neon_u64, neon.Uint64x2, absUintArmGen())
  `sqrt`:
    float32: vsqrtq_f32
    float64: vsqrtq_f64
    int8: none
    int16: none
    int32: none
    int64: none
    uint8: none
    uint16: none
    uint32: none
    uint64: none

simdMaskInput("neon"):
  `==`:
    float32: vceq_f32
    float64: vceq_f64
    int8: vceq_s8
    int16: vceq_s16
    int32: vceq_s32
    int64: vceq_s64
    uint8: vceq_u8
    uint16: vceq_u16
    uint32: vceq_u32
    uint64: vceq_u64
  `!=`:
    float32: opTwoGen(cmpneq_neon_f32, neon.Float32x4, cmpneqNeonGen(vceq_f32, vmvn_f32, neon.Float32x4))
    float64: opTwoGen(cmpneq_neon_f64, neon.Float64x2, cmpneqNeonGen(vceq_f64, vmvn_f64, neon.Float64x2))
    int8: opTwoGen(cmpneq_neon_i8, neon.Int8x16, cmpneqNeonGen(vceq_s8, vmvn_s8, neon.Int8x16))
    int16: opTwoGen(cmpneq_neon_i16, neon.Int16x8, cmpneqNeonGen(vceq_s16, vmvn_s16, neon.Int16x8))
    int32: opTwoGen(cmpneq_neon_i32, neon.Int32x4, cmpneqNeonGen(vceq_s32, vmvn_s32, neon.Int32x4))
    int64: opTwoGen(cmpneq_neon_i64, neon.Int64x2, cmpneqNeonGen(vceq_s64, vmvn_s64, neon.Int64x2))
    uint8: opTwoGen(cmpneq_neon_u8, neon.Uint8x16, cmpneqNeonGen(vceq_u8, vmvn_u8, neon.Uint8x16))
    uint16: opTwoGen(cmpneq_neon_u16, neon.Uint16x8, cmpneqNeonGen(vceq_u16, vmvn_u16, neon.Uint16x8))
    uint32: opTwoGen(cmpneq_neon_u32, neon.Uint32x4, cmpneqNeonGen(vceq_u32, vmvn_u32, neon.Uint32x4))
    uint64: opTwoGen(cmpneq_neon_u64, neon.Uint64x2, cmpneqNeonGen(vceq_u64, vmvn_u64, neon.Uint64x2))
  `<`:
    float32: vclt_f32
    float64: vclt_f64
    int8: vclt_s8
    int16: vclt_s16
    int32: vclt_s32
    int64: vclt_s64
    uint8: vclt_u8
    uint16: vclt_u16
    uint32: vclt_u32
    uint64: vclt_u64
  `>`:
    float32: vcgt_f32
    float64: vcgt_f64
    int8: vcgt_s8
    int16: vcgt_s16
    int32: vcgt_s32
    int64: vcgt_s64
    uint8: vcgt_u8
    uint16: vcgt_u16
    uint32: vcgt_u32
    uint64: vcgt_u64
  `>=`:
    float32: vcge_f32
    float64: vcge_f64
    int8: vcge_s8
    int16: vcge_s16
    int32: vcge_s32
    int64: vcge_s64
    uint8: vcge_u8
    uint16: vcge_u16
    uint32: vcge_u32
    uint64: vcge_u64
  `<=`:
    float32: vcle_f32
    float64: vcle_f64
    int8: vcle_s8
    int16: vcle_s16
    int32: vcle_s32
    int64: vcle_s64
    uint8: vcle_u8
    uint16: vcle_u16
    uint32: vcle_u32
    uint64: vcle_u64

macro nandLAGen*(and_inst, nor_inst, T: untyped): untyped =
  result = quote do:
    let andRes = `and_inst`(cast[`T`](a), cast[`T`](b))
    return `nor_inst`(andRes, andRes)

macro nxorLAGen*(xor_inst, nor_inst, T, R: untyped): untyped =
  result = quote do:
    let xorRes = `xor_inst`(cast[`T`](a), cast[`T`](b))
    return cast[`R`](`nor_inst`(xorRes, xorRes))

macro notLAGen(nor_inst: untyped, T): untyped =
  result = quote do:
    return `nor_inst`(cast[`T`](a), cast[`T`](a))

macro absUintLAGen(): untyped =
  result = quote do:
    return a

macro cmpgtFloatLAGen(clt_inst, T: untyped): untyped =
  result = quote do:
    return `clt_inst`(cast[`T`](b), cast[`T`](a))

macro cmpgeFloatLAGen(cle_inst, T: untyped): untyped =
  result = quote do:
    return `cle_inst`(cast[`T`](b), cast[`T`](a))

macro cmpneqIntLAGen(vseq_inst, vnor_inst, T: untyped): untyped =
  result = quote do:
    let eq_mask = `vseq_inst`(cast[`T`](a), cast[`T`](b))
    return `vnor_inst`(eq_mask, eq_mask)

# LoongArch: LSX
simdInput("lsx"):
  `+`:
    float32: lsx_vfadd_s
    float64: lsx_vfadd_d
    int8: lsx_vadd_b
    int16: lsx_vadd_h
    int32: lsx_vadd_w
    int64: lsx_vadd_d
    uint8: lsx_vadd_b
    uint16: lsx_vadd_h
    uint32: lsx_vadd_w
    uint64: lsx_vadd_d
  `-`:
    float32: lsx_vfsub_s
    float64: lsx_vfsub_d
    int8: lsx_vsub_b
    int16: lsx_vsub_h
    int32: lsx_vsub_w
    int64: lsx_vsub_d
    uint8: lsx_vsub_b
    uint16: lsx_vsub_h
    uint32: lsx_vsub_w
    uint64: lsx_vsub_d
  `*`:
    float32: lsx_vfmul_s
    float64: lsx_vfmul_d
    int8: lsx_vmul_b
    int16: lsx_vmul_h
    int32: lsx_vmul_w
    int64: lsx_vmul_d
    uint8: lsx_vmul_b
    uint16: lsx_vmul_h
    uint32: lsx_vmul_w
    uint64: lsx_vmul_d
  `and`:
    float32: typeGen(and_lsx_f32, lsx_vand_v, lsx.M128, lsx.M128i)
    float64: typeGen(and_lsx_f64, lsx_vand_v, lsx.M128d, lsx.M128i)
    int8: lsx_vand_v
    int16: lsx_vand_v
    int32: lsx_vand_v
    int64: lsx_vand_v
    uint8: lsx_vand_v
    uint16: lsx_vand_v
    uint32: lsx_vand_v
    uint64: lsx_vand_v
  `or`:
    float32: typeGen(or_lsx_f32, lsx_vor_v, lsx.M128, lsx.M128i)
    float64: typeGen(or_lsx_f64, lsx_vor_v, lsx.M128d, lsx.M128i)
    int8: lsx_vor_v
    int16: lsx_vor_v
    int32: lsx_vor_v
    int64: lsx_vor_v
    uint8: lsx_vor_v
    uint16: lsx_vor_v
    uint32: lsx_vor_v
    uint64: lsx_vor_v
  `xor`:
    float32: typeGen(xor_lsx_f32, lsx_vxor_v, lsx.M128, lsx.M128i)
    float64: typeGen(xor_lsx_f64, lsx_vxor_v, lsx.M128d, lsx.M128i)
    int8: lsx_vxor_v
    int16: lsx_vxor_v
    int32: lsx_vxor_v
    int64: lsx_vxor_v
    uint8: lsx_vxor_v
    uint16: lsx_vxor_v
    uint32: lsx_vxor_v
    uint64: lsx_vxor_v
  `nand`:
    float32: opTwoGen(nand_lsx_f32, lsx.M128, nandLAGen(lsx_vand_v, lsx_vnor_v, lsx.M128i))
    float64: opTwoGen(nand_lsx_f64, lsx.M128d, nandLAGen(lsx_vand_v, lsx_vnor_v, lsx.M128i))
    int8: opTwoGen(nand_lsx_i8, lsx.M128i, nandLAGen(lsx_vand_v, lsx_vnor_v, lsx.M128i))
    int16: opTwoGen(nand_lsx_i16, lsx.M128i, nandLAGen(lsx_vand_v, lsx_vnor_v, lsx.M128i))
    int32: opTwoGen(nand_lsx_i32, lsx.M128i, nandLAGen(lsx_vand_v, lsx_vnor_v, lsx.M128i))
    int64: opTwoGen(nand_lsx_i64, lsx.M128i, nandLAGen(lsx_vand_v, lsx_vnor_v, lsx.M128i))
    uint8: opTwoGen(nand_lsx_u8, lsx.M128i, nandLAGen(lsx_vand_v, lsx_vnor_v, lsx.M128i))
    uint16: opTwoGen(nand_lsx_u16, lsx.M128i, nandLAGen(lsx_vand_v, lsx_vnor_v, lsx.M128i))
    uint32: opTwoGen(nand_lsx_u32, lsx.M128i, nandLAGen(lsx_vand_v, lsx_vnor_v, lsx.M128i))
    uint64: opTwoGen(nand_lsx_u64, lsx.M128i, nandLAGen(lsx_vand_v, lsx_vnor_v, lsx.M128i))
  `nor`:
    float32: typeGen(nor_lsx_f32, lsx_vnor_v, lsx.M128, lsx.M128i)
    float64: typeGen(nor_lsx_f64, lsx_vnor_v, lsx.M128d, lsx.M128i)
    int8: lsx_vnor_v
    int16: lsx_vnor_v
    int32: lsx_vnor_v
    int64: lsx_vnor_v
    uint8: lsx_vnor_v
    uint16: lsx_vnor_v
    uint32: lsx_vnor_v
    uint64: lsx_vnor_v
  `nxor`:
    float32: opTwoGen(nxor_lsx_f32, lsx.M128, nxorLAGen(lsx_vxor_v, lsx_vnor_v, lsx.M128i, lsx.M128))
    float64: opTwoGen(nxor_lsx_f64, lsx.M128d, nxorLAGen(lsx_vxor_v, lsx_vnor_v, lsx.M128i, lsx.M128d))
    int8: opTwoGen(nxor_lsx_i8, lsx.M128i, nxorLAGen(lsx_vxor_v, lsx_vnor_v, lsx.M128i, lsx.M128i))
    int16: opTwoGen(nxor_lsx_i16, lsx.M128i, nxorLAGen(lsx_vxor_v, lsx_vnor_v, lsx.M128i, lsx.M128i))
    int32: opTwoGen(nxor_lsx_i32, lsx.M128i, nxorLAGen(lsx_vxor_v, lsx_vnor_v, lsx.M128i, lsx.M128i))
    int64: opTwoGen(nxor_lsx_i64, lsx.M128i, nxorLAGen(lsx_vxor_v, lsx_vnor_v, lsx.M128i, lsx.M128i))
    uint8: opTwoGen(nxor_lsx_u8, lsx.M128i, nxorLAGen(lsx_vxor_v, lsx_vnor_v, lsx.M128i, lsx.M128i))
    uint16: opTwoGen(nxor_lsx_u16, lsx.M128i, nxorLAGen(lsx_vxor_v, lsx_vnor_v, lsx.M128i, lsx.M128i))
    uint32: opTwoGen(nxor_lsx_u32, lsx.M128i, nxorLAGen(lsx_vxor_v, lsx_vnor_v, lsx.M128i, lsx.M128i))
    uint64: opTwoGen(nxor_lsx_u64, lsx.M128i, nxorLAGen(lsx_vxor_v, lsx_vnor_v, lsx.M128i, lsx.M128i))
  `andnot`:
    float32: typeGen(andnot_lsx_f32, lsx_vandn_v, lsx.M128, lsx.M128i)
    float64: typeGen(andnot_lsx_f64, lsx_vandn_v, lsx.M128d, lsx.M128i)
    int8: lsx_vandn_v
    int16: lsx_vandn_v
    int32: lsx_vandn_v
    int64: lsx_vandn_v
    uint8: lsx_vandn_v
    uint16: lsx_vandn_v
    uint32: lsx_vandn_v
    uint64: lsx_vandn_v
  `ornot`:
    float32: typeGen(ornot_lsx_f32, lsx_vorn_v, lsx.M128, lsx.M128i)
    float64: typeGen(ornot_lsx_f64, lsx_vorn_v, lsx.M128d, lsx.M128i)
    int8: lsx_vorn_v
    int16: lsx_vorn_v
    int32: lsx_vorn_v
    int64: lsx_vorn_v
    uint8: lsx_vorn_v
    uint16: lsx_vorn_v
    uint32: lsx_vorn_v
    uint64: lsx_vorn_v
  `shl`:
    float32: typeGen(shl_lsx_f32, lsx_vsll_w, lsx.M128, lsx.M128i)
    float64: typeGen(shl_lsx_f64, lsx_vsll_d, lsx.M128d, lsx.M128i)
    int8: lsx_vsll_b
    int16: lsx_vsll_h
    int32: lsx_vsll_w
    int64: lsx_vsll_d
    uint8: lsx_vsll_b
    uint16: lsx_vsll_h
    uint32: lsx_vsll_w
    uint64: lsx_vsll_d
  `shr`:
    float32: typeGen(shr_lsx_f32, lsx_vsrl_w, lsx.M128, lsx.M128i)
    float64: typeGen(shr_lsx_f64, lsx_vsrl_d, lsx.M128d, lsx.M128i)
    int8: lsx_vsra_b
    int16: lsx_vsra_h
    int32: lsx_vsra_w
    int64: lsx_vsra_d
    uint8: lsx_vsrl_b
    uint16: lsx_vsrl_h
    uint32: lsx_vsrl_w
    uint64: lsx_vsrl_d
  `min`:
    float32: lsx_vfmin_s
    float64: lsx_vfmin_d
    int8: lsx_vmin_b
    int16: lsx_vmin_h
    int32: lsx_vmin_w
    int64: lsx_vmin_d
    uint8: lsx_vmin_bu
    uint16: lsx_vmin_hu
    uint32: lsx_vmin_wu
    uint64: lsx_vmin_du
  `max`:
    float32: lsx_vfmax_s
    float64: lsx_vfmax_d
    int8: lsx_vmax_b
    int16: lsx_vmax_h
    int32: lsx_vmax_w
    int64: lsx_vmax_d
    uint8: lsx_vmax_bu
    uint16: lsx_vmax_hu
    uint32: lsx_vmax_wu
    uint64: lsx_vmax_du

simdUnaryInput("lsx"):
  `not`:
    float32: opOneGen(not_lsx_f32, lsx.M128, notLAGen(lsx_vnor_v, lsx.M128i))
    float64: opOneGen(not_lsx_f64, lsx.M128d, notLAGen(lsx_vnor_v, lsx.M128i))
    int8: opOneGen(not_lsx_i8, lsx.M128i, notLAGen(lsx_vnor_v, lsx.M128i))
    int16: opOneGen(not_lsx_i16, lsx.M128i, notLAGen(lsx_vnor_v, lsx.M128i))
    int32: opOneGen(not_lsx_i32, lsx.M128i, notLAGen(lsx_vnor_v, lsx.M128i))
    int64: opOneGen(not_lsx_i64, lsx.M128i, notLAGen(lsx_vnor_v, lsx.M128i))
    uint8: opOneGen(not_lsx_u8, lsx.M128i, notLAGen(lsx_vnor_v, lsx.M128i))
    uint16: opOneGen(not_lsx_u16, lsx.M128i, notLAGen(lsx_vnor_v, lsx.M128i))
    uint32: opOneGen(not_lsx_u32, lsx.M128i, notLAGen(lsx_vnor_v, lsx.M128i))
    uint64: opOneGen(not_lsx_u64, lsx.M128i, notLAGen(lsx_vnor_v, lsx.M128i))
  `abs`:
    float32: lsx_vfabs_s
    float64: lsx_vfabs_d
    int8: lsx_vabs_b
    int16: lsx_vabs_h
    int32: lsx_vabs_w
    int64: lsx_vabs_d
    uint8: opOneGen(abs_lsx_u8, lsx.M128i, absUintLAGen())
    uint16: opOneGen(abs_lsx_u16, lsx.M128i, absUintLAGen())
    uint32: opOneGen(abs_lsx_u32, lsx.M128i, absUintLAGen())
    uint64: opOneGen(abs_lsx_u64, lsx.M128i, absUintLAGen())
  `sqrt`:
    float32: lsx_vfsqrt_s
    float64: lsx_vfsqrt_d
    int8: none
    int16: none
    int32: none
    int64: none
    uint8: none
    uint16: none
    uint32: none
    uint64: none

simdMaskInput("lsx"):
  `==`:
    float32: lsx_vfcmp_ceq_s
    float64: lsx_vfcmp_ceq_d
    int8: lsx_vseq_b
    int16: lsx_vseq_h
    int32: lsx_vseq_w
    int64: lsx_vseq_d
    uint8: lsx_vseq_b
    uint16: lsx_vseq_h
    uint32: lsx_vseq_w
    uint64: lsx_vseq_d
  `!=`:
    float32: lsx_vfcmp_cne_s
    float64: lsx_vfcmp_cne_d
    int8: opTwoGen(cmpneq_lsx_i8, lsx.M128i, cmpneqIntLAGen(lsx_vseq_b, lsx_vnor_v, lsx.M128i))
    int16: opTwoGen(cmpneq_lsx_i16, lsx.M128i, cmpneqIntLAGen(lsx_vseq_h, lsx_vnor_v, lsx.M128i))
    int32: opTwoGen(cmpneq_lsx_i32, lsx.M128i, cmpneqIntLAGen(lsx_vseq_w, lsx_vnor_v, lsx.M128i))
    int64: opTwoGen(cmpneq_lsx_i64, lsx.M128i, cmpneqIntLAGen(lsx_vseq_d, lsx_vnor_v, lsx.M128i))
    uint8: opTwoGen(cmpneq_lsx_u8, lsx.M128i, cmpneqIntLAGen(lsx_vseq_b, lsx_vnor_v, lsx.M128i))
    uint16: opTwoGen(cmpneq_lsx_u16, lsx.M128i, cmpneqIntLAGen(lsx_vseq_h, lsx_vnor_v, lsx.M128i))
    uint32: opTwoGen(cmpneq_lsx_u32, lsx.M128i, cmpneqIntLAGen(lsx_vseq_w, lsx_vnor_v, lsx.M128i))
    uint64: opTwoGen(cmpneq_lsx_u64, lsx.M128i, cmpneqIntLAGen(lsx_vseq_d, lsx_vnor_v, lsx.M128i))
  `<`:
    float32: lsx_vfcmp_clt_s
    float64: lsx_vfcmp_clt_d
    int8: lsx_vslt_b
    int16: lsx_vslt_h
    int32: lsx_vslt_w
    int64: lsx_vslt_d
    uint8: lsx_vsltu_b
    uint16: lsx_vsltu_h
    uint32: lsx_vsltu_w
    uint64: lsx_vsltu_d
  `>`:
    float32: opTwoGen(cmpgt_lsx_f32, lsx.M128, cmpgtFloatLAGen(lsx_vfcmp_clt_s, lsx.M128))
    float64: opTwoGen(cmpgt_lsx_f64, lsx.M128d, cmpgtFloatLAGen(lsx_vfcmp_clt_d, lsx.M128d))
    int8: lsx_vsgt_b
    int16: lsx_vsgt_h
    int32: lsx_vsgt_w
    int64: lsx_vsgt_d
    uint8: lsx_vsgtu_b
    uint16: lsx_vsgtu_h
    uint32: lsx_vsgtu_w
    uint64: lsx_vsgtu_d
  `>=`:
    float32: opTwoGen(cmpge_lsx_f32, lsx.M128, cmpgeFloatLAGen(lsx_vfcmp_cle_s, lsx.M128))
    float64: opTwoGen(cmpge_lsx_f64, lsx.M128d, cmpgeFloatLAGen(lsx_vfcmp_cle_d, lsx.M128d))
    int8: lsx_vsge_b
    int16: lsx_vsge_h
    int32: lsx_vsge_w
    int64: lsx_vsge_d
    uint8: lsx_vsgeu_b
    uint16: lsx_vsgeu_h
    uint32: lsx_vsgeu_w
    uint64: lsx_vsgeu_d
  `<=`:
    float32: lsx_vfcmp_cle_s
    float64: lsx_vfcmp_cle_d
    int8: lsx_vsle_b
    int16: lsx_vsle_h
    int32: lsx_vsle_w
    int64: lsx_vsle_d
    uint8: lsx_vsleu_b
    uint16: lsx_vsleu_h
    uint32: lsx_vsleu_w
    uint64: lsx_vsleu_d

# LoongArch: LASX
simdInput("lasx"):
  `+`:
    float32: lasx_xvfadd_s
    float64: lasx_xvfadd_d
    int8: lasx_xvadd_b
    int16: lasx_xvadd_h
    int32: lasx_xvadd_w
    int64: lasx_xvadd_d
    uint8: lasx_xvadd_b
    uint16: lasx_xvadd_h
    uint32: lasx_xvadd_w
    uint64: lasx_xvadd_d
  `-`:
    float32: lasx_xvfsub_s
    float64: lasx_xvfsub_d
    int8: lasx_xvsub_b
    int16: lasx_xvsub_h
    int32: lasx_xvsub_w
    int64: lasx_xvsub_d
    uint8: lasx_xvsub_b
    uint16: lasx_xvsub_h
    uint32: lasx_xvsub_w
    uint64: lasx_xvsub_d
  `*`:
    float32: lasx_xvfmul_s
    float64: lasx_xvfmul_d
    int8: lasx_xvmul_b
    int16: lasx_xvmul_h
    int32: lasx_xvmul_w
    int64: lasx_xvmul_d
    uint8: lasx_xvmul_b
    uint16: lasx_xvmul_h
    uint32: lasx_xvmul_w
    uint64: lasx_xvmul_d
  `and`:
    float32: typeGen(and_lasx_f32, lasx_xvand_v, lasx.M256, lasx.M256i)
    float64: typeGen(and_lasx_f64, lasx_xvand_v, lasx.M256d, lasx.M256i)
    int8: lasx_xvand_v
    int16: lasx_xvand_v
    int32: lasx_xvand_v
    int64: lasx_xvand_v
    uint8: lasx_xvand_v
    uint16: lasx_xvand_v
    uint32: lasx_xvand_v
    uint64: lasx_xvand_v
  `or`:
    float32: typeGen(or_lasx_f32, lasx_xvor_v, lasx.M256, lasx.M256i)
    float64: typeGen(or_lasx_f64, lasx_xvor_v, lasx.M256d, lasx.M256i)
    int8: lasx_xvor_v
    int16: lasx_xvor_v
    int32: lasx_xvor_v
    int64: lasx_xvor_v
    uint8: lasx_xvor_v
    uint16: lasx_xvor_v
    uint32: lasx_xvor_v
    uint64: lasx_xvor_v
  `xor`:
    float32: typeGen(xor_lasx_f32, lasx_xvxor_v, lasx.M256, lasx.M256i)
    float64: typeGen(xor_lasx_f64, lasx_xvxor_v, lasx.M256d, lasx.M256i)
    int8: lasx_xvxor_v
    int16: lasx_xvxor_v
    int32: lasx_xvxor_v
    int64: lasx_xvxor_v
    uint8: lasx_xvxor_v
    uint16: lasx_xvxor_v
    uint32: lasx_xvxor_v
    uint64: lasx_xvxor_v
  `nand`:
    float32: opTwoGen(nand_lasx_f32, lasx.M256, nandLAGen(lasx_xvand_v, lasx_xvnor_v, lasx.M256i))
    float64: opTwoGen(nand_lasx_f64, lasx.M256d, nandLAGen(lasx_xvand_v, lasx_xvnor_v, lasx.M256i))
    int8: opTwoGen(nand_lasx_i8, lasx.M256i, nandLAGen(lasx_xvand_v, lasx_xvnor_v, lasx.M256i))
    int16: opTwoGen(nand_lasx_i16, lasx.M256i, nandLAGen(lasx_xvand_v, lasx_xvnor_v, lasx.M256i))
    int32: opTwoGen(nand_lasx_i32, lasx.M256i, nandLAGen(lasx_xvand_v, lasx_xvnor_v, lasx.M256i))
    int64: opTwoGen(nand_lasx_i64, lasx.M256i, nandLAGen(lasx_xvand_v, lasx_xvnor_v, lasx.M256i))
    uint8: opTwoGen(nand_lasx_u8, lasx.M256i, nandLAGen(lasx_xvand_v, lasx_xvnor_v, lasx.M256i))
    uint16: opTwoGen(nand_lasx_u16, lasx.M256i, nandLAGen(lasx_xvand_v, lasx_xvnor_v, lasx.M256i))
    uint32: opTwoGen(nand_lasx_u32, lasx.M256i, nandLAGen(lasx_xvand_v, lasx_xvnor_v, lasx.M256i))
    uint64: opTwoGen(nand_lasx_u64, lasx.M256i, nandLAGen(lasx_xvand_v, lasx_xvnor_v, lasx.M256i))
  `nor`:
    float32: typeGen(nor_lasx_f32, lasx_xvnor_v, lasx.M256, lasx.M256i)
    float64: typeGen(nor_lasx_f64, lasx_xvnor_v, lasx.M256d, lasx.M256i)
    int8: lasx_xvnor_v
    int16: lasx_xvnor_v
    int32: lasx_xvnor_v
    int64: lasx_xvnor_v
    uint8: lasx_xvnor_v
    uint16: lasx_xvnor_v
    uint32: lasx_xvnor_v
    uint64: lasx_xvnor_v
  `nxor`:
    float32: opTwoGen(nxor_lasx_f32, lasx.M256, nxorLAGen(lasx_xvxor_v, lasx_xvnor_v, lasx.M256i, lasx.M256))
    float64: opTwoGen(nxor_lasx_f64, lasx.M256d, nxorLAGen(lasx_xvxor_v, lasx_xvnor_v, lasx.M256i, lasx.M256d))
    int8: opTwoGen(nxor_lasx_i8, lasx.M256i, nxorLAGen(lasx_xvxor_v, lasx_xvnor_v, lasx.M256i, lasx.M256i))
    int16: opTwoGen(nxor_lasx_i16, lasx.M256i, nxorLAGen(lasx_xvxor_v, lasx_xvnor_v, lasx.M256i, lasx.M256i))
    int32: opTwoGen(nxor_lasx_i32, lasx.M256i, nxorLAGen(lasx_xvxor_v, lasx_xvnor_v, lasx.M256i, lasx.M256i))
    int64: opTwoGen(nxor_lasx_i64, lasx.M256i, nxorLAGen(lasx_xvxor_v, lasx_xvnor_v, lasx.M256i, lasx.M256i))
    uint8: opTwoGen(nxor_lasx_u8, lasx.M256i, nxorLAGen(lasx_xvxor_v, lasx_xvnor_v, lasx.M256i, lasx.M256i))
    uint16: opTwoGen(nxor_lasx_u16, lasx.M256i, nxorLAGen(lasx_xvxor_v, lasx_xvnor_v, lasx.M256i, lasx.M256i))
    uint32: opTwoGen(nxor_lasx_u32, lasx.M256i, nxorLAGen(lasx_xvxor_v, lasx_xvnor_v, lasx.M256i, lasx.M256i))
    uint64: opTwoGen(nxor_lasx_u64, lasx.M256i, nxorLAGen(lasx_xvxor_v, lasx_xvnor_v, lasx.M256i, lasx.M256i))
  `andnot`:
    float32: typeGen(andnot_lasx_f32, lasx_xvandn_v, lasx.M256, lasx.M256i)
    float64: typeGen(andnot_lasx_f64, lasx_xvandn_v, lasx.M256d, lasx.M256i)
    int8: lasx_xvandn_v
    int16: lasx_xvandn_v
    int32: lasx_xvandn_v
    int64: lasx_xvandn_v
    uint8: lasx_xvandn_v
    uint16: lasx_xvandn_v
    uint32: lasx_xvandn_v
    uint64: lasx_xvandn_v
  `ornot`:
    float32: typeGen(ornot_lasx_f32, lasx_xvorn_v, lasx.M256, lasx.M256i)
    float64: typeGen(ornot_lasx_f64, lasx_xvorn_v, lasx.M256d, lasx.M256i)
    int8: lasx_xvorn_v
    int16: lasx_xvorn_v
    int32: lasx_xvorn_v
    int64: lasx_xvorn_v
    uint8: lasx_xvorn_v
    uint16: lasx_xvorn_v
    uint32: lasx_xvorn_v
    uint64: lasx_xvorn_v
  `shl`:
    float32: typeGen(shl_lasx_f32, lasx_xsll_w, lasx.M256, lasx.M256i)
    float64: typeGen(shl_lasx_f64, lasx_xsll_d, lasx.M256d, lasx.M256i)
    int8: lasx_xsll_b
    int16: lasx_xsll_h
    int32: lasx_xsll_w
    int64: lasx_xsll_d
    uint8: lasx_xsll_b
    uint16: lasx_xsll_h
    uint32: lasx_xsll_w
    uint64: lasx_xsll_d
  `shr`:
    float32: typeGen(shr_lasx_f32, lasx_xsrl_w, lasx.M256, lasx.M256i)
    float64: typeGen(shr_lasx_f64, lasx_xsrl_d, lasx.M256d, lasx.M256i)
    int8: lasx_xsra_b
    int16: lasx_xsra_h
    int32: lasx_xsra_w
    int64: lasx_xsra_d
    uint8: lasx_xsrl_b
    uint16: lasx_xsrl_h
    uint32: lasx_xsrl_w
    uint64: lasx_xsrl_d
  `min`:
    float32: lasx_xvfmin_s
    float64: lasx_xvfmin_d
    int8: lasx_xvmin_b
    int16: lasx_xvmin_h
    int32: lasx_xvmin_w
    int64: lasx_xvmin_d
    uint8: lasx_xvmin_bu
    uint16: lasx_xvmin_hu
    uint32: lasx_xvmin_wu
    uint64: lasx_xvmin_du
  `max`:
    float32: lasx_xvfmax_s
    float64: lasx_xvfmax_d
    int8: lasx_xvmax_b
    int16: lasx_xvmax_h
    int32: lasx_xvmax_w
    int64: lasx_xvmax_d
    uint8: lasx_xvmax_bu
    uint16: lasx_xvmax_hu
    uint32: lasx_xvmax_wu
    uint64: lasx_xvmax_du

simdUnaryInput("lasx"):
  `not`:
    float32: opOneGen(not_lasx_f32, lasx.M256, notLAGen(lasx_xvnor_v, lasx.M256i))
    float64: opOneGen(not_lasx_f64, lasx.M256d, notLAGen(lasx_xvnor_v, lasx.M256i))
    int8: opOneGen(not_lasx_i8, lasx.M256i, notLAGen(lasx_xvnor_v, lasx.M256i))
    int16: opOneGen(not_lasx_i16, lasx.M256i, notLAGen(lasx_xvnor_v, lasx.M256i))
    int32: opOneGen(not_lasx_i32, lasx.M256i, notLAGen(lasx_xvnor_v, lasx.M256i))
    int64: opOneGen(not_lasx_i64, lasx.M256i, notLAGen(lasx_xvnor_v, lasx.M256i))
    uint8: opOneGen(not_lasx_u8, lasx.M256i, notLAGen(lasx_xvnor_v, lasx.M256i))
    uint16: opOneGen(not_lasx_u16, lasx.M256i, notLAGen(lasx_xvnor_v, lasx.M256i))
    uint32: opOneGen(not_lasx_u32, lasx.M256i, notLAGen(lasx_xvnor_v, lasx.M256i))
    uint64: opOneGen(not_lasx_u64, lasx.M256i, notLAGen(lasx_xvnor_v, lasx.M256i))
  `abs`:
    float32: lasx_xvfabs_s
    float64: lasx_xvfabs_d
    int8: lasx_xvabs_b
    int16: lasx_xvabs_h
    int32: lasx_xvabs_w
    int64: lasx_xvabs_d
    uint8: opOneGen(abs_lasx_u8, lasx.M256i, absUintLAGen())
    uint16: opOneGen(abs_lasx_u16, lasx.M256i, absUintLAGen())
    uint32: opOneGen(abs_lasx_u32, lasx.M256i, absUintLAGen())
    uint64: opOneGen(abs_lasx_u64, lasx.M256i, absUintLAGen())
  `sqrt`:
    float32: lasx_xvfsqrt_s
    float64: lasx_xvfsqrt_d
    int8: error
    int16: error
    int32: error
    int64: error
    uint8: error
    uint16: none
    uint32: none
    uint64: none

simdMaskInput("lasx"):
  `==`:
    float32: lasx_xvfcmp_ceq_s
    float64: lasx_xvfcmp_ceq_d
    int8: lasx_xvseq_b
    int16: lasx_xvseq_h
    int32: lasx_xvseq_w
    int64: lasx_xvseq_d
    uint8: lasx_xvseq_b
    uint16: lasx_xvseq_h
    uint32: lasx_xvseq_w
    uint64: lasx_xvseq_d
  `!=`:
    float32: lasx_xvfcmp_cne_s
    float64: lasx_xvfcmp_cne_d
    int8: opTwoGen(cmpneq_lasx_i8, lasx.M256i, cmpneqIntLAGen(lasx_xvseq_b, lasx_xvnor_v, lasx.M256i))
    int16: opTwoGen(cmpneq_lasx_i16, lasx.M256i, cmpneqIntLAGen(lasx_xvseq_h, lasx_xvnor_v, lasx.M256i))
    int32: opTwoGen(cmpneq_lasx_i32, lasx.M256i, cmpneqIntLAGen(lasx_xvseq_w, lasx_xvnor_v, lasx.M256i))
    int64: opTwoGen(cmpneq_lasx_i64, lasx.M256i, cmpneqIntLAGen(lasx_xvseq_d, lasx_xvnor_v, lasx.M256i))
    uint8: opTwoGen(cmpneq_lasx_u8, lasx.M256i, cmpneqIntLAGen(lasx_xvseq_b, lasx_xvnor_v, lasx.M256i))
    uint16: opTwoGen(cmpneq_lasx_u16, lasx.M256i, cmpneqIntLAGen(lasx_xvseq_h, lasx_xvnor_v, lasx.M256i))
    uint32: opTwoGen(cmpneq_lasx_u32, lasx.M256i, cmpneqIntLAGen(lasx_xvseq_w, lasx_xvnor_v, lasx.M256i))
    uint64: opTwoGen(cmpneq_lasx_u64, lasx.M256i, cmpneqIntLAGen(lasx_xvseq_d, lasx_xvnor_v, lasx.M256i))
  `<`:
    float32: lasx_xvfcmp_clt_s
    float64: lasx_xvfcmp_clt_d
    int8: lasx_xvslt_b
    int16: lasx_xvslt_h
    int32: lasx_xvslt_w
    int64: lasx_xvslt_d
    uint8: lasx_xvsltu_b
    uint16: lasx_xvsltu_h
    uint32: lasx_xvsltu_w
    uint64: lasx_xvsltu_d
  `>`:
    float32: opTwoGen(cmpgt_lasx_f32, lasx.M256, cmpgtFloatLAGen(lasx_xvfcmp_clt_s, lasx.M256))
    float64: opTwoGen(cmpgt_lasx_f64, lasx.M256d, cmpgtFloatLAGen(lasx_xvfcmp_clt_d, lasx.M256d))
    int8: lasx_xvsgt_b
    int16: lasx_xvsgt_h
    int32: lasx_xvsgt_w
    int64: lasx_xvsgt_d
    uint8: lasx_xvsgtu_b
    uint16: lasx_xvsgtu_h
    uint32: lasx_xvsgtu_w
    uint64: lasx_xvsgtu_d
  `>=`:
    float32: opTwoGen(cmpge_lasx_f32, lasx.M256, cmpgeFloatLAGen(lasx_xvfcmp_cle_s, lasx.M256))
    float64: opTwoGen(cmpge_lasx_f64, lasx.M256d, cmpgeFloatLAGen(lasx_xvfcmp_cle_d, lasx.M256d))
    int8: lasx_xvsge_b
    int16: lasx_xvsge_h
    int32: lasx_xvsge_w
    int64: lasx_xvsge_d
    uint8: lasx_xvsgeu_b
    uint16: lasx_xvsgeu_h
    uint32: lasx_xvsgeu_w
    uint64: lasx_xvsgeu_d
  `<=`:
    float32: lasx_xvfcmp_cle_s
    float64: lasx_xvfcmp_cle_d
    int8: lasx_xvsle_b
    int16: lasx_xvsle_h
    int32: lasx_xvsle_w
    int64: lasx_xvsle_d
    uint8: lasx_xvsleu_b
    uint16: lasx_xvsleu_h
    uint32: lasx_xvsleu_w
    uint64: lasx_xvsleu_d

generateSimdCode()

var a: array[4, float32] = [1.0, 1.0, 1.0, 1.0]
var b: array[4, float32] = [0.1, 0.1, 0.1, 0.1]
echo $a
echo $b
var aR: f32r128 = cast[f32r128](a)
var bR: f32r128 = cast[f32r128](b)
var cR: f32r128 = aR + bR
echo $(cast[array[4, float32]](cR))

var d: array[8, int32] = [1, 1, 1, 1, 1, 1, 1, 1]
var e: array[8, int32] = [2, 2, 2, 2, 2, 2, 2, 2]
echo $d
echo $e
var dR: i32r256 = cast[i32r256](d)
var eR: i32r256 = cast[i32r256](e)
var fR: i32r256 = dR + eR
echo $(cast[array[8, int32]](fR))
