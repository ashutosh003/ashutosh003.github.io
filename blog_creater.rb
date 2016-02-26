

puts "Enter the title of the Blog"
title = gets.chomp

paragraph = ["","","","","","","","","",""]
paragraph_title = ["","","","","","","","","",""]
images =  ["","","","","","","","","",""]
paragraph_number = 0
check = false


while check == false do
  
  par_num = nil # initialize the variable so you can invoke methods on it
  until par_num.is_a?(Fixnum) do
  puts "Enter the paragraph number you want to edit from 0 to 9."
  puts "****START FROM 0 for paragraph 1*************"
  par_num = Integer(gets) rescue nil
  end

  if par_num < 0 || par_num > 9
    check = true

  else
    
    puts "Enter paragraph title: "
    parag_title = gets.chomp.to_s
    paragraph_title.insert(par_num, parag_title)
    
    puts "Enter what you want to put in a paragraph: "
    parag = gets.chomp.to_s
    paragraph.insert(par_num, parag)
  
    puts "Enter the image url for the following paragraph: "
    img_url = gets.chomp.to_s
    images.insert(par_num, img_url)
    
    paragraph_number = paragraph_number + 1
    puts "Do you want to add more? (Y for Yes, any other input is no)"
    answer = gets.chomp
  
      if answer == "Y"
        check = false
      else
        check = true
      end
  end
end




 filename = "./blogpost_#{title.tr(" ", "_")}.html".downcase
 blog_file = File.open(filename, "w")
 
 ###############HTML SYNTAX ########################
 blog_file.puts "<!DOCTYPE html>"
 blog_file.puts "<html>"
 blog_file.puts "<head>"
 blog_file.puts "    <title>"
 blog_file.puts "        <b>" + title+"</b>"
 blog_file.puts "    </title>"
 blog_file.puts "    <style>"
 blog_file.puts "        body {"
 blog_file.puts "             background-image: url(\"images/back-g.jpg\")"
 blog_file.puts "        }"
 blog_file.puts "        .titleContainer {"
 blog_file.puts "             margin-top: 10px;"
 blog_file.puts "             margin-left: 30px;"
 blog_file.puts "             margin-right: 10px;"
 blog_file.puts "        }"
 blog_file.puts "        .informationContainer {"
 blog_file.puts "             padding-top: 40px;"
 blog_file.puts "             padding-left: 20px;"
 blog_file.puts "             padding-right: 5px;"
 blog_file.puts "             padding-bottom: 5px;"
 blog_file.puts "             background-color: white;"
 blog_file.puts "             margin: 20px;"
 blog_file.puts "             box-shadow: 5px 5px grey;"
 blog_file.puts "             margin-bottom: 80px;"
 blog_file.puts "        }"
 blog_file.puts "    </style>"
 blog_file.puts "</head>"
 blog_file.puts "<body>"
 blog_file.puts "    <div class=\"titleContainer\">"
 blog_file.puts "        <p>"
 blog_file.puts "            <b> <font size=\"12\" color=\"Orange\">" + title + "</font></b>"
 blog_file.puts "        </p>"
 blog_file.puts "    <div class=\"informationContainer\">"
 (0..paragraph_number-1).each {|i|
 blog_file.puts "        <h1>" + paragraph_title[i] + "</h1>"
 blog_file.puts "       <p>"
 blog_file.puts paragraph[i]
 blog_file.puts "       <img src =\"" + images[i] + "\" height=\"140\" width=\"120\"></img>"
 blog_file.puts "       </p>"
 }
 blog_file.puts "    </div>"
 blog_file.puts "</body>"
 blog_file.puts "</html>"
 
 
 ######################################################
filename.open(filename, "w") do |s|
    s.puts
end


