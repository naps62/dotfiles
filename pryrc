# nvim: set syntax=ruby

Pry.config.prompt = Pry::NAV_PROMPT

begin
  require "awesome_print"
  AwesomePrint.pry!
rescue LoadError => err
  puts "no awesome_print :("
end
