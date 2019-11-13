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
