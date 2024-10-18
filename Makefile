CC=g++
CXXFLAGS=-Wall -Wextra -pedantic -std=c++17
sources=$(wildcard src/*.cpp)
objects=$(sources:src/%.cpp=src/%.o)
headers=$(wildcard src/*.hpp)
executable=spdlog-problem

$(executable): $(objects) Makefile
	$(CC) $(CXXFLAGS) -o $@ \
		$(objects) -lstdc++fs -lpthread

$(objects) : src/%.o : src/%.cpp Makefile
	$(CC) -c $(CXXFLAGS) \
	-Isrc/spdlog/include \
	$< -o $@

clean :
	rm -rf $(objects) $(executable)

.PHONY : clean
