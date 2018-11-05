require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_new_url
    assert_response :success
  end

  test "should get show" do
    get users_show_url
    assert_response :success
  end

  test "should get create" do
    get users_create_url
    assert_response :success
  end

end

#Inscription, erreur si la personne n'a pas rentré les bons champs (email en double, paramètre manquant)
#club, qui ne doit être accessible qu'aux personnes login. 
#La page doit renvoyer la liste des personnes inscrites au site