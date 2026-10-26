type
  int128* {.importc: "__int128", header: "<altivec.h>", bycopy.} = object

  float128* {.importc: "__Float128",  header: "<altivec.h>", bycopy.} = object

  ibm128* {.importc: "__ibm128", header: "<altivec.h>", bycopy.} = object

  decimal32* {.importc: "__Decimal32", header: "<altivec.h>", bycopy.} = object
  decimal64* {.importc: "__Decimal64", header: "<altivec.h>", bycopy.} = object
  decimal128* {.importc: "_Decimal128", header: "<altivec.h>", bycopy.} = object

  VSC* {.importc: "__vector signed char", header: "<altivec.h>", bycopy.} = object
    ## vector signed char (16 × int8)

  VSS* {.importc: "__vector signed short", header: "<altivec.h>", bycopy.} = object
    ## vector signed short (8 × int16)

  VSI* {.importc: "__vector signed int", header: "<altivec.h>", bycopy.} = object
    ## vector signed int (4 × int32)

  VSLL* {.importc: "__vector signed long long", header: "<altivec.h>", bycopy.} = object
    ## vector signed long long (2 × int64)

  VSQ* {.importc: "__vector signed __int128", header: "<altivec.h>", bycopy.} = object
    ## vector signed __int128 (1 × int128)

  # --- Unsigned Integer Vectors ---
  VUC* {.importc: "__vector unsigned char", header: "<altivec.h>", bycopy.} = object
    ## vector unsigned char (16 × uint8)

  VUS* {.importc: "__vector unsigned short", header: "<altivec.h>", bycopy.} = object
    ## vector unsigned short (8 × uint16)

  VUI* {.importc: "__vector unsigned int", header: "<altivec.h>", bycopy.} = object
    ## vector unsigned int (4 × uint32)

  VULL* {.importc: "__vector unsigned long long", header: "<altivec.h>", bycopy.} = object
    ## vector unsigned long long (2 × uint64)

  VUQ* {.importc: "__vector unsigned __int128", header: "<altivec.h>", bycopy.} = object
    ## vector unsigned __int128 (1 × uint128)

  # --- Boolean Mask Vectors ---
  # Each element is all-zeros (false) or all-ones (true)
  VBC* {.importc: "__vector bool char", header: "<altivec.h>", bycopy.} = object
    ## vector bool char (16 × 8-bit mask)

  VBS* {.importc: "__vector bool short", header: "<altivec.h>", bycopy.} = object
    ## vector bool short (8 × 16-bit mask)

  VBI* {.importc: "__vector bool int", header: "<altivec.h>", bycopy.} = object
    ## vector bool int (4 × 32-bit mask)

  VBLL* {.importc: "__vector bool long long", header: "<altivec.h>", bycopy.} = object
    ## vector bool long long (2 × 64-bit mask)

  VBQ* {.importc: "__vector bool __int128", header: "<altivec.h>", bycopy.} = object
    ## vector bool __int128 (1 × 128-bit mask)

  # --- Floating-Point Vectors ---
  VF* {.importc: "__vector float", header: "<altivec.h>", bycopy.} = object
    ## vector float (4 × float32)

  VD* {.importc: "__vector double", header: "<altivec.h>", bycopy.} = object
    ## vector double (2 × float64, requires VSX)

  # --- Special Types ---
  VP* {.importc: "__vector pixel", header: "<altivec.h>", bycopy.} = object
    ## vector pixel (8 × 16-bit packed pixel, legacy graphics)

# ============================================================================
# VSX Extended Types (POWER7+)
# ============================================================================

type
  V2DF* {.importc: "__vector double", header: "<altivec.h>", bycopy.} = object
    ## Alias for Vd — explicit VSX naming convention

  V2DI* {.importc: "__vector signed long long", header: "<altivec.h>", bycopy.} = object
    ## Alias for Vsll — explicit VSX naming convention

# ============================================================================
# MMA Types (POWER10+)
# These are NOT single registers — they are register pairs/quads
# ============================================================================

type
  VectorPair* {.importc: "__vector_pair", header: "<altivec.h>", bycopy.} = object
    ## v256: 2 × 128-bit registers (256-bit logical, MMA input/output)

  VectorQuad* {.importc: "__vector_quad", header: "<altivec.h>", bycopy.} = object
    ## v512: 4 × 128-bit registers (512-bit logical, MMA accumulator)


when not defined(powerpc) and not defined(powerpc64):
  {.error: "AltiVec bindings require PowerPC target".}


# ========== [always] ==========

proc Cfstring*() {.importc: "__builtin_cfstring", header: "<altivec.h>".}

proc Cpu_init*() {.importc: "__builtin_cpu_init", header: "<altivec.h>".}

proc Cpu_is*(p0: cstring): bool {.importc: "__builtin_cpu_is", header: "<altivec.h>".}

proc Cpu_supports*(p0: cstring): bool {.importc: "__builtin_cpu_supports", header: "<altivec.h>".}

proc Ppc_get_timebase*(): uint64 {.importc: "__builtin_ppc_get_timebase", header: "<altivec.h>".}

proc Mffs*(): float64 {.importc: "__builtin_mffs", header: "<altivec.h>".}

proc Mffsl*(): float64 {.importc: "__builtin_mffsl", header: "<altivec.h>".}

proc Pack_longdouble*(p0: float64, p1: float64): float64 {.importc: "__builtin_pack_longdouble", header: "<altivec.h>".}

proc Ppc_mftb*(): uint64 {.importc: "__builtin_ppc_mftb", header: "<altivec.h>".}

## p0 constraint: <5>
proc Mtfsb0*(p0: int32) {.importc: "__builtin_mtfsb0", header: "<altivec.h>".}

## p0 constraint: <5>
proc Mtfsb1*(p0: int32) {.importc: "__builtin_mtfsb1", header: "<altivec.h>".}

## p0 constraint: <8>
proc Mtfsf*(p0: int32, p1: float64) {.importc: "__builtin_mtfsf", header: "<altivec.h>".}

proc Pack_ibm128*(p0: float64, p1: float64): ibm128 {.importc: "__builtin_pack_ibm128", header: "<altivec.h>".}

## p0 constraint: [0
proc Set_fpscr_rn*(p0: int32): float64 {.importc: "__builtin_set_fpscr_rn", header: "<altivec.h>".}

## p1 constraint: <1>
proc Unpack_ibm128*(p0: ibm128, p1: int32): float64 {.importc: "__builtin_unpack_ibm128", header: "<altivec.h>".}

## p1 constraint: <1>
proc Unpack_longdouble*(p0: float64, p1: int32): float64 {.importc: "__builtin_unpack_longdouble", header: "<altivec.h>".}

proc Ppc_atomic_cas_local_qi*(p0: ptr int8, p1: ptr int8, p2: ptr int8, p3: int32, p4: int32, p5: int32): bool {.importc: "__builtin_ppc_atomic_cas_local_qi", header: "<altivec.h>".}

proc Ppc_atomic_cas_local_hi*(p0: ptr int16, p1: ptr int16, p2: ptr int16, p3: int32, p4: int32, p5: int32): bool {.importc: "__builtin_ppc_atomic_cas_local_hi", header: "<altivec.h>".}

proc Ppc_atomic_cas_local_si*(p0: ptr int32, p1: ptr int32, p2: ptr int32, p3: int32, p4: int32, p5: int32): bool {.importc: "__builtin_ppc_atomic_cas_local_si", header: "<altivec.h>".}

proc Ppc_atomic_cas_local_di*(p0: ptr int64, p1: ptr int64, p2: ptr int64, p3: int32, p4: int32, p5: int32): bool {.importc: "__builtin_ppc_atomic_cas_local_di", header: "<altivec.h>".}

proc Ppc_atomic_cas_local_ti*(p0: ptr VSQ, p1: ptr VSQ, p2: ptr VSQ, p3: int32, p4: int32, p5: int32): bool {.importc: "__builtin_ppc_atomic_cas_local_ti", header: "<altivec.h>".}

# ========== [power5] (requires: -mcpu=power5) ==========

proc Recipdiv*(p0: float64, p1: float64): float64 {.importc: "__builtin_recipdiv", header: "<altivec.h>".}

proc Recipdivf*(p0: float32, p1: float32): float32 {.importc: "__builtin_recipdivf", header: "<altivec.h>".}

proc Rsqrt*(p0: float64): float64 {.importc: "__builtin_rsqrt", header: "<altivec.h>".}

proc Rsqrtf*(p0: float32): float32 {.importc: "__builtin_rsqrtf", header: "<altivec.h>".}

# ========== [power6] (requires: -mcpu=power6) ==========

proc P6_cmpb_32*(p0: int32, p1: int32): int32 {.importc: "__builtin_p6_cmpb_32", header: "<altivec.h>".}

# ========== [power6-64] (requires: -mcpu=power6) ==========

proc P6_cmpb*(p0: int64, p1: int64): int64 {.importc: "__builtin_p6_cmpb", header: "<altivec.h>".}

# ========== [altivec] (requires: -maltivec) ==========

proc Altivec_abs_v16qi*(p0: VSC): VSC {.importc: "__builtin_altivec_abs_v16qi", header: "<altivec.h>".}

proc Altivec_abs_v4sf*(p0: VF): VF {.importc: "__builtin_altivec_abs_v4sf", header: "<altivec.h>".}

proc Altivec_abs_v4si*(p0: VSI): VSI {.importc: "__builtin_altivec_abs_v4si", header: "<altivec.h>".}

proc Altivec_abs_v8hi*(p0: VSS): VSS {.importc: "__builtin_altivec_abs_v8hi", header: "<altivec.h>".}

proc Altivec_abss_v16qi*(p0: VSC): VSC {.importc: "__builtin_altivec_abss_v16qi", header: "<altivec.h>".}

proc Altivec_abss_v4si*(p0: VSI): VSI {.importc: "__builtin_altivec_abss_v4si", header: "<altivec.h>".}

proc Altivec_abss_v8hi*(p0: VSS): VSS {.importc: "__builtin_altivec_abss_v8hi", header: "<altivec.h>".}

proc Altivec_copysignfp*(p0: VF, p1: VF): VF {.importc: "__builtin_altivec_copysignfp", header: "<altivec.h>".}

## p0 constraint: <2>
proc Altivec_dss*(p0: int32) {.importc: "__builtin_altivec_dss", header: "<altivec.h>".}

proc Altivec_dssall*() {.importc: "__builtin_altivec_dssall", header: "<altivec.h>".}

## p2 constraint: <2>
proc Altivec_dst*(p0: pointer, p1: int32, p2: int32) {.importc: "__builtin_altivec_dst", header: "<altivec.h>".}

## p2 constraint: <2>
proc Altivec_dstst*(p0: pointer, p1: int32, p2: int32) {.importc: "__builtin_altivec_dstst", header: "<altivec.h>".}

## p2 constraint: <2>
proc Altivec_dststt*(p0: pointer, p1: int32, p2: int32) {.importc: "__builtin_altivec_dststt", header: "<altivec.h>".}

## p2 constraint: <2>
proc Altivec_dstt*(p0: pointer, p1: int32, p2: int32) {.importc: "__builtin_altivec_dstt", header: "<altivec.h>".}

proc Altivec_fix_sfsi*(p0: VF): VSI {.importc: "__builtin_altivec_fix_sfsi", header: "<altivec.h>".}

proc Altivec_fixuns_sfsi*(p0: VF): VUI {.importc: "__builtin_altivec_fixuns_sfsi", header: "<altivec.h>".}

proc Altivec_float_sisf*(p0: VSI): VF {.importc: "__builtin_altivec_float_sisf", header: "<altivec.h>".}

proc Altivec_lvebx*(p0: int64, p1: pointer): VSC {.importc: "__builtin_altivec_lvebx", header: "<altivec.h>".}

proc Altivec_lvehx*(p0: int64, p1: pointer): VSS {.importc: "__builtin_altivec_lvehx", header: "<altivec.h>".}

proc Altivec_lvewx*(p0: int64, p1: pointer): VSI {.importc: "__builtin_altivec_lvewx", header: "<altivec.h>".}

proc Altivec_lvsl*(p0: int64, p1: pointer): VUC {.importc: "__builtin_altivec_lvsl", header: "<altivec.h>".}

proc Altivec_lvsr*(p0: int64, p1: pointer): VUC {.importc: "__builtin_altivec_lvsr", header: "<altivec.h>".}

proc Altivec_lvx*(p0: int64, p1: pointer): VSI {.importc: "__builtin_altivec_lvx", header: "<altivec.h>".}

proc Altivec_lvx_v1ti*(p0: int64, p1: pointer): VSQ {.importc: "__builtin_altivec_lvx_v1ti", header: "<altivec.h>".}

proc Altivec_lvx_v16qi*(p0: int64, p1: pointer): VSC {.importc: "__builtin_altivec_lvx_v16qi", header: "<altivec.h>".}

proc Altivec_lvx_v4sf*(p0: int64, p1: pointer): VF {.importc: "__builtin_altivec_lvx_v4sf", header: "<altivec.h>".}

proc Altivec_lvx_v4si*(p0: int64, p1: pointer): VSI {.importc: "__builtin_altivec_lvx_v4si", header: "<altivec.h>".}

proc Altivec_lvx_v8hi*(p0: int64, p1: pointer): VSS {.importc: "__builtin_altivec_lvx_v8hi", header: "<altivec.h>".}

proc Altivec_lvxl*(p0: int64, p1: pointer): VSI {.importc: "__builtin_altivec_lvxl", header: "<altivec.h>".}

proc Altivec_lvxl_v16qi*(p0: int64, p1: pointer): VSC {.importc: "__builtin_altivec_lvxl_v16qi", header: "<altivec.h>".}

proc Altivec_lvxl_v4sf*(p0: int64, p1: pointer): VF {.importc: "__builtin_altivec_lvxl_v4sf", header: "<altivec.h>".}

proc Altivec_lvxl_v4si*(p0: int64, p1: pointer): VSI {.importc: "__builtin_altivec_lvxl_v4si", header: "<altivec.h>".}

proc Altivec_lvxl_v8hi*(p0: int64, p1: pointer): VSS {.importc: "__builtin_altivec_lvxl_v8hi", header: "<altivec.h>".}

proc Altivec_mask_for_load*(p0: pointer): VSC {.importc: "__builtin_altivec_mask_for_load", header: "<altivec.h>".}

proc Altivec_mfvscr*(): VSS {.importc: "__builtin_altivec_mfvscr", header: "<altivec.h>".}

proc Altivec_mtvscr*(p0: VSI) {.importc: "__builtin_altivec_mtvscr", header: "<altivec.h>".}

proc Altivec_vmulesw*(p0: VSI, p1: VSI): VSLL {.importc: "__builtin_altivec_vmulesw", header: "<altivec.h>".}

proc Altivec_vmuleuw*(p0: VUI, p1: VUI): VULL {.importc: "__builtin_altivec_vmuleuw", header: "<altivec.h>".}

proc Altivec_vmulosw*(p0: VSI, p1: VSI): VSLL {.importc: "__builtin_altivec_vmulosw", header: "<altivec.h>".}

proc Altivec_vmulouw*(p0: VUI, p1: VUI): VULL {.importc: "__builtin_altivec_vmulouw", header: "<altivec.h>".}

proc Altivec_nabs_v16qi*(p0: VSC): VSC {.importc: "__builtin_altivec_nabs_v16qi", header: "<altivec.h>".}

proc Altivec_nabs_v4sf*(p0: VF): VF {.importc: "__builtin_altivec_nabs_v4sf", header: "<altivec.h>".}

proc Altivec_nabs_v4si*(p0: VSI): VSI {.importc: "__builtin_altivec_nabs_v4si", header: "<altivec.h>".}

proc Altivec_nabs_v8hi*(p0: VSS): VSS {.importc: "__builtin_altivec_nabs_v8hi", header: "<altivec.h>".}

proc Altivec_neg_v16qi*(p0: VSC): VSC {.importc: "__builtin_altivec_neg_v16qi", header: "<altivec.h>".}

proc Altivec_neg_v4sf*(p0: VF): VF {.importc: "__builtin_altivec_neg_v4sf", header: "<altivec.h>".}

proc Altivec_neg_v4si*(p0: VSI): VSI {.importc: "__builtin_altivec_neg_v4si", header: "<altivec.h>".}

proc Altivec_neg_v8hi*(p0: VSS): VSS {.importc: "__builtin_altivec_neg_v8hi", header: "<altivec.h>".}

proc Altivec_stvebx*(p0: VSC, p1: int64, p2: pointer) {.importc: "__builtin_altivec_stvebx", header: "<altivec.h>".}

proc Altivec_stvehx*(p0: VSS, p1: int64, p2: pointer) {.importc: "__builtin_altivec_stvehx", header: "<altivec.h>".}

proc Altivec_stvewx*(p0: VSI, p1: int64, p2: pointer) {.importc: "__builtin_altivec_stvewx", header: "<altivec.h>".}

proc Altivec_stvx*(p0: VSI, p1: int64, p2: pointer) {.importc: "__builtin_altivec_stvx", header: "<altivec.h>".}

proc Altivec_stvx_v16qi*(p0: VSC, p1: int64, p2: pointer) {.importc: "__builtin_altivec_stvx_v16qi", header: "<altivec.h>".}

proc Altivec_stvx_v4sf*(p0: VF, p1: int64, p2: pointer) {.importc: "__builtin_altivec_stvx_v4sf", header: "<altivec.h>".}

proc Altivec_stvx_v4si*(p0: VSI, p1: int64, p2: pointer) {.importc: "__builtin_altivec_stvx_v4si", header: "<altivec.h>".}

proc Altivec_stvx_v8hi*(p0: VSS, p1: int64, p2: pointer) {.importc: "__builtin_altivec_stvx_v8hi", header: "<altivec.h>".}

proc Altivec_stvxl*(p0: VSI, p1: int64, p2: pointer) {.importc: "__builtin_altivec_stvxl", header: "<altivec.h>".}

proc Altivec_stvxl_v16qi*(p0: VSC, p1: int64, p2: pointer) {.importc: "__builtin_altivec_stvxl_v16qi", header: "<altivec.h>".}

proc Altivec_stvxl_v4sf*(p0: VF, p1: int64, p2: pointer) {.importc: "__builtin_altivec_stvxl_v4sf", header: "<altivec.h>".}

proc Altivec_stvxl_v4si*(p0: VSI, p1: int64, p2: pointer) {.importc: "__builtin_altivec_stvxl_v4si", header: "<altivec.h>".}

proc Altivec_stvxl_v8hi*(p0: VSS, p1: int64, p2: pointer) {.importc: "__builtin_altivec_stvxl_v8hi", header: "<altivec.h>".}

proc Altivec_uns_float_sisf*(p0: VUI): VF {.importc: "__builtin_altivec_uns_float_sisf", header: "<altivec.h>".}

proc Altivec_vaddcuw*(p0: VUI, p1: VUI): VUI {.importc: "__builtin_altivec_vaddcuw", header: "<altivec.h>".}

proc Altivec_vaddfp*(p0: VF, p1: VF): VF {.importc: "__builtin_altivec_vaddfp", header: "<altivec.h>".}

proc Altivec_vaddsbs*(p0: VSC, p1: VSC): VSC {.importc: "__builtin_altivec_vaddsbs", header: "<altivec.h>".}

proc Altivec_vaddshs*(p0: VSS, p1: VSS): VSS {.importc: "__builtin_altivec_vaddshs", header: "<altivec.h>".}

proc Altivec_vaddsws*(p0: VSI, p1: VSI): VSI {.importc: "__builtin_altivec_vaddsws", header: "<altivec.h>".}

proc Altivec_vaddubm*(p0: VUC, p1: VUC): VUC {.importc: "__builtin_altivec_vaddubm", header: "<altivec.h>".}

proc Altivec_vaddubs*(p0: VUC, p1: VUC): VUC {.importc: "__builtin_altivec_vaddubs", header: "<altivec.h>".}

proc Altivec_vadduhm*(p0: VUS, p1: VUS): VUS {.importc: "__builtin_altivec_vadduhm", header: "<altivec.h>".}

proc Altivec_vadduhs*(p0: VUS, p1: VUS): VUS {.importc: "__builtin_altivec_vadduhs", header: "<altivec.h>".}

proc Altivec_vadduwm*(p0: VSI, p1: VSI): VSI {.importc: "__builtin_altivec_vadduwm", header: "<altivec.h>".}

proc Altivec_vadduws*(p0: VUI, p1: VUI): VUI {.importc: "__builtin_altivec_vadduws", header: "<altivec.h>".}

proc Altivec_vand_v16qi*(p0: VSC, p1: VSC): VSC {.importc: "__builtin_altivec_vand_v16qi", header: "<altivec.h>".}

proc Altivec_vand_v16qi_uns*(p0: VUC, p1: VUC): VUC {.importc: "__builtin_altivec_vand_v16qi_uns", header: "<altivec.h>".}

proc Altivec_vand_v4sf*(p0: VF, p1: VF): VF {.importc: "__builtin_altivec_vand_v4sf", header: "<altivec.h>".}

proc Altivec_vand_v4si*(p0: VSI, p1: VSI): VSI {.importc: "__builtin_altivec_vand_v4si", header: "<altivec.h>".}

proc Altivec_vand_v4si_uns*(p0: VUI, p1: VUI): VUI {.importc: "__builtin_altivec_vand_v4si_uns", header: "<altivec.h>".}

proc Altivec_vand_v8hi*(p0: VSS, p1: VSS): VSS {.importc: "__builtin_altivec_vand_v8hi", header: "<altivec.h>".}

proc Altivec_vand_v8hi_uns*(p0: VUS, p1: VUS): VUS {.importc: "__builtin_altivec_vand_v8hi_uns", header: "<altivec.h>".}

proc Altivec_vandc_v16qi*(p0: VSC, p1: VSC): VSC {.importc: "__builtin_altivec_vandc_v16qi", header: "<altivec.h>".}

proc Altivec_vandc_v16qi_uns*(p0: VUC, p1: VUC): VUC {.importc: "__builtin_altivec_vandc_v16qi_uns", header: "<altivec.h>".}

proc Altivec_vandc_v4sf*(p0: VF, p1: VF): VF {.importc: "__builtin_altivec_vandc_v4sf", header: "<altivec.h>".}

proc Altivec_vandc_v4si*(p0: VSI, p1: VSI): VSI {.importc: "__builtin_altivec_vandc_v4si", header: "<altivec.h>".}

proc Altivec_vandc_v4si_uns*(p0: VUI, p1: VUI): VUI {.importc: "__builtin_altivec_vandc_v4si_uns", header: "<altivec.h>".}

proc Altivec_vandc_v8hi*(p0: VSS, p1: VSS): VSS {.importc: "__builtin_altivec_vandc_v8hi", header: "<altivec.h>".}

proc Altivec_vandc_v8hi_uns*(p0: VUS, p1: VUS): VUS {.importc: "__builtin_altivec_vandc_v8hi_uns", header: "<altivec.h>".}

proc Altivec_vavgsb*(p0: VSC, p1: VSC): VSC {.importc: "__builtin_altivec_vavgsb", header: "<altivec.h>".}

proc Altivec_vavgsh*(p0: VSS, p1: VSS): VSS {.importc: "__builtin_altivec_vavgsh", header: "<altivec.h>".}

proc Altivec_vavgsw*(p0: VSI, p1: VSI): VSI {.importc: "__builtin_altivec_vavgsw", header: "<altivec.h>".}

proc Altivec_vavgub*(p0: VUC, p1: VUC): VUC {.importc: "__builtin_altivec_vavgub", header: "<altivec.h>".}

proc Altivec_vavguh*(p0: VUS, p1: VUS): VUS {.importc: "__builtin_altivec_vavguh", header: "<altivec.h>".}

proc Altivec_vavguw*(p0: VUI, p1: VUI): VUI {.importc: "__builtin_altivec_vavguw", header: "<altivec.h>".}

## p1 constraint: <5>
proc Altivec_vcfsx*(p0: VSI, p1: int32): VF {.importc: "__builtin_altivec_vcfsx", header: "<altivec.h>".}

## p1 constraint: <5>
proc Altivec_vcfux*(p0: VUI, p1: int32): VF {.importc: "__builtin_altivec_vcfux", header: "<altivec.h>".}

proc Altivec_vcmpbfp*(p0: VF, p1: VF): VSI {.importc: "__builtin_altivec_vcmpbfp", header: "<altivec.h>".}

proc Altivec_vcmpbfp_p*(p0: int32, p1: VF, p2: VF): int32 {.importc: "__builtin_altivec_vcmpbfp_p", header: "<altivec.h>".}

proc Altivec_vcmpeqfp*(p0: VF, p1: VF): VF {.importc: "__builtin_altivec_vcmpeqfp", header: "<altivec.h>".}

proc Altivec_vcmpeqfp_p*(p0: int32, p1: VF, p2: VF): int32 {.importc: "__builtin_altivec_vcmpeqfp_p", header: "<altivec.h>".}

proc Altivec_vcmpequb*(p0: VUC, p1: VUC): VSC {.importc: "__builtin_altivec_vcmpequb", header: "<altivec.h>".}

proc Altivec_vcmpequb_p*(p0: int32, p1: VSC, p2: VSC): int32 {.importc: "__builtin_altivec_vcmpequb_p", header: "<altivec.h>".}

proc Altivec_vcmpequh*(p0: VUS, p1: VUS): VSS {.importc: "__builtin_altivec_vcmpequh", header: "<altivec.h>".}

proc Altivec_vcmpequh_p*(p0: int32, p1: VSS, p2: VSS): int32 {.importc: "__builtin_altivec_vcmpequh_p", header: "<altivec.h>".}

proc Altivec_vcmpequw*(p0: VUI, p1: VUI): VSI {.importc: "__builtin_altivec_vcmpequw", header: "<altivec.h>".}

proc Altivec_vcmpequw_p*(p0: int32, p1: VSI, p2: VSI): int32 {.importc: "__builtin_altivec_vcmpequw_p", header: "<altivec.h>".}

proc Altivec_vcmpgefp*(p0: VF, p1: VF): VF {.importc: "__builtin_altivec_vcmpgefp", header: "<altivec.h>".}

proc Altivec_vcmpgefp_p*(p0: int32, p1: VF, p2: VF): int32 {.importc: "__builtin_altivec_vcmpgefp_p", header: "<altivec.h>".}

proc Altivec_vcmpgtfp*(p0: VF, p1: VF): VF {.importc: "__builtin_altivec_vcmpgtfp", header: "<altivec.h>".}

proc Altivec_vcmpgtfp_p*(p0: int32, p1: VF, p2: VF): int32 {.importc: "__builtin_altivec_vcmpgtfp_p", header: "<altivec.h>".}

proc Altivec_vcmpgtsb*(p0: VSC, p1: VSC): VSC {.importc: "__builtin_altivec_vcmpgtsb", header: "<altivec.h>".}

proc Altivec_vcmpgtsb_p*(p0: int32, p1: VSC, p2: VSC): int32 {.importc: "__builtin_altivec_vcmpgtsb_p", header: "<altivec.h>".}

proc Altivec_vcmpgtsh*(p0: VSS, p1: VSS): VSS {.importc: "__builtin_altivec_vcmpgtsh", header: "<altivec.h>".}

proc Altivec_vcmpgtsh_p*(p0: int32, p1: VSS, p2: VSS): int32 {.importc: "__builtin_altivec_vcmpgtsh_p", header: "<altivec.h>".}

proc Altivec_vcmpgtsw*(p0: VSI, p1: VSI): VSI {.importc: "__builtin_altivec_vcmpgtsw", header: "<altivec.h>".}

proc Altivec_vcmpgtsw_p*(p0: int32, p1: VSI, p2: VSI): int32 {.importc: "__builtin_altivec_vcmpgtsw_p", header: "<altivec.h>".}

proc Altivec_vcmpgtub*(p0: VUC, p1: VUC): VSC {.importc: "__builtin_altivec_vcmpgtub", header: "<altivec.h>".}

proc Altivec_vcmpgtub_p*(p0: int32, p1: VSC, p2: VSC): int32 {.importc: "__builtin_altivec_vcmpgtub_p", header: "<altivec.h>".}

proc Altivec_vcmpgtuh*(p0: VUS, p1: VUS): VSS {.importc: "__builtin_altivec_vcmpgtuh", header: "<altivec.h>".}

proc Altivec_vcmpgtuh_p*(p0: int32, p1: VSS, p2: VSS): int32 {.importc: "__builtin_altivec_vcmpgtuh_p", header: "<altivec.h>".}

proc Altivec_vcmpgtuw*(p0: VUI, p1: VUI): VSI {.importc: "__builtin_altivec_vcmpgtuw", header: "<altivec.h>".}

proc Altivec_vcmpgtuw_p*(p0: int32, p1: VSI, p2: VSI): int32 {.importc: "__builtin_altivec_vcmpgtuw_p", header: "<altivec.h>".}

proc Altivec_vcmpneb*(p0: VSC, p1: VSC): VSC {.importc: "__builtin_altivec_vcmpneb", header: "<altivec.h>".}

proc Altivec_vcmpneh*(p0: VSS, p1: VSS): VSS {.importc: "__builtin_altivec_vcmpneh", header: "<altivec.h>".}

proc Altivec_vcmpnew*(p0: VSI, p1: VSI): VSI {.importc: "__builtin_altivec_vcmpnew", header: "<altivec.h>".}

## p1 constraint: <5>
proc Altivec_vctsxs*(p0: VF, p1: int32): VSI {.importc: "__builtin_altivec_vctsxs", header: "<altivec.h>".}

## p1 constraint: <5>
proc Altivec_vctuxs*(p0: VF, p1: int32): VUI {.importc: "__builtin_altivec_vctuxs", header: "<altivec.h>".}

proc Altivec_vexptefp*(p0: VF): VF {.importc: "__builtin_altivec_vexptefp", header: "<altivec.h>".}

proc Altivec_vlogefp*(p0: VF): VF {.importc: "__builtin_altivec_vlogefp", header: "<altivec.h>".}

proc Altivec_vmaddfp*(p0: VF, p1: VF, p2: VF): VF {.importc: "__builtin_altivec_vmaddfp", header: "<altivec.h>".}

proc Altivec_vmaxfp*(p0: VF, p1: VF): VF {.importc: "__builtin_altivec_vmaxfp", header: "<altivec.h>".}

proc Altivec_vmaxsb*(p0: VSC, p1: VSC): VSC {.importc: "__builtin_altivec_vmaxsb", header: "<altivec.h>".}

proc Altivec_vmaxub*(p0: VUC, p1: VUC): VUC {.importc: "__builtin_altivec_vmaxub", header: "<altivec.h>".}

proc Altivec_vmaxsh*(p0: VSS, p1: VSS): VSS {.importc: "__builtin_altivec_vmaxsh", header: "<altivec.h>".}

proc Altivec_vmaxsw*(p0: VSI, p1: VSI): VSI {.importc: "__builtin_altivec_vmaxsw", header: "<altivec.h>".}

proc Altivec_vmaxuh*(p0: VUS, p1: VUS): VUS {.importc: "__builtin_altivec_vmaxuh", header: "<altivec.h>".}

proc Altivec_vmaxuw*(p0: VUI, p1: VUI): VUI {.importc: "__builtin_altivec_vmaxuw", header: "<altivec.h>".}

proc Altivec_vmhaddshs*(p0: VSS, p1: VSS, p2: VSS): VSS {.importc: "__builtin_altivec_vmhaddshs", header: "<altivec.h>".}

proc Altivec_vmhraddshs*(p0: VSS, p1: VSS, p2: VSS): VSS {.importc: "__builtin_altivec_vmhraddshs", header: "<altivec.h>".}

proc Altivec_vminfp*(p0: VF, p1: VF): VF {.importc: "__builtin_altivec_vminfp", header: "<altivec.h>".}

proc Altivec_vminsb*(p0: VSC, p1: VSC): VSC {.importc: "__builtin_altivec_vminsb", header: "<altivec.h>".}

proc Altivec_vminsh*(p0: VSS, p1: VSS): VSS {.importc: "__builtin_altivec_vminsh", header: "<altivec.h>".}

proc Altivec_vminsw*(p0: VSI, p1: VSI): VSI {.importc: "__builtin_altivec_vminsw", header: "<altivec.h>".}

proc Altivec_vminub*(p0: VUC, p1: VUC): VUC {.importc: "__builtin_altivec_vminub", header: "<altivec.h>".}

proc Altivec_vminuh*(p0: VUS, p1: VUS): VUS {.importc: "__builtin_altivec_vminuh", header: "<altivec.h>".}

proc Altivec_vminuw*(p0: VUI, p1: VUI): VUI {.importc: "__builtin_altivec_vminuw", header: "<altivec.h>".}

proc Altivec_vmladduhm*(p0: VSS, p1: VSS, p2: VSS): VSS {.importc: "__builtin_altivec_vmladduhm", header: "<altivec.h>".}

proc Altivec_vmrghb*(p0: VSC, p1: VSC): VSC {.importc: "__builtin_altivec_vmrghb", header: "<altivec.h>".}

proc Altivec_vmrghh*(p0: VSS, p1: VSS): VSS {.importc: "__builtin_altivec_vmrghh", header: "<altivec.h>".}

proc Altivec_vmrghw*(p0: VSI, p1: VSI): VSI {.importc: "__builtin_altivec_vmrghw", header: "<altivec.h>".}

proc Altivec_vmrglb*(p0: VSC, p1: VSC): VSC {.importc: "__builtin_altivec_vmrglb", header: "<altivec.h>".}

proc Altivec_vmrglh*(p0: VSS, p1: VSS): VSS {.importc: "__builtin_altivec_vmrglh", header: "<altivec.h>".}

proc Altivec_vmrglw*(p0: VSI, p1: VSI): VSI {.importc: "__builtin_altivec_vmrglw", header: "<altivec.h>".}

proc Altivec_vmsummbm*(p0: VSC, p1: VUC, p2: VSI): VSI {.importc: "__builtin_altivec_vmsummbm", header: "<altivec.h>".}

proc Altivec_vmsumshm*(p0: VSS, p1: VSS, p2: VSI): VSI {.importc: "__builtin_altivec_vmsumshm", header: "<altivec.h>".}

proc Altivec_vmsumshs*(p0: VSS, p1: VSS, p2: VSI): VSI {.importc: "__builtin_altivec_vmsumshs", header: "<altivec.h>".}

proc Altivec_vmsumubm*(p0: VUC, p1: VUC, p2: VUI): VUI {.importc: "__builtin_altivec_vmsumubm", header: "<altivec.h>".}

proc Altivec_vmsumuhm*(p0: VUS, p1: VUS, p2: VUI): VUI {.importc: "__builtin_altivec_vmsumuhm", header: "<altivec.h>".}

proc Altivec_vmsumuhs*(p0: VUS, p1: VUS, p2: VUI): VUI {.importc: "__builtin_altivec_vmsumuhs", header: "<altivec.h>".}

proc Altivec_vmulesb*(p0: VSC, p1: VSC): VSS {.importc: "__builtin_altivec_vmulesb", header: "<altivec.h>".}

proc Altivec_vmulesh*(p0: VSS, p1: VSS): VSI {.importc: "__builtin_altivec_vmulesh", header: "<altivec.h>".}

proc Altivec_vmuleub*(p0: VUC, p1: VUC): VUS {.importc: "__builtin_altivec_vmuleub", header: "<altivec.h>".}

proc Altivec_vmuleuh*(p0: VUS, p1: VUS): VUI {.importc: "__builtin_altivec_vmuleuh", header: "<altivec.h>".}

proc Altivec_vmulosb*(p0: VSC, p1: VSC): VSS {.importc: "__builtin_altivec_vmulosb", header: "<altivec.h>".}

proc Altivec_vmuloub*(p0: VUC, p1: VUC): VUS {.importc: "__builtin_altivec_vmuloub", header: "<altivec.h>".}

proc Altivec_vmulosh*(p0: VSS, p1: VSS): VSI {.importc: "__builtin_altivec_vmulosh", header: "<altivec.h>".}

proc Altivec_vmulouh*(p0: VUS, p1: VUS): VUI {.importc: "__builtin_altivec_vmulouh", header: "<altivec.h>".}

proc Altivec_vnmsubfp*(p0: VF, p1: VF, p2: VF): VF {.importc: "__builtin_altivec_vnmsubfp", header: "<altivec.h>".}

proc Altivec_vnor_v16qi*(p0: VSC, p1: VSC): VSC {.importc: "__builtin_altivec_vnor_v16qi", header: "<altivec.h>".}

proc Altivec_vnor_v16qi_uns*(p0: VUC, p1: VUC): VUC {.importc: "__builtin_altivec_vnor_v16qi_uns", header: "<altivec.h>".}

proc Altivec_vnor_v4sf*(p0: VF, p1: VF): VF {.importc: "__builtin_altivec_vnor_v4sf", header: "<altivec.h>".}

proc Altivec_vnor_v4si*(p0: VSI, p1: VSI): VSI {.importc: "__builtin_altivec_vnor_v4si", header: "<altivec.h>".}

proc Altivec_vnor_v4si_uns*(p0: VUI, p1: VUI): VUI {.importc: "__builtin_altivec_vnor_v4si_uns", header: "<altivec.h>".}

proc Altivec_vnor_v8hi*(p0: VSS, p1: VSS): VSS {.importc: "__builtin_altivec_vnor_v8hi", header: "<altivec.h>".}

proc Altivec_vnor_v8hi_uns*(p0: VUS, p1: VUS): VUS {.importc: "__builtin_altivec_vnor_v8hi_uns", header: "<altivec.h>".}

proc Altivec_vor_v16qi*(p0: VSC, p1: VSC): VSC {.importc: "__builtin_altivec_vor_v16qi", header: "<altivec.h>".}

proc Altivec_vor_v16qi_uns*(p0: VUC, p1: VUC): VUC {.importc: "__builtin_altivec_vor_v16qi_uns", header: "<altivec.h>".}

proc Altivec_vor_v4sf*(p0: VF, p1: VF): VF {.importc: "__builtin_altivec_vor_v4sf", header: "<altivec.h>".}

proc Altivec_vor_v4si*(p0: VSI, p1: VSI): VSI {.importc: "__builtin_altivec_vor_v4si", header: "<altivec.h>".}

proc Altivec_vor_v4si_uns*(p0: VUI, p1: VUI): VUI {.importc: "__builtin_altivec_vor_v4si_uns", header: "<altivec.h>".}

proc Altivec_vor_v8hi*(p0: VSS, p1: VSS): VSS {.importc: "__builtin_altivec_vor_v8hi", header: "<altivec.h>".}

proc Altivec_vor_v8hi_uns*(p0: VUS, p1: VUS): VUS {.importc: "__builtin_altivec_vor_v8hi_uns", header: "<altivec.h>".}

proc Altivec_vperm_16qi*(p0: VSC, p1: VSC, p2: VUC): VSC {.importc: "__builtin_altivec_vperm_16qi", header: "<altivec.h>".}

proc Altivec_vperm_16qi_uns*(p0: VUC, p1: VUC, p2: VUC): VUC {.importc: "__builtin_altivec_vperm_16qi_uns", header: "<altivec.h>".}

proc Altivec_vperm_1ti*(p0: VSQ, p1: VSQ, p2: VUC): VSQ {.importc: "__builtin_altivec_vperm_1ti", header: "<altivec.h>".}

proc Altivec_vperm_1ti_uns*(p0: VUQ, p1: VUQ, p2: VUC): VUQ {.importc: "__builtin_altivec_vperm_1ti_uns", header: "<altivec.h>".}

proc Altivec_vperm_4sf*(p0: VF, p1: VF, p2: VUC): VF {.importc: "__builtin_altivec_vperm_4sf", header: "<altivec.h>".}

proc Altivec_vperm_4si*(p0: VSI, p1: VSI, p2: VUC): VSI {.importc: "__builtin_altivec_vperm_4si", header: "<altivec.h>".}

proc Altivec_vperm_4si_uns*(p0: VUI, p1: VUI, p2: VUC): VUI {.importc: "__builtin_altivec_vperm_4si_uns", header: "<altivec.h>".}

proc Altivec_vperm_8hi*(p0: VSS, p1: VSS, p2: VUC): VSS {.importc: "__builtin_altivec_vperm_8hi", header: "<altivec.h>".}

proc Altivec_vperm_8hi_uns*(p0: VUS, p1: VUS, p2: VUC): VUS {.importc: "__builtin_altivec_vperm_8hi_uns", header: "<altivec.h>".}

proc Altivec_vpkpx*(p0: VUI, p1: VUI): VP {.importc: "__builtin_altivec_vpkpx", header: "<altivec.h>".}

proc Altivec_vpkshss*(p0: VSS, p1: VSS): VSC {.importc: "__builtin_altivec_vpkshss", header: "<altivec.h>".}

proc Altivec_vpkshus*(p0: VSS, p1: VSS): VUC {.importc: "__builtin_altivec_vpkshus", header: "<altivec.h>".}

proc Altivec_vpkswss*(p0: VSI, p1: VSI): VSS {.importc: "__builtin_altivec_vpkswss", header: "<altivec.h>".}

proc Altivec_vpkswus*(p0: VSI, p1: VSI): VUS {.importc: "__builtin_altivec_vpkswus", header: "<altivec.h>".}

proc Altivec_vpkuhum*(p0: VSS, p1: VSS): VSC {.importc: "__builtin_altivec_vpkuhum", header: "<altivec.h>".}

proc Altivec_vpkuhus*(p0: VUS, p1: VUS): VUC {.importc: "__builtin_altivec_vpkuhus", header: "<altivec.h>".}

proc Altivec_vpkuwum*(p0: VSI, p1: VSI): VSS {.importc: "__builtin_altivec_vpkuwum", header: "<altivec.h>".}

proc Altivec_vpkuwus*(p0: VUI, p1: VUI): VUS {.importc: "__builtin_altivec_vpkuwus", header: "<altivec.h>".}

proc Altivec_vrecipdivfp*(p0: VF, p1: VF): VF {.importc: "__builtin_altivec_vrecipdivfp", header: "<altivec.h>".}

proc Altivec_vrefp*(p0: VF): VF {.importc: "__builtin_altivec_vrefp", header: "<altivec.h>".}

proc Altivec_vreve_v16qi*(p0: VSC): VSC {.importc: "__builtin_altivec_vreve_v16qi", header: "<altivec.h>".}

proc Altivec_vreve_v4sf*(p0: VF): VF {.importc: "__builtin_altivec_vreve_v4sf", header: "<altivec.h>".}

proc Altivec_vreve_v4si*(p0: VSI): VSI {.importc: "__builtin_altivec_vreve_v4si", header: "<altivec.h>".}

proc Altivec_vreve_v8hi*(p0: VSS): VSS {.importc: "__builtin_altivec_vreve_v8hi", header: "<altivec.h>".}

proc Altivec_vrfim*(p0: VF): VF {.importc: "__builtin_altivec_vrfim", header: "<altivec.h>".}

proc Altivec_vrfin*(p0: VF): VF {.importc: "__builtin_altivec_vrfin", header: "<altivec.h>".}

proc Altivec_vrfip*(p0: VF): VF {.importc: "__builtin_altivec_vrfip", header: "<altivec.h>".}

proc Altivec_vrfiz*(p0: VF): VF {.importc: "__builtin_altivec_vrfiz", header: "<altivec.h>".}

proc Altivec_vrlb*(p0: VSC, p1: VSC): VSC {.importc: "__builtin_altivec_vrlb", header: "<altivec.h>".}

proc Altivec_vrlh*(p0: VSS, p1: VSS): VSS {.importc: "__builtin_altivec_vrlh", header: "<altivec.h>".}

proc Altivec_vrlw*(p0: VSI, p1: VSI): VSI {.importc: "__builtin_altivec_vrlw", header: "<altivec.h>".}

proc Altivec_vrsqrtefp*(p0: VF): VF {.importc: "__builtin_altivec_vrsqrtefp", header: "<altivec.h>".}

proc Altivec_vrsqrtfp*(p0: VF): VF {.importc: "__builtin_altivec_vrsqrtfp", header: "<altivec.h>".}

proc Altivec_vsel_16qi*(p0: VSC, p1: VSC, p2: VUC): VSC {.importc: "__builtin_altivec_vsel_16qi", header: "<altivec.h>".}

proc Altivec_vsel_16qi_uns*(p0: VUC, p1: VUC, p2: VUC): VUC {.importc: "__builtin_altivec_vsel_16qi_uns", header: "<altivec.h>".}

proc Altivec_vsel_1ti*(p0: VSQ, p1: VSQ, p2: VUQ): VSQ {.importc: "__builtin_altivec_vsel_1ti", header: "<altivec.h>".}

proc Altivec_vsel_1ti_uns*(p0: VUQ, p1: VUQ, p2: VUQ): VUQ {.importc: "__builtin_altivec_vsel_1ti_uns", header: "<altivec.h>".}

proc Altivec_vsel_4sf*(p0: VF, p1: VF, p2: VF): VF {.importc: "__builtin_altivec_vsel_4sf", header: "<altivec.h>".}

proc Altivec_vsel_4si*(p0: VSI, p1: VSI, p2: VUI): VSI {.importc: "__builtin_altivec_vsel_4si", header: "<altivec.h>".}

proc Altivec_vsel_4si_uns*(p0: VUI, p1: VUI, p2: VUI): VUI {.importc: "__builtin_altivec_vsel_4si_uns", header: "<altivec.h>".}

proc Altivec_vsel_8hi*(p0: VSS, p1: VSS, p2: VUS): VSS {.importc: "__builtin_altivec_vsel_8hi", header: "<altivec.h>".}

proc Altivec_vsel_8hi_uns*(p0: VUS, p1: VUS, p2: VUS): VUS {.importc: "__builtin_altivec_vsel_8hi_uns", header: "<altivec.h>".}

proc Altivec_vsl*(p0: VSI, p1: VSI): VSI {.importc: "__builtin_altivec_vsl", header: "<altivec.h>".}

proc Altivec_vslb*(p0: VSC, p1: VUC): VSC {.importc: "__builtin_altivec_vslb", header: "<altivec.h>".}

## p2 constraint: <4>
proc Altivec_vsldoi_16qi*(p0: VSC, p1: VSC, p2: int32): VSC {.importc: "__builtin_altivec_vsldoi_16qi", header: "<altivec.h>".}

## p2 constraint: <4>
proc Altivec_vsldoi_4sf*(p0: VF, p1: VF, p2: int32): VF {.importc: "__builtin_altivec_vsldoi_4sf", header: "<altivec.h>".}

## p2 constraint: <4>
proc Altivec_vsldoi_4si*(p0: VSI, p1: VSI, p2: int32): VSI {.importc: "__builtin_altivec_vsldoi_4si", header: "<altivec.h>".}

## p2 constraint: <4>
proc Altivec_vsldoi_8hi*(p0: VSS, p1: VSS, p2: int32): VSS {.importc: "__builtin_altivec_vsldoi_8hi", header: "<altivec.h>".}

## p2 constraint: <4>
proc Altivec_vsldoi_v1ti*(p0: VSQ, p1: VSQ, p2: int32): VSQ {.importc: "__builtin_altivec_vsldoi_v1ti", header: "<altivec.h>".}

proc Altivec_vslh*(p0: VSS, p1: VUS): VSS {.importc: "__builtin_altivec_vslh", header: "<altivec.h>".}

proc Altivec_vslo*(p0: VSI, p1: VSI): VSI {.importc: "__builtin_altivec_vslo", header: "<altivec.h>".}

proc Altivec_vslw*(p0: VSI, p1: VUI): VSI {.importc: "__builtin_altivec_vslw", header: "<altivec.h>".}

## p1 constraint: <4>
proc Altivec_vspltb*(p0: VSC, p1: int32): VSC {.importc: "__builtin_altivec_vspltb", header: "<altivec.h>".}

## p1 constraint: <3>
proc Altivec_vsplth*(p0: VSS, p1: int32): VSS {.importc: "__builtin_altivec_vsplth", header: "<altivec.h>".}

## p0 constraint: <-16
proc Altivec_vspltisb*(p0: int32): VSC {.importc: "__builtin_altivec_vspltisb", header: "<altivec.h>".}

## p0 constraint: <-16
proc Altivec_vspltish*(p0: int32): VSS {.importc: "__builtin_altivec_vspltish", header: "<altivec.h>".}

## p0 constraint: <-16
proc Altivec_vspltisw*(p0: int32): VSI {.importc: "__builtin_altivec_vspltisw", header: "<altivec.h>".}

## p1 constraint: <2>
proc Altivec_vspltw*(p0: VSI, p1: int32): VSI {.importc: "__builtin_altivec_vspltw", header: "<altivec.h>".}

proc Altivec_vsr*(p0: VSI, p1: VSI): VSI {.importc: "__builtin_altivec_vsr", header: "<altivec.h>".}

proc Altivec_vsrab*(p0: VSC, p1: VUC): VSC {.importc: "__builtin_altivec_vsrab", header: "<altivec.h>".}

proc Altivec_vsrah*(p0: VSS, p1: VUS): VSS {.importc: "__builtin_altivec_vsrah", header: "<altivec.h>".}

proc Altivec_vsraw*(p0: VSI, p1: VUI): VSI {.importc: "__builtin_altivec_vsraw", header: "<altivec.h>".}

proc Altivec_vsrb*(p0: VSC, p1: VUC): VSC {.importc: "__builtin_altivec_vsrb", header: "<altivec.h>".}

proc Altivec_vsrh*(p0: VSS, p1: VUS): VSS {.importc: "__builtin_altivec_vsrh", header: "<altivec.h>".}

proc Altivec_vsro*(p0: VSI, p1: VSI): VSI {.importc: "__builtin_altivec_vsro", header: "<altivec.h>".}

proc Altivec_vsrw*(p0: VSI, p1: VUI): VSI {.importc: "__builtin_altivec_vsrw", header: "<altivec.h>".}

proc Altivec_vsubcuw*(p0: VSI, p1: VSI): VSI {.importc: "__builtin_altivec_vsubcuw", header: "<altivec.h>".}

proc Altivec_vsubfp*(p0: VF, p1: VF): VF {.importc: "__builtin_altivec_vsubfp", header: "<altivec.h>".}

proc Altivec_vsubsbs*(p0: VSC, p1: VSC): VSC {.importc: "__builtin_altivec_vsubsbs", header: "<altivec.h>".}

proc Altivec_vsubshs*(p0: VSS, p1: VSS): VSS {.importc: "__builtin_altivec_vsubshs", header: "<altivec.h>".}

proc Altivec_vsubsws*(p0: VSI, p1: VSI): VSI {.importc: "__builtin_altivec_vsubsws", header: "<altivec.h>".}

proc Altivec_vsububm*(p0: VUC, p1: VUC): VUC {.importc: "__builtin_altivec_vsububm", header: "<altivec.h>".}

proc Altivec_vsububs*(p0: VUC, p1: VUC): VUC {.importc: "__builtin_altivec_vsububs", header: "<altivec.h>".}

proc Altivec_vsubuhm*(p0: VUS, p1: VUS): VUS {.importc: "__builtin_altivec_vsubuhm", header: "<altivec.h>".}

proc Altivec_vsubuhs*(p0: VUS, p1: VUS): VUS {.importc: "__builtin_altivec_vsubuhs", header: "<altivec.h>".}

proc Altivec_vsubuwm*(p0: VUI, p1: VUI): VUI {.importc: "__builtin_altivec_vsubuwm", header: "<altivec.h>".}

proc Altivec_vsubuws*(p0: VUI, p1: VUI): VUI {.importc: "__builtin_altivec_vsubuws", header: "<altivec.h>".}

proc Altivec_vsum2sws*(p0: VSI, p1: VSI): VSI {.importc: "__builtin_altivec_vsum2sws", header: "<altivec.h>".}

proc Altivec_vsum4sbs*(p0: VSC, p1: VSI): VSI {.importc: "__builtin_altivec_vsum4sbs", header: "<altivec.h>".}

proc Altivec_vsum4shs*(p0: VSS, p1: VSI): VSI {.importc: "__builtin_altivec_vsum4shs", header: "<altivec.h>".}

proc Altivec_vsum4ubs*(p0: VUC, p1: VUI): VUI {.importc: "__builtin_altivec_vsum4ubs", header: "<altivec.h>".}

proc Altivec_vsumsws*(p0: VSI, p1: VSI): VSI {.importc: "__builtin_altivec_vsumsws", header: "<altivec.h>".}

proc Altivec_vsumsws_be*(p0: VSI, p1: VSI): VSI {.importc: "__builtin_altivec_vsumsws_be", header: "<altivec.h>".}

proc Altivec_vupkhpx*(p0: VP): VUI {.importc: "__builtin_altivec_vupkhpx", header: "<altivec.h>".}

proc Altivec_vupkhsb*(p0: VSC): VSS {.importc: "__builtin_altivec_vupkhsb", header: "<altivec.h>".}

proc Altivec_vupkhsh*(p0: VSS): VSI {.importc: "__builtin_altivec_vupkhsh", header: "<altivec.h>".}

proc Altivec_vupklpx*(p0: VP): VUI {.importc: "__builtin_altivec_vupklpx", header: "<altivec.h>".}

proc Altivec_vupklsb*(p0: VSC): VSS {.importc: "__builtin_altivec_vupklsb", header: "<altivec.h>".}

proc Altivec_vupklsh*(p0: VSS): VSI {.importc: "__builtin_altivec_vupklsh", header: "<altivec.h>".}

proc Altivec_vxor_v16qi*(p0: VSC, p1: VSC): VSC {.importc: "__builtin_altivec_vxor_v16qi", header: "<altivec.h>".}

proc Altivec_vxor_v16qi_uns*(p0: VUC, p1: VUC): VUC {.importc: "__builtin_altivec_vxor_v16qi_uns", header: "<altivec.h>".}

proc Altivec_vxor_v4sf*(p0: VF, p1: VF): VF {.importc: "__builtin_altivec_vxor_v4sf", header: "<altivec.h>".}

proc Altivec_vxor_v4si*(p0: VSI, p1: VSI): VSI {.importc: "__builtin_altivec_vxor_v4si", header: "<altivec.h>".}

proc Altivec_vxor_v4si_uns*(p0: VUI, p1: VUI): VUI {.importc: "__builtin_altivec_vxor_v4si_uns", header: "<altivec.h>".}

proc Altivec_vxor_v8hi*(p0: VSS, p1: VSS): VSS {.importc: "__builtin_altivec_vxor_v8hi", header: "<altivec.h>".}

proc Altivec_vxor_v8hi_uns*(p0: VUS, p1: VUS): VUS {.importc: "__builtin_altivec_vxor_v8hi_uns", header: "<altivec.h>".}

proc Vec_ext_v16qi*(p0: VSC, p1: int32): int8 {.importc: "__builtin_vec_ext_v16qi", header: "<altivec.h>".}

proc Vec_ext_v4sf*(p0: VF, p1: int32): float32 {.importc: "__builtin_vec_ext_v4sf", header: "<altivec.h>".}

proc Vec_ext_v4si*(p0: VSI, p1: int32): int32 {.importc: "__builtin_vec_ext_v4si", header: "<altivec.h>".}

proc Vec_ext_v8hi*(p0: VSS, p1: int32): int16 {.importc: "__builtin_vec_ext_v8hi", header: "<altivec.h>".}

# ========== [cell] (requires: -maltivec -mcell) ==========

proc Altivec_lvlx*(p0: int64, p1: pointer): VSC {.importc: "__builtin_altivec_lvlx", header: "<altivec.h>".}

proc Altivec_lvlxl*(p0: int64, p1: pointer): VSC {.importc: "__builtin_altivec_lvlxl", header: "<altivec.h>".}

proc Altivec_lvrx*(p0: int64, p1: pointer): VSC {.importc: "__builtin_altivec_lvrx", header: "<altivec.h>".}

proc Altivec_lvrxl*(p0: int64, p1: pointer): VSC {.importc: "__builtin_altivec_lvrxl", header: "<altivec.h>".}

proc Altivec_stvlx*(p0: VSC, p1: int64, p2: pointer) {.importc: "__builtin_altivec_stvlx", header: "<altivec.h>".}

proc Altivec_stvlxl*(p0: VSC, p1: int64, p2: pointer) {.importc: "__builtin_altivec_stvlxl", header: "<altivec.h>".}

proc Altivec_stvrx*(p0: VSC, p1: int64, p2: pointer) {.importc: "__builtin_altivec_stvrx", header: "<altivec.h>".}

proc Altivec_stvrxl*(p0: VSC, p1: int64, p2: pointer) {.importc: "__builtin_altivec_stvrxl", header: "<altivec.h>".}

# ========== [vsx] (requires: -mvsx) ==========

proc Altivec_lvx_v2df*(p0: int64, p1: pointer): VD {.importc: "__builtin_altivec_lvx_v2df", header: "<altivec.h>".}

proc Altivec_lvx_v2di*(p0: int64, p1: pointer): VSLL {.importc: "__builtin_altivec_lvx_v2di", header: "<altivec.h>".}

proc Altivec_lvxl_v2df*(p0: int64, p1: pointer): VD {.importc: "__builtin_altivec_lvxl_v2df", header: "<altivec.h>".}

proc Altivec_lvxl_v2di*(p0: int64, p1: pointer): VSLL {.importc: "__builtin_altivec_lvxl_v2di", header: "<altivec.h>".}

proc Altivec_nabs_v2df*(p0: VD): VD {.importc: "__builtin_altivec_nabs_v2df", header: "<altivec.h>".}

proc Altivec_nabs_v2di*(p0: VSLL): VSLL {.importc: "__builtin_altivec_nabs_v2di", header: "<altivec.h>".}

proc Altivec_neg_v2df*(p0: VD): VD {.importc: "__builtin_altivec_neg_v2df", header: "<altivec.h>".}

proc Altivec_stvx_v2df*(p0: VD, p1: int64, p2: pointer) {.importc: "__builtin_altivec_stvx_v2df", header: "<altivec.h>".}

proc Altivec_stvx_v2di*(p0: VSLL, p1: int64, p2: pointer) {.importc: "__builtin_altivec_stvx_v2di", header: "<altivec.h>".}

proc Altivec_stvxl_v2df*(p0: VD, p1: int64, p2: pointer) {.importc: "__builtin_altivec_stvxl_v2df", header: "<altivec.h>".}

proc Altivec_stvxl_v2di*(p0: VSLL, p1: int64, p2: pointer) {.importc: "__builtin_altivec_stvxl_v2di", header: "<altivec.h>".}

proc Altivec_vand_v2df*(p0: VD, p1: VD): VD {.importc: "__builtin_altivec_vand_v2df", header: "<altivec.h>".}

proc Altivec_vand_v2di*(p0: VSLL, p1: VSLL): VSLL {.importc: "__builtin_altivec_vand_v2di", header: "<altivec.h>".}

proc Altivec_vand_v2di_uns*(p0: VULL, p1: VULL): VULL {.importc: "__builtin_altivec_vand_v2di_uns", header: "<altivec.h>".}

proc Altivec_vandc_v2df*(p0: VD, p1: VD): VD {.importc: "__builtin_altivec_vandc_v2df", header: "<altivec.h>".}

proc Altivec_vandc_v2di*(p0: VSLL, p1: VSLL): VSLL {.importc: "__builtin_altivec_vandc_v2di", header: "<altivec.h>".}

proc Altivec_vandc_v2di_uns*(p0: VULL, p1: VULL): VULL {.importc: "__builtin_altivec_vandc_v2di_uns", header: "<altivec.h>".}

proc Altivec_vnor_v2df*(p0: VD, p1: VD): VD {.importc: "__builtin_altivec_vnor_v2df", header: "<altivec.h>".}

proc Altivec_vnor_v2di*(p0: VSLL, p1: VSLL): VSLL {.importc: "__builtin_altivec_vnor_v2di", header: "<altivec.h>".}

proc Altivec_vnor_v2di_uns*(p0: VULL, p1: VULL): VULL {.importc: "__builtin_altivec_vnor_v2di_uns", header: "<altivec.h>".}

proc Altivec_vor_v2df*(p0: VD, p1: VD): VD {.importc: "__builtin_altivec_vor_v2df", header: "<altivec.h>".}

proc Altivec_vor_v2di*(p0: VSLL, p1: VSLL): VSLL {.importc: "__builtin_altivec_vor_v2di", header: "<altivec.h>".}

proc Altivec_vor_v2di_uns*(p0: VULL, p1: VULL): VULL {.importc: "__builtin_altivec_vor_v2di_uns", header: "<altivec.h>".}

proc Altivec_vperm_2df*(p0: VD, p1: VD, p2: VUC): VD {.importc: "__builtin_altivec_vperm_2df", header: "<altivec.h>".}

proc Altivec_vperm_2di*(p0: VSLL, p1: VSLL, p2: VUC): VSLL {.importc: "__builtin_altivec_vperm_2di", header: "<altivec.h>".}

proc Altivec_vperm_2di_uns*(p0: VULL, p1: VULL, p2: VUC): VULL {.importc: "__builtin_altivec_vperm_2di_uns", header: "<altivec.h>".}

proc Altivec_vreve_v2df*(p0: VD): VD {.importc: "__builtin_altivec_vreve_v2df", header: "<altivec.h>".}

proc Altivec_vreve_v2di*(p0: VSLL): VSLL {.importc: "__builtin_altivec_vreve_v2di", header: "<altivec.h>".}

proc Altivec_vsel_2df*(p0: VD, p1: VD, p2: VD): VD {.importc: "__builtin_altivec_vsel_2df", header: "<altivec.h>".}

proc Altivec_vsel_2di*(p0: VSLL, p1: VSLL, p2: VSLL): VSLL {.importc: "__builtin_altivec_vsel_2di", header: "<altivec.h>".}

proc Altivec_vsel_2di_uns*(p0: VULL, p1: VULL, p2: VULL): VULL {.importc: "__builtin_altivec_vsel_2di_uns", header: "<altivec.h>".}

## p2 constraint: <4>
proc Altivec_vsldoi_2df*(p0: VD, p1: VD, p2: int32): VD {.importc: "__builtin_altivec_vsldoi_2df", header: "<altivec.h>".}

## p2 constraint: <4>
proc Altivec_vsldoi_2di*(p0: VSLL, p1: VSLL, p2: int32): VSLL {.importc: "__builtin_altivec_vsldoi_2di", header: "<altivec.h>".}

proc Altivec_vxor_v2df*(p0: VD, p1: VD): VD {.importc: "__builtin_altivec_vxor_v2df", header: "<altivec.h>".}

proc Altivec_vxor_v2di*(p0: VSLL, p1: VSLL): VSLL {.importc: "__builtin_altivec_vxor_v2di", header: "<altivec.h>".}

proc Altivec_vxor_v2di_uns*(p0: VULL, p1: VULL): VULL {.importc: "__builtin_altivec_vxor_v2di_uns", header: "<altivec.h>".}

proc Vec_ext_v1ti*(p0: VSQ, p1: int32): int128 {.importc: "__builtin_vec_ext_v1ti", header: "<altivec.h>".}

proc Vec_ext_v2df*(p0: VD, p1: int32): float64 {.importc: "__builtin_vec_ext_v2df", header: "<altivec.h>".}

proc Vec_ext_v2di*(p0: VSLL, p1: int32): int64 {.importc: "__builtin_vec_ext_v2di", header: "<altivec.h>".}

proc Vsx_cmpge_16qi*(p0: VSC, p1: VSC): VSC {.importc: "__builtin_vsx_cmpge_16qi", header: "<altivec.h>".}

proc Vsx_cmpge_2di*(p0: VSLL, p1: VSLL): VSLL {.importc: "__builtin_vsx_cmpge_2di", header: "<altivec.h>".}

proc Vsx_cmpge_4si*(p0: VSI, p1: VSI): VSI {.importc: "__builtin_vsx_cmpge_4si", header: "<altivec.h>".}

proc Vsx_cmpge_8hi*(p0: VSS, p1: VSS): VSS {.importc: "__builtin_vsx_cmpge_8hi", header: "<altivec.h>".}

proc Vsx_cmpge_u16qi*(p0: VUC, p1: VUC): VSC {.importc: "__builtin_vsx_cmpge_u16qi", header: "<altivec.h>".}

proc Vsx_cmpge_u2di*(p0: VULL, p1: VULL): VSLL {.importc: "__builtin_vsx_cmpge_u2di", header: "<altivec.h>".}

proc Vsx_cmpge_u4si*(p0: VUI, p1: VUI): VSI {.importc: "__builtin_vsx_cmpge_u4si", header: "<altivec.h>".}

proc Vsx_cmpge_u8hi*(p0: VUS, p1: VUS): VSS {.importc: "__builtin_vsx_cmpge_u8hi", header: "<altivec.h>".}

proc Vsx_concat_2df*(p0: float64, p1: float64): VD {.importc: "__builtin_vsx_concat_2df", header: "<altivec.h>".}

proc Vsx_concat_2di*(p0: int64, p1: int64): VSLL {.importc: "__builtin_vsx_concat_2di", header: "<altivec.h>".}

proc Vsx_cpsgndp*(p0: VD, p1: VD): VD {.importc: "__builtin_vsx_cpsgndp", header: "<altivec.h>".}

proc Vsx_cpsgnsp*(p0: VF, p1: VF): VF {.importc: "__builtin_vsx_cpsgnsp", header: "<altivec.h>".}

proc Vsx_div_2di*(p0: VSLL, p1: VSLL): VSLL {.importc: "__builtin_vsx_div_2di", header: "<altivec.h>".}

proc Vsx_doublee_v4sf*(p0: VF): VD {.importc: "__builtin_vsx_doublee_v4sf", header: "<altivec.h>".}

proc Vsx_doublee_v4si*(p0: VSI): VD {.importc: "__builtin_vsx_doublee_v4si", header: "<altivec.h>".}

proc Vsx_doubleh_v4sf*(p0: VF): VD {.importc: "__builtin_vsx_doubleh_v4sf", header: "<altivec.h>".}

proc Vsx_doubleh_v4si*(p0: VSI): VD {.importc: "__builtin_vsx_doubleh_v4si", header: "<altivec.h>".}

proc Vsx_doublel_v4sf*(p0: VF): VD {.importc: "__builtin_vsx_doublel_v4sf", header: "<altivec.h>".}

proc Vsx_doublel_v4si*(p0: VSI): VD {.importc: "__builtin_vsx_doublel_v4si", header: "<altivec.h>".}

proc Vsx_doubleo_v4sf*(p0: VF): VD {.importc: "__builtin_vsx_doubleo_v4sf", header: "<altivec.h>".}

proc Vsx_doubleo_v4si*(p0: VSI): VD {.importc: "__builtin_vsx_doubleo_v4si", header: "<altivec.h>".}

proc Vsx_floate_v2df*(p0: VD): VF {.importc: "__builtin_vsx_floate_v2df", header: "<altivec.h>".}

proc Vsx_floate_v2di*(p0: VSLL): VF {.importc: "__builtin_vsx_floate_v2di", header: "<altivec.h>".}

proc Vsx_floato_v2df*(p0: VD): VF {.importc: "__builtin_vsx_floato_v2df", header: "<altivec.h>".}

proc Vsx_floato_v2di*(p0: VSLL): VF {.importc: "__builtin_vsx_floato_v2di", header: "<altivec.h>".}

proc Vsx_ld_elemrev_v1ti*(p0: int64, p1: pointer): VSQ {.importc: "__builtin_vsx_ld_elemrev_v1ti", header: "<altivec.h>".}

proc Vsx_ld_elemrev_v2df*(p0: int64, p1: pointer): VD {.importc: "__builtin_vsx_ld_elemrev_v2df", header: "<altivec.h>".}

proc Vsx_ld_elemrev_v2di*(p0: int64, p1: pointer): VSLL {.importc: "__builtin_vsx_ld_elemrev_v2di", header: "<altivec.h>".}

proc Vsx_ld_elemrev_v4sf*(p0: int64, p1: pointer): VF {.importc: "__builtin_vsx_ld_elemrev_v4sf", header: "<altivec.h>".}

proc Vsx_ld_elemrev_v4si*(p0: int64, p1: pointer): VSI {.importc: "__builtin_vsx_ld_elemrev_v4si", header: "<altivec.h>".}

proc Vsx_ld_elemrev_v8hi*(p0: int64, p1: pointer): VSS {.importc: "__builtin_vsx_ld_elemrev_v8hi", header: "<altivec.h>".}

proc Vsx_ld_elemrev_v16qi*(p0: int64, p1: pointer): VSC {.importc: "__builtin_vsx_ld_elemrev_v16qi", header: "<altivec.h>".}

proc Vsx_lxvd2x_v1ti*(p0: int64, p1: pointer): VSQ {.importc: "__builtin_vsx_lxvd2x_v1ti", header: "<altivec.h>".}

proc Vsx_lxvd2x_v2df*(p0: int64, p1: pointer): VD {.importc: "__builtin_vsx_lxvd2x_v2df", header: "<altivec.h>".}

proc Vsx_lxvd2x_v2di*(p0: int64, p1: pointer): VSLL {.importc: "__builtin_vsx_lxvd2x_v2di", header: "<altivec.h>".}

proc Vsx_lxvw4x_v16qi*(p0: int64, p1: pointer): VSC {.importc: "__builtin_vsx_lxvw4x_v16qi", header: "<altivec.h>".}

proc Vsx_lxvw4x_v4sf*(p0: int64, p1: pointer): VF {.importc: "__builtin_vsx_lxvw4x_v4sf", header: "<altivec.h>".}

proc Vsx_lxvw4x_v4si*(p0: int64, p1: pointer): VSI {.importc: "__builtin_vsx_lxvw4x_v4si", header: "<altivec.h>".}

proc Vsx_lxvw4x_v8hi*(p0: int64, p1: pointer): VSS {.importc: "__builtin_vsx_lxvw4x_v8hi", header: "<altivec.h>".}

proc Vsx_mergeh_2df*(p0: VD, p1: VD): VD {.importc: "__builtin_vsx_mergeh_2df", header: "<altivec.h>".}

proc Vsx_mergeh_2di*(p0: VSLL, p1: VSLL): VSLL {.importc: "__builtin_vsx_mergeh_2di", header: "<altivec.h>".}

proc Vsx_mergel_2df*(p0: VD, p1: VD): VD {.importc: "__builtin_vsx_mergel_2df", header: "<altivec.h>".}

proc Vsx_mergel_2di*(p0: VSLL, p1: VSLL): VSLL {.importc: "__builtin_vsx_mergel_2di", header: "<altivec.h>".}

proc Vsx_mul_2di*(p0: VSLL, p1: VSLL): VSLL {.importc: "__builtin_vsx_mul_2di", header: "<altivec.h>".}

proc Vsx_splat_2df*(p0: float64): VD {.importc: "__builtin_vsx_splat_2df", header: "<altivec.h>".}

proc Vsx_splat_2di*(p0: int64): VSLL {.importc: "__builtin_vsx_splat_2di", header: "<altivec.h>".}

proc Vsx_st_elemrev_v1ti*(p0: VSQ, p1: int64, p2: pointer) {.importc: "__builtin_vsx_st_elemrev_v1ti", header: "<altivec.h>".}

proc Vsx_st_elemrev_v2df*(p0: VD, p1: int64, p2: pointer) {.importc: "__builtin_vsx_st_elemrev_v2df", header: "<altivec.h>".}

proc Vsx_st_elemrev_v2di*(p0: VSLL, p1: int64, p2: pointer) {.importc: "__builtin_vsx_st_elemrev_v2di", header: "<altivec.h>".}

proc Vsx_st_elemrev_v4sf*(p0: VF, p1: int64, p2: pointer) {.importc: "__builtin_vsx_st_elemrev_v4sf", header: "<altivec.h>".}

proc Vsx_st_elemrev_v4si*(p0: VSI, p1: int64, p2: pointer) {.importc: "__builtin_vsx_st_elemrev_v4si", header: "<altivec.h>".}

proc Vsx_st_elemrev_v8hi*(p0: VSS, p1: int64, p2: pointer) {.importc: "__builtin_vsx_st_elemrev_v8hi", header: "<altivec.h>".}

proc Vsx_st_elemrev_v16qi*(p0: VSC, p1: int64, p2: pointer) {.importc: "__builtin_vsx_st_elemrev_v16qi", header: "<altivec.h>".}

proc Vsx_stxvd2x_v1ti*(p0: VSQ, p1: int64, p2: pointer) {.importc: "__builtin_vsx_stxvd2x_v1ti", header: "<altivec.h>".}

proc Vsx_stxvd2x_v2df*(p0: VD, p1: int64, p2: pointer) {.importc: "__builtin_vsx_stxvd2x_v2df", header: "<altivec.h>".}

proc Vsx_stxvd2x_v2di*(p0: VSLL, p1: int64, p2: pointer) {.importc: "__builtin_vsx_stxvd2x_v2di", header: "<altivec.h>".}

proc Vsx_stxvw4x_v4sf*(p0: VF, p1: int64, p2: pointer) {.importc: "__builtin_vsx_stxvw4x_v4sf", header: "<altivec.h>".}

proc Vsx_stxvw4x_v4si*(p0: VSI, p1: int64, p2: pointer) {.importc: "__builtin_vsx_stxvw4x_v4si", header: "<altivec.h>".}

proc Vsx_stxvw4x_v8hi*(p0: VSS, p1: int64, p2: pointer) {.importc: "__builtin_vsx_stxvw4x_v8hi", header: "<altivec.h>".}

proc Vsx_stxvw4x_v16qi*(p0: VSC, p1: int64, p2: pointer) {.importc: "__builtin_vsx_stxvw4x_v16qi", header: "<altivec.h>".}

proc Vsx_udiv_2di*(p0: VULL, p1: VULL): VULL {.importc: "__builtin_vsx_udiv_2di", header: "<altivec.h>".}

proc Vsx_uns_doublee_v4si*(p0: VSI): VD {.importc: "__builtin_vsx_uns_doublee_v4si", header: "<altivec.h>".}

proc Vsx_uns_doubleh_v4si*(p0: VSI): VD {.importc: "__builtin_vsx_uns_doubleh_v4si", header: "<altivec.h>".}

proc Vsx_uns_doublel_v4si*(p0: VSI): VD {.importc: "__builtin_vsx_uns_doublel_v4si", header: "<altivec.h>".}

proc Vsx_uns_doubleo_v4si*(p0: VSI): VD {.importc: "__builtin_vsx_uns_doubleo_v4si", header: "<altivec.h>".}

proc Vsx_uns_floate_v2di*(p0: VSLL): VF {.importc: "__builtin_vsx_uns_floate_v2di", header: "<altivec.h>".}

proc Vsx_uns_floato_v2di*(p0: VSLL): VF {.importc: "__builtin_vsx_uns_floato_v2di", header: "<altivec.h>".}

proc Vsx_vsigned_v2df*(p0: VD): VSLL {.importc: "__builtin_vsx_vsigned_v2df", header: "<altivec.h>".}

proc Vsx_vsigned_v4sf*(p0: VF): VSI {.importc: "__builtin_vsx_vsigned_v4sf", header: "<altivec.h>".}

proc Vsx_vsignede_v2df*(p0: VD): VSI {.importc: "__builtin_vsx_vsignede_v2df", header: "<altivec.h>".}

proc Vsx_vsignedo_v2df*(p0: VD): VSI {.importc: "__builtin_vsx_vsignedo_v2df", header: "<altivec.h>".}

proc Vsx_vunsigned_v2df*(p0: VD): VULL {.importc: "__builtin_vsx_vunsigned_v2df", header: "<altivec.h>".}

proc Vsx_vunsigned_v4sf*(p0: VF): VUI {.importc: "__builtin_vsx_vunsigned_v4sf", header: "<altivec.h>".}

proc Vsx_vunsignede_v2df*(p0: VD): VUI {.importc: "__builtin_vsx_vunsignede_v2df", header: "<altivec.h>".}

proc Vsx_vunsignedo_v2df*(p0: VD): VUI {.importc: "__builtin_vsx_vunsignedo_v2df", header: "<altivec.h>".}

proc Vsx_xscvdpsp*(p0: float64): VF {.importc: "__builtin_vsx_xscvdpsp", header: "<altivec.h>".}

proc Vsx_xscvspdp*(p0: VF): float64 {.importc: "__builtin_vsx_xscvspdp", header: "<altivec.h>".}

proc Vsx_xsmaxdp*(p0: float64, p1: float64): float64 {.importc: "__builtin_vsx_xsmaxdp", header: "<altivec.h>".}

proc Vsx_xsmindp*(p0: float64, p1: float64): float64 {.importc: "__builtin_vsx_xsmindp", header: "<altivec.h>".}

proc Vsx_xsrdpi*(p0: float64): float64 {.importc: "__builtin_vsx_xsrdpi", header: "<altivec.h>".}

proc Vsx_xsrdpic*(p0: float64): float64 {.importc: "__builtin_vsx_xsrdpic", header: "<altivec.h>".}

proc Vsx_xsrdpim*(p0: float64): float64 {.importc: "__builtin_vsx_xsrdpim", header: "<altivec.h>".}

proc Vsx_xsrdpip*(p0: float64): float64 {.importc: "__builtin_vsx_xsrdpip", header: "<altivec.h>".}

proc Vsx_xsrdpiz*(p0: float64): float64 {.importc: "__builtin_vsx_xsrdpiz", header: "<altivec.h>".}

proc Vsx_xstdivdp_fe*(p0: float64, p1: float64): int32 {.importc: "__builtin_vsx_xstdivdp_fe", header: "<altivec.h>".}

proc Vsx_xstdivdp_fg*(p0: float64, p1: float64): int32 {.importc: "__builtin_vsx_xstdivdp_fg", header: "<altivec.h>".}

proc Vsx_xstsqrtdp_fe*(p0: float64): int32 {.importc: "__builtin_vsx_xstsqrtdp_fe", header: "<altivec.h>".}

proc Vsx_xstsqrtdp_fg*(p0: float64): int32 {.importc: "__builtin_vsx_xstsqrtdp_fg", header: "<altivec.h>".}

proc Vsx_xvabsdp*(p0: VD): VD {.importc: "__builtin_vsx_xvabsdp", header: "<altivec.h>".}

proc Vsx_xvabssp*(p0: VF): VF {.importc: "__builtin_vsx_xvabssp", header: "<altivec.h>".}

proc Vsx_xvadddp*(p0: VD, p1: VD): VD {.importc: "__builtin_vsx_xvadddp", header: "<altivec.h>".}

proc Vsx_xvaddsp*(p0: VF, p1: VF): VF {.importc: "__builtin_vsx_xvaddsp", header: "<altivec.h>".}

proc Vsx_xvcmpeqdp*(p0: VD, p1: VD): VD {.importc: "__builtin_vsx_xvcmpeqdp", header: "<altivec.h>".}

proc Vsx_xvcmpeqdp_p*(p0: int32, p1: VD, p2: VD): int32 {.importc: "__builtin_vsx_xvcmpeqdp_p", header: "<altivec.h>".}

proc Vsx_xvcmpgedp*(p0: VD, p1: VD): VD {.importc: "__builtin_vsx_xvcmpgedp", header: "<altivec.h>".}

proc Vsx_xvcmpgedp_p*(p0: int32, p1: VD, p2: VD): int32 {.importc: "__builtin_vsx_xvcmpgedp_p", header: "<altivec.h>".}

proc Vsx_xvcmpgesp_p*(p0: int32, p1: VF, p2: VF): int32 {.importc: "__builtin_vsx_xvcmpgesp_p", header: "<altivec.h>".}

proc Vsx_xvcmpgtdp*(p0: VD, p1: VD): VD {.importc: "__builtin_vsx_xvcmpgtdp", header: "<altivec.h>".}

proc Vsx_xvcmpgtdp_p*(p0: int32, p1: VD, p2: VD): int32 {.importc: "__builtin_vsx_xvcmpgtdp_p", header: "<altivec.h>".}

proc Vsx_xvcmpgtsp_p*(p0: int32, p1: VF, p2: VF): int32 {.importc: "__builtin_vsx_xvcmpgtsp_p", header: "<altivec.h>".}

proc Vsx_xvcvdpsxds*(p0: VD): VSLL {.importc: "__builtin_vsx_xvcvdpsxds", header: "<altivec.h>".}

proc Vsx_xvcvdpsxds_scale*(p0: VD, p1: int32): VSLL {.importc: "__builtin_vsx_xvcvdpsxds_scale", header: "<altivec.h>".}

proc Vsx_xvcvdpuxds*(p0: VD): VSLL {.importc: "__builtin_vsx_xvcvdpuxds", header: "<altivec.h>".}

proc Vsx_xvcvdpuxds_scale*(p0: VD, p1: int32): VSLL {.importc: "__builtin_vsx_xvcvdpuxds_scale", header: "<altivec.h>".}

proc Vsignede_v4sf*(p0: VF): VSLL {.importc: "__builtin_vsignede_v4sf", header: "<altivec.h>".}

proc Vsignedo_v4sf*(p0: VF): VSLL {.importc: "__builtin_vsignedo_v4sf", header: "<altivec.h>".}

proc Vunsignede_v4sf*(p0: VF): VULL {.importc: "__builtin_vunsignede_v4sf", header: "<altivec.h>".}

proc Vunsignedo_v4sf*(p0: VF): VULL {.importc: "__builtin_vunsignedo_v4sf", header: "<altivec.h>".}

proc Vsx_xvcvsxddp*(p0: VSLL): VD {.importc: "__builtin_vsx_xvcvsxddp", header: "<altivec.h>".}

## p1 constraint: <5>
proc Vsx_xvcvsxddp_scale*(p0: VSLL, p1: int32): VD {.importc: "__builtin_vsx_xvcvsxddp_scale", header: "<altivec.h>".}

proc Vsx_xvcvsxdsp*(p0: VSLL): VF {.importc: "__builtin_vsx_xvcvsxdsp", header: "<altivec.h>".}

proc Vsx_xvcvsxwsp*(p0: VSI): VF {.importc: "__builtin_vsx_xvcvsxwsp", header: "<altivec.h>".}

proc Vsx_xvcvuxddp*(p0: VSLL): VD {.importc: "__builtin_vsx_xvcvuxddp", header: "<altivec.h>".}

## p1 constraint: <5>
proc Vsx_xvcvuxddp_scale*(p0: VSLL, p1: int32): VD {.importc: "__builtin_vsx_xvcvuxddp_scale", header: "<altivec.h>".}

proc Vsx_xvcvuxdsp*(p0: VULL): VF {.importc: "__builtin_vsx_xvcvuxdsp", header: "<altivec.h>".}

proc Vsx_xvcvuxwsp*(p0: VSI): VF {.importc: "__builtin_vsx_xvcvuxwsp", header: "<altivec.h>".}

proc Vsx_xvdivdp*(p0: VD, p1: VD): VD {.importc: "__builtin_vsx_xvdivdp", header: "<altivec.h>".}

proc Vsx_xvdivsp*(p0: VF, p1: VF): VF {.importc: "__builtin_vsx_xvdivsp", header: "<altivec.h>".}

proc Vsx_xvmadddp*(p0: VD, p1: VD, p2: VD): VD {.importc: "__builtin_vsx_xvmadddp", header: "<altivec.h>".}

proc Vsx_xvmaddsp*(p0: VF, p1: VF, p2: VF): VF {.importc: "__builtin_vsx_xvmaddsp", header: "<altivec.h>".}

proc Vsx_xvmaxdp*(p0: VD, p1: VD): VD {.importc: "__builtin_vsx_xvmaxdp", header: "<altivec.h>".}

proc Vsx_xvmaxsp*(p0: VF, p1: VF): VF {.importc: "__builtin_vsx_xvmaxsp", header: "<altivec.h>".}

proc Vsx_xvmindp*(p0: VD, p1: VD): VD {.importc: "__builtin_vsx_xvmindp", header: "<altivec.h>".}

proc Vsx_xvminsp*(p0: VF, p1: VF): VF {.importc: "__builtin_vsx_xvminsp", header: "<altivec.h>".}

proc Vsx_xvmsubdp*(p0: VD, p1: VD, p2: VD): VD {.importc: "__builtin_vsx_xvmsubdp", header: "<altivec.h>".}

proc Vsx_xvmsubsp*(p0: VF, p1: VF, p2: VF): VF {.importc: "__builtin_vsx_xvmsubsp", header: "<altivec.h>".}

proc Vsx_xvmuldp*(p0: VD, p1: VD): VD {.importc: "__builtin_vsx_xvmuldp", header: "<altivec.h>".}

proc Vsx_xvmulsp*(p0: VF, p1: VF): VF {.importc: "__builtin_vsx_xvmulsp", header: "<altivec.h>".}

proc Vsx_xvnabsdp*(p0: VD): VD {.importc: "__builtin_vsx_xvnabsdp", header: "<altivec.h>".}

proc Vsx_xvnabssp*(p0: VF): VF {.importc: "__builtin_vsx_xvnabssp", header: "<altivec.h>".}

proc Vsx_xvnmadddp*(p0: VD, p1: VD, p2: VD): VD {.importc: "__builtin_vsx_xvnmadddp", header: "<altivec.h>".}

proc Vsx_xvnmaddsp*(p0: VF, p1: VF, p2: VF): VF {.importc: "__builtin_vsx_xvnmaddsp", header: "<altivec.h>".}

proc Vsx_xvnmsubdp*(p0: VD, p1: VD, p2: VD): VD {.importc: "__builtin_vsx_xvnmsubdp", header: "<altivec.h>".}

proc Vsx_xvnmsubsp*(p0: VF, p1: VF, p2: VF): VF {.importc: "__builtin_vsx_xvnmsubsp", header: "<altivec.h>".}

proc Vsx_xvrdpi*(p0: VD): VD {.importc: "__builtin_vsx_xvrdpi", header: "<altivec.h>".}

proc Vsx_xvrdpic*(p0: VD): VD {.importc: "__builtin_vsx_xvrdpic", header: "<altivec.h>".}

proc Vsx_xvrdpim*(p0: VD): VD {.importc: "__builtin_vsx_xvrdpim", header: "<altivec.h>".}

proc Vsx_xvrdpip*(p0: VD): VD {.importc: "__builtin_vsx_xvrdpip", header: "<altivec.h>".}

proc Vsx_xvrdpiz*(p0: VD): VD {.importc: "__builtin_vsx_xvrdpiz", header: "<altivec.h>".}

proc Vsx_xvrecipdivdp*(p0: VD, p1: VD): VD {.importc: "__builtin_vsx_xvrecipdivdp", header: "<altivec.h>".}

proc Vsx_xvrecipdivsp*(p0: VF, p1: VF): VF {.importc: "__builtin_vsx_xvrecipdivsp", header: "<altivec.h>".}

proc Vsx_xvredp*(p0: VD): VD {.importc: "__builtin_vsx_xvredp", header: "<altivec.h>".}

proc Vsx_xvresp*(p0: VF): VF {.importc: "__builtin_vsx_xvresp", header: "<altivec.h>".}

proc Vsx_xvrspi*(p0: VF): VF {.importc: "__builtin_vsx_xvrspi", header: "<altivec.h>".}

proc Vsx_xvrspic*(p0: VF): VF {.importc: "__builtin_vsx_xvrspic", header: "<altivec.h>".}

proc Vsx_xvrspim*(p0: VF): VF {.importc: "__builtin_vsx_xvrspim", header: "<altivec.h>".}

proc Vsx_xvrspip*(p0: VF): VF {.importc: "__builtin_vsx_xvrspip", header: "<altivec.h>".}

proc Vsx_xvrspiz*(p0: VF): VF {.importc: "__builtin_vsx_xvrspiz", header: "<altivec.h>".}

proc Vsx_xvrsqrtdp*(p0: VD): VD {.importc: "__builtin_vsx_xvrsqrtdp", header: "<altivec.h>".}

proc Vsx_xvrsqrtsp*(p0: VF): VF {.importc: "__builtin_vsx_xvrsqrtsp", header: "<altivec.h>".}

proc Vsx_xvrsqrtedp*(p0: VD): VD {.importc: "__builtin_vsx_xvrsqrtedp", header: "<altivec.h>".}

proc Vsx_xvrsqrtesp*(p0: VF): VF {.importc: "__builtin_vsx_xvrsqrtesp", header: "<altivec.h>".}

proc Vsx_xvsqrtdp*(p0: VD): VD {.importc: "__builtin_vsx_xvsqrtdp", header: "<altivec.h>".}

proc Vsx_xvsqrtsp*(p0: VF): VF {.importc: "__builtin_vsx_xvsqrtsp", header: "<altivec.h>".}

proc Vsx_xvsubdp*(p0: VD, p1: VD): VD {.importc: "__builtin_vsx_xvsubdp", header: "<altivec.h>".}

proc Vsx_xvsubsp*(p0: VF, p1: VF): VF {.importc: "__builtin_vsx_xvsubsp", header: "<altivec.h>".}

proc Vsx_xvtdivdp_fe*(p0: VD, p1: VD): int32 {.importc: "__builtin_vsx_xvtdivdp_fe", header: "<altivec.h>".}

proc Vsx_xvtdivdp_fg*(p0: VD, p1: VD): int32 {.importc: "__builtin_vsx_xvtdivdp_fg", header: "<altivec.h>".}

proc Vsx_xvtdivsp_fe*(p0: VF, p1: VF): int32 {.importc: "__builtin_vsx_xvtdivsp_fe", header: "<altivec.h>".}

proc Vsx_xvtdivsp_fg*(p0: VF, p1: VF): int32 {.importc: "__builtin_vsx_xvtdivsp_fg", header: "<altivec.h>".}

proc Vsx_xvtsqrtdp_fe*(p0: VD): int32 {.importc: "__builtin_vsx_xvtsqrtdp_fe", header: "<altivec.h>".}

proc Vsx_xvtsqrtdp_fg*(p0: VD): int32 {.importc: "__builtin_vsx_xvtsqrtdp_fg", header: "<altivec.h>".}

proc Vsx_xvtsqrtsp_fe*(p0: VF): int32 {.importc: "__builtin_vsx_xvtsqrtsp_fe", header: "<altivec.h>".}

proc Vsx_xvtsqrtsp_fg*(p0: VF): int32 {.importc: "__builtin_vsx_xvtsqrtsp_fg", header: "<altivec.h>".}

## p2 constraint: <2>
proc Vsx_xxpermdi_16qi*(p0: VSC, p1: VSC, p2: int32): VSC {.importc: "__builtin_vsx_xxpermdi_16qi", header: "<altivec.h>".}

## p2 constraint: <2>
proc Vsx_xxpermdi_1ti*(p0: VSQ, p1: VSQ, p2: int32): VSQ {.importc: "__builtin_vsx_xxpermdi_1ti", header: "<altivec.h>".}

## p2 constraint: <2>
proc Vsx_xxpermdi_2df*(p0: VD, p1: VD, p2: int32): VD {.importc: "__builtin_vsx_xxpermdi_2df", header: "<altivec.h>".}

## p2 constraint: <2>
proc Vsx_xxpermdi_2di*(p0: VSLL, p1: VSLL, p2: int32): VSLL {.importc: "__builtin_vsx_xxpermdi_2di", header: "<altivec.h>".}

## p2 constraint: <2>
proc Vsx_xxpermdi_4sf*(p0: VF, p1: VF, p2: int32): VF {.importc: "__builtin_vsx_xxpermdi_4sf", header: "<altivec.h>".}

## p2 constraint: <2>
proc Vsx_xxpermdi_4si*(p0: VSI, p1: VSI, p2: int32): VSI {.importc: "__builtin_vsx_xxpermdi_4si", header: "<altivec.h>".}

## p2 constraint: <2>
proc Vsx_xxpermdi_8hi*(p0: VSS, p1: VSS, p2: int32): VSS {.importc: "__builtin_vsx_xxpermdi_8hi", header: "<altivec.h>".}

## p2 constraint: <2>
proc Vsx_xxsldwi_16qi*(p0: VSC, p1: VSC, p2: int32): VSC {.importc: "__builtin_vsx_xxsldwi_16qi", header: "<altivec.h>".}

## p2 constraint: <2>
proc Vsx_xxsldwi_2df*(p0: VD, p1: VD, p2: int32): VD {.importc: "__builtin_vsx_xxsldwi_2df", header: "<altivec.h>".}

## p2 constraint: <2>
proc Vsx_xxsldwi_2di*(p0: VSLL, p1: VSLL, p2: int32): VSLL {.importc: "__builtin_vsx_xxsldwi_2di", header: "<altivec.h>".}

## p2 constraint: <2>
proc Vsx_xxsldwi_v1ti*(p0: VSQ, p1: VSQ, p2: int32): VSQ {.importc: "__builtin_vsx_xxsldwi_v1ti", header: "<altivec.h>".}

## p2 constraint: <2>
proc Vsx_xxsldwi_4sf*(p0: VF, p1: VF, p2: int32): VF {.importc: "__builtin_vsx_xxsldwi_4sf", header: "<altivec.h>".}

## p2 constraint: <2>
proc Vsx_xxsldwi_4si*(p0: VSI, p1: VSI, p2: int32): VSI {.importc: "__builtin_vsx_xxsldwi_4si", header: "<altivec.h>".}

## p2 constraint: <2>
proc Vsx_xxsldwi_8hi*(p0: VSS, p1: VSS, p2: int32): VSS {.importc: "__builtin_vsx_xxsldwi_8hi", header: "<altivec.h>".}

## p1 constraint: <1>
proc Vsx_xxspltd_2df*(p0: VD, p1: int32): VD {.importc: "__builtin_vsx_xxspltd_2df", header: "<altivec.h>".}

## p1 constraint: <1>
proc Vsx_xxspltd_2di*(p0: VSLL, p1: int32): VSLL {.importc: "__builtin_vsx_xxspltd_2di", header: "<altivec.h>".}

## p1 constraint: <1>
proc Unpack_vector_int128*(p0: VSQ, p1: int32): uint64 {.importc: "__builtin_unpack_vector_int128", header: "<altivec.h>".}

# ========== [power7] (requires: -mcpu=power7) ==========

proc Addg6s*(p0: uint32, p1: uint32): uint32 {.importc: "__builtin_addg6s", header: "<altivec.h>".}

proc Bpermd*(p0: int64, p1: int64): int64 {.importc: "__builtin_bpermd", header: "<altivec.h>".}

proc Cbcdtd*(p0: uint32): uint32 {.importc: "__builtin_cbcdtd", header: "<altivec.h>".}

proc Cdtbcd*(p0: uint32): uint32 {.importc: "__builtin_cdtbcd", header: "<altivec.h>".}

proc Divwe*(p0: int32, p1: int32): int32 {.importc: "__builtin_divwe", header: "<altivec.h>".}

proc Divweu*(p0: uint32, p1: uint32): uint32 {.importc: "__builtin_divweu", header: "<altivec.h>".}

proc Ppc_speculation_barrier*() {.importc: "__builtin_ppc_speculation_barrier", header: "<altivec.h>".}

# ========== [power7-64] (requires: -mcpu=power7) ==========

proc Divde*(p0: int64, p1: int64): int64 {.importc: "__builtin_divde", header: "<altivec.h>".}

# ========== [power8-vector] (requires: -mcpu=power8) ==========

proc Altivec_abs_v2di*(p0: VSLL): VSLL {.importc: "__builtin_altivec_abs_v2di", header: "<altivec.h>".}

proc Altivec_bcddiv10_v16qi*(p0: VSC): VSC {.importc: "__builtin_altivec_bcddiv10_v16qi", header: "<altivec.h>".}

proc Altivec_bcdmul10_v16qi*(p0: VSC): VSC {.importc: "__builtin_altivec_bcdmul10_v16qi", header: "<altivec.h>".}

proc Altivec_eqv_v16qi*(p0: VSC, p1: VSC): VSC {.importc: "__builtin_altivec_eqv_v16qi", header: "<altivec.h>".}

proc Altivec_eqv_v16qi_uns*(p0: VUC, p1: VUC): VUC {.importc: "__builtin_altivec_eqv_v16qi_uns", header: "<altivec.h>".}

proc Altivec_eqv_v1ti*(p0: VSQ, p1: VSQ): VSQ {.importc: "__builtin_altivec_eqv_v1ti", header: "<altivec.h>".}

proc Altivec_eqv_v1ti_uns*(p0: VUQ, p1: VUQ): VUQ {.importc: "__builtin_altivec_eqv_v1ti_uns", header: "<altivec.h>".}

proc Altivec_eqv_v2df*(p0: VD, p1: VD): VD {.importc: "__builtin_altivec_eqv_v2df", header: "<altivec.h>".}

proc Altivec_eqv_v2di*(p0: VSLL, p1: VSLL): VSLL {.importc: "__builtin_altivec_eqv_v2di", header: "<altivec.h>".}

proc Altivec_eqv_v2di_uns*(p0: VULL, p1: VULL): VULL {.importc: "__builtin_altivec_eqv_v2di_uns", header: "<altivec.h>".}

proc Altivec_eqv_v4sf*(p0: VF, p1: VF): VF {.importc: "__builtin_altivec_eqv_v4sf", header: "<altivec.h>".}

proc Altivec_eqv_v4si*(p0: VSI, p1: VSI): VSI {.importc: "__builtin_altivec_eqv_v4si", header: "<altivec.h>".}

proc Altivec_eqv_v4si_uns*(p0: VUI, p1: VUI): VUI {.importc: "__builtin_altivec_eqv_v4si_uns", header: "<altivec.h>".}

proc Altivec_eqv_v8hi*(p0: VSS, p1: VSS): VSS {.importc: "__builtin_altivec_eqv_v8hi", header: "<altivec.h>".}

proc Altivec_eqv_v8hi_uns*(p0: VUS, p1: VUS): VUS {.importc: "__builtin_altivec_eqv_v8hi_uns", header: "<altivec.h>".}

proc Altivec_nand_v16qi*(p0: VSC, p1: VSC): VSC {.importc: "__builtin_altivec_nand_v16qi", header: "<altivec.h>".}

proc Altivec_nand_v16qi_uns*(p0: VUC, p1: VUC): VUC {.importc: "__builtin_altivec_nand_v16qi_uns", header: "<altivec.h>".}

proc Altivec_nand_v1ti*(p0: VSQ, p1: VSQ): VSQ {.importc: "__builtin_altivec_nand_v1ti", header: "<altivec.h>".}

proc Altivec_nand_v1ti_uns*(p0: VUQ, p1: VUQ): VUQ {.importc: "__builtin_altivec_nand_v1ti_uns", header: "<altivec.h>".}

proc Altivec_nand_v2df*(p0: VD, p1: VD): VD {.importc: "__builtin_altivec_nand_v2df", header: "<altivec.h>".}

proc Altivec_nand_v2di*(p0: VSLL, p1: VSLL): VSLL {.importc: "__builtin_altivec_nand_v2di", header: "<altivec.h>".}

proc Altivec_nand_v2di_uns*(p0: VULL, p1: VULL): VULL {.importc: "__builtin_altivec_nand_v2di_uns", header: "<altivec.h>".}

proc Altivec_nand_v4sf*(p0: VF, p1: VF): VF {.importc: "__builtin_altivec_nand_v4sf", header: "<altivec.h>".}

proc Altivec_nand_v4si*(p0: VSI, p1: VSI): VSI {.importc: "__builtin_altivec_nand_v4si", header: "<altivec.h>".}

proc Altivec_nand_v4si_uns*(p0: VUI, p1: VUI): VUI {.importc: "__builtin_altivec_nand_v4si_uns", header: "<altivec.h>".}

proc Altivec_nand_v8hi*(p0: VSS, p1: VSS): VSS {.importc: "__builtin_altivec_nand_v8hi", header: "<altivec.h>".}

proc Altivec_nand_v8hi_uns*(p0: VUS, p1: VUS): VUS {.importc: "__builtin_altivec_nand_v8hi_uns", header: "<altivec.h>".}

proc Altivec_neg_v2di*(p0: VSLL): VSLL {.importc: "__builtin_altivec_neg_v2di", header: "<altivec.h>".}

proc Altivec_orc_v16qi*(p0: VSC, p1: VSC): VSC {.importc: "__builtin_altivec_orc_v16qi", header: "<altivec.h>".}

proc Altivec_orc_v16qi_uns*(p0: VUC, p1: VUC): VUC {.importc: "__builtin_altivec_orc_v16qi_uns", header: "<altivec.h>".}

proc Altivec_orc_v1ti*(p0: VSQ, p1: VSQ): VSQ {.importc: "__builtin_altivec_orc_v1ti", header: "<altivec.h>".}

proc Altivec_orc_v1ti_uns*(p0: VUQ, p1: VUQ): VUQ {.importc: "__builtin_altivec_orc_v1ti_uns", header: "<altivec.h>".}

proc Altivec_orc_v2df*(p0: VD, p1: VD): VD {.importc: "__builtin_altivec_orc_v2df", header: "<altivec.h>".}

proc Altivec_orc_v2di*(p0: VSLL, p1: VSLL): VSLL {.importc: "__builtin_altivec_orc_v2di", header: "<altivec.h>".}

proc Altivec_orc_v2di_uns*(p0: VULL, p1: VULL): VULL {.importc: "__builtin_altivec_orc_v2di_uns", header: "<altivec.h>".}

proc Altivec_orc_v4sf*(p0: VF, p1: VF): VF {.importc: "__builtin_altivec_orc_v4sf", header: "<altivec.h>".}

proc Altivec_orc_v4si*(p0: VSI, p1: VSI): VSI {.importc: "__builtin_altivec_orc_v4si", header: "<altivec.h>".}

proc Altivec_orc_v4si_uns*(p0: VUI, p1: VUI): VUI {.importc: "__builtin_altivec_orc_v4si_uns", header: "<altivec.h>".}

proc Altivec_orc_v8hi*(p0: VSS, p1: VSS): VSS {.importc: "__builtin_altivec_orc_v8hi", header: "<altivec.h>".}

proc Altivec_orc_v8hi_uns*(p0: VUS, p1: VUS): VUS {.importc: "__builtin_altivec_orc_v8hi_uns", header: "<altivec.h>".}

proc Altivec_vclzb*(p0: VSC): VSC {.importc: "__builtin_altivec_vclzb", header: "<altivec.h>".}

proc Altivec_vclzd*(p0: VSLL): VSLL {.importc: "__builtin_altivec_vclzd", header: "<altivec.h>".}

proc Altivec_vclzh*(p0: VSS): VSS {.importc: "__builtin_altivec_vclzh", header: "<altivec.h>".}

proc Altivec_vclzw*(p0: VSI): VSI {.importc: "__builtin_altivec_vclzw", header: "<altivec.h>".}

proc Altivec_vgbbd*(p0: VUC): VUC {.importc: "__builtin_altivec_vgbbd", header: "<altivec.h>".}

proc Altivec_vaddcuq*(p0: VSQ, p1: VSQ): VSQ {.importc: "__builtin_altivec_vaddcuq", header: "<altivec.h>".}

proc Altivec_vaddecuq*(p0: VSQ, p1: VSQ, p2: VSQ): VSQ {.importc: "__builtin_altivec_vaddecuq", header: "<altivec.h>".}

proc Altivec_vaddeuqm*(p0: VSQ, p1: VSQ, p2: VSQ): VSQ {.importc: "__builtin_altivec_vaddeuqm", header: "<altivec.h>".}

proc Altivec_vaddudm*(p0: VSLL, p1: VSLL): VSLL {.importc: "__builtin_altivec_vaddudm", header: "<altivec.h>".}

proc Altivec_vadduqm*(p0: VSQ, p1: VSQ): VSQ {.importc: "__builtin_altivec_vadduqm", header: "<altivec.h>".}

proc Altivec_vbpermq*(p0: VSC, p1: VSC): VSLL {.importc: "__builtin_altivec_vbpermq", header: "<altivec.h>".}

proc Altivec_vbpermq2*(p0: VSC, p1: VSC): VSC {.importc: "__builtin_altivec_vbpermq2", header: "<altivec.h>".}

proc Altivec_vcmpequd*(p0: VULL, p1: VULL): VSLL {.importc: "__builtin_altivec_vcmpequd", header: "<altivec.h>".}

proc Altivec_vcmpequd_p*(p0: int32, p1: VSLL, p2: VSLL): int32 {.importc: "__builtin_altivec_vcmpequd_p", header: "<altivec.h>".}

proc Altivec_vcmpgtsd*(p0: VSLL, p1: VSLL): VSLL {.importc: "__builtin_altivec_vcmpgtsd", header: "<altivec.h>".}

proc Altivec_vcmpgtsd_p*(p0: int32, p1: VSLL, p2: VSLL): int32 {.importc: "__builtin_altivec_vcmpgtsd_p", header: "<altivec.h>".}

proc Altivec_vcmpgtud*(p0: VULL, p1: VULL): VSLL {.importc: "__builtin_altivec_vcmpgtud", header: "<altivec.h>".}

proc Altivec_vcmpgtud_p*(p0: int32, p1: VSLL, p2: VSLL): int32 {.importc: "__builtin_altivec_vcmpgtud_p", header: "<altivec.h>".}

proc Altivec_vmaxsd*(p0: VSLL, p1: VSLL): VSLL {.importc: "__builtin_altivec_vmaxsd", header: "<altivec.h>".}

proc Altivec_vmaxud*(p0: VULL, p1: VULL): VULL {.importc: "__builtin_altivec_vmaxud", header: "<altivec.h>".}

proc Altivec_vminsd*(p0: VSLL, p1: VSLL): VSLL {.importc: "__builtin_altivec_vminsd", header: "<altivec.h>".}

proc Altivec_vminud*(p0: VULL, p1: VULL): VULL {.importc: "__builtin_altivec_vminud", header: "<altivec.h>".}

proc Altivec_vmrgew_v2df*(p0: VD, p1: VD): VD {.importc: "__builtin_altivec_vmrgew_v2df", header: "<altivec.h>".}

proc Altivec_vmrgew_v2di*(p0: VSLL, p1: VSLL): VSLL {.importc: "__builtin_altivec_vmrgew_v2di", header: "<altivec.h>".}

proc Altivec_vmrgew_v4sf*(p0: VF, p1: VF): VF {.importc: "__builtin_altivec_vmrgew_v4sf", header: "<altivec.h>".}

proc Altivec_vmrgew_v4si*(p0: VSI, p1: VSI): VSI {.importc: "__builtin_altivec_vmrgew_v4si", header: "<altivec.h>".}

proc Altivec_vmrgow_v2df*(p0: VD, p1: VD): VD {.importc: "__builtin_altivec_vmrgow_v2df", header: "<altivec.h>".}

proc Altivec_vmrgow_v2di*(p0: VSLL, p1: VSLL): VSLL {.importc: "__builtin_altivec_vmrgow_v2di", header: "<altivec.h>".}

proc Altivec_vmrgow_v4sf*(p0: VF, p1: VF): VF {.importc: "__builtin_altivec_vmrgow_v4sf", header: "<altivec.h>".}

proc Altivec_vmrgow_v4si*(p0: VSI, p1: VSI): VSI {.importc: "__builtin_altivec_vmrgow_v4si", header: "<altivec.h>".}

proc Altivec_vpermxor*(p0: VSC, p1: VSC, p2: VSC): VSC {.importc: "__builtin_altivec_vpermxor", header: "<altivec.h>".}

proc Altivec_vpksdss*(p0: VSLL, p1: VSLL): VSI {.importc: "__builtin_altivec_vpksdss", header: "<altivec.h>".}

proc Altivec_vpksdus*(p0: VSLL, p1: VSLL): VSI {.importc: "__builtin_altivec_vpksdus", header: "<altivec.h>".}

proc Altivec_vpkudum*(p0: VSLL, p1: VSLL): VSI {.importc: "__builtin_altivec_vpkudum", header: "<altivec.h>".}

proc Altivec_vpkudus*(p0: VSLL, p1: VSLL): VSI {.importc: "__builtin_altivec_vpkudus", header: "<altivec.h>".}

proc Altivec_vpmsumb*(p0: VSC, p1: VSC): VSC {.importc: "__builtin_altivec_vpmsumb", header: "<altivec.h>".}

proc Altivec_vpmsumd*(p0: VSLL, p1: VSLL): VSLL {.importc: "__builtin_altivec_vpmsumd", header: "<altivec.h>".}

proc Altivec_vpmsumh*(p0: VSS, p1: VSS): VSS {.importc: "__builtin_altivec_vpmsumh", header: "<altivec.h>".}

proc Altivec_vpmsumw*(p0: VSI, p1: VSI): VSI {.importc: "__builtin_altivec_vpmsumw", header: "<altivec.h>".}

proc Altivec_vpopcntb*(p0: VSC): VSC {.importc: "__builtin_altivec_vpopcntb", header: "<altivec.h>".}

proc Altivec_vpopcntd*(p0: VSLL): VSLL {.importc: "__builtin_altivec_vpopcntd", header: "<altivec.h>".}

proc Altivec_vpopcnth*(p0: VSS): VSS {.importc: "__builtin_altivec_vpopcnth", header: "<altivec.h>".}

proc Altivec_vpopcntub*(p0: VSC): VSC {.importc: "__builtin_altivec_vpopcntub", header: "<altivec.h>".}

proc Altivec_vpopcntud*(p0: VSLL): VSLL {.importc: "__builtin_altivec_vpopcntud", header: "<altivec.h>".}

proc Altivec_vpopcntuh*(p0: VSS): VSS {.importc: "__builtin_altivec_vpopcntuh", header: "<altivec.h>".}

proc Altivec_vpopcntuw*(p0: VSI): VSI {.importc: "__builtin_altivec_vpopcntuw", header: "<altivec.h>".}

proc Altivec_vpopcntw*(p0: VSI): VSI {.importc: "__builtin_altivec_vpopcntw", header: "<altivec.h>".}

proc Altivec_vrld*(p0: VSLL, p1: VSLL): VSLL {.importc: "__builtin_altivec_vrld", header: "<altivec.h>".}

proc Altivec_vsld*(p0: VSLL, p1: VSLL): VSLL {.importc: "__builtin_altivec_vsld", header: "<altivec.h>".}

proc Altivec_vsrad*(p0: VSLL, p1: VSLL): VSLL {.importc: "__builtin_altivec_vsrad", header: "<altivec.h>".}

proc Altivec_vsrd*(p0: VSLL, p1: VULL): VSLL {.importc: "__builtin_altivec_vsrd", header: "<altivec.h>".}

proc Altivec_vsubcuq*(p0: VSQ, p1: VSQ): VSQ {.importc: "__builtin_altivec_vsubcuq", header: "<altivec.h>".}

proc Altivec_vsubecuq*(p0: VSQ, p1: VSQ, p2: VSQ): VSQ {.importc: "__builtin_altivec_vsubecuq", header: "<altivec.h>".}

proc Altivec_vsubeuqm*(p0: VSQ, p1: VSQ, p2: VSQ): VSQ {.importc: "__builtin_altivec_vsubeuqm", header: "<altivec.h>".}

proc Altivec_vsubudm*(p0: VSLL, p1: VSLL): VSLL {.importc: "__builtin_altivec_vsubudm", header: "<altivec.h>".}

proc Altivec_vsubuqm*(p0: VSQ, p1: VSQ): VSQ {.importc: "__builtin_altivec_vsubuqm", header: "<altivec.h>".}

proc Altivec_vupkhsw*(p0: VSI): VSLL {.importc: "__builtin_altivec_vupkhsw", header: "<altivec.h>".}

proc Altivec_vupklsw*(p0: VSI): VSLL {.importc: "__builtin_altivec_vupklsw", header: "<altivec.h>".}

## p2 constraint: <1>
proc Bcdadd_v1ti*(p0: VSQ, p1: VSQ, p2: int32): VSQ {.importc: "__builtin_bcdadd_v1ti", header: "<altivec.h>".}

## p2 constraint: <1>
proc Bcdadd_v16qi*(p0: VSC, p1: VSC, p2: int32): VSC {.importc: "__builtin_bcdadd_v16qi", header: "<altivec.h>".}

## p2 constraint: <1>
proc Bcdadd_eq_v1ti*(p0: VSQ, p1: VSQ, p2: int32): int32 {.importc: "__builtin_bcdadd_eq_v1ti", header: "<altivec.h>".}

## p2 constraint: <1>
proc Bcdadd_eq_v16qi*(p0: VSC, p1: VSC, p2: int32): int32 {.importc: "__builtin_bcdadd_eq_v16qi", header: "<altivec.h>".}

## p2 constraint: <1>
proc Bcdadd_gt_v1ti*(p0: VSQ, p1: VSQ, p2: int32): int32 {.importc: "__builtin_bcdadd_gt_v1ti", header: "<altivec.h>".}

## p2 constraint: <1>
proc Bcdadd_gt_v16qi*(p0: VSC, p1: VSC, p2: int32): int32 {.importc: "__builtin_bcdadd_gt_v16qi", header: "<altivec.h>".}

## p2 constraint: <1>
proc Bcdadd_lt_v1ti*(p0: VSQ, p1: VSQ, p2: int32): int32 {.importc: "__builtin_bcdadd_lt_v1ti", header: "<altivec.h>".}

## p2 constraint: <1>
proc Bcdadd_lt_v16qi*(p0: VSC, p1: VSC, p2: int32): int32 {.importc: "__builtin_bcdadd_lt_v16qi", header: "<altivec.h>".}

## p2 constraint: <1>
proc Bcdadd_ov_v1ti*(p0: VSQ, p1: VSQ, p2: int32): int32 {.importc: "__builtin_bcdadd_ov_v1ti", header: "<altivec.h>".}

## p2 constraint: <1>
proc Bcdadd_ov_v16qi*(p0: VSC, p1: VSC, p2: int32): int32 {.importc: "__builtin_bcdadd_ov_v16qi", header: "<altivec.h>".}

proc Bcdinvalid_v1ti*(p0: VSQ): int32 {.importc: "__builtin_bcdinvalid_v1ti", header: "<altivec.h>".}

proc Bcdinvalid_v16qi*(p0: VSC): int32 {.importc: "__builtin_bcdinvalid_v16qi", header: "<altivec.h>".}

## p2 constraint: <1>
proc Bcdsub_v1ti*(p0: VSQ, p1: VSQ, p2: int32): VSQ {.importc: "__builtin_bcdsub_v1ti", header: "<altivec.h>".}

## p2 constraint: <1>
proc Bcdsub_v16qi*(p0: VSC, p1: VSC, p2: int32): VSC {.importc: "__builtin_bcdsub_v16qi", header: "<altivec.h>".}

## p2 constraint: <1>
proc Bcdsub_eq_v1ti*(p0: VSQ, p1: VSQ, p2: int32): int32 {.importc: "__builtin_bcdsub_eq_v1ti", header: "<altivec.h>".}

## p2 constraint: <1>
proc Bcdsub_eq_v16qi*(p0: VSC, p1: VSC, p2: int32): int32 {.importc: "__builtin_bcdsub_eq_v16qi", header: "<altivec.h>".}

## p2 constraint: <1>
proc Bcdsub_ge_v1ti*(p0: VSQ, p1: VSQ, p2: int32): int32 {.importc: "__builtin_bcdsub_ge_v1ti", header: "<altivec.h>".}

## p2 constraint: <1>
proc Bcdsub_ge_v16qi*(p0: VSC, p1: VSC, p2: int32): int32 {.importc: "__builtin_bcdsub_ge_v16qi", header: "<altivec.h>".}

## p2 constraint: <1>
proc Bcdsub_gt_v1ti*(p0: VSQ, p1: VSQ, p2: int32): int32 {.importc: "__builtin_bcdsub_gt_v1ti", header: "<altivec.h>".}

## p2 constraint: <1>
proc Bcdsub_gt_v16qi*(p0: VSC, p1: VSC, p2: int32): int32 {.importc: "__builtin_bcdsub_gt_v16qi", header: "<altivec.h>".}

## p2 constraint: <1>
proc Bcdsub_le_v1ti*(p0: VSQ, p1: VSQ, p2: int32): int32 {.importc: "__builtin_bcdsub_le_v1ti", header: "<altivec.h>".}

## p2 constraint: <1>
proc Bcdsub_le_v16qi*(p0: VSC, p1: VSC, p2: int32): int32 {.importc: "__builtin_bcdsub_le_v16qi", header: "<altivec.h>".}

## p2 constraint: <1>
proc Bcdsub_lt_v1ti*(p0: VSQ, p1: VSQ, p2: int32): int32 {.importc: "__builtin_bcdsub_lt_v1ti", header: "<altivec.h>".}

## p2 constraint: <1>
proc Bcdsub_lt_v16qi*(p0: VSC, p1: VSC, p2: int32): int32 {.importc: "__builtin_bcdsub_lt_v16qi", header: "<altivec.h>".}

## p2 constraint: <1>
proc Bcdsub_ov_v1ti*(p0: VSQ, p1: VSQ, p2: int32): int32 {.importc: "__builtin_bcdsub_ov_v1ti", header: "<altivec.h>".}

## p2 constraint: <1>
proc Bcdsub_ov_v16qi*(p0: VSC, p1: VSC, p2: int32): int32 {.importc: "__builtin_bcdsub_ov_v16qi", header: "<altivec.h>".}

proc Crypto_vpermxor_v16qi*(p0: VUC, p1: VUC, p2: VUC): VUC {.importc: "__builtin_crypto_vpermxor_v16qi", header: "<altivec.h>".}

proc Crypto_vpermxor_v2di*(p0: VULL, p1: VULL, p2: VULL): VULL {.importc: "__builtin_crypto_vpermxor_v2di", header: "<altivec.h>".}

proc Crypto_vpermxor_v4si*(p0: VUI, p1: VUI, p2: VUI): VUI {.importc: "__builtin_crypto_vpermxor_v4si", header: "<altivec.h>".}

proc Crypto_vpermxor_v8hi*(p0: VUS, p1: VUS, p2: VUS): VUS {.importc: "__builtin_crypto_vpermxor_v8hi", header: "<altivec.h>".}

proc Crypto_vpmsumb*(p0: VUC, p1: VUC): VUC {.importc: "__builtin_crypto_vpmsumb", header: "<altivec.h>".}

proc Crypto_vpmsumd*(p0: VULL, p1: VULL): VULL {.importc: "__builtin_crypto_vpmsumd", header: "<altivec.h>".}

proc Crypto_vpmsumh*(p0: VUS, p1: VUS): VUS {.importc: "__builtin_crypto_vpmsumh", header: "<altivec.h>".}

proc Crypto_vpmsumw*(p0: VUI, p1: VUI): VUI {.importc: "__builtin_crypto_vpmsumw", header: "<altivec.h>".}

proc Vsx_float2_v2df*(p0: VD, p1: VD): VF {.importc: "__builtin_vsx_float2_v2df", header: "<altivec.h>".}

proc Vsx_float2_v2di*(p0: VSLL, p1: VSLL): VF {.importc: "__builtin_vsx_float2_v2di", header: "<altivec.h>".}

proc Vsx_revb_v16qi*(p0: VSC): VSC {.importc: "__builtin_vsx_revb_v16qi", header: "<altivec.h>".}

proc Vsx_revb_v1ti*(p0: VSQ): VSQ {.importc: "__builtin_vsx_revb_v1ti", header: "<altivec.h>".}

proc Vsx_revb_v2df*(p0: VD): VD {.importc: "__builtin_vsx_revb_v2df", header: "<altivec.h>".}

proc Vsx_revb_v2di*(p0: VSLL): VSLL {.importc: "__builtin_vsx_revb_v2di", header: "<altivec.h>".}

proc Vsx_revb_v4sf*(p0: VF): VF {.importc: "__builtin_vsx_revb_v4sf", header: "<altivec.h>".}

proc Vsx_revb_v4si*(p0: VSI): VSI {.importc: "__builtin_vsx_revb_v4si", header: "<altivec.h>".}

proc Vsx_revb_v8hi*(p0: VSS): VSS {.importc: "__builtin_vsx_revb_v8hi", header: "<altivec.h>".}

proc Vsx_uns_float2_v2di*(p0: VSLL, p1: VSLL): VF {.importc: "__builtin_vsx_uns_float2_v2di", header: "<altivec.h>".}

proc Vsx_vsigned2_v2df*(p0: VD, p1: VD): VSI {.importc: "__builtin_vsx_vsigned2_v2df", header: "<altivec.h>".}

proc Vsx_vunsigned2_v2df*(p0: VD, p1: VD): VSI {.importc: "__builtin_vsx_vunsigned2_v2df", header: "<altivec.h>".}

proc Vsx_xscvdpspn*(p0: float64): VF {.importc: "__builtin_vsx_xscvdpspn", header: "<altivec.h>".}

proc Vsx_xscvspdpn*(p0: VF): float64 {.importc: "__builtin_vsx_xscvspdpn", header: "<altivec.h>".}

# ========== [power9-vector] (requires: -mcpu=power9) ==========

proc Altivec_convert_4f32_8f16*(p0: VF, p1: VF): VSS {.importc: "__builtin_altivec_convert_4f32_8f16", header: "<altivec.h>".}

proc Altivec_convert_4f32_8i16*(p0: VF, p1: VF): VSS {.importc: "__builtin_altivec_convert_4f32_8i16", header: "<altivec.h>".}

proc Altivec_first_match_index_v16qi*(p0: VSC, p1: VSC): int32 {.importc: "__builtin_altivec_first_match_index_v16qi", header: "<altivec.h>".}

proc Altivec_first_match_index_v8hi*(p0: VSS, p1: VSS): int32 {.importc: "__builtin_altivec_first_match_index_v8hi", header: "<altivec.h>".}

proc Altivec_first_match_index_v4si*(p0: VSI, p1: VSI): int32 {.importc: "__builtin_altivec_first_match_index_v4si", header: "<altivec.h>".}

proc Altivec_first_match_or_eos_index_v16qi*(p0: VSC, p1: VSC): int32 {.importc: "__builtin_altivec_first_match_or_eos_index_v16qi", header: "<altivec.h>".}

proc Altivec_first_match_or_eos_index_v8hi*(p0: VSS, p1: VSS): int32 {.importc: "__builtin_altivec_first_match_or_eos_index_v8hi", header: "<altivec.h>".}

proc Altivec_first_match_or_eos_index_v4si*(p0: VSI, p1: VSI): int32 {.importc: "__builtin_altivec_first_match_or_eos_index_v4si", header: "<altivec.h>".}

proc Altivec_first_mismatch_index_v16qi*(p0: VSC, p1: VSC): int32 {.importc: "__builtin_altivec_first_mismatch_index_v16qi", header: "<altivec.h>".}

proc Altivec_first_mismatch_index_v8hi*(p0: VSS, p1: VSS): int32 {.importc: "__builtin_altivec_first_mismatch_index_v8hi", header: "<altivec.h>".}

proc Altivec_first_mismatch_index_v4si*(p0: VSI, p1: VSI): int32 {.importc: "__builtin_altivec_first_mismatch_index_v4si", header: "<altivec.h>".}

proc Altivec_vadub*(p0: VSC, p1: VSC): VSC {.importc: "__builtin_altivec_vadub", header: "<altivec.h>".}

proc Altivec_vaduh*(p0: VSS, p1: VSS): VSS {.importc: "__builtin_altivec_vaduh", header: "<altivec.h>".}

proc Altivec_vaduw*(p0: VSI, p1: VSI): VSI {.importc: "__builtin_altivec_vaduw", header: "<altivec.h>".}

proc Altivec_vbpermd*(p0: VSLL, p1: VSC): VSLL {.importc: "__builtin_altivec_vbpermd", header: "<altivec.h>".}

proc Altivec_vclzlsbb_v16qi*(p0: VSC): int32 {.importc: "__builtin_altivec_vclzlsbb_v16qi", header: "<altivec.h>".}

proc Altivec_vclzlsbb_v4si*(p0: VSI): int32 {.importc: "__builtin_altivec_vclzlsbb_v4si", header: "<altivec.h>".}

proc Altivec_vclzlsbb_v8hi*(p0: VSS): int32 {.importc: "__builtin_altivec_vclzlsbb_v8hi", header: "<altivec.h>".}

proc Altivec_vctzb*(p0: VSC): VSC {.importc: "__builtin_altivec_vctzb", header: "<altivec.h>".}

proc Altivec_vctzd*(p0: VSLL): VSLL {.importc: "__builtin_altivec_vctzd", header: "<altivec.h>".}

proc Altivec_vctzh*(p0: VSS): VSS {.importc: "__builtin_altivec_vctzh", header: "<altivec.h>".}

proc Altivec_vctzw*(p0: VSI): VSI {.importc: "__builtin_altivec_vctzw", header: "<altivec.h>".}

proc Altivec_vctzlsbb_v16qi*(p0: VSC): int32 {.importc: "__builtin_altivec_vctzlsbb_v16qi", header: "<altivec.h>".}

proc Altivec_vctzlsbb_v4si*(p0: VSI): int32 {.importc: "__builtin_altivec_vctzlsbb_v4si", header: "<altivec.h>".}

proc Altivec_vctzlsbb_v8hi*(p0: VSS): int32 {.importc: "__builtin_altivec_vctzlsbb_v8hi", header: "<altivec.h>".}

proc Altivec_vcmpaeb_p*(p0: VSC, p1: VSC): int32 {.importc: "__builtin_altivec_vcmpaeb_p", header: "<altivec.h>".}

proc Altivec_vcmpaed_p*(p0: VSLL, p1: VSLL): int32 {.importc: "__builtin_altivec_vcmpaed_p", header: "<altivec.h>".}

proc Altivec_vcmpaedp_p*(p0: VD, p1: VD): int32 {.importc: "__builtin_altivec_vcmpaedp_p", header: "<altivec.h>".}

proc Altivec_vcmpaefp_p*(p0: VF, p1: VF): int32 {.importc: "__builtin_altivec_vcmpaefp_p", header: "<altivec.h>".}

proc Altivec_vcmpaeh_p*(p0: VSS, p1: VSS): int32 {.importc: "__builtin_altivec_vcmpaeh_p", header: "<altivec.h>".}

proc Altivec_vcmpaew_p*(p0: VSI, p1: VSI): int32 {.importc: "__builtin_altivec_vcmpaew_p", header: "<altivec.h>".}

proc Altivec_vcmpneb_p*(p0: VSC, p1: VSC): int32 {.importc: "__builtin_altivec_vcmpneb_p", header: "<altivec.h>".}

proc Altivec_vcmpned_p*(p0: VSLL, p1: VSLL): int32 {.importc: "__builtin_altivec_vcmpned_p", header: "<altivec.h>".}

proc Altivec_vcmpnedp_p*(p0: VD, p1: VD): int32 {.importc: "__builtin_altivec_vcmpnedp_p", header: "<altivec.h>".}

proc Altivec_vcmpnefp_p*(p0: VF, p1: VF): int32 {.importc: "__builtin_altivec_vcmpnefp_p", header: "<altivec.h>".}

proc Altivec_vcmpneh_p*(p0: VSS, p1: VSS): int32 {.importc: "__builtin_altivec_vcmpneh_p", header: "<altivec.h>".}

proc Altivec_vcmpnew_p*(p0: VSI, p1: VSI): int32 {.importc: "__builtin_altivec_vcmpnew_p", header: "<altivec.h>".}

proc Altivec_vcmpnezb*(p0: VSC, p1: VSC): VSC {.importc: "__builtin_altivec_vcmpnezb", header: "<altivec.h>".}

proc Altivec_vcmpnezb_p*(p0: int32, p1: VSC, p2: VSC): int32 {.importc: "__builtin_altivec_vcmpnezb_p", header: "<altivec.h>".}

proc Altivec_vcmpnezh*(p0: VSS, p1: VSS): VSS {.importc: "__builtin_altivec_vcmpnezh", header: "<altivec.h>".}

proc Altivec_vcmpnezh_p*(p0: int32, p1: VSS, p2: VSS): int32 {.importc: "__builtin_altivec_vcmpnezh_p", header: "<altivec.h>".}

proc Altivec_vcmpnezw*(p0: VSI, p1: VSI): VSI {.importc: "__builtin_altivec_vcmpnezw", header: "<altivec.h>".}

proc Altivec_vcmpnezw_p*(p0: int32, p1: VSI, p2: VSI): int32 {.importc: "__builtin_altivec_vcmpnezw_p", header: "<altivec.h>".}

proc Altivec_vextublx*(p0: int32, p1: VSC): int32 {.importc: "__builtin_altivec_vextublx", header: "<altivec.h>".}

proc Altivec_vextubrx*(p0: int32, p1: VSC): int32 {.importc: "__builtin_altivec_vextubrx", header: "<altivec.h>".}

proc Altivec_vextuhlx*(p0: int32, p1: VSS): int32 {.importc: "__builtin_altivec_vextuhlx", header: "<altivec.h>".}

proc Altivec_vextuhrx*(p0: int32, p1: VSS): int32 {.importc: "__builtin_altivec_vextuhrx", header: "<altivec.h>".}

proc Altivec_vextuwlx*(p0: int32, p1: VSI): int32 {.importc: "__builtin_altivec_vextuwlx", header: "<altivec.h>".}

proc Altivec_vextuwrx*(p0: int32, p1: VSI): int32 {.importc: "__builtin_altivec_vextuwrx", header: "<altivec.h>".}

proc Altivec_vmsumudm*(p0: VSLL, p1: VSLL, p2: VSQ): VSQ {.importc: "__builtin_altivec_vmsumudm", header: "<altivec.h>".}

proc Altivec_vprtybd*(p0: VSLL): VSLL {.importc: "__builtin_altivec_vprtybd", header: "<altivec.h>".}

proc Altivec_vprtybq*(p0: VSQ): VSQ {.importc: "__builtin_altivec_vprtybq", header: "<altivec.h>".}

proc Altivec_vprtybw*(p0: VSI): VSI {.importc: "__builtin_altivec_vprtybw", header: "<altivec.h>".}

proc Altivec_vrldmi*(p0: VSLL, p1: VSLL, p2: VSLL): VSLL {.importc: "__builtin_altivec_vrldmi", header: "<altivec.h>".}

proc Altivec_vrldnm*(p0: VSLL, p1: VSLL): VSLL {.importc: "__builtin_altivec_vrldnm", header: "<altivec.h>".}

proc Altivec_vrlwmi*(p0: VSI, p1: VSI, p2: VSI): VSI {.importc: "__builtin_altivec_vrlwmi", header: "<altivec.h>".}

proc Altivec_vrlwnm*(p0: VSI, p1: VSI): VSI {.importc: "__builtin_altivec_vrlwnm", header: "<altivec.h>".}

proc Altivec_vsignextsb2d*(p0: VSC): VSLL {.importc: "__builtin_altivec_vsignextsb2d", header: "<altivec.h>".}

proc Altivec_vsignextsb2w*(p0: VSC): VSI {.importc: "__builtin_altivec_vsignextsb2w", header: "<altivec.h>".}

proc Altivec_visgnextsh2d*(p0: VSS): VSLL {.importc: "__builtin_altivec_visgnextsh2d", header: "<altivec.h>".}

proc Altivec_vsignextsh2w*(p0: VSS): VSI {.importc: "__builtin_altivec_vsignextsh2w", header: "<altivec.h>".}

proc Altivec_vsignextsw2d*(p0: VSI): VSLL {.importc: "__builtin_altivec_vsignextsw2d", header: "<altivec.h>".}

proc Altivec_vslv*(p0: VSC, p1: VSC): VSC {.importc: "__builtin_altivec_vslv", header: "<altivec.h>".}

proc Altivec_vsrv*(p0: VSC, p1: VSC): VSC {.importc: "__builtin_altivec_vsrv", header: "<altivec.h>".}

proc Scalar_byte_in_range*(p0: int32, p1: int32): int32 {.importc: "__builtin_scalar_byte_in_range", header: "<altivec.h>".}

## p1 constraint: [0
proc Vsx_extract4b*(p0: VSC, p1: int32): VSLL {.importc: "__builtin_vsx_extract4b", header: "<altivec.h>".}

proc Vsx_extract_exp_dp*(p0: VD): VD {.importc: "__builtin_vsx_extract_exp_dp", header: "<altivec.h>".}

proc Vsx_extract_exp_sp*(p0: VF): VF {.importc: "__builtin_vsx_extract_exp_sp", header: "<altivec.h>".}

proc Vsx_extract_sig_dp*(p0: VD): VD {.importc: "__builtin_vsx_extract_sig_dp", header: "<altivec.h>".}

proc Vsx_extract_sig_sp*(p0: VF): VF {.importc: "__builtin_vsx_extract_sig_sp", header: "<altivec.h>".}

## p2 constraint: [0
proc Vsx_insert4b*(p0: VSI, p1: VSC, p2: int32): VSC {.importc: "__builtin_vsx_insert4b", header: "<altivec.h>".}

proc Vsx_insert_exp_dp*(p0: VD, p1: VD): VD {.importc: "__builtin_vsx_insert_exp_dp", header: "<altivec.h>".}

proc Vsx_insert_exp_sp*(p0: VF, p1: VF): VF {.importc: "__builtin_vsx_insert_exp_sp", header: "<altivec.h>".}

proc Vsx_scalar_cmp_exp_dp_eq*(p0: float64, p1: float64): int32 {.importc: "__builtin_vsx_scalar_cmp_exp_dp_eq", header: "<altivec.h>".}

proc Vsx_scalar_cmp_exp_dp_gt*(p0: float64, p1: float64): int32 {.importc: "__builtin_vsx_scalar_cmp_exp_dp_gt", header: "<altivec.h>".}

proc Vsx_scalar_cmp_exp_dp_lt*(p0: float64, p1: float64): int32 {.importc: "__builtin_vsx_scalar_cmp_exp_dp_lt", header: "<altivec.h>".}

proc Vsx_scalar_cmp_exp_dp_unordered*(p0: float64, p1: float64): int32 {.importc: "__builtin_vsx_scalar_cmp_exp_dp_unordered", header: "<altivec.h>".}

proc Vsx_scalar_test_neg_dp*(p0: float64): int32 {.importc: "__builtin_vsx_scalar_test_neg_dp", header: "<altivec.h>".}

proc Vsx_scalar_test_neg_sp*(p0: float32): int32 {.importc: "__builtin_vsx_scalar_test_neg_sp", header: "<altivec.h>".}

## p1 constraint: <7>
proc Vsx_test_data_class_dp*(p0: VD, p1: int32): VSLL {.importc: "__builtin_vsx_test_data_class_dp", header: "<altivec.h>".}

## p1 constraint: <7>
proc Vsx_test_data_class_sp*(p0: VF, p1: int32): VSI {.importc: "__builtin_vsx_test_data_class_sp", header: "<altivec.h>".}

proc Vsx_vextract_fp_from_shorth*(p0: VSS): VF {.importc: "__builtin_vsx_vextract_fp_from_shorth", header: "<altivec.h>".}

proc Vsx_vextract_fp_from_shortl*(p0: VSS): VF {.importc: "__builtin_vsx_vextract_fp_from_shortl", header: "<altivec.h>".}

proc Vsx_xxbrd_v2df*(p0: VD): VD {.importc: "__builtin_vsx_xxbrd_v2df", header: "<altivec.h>".}

proc Vsx_xxbrd_v2di*(p0: VSLL): VSLL {.importc: "__builtin_vsx_xxbrd_v2di", header: "<altivec.h>".}

proc Vsx_xxbrh_v8hi*(p0: VSS): VSS {.importc: "__builtin_vsx_xxbrh_v8hi", header: "<altivec.h>".}

proc Vsx_xxbrq_v16qi*(p0: VSC): VSC {.importc: "__builtin_vsx_xxbrq_v16qi", header: "<altivec.h>".}

proc Vsx_xxbrq_v1ti*(p0: VSQ): VSQ {.importc: "__builtin_vsx_xxbrq_v1ti", header: "<altivec.h>".}

proc Vsx_xxbrw_v4sf*(p0: VF): VF {.importc: "__builtin_vsx_xxbrw_v4sf", header: "<altivec.h>".}

proc Vsx_xxbrw_v4si*(p0: VSI): VSI {.importc: "__builtin_vsx_xxbrw_v4si", header: "<altivec.h>".}

proc Vsx_scalar_cmp_exp_qp_eq*(p0: float128, p1: float128): int32 {.importc: "__builtin_vsx_scalar_cmp_exp_qp_eq", header: "<altivec.h>".}

proc Vsx_scalar_cmp_exp_qp_gt*(p0: float128, p1: float128): int32 {.importc: "__builtin_vsx_scalar_cmp_exp_qp_gt", header: "<altivec.h>".}

proc Vsx_scalar_cmp_exp_qp_lt*(p0: float128, p1: float128): int32 {.importc: "__builtin_vsx_scalar_cmp_exp_qp_lt", header: "<altivec.h>".}

# ========== [power9] (requires: -mcpu=power9) ==========

proc Darn*(): int64 {.importc: "__builtin_darn", header: "<altivec.h>".}

proc Darn_32*(): int64 {.importc: "__builtin_darn_32", header: "<altivec.h>".}

proc Darn_raw*(): int64 {.importc: "__builtin_darn_raw", header: "<altivec.h>".}

## p0 constraint: <6>
proc Dtstsfi_eq_dd*(p0: int32, p1: decimal64): int32 {.importc: "__builtin_dtstsfi_eq_dd", header: "<altivec.h>".}

## p0 constraint: <6>
proc Dtstsfi_eq_td*(p0: int32, p1: decimal128): int32 {.importc: "__builtin_dtstsfi_eq_td", header: "<altivec.h>".}

## p0 constraint: <6>
proc Dtstsfi_gt_dd*(p0: int32, p1: decimal64): int32 {.importc: "__builtin_dtstsfi_gt_dd", header: "<altivec.h>".}

## p0 constraint: <6>
proc Dtstsfi_gt_td*(p0: int32, p1: decimal128): int32 {.importc: "__builtin_dtstsfi_gt_td", header: "<altivec.h>".}

## p0 constraint: <6>
proc Dtstsfi_lt_dd*(p0: int32, p1: decimal64): int32 {.importc: "__builtin_dtstsfi_lt_dd", header: "<altivec.h>".}

## p0 constraint: <6>
proc Dtstsfi_lt_td*(p0: int32, p1: decimal128): int32 {.importc: "__builtin_dtstsfi_lt_td", header: "<altivec.h>".}

## p0 constraint: <6>
proc Dtstsfi_ov_dd*(p0: int32, p1: decimal64): int32 {.importc: "__builtin_dtstsfi_ov_dd", header: "<altivec.h>".}

## p0 constraint: <6>
proc Dtstsfi_ov_td*(p0: int32, p1: decimal128): int32 {.importc: "__builtin_dtstsfi_ov_td", header: "<altivec.h>".}

proc Vsx_scalar_extract_exp*(p0: float64): int32 {.importc: "__builtin_vsx_scalar_extract_exp", header: "<altivec.h>".}

# ========== [power9-64] (requires: -mcpu=power9) ==========

proc Altivec_xst_len_r*(p0: VSC, p1: pointer, p2: int64) {.importc: "__builtin_altivec_xst_len_r", header: "<altivec.h>".}

proc Altivec_stxvl*(p0: VSC, p1: pointer, p2: int64) {.importc: "__builtin_altivec_stxvl", header: "<altivec.h>".}

proc Scalar_byte_in_set*(p0: int32, p1: int64): int32 {.importc: "__builtin_scalar_byte_in_set", header: "<altivec.h>".}

proc Vsx_lxvl*(p0: pointer, p1: int64): VSC {.importc: "__builtin_vsx_lxvl", header: "<altivec.h>".}

proc Vsx_scalar_extract_sig*(p0: float64): int64 {.importc: "__builtin_vsx_scalar_extract_sig", header: "<altivec.h>".}

proc Vsx_scalar_insert_exp_dp*(p0: float64, p1: uint64): float64 {.importc: "__builtin_vsx_scalar_insert_exp_dp", header: "<altivec.h>".}

proc Vsx_xl_len_r*(p0: pointer, p1: int64): VSC {.importc: "__builtin_vsx_xl_len_r", header: "<altivec.h>".}

# ========== [ieee128-hw] (requires: -mfloat128-hardware) ==========

proc Addf128_round_to_odd*(p0: float128, p1: float128): float128 {.importc: "__builtin_addf128_round_to_odd", header: "<altivec.h>".}

proc Divf128_round_to_odd*(p0: float128, p1: float128): float128 {.importc: "__builtin_divf128_round_to_odd", header: "<altivec.h>".}

proc Mulf128_round_to_odd*(p0: float128, p1: float128): float128 {.importc: "__builtin_mulf128_round_to_odd", header: "<altivec.h>".}

proc Sqrtf128_round_to_odd*(p0: float128): float128 {.importc: "__builtin_sqrtf128_round_to_odd", header: "<altivec.h>".}

proc Subf128_round_to_odd*(p0: float128, p1: float128): float128 {.importc: "__builtin_subf128_round_to_odd", header: "<altivec.h>".}

proc Truncf128_round_to_odd*(p0: float128): float64 {.importc: "__builtin_truncf128_round_to_odd", header: "<altivec.h>".}

proc Vsx_scalar_extract_expq*(p0: float128): int64 {.importc: "__builtin_vsx_scalar_extract_expq", header: "<altivec.h>".}

proc Vsx_scalar_extract_exp_to_vec*(p0: float128): VULL {.importc: "__builtin_vsx_scalar_extract_exp_to_vec", header: "<altivec.h>".}

proc Vsx_scalar_extract_sigq*(p0: float128): int128 {.importc: "__builtin_vsx_scalar_extract_sigq", header: "<altivec.h>".}

proc Vsx_scalar_extract_sig_to_vec*(p0: float128): VUQ {.importc: "__builtin_vsx_scalar_extract_sig_to_vec", header: "<altivec.h>".}

proc Vsx_scalar_insert_exp_vqp*(p0: VUQ, p1: VULL): float128 {.importc: "__builtin_vsx_scalar_insert_exp_vqp", header: "<altivec.h>".}

proc Vsx_scalar_test_neg_qp*(p0: float128): int32 {.importc: "__builtin_vsx_scalar_test_neg_qp", header: "<altivec.h>".}

# ========== [dfp] (requires: -mhard-dfp) ==========

## p0 constraint: <2>
proc Ddedpd*(p0: int32, p1: decimal64): decimal64 {.importc: "__builtin_ddedpd", header: "<altivec.h>".}

## p0 constraint: <2>
proc Ddedpdq*(p0: int32, p1: decimal128): decimal128 {.importc: "__builtin_ddedpdq", header: "<altivec.h>".}

## p0 constraint: <1>
proc Denbcd*(p0: int32, p1: decimal64): decimal64 {.importc: "__builtin_denbcd", header: "<altivec.h>".}

## p0 constraint: <1>
proc Denbcdq*(p0: int32, p1: decimal128): decimal128 {.importc: "__builtin_denbcdq", header: "<altivec.h>".}

proc Denb2dfp_v16qi*(p0: VSC): decimal128 {.importc: "__builtin_denb2dfp_v16qi", header: "<altivec.h>".}

proc Diex*(p0: int64, p1: decimal64): decimal64 {.importc: "__builtin_diex", header: "<altivec.h>".}

proc Diexq*(p0: int64, p1: decimal128): decimal128 {.importc: "__builtin_diexq", header: "<altivec.h>".}

## p1 constraint: <6>
proc Dscli*(p0: decimal64, p1: int32): decimal64 {.importc: "__builtin_dscli", header: "<altivec.h>".}

## p1 constraint: <6>
proc Dscliq*(p0: decimal128, p1: int32): decimal128 {.importc: "__builtin_dscliq", header: "<altivec.h>".}

## p1 constraint: <6>
proc Dscri*(p0: decimal64, p1: int32): decimal64 {.importc: "__builtin_dscri", header: "<altivec.h>".}

## p1 constraint: <6>
proc Dscriq*(p0: decimal128, p1: int32): decimal128 {.importc: "__builtin_dscriq", header: "<altivec.h>".}

proc Dxex*(p0: decimal64): int64 {.importc: "__builtin_dxex", header: "<altivec.h>".}

proc Dxexq*(p0: decimal128): int64 {.importc: "__builtin_dxexq", header: "<altivec.h>".}

## p0 constraint: [0
proc Set_fpscr_drn*(p0: int32) {.importc: "__builtin_set_fpscr_drn", header: "<altivec.h>".}

## p1 constraint: <1>
proc Unpack_dec128*(p0: decimal128, p1: int32): uint64 {.importc: "__builtin_unpack_dec128", header: "<altivec.h>".}

# ========== [crypto] (requires: -mcrypto) ==========

proc Crypto_vcipher*(p0: VULL, p1: VULL): VULL {.importc: "__builtin_crypto_vcipher", header: "<altivec.h>".}

proc Crypto_vcipher_be*(p0: VUC, p1: VUC): VUC {.importc: "__builtin_crypto_vcipher_be", header: "<altivec.h>".}

proc Crypto_vcipherlast*(p0: VULL, p1: VULL): VULL {.importc: "__builtin_crypto_vcipherlast", header: "<altivec.h>".}

proc Crypto_vcipherlast_be*(p0: VUC, p1: VUC): VUC {.importc: "__builtin_crypto_vcipherlast_be", header: "<altivec.h>".}

proc Crypto_vncipher*(p0: VULL, p1: VULL): VULL {.importc: "__builtin_crypto_vncipher", header: "<altivec.h>".}

proc Crypto_vncipher_be*(p0: VUC, p1: VUC): VUC {.importc: "__builtin_crypto_vncipher_be", header: "<altivec.h>".}

proc Crypto_vncipherlast*(p0: VULL, p1: VULL): VULL {.importc: "__builtin_crypto_vncipherlast", header: "<altivec.h>".}

proc Crypto_vncipherlast_be*(p0: VUC, p1: VUC): VUC {.importc: "__builtin_crypto_vncipherlast_be", header: "<altivec.h>".}

proc Crypto_vsbox*(p0: VULL): VULL {.importc: "__builtin_crypto_vsbox", header: "<altivec.h>".}

proc Crypto_vsbox_be*(p0: VUC): VUC {.importc: "__builtin_crypto_vsbox_be", header: "<altivec.h>".}

## p1 constraint: <1>, p2 constraint: <4>
proc Crypto_vshasigmad*(p0: VULL, p1: int32, p2: int32): VULL {.importc: "__builtin_crypto_vshasigmad", header: "<altivec.h>".}

## p1 constraint: <1>, p2 constraint: <4>
proc Crypto_vshasigmaw*(p0: VUI, p1: int32, p2: int32): VUI {.importc: "__builtin_crypto_vshasigmaw", header: "<altivec.h>".}

# ========== [htm] (requires: -mhtm) ==========

proc Get_texasr*(): uint64 {.importc: "__builtin_get_texasr", header: "<altivec.h>".}

proc Get_texasru*(): uint64 {.importc: "__builtin_get_texasru", header: "<altivec.h>".}

proc Get_tfhar*(): uint64 {.importc: "__builtin_get_tfhar", header: "<altivec.h>".}

proc Get_tfiar*(): uint64 {.importc: "__builtin_get_tfiar", header: "<altivec.h>".}

proc Set_texasr*(p0: uint64) {.importc: "__builtin_set_texasr", header: "<altivec.h>".}

proc Set_texasru*(p0: uint64) {.importc: "__builtin_set_texasru", header: "<altivec.h>".}

proc Set_tfhar*(p0: uint64) {.importc: "__builtin_set_tfhar", header: "<altivec.h>".}

proc Set_tfiar*(p0: uint64) {.importc: "__builtin_set_tfiar", header: "<altivec.h>".}

proc Tabort*(p0: uint32): uint32 {.importc: "__builtin_tabort", header: "<altivec.h>".}

proc Tabortwc*(p0: uint32, p1: uint32, p2: uint32): uint32 {.importc: "__builtin_tabortwc", header: "<altivec.h>".}

proc Tabortwci*(p0: uint32, p1: uint32, p2: uint32): uint32 {.importc: "__builtin_tabortwci", header: "<altivec.h>".}

proc Tbegin*(p0: uint32): uint32 {.importc: "__builtin_tbegin", header: "<altivec.h>".}

proc Tcheck*(): uint32 {.importc: "__builtin_tcheck", header: "<altivec.h>".}

proc Tend*(p0: uint32): uint32 {.importc: "__builtin_tend", header: "<altivec.h>".}

proc Tendall*(): uint32 {.importc: "__builtin_tendall", header: "<altivec.h>".}

proc Trechkpt*(): uint32 {.importc: "__builtin_trechkpt", header: "<altivec.h>".}

proc Treclaim*(p0: uint32): uint32 {.importc: "__builtin_treclaim", header: "<altivec.h>".}

proc Tresume*(): uint32 {.importc: "__builtin_tresume", header: "<altivec.h>".}

proc Tsr*(p0: uint32): uint32 {.importc: "__builtin_tsr", header: "<altivec.h>".}

proc Tsuspend*(): uint32 {.importc: "__builtin_tsuspend", header: "<altivec.h>".}

proc Ttest*(): uint32 {.importc: "__builtin_ttest", header: "<altivec.h>".}

# ========== [power10] (requires: -mcpu=power10) ==========

proc Altivec_cmpge_1ti*(p0: VSQ, p1: VSQ): VBQ {.importc: "__builtin_altivec_cmpge_1ti", header: "<altivec.h>".}

proc Altivec_cmpge_u1ti*(p0: VUQ, p1: VUQ): VBQ {.importc: "__builtin_altivec_cmpge_u1ti", header: "<altivec.h>".}

## p1 constraint: <1>
proc Altivec_cntmbb*(p0: VUC, p1: int32): uint64 {.importc: "__builtin_altivec_cntmbb", header: "<altivec.h>".}

## p1 constraint: <1>
proc Altivec_cntmbd*(p0: VULL, p1: int32): uint64 {.importc: "__builtin_altivec_cntmbd", header: "<altivec.h>".}

## p1 constraint: <1>
proc Altivec_cntmbh*(p0: VUS, p1: int32): uint64 {.importc: "__builtin_altivec_cntmbh", header: "<altivec.h>".}

## p1 constraint: <1>
proc Altivec_cntmbw*(p0: VUI, p1: int32): uint64 {.importc: "__builtin_altivec_cntmbw", header: "<altivec.h>".}

proc Altivec_div_v1ti*(p0: VSQ, p1: VSQ): VSQ {.importc: "__builtin_altivec_div_v1ti", header: "<altivec.h>".}

proc Altivec_dives*(p0: VSQ, p1: VSQ): VSQ {.importc: "__builtin_altivec_dives", header: "<altivec.h>".}

proc Altivec_diveu*(p0: VUQ, p1: VUQ): VUQ {.importc: "__builtin_altivec_diveu", header: "<altivec.h>".}

proc Altivec_mods*(p0: VSQ, p1: VSQ): VSQ {.importc: "__builtin_altivec_mods", header: "<altivec.h>".}

proc Altivec_modu*(p0: VUQ, p1: VUQ): VUQ {.importc: "__builtin_altivec_modu", header: "<altivec.h>".}

proc Altivec_mtvsrbm*(p0: uint64): VUC {.importc: "__builtin_altivec_mtvsrbm", header: "<altivec.h>".}

proc Altivec_mtvsrdm*(p0: uint64): VULL {.importc: "__builtin_altivec_mtvsrdm", header: "<altivec.h>".}

proc Altivec_mtvsrhm*(p0: uint64): VUS {.importc: "__builtin_altivec_mtvsrhm", header: "<altivec.h>".}

proc Altivec_mtvsrqm*(p0: uint64): VUQ {.importc: "__builtin_altivec_mtvsrqm", header: "<altivec.h>".}

proc Altivec_mtvsrwm*(p0: uint64): VUI {.importc: "__builtin_altivec_mtvsrwm", header: "<altivec.h>".}

proc Altivec_tr_stxvrbx*(p0: VSQ, p1: int64, p2: ptr int8) {.importc: "__builtin_altivec_tr_stxvrbx", header: "<altivec.h>".}

proc Altivec_tr_stxvrhx*(p0: VSQ, p1: int64, p2: ptr int16) {.importc: "__builtin_altivec_tr_stxvrhx", header: "<altivec.h>".}

proc Altivec_tr_stxvrwx*(p0: VSQ, p1: int64, p2: ptr int32) {.importc: "__builtin_altivec_tr_stxvrwx", header: "<altivec.h>".}

proc Altivec_tr_stxvrdx*(p0: VSQ, p1: int64, p2: ptr int64) {.importc: "__builtin_altivec_tr_stxvrdx", header: "<altivec.h>".}

proc Altivec_udiv_v1ti*(p0: VUQ, p1: VUQ): VUQ {.importc: "__builtin_altivec_udiv_v1ti", header: "<altivec.h>".}

proc Altivec_vcfuged*(p0: VULL, p1: VULL): VULL {.importc: "__builtin_altivec_vcfuged", header: "<altivec.h>".}

proc Altivec_vclrlb*(p0: VSC, p1: int32): VSC {.importc: "__builtin_altivec_vclrlb", header: "<altivec.h>".}

proc Altivec_vclrrb*(p0: VSC, p1: int32): VSC {.importc: "__builtin_altivec_vclrrb", header: "<altivec.h>".}

proc Altivec_vcmpaet_p*(p0: VSQ, p1: VSQ): int32 {.importc: "__builtin_altivec_vcmpaet_p", header: "<altivec.h>".}

proc Altivec_vcmpequt*(p0: VSQ, p1: VSQ): VBQ {.importc: "__builtin_altivec_vcmpequt", header: "<altivec.h>".}

proc Altivec_vcmpequt_p*(p0: int32, p1: VSQ, p2: VSQ): int32 {.importc: "__builtin_altivec_vcmpequt_p", header: "<altivec.h>".}

proc Altivec_vcmpgtst*(p0: VSQ, p1: VSQ): VBQ {.importc: "__builtin_altivec_vcmpgtst", header: "<altivec.h>".}

proc Altivec_vcmpgtst_p*(p0: int32, p1: VSQ, p2: VSQ): int32 {.importc: "__builtin_altivec_vcmpgtst_p", header: "<altivec.h>".}

proc Altivec_vcmpgtut*(p0: VUQ, p1: VUQ): VBQ {.importc: "__builtin_altivec_vcmpgtut", header: "<altivec.h>".}

proc Altivec_vcmpgtut_p*(p0: int32, p1: VUQ, p2: VUQ): int32 {.importc: "__builtin_altivec_vcmpgtut_p", header: "<altivec.h>".}

proc Altivec_vcmpnet*(p0: VSQ, p1: VSQ): VBQ {.importc: "__builtin_altivec_vcmpnet", header: "<altivec.h>".}

proc Altivec_vcmpnet_p*(p0: VSQ, p1: VSQ): int32 {.importc: "__builtin_altivec_vcmpnet_p", header: "<altivec.h>".}

proc Altivec_vclzdm*(p0: VULL, p1: VULL): VULL {.importc: "__builtin_altivec_vclzdm", header: "<altivec.h>".}

proc Altivec_vctzdm*(p0: VULL, p1: VULL): VULL {.importc: "__builtin_altivec_vctzdm", header: "<altivec.h>".}

proc Altivec_vdivesd*(p0: VSLL, p1: VSLL): VSLL {.importc: "__builtin_altivec_vdivesd", header: "<altivec.h>".}

proc Altivec_vdivesw*(p0: VSI, p1: VSI): VSI {.importc: "__builtin_altivec_vdivesw", header: "<altivec.h>".}

proc Altivec_vdiveud*(p0: VULL, p1: VULL): VULL {.importc: "__builtin_altivec_vdiveud", header: "<altivec.h>".}

proc Altivec_vdiveuw*(p0: VUI, p1: VUI): VUI {.importc: "__builtin_altivec_vdiveuw", header: "<altivec.h>".}

proc Altivec_vdivsd*(p0: VSLL, p1: VSLL): VSLL {.importc: "__builtin_altivec_vdivsd", header: "<altivec.h>".}

proc Altivec_vdivsw*(p0: VSI, p1: VSI): VSI {.importc: "__builtin_altivec_vdivsw", header: "<altivec.h>".}

proc Altivec_vdivud*(p0: VULL, p1: VULL): VULL {.importc: "__builtin_altivec_vdivud", header: "<altivec.h>".}

proc Altivec_vdivuw*(p0: VUI, p1: VUI): VUI {.importc: "__builtin_altivec_vdivuw", header: "<altivec.h>".}

proc Altivec_vexpandmb*(p0: VUC): VUC {.importc: "__builtin_altivec_vexpandmb", header: "<altivec.h>".}

proc Altivec_vexpandmd*(p0: VULL): VULL {.importc: "__builtin_altivec_vexpandmd", header: "<altivec.h>".}

proc Altivec_vexpandmh*(p0: VUS): VUS {.importc: "__builtin_altivec_vexpandmh", header: "<altivec.h>".}

proc Altivec_vexpandmq*(p0: VUQ): VUQ {.importc: "__builtin_altivec_vexpandmq", header: "<altivec.h>".}

proc Altivec_vexpandmw*(p0: VUI): VUI {.importc: "__builtin_altivec_vexpandmw", header: "<altivec.h>".}

proc Altivec_vextddvhx*(p0: VULL, p1: VULL, p2: uint32): VULL {.importc: "__builtin_altivec_vextddvhx", header: "<altivec.h>".}

proc Altivec_vextddvlx*(p0: VULL, p1: VULL, p2: uint32): VULL {.importc: "__builtin_altivec_vextddvlx", header: "<altivec.h>".}

proc Altivec_vextdubvhx*(p0: VUC, p1: VUC, p2: uint32): VULL {.importc: "__builtin_altivec_vextdubvhx", header: "<altivec.h>".}

proc Altivec_vextdubvlx*(p0: VUC, p1: VUC, p2: uint32): VULL {.importc: "__builtin_altivec_vextdubvlx", header: "<altivec.h>".}

proc Altivec_vextduhvhx*(p0: VUS, p1: VUS, p2: uint32): VULL {.importc: "__builtin_altivec_vextduhvhx", header: "<altivec.h>".}

proc Altivec_vextduhvlx*(p0: VUS, p1: VUS, p2: uint32): VULL {.importc: "__builtin_altivec_vextduhvlx", header: "<altivec.h>".}

proc Altivec_vextduwvhx*(p0: VUI, p1: VUI, p2: uint32): VULL {.importc: "__builtin_altivec_vextduwvhx", header: "<altivec.h>".}

proc Altivec_vextduwvlx*(p0: VUI, p1: VUI, p2: uint32): VULL {.importc: "__builtin_altivec_vextduwvlx", header: "<altivec.h>".}

proc Altivec_vextractmb*(p0: VSC): int32 {.importc: "__builtin_altivec_vextractmb", header: "<altivec.h>".}

proc Altivec_vextractmd*(p0: VSLL): int32 {.importc: "__builtin_altivec_vextractmd", header: "<altivec.h>".}

proc Altivec_vextractmh*(p0: VSS): int32 {.importc: "__builtin_altivec_vextractmh", header: "<altivec.h>".}

proc Altivec_vextractmq*(p0: VSQ): int32 {.importc: "__builtin_altivec_vextractmq", header: "<altivec.h>".}

proc Altivec_vextractmw*(p0: VSI): int32 {.importc: "__builtin_altivec_vextractmw", header: "<altivec.h>".}

## p1 constraint: <2
proc Altivec_vgnb*(p0: VULL, p1: int32): uint64 {.importc: "__builtin_altivec_vgnb", header: "<altivec.h>".}

proc Altivec_vinsgubvlx*(p0: uint32, p1: VUC, p2: uint32): VUC {.importc: "__builtin_altivec_vinsgubvlx", header: "<altivec.h>".}

proc Altivec_vinsgubvrx*(p0: int32, p1: VSC, p2: int32): VSC {.importc: "__builtin_altivec_vinsgubvrx", header: "<altivec.h>".}

proc Altivec_vinsgudvlx*(p0: uint32, p1: VULL, p2: uint32): VULL {.importc: "__builtin_altivec_vinsgudvlx", header: "<altivec.h>".}

proc Altivec_vinsgudvrx*(p0: int32, p1: VSLL, p2: int32): VSLL {.importc: "__builtin_altivec_vinsgudvrx", header: "<altivec.h>".}

proc Altivec_vinsguhvlx*(p0: uint32, p1: VUS, p2: uint32): VUS {.importc: "__builtin_altivec_vinsguhvlx", header: "<altivec.h>".}

proc Altivec_vinsguhvrx*(p0: int32, p1: VSS, p2: int32): VSS {.importc: "__builtin_altivec_vinsguhvrx", header: "<altivec.h>".}

proc Altivec_vinsguwvlx*(p0: uint32, p1: VUI, p2: uint32): VUI {.importc: "__builtin_altivec_vinsguwvlx", header: "<altivec.h>".}

proc Altivec_vinsguwvrx*(p0: int32, p1: VSI, p2: int32): VSI {.importc: "__builtin_altivec_vinsguwvrx", header: "<altivec.h>".}

proc Altivec_vinsvubvlx*(p0: VUC, p1: VUC, p2: uint32): VUC {.importc: "__builtin_altivec_vinsvubvlx", header: "<altivec.h>".}

proc Altivec_vinsvubvrx*(p0: VSC, p1: VSC, p2: int32): VSC {.importc: "__builtin_altivec_vinsvubvrx", header: "<altivec.h>".}

proc Altivec_vinsvuhvlx*(p0: VUS, p1: VUS, p2: uint32): VUS {.importc: "__builtin_altivec_vinsvuhvlx", header: "<altivec.h>".}

proc Altivec_vinsvuhvrx*(p0: VSS, p1: VSS, p2: int32): VSS {.importc: "__builtin_altivec_vinsvuhvrx", header: "<altivec.h>".}

proc Altivec_vinsvuwvlx*(p0: VUI, p1: VUI, p2: uint32): VUI {.importc: "__builtin_altivec_vinsvuwvlx", header: "<altivec.h>".}

proc Altivec_vinsvuwvrx*(p0: VSI, p1: VSI, p2: int32): VSI {.importc: "__builtin_altivec_vinsvuwvrx", header: "<altivec.h>".}

proc Altivec_vmodsd*(p0: VSLL, p1: VSLL): VSLL {.importc: "__builtin_altivec_vmodsd", header: "<altivec.h>".}

proc Altivec_vmodsw*(p0: VSI, p1: VSI): VSI {.importc: "__builtin_altivec_vmodsw", header: "<altivec.h>".}

proc Altivec_vmodud*(p0: VULL, p1: VULL): VULL {.importc: "__builtin_altivec_vmodud", header: "<altivec.h>".}

proc Altivec_vmoduw*(p0: VUI, p1: VUI): VUI {.importc: "__builtin_altivec_vmoduw", header: "<altivec.h>".}

proc Altivec_vmulesd*(p0: VSLL, p1: VSLL): VSQ {.importc: "__builtin_altivec_vmulesd", header: "<altivec.h>".}

proc Altivec_vmuleud*(p0: VULL, p1: VULL): VUQ {.importc: "__builtin_altivec_vmuleud", header: "<altivec.h>".}

proc Altivec_vmulhsd*(p0: VSLL, p1: VSLL): VSLL {.importc: "__builtin_altivec_vmulhsd", header: "<altivec.h>".}

proc Altivec_vmulhsw*(p0: VSI, p1: VSI): VSI {.importc: "__builtin_altivec_vmulhsw", header: "<altivec.h>".}

proc Altivec_vmulhud*(p0: VULL, p1: VULL): VULL {.importc: "__builtin_altivec_vmulhud", header: "<altivec.h>".}

proc Altivec_vmulhuw*(p0: VUI, p1: VUI): VUI {.importc: "__builtin_altivec_vmulhuw", header: "<altivec.h>".}

proc Altivec_vmulld*(p0: VSLL, p1: VSLL): VSLL {.importc: "__builtin_altivec_vmulld", header: "<altivec.h>".}

proc Altivec_vmulosd*(p0: VSLL, p1: VSLL): VSQ {.importc: "__builtin_altivec_vmulosd", header: "<altivec.h>".}

proc Altivec_vmuloud*(p0: VULL, p1: VULL): VUQ {.importc: "__builtin_altivec_vmuloud", header: "<altivec.h>".}

proc Altivec_vnor_v1ti*(p0: VSQ, p1: VSQ): VSQ {.importc: "__builtin_altivec_vnor_v1ti", header: "<altivec.h>".}

proc Altivec_vnor_v1ti_uns*(p0: VUQ, p1: VUQ): VUQ {.importc: "__builtin_altivec_vnor_v1ti_uns", header: "<altivec.h>".}

proc Altivec_vpdepd*(p0: VULL, p1: VULL): VULL {.importc: "__builtin_altivec_vpdepd", header: "<altivec.h>".}

proc Altivec_vpextd*(p0: VULL, p1: VULL): VULL {.importc: "__builtin_altivec_vpextd", header: "<altivec.h>".}

## p2 constraint: <4>
proc Altivec_vreplace_un_df*(p0: VUC, p1: float64, p2: int32): VUC {.importc: "__builtin_altivec_vreplace_un_df", header: "<altivec.h>".}

## p2 constraint: <4>
proc Altivec_vreplace_un_sf*(p0: VUC, p1: float32, p2: int32): VUC {.importc: "__builtin_altivec_vreplace_un_sf", header: "<altivec.h>".}

## p2 constraint: <4>
proc Altivec_vreplace_un_si*(p0: VUC, p1: int32, p2: int32): VUC {.importc: "__builtin_altivec_vreplace_un_si", header: "<altivec.h>".}

## p2 constraint: <2>
proc Altivec_vreplace_uv4si*(p0: VUI, p1: uint32, p2: int32): VUI {.importc: "__builtin_altivec_vreplace_uv4si", header: "<altivec.h>".}

## p2 constraint: <1>
proc Altivec_vreplace_v2df*(p0: VD, p1: float64, p2: int32): VD {.importc: "__builtin_altivec_vreplace_v2df", header: "<altivec.h>".}

## p2 constraint: <2>
proc Altivec_vreplace_v4sf*(p0: VF, p1: float32, p2: int32): VF {.importc: "__builtin_altivec_vreplace_v4sf", header: "<altivec.h>".}

## p2 constraint: <2>
proc Altivec_vreplace_v4si*(p0: VSI, p1: int32, p2: int32): VSI {.importc: "__builtin_altivec_vreplace_v4si", header: "<altivec.h>".}

proc Altivec_vrlq*(p0: VSQ, p1: VUQ): VSQ {.importc: "__builtin_altivec_vrlq", header: "<altivec.h>".}

proc Altivec_vrlqmi*(p0: VSQ, p1: VSQ, p2: VUQ): VSQ {.importc: "__builtin_altivec_vrlqmi", header: "<altivec.h>".}

proc Altivec_vrlqnm*(p0: VSQ, p1: VUQ): VSQ {.importc: "__builtin_altivec_vrlqnm", header: "<altivec.h>".}

proc Altivec_vsignext*(p0: VSLL): VSQ {.importc: "__builtin_altivec_vsignext", header: "<altivec.h>".}

## p2 constraint: <3>
proc Altivec_vsldb_v16qi*(p0: VSC, p1: VSC, p2: int32): VSC {.importc: "__builtin_altivec_vsldb_v16qi", header: "<altivec.h>".}

## p2 constraint: <3>
proc Altivec_vsldb_v2di*(p0: VSLL, p1: VSLL, p2: int32): VSLL {.importc: "__builtin_altivec_vsldb_v2di", header: "<altivec.h>".}

## p2 constraint: <3>
proc Altivec_vsldb_v4si*(p0: VSI, p1: VSI, p2: int32): VSI {.importc: "__builtin_altivec_vsldb_v4si", header: "<altivec.h>".}

## p2 constraint: <3>
proc Altivec_vsldb_v8hi*(p0: VSS, p1: VSS, p2: int32): VSS {.importc: "__builtin_altivec_vsldb_v8hi", header: "<altivec.h>".}

## p2 constraint: <3>
proc Altivec_vsldb_v1ti*(p0: VSQ, p1: VSQ, p2: int32): VSQ {.importc: "__builtin_altivec_vsldb_v1ti", header: "<altivec.h>".}

proc Altivec_vslq*(p0: VSQ, p1: VUQ): VSQ {.importc: "__builtin_altivec_vslq", header: "<altivec.h>".}

proc Altivec_vsraq*(p0: VSQ, p1: VUQ): VSQ {.importc: "__builtin_altivec_vsraq", header: "<altivec.h>".}

## p2 constraint: <3>
proc Altivec_vsrdb_v16qi*(p0: VSC, p1: VSC, p2: int32): VSC {.importc: "__builtin_altivec_vsrdb_v16qi", header: "<altivec.h>".}

## p2 constraint: <3>
proc Altivec_vsrdb_v2di*(p0: VSLL, p1: VSLL, p2: int32): VSLL {.importc: "__builtin_altivec_vsrdb_v2di", header: "<altivec.h>".}

## p2 constraint: <3>
proc Altivec_vsrdb_v4si*(p0: VSI, p1: VSI, p2: int32): VSI {.importc: "__builtin_altivec_vsrdb_v4si", header: "<altivec.h>".}

## p2 constraint: <3>
proc Altivec_vsrdb_v8hi*(p0: VSS, p1: VSS, p2: int32): VSS {.importc: "__builtin_altivec_vsrdb_v8hi", header: "<altivec.h>".}

## p2 constraint: <3>
proc Altivec_vsrdb_v1ti*(p0: VSQ, p1: VSQ, p2: int32): VSQ {.importc: "__builtin_altivec_vsrdb_v1ti", header: "<altivec.h>".}

proc Altivec_vsrq*(p0: VSQ, p1: VUQ): VSQ {.importc: "__builtin_altivec_vsrq", header: "<altivec.h>".}

proc Altivec_vstribl*(p0: VSC): VSC {.importc: "__builtin_altivec_vstribl", header: "<altivec.h>".}

proc Altivec_vstribl_p*(p0: VSC): int32 {.importc: "__builtin_altivec_vstribl_p", header: "<altivec.h>".}

proc Altivec_vstribr*(p0: VSC): VSC {.importc: "__builtin_altivec_vstribr", header: "<altivec.h>".}

proc Altivec_vstribr_p*(p0: VSC): int32 {.importc: "__builtin_altivec_vstribr_p", header: "<altivec.h>".}

proc Altivec_vstrihl*(p0: VSS): VSS {.importc: "__builtin_altivec_vstrihl", header: "<altivec.h>".}

proc Altivec_vstrihl_p*(p0: VSS): int32 {.importc: "__builtin_altivec_vstrihl_p", header: "<altivec.h>".}

proc Altivec_vstrihr*(p0: VSS): VSS {.importc: "__builtin_altivec_vstrihr", header: "<altivec.h>".}

proc Altivec_vstrihr_p*(p0: VSS): int32 {.importc: "__builtin_altivec_vstrihr_p", header: "<altivec.h>".}

proc Vsx_vmsumcud*(p0: VULL, p1: VULL, p2: VUQ): VUQ {.importc: "__builtin_vsx_vmsumcud", header: "<altivec.h>".}

proc Vsx_xvtlsbb_all_ones*(p0: VSC): int32 {.importc: "__builtin_vsx_xvtlsbb_all_ones", header: "<altivec.h>".}

proc Vsx_xvtlsbb_all_zeros*(p0: VSC): int32 {.importc: "__builtin_vsx_xvtlsbb_all_zeros", header: "<altivec.h>".}

## p1 constraint: <1>
proc Vsx_vxxsplti32dx_v4sf*(p0: VF, p1: int32, p2: float32): VF {.importc: "__builtin_vsx_vxxsplti32dx_v4sf", header: "<altivec.h>".}

## p1 constraint: <1>
proc Vsx_vxxsplti32dx_v4si*(p0: VSI, p1: int32, p2: int32): VSI {.importc: "__builtin_vsx_vxxsplti32dx_v4si", header: "<altivec.h>".}

proc Vsx_vxxspltidp*(p0: float32): VD {.importc: "__builtin_vsx_vxxspltidp", header: "<altivec.h>".}

proc Vsx_vxxspltiw_v4sf*(p0: float32): VF {.importc: "__builtin_vsx_vxxspltiw_v4sf", header: "<altivec.h>".}

proc Vsx_vxxspltiw_v4si*(p0: int32): VSI {.importc: "__builtin_vsx_vxxspltiw_v4si", header: "<altivec.h>".}

proc Vsx_xvcvbf16spn*(p0: VUC): VUC {.importc: "__builtin_vsx_xvcvbf16spn", header: "<altivec.h>".}

proc Vsx_xvcvspbf16*(p0: VUC): VUC {.importc: "__builtin_vsx_xvcvspbf16", header: "<altivec.h>".}

proc Vsx_xxblend_v16qi*(p0: VUC, p1: VUC, p2: VUC): VUC {.importc: "__builtin_vsx_xxblend_v16qi", header: "<altivec.h>".}

proc Vsx_xxblend_v2df*(p0: VD, p1: VD, p2: VD): VD {.importc: "__builtin_vsx_xxblend_v2df", header: "<altivec.h>".}

proc Vsx_xxblend_v2di*(p0: VULL, p1: VULL, p2: VULL): VULL {.importc: "__builtin_vsx_xxblend_v2di", header: "<altivec.h>".}

proc Vsx_xxblend_v4sf*(p0: VF, p1: VF, p2: VF): VF {.importc: "__builtin_vsx_xxblend_v4sf", header: "<altivec.h>".}

proc Vsx_xxblend_v4si*(p0: VUI, p1: VUI, p2: VUI): VUI {.importc: "__builtin_vsx_xxblend_v4si", header: "<altivec.h>".}

proc Vsx_xxblend_v8hi*(p0: VUS, p1: VUS, p2: VUS): VUS {.importc: "__builtin_vsx_xxblend_v8hi", header: "<altivec.h>".}

## p3 constraint: <8>
proc Vsx_xxeval*(p0: VULL, p1: VULL, p2: VULL, p3: int32): VULL {.importc: "__builtin_vsx_xxeval", header: "<altivec.h>".}

## p1 constraint: <2>
proc Vsx_xxgenpcvm_v16qi*(p0: VUC, p1: int32): VUC {.importc: "__builtin_vsx_xxgenpcvm_v16qi", header: "<altivec.h>".}

## p1 constraint: <2>
proc Vsx_xxgenpcvm_v2di*(p0: VULL, p1: int32): VULL {.importc: "__builtin_vsx_xxgenpcvm_v2di", header: "<altivec.h>".}

## p1 constraint: <2>
proc Vsx_xxgenpcvm_v4si*(p0: VUI, p1: int32): VUI {.importc: "__builtin_vsx_xxgenpcvm_v4si", header: "<altivec.h>".}

## p1 constraint: <2>
proc Vsx_xxgenpcvm_v8hi*(p0: VUS, p1: int32): VUS {.importc: "__builtin_vsx_xxgenpcvm_v8hi", header: "<altivec.h>".}

## p3 constraint: <3>
proc Vsx_xxpermx_uv16qi*(p0: VUC, p1: VUC, p2: VUC, p3: int32): VUC {.importc: "__builtin_vsx_xxpermx_uv16qi", header: "<altivec.h>".}

## p3 constraint: <3>
proc Vsx_xxpermx_uv2di*(p0: VULL, p1: VULL, p2: VUC, p3: int32): VULL {.importc: "__builtin_vsx_xxpermx_uv2di", header: "<altivec.h>".}

## p3 constraint: <3>
proc Vsx_xxpermx_uv4si*(p0: VUI, p1: VUI, p2: VUC, p3: int32): VUI {.importc: "__builtin_vsx_xxpermx_uv4si", header: "<altivec.h>".}

## p3 constraint: <3>
proc Vsx_xxpermx_uv8hi*(p0: VUS, p1: VUS, p2: VUC, p3: int32): VUS {.importc: "__builtin_vsx_xxpermx_uv8hi", header: "<altivec.h>".}

## p3 constraint: <3>
proc Vsx_xxpermx_v16qi*(p0: VSC, p1: VSC, p2: VUC, p3: int32): VSC {.importc: "__builtin_vsx_xxpermx_v16qi", header: "<altivec.h>".}

## p3 constraint: <3>
proc Vsx_xxpermx_v2df*(p0: VD, p1: VD, p2: VUC, p3: int32): VD {.importc: "__builtin_vsx_xxpermx_v2df", header: "<altivec.h>".}

## p3 constraint: <3>
proc Vsx_xxpermx_v2di*(p0: VSLL, p1: VSLL, p2: VUC, p3: int32): VSLL {.importc: "__builtin_vsx_xxpermx_v2di", header: "<altivec.h>".}

## p3 constraint: <3>
proc Vsx_xxpermx_v4sf*(p0: VF, p1: VF, p2: VUC, p3: int32): VF {.importc: "__builtin_vsx_xxpermx_v4sf", header: "<altivec.h>".}

## p3 constraint: <3>
proc Vsx_xxpermx_v4si*(p0: VSI, p1: VSI, p2: VUC, p3: int32): VSI {.importc: "__builtin_vsx_xxpermx_v4si", header: "<altivec.h>".}

## p3 constraint: <3>
proc Vsx_xxpermx_v8hi*(p0: VSS, p1: VSS, p2: VUC, p3: int32): VSS {.importc: "__builtin_vsx_xxpermx_v8hi", header: "<altivec.h>".}

# ========== [power10-64] (requires: -mcpu=power10) ==========


# ========== [mma] (requires: -mmma) ==========

proc Mma_assemble_acc*(p0: var VectorQuad, p1: VUC, p2: VUC, p3: VUC, p4: VUC) {.importc: "__builtin_mma_assemble_acc", header: "<altivec.h>".}

proc Mma_assemble_acc_internal*(p0: VUC, p1: VUC, p2: VUC, p3: VUC): VectorQuad {.importc: "__builtin_mma_assemble_acc_internal", header: "<altivec.h>".}

proc Mma_assemble_pair*(p0: var VectorPair, p1: VUC, p2: VUC) {.importc: "__builtin_mma_assemble_pair", header: "<altivec.h>".}

proc Mma_assemble_pair_internal*(p0: VUC, p1: VUC): VectorPair {.importc: "__builtin_mma_assemble_pair_internal", header: "<altivec.h>".}

proc Mma_build_acc*(p0: var VectorQuad, p1: VUC, p2: VUC, p3: VUC, p4: VUC) {.importc: "__builtin_mma_build_acc", header: "<altivec.h>".}

proc Mma_build_acc_internal*(p0: VUC, p1: VUC, p2: VUC, p3: VUC): VectorQuad {.importc: "__builtin_mma_build_acc_internal", header: "<altivec.h>".}

proc Mma_disassemble_acc*(p0: pointer, p1: var VectorQuad) {.importc: "__builtin_mma_disassemble_acc", header: "<altivec.h>".}

## p1 constraint: <2>
proc Mma_disassemble_acc_internal*(p0: VectorQuad, p1: int32): VUC {.importc: "__builtin_mma_disassemble_acc_internal", header: "<altivec.h>".}

proc Mma_disassemble_pair*(p0: pointer, p1: var VectorPair) {.importc: "__builtin_mma_disassemble_pair", header: "<altivec.h>".}

## p1 constraint: <2>
proc Mma_disassemble_pair_internal*(p0: VectorPair, p1: int32): VUC {.importc: "__builtin_mma_disassemble_pair_internal", header: "<altivec.h>".}

## p3 constraint: <4>, p4 constraint: <4>
proc Mma_pmxvf32ger*(p0: var VectorQuad, p1: VUC, p2: VUC, p3: int32, p4: int32) {.importc: "__builtin_mma_pmxvf32ger", header: "<altivec.h>".}

proc Mma_xvbf16ger2*(p0: var VectorQuad, p1: VUC, p2: VUC) {.importc: "__builtin_mma_xvbf16ger2", header: "<altivec.h>".}

proc Mma_xvbf16ger2_internal*(p0: VUC, p1: VUC): VectorQuad {.importc: "__builtin_mma_xvbf16ger2_internal", header: "<altivec.h>".}

proc Mma_xvbf16ger2nn*(p0: var VectorQuad, p1: VUC, p2: VUC) {.importc: "__builtin_mma_xvbf16ger2nn", header: "<altivec.h>".}

proc Mma_xvbf16ger2nn_internal*(p0: VectorQuad, p1: VUC, p2: VUC): VectorQuad {.importc: "__builtin_mma_xvbf16ger2nn_internal", header: "<altivec.h>".}

proc Mma_xvbf16ger2np*(p0: var VectorQuad, p1: VUC, p2: VUC) {.importc: "__builtin_mma_xvbf16ger2np", header: "<altivec.h>".}

proc Mma_xvbf16ger2np_internal*(p0: VectorQuad, p1: VUC, p2: VUC): VectorQuad {.importc: "__builtin_mma_xvbf16ger2np_internal", header: "<altivec.h>".}

proc Mma_xvbf16ger2pn*(p0: var VectorQuad, p1: VUC, p2: VUC) {.importc: "__builtin_mma_xvbf16ger2pn", header: "<altivec.h>".}

proc Mma_xvbf16ger2pn_internal*(p0: VectorQuad, p1: VUC, p2: VUC): VectorQuad {.importc: "__builtin_mma_xvbf16ger2pn_internal", header: "<altivec.h>".}

proc Mma_xvbf16ger2pp*(p0: var VectorQuad, p1: VUC, p2: VUC) {.importc: "__builtin_mma_xvbf16ger2pp", header: "<altivec.h>".}

proc Mma_xvbf16ger2pp_internal*(p0: VectorQuad, p1: VUC, p2: VUC): VectorQuad {.importc: "__builtin_mma_xvbf16ger2pp_internal", header: "<altivec.h>".}

proc Mma_xvf16ger2*(p0: var VectorQuad, p1: VUC, p2: VUC) {.importc: "__builtin_mma_xvf16ger2", header: "<altivec.h>".}

proc Mma_xvf16ger2_internal*(p0: VUC, p1: VUC): VectorQuad {.importc: "__builtin_mma_xvf16ger2_internal", header: "<altivec.h>".}

proc Mma_xvf16ger2nn*(p0: var VectorQuad, p1: VUC, p2: VUC) {.importc: "__builtin_mma_xvf16ger2nn", header: "<altivec.h>".}

proc Mma_xvf16ger2nn_internal*(p0: VectorQuad, p1: VUC, p2: VUC): VectorQuad {.importc: "__builtin_mma_xvf16ger2nn_internal", header: "<altivec.h>".}

proc Mma_xvf16ger2np*(p0: var VectorQuad, p1: VUC, p2: VUC) {.importc: "__builtin_mma_xvf16ger2np", header: "<altivec.h>".}

proc Mma_xvf16ger2np_internal*(p0: VectorQuad, p1: VUC, p2: VUC): VectorQuad {.importc: "__builtin_mma_xvf16ger2np_internal", header: "<altivec.h>".}

proc Mma_xvf16ger2pn*(p0: var VectorQuad, p1: VUC, p2: VUC) {.importc: "__builtin_mma_xvf16ger2pn", header: "<altivec.h>".}

proc Mma_xvf16ger2pn_internal*(p0: VectorQuad, p1: VUC, p2: VUC): VectorQuad {.importc: "__builtin_mma_xvf16ger2pn_internal", header: "<altivec.h>".}

proc Mma_xvf16ger2pp*(p0: var VectorQuad, p1: VUC, p2: VUC) {.importc: "__builtin_mma_xvf16ger2pp", header: "<altivec.h>".}

proc Mma_xvf16ger2pp_internal*(p0: VectorQuad, p1: VUC, p2: VUC): VectorQuad {.importc: "__builtin_mma_xvf16ger2pp_internal", header: "<altivec.h>".}

proc Mma_xvf32ger*(p0: var VectorQuad, p1: VUC, p2: VUC) {.importc: "__builtin_mma_xvf32ger", header: "<altivec.h>".}

proc Mma_xvf32ger_internal*(p0: VUC, p1: VUC): VectorQuad {.importc: "__builtin_mma_xvf32ger_internal", header: "<altivec.h>".}

proc Mma_xvf32gernn*(p0: var VectorQuad, p1: VUC, p2: VUC) {.importc: "__builtin_mma_xvf32gernn", header: "<altivec.h>".}

proc Mma_xvf32gernn_internal*(p0: VectorQuad, p1: VUC, p2: VUC): VectorQuad {.importc: "__builtin_mma_xvf32gernn_internal", header: "<altivec.h>".}

proc Mma_xvf32gernp*(p0: var VectorQuad, p1: VUC, p2: VUC) {.importc: "__builtin_mma_xvf32gernp", header: "<altivec.h>".}

proc Mma_xvf32gernp_internal*(p0: VectorQuad, p1: VUC, p2: VUC): VectorQuad {.importc: "__builtin_mma_xvf32gernp_internal", header: "<altivec.h>".}

proc Mma_xvf32gerpn*(p0: var VectorQuad, p1: VUC, p2: VUC) {.importc: "__builtin_mma_xvf32gerpn", header: "<altivec.h>".}

proc Mma_xvf32gerpn_internal*(p0: VectorQuad, p1: VUC, p2: VUC): VectorQuad {.importc: "__builtin_mma_xvf32gerpn_internal", header: "<altivec.h>".}

proc Mma_xvf32gerpp*(p0: var VectorQuad, p1: VUC, p2: VUC) {.importc: "__builtin_mma_xvf32gerpp", header: "<altivec.h>".}

proc Mma_xvf32gerpp_internal*(p0: VectorQuad, p1: VUC, p2: VUC): VectorQuad {.importc: "__builtin_mma_xvf32gerpp_internal", header: "<altivec.h>".}

proc Mma_xvf64ger*(p0: var VectorQuad, p1: VectorPair, p2: VUC) {.importc: "__builtin_mma_xvf64ger", header: "<altivec.h>".}

proc Mma_xvf64ger_internal*(p0: VectorPair, p1: VUC): VectorQuad {.importc: "__builtin_mma_xvf64ger_internal", header: "<altivec.h>".}

proc Mma_xvf64gernn*(p0: var VectorQuad, p1: VectorPair, p2: VUC) {.importc: "__builtin_mma_xvf64gernn", header: "<altivec.h>".}

proc Mma_xvf64gernn_internal*(p0: VectorQuad, p1: VectorPair, p2: VUC): VectorQuad {.importc: "__builtin_mma_xvf64gernn_internal", header: "<altivec.h>".}

proc Mma_xvf64gernp*(p0: var VectorQuad, p1: VectorPair, p2: VUC) {.importc: "__builtin_mma_xvf64gernp", header: "<altivec.h>".}

proc Mma_xvf64gernp_internal*(p0: VectorQuad, p1: VectorPair, p2: VUC): VectorQuad {.importc: "__builtin_mma_xvf64gernp_internal", header: "<altivec.h>".}

proc Mma_xvf64gerpn*(p0: var VectorQuad, p1: VectorPair, p2: VUC) {.importc: "__builtin_mma_xvf64gerpn", header: "<altivec.h>".}

proc Mma_xvf64gerpn_internal*(p0: VectorQuad, p1: VectorPair, p2: VUC): VectorQuad {.importc: "__builtin_mma_xvf64gerpn_internal", header: "<altivec.h>".}

proc Mma_xvf64gerpp*(p0: var VectorQuad, p1: VectorPair, p2: VUC) {.importc: "__builtin_mma_xvf64gerpp", header: "<altivec.h>".}

proc Mma_xvf64gerpp_internal*(p0: VectorQuad, p1: VectorPair, p2: VUC): VectorQuad {.importc: "__builtin_mma_xvf64gerpp_internal", header: "<altivec.h>".}

proc Mma_xvi16ger2*(p0: var VectorQuad, p1: VUC, p2: VUC) {.importc: "__builtin_mma_xvi16ger2", header: "<altivec.h>".}

proc Mma_xvi16ger2_internal*(p0: VUC, p1: VUC): VectorQuad {.importc: "__builtin_mma_xvi16ger2_internal", header: "<altivec.h>".}

proc Mma_xvi16ger2pp*(p0: var VectorQuad, p1: VUC, p2: VUC) {.importc: "__builtin_mma_xvi16ger2pp", header: "<altivec.h>".}

proc Mma_xvi16ger2pp_internal*(p0: VectorQuad, p1: VUC, p2: VUC): VectorQuad {.importc: "__builtin_mma_xvi16ger2pp_internal", header: "<altivec.h>".}

proc Mma_xvi16ger2s*(p0: var VectorQuad, p1: VUC, p2: VUC) {.importc: "__builtin_mma_xvi16ger2s", header: "<altivec.h>".}

proc Mma_xvi16ger2s_internal*(p0: VUC, p1: VUC): VectorQuad {.importc: "__builtin_mma_xvi16ger2s_internal", header: "<altivec.h>".}

proc Mma_xvi16ger2spp*(p0: var VectorQuad, p1: VUC, p2: VUC) {.importc: "__builtin_mma_xvi16ger2spp", header: "<altivec.h>".}

proc Mma_xvi16ger2spp_internal*(p0: VectorQuad, p1: VUC, p2: VUC): VectorQuad {.importc: "__builtin_mma_xvi16ger2spp_internal", header: "<altivec.h>".}

proc Mma_xvi4ger8*(p0: var VectorQuad, p1: VUC, p2: VUC) {.importc: "__builtin_mma_xvi4ger8", header: "<altivec.h>".}

proc Mma_xvi4ger8_internal*(p0: VUC, p1: VUC): VectorQuad {.importc: "__builtin_mma_xvi4ger8_internal", header: "<altivec.h>".}

proc Mma_xvi4ger8pp*(p0: var VectorQuad, p1: VUC, p2: VUC) {.importc: "__builtin_mma_xvi4ger8pp", header: "<altivec.h>".}

proc Mma_xvi4ger8pp_internal*(p0: VectorQuad, p1: VUC, p2: VUC): VectorQuad {.importc: "__builtin_mma_xvi4ger8pp_internal", header: "<altivec.h>".}

proc Mma_xvi8ger4*(p0: var VectorQuad, p1: VUC, p2: VUC) {.importc: "__builtin_mma_xvi8ger4", header: "<altivec.h>".}

proc Mma_xvi8ger4_internal*(p0: VUC, p1: VUC): VectorQuad {.importc: "__builtin_mma_xvi8ger4_internal", header: "<altivec.h>".}

proc Mma_xvi8ger4pp*(p0: var VectorQuad, p1: VUC, p2: VUC) {.importc: "__builtin_mma_xvi8ger4pp", header: "<altivec.h>".}

proc Mma_xvi8ger4pp_internal*(p0: VectorQuad, p1: VUC, p2: VUC): VectorQuad {.importc: "__builtin_mma_xvi8ger4pp_internal", header: "<altivec.h>".}

proc Mma_xvi8ger4spp*(p0: var VectorQuad, p1: VUC, p2: VUC) {.importc: "__builtin_mma_xvi8ger4spp", header: "<altivec.h>".}

proc Mma_xvi8ger4spp_internal*(p0: VectorQuad, p1: VUC, p2: VUC): VectorQuad {.importc: "__builtin_mma_xvi8ger4spp_internal", header: "<altivec.h>".}

proc Mma_xxmfacc*(p0: var VectorQuad) {.importc: "__builtin_mma_xxmfacc", header: "<altivec.h>".}

proc Mma_xxmfacc_internal*(p0: VectorQuad): VectorQuad {.importc: "__builtin_mma_xxmfacc_internal", header: "<altivec.h>".}

proc Mma_xxmtacc*(p0: var VectorQuad) {.importc: "__builtin_mma_xxmtacc", header: "<altivec.h>".}

proc Mma_xxmtacc_internal*(p0: VectorQuad): VectorQuad {.importc: "__builtin_mma_xxmtacc_internal", header: "<altivec.h>".}

proc Mma_xxsetaccz*(p0: var VectorQuad) {.importc: "__builtin_mma_xxsetaccz", header: "<altivec.h>".}

proc Mma_xxsetaccz_internal*(): VectorQuad {.importc: "__builtin_mma_xxsetaccz_internal", header: "<altivec.h>".}

proc Vsx_assemble_pair*(p0: var VectorPair, p1: VUC, p2: VUC) {.importc: "__builtin_vsx_assemble_pair", header: "<altivec.h>".}

proc Vsx_assemble_pair_internal*(p0: VUC, p1: VUC): VectorPair {.importc: "__builtin_vsx_assemble_pair_internal", header: "<altivec.h>".}

proc Vsx_build_pair*(p0: var VectorPair, p1: VUC, p2: VUC) {.importc: "__builtin_vsx_build_pair", header: "<altivec.h>".}

proc Vsx_build_pair_internal*(p0: VUC, p1: VUC): VectorPair {.importc: "__builtin_vsx_build_pair_internal", header: "<altivec.h>".}

proc Vsx_disassemble_pair*(p0: pointer, p1: var VectorPair) {.importc: "__builtin_vsx_disassemble_pair", header: "<altivec.h>".}

## p1 constraint: <2>
proc Vsx_disassemble_pair_internal*(p0: VectorPair, p1: int32): VUC {.importc: "__builtin_vsx_disassemble_pair_internal", header: "<altivec.h>".}

proc Vsx_lxvp*(p0: uint64, p1: var VectorPair): VectorPair {.importc: "__builtin_vsx_lxvp", header: "<altivec.h>".}

proc Vsx_stxvp*(p0: VectorPair, p1: uint64, p2: var VectorPair) {.importc: "__builtin_vsx_stxvp", header: "<altivec.h>".}
