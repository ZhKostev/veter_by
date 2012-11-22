Account.create!(:email => 'admin@admin.com', :password => 'admin@admin.com') if Account.with_email('admin@admin.com').blank?


def run_seeds(paths)
  paths.each do |path|
    puts "Loading db/seeds/#{path.split(File::SEPARATOR).last}"
    load(path)
  end
end

# Return array of arrays
# [
#   [<run first path>]
#   [<other path>]
# ]
def split_first_and_other_paths(all_file_paths, run_first_names)
  all_file_paths.partition do |name|
    run_first_names.any? do |selected_name|
      name =~ Regexp.new(selected_name)
    end
  end
end

run_first_names = ["roles"]

all_file_paths = Dir[Rails.root.join('db', 'seeds', '*.rb').to_s]
run_first_paths, other_paths = split_first_and_other_paths(all_file_paths, run_first_names)

run_seeds(run_first_paths)
run_seeds(other_paths)


