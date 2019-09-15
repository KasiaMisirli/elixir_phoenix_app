defmodule CaptureWeb.SurveyController do
  use CaptureWeb, :controller
  alias Capture.Surveys
  alias CaptureWeb.ResponseView
  import Ecto.Query, only: [from: 2]

  def show(conn, %{"survey_id" => survey_id}) do
    render(conn, ResponseView, "index.json",
      responses: Surveys.find_responses_by_survey_id(survey_id)
    )
  end

  def result(conn, %{"survey_id" => survey_id}) do
    survey_id_int = String.to_integer(survey_id)

    # Capture.Repo.all(
    #   from r in "responses",
    #     select: %{value: r.value, count: count(r.value)},
    #     group_by: [r.value],
    #     where: r.survey_id == ^survey_id_int
    # )
    all_answers =
      Capture.Repo.all(from p in "responses", where: p.survey_id == 3, select: p.value)

    IO.inspect(all_answers)
    render(conn, ResponseView, "result.json", responses: all_answers)
  end
end

# [%{count: 2, value: 4}, %{count: 1, value: 5}]
