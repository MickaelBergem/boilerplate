Feature:

Background:
  Given I am on angular

Scenario:
  When I am on ""
  Then I should be redirected to "/"
  When I am on "/fake-route"
  Then I should be redirected to "/"
  When I am on "/one"
  Then I should be redirected to "/one"
