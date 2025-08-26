defmodule RaffleyWeb.EstimatorLive do
  use RaffleyWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, tickets: 0, price: 3)

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="estimator">
      <h1>Raffle Estimator</h1>

      <section>
        <button phx-click="add_tickets" value={-5}>-</button>
        <div>
          {@tickets}
        </div>
        <button phx-click="add_tickets" value={5}>+</button>
        X
        <div>
          ${@price}
        </div>

        =
        <div>
          ${@tickets * @price}
        </div>
      </section>

      <form phx-submit="set_price">
          <label>Ticket Price:</label>
          <input type="number" name="set_price" value={@price} min="0">
      </form>
    </div>
    """
  end

  def handle_event("add_tickets", %{"value" => value}, socket) do
    value = String.to_integer(value)

    {:noreply, do_update(socket, :tickets, value)}
  end

  def handle_event("set_price", %{"set_price" => price}, socket) do
    socket = assign(socket, :price, String.to_integer(price))
    {:noreply, socket}
  end

  def do_update(socket, key, value) do
   update(socket, key, fn x ->
    new_value = x + value
    if(new_value < 0, do: 0, else: new_value)
    end)
  end
end
