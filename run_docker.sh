docker build -t geo_container .
docker run -it -u $UID:$UID -v $PWD/examples/case_study_2:/project -w /project -p 8787:8787 geo_container geofabrics_from_file --instructions 4m_no_waterways.json