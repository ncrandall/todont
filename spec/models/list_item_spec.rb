require 'spec_helper'

describe ListItem do

	before { @list_item = ListItem.new(:title => "take out the trash", :done => false)}
	subject { @list_item }

  # attributes
	it { should respond_to :title }
	it { should respond_to :done }
	it { should be_valid }

  # validations
  describe "title must exist" do
  	before { @list_item.title = "" }
  	it { should_not be_valid }
  end

  describe "title must be limited to 140 chars" do
  	before { @list_item.title = "a" * 141 }
  	it { should_not be_valid }
  end

  # methods

end
