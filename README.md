# CampusConnect — College Event Registration Portal

A PHP and MySQL web application for publishing college events and managing student registrations. Built as a beginner-to-intermediate web development portfolio project.

## Features
- Responsive event discovery, keyword search and category filtering
- Student sign-up and sign-in with password hashing
- Event details, capacity tracking and student registration
- Cancel registrations and view personal registration history
- Admin dashboard to create/edit events and view participants
- Draft, published and cancelled event statuses
- PDO prepared statements, output escaping, CSRF tokens, validation and session ID regeneration
- MySQL foreign keys and unique user/event registrations
- Responsive Bootstrap interface

## Stack
PHP 8+, MySQL/MariaDB, PDO, HTML, CSS, Bootstrap 5, JavaScript, Apache/XAMPP.

## Local setup (Windows/XAMPP)
1. Extract to `C:\xampp\htdocs\college-event-registration-portal`.
2. Start Apache and MySQL in XAMPP.
3. Open `http://127.0.0.1/phpmyadmin/` and import `database/schema.sql`.
4. Copy `config.example.php` to `config.php`. Set DB host, port, database, username and password to match your local setup. The example uses port `3307`, database `college_events`, user `root`, and a blank password; change these if needed. `config.php` is ignored by Git. Never use a blank root password on a public server.
5. Open `http://localhost/college-event-registration-portal/`.

## Create the first administrator (local only)
1. Open `http://localhost/college-event-registration-portal/admin/create-admin.php`.
2. Create an admin with a strong password (at least 12 characters).
3. Sign in and open Admin → Create event to publish an event.
4. **Immediately delete `admin/create-admin.php` after creating the admin.** It is a one-time local utility and must not remain on a public deployment.

## Suggested test plan
1. Register a student account and sign in.
2. Create and publish an event as admin.
3. Register as a student; confirm the seat count changes.
4. Try registering twice and confirm the duplicate is prevented.
5. Cancel the registration and confirm its status.
6. Test event capacity, invalid fields and admin-only access.

## Limitations
Learning project, not production-ready. Before real deployment, add automated tests, rate limiting, email verification, password reset, hardened session/cookie settings, security review and backups. Never deploy default credentials.

## Future improvements
GitHub Actions CI, pagination, CSV export, email confirmations, Docker Compose, deployment automation and infrastructure as code.

## License
MIT. See [LICENSE](LICENSE).
