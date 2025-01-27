class ApplicationController < ActionController::Base

  def blank_square_form
    render({ :template => "calculation_templates/square_form.html.erb"})
  end

  def calculate_square
    #params = {elephant=>42}
    @num = params.fetch("elephant").to_f
    @square_of_num = @num ** 2

    render({ :template => "calculation_templates/square_results.html.erb"})
  end

# SQUARE ROOT --------------------------------------------------------------

  def blank_square_root
    render ({ :template => "calculation_templates/square_root_form.html.erb"})
  end

  def calculate_square_root
    @number = params.fetch("user_number").to_f
    @sqr_number = (@number ** (1/2)).to_f

    render ({ :template => "calculation_templates/square_root_results.html.erb"})
  end

  # PAYMENT--------------------------------------------------------------
  def blank_payment_form 
    
    render ({ :template => "calculation_templates/payment_form.html.erb"})
  end
  
  
  def calculate_payment
    @apr = params.fetch("user_apr").to_f
    @years = params.fetch("user_years").to_f
    @pv = params.fetch("user_pv").to_f

    @rate = @apr/100/12
    @periods = @years * 12           #n in the formula

    @payment = ( @rate * @pv ) / ( 1 - ((1+@rate)**(-@periods)) )

    render ({ :template => "calculation_templates/payment_results.html.erb"})

  end


  # RANDOM--------------------------------------------------------------

  def blank_random_form
    
    render({ :template => "calculation_templates/rand_form.html.erb"})
  end

  def show_random
    @lower = params.fetch("user_min").to_f
    @upper = params.fetch("user_max").to_f
    @random_number = rand(@lower..@upper)
    render({ :template => "calculation_templates/rand_results.html.erb"})
  end


end
