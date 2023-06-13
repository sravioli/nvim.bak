return {
  auxDirectory = ".",
  bibtexFormatter = "texlab",
  build = {
    args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
    executable = "pdflatex",
    forwardSearchAfter = false,
    onSave = true,
  },
  chktex = {
    onEdit = false,
    onOpenAndSave = true,
  },
  diagnosticsDelay = 300,
  formatterLineLength = 80,
  forwardSearch = {
    args = {},
  },
  latexFormatter = "latexindent",
  latexindent = {
    modifyLineBreaks = true,
  },
}
