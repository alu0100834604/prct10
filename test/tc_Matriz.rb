require "test/unit"
require "Practica9/Matriz.rb"
require "Practica9/Fraccion.rb"
#require "MatrizDensa.rb"
#require "MatrizDispersa.rb"

class Test_Matriz < Test::Unit::TestCase

	def setup
	@dispersa1 = MatrizDispersa.new([[1,0,0],[0,1,0],[0,0,0]])
	@densa1    = MatrizDensa.new([[1,2,1],[2,1,3],[3,5,4]])
        @dispersa2 = MatrizDispersa.new([[1,0,0],[0,0,0],[1,0,0]]) 
        @densa2    = MatrizDensa.new([[2,3,1],[9,3,4],[2,7,5]]) 
	@densa3    = MatrizDensa.new([[-1,-2,-1],[-2,-1,-3],[0,0,0]])
	end


#comprobacion que se crean bien las matrices

	def test_Comprobacion

	assert_equal(@dispersa1.filas,3)
        assert_equal(@dispersa1.columnas,3)
	 
	assert_equal(@densa1.filas,3)
        assert_equal(@densa1.columnas,3)

	end


#comprobar tipo de matrices

	def test_Tipo
	
	assert_equal(true, @dispersa1.is_a?(MatrizDispersa))
	assert_equal(true, @densa1.is_a?(MatrizDensa))
	assert_equal(true, (@densa1+@densa3).is_a?(MatrizDispersa))


	end

#comprobar operaciones

	def test_Operacion

#suma
	assert_equal(MatrizDispersa.new([[2,0,0],[0,1,0],[1,0,0]]) , (@dispersa1 + @dispersa2))
	assert_equal(MatrizDensa.new([[2,2,1],[2,2,3],[3,5,4]]) , (@dispersa1+@densa1))

#multiplicacion

	assert_equal(MatrizDensa.new([[2,3,1],[0,0,0],[2,3,1]]) , (@dispersa2*@densa2) )
	assert_equal(MatrizDensa.new([[22,16,14],[19,30,21],[59,52,43]]), (@densa1*@densa2) )

	end

end


