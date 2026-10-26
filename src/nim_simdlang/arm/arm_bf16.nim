import neon

func vcvth_bf16_f32*(a: float32): bfloat16 {.importc: "vcvth_bf16_f32".}

func vcvtah_f32_bf16*(a: bfloat16): float16 {.importc: "vcvtah_f32_bf16".}
