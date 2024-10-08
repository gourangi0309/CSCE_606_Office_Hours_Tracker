class AttendancesController < ApplicationController
    require "csv"

    def export_csv
      # Send the generated CSV file to the user
      send_data Attendance.to_csv, filename: "attendance_report.csv"
    end

    def mark
      email = params[:email]
      user = User.find_by(email: email)  # Assuming User is the model associated with the user

      if user
        # Save the attendance record
        Attendance.create(user_id: user.id, sign_in_time: Time.now)

        flash[:notice] = "Attendance marked successfully!"
      else
        flash[:alert] = "User not found!"
      end

      redirect_to user_path(@current_user), notice: flash[:notice] || "Attendance marking failed."
    end
end
