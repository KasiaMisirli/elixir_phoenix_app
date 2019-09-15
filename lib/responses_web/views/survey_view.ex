# defmodule CaptureWeb.SurveyView do
#   use CaptureWeb, :view
#   alias CaptureWeb.SurveyView

#   def render("response.json", %{response: response}) do
#     %{
#       id: response.id,
#       survey_id: response.survey_id,
#       question_id: response.question_id,
#       user_id: response.user_id,
#       value: response.value
#     }
#   end

#   def render("index.json", %{responses: responses}) do
#     render_many(responses, SurveyView, "response.json")
#   end
# end
