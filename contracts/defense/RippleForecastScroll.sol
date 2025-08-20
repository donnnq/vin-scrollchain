contract RippleForecastScroll {
    address public steward = msg.sender;

    struct Ripple {
        string origin;
        string signalType;
        string forecastWindow;
        string impactZone;
        bool alertTriggered;
    }

    Ripple[] public ripples;

    event RippleLogged(string origin, string type, string zone, bool alert);

    function logRipple(
        string memory origin,
        string memory signalType,
        string memory forecastWindow,
        string memory impactZone,
        bool alertTriggered
    ) public {
        ripples.push(Ripple(origin, signalType, forecastWindow, impactZone, alertTriggered));
        emit RippleLogged(origin, signalType, impactZone, alertTriggered);
    }
}
