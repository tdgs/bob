module Bob
  class Job
    attr_accessor :name, :url, :description, :extra_info,
      :company_name, :company_logo, :company_url

    def initialize(opts = {})
      @name = opts[:name]
      @url = opts[:url]
      @company_name = opts[:company_name]
      @company_url = opts[:company_url]
      @company_logo = opts[:company_logo]
      @description = opts[:description]
      @extra_info = opts[:extra_info]
    end
  end
end
