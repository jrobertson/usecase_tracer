#!/usr/bin/env ruby

# file: usecase_tracer.rb

require 'indented-tracer'

class UsecaseTracer
  
  attr_reader :tracelog, :testresult
  
  @@classes = []
  @@ignore_methods = []
  
  def initialize()
    
    @usecases = []
    cases()
    @tracelog = []
    @testresult = []
        
  end
  
  def self.class_tracer(*args)
    a = *args
    @@classes = a.map(&:to_s)
  end
  
  def self.ignore_methods(*args)
    a = *args
    @@ignore_methods = a.flatten
  end  
  
  def run()
    
    @usecases.each.with_index do |x, i| 
      
      desc, blk = x
      @desc = desc
      r = blk.call
      @testresult << [i, r] if r.is_a?(TrueClass) or r.is_a?(FalseClass)
      
    end
    
  end
  
  def passed?()
    @testresult.map(&:last).all?
  end
  
  def trace(ignore: [])
    
    it = IndentedTracer.new
    it.classes = @@classes
    it.ignore_methods = (@@ignore_methods + [*ignore].map(&:to_sym))
    it.on
    
    yield
    
    it.off
    @tracelog << it.log(@desc, tags: @@classes)
    
  end  
  
  private
  
  # override this method with your own implementation of usecase methods
  #
  def cases()
    
  end  
  
  def usecase(desc='', &blk)
    @usecases << [desc, blk]
  end  
end