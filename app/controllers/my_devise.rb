include Icalendar
class MyDevise::RegistrationsController < Devise::RegistrationsController

  def upload
    @user = User.find(params[:user_id])
    @user.update_attributes(:registrations => nil)
    cal_file = File.open(@user.schedule.url)
    cals = Icalendar.parse(cal_file)
    cal = cals.first
    events = cal.events
    checked_events = []
    events.each do |e| 
      name = e.summary
      if !events.include?(name)
        events << name
        parts = name.split
        dept = parts[0]
        number = Integer(parts[1][0..2])
        section = parts[1][3..5]
        @old_course = Course.find_by_department_and_number_and_section(dept, number, section)
        if @old_course == nil
              @course = Course.new(:department => dept, :number => number, :section => section, :admin => false)
              @registration = Registration.new({:user => @user, :course => nil})
                    if @course.save && @registration.save
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
        format.html { redirect_to registrations_path(@user), notice: 'Schedule was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
   end
end