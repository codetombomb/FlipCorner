require_relative './seeder_base'

class UserSeeder < SeederBase

    @@emails = ["gmail", "yahoo", "me", "icloud"]

    def initialize
        super()
        @all = []
        stage_seeds("User")
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