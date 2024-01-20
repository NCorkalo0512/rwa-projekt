# rwa-projekt
This web application is designed for efficient management of apartment rentals. It consists of two primary modules: an Administrative part accessible only to the administrator (landlord) and a Public part available to all users.

Administrative Module
Developed using ASP.NET WebForms, the administrative module features:

A login page for administrator access.
A consistent navigation header with a logo and logout option, along with a footer.
An apartment listing page with sorting capabilities by room count, number of places, and price. Optional filters for current status or city are also included.
Facilities for managing apartment characteristics (like room count, adult and children occupancy, distance from the sea, image management, and tagging).
Updating and displaying apartment statuses (e.g., "Occupied", "Reserved", "Available").
Options to input reservation details, soft-delete functionality for apartments, and adding new apartments.
Tag management with the ability to add new tags and delete unused ones.
An overview of registered users.
Warning prompts before any deletion action (apartment, tag, image).
Implementation of features in a visually consistent manner with the rest of the interface.
Public Module
Created using ASP.NET MVC, the public module includes:

User login/registration functionality.
A header with logo, consistent navigation, language change option (persisted using cookies), and logout feature.
A footer section.
Apartment search capabilities with filters for characteristics like room count, adult and child occupancy, and optional additional criteria like city.
Search result sorting options.
Saving search parameters in cookies for future visits.
Display of available apartments with basic details and AJAX-powered functionalities.
Detailed apartment pages with comprehensive information and a photo gallery.
A contact form with a reservation inquiry option, pre-filled for logged-in users, and CAPTCHA protection for non-logged-in users.
Features for logged-in users to leave ratings and reviews, leveraging AJAX for interactions.
Consistent visual implementation of all functionalities with the overall interface.
This project is designed to offer a comprehensive solution for apartment rental management, balancing user-friendly public interactions with robust administrative controls.
