defmodule RaffleyWeb.EstimatorLive do
  use RaffleyWeb, :live_view

  def mount(_params, _session, socket) do
    Process.send_after(self(), :tick, 2000)
    socket = assign(socket, tickets: 0, price: 3)
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="estimator">
      <h1>Raffle Estimator</h1>

      <section>
        <button phx-click="add" phx-value-quantity="5">+</button>
        <div>
          {@tickets}
        </div>
        @
        <div>
          ${@price}
        </div>
        =
        <div>
          ${@tickets * @price}
        </div>
      </section>

      <form phx-submit="set-price">
        <label>Ticket Price:</label>
        <input type="number" name="price" value={@price} />
      </form>
    </div>
    """
  end

  def handle_event("add", %{"quantity" => quantity}, socket) do
    socket = update(socket, :tickets, &(&1 + String.to_integer(quantity)))
    {:noreply, socket}
  end

  def handle_event("set-price", %{"price" => price}, socket) do
    socket = assign(socket, :price, String.to_integer(price))
    {:noreply, socket}
  end

  def handle_info(:tick, socket) do
    Process.send_after(self(), :tick, 2000)
    socket = update(socket, :tickets, &(&1 + 10))
    {:noreply, socket}
  end
end
