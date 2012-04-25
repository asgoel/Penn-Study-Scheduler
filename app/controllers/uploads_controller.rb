include Icalendar

class UploadsController < ApplicationController
  # GET /uploads
  # GET /uploads.json
  def index
    @uploads = Upload.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @uploads }
    end
  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
    @upload = Upload.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @upload }
    end
  end

  # GET /uploads/new
  # GET /uploads/new.json
  def new
    @upload = Upload.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @upload }
    end
  end

  # GET /uploads/1/edit
  def edit
    @upload = Upload.find(params[:id])
  end

  # POST /uploads
  # POST /uploads.json
  def create
    @upload = Upload.new(params[:upload])
    @upload.save
    i = params[:upload].delete("user_id")
    @user = User.find(i)
    @user.registrations.each do |r|
      r.destroy
    end
    @user.update_attributes(:schedule => params[:schedule])
    cal_file = File.open(@upload.schedule.path)
    
    cals = Icalendar.parse(cal_file)
    cal = cals.first
    events = cal.events
    checked_events = Array.new
    events.each do |e| 
      name = e.summary
      if !checked_events.include?(name)
        checked_events << name
        dept = name[0..3].strip
        secondpart = name[4..9]
        number = secondpart[0..2]
        number = Integer(number)
        section = secondpart[3..5]
        @old_course = Course.find_by_department_and_number_and_section(dept, number, section)
        if @old_course == nil
              @course = Course.new(:department => dept, :number => number, :section => section)
              @registration = Registration.new({:user => @user, :course => nil})
                    if @course.save && @registration.save
                      puts 'saved'
                      @registration.update_attributes(:course => @course)
                    end
        else
          @registration=Registration.new({:user => @user, :course => nil})
          if @registration.save
            @registration.update_attributes(:course => @old_course)
          end
        end
      end
     end  
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to registrations_path, notice: 'Schedule was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
   end

  # PUT /uploads/1
  # PUT /uploads/1.json
  def update
    @upload = Upload.find(params[:id])

    respond_to do |format|
      if @upload.update_attributes(params[:upload])
        format.html { redirect_to @upload, notice: 'Upload was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy

    respond_to do |format|
      format.html { redirect_to uploads_url }
      format.json { head :no_content }
    end
  end
end
