# README

KAIST Nature Science Club
- 16pm - 
Website

Developed with Ruby on Rails 5

#### server instruction manual ####

$ annotate shell commands


<Running server in development mode>
command : 
$ rvmsudo rails s -b 0.0.0.0 -p 80 -d

-p flag sets port. To run server in 80 port(default webserver port), you should run rails with supuersuer mode. 
However, since rails runs in ruby, we cannnot run rails directly with sudo mode.
Instead, rvm(ruby version manager) provides sudo mode which is rvmsudo.

-b flag sets blacklist. 0.0.0.0 allows connection for all client.

-d flag sets background mode(daemon). If you don't set this flag, rails server will shutdown when you close the terminal,
or when you hit ctrl+c key.


<Running server in production mode>
command :
$ rvmsudo rails s -b 0.0.0.0 -p 80 -e production -d

For security matter, you should run rails in production mode.
In development mode or test mode, the SECRET_KEY_BASE remains public(in github).
If someone hack server database, he can directly find user password with SECRET_KEY_BASE.
Therefore, try to run server as production mode.
(But this is not easy job, since it always makes unexpected errors.)
Default rails environment is development mode.


<Stopping daemon server>
command :
$ rvmsudo rake stop 

If you runned rails in background mode, to stop rails server, you shoud manually kill rails process.
To make jobs convenient, I defined stop process in Rakefile.


<Database backup/ migration between different mode>
command : 
$ rake db:data:dump
This makes data.yml file in /db/ directory.
$ RAILS_ENV=production rake db:date:load

Enabled by gem 'yaml_db'
Be sure to dump all database before db migration.


#### development guide ####


<Prototype testing server url>
https://ide.c9.io/fifteenmania/sixpm

Developing webserver via ssh terminal is very inconvenient. 
It is very helpful to have prototype testing server.
c9 is awsome cloud server for web development.


<Git commit>
command :
$ git add .
$ git commt -m "message"
$ git push origin master

Commit when all things work fine.
Write descriptions what you did in "message".
Files in .gitignore are not tracked by git(database, environment variables, etc).
Repositary url : https://github.com/fifteenmania/16pm.git


<Rails console>
command :
$ rails c

Testing some ruby commands in rails console is very helpful.
You can directly access database in rails console, like
$ Seminar.find(1).title


<Production mode asset precompile>
command :
$ RAILS_ENV=production rake assets:precompile

Needed for production mode development.


<Setting environment variables>
All the environment variables are stored in /config/environment_variables.yml file.
Be aware that this file isn't tracked by git, for security reason.
This file is controlled by /config/initializers/environment_variables.rb.


<Changing database table>
command :
$ rails g migration AddSometingToWhat
$ rake db:migrate

Set appropriate name to AddSometingToWhat. 
Sometimes you should migrate in production mode, like
$ RAILS_ENV=production rake db:migrate


