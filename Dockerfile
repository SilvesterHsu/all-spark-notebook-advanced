FROM jupyter/all-spark-notebook

USER root

# install essential software & oh-my-zsh
RUN apt update && \
    apt-get install zsh curl git tree nano -y && \
    chsh -s /bin/zsh && \
    echo y|sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && \
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions && \
    echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc && \
    zsh && \
    rm -rf rm -rf /var/lib/apt/lists/*

# install notebook extensions
RUN pip install jupyter_contrib_nbextensions jupyter_nbextensions_configurator autopep8 notebook && \
    #pip install torch==1.3.1+cpu torchvision==0.4.2+cpu -f https://download.pytorch.org/whl/torch_stable.html && \
    conda install -c conda-forge jupyterlab xeus-python && \
    jupyter labextension enable && \
    jupyter labextension install @jupyterlab/debugger @jupyterlab/toc @lckr/jupyterlab_variableinspector jupyterlab-execute-time && \
    jupyter contrib nbextension install --user && \
    jupyter nbextensions_configurator enable --user && \
    jupyter nbextension enable splitcell/splitcell && \
    jupyter nbextension enable codefolding/main && \
    jupyter nbextension enable execute_time/ExecuteTime && \
    jupyter nbextension enable varInspector/main && \
    jupyter nbextension enable snippets_menu/main && \
    jupyter nbextension enable code_prettify/autopep8 && \
    jupyter nbextension enable toggle_all_line_numbers/main && \
    jupyter nbextension enable latex_envs/latex_envs && \
    echo "c.NotebookApp.terminado_settings = {'shell_command': ['/bin/zsh']}" >> ~/.jupyter/jupyter_notebook_config.py

EXPOSE 8888
RUN mkdir /notebooks
WORKDIR "/notebooks"
VOLUME ["/notebooks"]

CMD ["/bin/bash", "-c", "jupyter lab --ip=0.0.0.0 --allow-root"]
