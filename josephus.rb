# Language: Ruby, Level: Level 3
class Ddly_Crl
	class Person
		@@id = 0

		attr_accessor:sword, :nbr, :num

		def initialize
			@@id += 1
			@sword = false
			@nbr = nil
			@num = @@id
		end

		def to_s
			"Person number is #{@num} and it's neighbor is #{@nbr.num}."
		end
	end

	attr_accessor:crl

	def initialize(size)
		@crl = Array.new(size) {Person.new}
		nbr_asi
	end

	@private
	def nbr_asi #this method will assign next adjacent object
		@crl.each do |person|
			if @crl[-1] == person
				person.nbr = @crl[0] #if object is the last element or an array it assign the first element to make a circle
			else
				person.nbr = @crl[@crl.index(person)+1]#it assign next element
			end
		end
	end

	def kll_pss(person) #this method will kill neighbor object and pass "sword" to the next one
		if person.sword == true
			tmp_nbr = person.nbr.nbr #it assign the "victims" neighbor
			puts "Person #{person.nbr.num} died!"
			@crl.delete_at(@crl.index(person.nbr))
			person.nbr = tmp_nbr
			person.nbr.sword = true
			person.sword = false
		else
			puts "No sword!" #just in case if sth go wrong, but this part of code should never execute
		end
	end

	@public
	def nightmare_begin #this method is looping through our "deadly circle"
		@crl[0].sword = true # first obj must get sword somehow
		while @crl.size != 1
			@crl.each do |person|
				puts "Now person: #{person.num}"
				kll_pss(person)
			end
		end
		puts "Person #{@crl[0].num} survived!"
	end
end

joseph = Ddly_Crl.new(gets.chomp.to_i).nightmare_begin
