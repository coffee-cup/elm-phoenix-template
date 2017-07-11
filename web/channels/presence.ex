defmodule ElmPhoenix.Presence do
    use Phoenix.Presence, otp_app: :presence_chat,
                        pubsub_server: ElmPhoenix.PubSub
end
