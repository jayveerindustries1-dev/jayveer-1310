#!/bin/bash

# ============================================
# JAYVEER-1310 SETUP SCRIPT
# Author: Rudrion
# Purpose: One-click environment setup
# ============================================

echo "🚀 Setting up JAYVEER-1310 Option Intelligence System..."

# -------- BASIC CHECKS --------
if ! command -v python3 &> /dev/null
then
    echo "❌ Python3 is not installed. Install Python 3.9+ first."
    exit 1
fi

# -------- CREATE VENV --------
if [ ! -d "venv" ]; then
    echo "📦 Creating virtual environment..."
    python3 -m venv venv
else
    echo "✅ Virtual environment already exists."
fi

# -------- ACTIVATE VENV --------
source venv/bin/activate

# -------- UPGRADE PIP --------
echo "⬆️ Upgrading pip..."
pip install --upgrade pip

# -------- INSTALL REQUIREMENTS --------
if [ -f "requirements.txt" ]; then
    echo "📥 Installing dependencies..."
    pip install -r requirements.txt
else
    echo "⚠️ requirements.txt not found. Installing core packages..."
    pip install streamlit pandas numpy plotly
fi

# -------- CREATE PROJECT STRUCTURE --------
echo "📁 Verifying project folders..."

mkdir -p assets/fonts
mkdir -p assets/images

mkdir -p ui
mkdir -p data
mkdir -p feature_engineering
mkdir -p utils
mkdir -p config

# -------- CREATE __init__.py FILES --------
touch ui/__init__.py
touch data/__init__.py
touch feature_engineering/__init__.py
touch utils/__init__.py
touch config/__init__.py

# -------- DEFAULT FILES (SAFE CREATE) --------
touch streamlit_app.py
touch assets/styles.css

touch ui/layout.py
touch ui/cards.py
touch ui/sidebar.py
touch ui/charts.py

touch data/data_loader.py
touch data/column_mapper.py
touch data/validators.py

touch feature_engineering/oi_engine.py
touch feature_engineering/support_resistance.py
touch feature_engineering/strike_filter.py
touch feature_engineering/metrics.py

touch utils/indian_numbers.py
touch utils/logger.py
touch utils/helpers.py

touch config/settings.py
touch config/thresholds.py
touch config/constants.py

# -------- PERMISSION FIX --------
chmod +x setup.sh

# -------- FINISH --------
echo "✅ Setup completed successfully!"
echo ""
echo "👉 To start the app:"
echo "   source venv/bin/activate"
echo "   streamlit run streamlit_app.py"
echo ""
echo "🧠 JAYVEER-1310 is ready. Happy Trading!"
