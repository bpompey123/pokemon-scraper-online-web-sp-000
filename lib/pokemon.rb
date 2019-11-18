class Pokemon
  attr_accessor :name, :type
  attr_reader :id, :db

  def initialize(id:, name:, type:, db:)
    @id= id
    @name= name
    @type= type
    @db= db
  end

  def save
    sql = <<-SQL
      INSERT INTO pokemon (name, album)
      VALUES (?, ?)
    SQL

    DB[:conn].execute(sql, self.name, self.album)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM songs")[0][0]
  end

  def self.find

  end
end
