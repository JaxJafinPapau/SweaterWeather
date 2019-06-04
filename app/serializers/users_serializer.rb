class UsersSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id,
             :api_key
end
