require_relative 'patient'

luiz = Patient.new(name: "Luiz", cured: true)

puts "#{luiz.name} está #{luiz.cured ? 'curado' : 'doente'}"

luiz.cure!

puts "#{luiz.name} está #{luiz.cured ? 'curado' : 'doente'}"
