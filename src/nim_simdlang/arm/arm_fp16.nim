import neon

func vabsh_f16*(a: float16): float16 {.importc: "vabsh_f16".}

func vceqzh_f16*(a: float16): uint16 {.importc: "vceqzh_f16".}

func vcgezh_f16*(a: float16): uint16 {.importc: "vcgezh_f16".}

func vcgtzh_f16*(a: float16): uint16 {.importc: "vcgtzh_f16".}

func vclezh_f16*(a: float16): uint16 {.importc: "vclezh_f16".}

func vcltzh_f16*(a: float16): uint16 {.importc: "vcltzh_f16".}

func vcvth_f16_s16*(a: int16): float16 {.importc: "vcvth_f16_s16".}

func vcvth_f16_s32*(a: int32): float16 {.importc: "vcvth_f16_s32".}

func vcvth_f16_s64*(a: int64): float16 {.importc: "vcvth_f16_s64".}

func vcvth_f16_u16*(a: uint16): float16 {.importc: "vcvth_f16_u16".}

func vcvth_f16_u32*(a: uint32): float16 {.importc: "vcvth_f16_u32".}

func vcvth_f16_u64*(a: uint64): float16 {.importc: "vcvth_f16_u64".}

func vcvth_s16_f16*(a: float16): int16 {.importc: "vcvth_s16_f16".}

func vcvth_s32_f16*(a: float16): int32 {.importc: "vcvth_s32_f16".}

func vcvth_s64_f16*(a: float16): int64 {.importc: "vcvth_s64_f16".}

func vcvth_u16_f16*(a: float16): uint16 {.importc: "vcvth_u16_f16".}

func vcvth_u32_f16*(a: float16): uint32 {.importc: "vcvth_u32_f16".}

func vcvth_u64_f16*(a: float16): uint64 {.importc: "vcvth_u64_f16".}

func vcvtah_s16_f16*(a: float16): int16 {.importc: "vcvtah_s16_f16".}

func vcvtah_s32_f16*(a: float16): int32 {.importc: "vcvtah_s32_f16".}

func vcvtah_s64_f16*(a: float16): int64 {.importc: "vcvtah_s64_f16".}

func vcvtah_u16_f16*(a: float16): uint16 {.importc: "vcvtah_u16_f16".}

func vcvtah_u32_f16*(a: float16): uint32 {.importc: "vcvtah_u32_f16".}

func vcvtah_u64_f16*(a: float16): uint64 {.importc: "vcvtah_u64_f16".}

func vcvtmh_s16_f16*(a: float16): int16 {.importc: "vcvtmh_s16_f16".}

func vcvtmh_s32_f16*(a: float16): int32 {.importc: "vcvtmh_s32_f16".}

func vcvtmh_s64_f16*(a: float16): int64 {.importc: "vcvtmh_s64_f16".}

func vcvtmh_u16_f16*(a: float16): uint16 {.importc: "vcvtmh_u16_f16".}

func vcvtmh_u32_f16*(a: float16): uint32 {.importc: "vcvtmh_u32_f16".}

func vcvtmh_u64_f16*(a: float16): uint64 {.importc: "vcvtmh_u64_f16".}

func vcvtnh_s16_f16*(a: float16): int16 {.importc: "vcvtnh_s16_f16".}

func vcvtnh_s32_f16*(a: float16): int32 {.importc: "vcvtnh_s32_f16".}

func vcvtnh_s64_f16*(a: float16): int64 {.importc: "vcvtnh_s64_f16".}

func vcvtnh_u16_f16*(a: float16): uint16 {.importc: "vcvtnh_u16_f16".}

func vcvtnh_u32_f16*(a: float16): uint32 {.importc: "vcvtnh_u32_f16".}

func vcvtnh_u64_f16*(a: float16): uint64 {.importc: "vcvtnh_u64_f16".}

func vcvtph_s16_f16*(a: float16): int16 {.importc: "vcvtph_s16_f16".}

func vcvtph_s32_f16*(a: float16): int32 {.importc: "vcvtph_s32_f16".}

func vcvtph_s64_f16*(a: float16): int64 {.importc: "vcvtph_s64_f16".}

func vcvtph_u16_f16*(a: float16): uint16 {.importc: "vcvtph_u16_f16".}

func vcvtph_u32_f16*(a: float16): uint32 {.importc: "vcvtph_u32_f16".}

func vcvtph_u64_f16*(a: float16): uint64 {.importc: "vcvtph_u64_f16".}

func vnegh_f16*(a: float16): float16 {.importc: "vnegh_f16".}

func vrecpeh_f16*(a: float16): float16 {.importc: "vrecpeh_f16".}

func vrecpxh_f16*(a: float16): float16 {.importc: "vrecpxh_f16".}

func vrndh_f16*(a: float16): float16 {.importc: "vrndh_f16".}

func vrndah_f16*(a: float16): float16 {.importc: "vrndah_f16".}

func vrndih_f16*(a: float16): float16 {.importc: "vrndih_f16".}

func vrndmh_f16*(a: float16): float16 {.importc: "vrndmh_f16".}

func vrndnh_f16*(a: float16): float16 {.importc: "vrndnh_f16".}

func vrndph_f16*(a: float16): float16 {.importc: "vrndph_f16".}

func vrndxh_f16*(a: float16): float16 {.importc: "vrndxh_f16".}

func vrsqrteh_f16*(a: float16): float16 {.importc: "vrsqrteh_f16".}

func vsqrth_f16*(a: float16): float16 {.importc: "vsqrth_f16".}

func vaddh_f16*(a: float16, b: float16): float16 {.importc: "vaddh_f16".}

func vabdh_f16*(a: float16, b: float16): float16 {.importc: "vabdh_f16".}

func vcageh_f16*(a: float16, b: float16): uint16 {.importc: "vcageh_f16".}

func vcagth_f16*(a: float16, b: float16): uint16 {.importc: "vcagth_f16".}

func vcaleh_f16*(a: float16, b: float16): uint16 {.importc: "vcaleh_f16".}

func vcalth_f16*(a: float16, b: float16): uint16 {.importc: "vcalth_f16".}

func vceqh_f16*(a: float16, b: float16): uint16 {.importc: "vceqh_f16".}

func vcgeh_f16*(a: float16, b: float16): uint16 {.importc: "vcgeh_f16".}

func vcgth_f16*(a: float16, b: float16): uint16 {.importc: "vcgth_f16".}

func vcleh_f16*(a: float16, b: float16): uint16 {.importc: "vcleh_f16".}

func vclth_f16*(a: float16, b: float16): uint16 {.importc: "vclth_f16".}

func vcvth_n_f16_s16*(a: int16, b: int32): float16 {.importc: "vcvth_n_f16_s16".}

func vcvth_n_f16_s32*(a: int32, b: int32): float16 {.importc: "vcvth_n_f16_s32".}

func vcvth_n_f16_s64*(a: int64, b: int32): float16 {.importc: "vcvth_n_f16_s64".}

func vcvth_n_f16_u16*(a: uint16, b: int32): float16 {.importc: "vcvth_n_f16_u16".}

func vcvth_n_f16_u32*(a: uint32, b: int32): float16 {.importc: "vcvth_n_f16_u32".}

func vcvth_n_f16_u64*(a: uint64, b: int32): float16 {.importc: "vcvth_n_f16_u64".}

func vcvth_n_s16_f16*(a: float16, b: int32): int16 {.importc: "vcvth_n_s16_f16".}

func vcvth_n_s32_f16*(a: float16, b: int32): int32 {.importc: "vcvth_n_s32_f16".}

func vcvth_n_s64_f16*(a: float16, b: int32): int64 {.importc: "vcvth_n_s64_f16".}

func vcvth_n_u16_f16*(a: float16, b: int32): uint16 {.importc: "vcvth_n_u16_f16".}

func vcvth_n_u32_f16*(a: float16, b: int32): uint32 {.importc: "vcvth_n_u32_f16".}

func vcvth_n_u64_f16*(a: float16, b: int32): uint64 {.importc: "vcvth_n_u64_f16".}

func vdivh_f16*(a: float16, b: float16): float16 {.importc: "vdivh_f16".}

func vmaxh_f16*(a: float16, b: float16): float16 {.importc: "vmaxh_f16".}

func vmaxnmh_f16*(a: float16, b: float16): float16 {.importc: "vmaxnmh_f16".}

func vminh_f16*(a: float16, b: float16): float16 {.importc: "vminh_f16".}

func vminnmh_f16*(a: float16, b: float16): float16 {.importc: "vminnmh_f16".}

func vmulh_f16*(a: float16, b: float16): float16 {.importc: "vmulh_f16".}

func vmulxh_f16*(a: float16, b: float16): float16 {.importc: "vmulxh_f16".}

func vrecpsh_f16*(a: float16, b: float16): float16 {.importc: "vrecpsh_f16".}

func vrsqrtsh_f16*(a: float16, b: float16): float16 {.importc: "vrsqrtsh_f16".}

func vsubh_f16*(a: float16, b: float16): float16 {.importc: "vsubh_f16".}

func vfmah_f16*(a: float16, b: float16, c: float16): float16 {.importc: "vfmah_f16".}

func vfmsh_f16*(a: float16, b: float16, c: float16): float16 {.importc: "vfmsh_f16".}
