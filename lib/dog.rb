class Dog

    attr_accessor :name, :breed, :id

    def initialize(id: nil, name:, breed:)
        
        @name = name
        @breed = breed
    end

    def self.create_table
        sql = <<-SQL
    CREATE TABLE IF NOT EXISTS dogs (
      id INTEGER PRIMARY KEY,
      name TEXT,
      breed TEXT
    )
    SQL
    DB[:conn].execute(sql)
    end

    def self.drop_table

        sql = "DROP TABLE dogs"
        DB[:conn].execute(sql)

    end

    def save
        if self.id
            self.update
        else
        sql = <<-SQL
      INSERT INTO dogs (name, breed) 
      VALUES (?, ?)
    SQL

   DB[:conn].execute(sql, self.name, self.breed)
  
        end
        self
    end

    def self.create(name:, breed:)
        dog = Dog.new(name, breed)
        dog.save
        dog
    


    end



end