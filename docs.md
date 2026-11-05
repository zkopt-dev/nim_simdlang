SIMD
-Support :
->AMD64 : SSE(128), SSE2(128), SSE3(128), SSSE3(128), SSE4.1(128), SSE4.2(128), F16C(128/256),
XOP(128), FMA(128/256), AMX(8192Max), AVX(256), AVX2(256), AVX-512(512), AVX10(128/256/512), BMI, ADX
->Armhf(Armv7-A) : NEON(128)
->AArch32(Armv8-M) : MVE(128)
->AArch64(Armv8-A) : NEON(128), SVE(128~2048)
->AArch64(Armv9-A) : NEON(128), SVE(128~2048), SVE2(128-2048), SME(Matrix-dynamic)
->RISC-V: P-SIMD(32/64), V-SIMD(128~65536)
->MIPS64/MIPS64el : MDMX(64), MIPS-3D(64), MSA(128)
->PPC64/PPC64el : VMX(128), VSX(128), MMA(Matrix, 512)
->LoongArch : LSX(128), LASX(256)
->i686 : MMX(64), 3DNow!(64), SSE(128), SSE2(128), SSE3(128)
->MIPS32 : MSA(128), DSP ASE(32)
->MIPS32el : MSA(128), DSP ASE(32)
-Unsupported
->i586 : MMX(64), 3DNow(64)!
->PA-RISC : MAX(32/64)
->Alpha : MVI(64)
->SPARC : VIS(64)

# +(O), -(O), *(O), div, mod, pow, sqrt, cqrt, abs(O), min, max, addSat, subSat
# and(O), or(O), not(O), xor(O), nand(O), nor(O), nxor(O), andnot(O), ornot(O)
# shl(O), shr(O), rotl(), rotr()
# ==(O), !=(O), >=(O), <=(O), >(O), <(O)
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
