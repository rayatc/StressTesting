set -e
g++ -g -std=c++20 _code.cpp -o code
g++ -g -std=c++20 _gen.cpp -o gen
g++ -g -std=c++20 _brute.cpp -o brute
>log.txt
m=0
for i in {1..10000}; do
    ./gen >input_file
    ./code <input_file >myAnswer
    ./brute <input_file >correctAnswer

    diff -Z myAnswer correctAnswer >/dev/null || break
    clear
    m=$((m + 1))

    echo "Passed test: " $i
    # cat input_file
    # echo ""
    # cat myAnswer
    # echo "----------------------------------"

    echo "Passed test: " $i >>log.txt
    cat input_file >>log.txt
    echo "" >>log.txt
    echo "Solution: " >>log.txt
    echo "" >>log.txt
    echo "Your answer is:" >>log.txt
    cat myAnswer >>log.txt
    echo "" >>log.txt
    echo "----------------------------------" >>log.txt
done

echo "----------------------------------" >>log.txt
clear
echo "Passed" $m "previous tests"
echo "----------------------------------"
echo "WA on the following test:"
cat input_file
echo "Your answer is:"
cat myAnswer
echo
echo "Correct answer is:"
cat correctAnswer
echo
echo "----------------------------------"

echo "WA on the following test:" >>log.txt
cat input_file >>log.txt
echo "Your answer is:" >>log.txt
cat myAnswer >>log.txt
echo "Correct answer is:" >>log.txt
cat correctAnswer >>log.txt
rm code gen brute input_file myAnswer correctAnswer
read -p "Press Enter to continue..."
