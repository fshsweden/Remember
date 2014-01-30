class PeopleController < ApplicationController

	before_filter :authenticate_user!, :except => [:index, :show]

	# GET /people
	# GET /people.json
	def index
		@people = search(params[:search])
		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @people }
		end
	end

	def search
		if params[:search] && params[:search] != ""
			@people = Person.where("name LIKE '#{params[:search]}' or surname LIKE '#{params[:search]}'").page(params[:page])
			render 'index'
		else
			@people = Person.order(:surname, :name).page(params[:page])
			render 'index'
		end
	end

	# GET /people/1
	# GET /people/1.json
	def show
		@person = Person.find(params[:id])

		# current_user can very well be NIL
		#logger.info "Current user is:" + current_user.id.to_s
		#logger.info "Looking for Person: " + @person.id.to_s + " (" + @person.fullname + ")"

		session[:current_person] = @person.id

		#
		#
		#
		c       = Click.find_by_person_id(@person.id)
		if c != nil
			c.count = c.count+1
		else
			c = Click.new(:person_id => @person.id, :count => 1)
		end
		c.save!

		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @person }
		end
	end

	# GET /people/new
	# GET /people/new.json
	def new
		@person = Person.new
		#@person.admins << current_user

		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @person }
		end
	end

	# GET /people/1/edit
	def edit
		@person = Person.find(params[:id])
	end

	# POST /people
	# POST /people.json
	def create
		@person = Person.new(params[:person])
		#@person.admins << current_user
		logger.info @person.inspect

		respond_to do |format|
			if @person.save
				c = Action.new(:person_id => @person.id, :comment => 'Created')
				c.save!

				format.html { redirect_to @person, notice: 'Person was successfully created.' }
				format.json { render json: @person, status: :created, location: @person }
				format.js
			else
				format.html { render action: "new" }
				format.json { render json: @person.errors, status: :unprocessable_entity }
				format.js { render action: "create_error", :locals => {:text => "Could not save!"} }
			end
		end
	end

	# PUT /people/1
	# PUT /people/1.json
	def update
		@person = Person.find(params[:id])

		logger.info "+++++++Debugging:"+params[:person].inspect

		respond_to do |format|
			if @person.update_attributes(params[:person])

				c = Action.find_by_id(@person.id)
				if c != nil
				else
					c = Action.new(:person_id => @person.id, :comment => 'Updated')
				end
				c.save!

				format.html { redirect_to @person, notice: 'Person was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: "edit" }
				format.json { render json: @person.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /people/1
	# DELETE /people/1.json
	def destroy
		@person = Person.find(params[:id])
		@person.destroy

		respond_to do |format|
			format.html { redirect_to people_url }
			format.json { head :no_content }
		end
	end






	def add_story

		logger.info params.inspect
		@person = Person.find(params[:person_id])

	end
end
