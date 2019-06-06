module Enumerable
    def my_each
      for i in 0...self.length
        yield(self[i])
      end  
    end

    def my_each_with_index
        for i in 0...self.length
            yield(i)
        end
    end

    def my_select
        new_array = []
        self.my_each { |n|
            if yield(n)
                new_array.push(n)
            end
        }
        return new_array
    end

    def my_all?
        self.my_each { |n|
            return false unless yield(n)
        }
        return true
    
    end

    def my_any?
        self.my_each { |n|
            return true if yield(n)
        }
        return false
    end

    def my_none?
        self.my_each { |n|
            return false if yield(n)
        }
        return true   
    end
    
    def my_count(obj=nil)
        return self.size unless (block_given? || obj)
        count = 0
        if obj
            self.my_each { |n|
              count += 1 if n == obj
            }

        else self.my_each{ |n|
            count +=1 if yield(n)
        }
        end

        count
    end

    def my_map(proc=nil)
        new_array = []

        if proc
            self.my_each{|n|
                new_array.push(proc.call(n))
            }
        elsif proc.nil? && block_given?
            self.my_each{ |n|
                new_array.push(yield(n))
            }
        end

        new_array
    end

    def my_inject 
        total = 1
        self.my_each{ |n|
            total = yield(total,n)
        }
        total
    end

end


# TESTING STARTS HERE

# array = [52,21,314,555,1232,212,212,21,232,13]

# array.my_each_with_index { |index|
#     puts index 
# }

# p [1,2,3,4,5].my_select { |num|  num.even? }

# p ["cat","bat","sst"].all? { |x|
#     x.length == 3
# }

# p ["cat","bat","tts"].my_all? { |x|
#     x.length == 3
# }

# p ["at", "bar", "ct"].any? { |word| word.length > 3 }
# p ["at", "bar", "ct"].my_any? { |word| word.length > 3 }

# p ["ant", "bear", "cat"].none? { |word| word.length == 5 }
# p ["ant", "bear", "cat"].my_none? { |word| word.length == 5 }
# p [].none? 
# p [].my_none? 

# ary = [1, 2, 4, 2]
# p ary.count
# p ary.count(2)
# p ary.count{ |x| x%2==0 }
# p ary.my_count
# p ary.my_count(2)
# p ary.my_count{ |x| x%2==0 }

# a = [ "a", "b", "c", "d" ]
# p a.map {|x| x + "!" }
# p a.my_map {|x| x + "!" }

def multiply_els(array)
    array.my_inject{| total,n|
        total * n
    }
end

p multiply_els([2, 4, 5])

# cube = Proc.new{ |x| x**3 }
# p [4, 5, 6].map(&cube)
# p [4, 5, 6].my_map(&cube)



