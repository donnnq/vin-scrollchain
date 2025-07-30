contract vinPeoplePulseMirror {
    uint public pulseIndex;
    mapping(uint => string) public pulseReflections;

    event PulseUpdated(uint indexed index, string mood);

    function updatePulse(string memory mood) public {
        pulseIndex++;
        pulseReflections[pulseIndex] = mood;
        emit PulseUpdated(pulseIndex, mood);
    }

    function currentMood() public view returns (string memory) {
        return pulseReflections[pulseIndex];
    }
}
