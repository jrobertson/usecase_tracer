#!/usr/bin/env ruby

# file: usecase_tracer.rb

require 'indented-tracer'

=begin

# example usecase

# description

usecase 'new day: create a new entry' do

  # preparation (files to create in the 
  #               /tmp directory, setting of the date etc.)

  # intialisation
  liveblog = LiveBlog.new

  # setup (i.e. setting the date)

  # conditions
  if liveblog.date == Date.today and liveblog.today_exists? == false  then

    trace() do

      # public method to be traced
      s = '# Testing the liveblog #liveblog'
      liveblog.add_entry(s)

    end

    # optional validator
    html = File.read(File.join(path, 'index.html'))
    html =~ /Testing the liveblog/ ? true : false

  end

end # end of run
=end


class UsecaseTracer
  
  attr_reader :tracelog, :testresult
  
  @@classes = []
  
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
  
  def classes()
    @@classes
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
  
  def trace()
    
    it = IndentedTracer.new
    it.classes = @@classes
    it.on
    
    yield
    
    it.off
    @tracelog << it.log(@desc, tags: classes())
    
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

