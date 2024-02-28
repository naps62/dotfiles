;extends

; highlight nested SQL inside sqlx::query()
(
  (call_expression
    (scoped_identifier
      path: (identifier) @path (#eq? @path sqlx)
      name: (identifier) @name (#eq? @name query))

    (arguments
      (raw_string_literal) @injection.content)

    (#offset! @injection.content 0 3 0 -2)
    (#set! injection.language "sql")
  )
)

; highlight nested SQL inside sqlx::query!()
(
  (macro_invocation
    (scoped_identifier
      path: (identifier) @path (#eq? @path sqlx)
      name: (identifier) @name (#eq? @name query))

    (token_tree
      (raw_string_literal) @injection.content)

    (#offset! @injection.content 0 3 0 -2)
    (#set! injection.language "sql")
  )
)
