require('avante').setup({
    provider = "claude",
    claude = {
      endpoint = "https://api.anthropic.com",
      model = "claude-3-5-sonnet-20241022", 
      temperature = 0, -- adjust if needed
      max_tokens = 4096,
    },
})
