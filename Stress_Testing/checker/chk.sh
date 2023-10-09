set -e
g++ -g -std=c++20 _code.cpp -o code
g++ -g -std=c++20 _gen.cpp -o gen
g++ -g -std=c++20 _brute.cpp -o brute
g++ -g -std=c++20 _checker.cpp -o checker
>log
m=0
for i in {1..5000}; do
    ./gen >input_file
    ./code <input_file >myAnswer
    ./checker <myAnswer >myVal
    ./brute <input_file >correctAnswer
    ./checker <correctAnswer >correctVal

    diff -Z myVal correctVal >/dev/null || break
    clear
    m=$((m + 1))

    echo "Passed test: " $i
    # cat input_file
    # echo ""
    # echo "Your answer is:"
    # cat myAnswer
    # cat "Your value is" myVal
    # echo "Brute answer is:"
    # cat correctAnswer
    # cat "Brute value is" correctVal
    # echo "----------------------------------"

    echo "Passed test: " $i >>log
    cat input_file >>log
    echo "Solution: " >>log
    cat myAnswer >>log
    echo "" >>log
    cat "Bruteforce answer is:" >>log
    cat correctAnswer >>log
    echo "" >>log
    cat "Solution value is" myVal >>log
    echo "----------------------------------" >>log
done

echo "----------------------------------" >>log
clear
echo "Passed" $m "previous tests"
echo "----------------------------------"
echo "WA on the following test:"
cat input_file
echo "Your answer is:"
echo
cat myAnswer
cat "Your value is" myVal
echo
echo "Bruteforce answer is:"
cat correctAnswer
echo
cat "Bruteforce value is" correctVal

echo "WA on the following test:" >>log
cat input_file >>log
echo "Your answer is:" >>log
cat myAnswer >>log
cat "Your value is" myVal >>log
echo "Correct answer is:" >>log
cat correctAnswer >>log
cat "Correct value is" correctVal >>log

rm code gen brute input_file myAnswer correctAnswer myVal correctVal checker
read -p "Press Enter to continue..."
