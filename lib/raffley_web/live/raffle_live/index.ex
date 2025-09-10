defmodule RaffleyWeb.RaffleLive.Index do
  use RaffleyWeb, :live_view

  alias Raffley.Raffles
  import RaffleyWeb.CustomComponents

  def mount(_params, _session, socket) do
    socket = assign(socket, :raffles, Raffles.list_raffles())
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <.banner :if={false}>
      <.icon name="hero-sparkles solid" /> Mystery Raffle Comming Soon!
      <:details :let={emoji}>
        To Be Revealed Tomorrow... {emoji}
      </:details>
      <:details>
        Any guesses?
      </:details>
    </.banner>
    <div class="raffle-index">
      <div class="raffles">
        <.raffle_card :for={raffle <- @raffles} raffle={raffle} />
      </div>
    </div>
    """
  end

  def raffle_card(assigns) do
    ~H"""
    <div class="card">
            <img src={@raffle.image_path} />
            <h2>{@raffle.prize}</h2>
            <div class="details">
              <div class="price">
              ${@raffle.ticket_price} / ticket
              </div>
             <.badge status={@raffle.status}/>
            </div>
          </div>
    """
  end

end
