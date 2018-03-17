class Student

attr_accessor :name, :grade
attr_reader :id

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

def self.drop_table
  sql = "DROP TABLE students"
  DB[:conn].execute(sql)
end

def save
  sql = "INSERT INTO students (name, grade) VALUES(?,?)"
  DB[:conn].execute(sql, self.name, self.grade)
  @id = DB[:conn].execute("SELECT MAX(id) FROM students")[0].text
end

end
