class BackgroundsSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id,
             :backgrounds
end
