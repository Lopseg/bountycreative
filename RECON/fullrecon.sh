
target=$1
$folder_name=$2
subdomainsWordlist=""

subfinder -d "$target" --silent -o "$folder_name/subdomains_subfinder.txt"
assetfinder --subs-only "$target" | tee "$folder_name/subdomains_assetfinder.txt"
amass enum passive -d "$target" -brute | tee "$folder_name/subdomains_amass.txt"
crt.sh "$target" | sort -u| tee "$folder_name/subdomains_crt-sh.txt"
dnsx -d "$target" -w $subdomainsWordlist| tee "$folder_name/subdomains_knockpy.txt"
cat "$folder_name/subdomains_subfinder.txt" "$folder_name/subdomains_assetfinder.txt" "$folder_name/subdomains_crt-sh.txt" | sort -u >> "$HOME/$folder_name/all_subdomains.txt"
cat "$folder_name/all_subdomains.txt" | httpx -sc -cl -td -silent | tee "$folder_name/httpx.txt"
echo "Subdomain Enumeration is complete" 
#Definir notificacao e meio de comunicacao a ser enviada


gau --threads 50 --providers commoncrawl,otx,urlscan,wayback --o $folder_name/$target.gau
waybackurls $target | tee $folder_name/waybackurls.txt
waymore -i $target -mode U 
echo "URLs finished"

ffuf -u https://www.$target/ -H "FUZZ.$target" -o $folder_name/virtualhost.ffuf
