module Import
  extend ActiveSupport::Concern
 
  CSV_HEADER = ['last_name', 'first_name', 'last_kana', 'first_kana', 'school_year_id', 'school_class_id', 'gender_id', 'school_id', 'number', 'nursing_teacher_id']
 
  # 一括登録で使用するuser配列
  students = []
 
  # 画面に返すエラー
  errors = []
 
  # CSVを1行ずつ解析する
  CSV.foreach(file.path, headers: true, skip_blanks: true).with_index(2) do |row, row_number|
   
   student = Student.new
 
   # CSV_HEADERのキーを基に、hashに変換する
   student.attributes = row.to_hash.slice(*CSV_HEADER.keys)
 
   if student.valid?
     students << student
   else
     errors.push({:row_num => row_number, :messages => student.errors.full_messages})
   end
 
  return errors if errors.present?
 
  # 一括登録
  Student.import students
 
  return []
  
  end
end