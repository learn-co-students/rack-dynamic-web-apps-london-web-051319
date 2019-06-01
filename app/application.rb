class Application

  def call(env)
    resp = Rack::Response.new

    tries = 0
    n = 20
    expected_tries = n*n

    loop do

      tries += 1


      num_1 = Kernel.rand(1..n)
      num_2 = Kernel.rand(1..n)
      num_3 = Kernel.rand(1..n)

      resp.write "#{num_1}\n"
      resp.write "#{num_2}\n"
      resp.write "#{num_3}\n"

      if num_1==num_2 && num_2==num_3
        resp.write "You Win\n"
        resp.write "It took you #{tries} tries.\n"
        if tries > expected_tries
          resp.write "This is worse than the expected #{expected_tries} number of tries.\n"
        elsif tries < expected_tries
          resp.write "This is better than the expected #{expected_tries} number of tries.\n"
        else
          resp.write "This is exactly the expected number of tries"
        end
        break
      else
        resp.write "You Lose\n"
      end

    end

    resp.finish
  end

end
