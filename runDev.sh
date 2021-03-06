#!/bin/bash

echo "Entering frontend directory ... "
cd frontend
yarn start &
cd ..
echo "Exiting frontend directory ... "
echo ""
echo "Entering backend directory ... "
cd backend
yarn run dev
cd ..
echo "Exiting backend directory ... "
echo ""
echo "Develop Mode Activated ... "