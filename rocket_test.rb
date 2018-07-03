require "minitest/autorun"
require_relative "rocket"

class RocketTest < Minitest::Test
  def setup
    @test_rocket = Rocket.new
  end

  def test_that_rocket_initialized_with_random_name
    assert_equal(String, @test_rocket.name.class)
    assert @test_rocket.name
  end

  def test_that_rocket_initialized_with_random_colour
    assert_equal(String, @test_rocket.colour.class)
  end

  def test_that_rocket_initialized_with_flying_as_false
    refute @test_rocket.flying?
  end

  def test_lift_off_when_flying_true
    @test_rocket = Rocket.new(flying: true)
    refute @test_rocket.lift_off
  end

  def test_lift_off_when_flying_false
    assert_equal(true, @test_rocket.lift_off)
  end

  def test_flying_when_lift_off_returns_true
    @test_rocket.lift_off
    assert_equal(true, @test_rocket.flying?)
  end


  def test_land_when_flying_is_true
    @test_rocket = Rocket.new(flying: true)
    assert_equal(true, @test_rocket.land)
  end

  def test_flying_false_when_land_returns_true
    @test_rocket = Rocket.new(flying: true)
    assert_equal(true, @test_rocket.flying?)
  end

  def test_land_when_flying_is_false
    assert_equal(false, @test_rocket.land)
  end

  def test_status_when_flying_is_true
    @test_rocket = Rocket.new(flying: true)
    assert_equal("Rocket #{@test_rocket.name} is flying through the sky!", @test_rocket.status)
  end

  def test_status_when_flying_is_false
    assert_equal("Rocket #{@test_rocket.name} is ready for lift off!", @test_rocket.status)
  end


end
