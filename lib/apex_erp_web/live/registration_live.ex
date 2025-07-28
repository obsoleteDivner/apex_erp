defmodule ApexErpWeb.RegistrationLive do
    use Phoenix.LiveView
    use Phoenix.Component

    def render(assigns) do
        ~H"""
            <div>
            </div>
        """
    end
    def mount(%{}, _, socket) do
    {:ok, socket}
    end


end