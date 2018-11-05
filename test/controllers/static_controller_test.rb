require 'test_helper'

class StaticControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_home_url
    assert_response :success
  end

#Page d'accueil, et faire en sorte qu'elle affiche les bons liens, en fonction si la personne est connectée ou non
#navbar, afficher les bons liens


end
