class InvitationsController < ApplicationController
  # GET /invitations
  # GET /invitations.json
  def index
    @invitations = Invitation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @invitations }
    end
  end

  # GET /invitations/1
  # GET /invitations/1.json
  def show
    @invitation = Invitation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @invitation }
    end
  end

  # GET /invitations/new
  # GET /invitations/new.json
  def new
    @course = Course.find(params[:course_id])
    @study_session = StudySession.find(params[:study_session_id])
    @invitation = Invitation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invitation }
    end
  end

  # GET /invitations/1/edit
  def edit
    @invitation = Invitation.find(params[:id])
  end

  # POST /invitations
  # POST /invitations.json
  def create
    @course = Course.find(params[:course_id])
    @study_session = StudySession.find(params[:study_session_id])
    
    @invitation = Invitation.new(params[:invitation])
    @invitation.update_attributes(:study_session_id => @study_session.id)
    
    @u = User.find(params[:invitation][:user_id])
    alreadyThere = !@study_session.users.find(@u).nil?
    
    respond_to do |format|
      if alreadyThere
        format.html { redirect_to new_course_study_session_invitation_path(@study_session.course, @study_session), notice: 'This person was already invited to the study session' }
        format.json { render json: "This person was already invited to the study session", status: :unprocessable_entity }
      elsif @invitation.save
        format.html { redirect_to [@invitation.study_session.course, @invitation.study_session], notice: 'Invitation was successfully created.' }
        format.json { render json: @invitation.id, status: :created, location: @invitation }
      else
        format.html { render action: "new" }
        format.json { render json: @invitation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /invitations/1
  # PUT /invitations/1.json
  def update
    @invitation = Invitation.find(params[:id])

    respond_to do |format|
      if @invitation.update_attributes(params[:invitation])
        format.html { redirect_to @invitation, notice: 'Invitation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @invitation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invitations/1
  # DELETE /invitations/1.json
  def destroy
    @invitation = Invitation.find(params[:id])
    @invitation.destroy

    respond_to do |format|
      format.html { redirect_to invitations_url }
      format.json { head :no_content }
    end
  end
end
