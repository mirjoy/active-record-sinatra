class StatusGenerator
  def self.evaluate(task)
    if task.id
      [200, "successful"]
    elsif task.errors[:title].include?("can't be blank")
      [404, "title can't be blank"]
    elsif task.errors[:title].include?("has already been taken")
      [302, "title has already been taken"]
    end
  end
end
