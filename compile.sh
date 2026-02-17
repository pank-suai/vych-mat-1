#!/bin/bash

# Скрипт для компиляции отчёта Typst

echo "Компиляция отчёта..."
typst compile --root . docs/report.typ docs/report.pdf

if [ $? -eq 0 ]; then
    echo "✓ Отчёт успешно скомпилирован: docs/report.pdf"
    ls -lh docs/report.pdf
else
    echo "✗ Ошибка компиляции"
    exit 1
fi
