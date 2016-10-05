class GraphqlController < ApplicationController
  def create
    query_string    = params[:query]
    query_variables = ensure_hash(params[:variables])
    result          = SiteSchema.execute(
      query_string,
      variables: query_variables,
      context:   { current_user: current_user }
    )
    render json: result
  end

  private

  def ensure_hash(query_variables)
    if query_variables.blank?
      {}
    elsif query_variables.is_a?(String)
      JSON.parse(query_variables)
    else
      query_variables
    end
  end
end
