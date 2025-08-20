contract APRHeatmapDashboard {
    address public steward = msg.sender;

    struct APRPulse {
        address ally;
        uint256 aprLevel;
        string region;
        string timestamp;
    }

    APRPulse[] public pulses;

    event PulseLogged(address ally, uint256 aprLevel, string region, string timestamp);

    function logPulse(address ally, uint256 aprLevel, string memory region, string memory timestamp) public {
        pulses.push(APRPulse(ally, aprLevel, region, timestamp));
        emit PulseLogged(ally, aprLevel, region, timestamp);
    }
}
