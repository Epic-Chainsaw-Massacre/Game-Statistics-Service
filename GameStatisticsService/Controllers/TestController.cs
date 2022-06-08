using Microsoft.AspNetCore.Mvc;

namespace GameStatisticsService.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class TestController : ControllerBase
    {
        // prep
        string[] _help = {"hoi", "cool" };

        private readonly ILogger<WeatherForecastController> _logger;

        public TestController(ILogger<WeatherForecastController> logger)
        {
            _logger = logger;
        }

        [HttpGet(Name = "GetTest")]
        public string[] Get()
        {
            return _help;
        }
    }
}
