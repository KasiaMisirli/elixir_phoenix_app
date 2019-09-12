defmodule Capture.Surveys do
  @moduledoc """
  The Surveys context.
  """

  import Ecto.Query, warn: false
  alias Capture.Repo

  alias Capture.Surveys.Response

  def handle_response(params) do
    find_response(params)
    |> case do
      nil ->
        create_response(params)

      response ->
        update_response(response, params)
    end
  end

  @doc """
  Creates a response.

  ## Examples

      iex> create_response(%{field: value})
      {:ok, %Response{}}

      iex> create_response(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_response(attrs \\ %{}) do
    %Response{}
    |> Response.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a response.

  ## Examples

      iex> update_response(response, %{field: new_value})
      {:ok, %Response{}}

      iex> update_response(response, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_response(%Response{} = response, attrs) do
    response
    |> Response.changeset(attrs)
    |> Repo.update()
  end

  def find_response(%{
        "survey_id" => survey_id,
        "question_id" => question_id,
        "user_id" => user_id
      }) do
    Response
    |> where(
      survey_id: ^survey_id,
      question_id: ^question_id,
      user_id: ^user_id
    )
    |> Repo.one()
  end

  def find_response_by_id(id) do
    Repo.get(Response, id)
  end

  # ^id will know that you want the survey id and not the table id
  def find_responses_by_survey_id(id) do
    Response |> Ecto.Query.where(survey_id: ^id) |> Capture.Repo.all()
  end
end
