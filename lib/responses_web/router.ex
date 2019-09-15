defmodule CaptureWeb.Router do
  use CaptureWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CaptureWeb do
    pipe_through :api
    # resources "/responses", ResponseController, only: [:create, :show]
    get "/responses", ResponseController, :index
    get "/responses/:id", ResponseController, :show
    get "/surveys/:survey_id", SurveyController, :show
    get "/surveys/:survey_id/result", SurveyController, :result
  end
end
