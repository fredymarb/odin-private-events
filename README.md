# Private Events

> A Ruby on Rails application that allows users to create and manage private events. Users can attend events, view upcoming and past events, and manage attendees. This project demonstrates advanced use of **ActiveRecord associations**, **Devise authentication**, and **many-to-many relationships** as part of *The Odin Project* curriculum.

---

## 📍 Project Overview

The goal of this project is to build a simple private event management platform, similar to Eventbrite, where:

- Users can **create events**.
- Users can **attend events** created by other users.
- Events display **attendees** and event details.
- Users can see their **created events** and **attended events**, separated by past and future events.

---

## 🚀 Features

- User sign up, sign in, and authentication using Devise  
- Create, view, and manage events  
- Many-to-many relationship between users and events (attendences)  
- Event listing sorted into **past** and **upcoming**  
- Navigation across key views (events, users, attendence)  

---

## 🧱 Built With

- **Ruby**  
- **Ruby on Rails**  
- **PostgreSQL**  
- **Devise** (authentication)  
- **HTML / ERB templates**  

---

## 📁 Getting Started

### 🛠 Prerequisites

Make sure you have the following installed:

- Ruby (version 3.3.4)
- Rails (version 8.1.1)
- PostgreSQL  
- Git  

### 📦 Installation

1. **Clone the repository**
  ```bash
    git clone https://github.com/your-username/odin-private-events.git
    cd private-events
  ```


2. **Install dependencies**
  ```bash
    bundle install
  ```


3. **Set up the database**
  ```bash
    rails db:create
    rails db:migrate
  ```

4. **Start the Rails server**
  ```bash
    rails server
  ```
  
5. Visit in your browser
  *Navigate to http://localhost:3000 to use the app.*

---

### 📌 Usage

Sign up to create an account.
- Create events and specify the event date and location.
- Browse events and choose to attend them.
- View your profile to see lists of your created and attended events.
- Explore past vs upcoming events to stay organized.

### 🧠 Data Model

This application handles the following relationships:
- User has many created events (as creator)
- Event belongs to a creator (User)
- User has many attended events through attendences
- Event has many attendees through attendences
- Custom foreign keys and class names are used to support these associations.

### 📈 Contributing

 Contributions are welcome! Please follow these steps:
- Fork this project
- Create your feature branch (```git checkout -b feature/YourFeature```)
- Commit your changes (```git commit -m 'Add YourFeature'```)
- Push to the branch (```git push origin feature/YourFeature```)
- Open a Pull Request

### 📝 License

This project is open source and available under the MIT License.

### 📚 Resources

Project description on The Odin Project:
[Private Events Lesson](https://www.theodinproject.com/lessons/ruby-on-rails-private-events)
