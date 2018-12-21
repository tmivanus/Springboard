# -*- coding: utf-8 -*-
"""
Created on Mon Nov 19 16:43:36 2018

@author: Terry
"""

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_excel('C:\\Users\\Terry\\Capstone\\df.xlsx')
print(df.info())
print(df.head())

# How different appointments and surgeries are?
df['app'] = df['visits'] + df['surgeries']
plt.subplot(1, 2, 1)
plt.hist(df['app'], bins=40)
plt.title('appointments')
plt.subplot(1, 2, 2)
plt.hist(df['surgeries'], bins=40)
plt.title('surgeries')
plt.tight_layout()
plt.show()

# Surgeries per appointment (what explains that?)
df['surgeries_app'] = df['surgeries']/df['app']
plt.hist(df['surgeries_app'], bins=40)
plt.title('Surgeries per appointment')
