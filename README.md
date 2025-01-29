# Basecamp Project Management App

## Overview
Basecamp is a project management application built with **Ruby on Rails**. It allows users to create projects, manage team members, add discussions, assign tasks, and upload files. This application is designed to streamline project workflows while maintaining simplicity and effectiveness.

---

## Features
- **Project Management**:
  - Create, edit, and delete projects.
  - Add a detailed title and description to projects.
- **Team Collaboration**:
  - View and manage project members.
  - Assign or revoke admin roles for team members.
- **Discussions**:
  - Add and manage discussion topics for each project.
- **Tasks**:
  - Create tasks and assign them to members.
- **File Attachments**:
  - Upload and manage relevant files for each project.

---

## Prerequisites
To run this project, ensure you have the following installed:
- **Ruby**: Version `3.0+`
- **Rails**: Version `7.0+`
- **SQLite3**: As the database for development, test, and production.
- **Node.js**: For managing JavaScript dependencies.
- **Yarn**: For frontend asset management.
- **Git**: For version control.

---

## Installation

### Clone the Repository
```bash
git clone https://github.com/your-repo/basecamp.git
cd basecamp
rails db:create                                                                                                
rails db:migrate
rails server
