echo "
                     ____                     ____        _ _         ____            
                    | __ ) _   _ _ __ _ __   / ___| _   _(_) |_ ___  |  _ \ _ __ ___  
                    |  _ \| | | | '__| '_ \  \___ \| | | | | __/ _ \ | |_) | '__/ _ \ 
                    | |_) | |_| | |  | |_) |  ___) | |_| | | ||  __/ |  __/| | | (_) |
                    |____/ \__,_|_|  | .__/  |____/ \__,_|_|\__\___| |_|   |_|  \___/ 
                                     |_|                                              
                         ____                      _                 _           
                        |  _ \  _____      ___ __ | | ___   __ _  __| | ___ _ __ 
                        | | | |/ _ \ \ /\ / / '_ \| |/ _ \ / _` |/ _` |/ _ \ '__|
                        | |_| | (_) \ V  V /| | | | | (_) | (_| | (_| |  __/ |   
                        |____/ \___/ \_/\_/ |_| |_|_|\___/ \__,_|\__,_|\___|_|
                                           
"

# Set Wget Progress to Silent, Becuase it slows down Downloading by +50x
echo "Setting Wget Progress to Silent, Becuase it slows down Downloading by +50x`n"
$ProgressPreference = 'SilentlyContinue'

# Check JDK-18 Availability or Download JDK-19
$jdk18 = Get-WmiObject -Class Win32_Product -filter "Vendor='Oracle Corporation'" |where Caption -clike "Java(TM) SE Development Kit 19*"
if (!($jdk18)){
    echo "`t`tDownnloading Java JDK-19 ...."
    wget "https://download.oracle.com/java/19/latest/jdk-19_windows-x64_bin.exe" -O jdk-19.exe    
    echo "`n`t`tJDK-19 Downloaded, lets start the Installation process"
    start -wait jdk-19.exe
    rm jdk-19.exe
}else{
    echo "Required JDK-19 is Installed"
    $jdk18
}