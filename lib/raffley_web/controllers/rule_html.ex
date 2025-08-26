defmodule RaffleyWeb.RuleHTML do
  use RaffleyWeb, :html

  embed_templates "rule_html/*"

  def show(assigns) do
    ~H"""
    <div class="rules">
      <h1>{@greeting}! Don't forget...</h1>
      <p>{@rule.text}</p>
    </div>
    """
  end
end
