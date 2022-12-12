# Mompi API
this is a API for create a ride and pay it, it's necesary have install the next dependencies:

- ruby 3.0
- postgres 12
- cmake

## Set up project

After you have been installed the dependencies you need install gems with:
```
bundle install 
```

If you don´t install bundler you can run
```
gem install bundler 
```

Now you need generate config files with next command

```
make copy-config 
```
Then you must be config the files are in `config/` folder:

- `database.yml`: Settings for connection to postgres, in this file you must add the access for your database
- `credentials.yml`: Settings for credentials for services, in this file you must add de wompi credentials configuration, `url`, `private_key`, and `public_key`

Finally you must run the next command for create database, run migrations and run seeds in the console 

```
rake set_up 
```
## Run project
```
rackup
```
For test api it's necesary use a bearer token for riders and drivers, for this tokens works you don´t
change secret key in file `config/credentials.yml`

token-rider fort test:
- `eyJhbGciOiJIUzI1NiJ9.eyJpZCI6MX0.Os30IZvCoXp-1wgbXAWf-mEgJYfpo4BZVJiaITwADCs`
- `eyJhbGciOiJIUzI1NiJ9.eyJpZCI6Mn0.0TbkmTNgs99IlBRt1do6OINE0k3WnA8QvHVo_b_9fKc`
- `eyJhbGciOiJIUzI1NiJ9.eyJpZCI6M30.RaFxhtN8JXcopxCkQjVws4BdmPlDYWCzkCSYs3483zM`

token-driver for test:
- `eyJhbGciOiJIUzI1NiJ9.eyJpZCI6MX0.Os30IZvCoXp-1wgbXAWf-mEgJYfpo4BZVJiaITwADCs`
- `eyJhbGciOiJIUzI1NiJ9.eyJpZCI6Mn0.0TbkmTNgs99IlBRt1do6OINE0k3WnA8QvHVo_b_9fKc`
- `eyJhbGciOiJIUzI1NiJ9.eyJpZCI6M30.RaFxhtN8JXcopxCkQjVws4BdmPlDYWCzkCSYs3483zM`

![image](https://user-images.githubusercontent.com/64051193/207062651-a7799d05-643d-4617-832e-58ae984847e8.png)

## Run test
```
rake test
```
## Utils commands
#### Create database
```
rake db:create
```
#### Drop database
```
rake db:drop
```
#### Apply migrations
```
rake db:migrate
```
#### Rollback last migration
```
rake db:rollback
```
#### Seed the database
```
rake db:seed
```
#### Generate schema file
```
rake db:schema
```
#### Reset the database
```
rake db:reset
```
