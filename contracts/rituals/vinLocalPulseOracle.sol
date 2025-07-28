contract vinLocalPulseOracle {
    mapping(address => string) public pulseData;
    event PulseUpdated(address indexed region, string signal);

    function updatePulse(string memory signal) public {
        pulseData[msg.sender] = signal;
        emit PulseUpdated(msg.sender, signal);
    }

    function viewPulse(address region) public view returns (string memory) {
        return pulseData[region];
    }
}
