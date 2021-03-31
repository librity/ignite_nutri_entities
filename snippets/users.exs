# Create a user
user_params = %{
  "name" => "Jules",
	"email" => "bad@mother.fff",
	"cpf" => "12345678910"
}
Nutri.Users.Create.call(user_params)

# Invalid user
bad_params = %{
  "name" => "Jules",
	"email" => "badmother.fff",
	"cpf" => "1234567891"
}
Nutri.Users.Create.call(bad_params)
