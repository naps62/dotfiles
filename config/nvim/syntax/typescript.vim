autocmd User ProjectionistDetect
\ call projectionist#append(getcwd(),
\ {
\    'src/*.ts': {
\      'alternate': 'test/{}.test.ts'
\    },
\    'test/*.test.ts': {
\      'alternate': 'src/{}.ts',
\      'skeleton': 'mocha'
\    },
\ })
