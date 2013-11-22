# spec/models/contact.rb
require 'spec_helper'

describe Person do

	#
	# Howto add user authentication? Only the Person's ADMIN can do this!
	#
	it "logged_on user can add an event" do

		# sign_in FactoryGirl.create(:user)

		@person = FactoryGirl.create :person
		@person.should be_valid

		@person.add_event(
			{
				:name => 'birth',
				:comment => '',
				:date => '2013-12-24',
				:person => @person
			})

		# check state
		@person.events.size.should == 1
		@person.find_event('birth').date.should == '2013-12-24'
		@person.find_event('birth').comment.should == ''
	end

	it "can add several event" do

		@person = FactoryGirl.create :person
		@person.should be_valid

		@person.add_event(

			{
				:name => 'birth',
				:comment => '',
				:date => '1983-12-24',
				:person => @person
			})

		@person.add_event(
			{
				:name => 'death',
				:comment => '',
				:date => '2013-12-24',
				:person => @person
			})

		# check state
		@person.events.size.should == 2
		@person.find_event('birth').date.should == '1983-12-24'
		@person.find_event('birth').comment.should == ''
		@person.find_event('death').date.should == '2013-12-24'
		@person.find_event('death').comment.should == ''
	end

	it "can add a story" do
		@person = FactoryGirl.create :person
		@person.should be_valid

		@person.add_story({
			:title	=> 'A funny story',
			:content=> 'I remember when I was...',
			:person_id	=> @person})

		@person.stories.size.should == 1
	end

	it "can remove a story" do

	end

end
