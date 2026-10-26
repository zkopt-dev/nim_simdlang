

when defined(amd64) or defined(i386):
  # GCC/Clang CPUID API
  proc getCpuid(leaf: uint32;
                a: ptr uint32; b: ptr uint32;
                c: ptr uint32; d: ptr uint32)
                {.importc: "__get_cpuid", header: "<cpuid.h>".}

  proc getCpuidCount(leaf: uint32; subleaf: uint32;
                     a: ptr uint32; b: ptr uint32;
                     c: ptr uint32; d: ptr uint32)
                     {.importc: "__get_cpuid_count", header: "<cpuid.h>".}

  var
    initialized: bool = false
    hasSse, hasSse2, hasSse3, hasSsse3, hasSse41, hasSse42: bool
    hasAvx, hasAvx2, hasAvx512, hasAvx10: bool

  proc initX86CpuFeatures() =
    if initialized: return

    var a, b, c, d: uint32

    # -------------------------
    # CPUID leaf 1
    # -------------------------
    getCpuid(1'u32, addr a, addr b, addr c, addr d)

    let edx1 = d
    let ecx1 = c

    hasSse   = (edx1 and (1 shl 25)) != 0
    hasSse2  = (edx1 and (1 shl 26)) != 0
    hasSse3  = (ecx1 and (1 shl 0)) != 0
    hasSsse3 = (ecx1 and (1 shl 9)) != 0
    hasSse41 = (ecx1 and (1 shl 19)) != 0
    hasSse42 = (ecx1 and (1 shl 20)) != 0
    hasAvx   = (ecx1 and (1 shl 28)) != 0

    # -------------------------
    # CPUID leaf 7, subleaf 0
    # -------------------------
    getCpuidCount(7'u32, 0'u32, addr a, addr b, addr c, addr d)

    let ebx7 = b
    let edx7 = d

    hasAvx2   = (ebx7 and (1 shl 5)) != 0
    hasAvx512 = (ebx7 and (1 shl 16)) != 0

    # -------------------------
    # CPUID leaf 7, subleaf 1
    # -------------------------
    getCpuidCount(7'u32, 1'u32, addr a, addr b, addr c, addr d)

    let edx7_1 = d
    hasAvx10   = (edx7_1 and (1 shl 19)) != 0

    initialized = true


proc sseExists*(): bool {.inline.} =
  when defined(amd64): true 
  elif defined(i386):
    initX86CpuFeatures()
    hasSse
  else: false

proc sse2Exists*(): bool {.inline.} =
  when defined(amd64): true
  elif defined(i386):
    initX86CpuFeatures()
    hasSse2
  else: false

proc sse3Exists*(): bool {.inline.} =
  when defined(amd64) or defined(i386):
    initX86CpuFeatures()
    hasSse3
  else: false

proc ssse3Exists*(): bool {.inline.} =
  when defined(amd64) or defined(i386):
    initX86CpuFeatures()
    hasSsse3
  else: false

proc sse41Exists*(): bool {.inline.} =
  when defined(amd64) or defined(i386):
    initX86CpuFeatures()
    hasSse41
  else: false

proc sse42Exists*(): bool {.inline.} =
  when defined(amd64) or defined(i386):
    initX86CpuFeatures()
    hasSse42
  else: false

proc avxExists*(): bool {.inline.} =
  when defined(amd64) or defined(i386):
    initX86CpuFeatures()
    hasAvx
  else: false

proc avx2Exists*(): bool {.inline.} =
  when defined(amd64) or defined(i386):
    initX86CpuFeatures()
    hasAvx2
  else: false

proc avx512Exists*(): bool {.inline.} =
  when defined(amd64) or defined(i386):
    initX86CpuFeatures()
    hasAvx512
  else: false

proc avx10Exists*(): bool {.inline.} =
  when defined(amd64) or defined(i386):
    initX86CpuFeatures()
    hasAvx10
  else: false

proc neonExists*(): bool {.inline.} =
  when defined(arm64): true 
  elif defined(arm):
    defined(neon) 
  else: false

proc lsxExists*(): bool {.inline.} =
  when defined(loongarch64):
    true 
  else: false

proc lasxExists*(): bool {.inline.} =
  when defined(loongarch64):
    defined(lasx)
  else: false

let
  SSE*: bool = sseExists()
  SSE2*: bool = sse2Exists()
  SSE3*: bool = sse3Exists()
  SSSE3*: bool = ssse3Exists()
  SSE41*: bool = sse41Exists()
  SSE42*: bool = sse42Exists()
  AVX*: bool = avxExists()
  AVX2*: bool = avx2Exists()
  AVX512*: bool = avx512Exists()
  AVX10*: bool = avx10Exists()
  NEON*: bool = true
  LSX*: bool = true
  LASX*: bool = true
  ALTIVEC*: bool = true
