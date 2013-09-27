require './test/test_helper'
require 'exercism/exercise'

class ExerciseTest < Minitest::Test
  def test_exercise_in_p
    go = Language.create! name: 'go', code_extension: "x", test_extension: "x"
    clojure = Language.create! name: 'clojure', code_extension: "x", test_extension: "x"
    exercise_type =  ExerciseType.create(slug: 'one')
    exercise = Exercise.create(language: go, exercise_type: exercise_type)
    create_sample_exercise('clojure', 'one')

    assert exercise.in?(go)
    refute exercise.in?(clojure)
  end

  def test_exercise_to_s
    clojure = Language.create! name: 'clojure', code_extension: "x", test_extension: "x"
    exercise_type =  ExerciseType.create(slug: 'one')
    exercise = Exercise.create(language: clojure, exercise_type: exercise_type)
    assert_equal 'Exercise: one (Clojure)', exercise.to_s
  end
end
