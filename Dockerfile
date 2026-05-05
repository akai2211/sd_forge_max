# ============================================================
# Stable Diffusion Forge — кастомный образ для vast.ai
# База: официальный образ vast.ai с оригинальным Forge (classic)
# ============================================================

FROM vastai/sd-forge:classic-9cedffa-2026-04-27-cuda-12.9

# Метаданные образа
LABEL maintainer="akai2211"
LABEL description="Custom Stable Diffusion Forge image based on vastai/sd-forge classic"
LABEL version="0.2.0"

# ============================================================
# 1. Установка дополнительных расширений
# ============================================================
COPY scripts/install_extensions.sh /tmp/install_extensions.sh
RUN chmod +x /tmp/install_extensions.sh && \
    /tmp/install_extensions.sh && \
    rm /tmp/install_extensions.sh

# ============================================================
# 2. Копирование конфигов в шаблонную директорию
#    (откуда они будут скопированы в /workspace/ при старте)
# ============================================================
COPY configs/config.json /opt/workspace-internal/stable-diffusion-webui-forge/config.json
COPY configs/ui-config.json /opt/workspace-internal/stable-diffusion-webui-forge/ui-config.json

# ============================================================
# Что готово в этом образе:
#   ✅ Forge classic (от lllyasviel)
#   ✅ 10 встроенных расширений отключены через config.json
#   ✅ 5 дополнительных расширений установлены:
#      - ADetailer
#      - Config-Presets
#      - Civitai Helper
#      - Dynamic Prompts
#      - Aspect Ratio Helper
#   ✅ Дефолты UI: 512×768, DPM++ 2M Karras, R-ESRGAN 4x+
#   ✅ Тёмная тема через FORGE_ARGS в шаблоне vast.ai
#
# Что добавим в следующих версиях:
#   - Скачивание моделей через PROVISIONING_DOWNLOADS
#   - LoRA, VAE, ControlNet модели
#   - Файлы из второго репозитория (assets)
# ============================================================