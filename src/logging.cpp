#include "logging.hpp"

static std::shared_ptr<spdlog::sinks::sink> get_sink(void)
{
    spdlog::init_thread_pool(8192, 1);
    auto sink = std::make_shared<spdlog::sinks::stdout_sink_mt>();
    sink->set_pattern("%v");
    return sink;
}

std::shared_ptr<spdlog::logger> logger = std::make_shared<spdlog::async_logger>("main",
        get_sink(), spdlog::thread_pool(), spdlog::async_overflow_policy::block);
