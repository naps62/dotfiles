;extends

; set @inline_sql highlight group for sqlx::query()
(
  (call_expression
    (scoped_identifier
      path: (identifier) @path (#eq? @path sqlx)
      name: (identifier) @name (#eq? @name query))

    (arguments
      (raw_string_literal) @inlinesql)
  )
)

; set @inline_sql highlight group for query()
(
  (call_expression
    function: (identifier) @name (#eq? @name query)
    arguments: (arguments (raw_string_literal) @inlinesql)
  )
)
