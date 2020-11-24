ogr2ogr -f "ESRI Shapefile" -sql "SELECT * from gadm36_SVN_2 where NAME_2 = 'Izola'" Izola.shp gadm36_SVN.gpkg
ogrinfo izola.shp koper -so
gdalwarp -cutline izola.shp -crop_to_cutline -t_srs EPSG:32632 dem_merge.tif dem_finished.tif
gdaldem slope dem_finished.tif slope_district.tif -compute_edges
gdaldem hillshade dem_finished.tif hillshade_district.tif -compute_edges