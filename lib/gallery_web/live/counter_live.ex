defmodule GalleryWeb.CounterLive do
  use Phoenix.LiveView

  # É usado para configurar a visualização
  # e preparar os dados necessários para a
  # primeira renderização.
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:counter, 0) # monta o contador que começa com zero
      # |> IO.inspect()
    {:ok, socket}
  end

  # renderiza o html na tela
  def render(assigns) do
    ~L"""
      <!-- @counter = varivel que recebe o valor de mount -> socket -->
      <label>Counter: <%= @counter %> </label>
      <button phx-click="inc">+</button>
    """
  end

  # evento/função de click
  # argumentos (o nome do phx-click, tipo de evento/funcao, socket)
  def handle_event("inc", _event, socket) do
    socket = update(socket, :counter, &(&1 + 1)) # update atualiza o valor com uma função
    {:noreply, socket}
  end
end
