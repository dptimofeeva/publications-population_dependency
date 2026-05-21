# publications-population_dependency

**data/** — CSV файлы с данными  
- publications_metadata.csv — все публикации с разметкой
- results_TALD.csv — данные по языкам для основной классификации 
- results_Languages_of_the_world.csv — данные по языкам для альтернативной классификации  

**data_processing/** — коды для сбора и обработки данных  
- parsers/ — коды для сбора данных
    - rsl_parser.ipynb — парсер для сбора публикаций из РГБ
    - google_scholar_parser.ipynb — парсер для сбор публикаций из Google Scholar
- language_tagging.ipynb — разметка публикаций по языкам  

**regression_models/** — R коды для регрессионного анализа  
- regression_TALD.R — модель на основной классификации  
- regression_Languages_of_the_world.R — модель на альтернативной классификации 
- regression_TALD_with_first_mention.R — модель на основной классификации с добавлением переменной first_mention  

**visualization/** — коды для построения графиков  
- venn.ipynb — распределение публикаций по источникам (диаграмма Венна)
- pub_by_year.R — динамика количества публикаций по годам (кумулятивно)  
- pub_by_year_branch.R — динамика количества публикаций по ветвям (кумулятивно)
