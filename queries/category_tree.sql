-- Recursive CTE to display categories and their descendants.

WITH RECURSIVE category_tree AS (
    SELECT
        id,
        name,
        parent_id,
        0 AS depth,
        ARRAY[name::TEXT] AS path
    FROM categories
    WHERE parent_id IS NULL

    UNION ALL

    SELECT
        c.id,
        c.name,
        c.parent_id,
        ct.depth + 1,
        ct.path || c.name::TEXT
    FROM categories AS c
    JOIN category_tree AS ct
      ON c.parent_id = ct.id
)
SELECT
    repeat('  ', depth) || name AS category,
    id,
    parent_id,
    depth
FROM category_tree
ORDER BY path;
