-- creating the TABLE
-- create table
DROP TABLE IF EXISTS SPOTIFY;

CREATE TABLE SPOTIFY (
	ARTIST VARCHAR(255),
	TRACK VARCHAR(255),
	ALBUM VARCHAR(255),
	ALBUM_TYPE VARCHAR(50),
	DANCEABILITY FLOAT,
	ENERGY FLOAT,
	LOUDNESS FLOAT,
	SPEECHINESS FLOAT,
	ACOUSTICNESS FLOAT,
	INSTRUMENTALNESS FLOAT,
	LIVENESS FLOAT,
	VALENCE FLOAT,
	TEMPO FLOAT,
	DURATION_MIN FLOAT,
	TITLE VARCHAR(255),
	CHANNEL VARCHAR(255),
	VIEWS FLOAT,
	LIKES BIGINT,
	COMMENTS BIGINT,
	LICENSED BOOLEAN,
	OFFICIAL_VIDEO BOOLEAN,
	STREAM BIGINT,
	ENERGY_LIVENESS FLOAT,
	MOST_PLAYED_ON VARCHAR(50)
);

-- EDA
SELECT
	COUNT(*)
FROM
	SPOTIFY
SELECT
	COUNT(DISTINCT ARTIST)
FROM
	SPOTIFY
SELECT
	COUNT(DISTINCT ALBUM)
FROM
	SPOTIFY
SELECT DISTINCT
	ALBUM_TYPE
FROM
	SPOTIFY
SELECT
	MAX(SPOTIFY.DURATION_MIN)
FROM
	SPOTIFY
SELECT
	MIN(SPOTIFY.DURATION_MIN)
FROM
	SPOTIFY
SELECT
	*
FROM
	SPOTIFY
WHERE
	SPOTIFY.DURATION_MIN = 0
DELETE FROM SPOTIFY
WHERE
	SPOTIFY.DURATION_MIN = 0
SELECT DISTINCT
	SPOTIFY.CHANNEL
FROM
	SPOTIFY
SELECT DISTINCT
	SPOTIFY.MOST_PLAYED_ON
FROM
	SPOTIFY
	-- data analysis - easy category
	-- 1. Retrieve the names of all tracks that have more than 1 billion streams.
SELECT
	*
FROM
	SPOTIFY
WHERE
	SPOTIFY.STREAM > 1000000000
	-- 2. List all albums along with their respective artists.
SELECT DISTINCT
	ALBUM,
	ARTIST
FROM
	SPOTIFY
ORDER BY
	1
	-- 3. Get the total number of comments for tracks where licensed = TRUE.
SELECT
	SUM(COMMENTS) AS TOTAL_COMMENTS
FROM
	SPOTIFY
WHERE
	SPOTIFY.LICENSED = TRUE
	-- 4. Find all tracks that belong to the album type single.
SELECT
	*
FROM
	SPOTIFY
WHERE
	ALBUM_TYPE = 'single'
	-- 5. Count the total number of tracks by each artist.
SELECT
	ARTIST,
	COUNT(*) AS TOTAL_NO_SONGS
FROM
	SPOTIFY
GROUP BY
	1
	-- medium level 
	-- 6. Calculate the average danceability of tracks in each album.
SELECT
	ALBUM,
	AVG(SPOTIFY.DANCEABILITY) AS AVG_DANCEABILITY
FROM
	SPOTIFY
GROUP BY
	1
ORDER BY
	2 DESC
	-- 7. Find the top 5 tracks with the highest energy values.
SELECT
	TRACK,
	AVG(ENERGY)
FROM
	SPOTIFY
GROUP BY
	1
ORDER BY
	2 DESC
LIMIT
	5
	-- 8. List all tracks along with their views and likes where official_video = TRUE.
SELECT
	TRACK,
	SUM(VIEWS) AS TOTAL_VIEWS,
	SUM(LIKES) AS TOTAL_LIKES
FROM
	SPOTIFY
WHERE
	OFFICIAL_VIDEO = 'true'
GROUP BY
	1
ORDER BY
	2 DESC
	-- 9. For each album, calculate the total views of all associated tracks.
SELECT
	ALBUM,
	TRACK,
	SUM(VIEWS)
FROM
	SPOTIFY
GROUP BY
	1,
	2
ORDER BY
	3
	-- 10. Retrieve the track names that have been streamed on Spotify more than YouTube.
SELECT
	*
FROM
	(
		SELECT
			TRACK,
			COALESCE(
				SUM(
					CASE
						WHEN MOST_PLAYED_ON = 'Youtube' THEN STREAM
					END
				),
				0
			) AS STREAMED_ON_YT,
			COALESCE(
				SUM(
					CASE
						WHEN MOST_PLAYED_ON = 'Spotify' THEN STREAM
					END
				),
				0
			) AS STREAMED_ON_SPOTIFY
		FROM
			SPOTIFY
		GROUP BY
			1
	) AS T1
WHERE
	STREAMED_ON_SPOTIFY > STREAMED_ON_YT
	AND STREAMED_ON_YT <> 0
	-- 11.Find the top 3 most-viewed tracks for each artist using window functions.
WITH
	RANKING_ARTIST AS (
		SELECT
			ARTIST,
			TRACK,
			SUM(VIEWS) AS TOTAL_VIEWS,
			DENSE_RANK() OVER (
				PARTITION BY
					ARTIST
				ORDER BY
					SUM(VIEWS) DESC
			) AS RANK
		FROM
			SPOTIFY
		GROUP BY
			1,
			2
		ORDER BY
			1,
			3 DESC
	)
SELECT
	*
FROM
	RANKING_ARTIST
WHERE
	RANK <= 3
	-- 12. Write a query to find tracks where the liveness score is above the average
SELECT
	TRACK,
	ARTIST,
	LIVENESS
FROM
	SPOTIFY
WHERE
	LIVENESS > (
		SELECT
			AVG(LIVENESS)
		FROM
			SPOTIFY
	)
	-- 13. Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.
WITH
	CTE AS (
		SELECT
			ALBUM,
			MAX(ENERGY) AS HIGHEST_ENERGY,
			MIN(ENERGY) AS LOWEST_ENERGY
		FROM
			SPOTIFY
		GROUP BY
			1
	)
SELECT
	ALBUM,
	HIGHEST_ENERGY - LOWEST_ENERGY AS ENERGY_DIFF
FROM
	CTE
ORDER BY
	2 DESC
	-- 14. Find tracks where the energy-to-liveness ratio is greater than 1.2
SELECT
	TRACK,
	ENERGY,
	LIVENESS,
	(ENERGY / LIVENESS) AS ENERGY_LIVENESS_RATIO
FROM
	SPOTIFY
WHERE
	(ENERGY / LIVENESS) > 1.2
	AND (ENERGY / LIVENESS) > 0
	-- 15. Calculate the cumulative sum of likes for tracks ordered by the number of views, using window functions.
SELECT
	ARTIST,
	TRACK,
	VIEWS,
	LIKES,
	SUM(LIKES) OVER (
		ORDER BY
			VIEWS DESC
	) AS CUMULATIVE_LIKES
FROM
	SPOTIFY
ORDER BY
	3 DESC