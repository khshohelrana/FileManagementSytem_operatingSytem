
menu() {
    echo "Press 1 to Show all files"
    echo "Press 2 to Create a new file"
    echo "Press 3 to Delete an existing file"
    echo "Press 4 to Rename file"
    echo "Press 5 to Edit file content"
    echo "Press 6 to Search a file"
    echo "Press 7 to Search Details of a file"
    echo "Press 8 to View Contents of a file"
    echo "Press 9 to Sort contents of a file"
    echo "Press 10 to list all directories"
    echo "Press 11 Total No. of Directories"
    echo "Press 12 Total N0. of Files in Current Directory"
    echo "Press 13 to Sort Files"
    echo "Press 14 to Create a new directory"
    echo "Press 15 to Remove a directory"
    echo "Press 16 to Move a directory"
    echo "Press 17 to Copy a directory"
    echo "Press 18 to Open a directory"
    echo "Press 19 to Rename a directory"
    echo "Press 20 to List all files and directories of a directory"
     
}

menu

i="0"
while [ $i -lt 100 ]
do
    read -p "Enter your choice (0 to 20): " opt1
   
    clear  

    case $opt1 in
        1)
     
            echo "List all files and Directories here.."
        echo "Showing all files and directories...."
        sleep 3
        echo "Loading.."
        sleep 3
        echo "-------------------------------OutPut------------------------------------"
        ls
        echo " "
            ;;
        2)
    
        echo "Create New Files here.."
            echo "Which type of file you want to create!"
            echo "1- .c"
            echo "2- .sh"
            echo "3- .txt"
            read -p "Enter your choice from 1-3: " filechoice

            case $filechoice in
                1)
                    read -p "Enter File Name without .c Extension: " filename
                    touch "$filename.c"
                    echo "File Created Successfully"
                    echo " "
                    ;;
                2)
                    read -p "Enter File Name without .sh Extension: " filename2
                    touch "$filename2.sh"
                    echo "File Created Successfully"
                    echo " "
                    ;;
                3)
                    read -p "Enter File Name without .txt Extension: " filename3
                    touch "$filename3.txt"
                    echo "File Created Successfully"
                    echo " "
                    ;;
                *)
                    echo "Invalid Input. Try Again."
                    echo " "
                    ;;
            esac
            ;;
     3)
            
            echo "Delete existing files here.. "
        echo "Enter name of File you want to Delete!"
        echo "Note: Please Enter full Name with Extension."
        read delfile
        echo "-------------------------------OutPut------------------------------------"
        if [ -f "$delfile" ];
        then
            rm $delfile
            echo "Successfully Deleted."
            echo " "
        else
            echo "File Does not Exist..Try again"
            echo " "
        fi
            ;;
        4)
           
            echo "-------------------------------OutPut------------------------------------"
            echo "Rename files here.."
            echo "Enter Old Name of File with Extension.."
            read old
            echo "Checking for file..."
            sleep 3
            if [ -f "$old" ];
            then
                echo "Ok File Exist."
                echo "Now Enter New Name for file with Extension"
                read new
                mv $old $new
                echo "Successfully Rename."
                echo "Now Your File Exist with $new Name"
            else
                echo "$old does not exist..Try again with correct filename."
            fi
            echo " "
            ;;
        5)
            
            echo "Edit file content here.."
            echo "Enter File Name with Extension : "
            read edit
            echo "-------------------------------OutPut-----------------------------------"
            echo "Checking for file.."
            sleep 3
            if [ -f "$edit" ];
            then
                echo "Opening file.."
                sleep 3
                nano $edit
                echo " "
            else
                echo "$edit File does not exist..Try again."
            fi
            ;;
        6)
            
            echo "Search files here.."
            echo "Enter File Name with Extension to search"
            read f
            echo "-------------------------------OutPut------------------------------------"
            if [ -f "$f" ];
            then
                echo "Searching for $f"
                echo " "
            else
                echo "File Does not Exist..Try again."
                echo " "
            fi
            ;;
        7)
            echo "Search Details of a file here.."       
            echo "Enter File Name with Extension to see Detail :"
            read detail
            echo "-------------------------------OutPut------------------------------------"
            echo "Checking for file.."
            sleep 4
            if [ -f "$detail" ];
            then
                echo "Loading Properties.."
                stat $detail
            else
                echo "$detail File does not exist..Try again"
            fi
            echo " "
            ;;
        8)
            echo "View Contents of a file here.."           
            echo "Enter File Name : "
            read readfile
            echo "-------------------------------OutPut------------------------------------"
            if [ -f "$readfile" ];
            then
                echo "Showing file content.."
                sleep 3
                cat $readfile
            else
                echo "$readfile does not exist"
            fi
            echo " "
            ;;
        9)
            echo "Sort contents of a file here.."
              echo "Enter File Name with Extension to sort :"
             read sortfile
              echo "-------------------------------OutPut------------------------------------"
               if [ -f "$sortfile" ]
              then
              echo "Sorting File Content.."
                sleep 3
                 sort "$sortfile"
              else
                   echo "$sortfile File does not exist..Try again."
              fi
               echo " "
            ;;
        10)
             echo "-------------------------------OutPut------------------------------------"
            echo "List of all Directories here.."
            echo "showing all Directories..."
            echo "Loading.."
            sleep 3
            ls -d */
            echo " "
            ;;
        11)
            echo "-------------------------------OutPut------------------------------------"
            echo "Total number of Directories here.."
            echo "Loading all directories.."
            sleep 3
            echo "Counting.."
            sleep 3
            echo "Number of Directories are :"
            echo */ | wc -w
            echo " "
            ;;
        12)
            echo "-------------------------------OutPut------------------------------------"
            echo "Total Numbers of Files in Current Directory here.."
            echo "Loading all files.."
            sleep 3
            echo "Number of Files are :"
            ls -l | grep -v 'total' | grep -v '^d' | wc -l
            echo " "
            ;;
        13)
            echo "-------------------------------OutPut------------------------------------"
            echo "Sort Files here.."
            echo "Your Request of Sorting file is Generated."
            echo "Sorting.."
            sleep 3
            ls | sort
            echo " "
            ;;
         14)
            echo "Create a new directory here.."
            read -p "Enter the name of the new directory: " newdir
            mkdir "$newdir"
            echo "-------------------------------OutPut------------------------------------"
            echo "Directory '$newdir' created successfully."
            ;;
        15)
            echo "Remove a directory here.."
            read -p "Enter the name of the directory to remove: " removedir
            rmdir "$removedir"
            echo "-------------------------------OutPut------------------------------------"
            echo "Directory '$removedir' removed successfully."
            ;;
          16)
            echo "Move or Rename a directory here.."
            read -p "Enter the current name of the directory: " currentdir
            read -p "Enter the new name or path of the directory: " newdir
            mv "$currentdir" "$newdir"
            echo "-------------------------------OutPut------------------------------------"
            echo "Directory '$currentdir' moved or renamed to '$newdir' successfully."
            ;;
          17)
            echo "Copy a directory here.."
            read -p "Enter the name of the directory to copy: " sourcedir
            read -p "Enter the destination path: " destination
            cp -r "$sourcedir" "$destination"
            echo "-------------------------------OutPut------------------------------------"
            echo "Directory '$sourcedir' copied to '$destination' successfully."
            ;;
          18)
            echo "Open a directory here.."
            read -p "Enter the name of the directory to open: " opendirectory
            xdg-open "$opendirectory"
            echo "-------------------------------OutPut------------------------------------"
            echo "Opening directory '$opendirectory'."
            ;;
          
         19)
           read -p "Enter the current name of the directory: " old_directory
           read -p "Enter the new name for the directory: " new_directory

           if [ -d "$old_directory" ]; then
              mv "$old_directory" "$new_directory"
              echo "Directory renamed successfully."
           else
             echo "Directory not found. Please enter a valid directory name."
            fi 
            ;;
         20)
            echo "List all files and directories of a directory here.."
            read -p "Enter the path of the directory: " listdirectory
            echo "-------------------------------OutPut------------------------------------"
            ls "$listdirectory"
            ;;
          
        *)
            echo "Invalid option.. Try again."
            ;;
        0) echo "Good Bye.."
            echo "Successfully Exit"
            exit 0
    esac

    echo " "
    menu
done

