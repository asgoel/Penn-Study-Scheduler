class StudySessionsController < ApplicationController
  # GET /study_sessions
  # GET /study_sessions.json
  def index
    @study_sessions = StudySession.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @study_sessions }
    end
  end

  # GET /study_sessions/1
  # GET /study_sessions/1.json
  def show
    @study_session = StudySession.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @study_session }
    end
  end

  # GET /study_sessions/new
  # GET /study_sessions/new.json
  def new
    @study_session = StudySession.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @study_session }
    end
  end

  # GET /study_sessions/1/edit
  def edit
    @study_session = StudySession.find(params[:id])
  end

  # POST /study_sessions
  # POST /study_sessions.json
  def create
    @study_session = StudySession.new(params[:study_session])

    respond_to do |format|
      if @study_session.save
        format.html { redirect_to '/registrations', notice: 'Study session was successfully created.' }
        format.json { render json: '/registrations', status: :created, location: @study_session }
      else
        format.html { render action: "new" }
        format.json { render json: @study_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /study_sessions/1
  # PUT /study_sessions/1.json
  def update
    @study_session = StudySession.find(params[:id])

    respond_to do |format|
      if @study_session.update_attributes(params[:study_session])
        format.html { redirect_to @study_session, notice: 'Study session was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @study_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /study_sessions/1
  # DELETE /study_sessions/1.json
  def destroy
    @study_session = StudySession.find(params[:id])
    @study_session.destroy

    respond_to do |format|
      format.html { redirect_to study_sessions_url }
      format.json { head :no_content }
    end
  end
end
