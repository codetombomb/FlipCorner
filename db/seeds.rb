require 'faker'

class Seeder

    attr_accessor :num_seeds
    def initialize(num_seeds=5)
        @num_seeds = num_seeds
    end

    def all
        @all
    end

    def clear_staged_all
        puts "Cleared seeds from staging array 🗑️"
        @all.clear
    end

    def stage_seeds
        puts "Staging seeds 🌱"
        @num_seeds.times do
            seed = self.generate_seed
            @all << seed
        end
    end

    def persist_staged_seeds
        @all.each do |seed|
            seed.save
        end
        puts "Persisted seeds 😌"
        clear_staged_all
        stage_seeds
    end

    def self.from_db_delete(model)
        
        case model
        when "User"
            puts "Deleting all Users in DB"
            User.destroy_all
        when "Products"
            puts "Deleting all Products in DB"
            Product.destroy_all
        else
            puts "Model does not exist"
        end
    end

    private
    def generate_fake(attribute)
        case attribute
            when "username"
                first_name = Faker::Name.first_name
                last_name = Faker::Name.last_name
                "#{first_name}.#{last_name}"
            when "profile_pic"
                Faker::Avatar.image
            else
                puts "Attribute does not exist"
        end
    end
end

class UserSeeder < Seeder

    @@emails = ["gmail", "yahoo", "me", "icloud"]

    def initialize
        super()
        @all = []
        stage_seeds
    end

    private
    
    def generate_seed
        username = generate_fake("username")
        user = User.new(
            username: generate_fake("username"),
            email: "#{username}@#{@@emails.sample}",
            password: "123",
            is_seller: [true, false].sample,
            profile_picture: generate_fake("profile_pic"),
            social_media_id: "@#{username}"
        )
        user
    end


end

user_seeder = UserSeeder.new

debugger




