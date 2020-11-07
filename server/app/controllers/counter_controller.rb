class CounterController < ApplicationController
  def index
    @counters = Counter.all
  end

  def new
    new_counter = Counter.new
    new_counter.name = "Counter #{Counter.count + 1}"
    new_counter.save
    redirect_to "/" and return
  end

  def update
    counter = Counter.find(params[:id])
    counter.count += case params[:count]
      when "up"
        1
      when "down"
        -1
      else
        0
    end
    counter.save
    redirect_to "/" and return
  end

  def destroy
    counter = Counter.find(params[:id])
    counter.delete
    redirect_to "/" and return
  end
end
