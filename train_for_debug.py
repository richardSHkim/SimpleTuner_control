import os
import subprocess

env = "autoever_pixart_sigma"

os.environ["CUDA_VISIBLE_DEVICES"] = "0"
os.environ["CONFIG_BACKEND"] = "json"
os.environ["ENV"] = env
os.environ["ENV_PATH"] = f"{env}/"
os.environ["CONFIG_PATH"] = f"config/{env}/config"
p = subprocess.run([
    "python", "train.py",
])
p.wait()