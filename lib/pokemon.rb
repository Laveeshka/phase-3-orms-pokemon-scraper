class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(id: nil, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon
            (name, type)
            VALUES (?, ?)
            SQL
        db.execute(sql, name, type)
    end

    def self.find(id_val, db)
        sql = <<-SQL
            SELECT * 
            FROM pokemon 
            WHERE id = ?
        SQL
        row = db.execute(sql, id_val)[0]
        pokemon = Pokemon.new(id: row[0], name: row[1], type: row[2], db: db)
    end

end
