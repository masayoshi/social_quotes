require 'spec_helper'

describe "quotes/new.html.erb" do
  before(:each) do
    assign(:quote, stub_model(Quote,
      :body => "MyText",
      :reference => "MyString",
      :remark => "MyText"
    ).as_new_record)
  end

  it "renders new quote form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => quotes_path, :method => "post" do
      assert_select "textarea#quote_body", :name => "quote[body]"
      assert_select "input#quote_reference", :name => "quote[reference]"
      assert_select "textarea#quote_remark", :name => "quote[remark]"
    end
  end
end
