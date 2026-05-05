#!/bin/bash
# ============================================================
# Установка дополнительных расширений Forge
# Запускается во время сборки Docker-образа
# ============================================================

set -e

EXT_DIR="/opt/workspace-internal/stable-diffusion-webui-forge/extensions"

# Если папка extensions не существует — создаём её
mkdir -p "$EXT_DIR"
cd "$EXT_DIR"

echo "════════════════════════════════════════════"
echo " Установка пользовательских расширений"
echo "════════════════════════════════════════════"

# 1. ADetailer — автоматическое улучшение лиц/рук
echo "→ [1/5] ADetailer..."
git clone --depth=1 https://github.com/Bing-su/adetailer.git

# 2. Config-Presets — пресеты настроек генерации
echo "→ [2/5] Config-Presets..."
git clone --depth=1 https://github.com/Zyin055/Config-Presets.git

# 3. Civitai Helper — менеджер моделей с Civitai
echo "→ [3/5] Civitai Helper..."
git clone --depth=1 https://github.com/butaixianran/Stable-Diffusion-Webui-Civitai-Helper.git

# 4. Dynamic Prompts — wildcards и шаблоны промптов
echo "→ [4/5] Dynamic Prompts..."
git clone --depth=1 https://github.com/adieyal/sd-dynamic-prompts.git

# 5. Aspect Ratio Helper — кнопки пропорций изображения
echo "→ [5/5] Aspect Ratio Helper..."
git clone --depth=1 https://github.com/thomasasfk/sd-webui-aspect-ratio-helper.git

echo "════════════════════════════════════════════"
echo " Установка завершена. Установлено расширений:"
echo "════════════════════════════════════════════"
ls -la "$EXT_DIR"