json.extract! course, :id, :title, :content, :slug, :user_id, :level_id, :material_id, :created_at, :updated_at
json.url course_url(course, format: :json)
