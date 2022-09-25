namespace :list do
  desc "List the IDs for each offset"
  task offset_ids: :environment do
    message = ""
    offset = 0
    data = Stuff.order(:name).limit(10).offset(offset)

    until data.blank?
      message << "Offset #{offset}: #{data.ids}\n"
      offset += 10
      data = Stuff.order(:name).limit(10).offset(offset)
    end;nil

    puts message
  end
end
