#!/bin/bash

# COM6005 环境自动安装脚本
ENV_NAME="COM6005"
PYTHON_VERSION="3.10.19"

echo "正在创建 $ENV_NAME 环境..."

# 创建conda环境
conda create -n $ENV_NAME python=$PYTHON_VERSION -y

# 激活环境
source $(conda info --base)/etc/profile.d/conda.sh
conda activate $ENV_NAME

echo "环境已创建，正在安装依赖包..."

# 安装conda包
conda install -y \
    appnope \
    asttokens \
    comm \
    debugpy \
    decorator \
    exceptiongroup \
    executing \
    ipykernel \
    ipython \
    jedi \
    jupyter_client \
    jupyter_core \
    matplotlib-inline \
    nest-asyncio \
    packaging \
    parso \
    pexpect \
    pickleshare \
    platformdirs \
    prompt-toolkit \
    psutil \
    ptyprocess \
    pure_eval \
    pygments \
    python-dateutil \
    pyzmq \
    six \
    stack_data \
    tornado \
    traitlets \
    typing_extensions \
    wcwidth \
    zipp

# 安装pip包
pip install --upgrade pip
pip install \
    anyio==4.11.0 \
    argon2-cffi==25.1.0 \
    argon2-cffi-bindings==25.1.0 \
    arrow==1.4.0 \
    attrs==25.4.0 \
    babel==2.17.0 \
    beautifulsoup4==4.14.2 \
    bleach==6.3.0 \
    certifi==2025.10.5 \
    cffi==2.0.0 \
    charset-normalizer==3.4.4 \
    contourpy==1.3.2 \
    cycler==0.12.1 \
    defusedxml==0.7.1 \
    fastjsonschema==2.21.2 \
    fonttools==4.60.1 \
    fqdn==1.5.1 \
    h11==0.16.0 \
    httpcore==1.0.9 \
    httpx==0.28.1 \
    idna==3.11 \
    importlib-metadata==8.7.0 \
    ipywidgets==8.1.8 \
    isoduration==20.11.0 \
    jinja2==3.1.6 \
    joblib==1.5.2 \
    json5==0.12.1 \
    jsonpointer==3.0.0 \
    jsonschema==4.25.1 \
    jsonschema-specifications==2025.9.1 \
    jupyter==1.1.1 \
    jupyter-console==6.6.3 \
    jupyter-events==0.12.0 \
    jupyter-lsp==2.3.0 \
    jupyter-server==2.17.0 \
    jupyter-server-terminals==0.5.3 \
    jupyterlab==4.4.10 \
    jupyterlab-pygments==0.3.0 \
    jupyterlab-server==2.28.0 \
    jupyterlab-widgets==3.0.16 \
    kiwisolver==1.4.9 \
    lark==1.3.1 \
    markupsafe==3.0.3 \
    matplotlib==3.10.7 \
    mistune==3.1.4 \
    nbclient==0.10.2 \
    nbconvert==7.16.6 \
    nbformat==5.10.4 \
    notebook==7.4.7 \
    notebook-shim==0.2.4 \
    numpy==2.2.6 \
    overrides==7.7.0 \
    pandas==2.3.3 \
    pandoc==2.4 \
    pandocfilters==1.5.1 \
    pillow==12.0.0 \
    plumbum==1.10.0 \
    ply==3.11 \
    prometheus-client==0.23.1 \
    pycparser==2.23 \
    pyparsing==3.2.5 \
    python-json-logger==4.0.0 \
    pytz==2025.2 \
    pyyaml==6.0.3 \
    referencing==0.37.0 \
    requests==2.32.5 \
    rfc3339-validator==0.1.4 \
    rfc3986-validator==0.1.1 \
    rfc3987-syntax==1.1.0 \
    rpds-py==0.28.0 \
    scikit-learn==1.7.2 \
    scipy==1.15.3 \
    send2trash==1.8.3 \
    sniffio==1.3.1 \
    soupsieve==2.8 \
    terminado==0.18.1 \
    threadpoolctl==3.6.0 \
    tinycss2==1.4.0 \
    tomli==2.3.0 \
    tzdata==2025.2 \
    uri-template==1.3.0 \
    urllib3==2.5.0 \
    webcolors==25.10.0 \
    webencodings==0.5.1 \
    websocket-client==1.9.0 \
    widgetsnbextension==4.0.15

echo "✅ $ENV_NAME 环境安装完成！"
echo "使用以下命令激活环境："
echo "conda activate $ENV_NAME"