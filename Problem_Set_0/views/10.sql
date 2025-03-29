SELECT english_title, average_color AS `Hiroshige Average Color`
FROM views
WHERE artist = "Hiroshige"
ORDER BY average_color DESC;