class Test
  DEGREES_OF_FREEDOM = 1000000
  def initialize
    @methods = ['last', 'reverse', 'shuffle','sample', 'count', 'uniq', 'clear' ,'sort']
    @averager = 3
    @overall_results = []
    @step = 5000
    @limit = 50000
  end

  def run_for_methods
    @methods.each { |method| increment(method) }
  end

  def increment(method)
    increments = []
    results = []
    results.push(['Array size', method])
    (@limit / @step).times { |i| increments.push((i * @step) + @step)}
    increments.each do |increment|
      results.push([ increment , run(increment, method)])
    end
    @overall_results.push(results)
  end

  def run(increment, method)
    start = Time.new
    @averager.times { test(increment, method) }
    finish = Time.new
    return (finish - start) / @averager
  end

  def test(num, method)
     array = num.times.map{|val| val = rand(DEGREES_OF_FREEDOM) }
     array.send(method)
  end

  def overall_results
     @overall_results[0].size.times do |index|
       line = ""
       @methods.each_with_index{ |v, inner_index| line << "#{@overall_results[inner_index][index].first}," \
                                                          " #{@overall_results[inner_index][index].last},"  }
       puts line
     end
  end
end
