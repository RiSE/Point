class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.xml
  before_filter :require_user
  def index
    @tasks = Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.xml
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.xml
  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.xml
  def create
    @task = Task.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to(@task, :notice => 'Task was successfully created.') }
        format.xml  { render :xml => @task, :status => :created, :location => @task }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.xml
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to(@task, :notice => 'Task was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.xml
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to(tasks_url) }
      format.xml  { head :ok }
    end
  end

  def example_start
    # initialize counter
    session[:counter] = 0

    # initialize stop loop variable
    session[:stop_timer] = false
    render :update do |page|

      # update the status
      page.replace_html 'example_use_me', 'Starting....'
      # disable the button

      page << "document.getElementById('example_submit_button').disabled = true;"
      # start the timer
      page << "example_initialize_polling(300);"
      # highlight the updated div - so client notices

      page.visual_effect :highlight, 'example_use_me'
    end
  end

  def example_stop
    # change our conditional stop loop variable
    session[:stop_timer] = true

    render :update do |page|
      # enable the button
      page << "document.getElementById('example_submit_button').disabled = false;"

    end
  end

  def update_example_status

    # count
    session[:counter] += 1
    render :update do |page|

      if session[:stop_timer] == false
        # update the status
        page.replace_html 'example_use_me', "Im Counting. At: #{session[:counter]}"

        # restart the timer
        page << "example_initialize_polling(300);"
      else
        page.replace_html 'example_use_me', "Stopping.... reached: #{session[:counter]} "

        # highlight the updated div - so client notices
        page.visual_effect :highlight, 'example_use_me'
      end

    end
  end

  def todo
    @tasks = Task.find_all_by_status('To Do')

    respond_to do |format|
      format.html # todo.html.erb
      format.xml  { render :xml => @tasks }
    end
  end

  def doing
    @tasks = Task.find_all_by_status('Doing')

    respond_to do |format|
      format.html # doing.html.erb
      format.xml  { render :xml => @tasks }
    end
  end

  def done
    @tasks = Task.find_all_by_status('Done')

    respond_to do |format|
      format.html # done.html.erb
      format.xml  { render :xml => @tasks }
    end
  end

end

