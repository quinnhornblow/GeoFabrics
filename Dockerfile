FROM continuumio/miniconda3

# Install curl
RUN apt-get update && apt-get install -y curl

# Download and create latest environment
RUN curl https://raw.githubusercontent.com/rosepearson/GeoFabrics/main/environment_linux.yml  > environment.yml
RUN conda env create -f environment.yml

# Activate environment when container starts
RUN echo "source activate geofabrics" > ~/.bashrc
ENV PATH /opt/conda/envs/geofabrics/bin:$PATH

# Set the PROJ_LIB environment variable
ENV PROJ_LIB /opt/conda/envs/geofabrics/share/proj

# Install geofabrics
RUN pip install geofabrics

# # Copy example
# COPY examples/case_study_2/ .

# # Open dask dashboard
# EXPOSE 8787

# CMD ["geofabrics_from_file", "--instructions", "4m_no_waterways.json" ]