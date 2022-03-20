current_version=$(<version.txt)   #v1.xx
echo "current version: $current_version"
to_int=${current_version:3}
((to_int++))
new_version="v1.${to_int}"
echo "next version: $new_version"
echo $new_version > version.txt