module Bob
  class Job
    attr_accessor :name, :url, :description, :extra_info

    def initialize(opts = {})
      @name = opts[:name]
      @url = opts[:url]
      @description = opts[:description]
      @extra_info = opts[:extra_info]
    end
  end
end
