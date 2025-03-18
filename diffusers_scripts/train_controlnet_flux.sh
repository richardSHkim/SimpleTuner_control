#!/bin/bash


accelerate launch --num_processes=4 diffusers_scripts/train_controlnet_flux.py \
    --pretrained_model_name_or_path="black-forest-labs/FLUX.1-dev" \
    --jsonl_for_train="datasets/a2d2/data_simple.json" \
    --data_root="datasets/a2d2" \
    --conditioning_image_column=conditioning_image \
    --image_column=image \
    --caption_column=text \
    --output_dir="outputs/a2d2/flux_controlnet_diffusers" \
    --mixed_precision="bf16" \
    --resolution=1024 \
    --learning_rate=1e-5 \
    --max_train_steps=15000 \
    --validation_steps=500 \
    --checkpointing_steps=500 \
    --validation_image "datasets/a2d2/data/eval/20180807145028_camera_frontcenter_000000091.png" "datasets/a2d2/data/eval/20180807145028_camera_frontcenter_000005828.png" \
    --validation_prompt "rainy day" "snowy day" \
    --train_batch_size=1 \
    --gradient_accumulation_steps=4 \
    --report_to="wandb" \
    --wandb_project_name="a2d2" \
    --wandb_run_name="flux_controlnet_diffusers" \
    --num_double_layers=4 \
    --num_single_layers=0 \
    --seed=42