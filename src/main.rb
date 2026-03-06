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
      in ["X" | "L", "q0" | "qM1" | "qM2" | "qM3"]
        estado = "qT0"
        next

      # muda para unidades sem consumir símbolo
      in ["I" | "V", "q0" | "qM1" | "qM2" | "qM3"]
        estado = "qU0"
        next

      in ["", "q0" | "qM1" | "qM2" | "qM3"]
        puts "Aceito "
        puts "Valor decimal: #{@total}"
        break

  
      # CENTENAS (TODO DO GRUPO)
   
      in [_, "qH0"]
        puts "TODO: implementar centenas"
        break

  
      # DEZENAS 
   
      in [_, "qT0"]
        puts "TODO: implementar dezenas"
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
        @total += 3   # IV

      in ["X", "qI"]
        estado = "qF"
        @total += 8   # IX

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

adf = ADF.new("Iv")
adf.iniciar