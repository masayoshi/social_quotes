require 'spec_helper'

describe "quotes/index.html.erb" do
  before(:each) do
    assign(:quotes, [
      stub_model(Quote,
        :body => "MyText",
        :reference => "Reference",
        :remark => "MyText"
      ),
      stub_model(Quote,
        :body => "MyText",
        :reference => "Reference",
        :remark => "MyText"
      )
    ])
  end

  it "renders a list of quotes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Reference".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
