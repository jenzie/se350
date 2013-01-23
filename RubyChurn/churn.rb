##
# author: Jenny Zhen
# date: 01.23.13
# language: Ruby
# file: churn.rb
# assignment: Churn - SVN Log Analysis
#   http://www.se.rit.edu/~se350/Class_Activities/RubyScripting/analyzingSVNLog.html
##

def parse( date )
  index = 0
  changes = Array.new( subsystems.size )
  subsystems = ["Makefile.in", "gen.c", "gen.h", "main.c", 
    "mappings.i", "peep.c", "peep.h", "peeph-gbz80.def", 
    "peeph-r2k.def", "peeph-z80.def", "peeph.def", "profile.txt",
    "ralloc.c", "ralloc.h", "support.c", "support.h", "z80.h",
    "z80.vcxproj", "z80.vcxproj.filters", "z80a.vcxproj"]

  result = `svn log --revision 'HEAD:{#{date}}'https://sdcc.svn.sourceforge.net/svnroot/sdcc/trunk/sdcc/src/z80/#{subsystems[0]}`

  subsystems.each{ |dir| changes[ ++index ] = result.split("72.times {"-"}).size }
  
  index = 0
  subsystems.each{ |dir| 
    changes.each{ |count| 
      puts dir count.times {"*"}
    }
  }
end