<p align="center">
  <img src="https://almosthackers.net/wp-content/uploads/sites/4/2022/07/logo.png" width="200" title="hover text">
  
</p>
<h1>LabPortal</h1>
<p> Laboral is an MVP for managing medical exams, by <a href= "https://almosthackers.net/"> AlmostHackers</a>.</p>    

<h2> 🛠 Dependencies</h2>

<p>Ruby on Rails</p>
<p>Devise</p>
<p>Bootstrap</p>
<p>Faker</p>
<p>Phonelib</p>

These are just some of the main dependencies used in LabPortal. 

<h2> Setup </h2>

Clone the repository:

```sh
  git clone https://github.com/seu-usuario/lab_portal.git
  ```
Access the project directory:

```sh
  cd lab_portal
  ```
Install the Ruby dependencies:

```sh
  bundle install
  ```
Run database migrations:
```sh
  rails db:migrate
  ```

Start the local server:

```sh
  rails server
  ```
Access the app in your browser:

```sh
  http://localhost:3000
  ```

After the seed command completes, you can check the generated doctor and patient emails by running the following commands in the console:
```sh
  puts User.joins(:user_hospitals).where(user_hospitals: { role: "doctor" }).pluck(:email)
  puts User.joins(:user_hospitals).where(user_hospitals: { role: "patient" }).pluck(:email)
  ```
Write down a doctor email and a patient email for later use. Passwords, by default, are the same for medical or patient users:

```sh
  123123
  ```

<h2> Author</h2>

<img src="https://avatars.githubusercontent.com/u/68801163?s=96&v=4" width="110" title="hover text">

<p>Developed by <a href="https://www.linkedin.com/in/lucasaraujomouta/">Lucas Araujo</a>.</strong></p>



<h2> 📝 references</h2>

<p><a href="https://leanpub.com/conhecendo-ruby"> Lvro - Conhecendo Ruby </a></p>
<p><a href="https://www.ruby-lang.org/pt/"> Ruby </a></p>
<p><a href="https://www.rubyguides.com/2018/11/rspec-introduction/"> Rspec </a></p>
<p><a href="https://medium.com/@anchietajunior/c%C3%B3digo-organizado-reutiliz%C3%A1vel-e-f%C3%A1cil-de-testar-utilizando-ruby-service-objects-80c750876610/"> Artigo - Ruby Service Objects </a></p>

