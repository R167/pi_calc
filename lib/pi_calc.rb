module PiCalc
  PI = Math::PI.freeze
  
  # Pi calculators
  
  def self.constant(total=100000)
    PI
  end
  
  def self.buffons_needle(total = 100000)
    running = 0

    total.times do
      ln = line
      running += 1 if ln[:y][0].floor != ln[:y][1].floor
    end
    2.0 * total / running
  end

  def self.buffons_needle_optimized(total = 100000)
    running = 0

    total.times do
      ln = line_only_y
      running += 1 if ln[:y][0].floor != ln[:y][1].floor
    end
    2.0 * total / running
  end

  def self.gregory_leibniz(total = 100000)
    running = 0
    (1..total).each do |n|
      x = 4.0 / ((n * 2) - 1)
      running += n%2==0 ? x*-1 : x
    end
    running
  end
  
  def self.nilakantha(total = 100000)
    running = 3
    total.times do |n|
      z = (n * 2) + 2
      x = 4.0 / (z * (z+1) * (z+2))
      running += n%2==0 ? x : x*-1
    end
    running
  end
  
  # Timer

  def self.time(methods = [], first = 100000, verbose = true)
    times = {}
    methods.each do |n|
      sym = n.to_sym
      t = Time.now
      output = PiCalc.send(sym, first)
      time = Time.now - t
      times[n] = {'time' => time, 'output' => output}
      puts "'#{n}' took #{time} seconds\n\tIt ouputted '#{output}'\n\n\n" if verbose
    end
    times
  end
  
  # Testing
  
  def self.test(total = 100000, verbose = true)
    output = PiCalc.time([:buffons_needle, :buffons_needle_optimized, :gregory_leibniz, :nilakantha, :constant], total, verbose).inspect
    puts output if verbose
    output
  end
  
  # Line constructors
  
  def self.line
    angle0 = rand * PI * 2
    angle1 = rand * PI * 2
  
    length_on_line = rand * 100
  
    x0 = Math.cos(angle0) * length_on_line
    x1 = Math.cos(angle1) + x0
  
    y0 = Math.sin(angle0) * length_on_line
    y1 = Math.cos(angle1) + y0
  
    {:x => [x0, x1], :y => [y0, y1], :angle => angle1}
  end

  def self.line_only_y
    angle0 = rand * PI * 2
    angle1 = rand * PI * 2
  
    length_on_line = rand * 100
  
    y0 = Math.sin(angle0) * length_on_line
    y1 = Math.cos(angle1) + y0
  
    {:y => [y0, y1], :angle => angle1}
  end
end
