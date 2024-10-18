#include "stdafx.hpp"

#include "logging.hpp"

int main(int /*argc*/, char const ** /*args*/)
{
    std::cout << "There should be an error logging message, too.\n";
    logger->info("some busted logging %s.", "NOT");
    return 0;
}
