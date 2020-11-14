**Capstone 02: the booking company.**  
*Updated on 10/28/2020.*

**1-) Purpose.**

We are going to work with data provided by a company that connects different clients to different firms. More specifically, the company allows clients to book (schedule) visits to firms in order to learn more about their production processes and final products. Each booking has an unique identification which is used as index in the data structure. For confidentiality reason, some information cannot and will not be made public. We have the following main objectives:

- Organize the data in a single dataframe format.
- Create a dictionary to help preserve the meaning of more obscure variables. 
- Save all the newly organized information in the format of csv files as a backup.
- Analyze the dataframe looking for missing data or mistakes.
- Select a balanced subset of firms to be included in a more focused analysis approach. 
- Analyze the network between clients booking visits and firms being visited.
- Use supervised classification to predict relevant missing data.
- Use unsupervised learning techniques to identify potential groups (clusters) of bookings based on the information available about each individual booking.


Please, go to https://github.com/tmivanus/Springboard/tree/master/Capstone_02 to see all data and codes.

**2-) Data.**

The original data was stored in four different sheets inside a microsoft excel file named 'data_original'. That excel file was lightly organized and saved as a microsoft excel file named 'data_organized'. From 'data_organized' came three csv files: 'bookings_questions_data', 'bookings_addons_data' and 'main_data'. From the internet came other three csv files with necessary additional information: 'countries_data', 'us_regions_data' and 'us_zipcodes_data'. In particular, the source of 'us_zipcodes_data.csv' is https://simple.wikipedia.org/wiki/List_of_ZIP_Code_prefixes. In summary, we are going to work with the following six csv files in the 'data' directory:

    - countries_data.csv
    - us_regions_data.csv
    - us_zipcodes_data.csv
    - bookings_questions_data.csv
    - bookings_addons_data.csv
    - main_data.csv

Some of those files are not in fact made publicly available for confidentiality reason. All those files are handled by the 'data_preparation' code file. Please, check the 'data_preparation' code file for detailed information.

- 'countries_data.csv' contains the abbreviation code and the full name of several countries. From it comes 'country_dic', which is a dictionary with abbreviation code (key) and full name (value) for each country, and 'country_indic', which is the inverted 'country_dic' dictionary.

- 'us_regions_data.csv' contains the abbreviation code and the full name of all US states and territories. From it comes 'us_region_dic', which is a dictionary with abbreviation code (key) and full name (value) for each US state or territory, and 'us_region_indic', which is the inverted 'us_region_dic' dictionary.

- 'us_zipcodes_data.csv' contains the zipcode prefixes and the abbreviation code of US states and territories. From it comes 'us_zipcode_dic', which is a dictionary with zipcode prefixes (key) and abbreviation code (value) of US states or territories.

- 'bookings_questions_data.csv' contains extra four categorical questions associated with some bookings (named as questions 'q4' to 'q7'). From it comes questions_df, which is a dataframe with booking id and columns for questions 'q4' to 'q7', and four dictionaries describing those questions (named as dictionaries 'q4_dic' to 'q7_dic').

- 'bookings_addons_data.csv' contains add-ons purchases associated with some bookings. It informs price, quantity and revenue (price x quantity) of 27 different add-ons. Add-ons can be, for example, souvenirs or special additions to the booking. From that file comes 'addons_df', which is a dataframe with booking id and columns related to 'addon_01' through 'addon_27', and 'addons_dic', which is a dictionary with 'addon_01' through 'addon_27' as keys, and their descriptions as values.

- 'main_data.csv', as the name suggests, is the main file with several different information associate with all bookings between 2016-08-31 and 2017-12-31. There is information about the client booking a visit, the booking itself, and the firm to be visited. From it comes 'main_df', which is a dataframe with booking id and several columns of information, and many dictionaries describing some of the columns (named as dictionaries 'firm_id_dic', 'firm_type_dic', 'status_cancel_dic', 'source_online_dic', 'payment_cc_dic', 'discount_dic', 'q1_bef_dic', 'q1_aft_dic', 'q2_dic' and 'q3_dic')

'data_preparation' code file organize all those csv files in a single dataframe called 'final_df'. In addition, all dictionaries are preserved in 'final_dic' (a dictionary of dictionaries) and all publicly available dictionaries are preserved in 'final_dic_pub' (also a dictionary of dictionaries). 'data_preparation' code file also saves all this information in the format of four csv files located in a newly created 'data_new' directory:

    - final_df.csv
    - final_df_dtypelist.csv
    - final_dic_df.csv
    - final_dic_pub_df.csv

'final_df.csv' and 'final_df_dtypelist.csv' are both necessary to recover 'final_df'. 'final_dic_df.csv' is necessary to recover 'final_dic'. Finally, 'final_dic_pub_df.csv' is necessary to recover 'final_dic_pub'. Please, check the last code cells in 'data_preparation' code file for a demonstration of how to recover 'final_df', 'final_dic' and 'final_dic_pub' using the csv files in the 'data_new' directory. In reality, for confidentiality reason, 'final_dic' is not made publicly available. Instead, only its censored version 'final_dic_pub' is made publicly available.

**3-) Data analysis.**

**3.1-) Getting to know the dataframe and initial trimming.**

We use the 'data_analysis_and_results' code file to analyze the data stored in the dataframe 'final_df', which is located in the directory 'data_new'. The reader can check the 'data_preparation' code file to find out how 'final_df' was built. Many columns in that dataframe have self-explanatory titles. Other columns have descriptions located in the nested dictionary 'final_dic' (a dictionary of dictionaries). In reality, for confidentiality reason, 'final_dic' is not made publicly available. Instead, only its censored version 'final_dic_pub' is made publicly available.

The files stored in the directory 'data_new' are actually csv files. We use them to recover 'final_df' and 'final_dic_pub' (the recovering of 'final_dic' is for private use only). In order to keep things safe and simple, we actually work with a copy of 'final_df' called just 'df' and a copy of 'final_dic_pub' called just 'df_dic_pub' (there is also a copy of 'final_dic' called 'df_dic' but it is for private use only).

We first took a closer look at some variables to better understand them and detect possible problems. Please, check the 'data_analysis_and_results' code file for detailed information. We worked only with 'firm_id' 40638, 36146 and 26742 in a more focused analysis approach. We selected these three firms because they have a high and somewhat balanced amount of non-null entries. We then trimmed the dataframe 'df' by:

- ditching rows related to 'firm_id' other than 40638, 36146 and 26742.
- ditching rows with null entries based on columns expected to have equal number of non-null entries ('firm_id', 'country', 'us_region', 'us_zipcode').
- ditching 'age', 'age_range' and 'guests_in' columns due to the reasons explained in 'data_analysis_and_results' code file.
- ditching the unnecessary 'merge_questions' and 'merge_addons' columns.

It is worth noting that the original dataframe 'df' can be recovered any time if necessary by using the command df = final_df.copy(). After this first trimming process, the resulting dataframe 'df' shows firms 40638, 36146 and 26742 as having respectively 9005, 8043 and 7983 non-null entries (25031 non-null entries in total). Some columns related to questions (those starting with 'q') and addons (those starting with 'addons') were also deleted because they presented only null values. They refer to questions and addons that are not relevant to the three firms being investigated.

**3.2-) Network analysis.**

Network analysis was implemented to see how different firms attract different clients from different regions (US states or foreign countries). We built a directed network that shows regions in blue connecting to firms in red. It uses booking data from 2016-08-31 to 2017-12-31 ('contact_date'). The size of each node is proportional to its degree (number of edges connecting it). The number on each edge informs its weight in terms of number of connections that edge actually represents. Technically speaking, we built a Weighted DiGraph representing a MultiDiGraph. Higher weights at the edges pull the regions closer to the firms as if firms more connected to a certain region exert more gravitational force on that region. The resulting layout shows that locality is an important attractiveness factor.

We also studied the projected degree centrality values of region nodes per week. In a short period of time like a week, it is much more likely that the network formed will contain region nodes with projected degree centrality value lower than 1. The motivation was to see if we could build a meaningful numerical scale to represent the categorical variable 'us_region' based on connectivity. We were able to calculate for each region the 95% confidence interval (95% c. i.) for the mean of the weekly projected degree centrality values. Given a long period of weeks, it is possible to observe which regions are statistically similar or distinct in terms of projected conectivity among them. Most importantly, regions can be represented on a connectivity scale between 0 and 1. The minimum, maximum and middle of these confidence intervals can be used in other quantitative analyses, assuming that those intervals will remain stable as time (weeks) continous to pass. That information was added to the dataframe under the columns 'region_dc_95min' (minimum value of the 95% c. i.), 'region_dc_95max' (maximum value of the 95% c. i.), 'region_dc_mean' (middle value of the 95% c. i., which is the mean of the weekly projected degree centrality values) and 'region_dc_half_size' (half the size of the 95% c. i.).

**3.2-) Final trimming, supervised classification and unsupervised clustering.**

After further analysis and better understanding of the dataframe 'df' (please, check the details in 'data_analysis_and_results' code file), we carried out one last trimming process:

- Columns 'q3' and 'feedback' were ditched. Among the columns related to questions and feedback, only 'q1_bef' and 'q2' have a good amount of non-null entries. The column 'q1_aft' was kept in spite of its high number of null entries because it is an interesting follow-up of column 'q1_bef'.
- Columns related to addons were ditched. They are specific to each firm. Addons 02, 10, 11 and 24 are specific to firm 40638. Addons 01, 13, 14 and 16 are specific to firm 36146. There is no addons for firm 26742. In each case, the amount of non-null entries is small compared to the size of the sample. On the other hand, the columns 'tot_rev_addons' and 'tot_rev' were kept.
- Column 'tot_quant_addons' was ditched. It does not make sense to sum quantities of addons from different varieties or qualities.
- The columns 'status_cancel' and 'payment_cc' were ditched. The data available for them practically doesn't vary. On the other hand, the columns 'source_online' and 'guests' were kept.
- Rows where column 'fee' have values above the threshold of the 3rd quartile (i.e., the 75th percentile) were ditched just to play safe. They represent less than 4% of the entries for each 'firm_id' (less than 2.5% of all entries in total).
- Rows where the columns 'q1_bef' and 'q2' are null were ditched. In regard to 'q1_bef', they represent between 6.79% and 1.79% of the entries depending on the 'firm_id' (4.08% of all entries in total). In regard to 'q2', they represent between 5.39% and 1.79% of the entries depending on the 'firm_id' (3.58% of all entries in total).

In summary, 29 columns and 1421 rows were lost (regarding the rows, they represent 5.68% of the total rows in the dataframe before the trimming process). Some columns were also removed after the trimming process due to lack of variation (namely 'visit_year' and 'source_online'). The resulting dataframe contains 29 columns and 23610 entries. It is leaner, easier to read and has no null entries except in 'q1_aft'.

After this last trimming process, 'q1_aft' contained 14,851 null entries (about 63% of the entries). However, there was enough non-null entries to allow for "guessing" the null entries by using supervised classification. In fact, we actually worked with a variable still connected to 'q1_aft' but expressing a reduced number of categories. The original plan would include 'q1_aft' directly. However, by doing so, we would have to deal with eleven categories: scores from 0 to 10. Instead, we decided to take the difference between 'q1_aft' and 'q1_bef'. We then created a new variable called 'q1_dif3' which associates the value -1 for 'q1_aft' - 'q1_bef' < 0, 0 for 'q1_aft' - 'q1_bef' = 0, and 1 for 'q1_aft' - 'q1_bef' > 0. In short, the new target variable 'q1_dif3' has only three categories: -1 if the visit had a negative impact on the client, 0 if the visit was neutral, and 1 if the visit had a positive impact on the client.



... This 'read_me' is under construction, but the code file has been completed. Please, check 'data_analysis_and_results' code file. Be aware that sometimes you need to reload the code file more than once so it can be visualized here at github ...
