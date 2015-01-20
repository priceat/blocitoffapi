require "spec_helper"



describe "/api/lists", :type => :api do
  let(:user) { FactoryGirl.create(:user) }
  let(:token) { user.authentication_token }

   #before do
    #@list = create(:list)
    #user.permissions.create!(:action => "view", :thing => @list)
  #end

  context "projects viewable by this user" do
    let (:url) { "/api/lists" }
    it "json" do
      get "#{url}.json", :token => token

      lists_json = Lists.all.to_json
      last_response.body.should eql(project_json)
      last_response.status.should eql(200)

      lists = JSON.parse(last_response.body)

      lists.any? do |l|
        l["name"] == list.name
      end.should be_true
    end
  end
end