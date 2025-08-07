contract vinGlyphPulseFestival {
    address public moodOracle;
    bool public festivalActive;
    uint256 public lastTriggered;

    event FestivalActivated(uint256 timestamp);
    event FestivalDeactivated(uint256 timestamp);

    constructor(address _oracle) {
        moodOracle = _oracle;
        festivalActive = false;
    }

    function checkMoodAndTrigger() public {
        uint256 moodScore = vinCivicMoodOracle(moodOracle).getAverageMood();
        require(moodScore >= 96, "Mood not yet at Celestial Resonance");
        festivalActive = true;
        lastTriggered = block.timestamp;
        emit FestivalActivated(lastTriggered);
    }

    function endFestival() public {
        require(festivalActive, "Festival not active");
        festivalActive = false;
        emit FestivalDeactivated(block.timestamp);
    }

    function isFestivalLive() public view returns (bool) {
        return festivalActive;
    }
}
