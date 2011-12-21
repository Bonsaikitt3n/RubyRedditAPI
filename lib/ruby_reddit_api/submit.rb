# @author Justin Lewis
module Reddit
  class Submit < Base

    def initialize()

    end
    # Submit a story
    # @return [true,false]
    def submit_story(title,url,subreddit)
      unless throttled?
        resp = self.class.post("/api/submit", {:body => {:title => title, :url => url, :uh => modhash, :sr => subreddit, :kind => "link"}, :headers => base_headers, :debug_output => @debug })
        resp.code == 200
      end
    end
  end
end
