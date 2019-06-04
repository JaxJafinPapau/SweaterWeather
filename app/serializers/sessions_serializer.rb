class SessionsSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id,
             :api_key
end
