defmodule CaptureWeb.ResponseView do
  use CaptureWeb, :view
  alias CaptureWeb.ResponseView

  def render("show.json", %{response: response}) do
    %{data: render_one(response, ResponseView, "response.json")}
  end

  def render("response.json", %{response: response}) do
    %{
      id: response.id,
      survey_id: response.survey_id,
      question_id: response.question_id,
      user_id: response.user_id,
      value: response.value
    }
  end

  # the render function that was called in the controller is defined here.
  def render("index.json", %{responses: responses}) do
    render_many(responses, CaptureWeb.ResponseView, "response.json")
  end

  def response_map do
    %{
      ones: 10,
      twos: 26,
      threes: 34,
      fours: 45,
      fives: 51
    }
  end

  def render("result.json", %{responses: responses}) do
    # Survey.count_total(responses)
    render(responses)
    # %{
    #   ones: 10,
    #   twos: 26,
    #   threes: 34,
    #   fours: 45,
    #   fives: 51
    # }
  end
end
