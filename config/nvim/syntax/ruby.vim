autocmd User ProjectionistDetect
\ call projectionist#append(getcwd(),
\ {
\    'app/*.rb': {
\      'skeleton': 'class'
\    },
\    'app/controllers/*.rb': {
\      'skeleton': 'controller'
\    },
\    'spec/*_spec.rb': {
\      'skeleton': 'spec'
\    },
\    'spec/integration/*_spec.rb': {
\      'skeleton': 'feature'
\    },
\    'spec/features/*_spec.rb': {
\      'skeleton': 'feature'
\    },
\ })
