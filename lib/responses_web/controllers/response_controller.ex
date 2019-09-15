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
    render(conn, "index.json", responses: Repo.all(Response))
  end

  def show(conn, %{"id" => id}) do
    render(conn, "show.json", response: Surveys.find_response_by_id(id))
  end
end
