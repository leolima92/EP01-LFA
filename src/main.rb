class ADF
  def initialize(cadeia)
    @cadeia = cadeia.strip.upcase
    @indice = 0
    @max = @cadeia.size
    @total = 0
  end

  def proximo
    if @indice == @max
      ""
    else
      @cadeia[@indice]
    end
  end

  def iniciar
    estado = "q0"

    puts "Máquina iniciou no estado: #{estado}"

    loop do
      case [proximo, estado]

      # MILHARES

      in ["M", "q0"]
        estado = "qM1"
        @total += 1000

      in ["M", "qM1"]
        estado = "qM2"
        @total += 1000

      in ["M", "qM2"]
        estado = "qM3"
        @total += 1000

      in ["M", "qM3"]
        puts "Erro"
        break

      # muda para centenas sem consumir símbolo
      in ["C" | "D", "q0" | "qM1" | "qM2" | "qM3"]
        estado = "qH0"
        next

      # muda para dezenas sem consumir símbolo
      in ["X" | "L", "q0" | "qM1" | "qM2" | "qM3" | "qH0" | "qC" | "qCC" | "qCCC" | "qD" | "qDC" | "qDCC" | "qDCCC" | "qHF"]
        estado = "qT0"
        next

      # muda para unidades sem consumir símbolo
      in ["I" | "V", "q0" | "qM1" | "qM2" | "qM3" | "qC" | "qCC" | "qCCC" | "qD" | "qDC" | "qDCC" | "qDCCC" | "qHF"]
        estado = "qU0"
        next

      in ["", "q0" | "qM1" | "qM2" | "qM3" | "qC" | "qCC" | "qCCC" | "qD" | "qDC" | "qDCC" | "qDCCC" | "qHF"]
        puts "Aceito "
        puts "Valor decimal: #{@total}"
        break

  
      # CENTENAS
        
      in ["C", "qH0"]
        estado = "qC"
        @total += 100

      in ["D", "qC"]
        estado = "qHF" #estado final das centenas
        @total += 300

      in ["M", "qC"]
        estado = "qHF"
        @total += 800

      in ["C", "qC"]
        estado = "qCC"
        @total += 100

      in ["C", "qCC"]
        estado = "qCCC"
        @total += 100

      in ["C", "qCCC"]
        puts "Erro"
        break
      
      in ["D", "qH0"]
        estado = "qD"
        @total += 500
      
      in ["C", "qD"]
        estado = "qDC"
        @total += 100

      in ["C", "qDC"]
        estado = "qDCC"
        @total += 100

      in ["C", "qDCC"]
        estado = "qDCCC"
        @total += 100

      in ["C", "qDCCC"]
        puts "Erro"
        break

      in ["D", "qD"]
        puts "Erro"
        break
      # DEZENAS

      in ["X", "qT0"]
        estado = "qX"
        @total += 10

      in ["X", "qX"]
        estado = "qXX"
        @total += 10

      in ["X", "qXX"]
        estado = "qXXX"
        @total += 10

      in ["L", "qX"]
        estado = "qTF"
        @total += 30   
      in ["C", "qX"]
        estado = "qTF"
        @total += 80   

      in ["L", "qT0"]
        estado = "qL"
        @total += 50

      in ["X", "qL"]
        estado = "qLX"
        @total += 10

      in ["X", "qLX"]
        estado = "qLXX"
        @total += 10

      in ["X", "qLXX"]
        estado = "qLXXX"
        @total += 10


      in ["I" | "V", "qT0" | "qX" | "qXX" | "qXXX" | "qL" | "qLX" | "qLXX" | "qLXXX" | "qTF"]
        estado = "qU0"
        next

      # terminou em dezenas
      in ["", "qT0" | "qX" | "qXX" | "qXXX" | "qL" | "qLX" | "qLXX" | "qLXXX" | "qTF"]
        puts "Aceito"
        puts "Valor decimal: #{@total}"
        break

      # UNIDADES
    
      in ["I", "qU0"]
        estado = "qI"
        @total += 1

      in ["I", "qI"]
        estado = "qII"
        @total += 1

      in ["I", "qII"]
        estado = "qIII"
        @total += 1

      in ["V", "qI"]
        estado = "qF"
        @total += 3   

      in ["X", "qI"]
        estado = "qF"
        @total += 8  

      in ["V", "qU0"]
        estado = "qV"
        @total += 5

      in ["I", "qV"]
        estado = "qVI"
        @total += 1

      in ["I", "qVI"]
        estado = "qVII"
        @total += 1

      in ["I", "qVII"]
        estado = "qVIII"
        @total += 1

      in ["", "qI" | "qII" | "qIII" | "qV" | "qVI" | "qVII" | "qVIII" | "qF" | "qU0"]
        puts "Aceito "
        puts "Valor decimal: #{@total}"
        break

      else
        puts "Erro"
        break
      end

      @indice += 1
      puts "Estado: #{estado}"
      puts "Total: #{@total}"
    end
  end
end

print "Digite um número romano: "
entrada = gets

if entrada.nil? || entrada.strip.empty?
  puts "Entrada inválida"
else
  adf = ADF.new(entrada)
  adf.iniciar
end