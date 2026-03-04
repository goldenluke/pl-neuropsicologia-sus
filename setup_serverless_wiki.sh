#!/bin/bash

echo "Configurando wiki serverless..."

# instalar mkdocs se necessário
pip install mkdocs mkdocs-material

# criar configuração
cat > mkdocs.yml << 'CONFIG'
site_name: Lei de Avaliação Neuropsicológica no SUS
site_description: Projeto legislativo colaborativo
site_author: Comunidade

theme:
  name: material
  features:
    - navigation.tabs
    - navigation.sections
    - search.suggest
    - search.highlight

nav:
  - Início: index.md
  - Exposição de Motivos: docs/exposicao-motivos.md
  - Fundamentação Teórica: docs/fundamentacao-teorica.md
  - Direito Comparado: docs/direito-comparado.md

  - Projeto de Lei:
      - Artigo 1: projeto-lei/artigo-1.md
      - Artigo 2: projeto-lei/artigo-2.md
      - Artigo 3: projeto-lei/artigo-3.md
      - Artigo 4: projeto-lei/artigo-4.md
      - Artigo 5: projeto-lei/artigo-5.md
      - Artigo 6: projeto-lei/artigo-6.md
      - Artigo 7: projeto-lei/artigo-7.md
      - Artigo 8: projeto-lei/artigo-8.md
      - Artigo 9: projeto-lei/artigo-9.md
      - Artigo 10: projeto-lei/artigo-10.md

  - Discussão:
      - Debate Técnico: discussao/debate-tecnico.md
      - Propostas de Emenda: discussao/propostas-emenda.md
CONFIG

# página inicial
cat > index.md << 'INDEX'
# Lei de Avaliação Neuropsicológica no SUS

Projeto colaborativo para construção de proposta legislativa aberta.

## Objetivos

- garantir acesso à avaliação neuropsicológica no SUS
- reduzir lacunas normativas
- permitir participação pública no processo legislativo

## Como contribuir

1. faça um fork
2. edite os artigos
3. envie um pull request
INDEX

# gerar site
mkdocs build

echo ""
echo "Site gerado em /site"
echo ""
echo "Para deploy serverless use:"
echo ""
echo "Cloudflare Pages"
echo "Vercel"
echo "Netlify"
echo "GitHub Pages"
echo ""
