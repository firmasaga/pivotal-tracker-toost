module StaleFishFixtures
  class << self

    def update_projects_fixture
      connection["/projects"].get
    end

    def update_project_fixture
      connection["/projects/59022"].get
    end

    def update_stories_fixture
      connection["/projects/59022/stories?limit=20"].get
    end

    def update_memberships_fixture
      connection["/projects/59022/memberships"].get
    end

    def update_tasks_fixture
      connection["/projects/59022/stories/2606200/tasks"].get
    end

    def update_activity_fixture
      connection["/activities"].get
    end

    def update_project_activity_fixture
      connection["/projects/59022/activities"].get
    end

    def create_new_story
      connection["/projects/59022/stories"].post("<story><name>Create stuff</name></story>", :content_type => 'application/xml')
    end

    protected

      def connection
        @connection ||= RestClient::Resource.new('http://www.pivotaltracker.com/services/v3', :headers => {'X-TrackerToken' => TOKEN, 'Content-Type' => 'application/xml'})
      end

  end
end
