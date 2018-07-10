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

    response = Unirest.post("http://localhost:3000/api/contacts/",
        parameters: {
          input_first_name: params['input_first_name'],
          input_middle_name: params['input_middle_name'],
          input_last_name: params['input_last_name'],
          input_bio: params['input_bio'],
          input_email: params['input_email'],
          input_phone_number: params['input_phone_number']
        })
    @contact = response.body
    # render 'show.html.erb'
    redirect_to "/client/contacts/#{params['id']}"
  end

  def show
    # get info from single product
    contact_id = params[:id]
    response = Unirest.get("localhost:3000/api/contacts/#{contact_id}")
    @contact = response.body
    # send to show page
    render 'show.html.erb'
  end

  def edit
    # gets info from single product
    contact_id = params[:id]
    response = Unirest.get("localhost:3000/api/contacts/#{contact_id}")
    @contact = response.body
    # sends it to a form page
    render 'edit.html.erb'
  end

  def update
    # updates info from form page
    contact_id = params[:id]
    response = Unirest.patch("http://localhost:3000/api/contacts/#{contact_id}",
      parameters: {
        input_first_name: params[:input_first_name],
        input_middle_name: params[:input_middle_name],
        input_last_name: params[:input_last_name],
        input_bio: params[:input_bio],
        input_email: params[:input_email],
        input_phone_number: params[:input_phone_number]
      })
    @contact = response.body
    render 'show.html.erb'
  end

  def destroy
    # sends delete request to api with specific id
    contact_id = params[:id]
    Unirest.delete("http://localhost:3000/api/contacts/#{contact_id}")
    render 'destroy.html.erb'
  end
end
