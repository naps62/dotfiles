augroup vimrc_syntax_typescript
  autocmd User ProjectionistDetect
  \ call projectionist#append(getcwd(),
  \ {
  \    '*.ts': {
  \      'alternate': '{}.spec.ts'
  \    },
  \    '*.spec.ts': {
  \      'alternate': '{}.ts',
  \      'skeleton': 'spec'
  \    },
  \ })
augroup END
