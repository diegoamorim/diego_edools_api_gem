require "test_helper"

class DiegoedoolsapiTest < Minitest::Test

  def test_that_it_has_a_version_number
    refute_nil ::Diegoedoolsapi::VERSION
  end

  def test_get_all_method
    school_token
    get_response = Diegoedoolsapi.get_all("courses")

    assert get_response
    assert_equal get_response, 200
  end

  def test_create_course_method
    data = {
      course: { 
        "name": "Curso abc" 
      }
    }

    school_token
    post_response = Diegoedoolsapi.create_course(data)

    assert post_response
    assert_equal post_response, 201
  end

  def test_create_school
    data = {
      school: {
        "name": "Escola teste abc",
        "email": "teste@teste.com",
        "password": "teste1234"
      }
    }
    school_token

    post_response = Diegoedoolsapi.create_school(data)

    assert post_response
    assert_equal post_response, 201
  end

  def test_update_school
    school_token
    shuffle = "1234ASDRR"
    name = shuffle.split('').shuffle.join.upcase
    data = {
      school: {
        "name": "Nome da Escola"
      }
    }
      
    put_response = Diegoedoolsapi.update_school(694, data)

    assert_nil put_response
  end

  def test_invitation_students
    school_token
    shuffle = "1234ASDWE6789"
    student_name = shuffle.split('').shuffle.join.upcase
    student_email = "#{student_name}@teste.com"
    data = {
      "invitation":{"first_name": "Aluno_teste","email": "#{student_email}",
        "enrollments":[{"enrollment":{"school_product_id": 1018174822,"status":"active","unlimited":true}}],
         "type":"Student"
      }
    }
    
    post_response = Diegoedoolsapi.invitation_student(data)

    assert post_response
    assert_equal post_response, 200
  end

  def test_create_school_product_method
    data = {
      school_product: {
        "title": "Prod_teste",
        "school_id": 694
      }
    }
    school_token
    post_response = Diegoedoolsapi.create_school_product(694, data)
    
    assert post_response
    assert_equal post_response, 201
  end

  def test_get_school_product_students
    school_token
    get_response = Diegoedoolsapi.get_school_product_students(1018174822)

    assert get_response
  end
end