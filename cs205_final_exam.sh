# TODO: Modify this file to create a shell script that is able to use awk to go through a file
# formatted like pokemon.dat and provides a printed report in the following format (where your 
# script correctly calculates the values that go into the [VALUE] placeholders):
# ======= SUMMARY OF POKEMON.DAT ======
#    Total Non-Legendary Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Defense: [VALUE]
# ======= END SUMMARY =======

# NOTE THAT YOU MUST USE AWK OR YOU WILL LOSE POINTS
# The "Avg." values should be calculated as mean values for the corresponding columns.
# The averages must only be for non-legendary pokemon.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not
# necessarily be called pokemon.dat. However, you can assume that any file passed to this
# script will be formatted exactly the way pokemon.dat is formatted.

BEGIN{FS="\t"}
{
#check for nonLeg only 
if(NR12!= "FALSE"){
#add total of nonLegendary pokemon
nonLeg +=$1

#add avg of HP
hp +=$6
#calc avg
avgHp = (hp/nonLeg)

#defense sum
defenseSum +=$8

#avg defense
avgDef =( defenseSum/nonLeg)

header = "======= SUMMARY OF POKEMON.DAT ======"
closer = "======== END SUMMARY ======"
}}
END{
#print header
printf (header)
printf"\n"
printf ("   Total Non-Legendary Pokemon: [%i]", nonLeg)
printf"\n"
printf("    Avg. HP: [%i]", avgHp)
printf("\n")
printf("    Avg. Defense: [%i]", avgDef)
printf("\n")
printf(closer)}
