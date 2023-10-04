class ApplicantsController < ApplicationController
  def savedata
    # xlsx_controller = XlsxController.new
    # data=xlsx_controller.tojson[0]
    uri = URI('http://localhost:3000/xlsx/tojson')
    response = Net::HTTP.get(uri)

    data = JSON.parse(response)[0]


    # json_data = render_to_string(controller: 'xlsx', action: 'tojson')[0]
    # data = JSON.parse(json_data)[0]
    applicant=Applicant.create(
      application_cas_id: data["cas_id"],
      application_name: data["Combined name"],
      application_gender: data['gender'],
      application_citizenship_country: data['citizenship_country_name'],
      application_dob: data['1990-07-26'],
      application_email: data['email'],
      application_degree: data['Applied Degree'],
      application_submitted: data['designation_submitted_date_0'],
      application_status: data['application_status_0'],
      application_research: 'research_interests111111',
      application_faculty: 'faculty_name'
    )

    applicant.create_toefl(
      listening: data["toefl"]["listening"],
      reading: data["toefl"]["reading"],
      result: data["toefl"]["result"],
      speaking: data["toefl"]["speaking"],
      writing: data["toefl"]["writing"]
    )

    applicant.create_gre(
      quantitative_scaled: data["gre"]["quantitativeScaled"],
      quantitative_percentile: data["gre"]["quantitativePercentile"],
      verbal_scaled: data["gre"]["verbalScaled"],
      verbal_percentile: data["gre"]["verbalPercentile"],
      analytical_scaled: data["gre"]["analyticalScaled"],
      analytical_percentile: data["gre"]["analyticalPercentile"]
    )

    render json: { message: "Application data saved successfully" }
  end
end
