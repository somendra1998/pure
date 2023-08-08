# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
 respond_to :json

 private

 def respond_with(resource, options={})
  if resource.persisted?
    render json: {
      status: { code: 200, message: "Signed Up sucessfully", data: resource}
    }
  else
    render json:{
      status:{
        message: "User could not be created",
         errors: resource.errors.full_messages
      }, status: :unprocessable_entity
    }
  end
 end
end
