SELECT latitude, longitude, `0m`
FROM normals
ORDER BY `0m` DESC, latitude
LIMIT 10;