class Fraccion
   attr_reader :num, :denom
   include Comparable

   def mcd(x,y)
      y == 0 ? x: mcd(y, x%y)
   end
      
   def mcm(x,y)
      z = x / mcd(x,y) * y 
   end 
  
   def initialize(num, denom)
      raise TypeError, "El denominador no puede ser cero" if denom.eql? 0

      d = mcd(num, denom)
      @num = num / d
      @denom = denom / d
   end

   def abs
      to_f.abs
   end

   def reciprocal
      Fraccion.new(@denom,@num)
   end

   def to_s
      "#@num/#@denom"
   end

   def to_f
      Float(@num)/@denom
   end

   def + (other)
	((other.is_a? Numeric)?  Fraccion.new( other * @denom + @num, @denom ) : Fraccion.new( @num * other.denom + other.num * @denom, @denom * other.denom ))
   end

   def - (other)
      Fraccion.new( @num * other.denom - other.num * @denom, @denom * other.denom )
   end

   def * (other)
      ((other.is_a? Numeric)? Fraccion.new( @num * other , @denom ) : Fraccion.new( @num * other.num , @denom * other.denom ))

   end

   def % (other)
=begin
      temp = self / other
      self - temp
      Fraccion.new( @num * other.num , @denom * other.denom )
=end
   end

   def -@
      ((@num==@num.abs)? Fraccion.new(-@num,@denom) : Fraccion.new(@num,-@denom))
   end

   def / (other)
      Fraccion.new( @num * other.denom , @denom * other.num )
   end

   def <=>(other)
      Float(@num)/@denom <=> Float(other.num)/other.denom
   end
end
