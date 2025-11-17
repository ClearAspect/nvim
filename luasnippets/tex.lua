local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta

return {
	-- Question
	s(
		"ques",
		fmta(
			[[
		\question{%
			<>
		}
		]],
			{ i(1, "question text") }
		)
	),

	-- Question with hint
	s(
		"quesh",
		fmta(
			[[
		\question{%
			<>\\[1em]
			\textit{Hint: <>}
		}
		]],
			{ i(1, "question text"), i(2, "hint text") }
		)
	),

	-- Subquestions environment
	s(
		"subq",
		fmta(
			[[
		\begin{subquestions}
			\item <>
		\end{subquestions}
		]],
			{ i(1) }
		)
	),

	-- Answer environment
	s(
		"ans",
		fmta(
			[[
		\begin{answer}
			<>
		\end{answer}
		]],
			{ i(1) }
		)
	),

	-- Solution environment
	s(
		"sol",
		fmta(
			[[
		\begin{solution}
			<>
		\end{solution}
		]],
			{ i(1) }
		)
	),

	-- Proof environment (no argument)
	s(
		"prf",
		fmta(
			[[
		\begin{proof}
			<>
		\end{proof}
		]],
			{ i(1) }
		)
	),

	-- Proof by environment
	s(
		"prfb",
		fmta(
			[[
		\begin{proof}[<>]
			<>
		\end{proof}
		]],
			{ i(1, "By Direct Proof"), i(2) }
		)
	),

	-- Logic derivation environment
	s(
		"ld",
		fmta(
			[[
		\begin{logicderiv}
			\step{<>}{<>}
		\end{logicderiv}
		]],
			{ i(1, "expression"), i(2, "justification") }
		)
	),

	-- Step command (for use inside logicderiv)
	s("step", fmta([[\step{<>}{<>}]], { i(1, "expression"), i(2, "justification") })),

	-- Logical operators shortcuts
	s("land", t("\\land")),
	s("lor", t("\\lor")),
	s("lnot", t("\\neg")),
	s("limp", t("\\implies")),
	s("limpby", t("\\Longleftarrow")),
	s("liff", t("\\iff")),
	s("leq", t("\\lequiv")),

	-- Set operators shortcuts
	s("cap", t("\\cap")),
	s("cup", t("\\cup")),
	s("smin", t("\\setminus")),
	s("inn", t("\\in")),
	s("nin", t("\\notin")),
	s("subs", t("\\subset")),
	s("sups", t("\\supset")),
	s("psub", t("\\propsubset")),
	s("psup", t("\\propsupset")),
	s("emp", t("\\emptyset")),

	-- Common proof phrases
	s("supp", t("Suppose ")),
	s("leta", fmta("Let $<>$ be arbitrary", { i(1, "x") })),
	s("wts", t("We want to show that ")),
	s("thus", t("Thus, ")),
	s("hence", t("Hence, ")),
	s("there", t("Therefore, ")),

	-- Quantifiers
	s("fall", fmta("\\forall <> \\in <>", { i(1, "x"), i(2, "X") })),
	s("falla", fmta("\\forall <>", { i(1, "x") })),
	s("exist", fmta("\\exists <> \\in <>", { i(1, "x"), i(2, "X") })),
	s("exista", fmta("\\exists <>", { i(1, "x") })),
}
