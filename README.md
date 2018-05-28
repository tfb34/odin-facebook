# odin-facebook

A social network web app with certain core features such as users, profiles, "friending", posts, "liking", and news feed. 

## Getting Started
<p>To access the app via browser, https://time-out.herokuapp.com/ .</p>
<p>To get a copy of the project up and running on your local computer read on. </p>

### Prerequisites
  Must have installed: 
<ul>
<li>Linux OS</li>
<li>Ruby</li>
<li>git</li>
</ul>
 Must setup Postgresql for database. Use figaro to setup credentials in config/environments/development.rb.
 
### Installing
Click on the 'clone or download' button and copy the web URL provided.  Open your terminal and change directory to your preference. In the terminal, type : 
```
git clone https://github.com/tfb34/odin-facebook.git
```
Change directory to odin-timeout
```
cd odin-timeout
```
Install gems stored in Gemfile :
```
bundle install
```
Startup server to open app in development
``` 
 rails s
```
Open browser, and go to http://localhost:3000/

## Testing
In terminal, run the following line :
```
rails test
```
Note: <i>you will get errors upon running model, controller, and integration tests if credentials are not set up. </i>

## Deployment
<a href="https://time-out.herokuapp.com/">Open in browser</a>

## Built With
<ul>
  <li><a href="https://github.com/laserlemon/figaro">figaro</a> - secure configuration values</li>
  <li><a href="https://github.com/plataformatec/devise">devise</a> - authentication</li>
  <li><a href="https://github.com/twbs/bootstrap-sass">bootstrap-sass</a> - web design</li>
  <li><a href="https://github.com/omniauth/omniauth">omniauth-gplus</a> - allow users to sign in with their gplus accounts</li>
  <li><a href="https://github.com/thoughtbot/paperclip">paperclip</a> - file attachment management</li>
</ul>

<h4>For more information, visit <a href="https://www.theodinproject.com/courses/ruby-on-rails/lessons/final-project">the odin project</a></h4>
