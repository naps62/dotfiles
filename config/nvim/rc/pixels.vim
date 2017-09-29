function! RubyHelloWorld()
ruby << EOF
  buffer = VIM::Buffer.current
  buffer.append(buffer.line.to_i, "Hello World")
EOF
endfunction
