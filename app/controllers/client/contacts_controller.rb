class Client::ContactsController < ApplicationController

  def index
    # get all contacts from api
    response = Unirest.get('localhost:3000/api/contacts')
    @contacts = response.body
    render 'index.html.erb'
  end

  def new
    #goes to form page
    render 'new.html.erb'
  end

  def create
    # sends create request to api
    render 'show.html.erb'
  end

  def show
    # get info from single product
    contact_id = params[:id]
    response = Unirest.get("localhost:3000/api/#{contact_id}")
    # send to show page
    render 'show.html.erb'
  end

  def edit
    # gets info from single product
    # sends it to a form page
    render 'edit.html.erb'
  end

  def update
    # updates info from form page
    render 'show.html.erb'
  end

  def destroy
    # sends delete request to api with specific id
    render 'destroy.html.erb'
  end
end
