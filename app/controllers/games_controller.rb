class GamesController < ApplicationController
  # GET /games
  # GET /games.json
  def index
    @user = User.find(params[:user_id])
    @games = @user.games.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @games }
    end
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @user = User.find(params[:user_id])    
    @game = @user.games.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @game }
    end
  end

  # GET /games/new
  # GET /games/new.json
  def new
    @user = User.find(params[:user_id])
    @game = @user.games.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @game }
    end
  end

  # GET /games/1/edit
  def edit
    @user = User.find(params[:user_id])
    @game = @user.games.find(params[:id])
  end

  # POST /games
  # POST /games.json
  def create
    @user = User.find(params[:user_id])
    @game = @user.games.new(params[:game])

    respond_to do |format|
      if @game.save
        format.html { redirect_to user_game_path(@user,@game), :notice => 'Game was successfully created.' }
        format.json { render :json => @game, :status => :created }
      else
        format.html { render :action => "new" }
        format.json { render :json => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /games/1
  # PUT /games/1.json
  def update
    @user = User.find(params[:user_id])
    @game = @user.games.find(params[:id])

    respond_to do |format|
      if @game.update_attributes(params[:game])
        format.html { redirect_to user_game_path(@user,@game), :notice => 'Game was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @user = User.find(params[:user_id])
    @game = @user.games.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to user_games_url(@user) }
      format.json { head :ok }
    end
  end
end
