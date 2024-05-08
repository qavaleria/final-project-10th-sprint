#!/bin/bash

#chmod +x task.sh нужно выполнить перед запуском чтобы дать права
# Сохраняем исходную директорию
original_dir=$(pwd)

# Создаем временную рабочую директорию. Использовала временную директорию, чтобы скрипт запускался из любой директории и вёл себя консистентно
tmp_dir=$(mktemp -d)
cd $tmp_dir

# Создаем необходимые директории
mkdir -p dir1 dir2 dir3/dir4

# Создаем пустой файл task/dir2/empty
touch dir2/empty

# Создаем файл hello.sh
echo '#!/bin/bash' > dir2/hello.sh
echo 'echo "$1, привет!"' >> dir2/hello.sh
chmod 764 dir2/hello.sh

# Сохраняем список файлов dir2
ls dir2 > dir2/list.txt

# Копируем dir2 в dir3/dir4
cp -r dir2/* dir3/dir4

# Записываем список *.txt файлов в summary.txt
find . -name "*.txt" > dir1/summary.txt

# Дописываем содержимое list.txt в summary.txt
cat dir2/list.txt >> dir1/summary.txt

# Устанавливаем переменную и выполняем hello.sh
export NAME="Всем студентам"
./dir2/hello.sh "$NAME" >> dir1/summary.txt

# Переименовываем summary.txt
mv dir1/summary.txt Практическое\ задание

# Выводим содержимое файла Практическое задание
cat Практическое\ задание

# Поиск и сортировка строк, содержащих "dir"
grep "dir" Практическое\ задание | sort

# Удаляем временную директорию и возвращаемся в исходную директорию
rm -rf $tmp_dir
cd $original_dir
