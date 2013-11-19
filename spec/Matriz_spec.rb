require "Practica9/Matriz.rb"
require "Practica9/Fraccion.rb"

describe Matriz do
 before :each do
    #@matriz1 = Matritz.new([1 , 2, 3],[4, 5 , 6],[7, 8, 9])
    
    @matriz2 = Matriz.new([[1,2],[3,4]])
    @matriz3 = Matriz.new([[5, 6],[7,8]])
    @matriz4 = Matriz.new([[ Fraccion.new(1,2) , Fraccion.new(1,3)],[Fraccion.new(2,4), Fraccion.new(1,5)]])
    @matriz5 = Matriz.new([[ Fraccion.new(1,2) , Fraccion.new(1,3)],[Fraccion.new(2,4), Fraccion.new(1,5)]])
    @matriz_densa = MatrizDensa.new([[0,0,0],[1,2,3],[1,1,1]])
    @matriz_dispersa = MatrizDispersa.new([[0,0,0],[1,2,3],[0,0,0]])
  end  

describe "Suma de Matrices" do
    it "Se sumar correctamente" do
	@resultado = @matriz2 + @matriz3
      	@resultado.should == Matriz.new([[6,8],[10,12]]) 
    end
  end

describe "Multiplicacion de Matrices" do
	it "Se multiplicar correctamente" do
	@resultado = @matriz2 * @matriz3
	@resultado.should == Matriz.new([[19,22],[43,50]])
	end

end

describe "Suma de matrices con fracciones" do
	it "Se deben sumar fracciones correctamente" do
	@resultado = @matriz4 + @matriz5
      	@resultado.should == Matriz.new([[ Fraccion.new(1,1) , Fraccion.new(2,3)],[Fraccion.new(1,1), Fraccion.new(2,5)]])
	end
end



describe "Se deben sumar las matrices densas" do
	it "Se deben sumar las matrices densas" do
	@resultado = @matriz_densa + @matriz_densa
      	@resultado.should == MatrizDensa.new([[0,0,0],[2,4,6],[2,2,2]])
        end
end

describe "Se deben sumar las matrices dispersas" do
	it "Se deben sumar las matrices dispersas" do
	@resultado = @matriz_dispersa + @matriz_dispersa
      	@resultado.should == MatrizDispersa.new([[0,0,0],[2,4,6],[0,0,0]])
        end
end

describe "Se deben sumar matrices dispersa y densas" do
	it "Se deben sumar las matrices dispersa y densa" do
	@resultado = @matriz_dispersa + @matriz_densa
      	@resultado.should == MatrizDensa.new([[0,0,0],[2,4,6],[1,1,1]])
        end
end

describe "Se multiplcar la matrice dispersa y densa" do
	it "Se deben multiplicar la matrice dispersa y densa" do
	@resultado = @matriz_dispersa * @matriz_densa
      	@resultado.should == MatrizDispersa.new([[0,0,0],[5,7,9],[0,0,0]])
        end
end

describe "Se multiplcar las matrices densa y dispersa" do
	it "Se deben multiplicar la matrice dispersa y densa" do
	@resultado = @matriz_densa * @matriz_dispersa
      	@resultado.should == MatrizDensa.new([[0,0,0],[2,4,6],[1,2,3]])
        end
end

describe "Se deben multiplar las matrices densas" do
	it "Se deben multiplicar las matrices densas" do
	@resultado = @matriz_densa * @matriz_densa
      	@resultado.should == MatrizDensa.new([[0,0,0],[5,7,9],[2,3,4]])
        end
end

describe "Se deben multiplar las matrices dispersas" do
	it "Se deben multplicar las matrices dispersas" do
	@resultado = @matriz_dispersa * @matriz_dispersa
      	@resultado.should == MatrizDispersa.new([[0,0,0],[2,4,6],[0,0,0]])
        end
end

end
