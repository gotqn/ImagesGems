json.array!(@demo_gems) do |demo_gem|
  json.extract! demo_gem, :id, :name, :description, :image, :github, :rubygems, :code
  json.url demo_gem_url(demo_gem, format: :json)
end
