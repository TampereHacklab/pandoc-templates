# pandoc-templates

Pandoc templates for LaTeX and Typst to quickly create pretty Hacklab documents.

## Usage

To convert using LaTeX:

`pandoc poytakirja_example.md --template=poytakirja.tex -o poytakirja.pdf`

To convert using Typst:

`pandoc poytakirja_example.md --pdf-engine=typst --template=poytakirja.typ -o poytakirja.pdf`

## Available templates

- `poytakirja.tex` / `poytakirja.typ`: template for meeting memos (see `poytakirja_example.md` for syntax)
