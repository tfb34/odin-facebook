# odin-facebook

A social network web app with certain core features such as users, profiles, "friending", posts, "liking", and news feed. 

<h2>Getting Started</h2>
<p>To access the app via browser, https://time-out.herokuapp.com/ .</p>
<p>To download and install continue reading. </p>

<h3>Prerequisites</h3>
  Must have installed: 
<ul>
<li>Linux OS</li>
<li>Ruby</li>
<li>git</li>
</ul>
 Must setup Postgresql for database. Use figaro to setup credentials in config/environments/development.rb.
 
 <h3>Installing</h3>
    Click on the 'clone or download' button and copy the web URL provided. 
    Open your terminal and change directory to your preference. 
    In the terminal, type : 
    
        git clone https://github.com/tfb34/odin-facebook.git
    
   <p> Change directory to odin-timeout</p>
    
      cd odin-timeout
      
   <p>Install gems stored in Gemfile</p>
      
      bundle install
      
   <p>Run tests</p>
      
      rails test
      
   *you will get errors upon running model, controller, and integration tests if credentials are not set up. 
   
   <p>Startup server to open app in development<p>
   
      rails s
      
   <p>Open browser, and go to http://localhost:3000/</p>
   
  <h3>Built With </h3>
  <ul>
  <li><a href="https://github.com/laserlemon/figaro">figaro</a> - secure configuration values</li>
  <li><a href="https://github.com/plataformatec/devise">devise</a> - authentication</li>
  <li><a href="https://github.com/twbs/bootstrap-sass">bootstrap-sass</a> - web design</li>
  <li><a href="https://github.com/omniauth/omniauth">omniauth-gplus</a> - allow users to sign in with their gplus accounts</li>
  <li><a href="https://github.com/thoughtbot/paperclip">paperclip</a> - file attachment management</li>
</ul>

  <h4>For more information, visit <a href="https://www.theodinproject.com/courses/ruby-on-rails/lessons/final-project">the odin project</a></h4>
