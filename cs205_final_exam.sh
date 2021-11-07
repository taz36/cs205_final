# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ======= SUMMARY OF POKEMON.DAT ======
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ======= END SUMMARY =======

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way pokemon.dat is formatted.
FILE=$1
# gets the total number of pokemon from last line in file (not including dups)
total=`tail -1 $FILE | cut -f1`
# sums hp column
hp=`awk -F' ' '{sum+=$6;}END{print sum;}' $FILE`
# sums attack column
attack=`awk -F' ' '{sum+=$7;}END{print sum;}' $FILE`
# gets total lines in file
raw_lines=`cat $FILE | wc -l`
# subtracts header line from total lines
total_lines=`expr $raw_lines - 1`
# calc hp average
hpavg=`expr $hp / $total_lines`
# calc attack average
attackavg=`expr $attack / $total_lines`
echo "# ======= SUMMARY OF $FILE ======"
echo "#    Total Pokemon: $total"
echo "#    Avg. HP: $hpavg"
echo "#    Avg. Attack: $attackavg"
echo "# ======= END SUMMARY ======="
