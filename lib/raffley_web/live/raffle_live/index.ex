defmodule RaffleyWeb.RaffleLive.Index do
  use RaffleyWeb, :live_view

  alias Raffley.Raffles

  def mount(_params, _session, socket) do
    socket = assign(socket, :raffles, Raffles.list_raffles())
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="raffle-index">
      <div class="raffles">
          <div :for={raffle <- @raffles} class="card">
            <img src={raffle.image_path} />
            <h2>{raffle.prize}</h2>
            <div class="details">
              <div class="price">
              ${raffle.ticket_price} / ticket
              </div>
             <.badge status={raffle.status}/>
            </div>
          </div>
      </div>
    </div>
    """
  end

  def badge(assigns) do
    ~H"""
     <div class="@apply rounded-md px-2 py-1 text-xs font-medium uppercase inline-block border text-lime-600
     border-lime-600">
        {@status}
      </div>
    """
  end

end
