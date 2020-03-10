Capstone 02: the booking company.
Updated on 03/09/2020


1-) Purpose.

We are going to work with data provided by a company that connects different clients to different firms. More specifically, the company allows clients to book (schedule) visits to firms in order to learn more about their production processes and final products. Each booking has an unique identification which is used as index in the data structure. For confidentiality reason, some information cannot and will not be made public. We have three main objectives:

- Analyze the network between clients booking visits and firms being visited.
- Try to find groups of similar bookings to accurately segment clients (i.e., cluster analysis of bookings).
- Predict whether or not bookings will be canceled.

Please, go to https://github.com/tmivanus/Springboard/tree/master/Capstone_02 to see all data and codes.


2-) Data.

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


3-) Data analysis.
