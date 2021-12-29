defmodule GalleryWeb.GalleryLive do
  # atributo de modulo
  @images [
    "https://images.unsplash.com/photo-1562971179-4ad6903a7ed6?h=300&fit=crop",
    "https://images.unsplash.com/photo-1552673597-e3cd6747a996?h=300&fit=crop",
    "https://images.unsplash.com/photo-1561133036-61a7ed56b424?h=300&fit=crop",
    "https://images.unsplash.com/photo-1530717449302-271006cdc1bf?h=300&fit=crop"
  ]
  @images_count Enum.count(@images)

  use Phoenix.LiveView

  # imagens
  def image(index) do
    # usando o rem/2 (divisão inteira).
    # O primeiro argumento é o índice (dividendo)
    # e o segundo é o comprimento da lista (divisor)
    # exmeplo iex> rem(2, 3)
    #         iex> 2
    index = rem(index, @images_count)
    Enum.at(@images, index) # retora a url da imagem no indice (index)
  end

  # preparando os dados necessários
  # index começa com zero
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :index, 0)}
  end

  # renderizando o html
  def render(assigns) do
    ~L"""
    <img src="<%= image(@index) %>">
    <label>Image Index: <%= @index %> </label>
    <button phx-click="prev">Prev</button>
    <button phx-click="next">Next</button>
    """
  end

  # evento click de prev
  def handle_event("prev", _event, socket) do
    {:noreply, update(socket, :index, &(&1 - 1))}
  end

  # evento click de next
  def handle_event("next", _event, socket) do
    {:noreply, update(socket, :index, &(&1 + 1))}
  end

end
