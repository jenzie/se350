class ThoughtsController < ApplicationController
  # GET /thoughts
  # GET /thoughts.json
  def index
	@thinkers = Thinker.all
	load_active_thinker
	
	#Depending on our filter, show different thoughts
	params[:show] && session[:show] = params[:show] #if params[:show] is nil, don't assign
	if session[:show] == 'following'
	then
		@thoughts = Thought.joins(:thinker => :followed).where(:follows => {:follower_id => @active_thinker.id})
	elsif session[:show] == 'popular'
	     #Show all thoughts with at least one thumb, sorted by number of thumbs descendingly
          @thoughts = Thought.joins(:thumbs).group(:thought).order("count(*) DESC")
    else
		@thoughts = Thought.all
	end
	
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @thoughts }
    end
  end

  # GET /thoughts/1
  # GET /thoughts/1.json
  def show
    @thought = Thought.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @thought }
    end
  end

  # GET /thoughts/new
  # GET /thoughts/new.json
  def new
    @thought = Thought.new
    
    load_active_thinker

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @thought }
    end
  end

  # GET /thoughts/1/edit
  def edit
    @thought = Thought.find(params[:id])
  end

  # POST /thoughts
  # POST /thoughts.json
  def create
    load_active_thinker
    @thought = Thought.new(params[:thought])
	@thought.thinker = @active_thinker
	
    respond_to do |format|
      if @thought.save
        format.html { redirect_to @thought, notice: 'Thought was successfully created.' }
        format.json { render json: @thought, status: :created, location: @thought }
      else
        format.html { render action: "new" }
        format.json { render json: @thought.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /thoughts/1
  # PUT /thoughts/1.json
  def update
    @thought = Thought.find(params[:id])

    respond_to do |format|
      if @thought.update_attributes(params[:thought])
        format.html { redirect_to @thought, notice: 'Thought was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @thought.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /thoughts/1
  # DELETE /thoughts/1.json
  def destroy
    @thought = Thought.find(params[:id])
    @thought.destroy

    respond_to do |format|
      format.html { redirect_to thoughts_url }
      format.json { head :ok }
    end
  end
  
  # Change the active user
  # POST /thoughts/activate_thinker/1
  def activate_thinker
  	session[:active_thinker] = params[:active_thinker][:id]
    @active_thinker = Thinker.find(params[:active_thinker][:id])
    
    respond_to do |format|
      format.html { redirect_to :action => 'index' }
      format.json { render json: @thoughts }
    end
  end
  
  def load_active_thinker
  	begin
  		@active_thinker ||= Thinker.find(session[:active_thinker])
  	rescue 
  		@active_thinker = nil
  	end
  	@active_thinker ||= Thinker.last
  end

  def thumbup
  	load_active_thinker
  	Thumb.create({thought_id: params[:thought][:id], thinker: @active_thinker})	

  	respond_to do |format|
      format.html { redirect_to :action => 'index' }
      format.json { render json: @thoughts }
    end
  end

end
