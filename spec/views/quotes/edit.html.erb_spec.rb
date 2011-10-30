require 'spec_helper'

describe "quotes/edit.html.erb" do
  before(:each) do
    @quote = assign(:quote, stub_model(Quote,
      :body => "MyText",
      :reference => "MyString",
      :remark => "MyText"
    ))
  end

  it "renders the edit quote form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => quotes_path(@quote), :method => "post" do
      assert_select "textarea#quote_body", :name => "quote[body]"
      assert_select "input#quote_reference", :name => "quote[reference]"
      assert_select "textarea#quote_remark", :name => "quote[remark]"
    end
  end
end
