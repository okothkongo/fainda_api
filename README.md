# README

This is an api for an app that connects buyers and seller by alllowing seller to advertise their products.

## Requests
 | purpose                     | Path                                                       | Methods | Params                                                                      |
|-----------------------------|------------------------------------------------------------|---------|-----------------------------------------------------------------------------|
| user signup or registration | https://fainda-api.herokuapp.com//api/v0/User/auth         | POST    | first_name, last_name, phone_number, email, password, password_confirmation |
| user sign in                | https://fainda-api.herokuapp.com//api/v0/User/auth         | POST    | email, password                                                             |
| user sign out               | https://fainda-api.herokuapp.com/api/v0/User/auth/sign_out | DELETE  | You must pass in uid,client, and access-token in the request headers.       |
  