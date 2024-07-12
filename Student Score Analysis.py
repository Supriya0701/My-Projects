#!/usr/bin/env python
# coding: utf-8

# In[7]:


import numpy as np 
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns


# In[9]:


df=pd.read_csv("C:/Users/Mahesh/Downloads/archive (1)/Expanded_data_with_more_features.csv")
print(df)



# #we need to find is the impact of parent's education on their students or
# #we need to find which type of food are they eating?
# #are they regulary playing sports or not it effects on score or not?
# # what is their parent marrital status it effects on their score or not?

# In[11]:


print(df.head())


# In[13]:


df.describe()


# In[15]:


df.info()


# In[17]:


df.isnull().sum()


# In[19]:


#drop unnamed column
df=df.drop("Unnamed: 0",axis=1)


# In[21]:


print(df.head())


# gender distribution

# In[23]:


plt.figure(figsize=(4,3))
ax=sns.countplot(data=df,x="Gender")
ax.bar_label(ax.containers[0])
plt.show()

           
           


# In[ ]:


#from the above chart we have analyze that number of females is more than number of maless


# In[25]:


gp=df.groupby("ParentEduc").agg({"MathScore":'mean',"ReadingScore":'mean',"WritingScore":'mean'})
print(gp)


# In[57]:


sns.heatmap(gp,annot = True)
plt.title("Relationship between parent education and student score")
plt.show()


# In[39]:


#from the above chart we have concluded the education of the parents have a good impact on the score of childrem.


# In[63]:


gp1=df.groupby("ParentMaritalStatus").agg({"MathScore":'mean',"ReadingScore":'mean',"WritingScore":'mean'})

print(gp1)


# In[61]:


sns.heatmap(gp1,annot=True)
plt.title("Relationship between ParentMaritalStatus and student score")
plt.show()


# In[65]:


#from the above chart we have concluded that there is no/negligible impact on student score.


# In[69]:


sns.boxplot(data=df,x="MathScore")
plt.show()


# In[71]:


sns.boxplot(data=df,x="ReadingScore")
plt.show()


# In[77]:


sns.boxplot(data=df,x="WritingScore")
plt.show()


# In[79]:


print(df["EthnicGroup"].unique())      


# #Distribution of ethnic group

# In[94]:


groupA=df.loc[(df['EthnicGroup']=='group A')].count()
groupB=df.loc[(df['EthnicGroup']=='group B')].count()
groupC=df.loc[(df['EthnicGroup']=='group C')].count()
groupD=df.loc[(df['EthnicGroup']=='group D')].count()
groupE=df.loc[(df['EthnicGroup']=='group E')].count()
l=["group A","group B","group C","group D","group E"]
mlist=[groupA["EthnicGroup"],groupB["EthnicGroup"],groupC["EthnicGroup"],groupD["EthnicGroup"],groupE["EthnicGroup"]]
plt.title("Distribution of Ethnic Groups")
plt.pie(mlist,labels=l,autopct="%1.2f%%")
plt.show()


# In[96]:


ax=sns.countplot(data=df,x="EthnicGroup")
ax.bar_label(ax.containers[0])
plt.show()


# In[ ]:




