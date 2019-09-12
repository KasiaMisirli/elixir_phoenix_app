defmodule CaptureWeb.ResponseController do
  use CaptureWeb, :controller

  alias Capture.Surveys
  alias Capture.Repo
  alias Capture.Surveys.Response

  action_fallback CaptureWeb.FallbackController

  def create(
        conn,
        %{
          "survey_id" => _survey_id,
          "question_id" => _question_id,
          "user_id" => _user_id,
          "value" => value
        } = params
      ) do
    {:ok, %Response{} = response} =
      params
      |> Surveys.handle_response()

    conn
    |> put_status(:created)
    |> put_resp_header("location", Routes.response_path(conn, :show, response))
    |> render("show.json", response: response)
  end

  def index(conn, _params) do
    responses = Repo.all(Response)
    render(conn, "index.json", responses: responses)
  end

  def show(conn, %{"id" => id}) do
    render(conn, "show.json", response: Surveys.find_response_by_id(id))
  end
end

# demographic_query = fn (demographic) -> (
#   Capture.Surveys.Response
#   |> Capture.Surveys.filter_responses_query(%{"survey_id" => 1})
#   |> Ecto.Query.join(:inner, [response], demographic in assoc(response, :demographics)) 
#   |> Ecto.Query.where([_r, demographic], demographic.value == ^demographic)
# )
