class XlsxController < ApplicationController
  def tojson

    excel = Roo::Excelx.new('/home/felix/se/PhD-Application-Review-System/Dummy_data.xlsx')
    excel.default_sheet = excel.sheets.first

    header = excel.row(1)
    data = []

    2.upto(excel.last_row) do |line|
      data << Hash[header.zip(excel.row(line))]
    end

    processedData=processData(data)

    File.write('/home/felix/se/PhD-Application-Review-System/dummyData.json', processedData.to_json)
    render json: processedData
  end

  def processData(data)
    schools=['0','1','2']

    data.each do |person|
      person['school']=[]

      schools.each do |school|
        if person['gpas_by_transcript_school_name_'+school]!=nil
          schoolInfo={}
          schoolInfo['name']=person['gpas_by_transcript_school_name_'+school]
          schoolInfo['level']=person['gpas_by_transcript_school_level_'+school]
          schoolInfo['qualityPoints']=person['gpas_by_transcript_quality_points_'+school]
          schoolInfo['GPA']=person['gpas_by_transcript_gpa_'+school]
          schoolInfo['credieHours']=person['gpas_by_transcript_credit_hours_'+school]
          person['school'].push(schoolInfo)
        end
      end

    end
    return data
  end
end
