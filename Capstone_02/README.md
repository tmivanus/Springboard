Capstone 02: the booking company.
Updated on 03/09/2020

1-) Purpose.

The present study has three main objectives:

- 


The main purpose of the present study is to understand the role of specialty, locality and time in explaining/predicting the variability of the medical practice in terms of number of patients, visits and ambulatory surgeries. If the role of specialty, locality and time is weak, then other factors such as moral hazard and supplier-induced demand may need to be investigated.

Please, go to capstone_01_report for more details.
Please, go to https://github.com/tmivanus/Springboard/tree/master/Capstone_01 to see all data and codes.

2-) Data.

The data comes from a sample of the database of a Colombian health insurance company. Please, check the "original_data" directory. The data was originally divided into seven csv files:

    datos_ambulatorios_2008: doctor, specialty, patients, visits and ambulatory surgeries in 2008.
    datos_ambulatorios_2009: doctor, specialty, patients, visits and ambulatory surgeries in 2009.
    datos_ambulatorios_2010: doctor, specialty, patients, visits and ambulatory surgeries in 2010.
    datos_ambulatorios_2011: doctor, specialty, patients, visits and ambulatory surgeries in 2011.
    datos_ambulatorios_2012: doctor, specialty, patients, visits and ambulatory surgeries in 2012.
    datos_departamentos: doctor, year (2008-2012), locality (Colombian department).
    costos_promedios_ambulatorios: specialty, year (2008-2012), mean cost of visit and ambulatory surgery (USD).

"00_erase_doc_name_datos_ambulatorios_ano" code file removes the names of the doctors from the first five csv files, substituting them for identification codes in order to preserve data confidentiality. It creates five new csv files to replace those with confidentiality issues (which obviously are not made available in the "original_data" directory for that reason):

    datos_ambulatorios_2008_new.
    datos_ambulatorios_2009_new.
    datos_ambulatorios_2010_new.
    datos_ambulatorios_2011_new.
    datos_ambulatorios_2012_new.

"01_data_outpatient_years" code file organize the newly created five csv files into python pandas dataframes, which are then saved in the "data" directory as the following csv files (please, check the "data" directory):

    data_outpatient_2008.
    data_outpatient_2009.
    data_outpatient_2010.
    data_outpatient_2011.
    data_outpatient_2012.

"01_optional_data_outpatient_year_details" code file is optional in case the reader wishes to see the tasks that are being performed in "01_data_outpatient_years" code file step-by-step (just choose a year in the second cell). Otherwise, skip it.

"02_mean_outpatient_costs_usd" code file deals with the "costos_promedios_ambulatorios" csv file, organizing it into a python pandas dataframe and saving it in the "data" directory as "mean_outpatient_costs_usd" csv file. It also translates the specialty of each doctor from Spanish to English using Google Translate.

"03_data_departments" code file organizes the "datos_departamentos" csv file into a python pandas dataframe, saving it in the "data" directory as "data_departments" csv file.

"04_panel" code file put together all the previously created csv files in the "data" directory to form a panel data. It concatenates all the "data_outpatient" files from 2008 to 2012 and then merges it with "mean_outpatient_costs_usd" and "data_departments" files. The resulting panel data is saved in the "data" directory as "data_panel" csv file. It contains 8294 rows and 12 columns of information. 10 rows were discarded because of errors involving the doctor’s specialty name or specialty identification code.
