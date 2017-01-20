# Introducing the usecase_tracer gem

    require 'usecase_tracer'


    class Light

      def on()
        puts 'light is on'
      end

      def off()
        puts 'light is off'
      end
    end

    class LiveblogTracer < UsecaseTracer

      class_tracer :Light

      def cases()

        usecase 'switching the light on' do

          trace do

            light = Light.new
            light.on

          end

          true
        end

        usecase 'switching the light off' do

          trace do

            light = Light.new
            light.off

          end

          true
        end

        usecase 'switching the light on and off' do

          trace do

            light = Light.new
            light.on
            sleep 2
            light.off

          end

          true
        end

      end

    end
      
    lt = LiveblogTracer.new
    lt.run

    lt.testresult #=> [[0, true], [1, true], [2, true]] 
    lt.passed? #=> true 

## Resources

* indented-tracer https://rubygems.org/gems/indented-tracer
* usecase_tracer https://rubygems.org/gems/usecase_tracer

usecase trace gem usecasetracer tracer
