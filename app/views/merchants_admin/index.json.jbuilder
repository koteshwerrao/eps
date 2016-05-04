json.array!(@colleges) do |college|
  json.extract! college, :id, :student_name, :number, :address, :ph_no
  json.url college_url(college, format: :json)
end
