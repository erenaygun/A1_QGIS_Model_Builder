----------------------------------------------------------------------------------------------------------------------------------------------------------------------
Aufgabe 2
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
2.1) Retrieving information about the DEM files [3pt]

Mit $gdalinfo liest man die verlangten Informationen aus den Dateien ab. 

N45E014
----------------------------------
EPSG: 4326
File Format: .hgt
Resolution: 3601x3601 pixel x pixel

n45_e013_1arc_v3
--------------------------------
EPSG: 4326
File Format: .tif
Resolution: 3601x3601 pixel x pixel

2.2) Creating a raster mosaic [4pt]

Mit $gdal_merge -o dem_merge.tif n45_e013_1arc_v3.tif N45E014.hgt und  $gdalbuildvrt dem_buildvrt.vrt n45_e013_1arc_v3.tif N45E014.hgt kann man die genannten 
Dateien mergen. Allerdings muss man bei gdalbuildvrt aufpassen, da gdalbuildvrt heterogene Farbenbänder-Interpretation nicht unterstützt und nur graue Bänder akzeptiert.
Außerdem ist der Raster-Layer, der mit gdal_merge erzeugt worden ist, schärfer bzw. detaillierter und umfasst eine größere Fläche als der Raster-Layer mit gdalbuilvrt

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

Aufgabe 3
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

3.2) Select target district using ogr2ogr [1pt]

In die Batch-Datei wird der Befehl $ogr2ogr -f "ESRI Shapefile" -sql "SELECT * from gadm36_SVN_2 where NAME_2 = 'Koper'" koper.shp gadm36_SVN.gpkg eingetippt. Dieser
Befehl nimmt den Layer gadm36_SVN_2 aus der Datei gadm36_SVN.gpkg, schneidet die Gemeinde 'Koper' heraus und fasst diese in einer neuen Datei auf.
 
Mit $ogrinfo koper.shp koper -so überprüft man, welche Infos in der zugeschnitten Dateien zusammengefasst sind.

3.3) Clip the DEM to district. [1pt]

Mit dem Befehl $gdalwarp -cutline koper.shp -crop_to_cutline -t_srs EPSG:32632 dem_merge.tif dem_finished.tif schneidet man die Datei zu und projiziert sie um. 

3.4) Calculate the slope [1pt]

$gdaldem slope dem_finished.tif slope_district.tif -compute_edges , berechnet die Hangneigung

3.5) Create a hillshade image [1pt]

$gdaldem hillshade dem_finished.tif hillshade_district.tif -compute_edges , erstellt ein Bild


