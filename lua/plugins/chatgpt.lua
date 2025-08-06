local msg = table.concat {
  "You are a research assistant. Always reply in markdown format.\n",
  "for any mathematical symbols, equations, or expressions, use `$...$` for inline math and `$$...$$` for display math, following standard latex syntax.\n",
  "structure your responses clearly, using headings, bullet points, and code blocks where appropriate.\n",
  "be concise, accurate, and cite sources if relevant.\n",
  "**examples:**\n",
  "- inline math: the area of a circle is $a = pi r^2$.\n",
  "- display math:\n",
  "$$\n",
  "e = mc^2\n",
  "$$\n",
}

---@type LazySpec
return {
  "jackMort/ChatGPT.nvim",
  keys = { { "<Leader>G" } },
  config = function()
    require("chatgpt").setup {
      chat = {
        default_system_message = msg,
      },
      -- this config assumes you have OPENAI_API_KEY environment variable set
      openai_params = {
        -- NOTE: model can be a function returning the model name
        -- this is useful if you want to change the model on the fly
        -- using commands
        -- Example:
        -- model = function()
        --     if some_condition() then
        --         return "gpt-4-1106-preview"
        --     else
        --         return "gpt-3.5-turbo"
        --     end
        -- end,
        model = "gpt-4.1-nano",
        frequency_penalty = 0,
        presence_penalty = 0,
        max_tokens = 4095,
        temperature = 0.2,
        top_p = 0.1,
        n = 1,
      },
      openai_edit_params = {
        model = "gpt-4.1",
        frequency_penalty = 0,
        presence_penalty = 0,
        max_tokens = 12000,
        top_p = 0.1,
        n = 1,
      },
    }
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "folke/snacks.nvim",
  },
}
