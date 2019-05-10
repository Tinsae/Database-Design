-- create the table
DROP TABLE IF EXISTS list;
CREATE TABLE list
(
elt CHAR(1),
pos INT
);
-- insert values to the table
-- 
INSERT INTO list
VALUES('b', 3);
-- 
INSERT INTO list
VALUES('p', 1);
-- 
INSERT INTO list
VALUES('t', 4);
-- 
INSERT INTO list
VALUES('x', 2);

-- self join a table with it self
(SELECT
	*
FROM
	list l1,
	list l2
);

-- filter consecutive elements
(SELECT
	l1.elt this,
	l2.elt next
FROM
	list l1,
	list l2
WHERE
	(l2.pos - l1.pos) = 1
);


-- get distint list of elements
(SELECT DISTINCT elt FROM list);



-- left join distint elements with 
-- consecutive elements to obtain
-- the final result

SELECT elements.elt, result.next FROM
(SELECT DISTINCT elt FROM list) elements
LEFT JOIN
(SELECT
	l1.elt this,
	l2.elt next
FROM
	list l1,
	list l2
WHERE
	(l2.pos - l1.pos) = 1
) result
ON elements.elt = result.this;