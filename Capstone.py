# -*- coding: utf-8 -*-
"""
Created on Mon Nov 19 16:43:36 2018

@author: Terry
"""

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

data = pd.read_excel('C:\\Users\\Terry\\Capstone\\Data.xlsx')
print(data.info())
print(data.head())

# Is visits different than clients?
plt.subplot(1, 2, 1)
plt.hist(data['Visits'], bins=40)
plt.title('Visits')
plt.subplot(1, 2, 2)
plt.hist(data['Clients'], bins=40)
plt.title('Clients')
plt.tight_layout()
plt.show()

# How different visits and surgeries are?
plt.subplot(1, 2, 1)
plt.hist(data['Visits'], bins=40)
plt.title('Visits')
plt.subplot(1, 2, 2)
plt.hist(data['Surgeries'], bins=40)
plt.title('Surgeries')
plt.tight_layout()
plt.show()

# Visits per surgery (what explains that?)
data['Visits_surgery'] = data['Visits']/data['Surgeries']
plt.hist(data['Visits_surgery'], bins=40)
plt.title('Visits per surgery')
