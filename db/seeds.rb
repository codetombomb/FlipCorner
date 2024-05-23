require_relative './seeders/seeder_base.rb'
require_relative './seeders/user_seeder.rb'
require_relative './seeders/product_seeder.rb'

SeederBase.from_db_delete("User")
SeederBase.from_db_delete("Products")

user_seeder = UserSeeder.new
user_seeder.persist_staged_seeds
product_seeder = ProductSeeder.new
product_seeder.persist_staged_seeds
debugger




