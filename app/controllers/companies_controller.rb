class CompaniesController < ApplicationController

  def index
    # find all Company rows
    @companies = Company.all
    # render companies/index view
  end

  def show
    # find a Company
    @company = Company.find_by({ "id" => params["id"] })
    @contacts = Contact.where({ "company_id" => @company["id"] })
    # render companies/show view with details about Company
  end

  def new
    # render view with new Company form
  end

  def create
    # start with a new Company
    @company = Company.new
    @company["name"] = params["name"]
    @company["city"] = params["city"]
    @company["state"] = params["state"]
    @company.save
    redirect_to "/companies"
    # assign user-entered form data to Company's columns
    # save Company row
    # redirect user
  end

  def edit
    # find a Company
    @company = Company.find_by({"id" => params["id"]})
    # render view with edit Company form
  end

  def update
    # find a Company
    @company = Company.find_by({"id" => params["id"]})

    # assign user-entered form data to Company's columns
    @company["name"] = params["name"]
    @company["city"] = params["city"]
    @company["state"] = params["state"]
    @company.save
    redirect_to "/companies/#{@company["id"]}"
    
    # save Company row
    # redirect user
  end

  # def destroy
  #   # find a Company
  #   # destroy Company row
  #   # redirect user
  # end

end
