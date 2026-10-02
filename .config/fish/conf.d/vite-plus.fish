# Vite+ bin (https://viteplus.dev)
if status is-interactive
    if test -f "$HOME/.vite-plus/env.fish"
        source "$HOME/.vite-plus/env.fish"
    end
else
    fish_add_path --path "$HOME/.vite-plus/bin"
end
