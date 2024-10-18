CC=g++
CXXFLAGS=-Wall -Wextra -pedantic -std=c++17
sources=$(wildcard src/*.cpp)
objects=$(sources:src/%.cpp=src/%.o)
headers=$(wildcard src/*.hpp)
executable=spdlog-problem
precompiledheader=src/stdafx.hpp.gch

$(executable): $(objects) Makefile
	$(CC) $(CXXFLAGS) -o $@ \
		$(objects) -lstdc++fs -lpthread

$(objects) : src/%.o : src/%.cpp $(precompiledheader) Makefile
	$(CC) -c $(CXXFLAGS) \
	-Isrc/spdlog/include \
	$< -o $@

$(precompiledheader) : src/stdafx.hpp Makefile
	$(CC) $(CXXFLAGS) \
	-Isrc/spdlog/include \
	$< -o $@

clean :
	rm -rf $(objects) $(executable) $(precompiledheader)

.PHONY : clean
