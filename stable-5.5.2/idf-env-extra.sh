
if [ -z "${OLD_PATH}" ]; then
        OLD_PATH="${PATH}"
fi

if [ -z "${OLD_PS1}" ]; then
        OLD_PS1="${PS1}"
fi

export PS1="(esp-idf-5.5.2 \${ESPPORT:-}) ${OLD_PS1}"

#export IDF_TOOLS_PATH=${HOME}/esp
export IDF_TOOLS_PATH="/opt/espressif32-5.5.2"
export IDF_PATH=${IDF_TOOLS_PATH}/esp-idf

#### .... need update ....

unset OPENOCD_SCRIPTS
unset ESP_ROM_ELF_DIR

#export IDF_PATH="/opt/espressif32-5.5.2/esp-idf"
export ESP_IDF_VERSION="5.5"
export IDF_PYTHON_ENV_PATH="/opt/espressif32-5.5.2/python_env/idf5.5_py3.11_env"
export OPENOCD_SCRIPTS="/opt/espressif32-5.5.2/tools/openocd-esp32/v0.12.0-esp32-20250707/openocd-esp32/share/openocd/scripts"
export ESP_ROM_ELF_DIR="/opt/espressif32-5.5.2/tools/esp-rom-elfs/20241011/"
export PATH="/opt/espressif32-5.5.2/esp-idf/components/espcoredump:/opt/espressif32-5.5.2/esp-idf/components/partition_table:/opt/espressif32-5.5.2/esp-idf/components/app_update:/opt/espressif32-5.5.2/tools/xtensa-esp-elf-gdb/16.3_20250913/xtensa-esp-elf-gdb/bin:/opt/espressif32-5.5.2/tools/riscv32-esp-elf-gdb/16.3_20250913/riscv32-esp-elf-gdb/bin:/opt/espressif32-5.5.2/tools/xtensa-esp-elf/esp-14.2.0_20251107/xtensa-esp-elf/bin:/opt/espressif32-5.5.2/tools/riscv32-esp-elf/esp-14.2.0_20251107/riscv32-esp-elf/bin:/opt/espressif32-5.5.2/tools/esp32ulp-elf/2.38_20240113/esp32ulp-elf/bin:/opt/espressif32-5.5.2/tools/openocd-esp32/v0.12.0-esp32-20250707/openocd-esp32/bin:/opt/espressif32-5.5.2/python_env/idf5.5_py3.11_env/bin:/opt/espressif32-5.5.2/esp-idf/tools:${OLD_PATH}"
export IDF_TOOLS_INSTALL_CMD="/opt/espressif32-5.5.2/esp-idf/install.sh"
export IDF_TOOLS_EXPORT_CMD="/opt/espressif32-5.5.2/esp-idf/export.sh"

#### ....

