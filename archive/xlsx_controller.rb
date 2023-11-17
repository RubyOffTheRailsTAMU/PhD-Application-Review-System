class XlsxController < ApplicationController
    def tojson
  
      excel = Roo::Excelx.new(Rails.root.join('Dummy_data.xlsx'))
      excel.default_sheet = excel.sheets.first
  
      header = excel.row(1)
      data = []
  
      2.upto(excel.last_row) do |line|
        data << Hash[header.zip(excel.row(line))]
      end
  
      processedData=processData(data)
  
      File.write(Rails.root.join('dummyData.json'), processedData.to_json)
      render json: processedData
    end
  
    def processData(data)
      schools=['0','1','2']
  
      data.each do |person|
        # Change the type of cas_id to string
        person['cas_id']=person['cas_id'].to_i.to_s
  
        person['school']=[]
  
        schools.each do |school|
          if person['gpas_by_transcript_school_name_'+school]!=nil
            schoolInfo={}
            schoolInfo['name']=person['gpas_by_transcript_school_name_'+school]
            schoolInfo['level']=person['gpas_by_transcript_school_level_'+school]
            schoolInfo['qualityPoints']=person['gpas_by_transcript_quality_points_'+school]
            schoolInfo['GPA']=person['gpas_by_transcript_gpa_'+school]
            schoolInfo['creditHours']=person['gpas_by_transcript_credit_hours_'+school]
            person['school'].push(schoolInfo)
          end
        end
  
        person['gre']={}
        person['gre']['quantitativeScaled']=person['gre_quantitative_scaled']
        person['gre']['quantitativePercentile']=person['gre_quantitative_percentile']
        person['gre']['verbalScaled']=person['gre_verbal_scaled']
        person['gre']['verbalPercentile']=person['gre_verbal_percentile']
        person['gre']['analyticalScaled']=person['gre_analytical_scaled']
        person['gre']['analyticalPercentile']=person['gre_analytical_percentile']
  
        person['ielts']={}
        person['ielts']['reading']=person['ielts_reading_score']
        person['ielts']['writing']=person['ielts_writing_score']
        person['ielts']['listening']=person['ielts_listening_score']
        person['ielts']['speaking']=person['ielts_speaking_score']
        person['ielts']['overall']=person['ielts_overall_band_score']
  
        person['toefl']={}
        person['toefl']['listening']=person['toefl_ibt_listening']
        person['toefl']['reading']=person['toefl_ibt_reading']
        person['toefl']['result']=person['toefl_ibt_result']
        person['toefl']['speaking']=person['toefl_ibt_speaking']
        person['toefl']['writing']=person['toefl_ibt_writing']
  
        if person['Applied Degree']=='Computer Engineering'
          person['research_areas']={}
          person['research_areas']['firstChoice']=person['custom_questions_6110713646751957645_below_are_the_research_areas_please_choice_your_first_choice_or_none']
          person['research_areas']['secondChoice']=person['custom_questions_7865888513109191199_below_are_the_research_areas_please_choose_your_second_choice_or_none']
          person['research_areas']['thirdChoice']=person['custom_questions_8141472238696201795_below_are_the_research_areas_please_choose_your_third_choice_or_none']
  
          person['interested_faculties']=[]
          person.each do |key,value|
  
            if key.start_with?("custom_questions_8197256583460761100_please_identify_the_faculty_you_are_interested_in_doing_research_with_2_names_recommended_select_all_that_apply_") && value!=nil
              if value=='Other' && person['custom_questions_6168456734222347809_if_you_chose_other_please_list_the_name_of_the_faculty_member']!=nil
                otherAdvisors=person['custom_questions_6168456734222347809_if_you_chose_other_please_list_the_name_of_the_faculty_member'].split(/\n /)
                otherAdvisors.each do |advisor|
                  person['interested_faculties'].push(advisor)
                end
              else
                person['interested_faculties'].push(value)
              end
  
            end
          end
  
        end
  
        if person['Applied Degree']=='Computer Science'
          person['research_areas']={}
          person['research_areas']['firstChoice']=person['custom_questions_6942390792507652217_below_are_the_research_areas_please_choice_your_first_choice_or_none']
          person['research_areas']['secondChoice']=person['custom_questions_8781135533764607742_below_are_the_research_areas_please_choose_your_second_choice_or_none']
          person['research_areas']['thirdChoice']=person['custom_questions_2141187173743149604_below_are_the_research_areas_please_choose_your_third_choice_or_none']
  
          person['interested_faculties']=[]
          person.each do |key,value|
  
            if key.start_with?("custom_questions_4381114538874729882_please_identify_the_faculty_you_are_interested_in_doing_research_with_2_names_recommended_select_all_that_apply_") && value!=nil
              if value=='Other' && person['custom_questions_33951003881150694_if_you_chose_other_please_list_the_name_of_the_faculty_member']!=nil
                otherAdvisors=person['custom_questions_33951003881150694_if_you_chose_other_please_list_the_name_of_the_faculty_member'].split(/\n /)
                otherAdvisors.each do |advisor|
                  person['interested_faculties'].push(advisor)
                end
              else
                person['interested_faculties'].push(value)
              end
  
            end
          end
        end
  
        # person['CEQuestions']={}
        # person.each do |key,value|
  
        #   if key.start_with?("custom_questions_6110713646751957645_below_are_the_research_areas_please_choice_your_first_choice_or_none") ||
        #     key.start_with?("custom_questions_7865888513109191199_below_are_the_research_areas_please_choose_your_second_choice_or_none") ||
        #     key.start_with?("custom_questions_8141472238696201795_below_are_the_research_areas_please_choose_your_third_choice_or_none") ||
        #     key.start_with?("custom_questions_8197256583460761100_please_identify_the_faculty_you_are_interested_in_doing_research_with_2_names_recommended_select_all_that_apply_") ||
        #     key.start_with?("custom_questions_6168456734222347809_if_you_chose_other_please_list_the_name_of_the_faculty_member")
        #     person['CEQuestions'][key]=value
        #   end
        # end
  
  
        #   person['CSQuestions']={}
        #   person.each do |key,value|
  
        #     if key.start_with?("custom_questions_6942390792507652217_below_are_the_research_areas_please_choice_your_first_choice_or_none") ||
        #       key.start_with?("custom_questions_8781135533764607742_below_are_the_research_areas_please_choose_your_second_choice_or_none") ||
        #       key.start_with?("custom_questions_2141187173743149604_below_are_the_research_areas_please_choose_your_third_choice_or_none") ||
        #       key.start_with?("custom_questions_4381114538874729882_please_identify_the_faculty_you_are_interested_in_doing_research_with_2_names_recommended_select_all_that_apply_") ||
        #       key.start_with?("custom_questions_33951003881150694_if_you_chose_other_please_list_the_name_of_the_faculty_member")
        #       person['CSQuestions'][key]=value
        #     end
        # end
  
      end
  
      return data
    end
  end
  