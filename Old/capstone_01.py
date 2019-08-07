# -*- coding: utf-8 -*-
"""
Created on Mon Nov 19 16:43:36 2018

@author: Terry
"""

import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

df = pd.read_excel('C:\\Users\\Terry\\Capstone\\df.xlsx')

df['app'] = df['visits'] + df['surgeries']
df['surgeries_app'] = df['surgeries'] / df['app']

d_spec = pd.get_dummies(df['spec'], prefix='spec')
d_year = pd.get_dummies(df['year'], prefix='year')
d_dep = pd.get_dummies(df['dep'], prefix='dep')
df = pd.concat([df, d_spec, d_year, d_dep], axis=1)
print(df.info())

sns.lmplot(y='surgeries_app', x='p_surgery', data=df, hue='spec_DERMATOLOGIA')
plt.ylim(0, 1)
plt.title('surgeries_app X p_surgery')
plt.show()

sns.lmplot(y='surgeries_app', x='p_visit', data=df, hue='spec_DERMATOLOGIA')
plt.ylim(0, 1)
plt.title('surgeries_app X p_visit')
plt.show()

spec_group = df.groupby('spec')[['surgeries_app', 'p_visit', 'p_surgery']].mean()
spec_group = spec_group.sort_values(by='surgeries_app', ascending=False)
my_order = spec_group.index

sns.violinplot(y='surgeries_app', x='spec', data=df, order=my_order)

spec_group.plot(subplots=True)
