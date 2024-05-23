require_relative "./seeder_base.rb"
class ProductSeeder < SeederBase

    def initialize
        super()
        if User.all.empty?
            puts "Users need to be seeded before staging Product seeds"
            exit
        end
        @all = []
        stage_seeds("Products")
    end

    private
    def generate_seed
            product = Product.new(
            user_id: User.all.sample.id,
            title: Faker::Commerce.product_name,
            description: Faker::Lorem.paragraph,
            category: Faker::Commerce.department,
            price: Faker::Commerce.price(range: 0..10.0, as_string: true),
            condition: [
                "Good", 
                "Like new", 
                "New", "
                Refurbished", 
                "Fair", 
                "New with defects", 
                "For parts, 
                not working", 
                "Used"
            ].sample,
            tags: Faker::Commerce.department(max: rand(1...5)),
        )
        product
    end

end