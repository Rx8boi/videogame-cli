require "videogame/cli/version"

class CLI
#displaying data for user
#getting data from user

  def call
  	Scrapper.scrape_tech_rdr
  	puts ""
  	puts "        ░░╔══╗░░░░░░░░░░╔══╗░░░░░░░░░░░╔══╗░░░░░░░░░░"
	puts "        ░╚╣▐▐╠╝░░╔══╗░░╚╣▐▐╠╝░░░╔══╗░░╚╣▐▐╠╝░░░╔══╗░░"
	puts "        ░░╚╦╦╝░░╚╣▌▌╠╝░░╚╦╦╝░░░╚╣▌▌╠╝░░╚╦╦╝░░░╚╣▌▌╠╝░"
	puts "        ░░░╚╚░░░░╚╦╦╝░░░░╚╚░░░░░╚╦╦╝░░░░╚╚░░░░░╚╦╦╝░░"
	puts "        ░░░░░░░░░░╝╝░░░░░░░░░░░░░╝╝░░░░░░░░░░░░░╝╝░░░"
	puts " "
    puts "        Welcome to the 2020 Video Game release tracker!"
    puts "   We're excited to share these upcoming releases with you"
    puts "                Compiling upcoming releases".yellow
    sleep(2)
    puts ""
    sleep(2)
    print "."
    sleep(1)
    print "."
	sleep(1)
	print "."
	sleep(1)
	print "."
	sleep(1)
	print "."
	sleep(1)
	print "."
	sleep(1)
    puts ""
        game_list_1
        sleep(1)
        menu_1
end
#method for list of games
# First method will not lead to description escape mechanism?
# second game list takes top 50 next Video Game release tracked... can add up to 100?

  def game_list_1
  	puts ""
  	VideoGame.all.take(25).each.with_index(1) do |game, i | # < - pulling first 25 iterations of VideoGame class as opener
  		puts "#{i}. #{game.title.split("–",)[0]}"
  	end
  end

 def game_list_2
  	puts ""
  	VideoGame.all.take(50).each.with_index(1) do |game, i |
  		puts "#{i}. #{game.title.split("–")[0]}"
  	end
  end

def menu_1
	puts " "
	puts "                 Displaying (25/50)".yellow
	puts "         Would you like to expand the list?"
	puts "                   Enter Y or N".yellow
	expand = gets.strip.downcase
	if expand == "y"
		sleep(1)
		puts ""
		print "LOADING."
		sleep(1)
		print "."
		sleep(1)
		print "."
		sleep(1)
		print "."
		sleep(1)
		print "."
		sleep(1)
		puts ""
		game_list_2
		menu_2
	elsif 	
		expand == "n"
		puts " "
		puts "                Good-Bye"
		puts "      I hope your game releases soon!"
		exit
	else
		puts "                    Invalid Entry".red
		menu_1
	end

end

def menu_2
	puts " "
	puts "                 Displaying (50/50)".yellow
	puts "               Please choose a number: "
	input = gets.chomp
	if !input.to_i.between?(1,50) 
		puts "               Invalid Choice".red
		sleep(2)
		puts "   Please select a valid Video Game from the list"
		sleep(1)
		puts ""
		game_list_2
		menu_2
	else
		game = VideoGame.all[input.to_i-1]
		puts ""
		puts ""
		display_game_status(game) 
	end

	puts ""
	puts ""
	puts ""
	puts "          Interested in another upcoming release?"
	puts "                      Enter Y or N".yellow
	another_game = gets.strip.downcase
	if another_game == "y"
		sleep(1)
		print "LOADING."
		sleep(1)
		print "."
		sleep(1)
		print "."
		sleep(1)
		print "."
		sleep(1)
		print "."
		sleep(1)
		puts ""
		game_list_2
		menu_2
	elsif 	
		another_game == "n"
		puts " "
		puts "                      Thank You!"
		puts "             I hope your wait comes quickly!"
		exit
	else
		puts "               Invalid Entry".red
		menu_2
	end
end

	def display_game_status(game)

puts "║█║▌║█║▌│║▌║▌█║║█║▌║█║▌│║▌║▌█║║█║▌║█║▌│║▌║▌█║║▌│║▌║▌█║"
puts ""
  puts "   Game Information: "
  puts " "
  puts " Name:           #{game.title.split("–")[0]}"
  if game.title.split("–")[1] == nil
  	puts "                     OUT NOW!".yellow
  	menu_2
  else
  puts " Release Date:   #{game.title.split("–")[1]}"
  puts " & Platforms"
  puts " "
  msg = "                  Coming Soon!"        #<---message to be printed
5.times do                  #<----- loops 5 times
      print "\r#{msg}".yellow 
      sleep 0.5                 #<----message stays for 0.5 seconds
      print "\r #{' ' * msg.size}\r"   #<-----wiping screen
      sleep 0.5
  end
end
puts msg  #<------optional
puts ""
puts "║█║▌║█║▌│║▌║▌█║║█║▌║█║▌│║▌║▌█║║█║▌║█║▌│║▌║▌█║║▌│║▌║▌█║"
sleep(1)
	end
end
