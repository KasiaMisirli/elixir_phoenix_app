defmodule CaptureWeb.SurveyController do
  use CaptureWeb, :controller
  alias Capture.Surveys
  alias CaptureWeb.ResponseView

  def show(conn, %{"survey_id" => survey_id}) do
    all_per_survey = Surveys.find_responses_by_survey_id(survey_id)
    render(conn, ResponseView, "index.json", responses: all_per_survey)
  end
end
