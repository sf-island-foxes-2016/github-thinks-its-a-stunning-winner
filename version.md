Version 0.5
  Build a Rails app with Postgres DB
  Admin login/out, edit Admin info
  Product Crud functionality for admin only
  Deploy to Heroku
  -----------
  -- Walkthrough --
  Visit site- ROOT PAGE - presented with a login link for admins
  taken to login page
  redirect to Admin homepage(authorized use only)
  Homepage contains link to create new products
  link directs to New Product Form
  redirect to Admin homepage
  Homepage now has products
  products on homepage have edit links
  edit links redirect to edit form
  edit form also has a remove option
  edit or remove redirects to Admin homepage
  Homepage has a logout link
  logout link redirects to ROOT PAGE
---
JULIAN CHECKIN
clearly separate views edit product/category
dropdown option for edit?
admin without login :: AbstractController::DoubleRenderError in AdminController#sho
product list without logging in
views same but without edit/delete type actions?
controll auth on update/delete
admin into user- with admin abilities
minimize complexity for products by removing categories
product tests -- feature or controller
------

WED NIGHT NOTES
Admin-titled users should be able to promote other users to admin, but other crud is in place
