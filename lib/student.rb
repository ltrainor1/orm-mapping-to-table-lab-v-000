class Student

attr_accessor :name, :grade
attr_reader :name

def initialize(name, grade, id = nil)
  @name = name
  @grade = grade
  @id = id
end

def self.create_table
  sql = <<-SQL
    CREATE TABLE IF NOT EXISTS students (
      id INTEGER PRIMARY KEY,
      name TEXT,
      grade TEXT
    )
    SQL
    DB[:conn].execute(sql)
end

def drop_table(table)
  sql = "DROP TABLE #{table}"
  DB[:conn].execute(sql)
end

def save(student)
  sql = "INSERT INTO students (name, grade) VALUES(?,?)", student.name, student.grade
  DB[:conn].execute(sql)
end

end
