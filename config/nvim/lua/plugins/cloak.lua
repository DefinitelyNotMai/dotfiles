return {
	"laytan/cloak.nvim",
	ft = "dotenv",
	keys = {
		{
			"-",
			function()
				require("cloak").toggle()
			end,
			desc = "Toggle cloak.",
		},
	},
	config = true,
}
