 require 'eventmachine'
 require 'em-hiredis'
 require 'multi_json'


class Worker
  def initialize(queue)
    @redis = EM::Hiredis.connect 
    @queue = queue
  end  
  
  def start(&block)
    @block = block  
    
    perform
  end
  
  def perform
    @redis.blpop(@queue, 0).callback { |key, data|

      #TODO: catch parse exception
      @block.call(MultiJson.decode(data)) 
        
      EM.next_tick{ perform }
    }   
  end  
end 
  
EventMachine.run {
   
  worker = Worker.new("jettaxi:notifications")
  
  worker.start do |data|
    puts data
    puts 'privet'
  end  

}


