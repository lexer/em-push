 require 'eventmachine'
 require 'em-hiredis'
 require 'multi_json'


class Worker
  def initialize
    @redis = EM::Hiredis.connect 
    puts MultiJson.encode({:hello => 3})
    @redis.lpush 'hello', MultiJson.encode({:hello => 3}) 

  end  
  
  def work
    @redis.blpop('hello', 0).callback { |key, value|
      
      #puts "Key #{key}"
      puts "Value #{value}"

      puts MultiJson.decode(value)
      
        
        self.work
    }   
  end  
end 
  
EventMachine.run {
  
  
  worker = Worker.new
  worker.work
}