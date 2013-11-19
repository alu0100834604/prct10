require "Practica9/Fraccion.rb"
 
class Matriz
   attr_reader :filas,:columnas, :valor, :matriz, :m1, :m2
   attr_writer :resultado

def initialize( valor_entrada) 
        @filas = valor_entrada.length
	@columnas = valor_entrada[0].length
   	@matriz =  Array.new(filas){Array.new(columnas)}
   	for i in 0...@filas
       		for j in 0...@columnas
          	matriz[i][j] = valor_entrada[i][j]
       		end
   	end
end


def to_s
        i=0
	txt = "";
        rango = 0...@filas
        rango_txt = rango.to_a
        txt += "\n   #{rango_txt.join("  ")}\n"
        for fila in @matriz
                txt += "#{i} #{fila}\n"
                i += 1
        end
	return txt
end
def muestra_matriz(matriz)
	i=0
	rango = 0...matriz[0].length
	rango_txt = rango.to_a
	print "\n   #{rango_txt.join("  ")}\n"
	for fila in matriz
		puts "#{i} #{fila}"
		i += 1
	end
end

def hacer_matriz(filas,columnas, valor)
	array_devolucion = Array.new(filas){Array.new(columnas, valor)}
end

def *(m2)
        dimensiones=[[@filas, @columnas],[m2.filas, m2.columnas]]
        filas_final = dimensiones[0][0]
        columnas_final = dimensiones[1][1]
        resultado = Array.new(filas_final){Array.new(columnas_final)}
        for i in 0...@filas
                for j in 0...m2.columnas
                        temp = Array.new(dimensiones[0][0])
                        val1 = @matriz[i][0]
                        val2 = m2.[](0,j)
			#temp[0] = @matriz[i][0] * m2[0][j];
			temp[0] = val1 * val2;
                        for k in 1...@columnas
                                val1 = @matriz[i][k]
                                val2 = m2.[](k,j)
				temp2 =  val1 * val2
                                temp[k] = temp2
                        end
                        resultado[i][j] = temp.reduce(:+)
                end
        end
        return Matriz.new(resultado)
end


def +(m2)
	filas_final = @filas
	columnas_final = @columnas
	resultado = Array.new(filas_final){Array.new(columnas_final, 0)}
	for i in 0...@filas
		for j in 0...@columnas
			resultado[i][j] = @matriz[i][j] +m2.matriz[i][j]
		end 
	end
	return Matriz.new(resultado)
end

def []=(i,j,x)
   @matriz[i][j] = x
end

def [](i,j)  
  @matriz[i][j]
end

#def [](i)
#  @matriz[i]
#end

def == (other)
 	filas_final = @filas
	columnas_final = @columnas
	resultado = true
	for i in 0...@filas
		for j in 0...@columnas
			resultado &= (@matriz[i][j] == other.[](i,j))
		end 
	end
	return(resultado)
end 

def porcentaje_ceros()
   ceros = 0;
   for i in 0...@filas
       for j in 0...@columnas
          if(@matriz[i][j] == 0)
		ceros += 1
          end
       end
   end
   porcentaje = Float(ceros)/(@filas * @columnas)
end

#def = (m1)
#   filas = m1.filas
#   columnas = m1.columnas
#   matriz =  Array.new(filas){Array.new(columnas)}
#   for i in 0...filas
#       for j in 0...columnas
#          matriz[i][j] = m1[i][j]
#       end
#   end
#   resultado = Matriz.new(filas, columnas)
   
#end

end

class MatrizDispersa < Matriz
	def initialize(matriz_entrada)
#puts(matriz_entrada[0].class)
		@hash_no_nulos = {}
		@filas = matriz_entrada.length
		@columnas = matriz_entrada[0].length
		for i in 0...@filas
			for j in 0...@columnas
				@hash_no_nulos[i.to_s+"-"+j.to_s] = matriz_entrada[i][j]
			end
		end
	end

	def []=(i,j,x)
	   @hash_no_nulos[i.to_s+"-"+j.to_s] = x
	end

	def [](i,j)
	  @hash_no_nulos[i.to_s+"-"+j.to_s]
	end

	def +(other)
		puts(other.class)
		#devolucion = Matriz
		if((other.is_a?MatrizDensa))
			filas_final = @filas
			columnas_final = @columnas
			resultado = Array.new(filas_final){Array.new(columnas_final, 0)}
			for i in 0...@filas
				for j in 0...@columnas
					resultado[i][j] = self.[](i,j) +other.matriz[i][j]
				end 
			end
			return MatrizDensa.new(resultado)						
		elsif(other.is_a?MatrizDispersa)
			
		end
	end
end

class MatrizDensa < Matriz

	def +(other)
		#puts(other.class)
		#devolucion = Matriz
		if((other.is_a?MatrizDispersa))
			filas_final = @filas
			columnas_final = @columnas
			resultado = Array.new(filas_final){Array.new(columnas_final, 0)}
			for i in 0...@filas
				for j in 0...@columnas
					resultado[i][j] = other.[](i,j) + @matriz[i][j]
				end 
			end
			return MatrizDensa.New(Matriz.new(resultado))						
		elsif(other.is_a?MatrizDensa)
			muestra_matriz(@matriz)
			filas_final = @filas
			columnas_final = @columnas
			resultado = Array.new(filas_final){Array.new(columnas_final, 0)}
			for i in 0...@filas
				for j in 0...@columnas
					resultado[i][j] = @matriz[i][j] +other.matriz[i][j]
				end 
			end
			return MatrizDensa.new(resultado)			
		end
	end
	
	def *(other)
		if(other.is_a?MatrizDispersa)
			filas_final = @filas
			columnas_final = @columnas
			resultado = Array.new(filas_final){Array.new(columnas_final, 0)}
			 dimensiones=[[@filas, @columnas],[other.filas, other.columnas]]
			for i in 0...@filas
                		for j in 0...@columnas
                        		temp = Array.new(dimensiones[0][0])
                        		val1 = @matriz[i][0]
		                        val2 = other.[](0,j)
					
					temp[0] = val1 * val2;
		                        for k in 1...@columnas
	                                	val1 = @matriz[i][k]
		                                val2 = other.[](k,j)
						temp2 =  val1 * val2
		                                temp[k] = temp2
	                        	end
	                        	resultado[i][j] = temp.reduce(:+)
                        	 
                        	end
                        end
                        
	 		return MatrizDensa.new(resultado)
               elsif(other.is_a?MatrizDensa)
               		return MatrizDensa.new(resultado)
               end	
        end
end
