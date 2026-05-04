# ============================================================
# Stable Diffusion Forge — кастомный образ для vast.ai
# База: официальный образ vast.ai с оригинальным Forge (classic)
# ============================================================

FROM vastai/sd-forge:classic-9cedffa-2026-04-27-cuda-12.9

# Метаданные образа
LABEL maintainer="akai2211"
LABEL description="Custom Stable Diffusion Forge image based on vastai/sd-forge classic"
LABEL version="1.0"

# ============================================================
# На этом этапе образ — точная копия базового vastai/sd-forge.
# В следующих коммитах сюда добавим:
#   - Скачивание checkpoint моделей (ReV Animated и др.)
#   - Скачивание LoRA и VAE
#   - Установку расширений
#   - Применение настроек UI (тёмная тема и т.д.)
# ============================================================